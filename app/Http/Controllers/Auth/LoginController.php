<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\GeneralController;
use App\Models\ShopCountry;
use App\Models\ShopDistrict;
use App\Models\ShopUpazila;
use Auth;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use Session;
use Illuminate\Support\Facades\DB;

class LoginController extends GeneralController
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
     */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    // protected $redirectTo = '/';
    protected function redirectTo()
    {
        return '/';
    }
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
        // $this->middleware('sellerUser')->except('logout');
        $this->middleware('guest')->except(['logout', 'showSellerLoginForm', 'sellerLogin', 'logoutSeller']);
    }

    protected function validateLogin(Request $request)
    {
        $this->validate($request, [
            'email' => 'required|string|email',
            'password' => 'required|string',
        ]);
    }
    public function showLoginForm()
    {
        if (Auth::user()) {
            return redirect()->route('home');
        }
        return view('templates.' . sc_store('template') . '.shop_login',
            array(
                'title' => trans('front.login'),
                'countries' => ShopCountry::getArray(),
                'districts' => ShopDistrict::getArray(),
                'upazilas' => ShopUpazila::getArray(),
            )
        );
    }

    public function showSellerLoginForm()
    {
        if (auth()->guard('sellerUser')->user()) {
            return redirect()->route('seller.index');
        }
        return view('templates.' . sc_store('template') . '.seller_login',
            array(
                'title' => trans('front.seller_login'),
                'countries' => ShopCountry::getArray(),
                'districts' => ShopDistrict::getArray(),
                'upazilas' => ShopUpazila::getArray(),
            )
        );
    }
   
    public function sellerLogin(Request $request)
    {
        if (auth()->guard('sellerUser')->user()) {
            return redirect()->route('seller.index');
        } 

        $this->validate($request, [
            'email' => 'required|string|email',
            'password' => 'required|string',
        ]);

        $activeSellerUser = Auth::guard('sellerUser')->attempt(['email' => $request->email, 'password' => $request->password, 'status' => 1], $request->get('remember'));

        $sellerUser = DB::table('seller_user')
                     ->select('email', 'password')
                     ->where('email', $request->email)
                    //  ->where('password', bcrypt($request->password))
                     ->where('status', 0)
                     ->exists();
        if ($activeSellerUser) {
            if (Auth::user()) {
                Auth::guard('web')->logout();
            }
            return redirect()->route('seller.index');
        }elseif($sellerUser) {
            return back()->with('failedMessage', "You are not approved by admin yet, Please be patience.")->withInput($request->only('email', 'remember'));
        } else{
            return back()->with('failedMessage', "Email and Password doesn't match")->withInput($request->only('email', 'remember'));
        }
    }

    public function logout(Request $request)
    {
        $this->guard($request)->logout();

        $request->session()->invalidate();

        return $this->loggedOut($request) ?: redirect('/');
    }

    public function logoutSeller(Request $request)
    {
        dd($request->user('sellerUser'));

        $this->guard($request->user('sellerUser'))->logout();

        $request->session()->invalidate();

        return $this->loggedOut($request) ?: redirect()->route('login');
    }

}
