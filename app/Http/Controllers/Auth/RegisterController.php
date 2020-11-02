<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\GeneralController;
use App\Models\ShopEmailTemplate;
use App\Models\ShopUser;
use App\Models\SellerUser;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Auth\Events\Registered;
use Auth;

class RegisterController extends GeneralController
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
     */

    use RegistersUsers;

    /**
     * Where to redirect users after registration.
     *
     * @var string
     */
    // protected $redirectTo = '/home';
    protected $redirectTo = '/';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
        $this->middleware('guest')->except(['createSeller']);;
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'reg_first_name' => 'required|string|max:100',
            'reg_last_name' => 'required|string|max:100',
            'reg_email' => 'required|string|email|max:255|unique:' . (new ShopUser)->getTable() . ',email',
            'reg_password' => 'required|string|min:6|confirmed',
            'reg_phone' => 'required|regex:/^0[^0][0-9\-]{7,13}$/',
            'reg_address' => 'required|string|max:100',
            'reg_district' => 'required',
            'reg_upazila' => 'required',
            'reg_post' => 'required|string|max:100',
        ]
        );
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return \App\User
     */
    protected function create(array $data)
    {
        // dd($data['reg_birthdate']);
        $user = ShopUser::createCustomer([
            'first_name' => $data['reg_first_name'],
            'last_name' => $data['reg_last_name'],
            'email' => $data['reg_email'],
            'password' => bcrypt($data['reg_password']),
            'phone' => $data['reg_phone'],
            'address' => $data['reg_address'],
            'district' => $data['reg_district'],
            'upazila' => $data['reg_upazila'],
            'post' => $data['reg_post'],
            'country' => $data['reg_country'],
            'occupation' => $data['reg_occupation'] ?? null,
            'educational_institute' => $data['reg_educational_institute'] ?? null,
            'birthdate' => $data['reg_birthdate'] ?? null
        ]);
        if ($user) {
            if (sc_config('welcome_customer')) {

                $checkContent = (new ShopEmailTemplate)->where('group', 'welcome_customer')->where('status', 1)->first();
                if ($checkContent) {
                    $content = $checkContent->text;
                    $dataFind = [
                        '/\{\{\$title\}\}/',
                        '/\{\{\$first_name\}\}/',
                        '/\{\{\$last_name\}\}/',
                        '/\{\{\$email\}\}/',
                        '/\{\{\$phone\}\}/',
                        '/\{\{\$password\}\}/',
                        '/\{\{\$address\}\}/',
                        '/\{\{\$district\}\}/',
                        '/\{\{\$upazila\}\}/',
                        '/\{\{\$post\}\}/',
                        '/\{\{\$country\}\}/',
                        '/\{\{\$occupation\}\}/',
                        '/\{\{\$educational_institute\}\}/',
                        '/\{\{\$birthdate\}\}/',
                    ];
                    $dataReplace = [
                        trans('email.welcome_customer.title'),
                        $data['reg_first_name'],
                        $data['reg_last_name'],
                        $data['reg_email'],
                        $data['reg_phone'],
                        $data['reg_password'],
                        $data['reg_address'],
                        $data['reg_district'],
                        $data['reg_upazila'],
                        $data['reg_post'],
                        $data['reg_country'],                        
                        $data['reg_occupation'],                        
                        $data['reg_educational_institute'],                        
                        $data['reg_birthdate'],                        
                    ];
                    $content = preg_replace($dataFind, $dataReplace, $content);
                    $data_mail = [
                        'content' => $content,
                    ];

                    $config = [
                        'to' => $data['reg_email'],
                        'subject' => trans('email.welcome_customer.title'),
                    ];

                    sc_send_mail('mail.welcome_customer', $data_mail, $config, []);
                }

            }
        } else {

        }
        return $user;
    }

    protected function createSeller(Request $request)
    {
        $validator = Validator::make($request->all(), sellerUser::rules())->validate();; 
        $sellerUser = SellerUser::createSeller([
            'name' => $request['reg_full_name'],
            'email' => $request['reg_email'],
            'password' => bcrypt($request['reg_password']),
            'phone' => $request['reg_phone'],
            'address' => $request['reg_address'],
            'district' => $request['reg_district'],
        ]);
        session()->forget('user'); //destroy customer login
        return back()->with('successMessage','You have successfully registered, We will contact you soon. You are requested to wait for admin approval!');
    }

    public function showRegistrationForm()
    {
        return redirect()->route('register');
        // return view('auth.register');
    }
}
