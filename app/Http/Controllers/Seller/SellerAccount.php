<?php
#app/Http/Controller/SellerAccount.php
namespace App\Http\Controllers\Seller;

use App\Http\Controllers\GeneralController;
use App\Models\ShopCountry;
use App\Models\ShopDistrict;
use App\Models\ShopProduct;
use App\Models\SellerUser;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class SellerAccount extends GeneralController
{
    public $lang, $types, $virtuals;

    public function __construct()
    {
        $this->lang = app()->getLocale();
        parent::__construct();
    }

    public function index()
    {
        auth()->guard('sellerUser');
        $id = auth()->guard('sellerUser')->id();
        return view('templates.' . sc_store('template') . '.seller.index')->with(array(
            'title' => trans('account.my_profile'),
            'user' => auth()->guard('sellerUser'),
            'layout_page' => 'shop_profile',
        ));
    }

    public function changePassword()
    {
        auth()->guard('sellerUser');
        $id = auth()->guard('sellerUser')->id();
        $user = auth()->guard('sellerUser');
        return view('templates.' . sc_store('template') . '.seller.change_password')->with(array(
            'title' => trans('account.change_password'),
            'user' => $user,
            'layout_page' => 'shop_profile',
        ));
    }

    public function postChangePassword(Request $request)
    {
        auth()->guard('sellerUser');
        $id = auth()->guard('sellerUser')->id();
        $dataUser = SellerUser::find($id);
        $password = $request->get('password');
        $password_old = $request->get('password_old');
        if (trim($password_old) == '') {
            return redirect()->back()->with(['password_old_error' => trans('account.password_old_required')]);
        } else {
            if (!\Hash::check($password_old, $dataUser->password)) {
                return redirect()->back()->with(['password_old_error' => trans('account.password_old_notcorrect')]);
            }
        }
        $messages = [
            'required' => trans('validation.required'),
        ];
        $v = Validator::make($request->all(), [
            'password_old' => 'required',
            'password' => 'required|string|min:6|confirmed',
        ], $messages);
        if ($v->fails()) {
            return redirect()->back()->withErrors($v->errors());
        }

        SellerUser::updateInfo(['password' => bcrypt($password)], $id);

        return redirect()->route('member.index')->with(['message' => trans('account.update_success')]);
    }

    public function changeInfomation()
    {
        auth()->guard('sellerUser');
        $id = auth()->guard('sellerUser')->id();
        $dataUser = SellerUser::find($id);
        return view('templates.' . sc_store('template') . '.seller.change_infomation')->with(array(
            'title' => trans('account.change_infomation'),
            'dataUser' => $dataUser,
            'layout_page' => 'shop_profile',
            'districts' => ShopDistrict::getArray(),
        ));
    }

    public function postChangeInfomation(Request $request)
    {
        auth()->guard('sellerUser');
        $id = auth()->guard('sellerUser')->id();
        $messages = [
            'required' => trans('validation.required'),
        ];

        $v = Validator::make($request->all(), [
            'name' => 'required',
            'phone' => 'required|regex:/^0[^0][0-9\-]{7,13}$/',
            'address' => 'required',
            'district' => 'required',
        ], $messages);
        if ($v->fails()) {
            return redirect()->back()->withErrors($v->errors());
        }

        SellerUser::updateInfo($request->all(), $id);

        return redirect()->route('member.index')->with(['message' => trans('account.update_success')]);
    }

    /**
     * [profile description]
     * @return [type] [description]
     */
    
}
