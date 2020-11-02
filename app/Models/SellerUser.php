<?php

namespace App\Models;

use App\Models\ShopEmailTemplate;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class SellerUser extends Authenticatable
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $table = 'seller_user';
    protected $guarded = [];
    private static $getList = null;
    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */

    protected $hidden = [
        'password', 'remember_token',
    ];
    protected $appends = [
        'full_name',
    ];

    public static function rules()
    {
       return [
            'reg_full_name' => 'required|string|max:100',
            'reg_email' => 'required|string|email|max:255|unique:' . (new SellerUser)->getTable() . ',email',
            'reg_password' => 'required|string|min:6|confirmed',
            'reg_phone' => 'required|regex:/^0[^0][0-9\-]{7,13}$/',
            'reg_address' => 'required|string|max:100',
            'reg_district' => 'required', 
       ];
    }

    /**
     * Send email reset password
     * @param  [type] $token [description]
     * @return [type]        [description]
     */
    public function sendPasswordResetNotification($token)
    {
        $checkContent = (new ShopEmailTemplate)->where('group', 'forgot_password')->where('status', 1)->first();
        if ($checkContent) {
            $content = $checkContent->text;
            $dataFind = [
                '/\{\{\$title\}\}/',
                '/\{\{\$reason_sednmail\}\}/',
                '/\{\{\$note_sendmail\}\}/',
                '/\{\{\$note_access_link\}\}/',
                '/\{\{\$reset_link\}\}/',
                '/\{\{\$reset_button\}\}/',
            ];
            $dataReplace = [
                trans('email.forgot_password.title'),
                trans('email.forgot_password.reason_sednmail'),
                trans('email.forgot_password.note_sendmail', ['site_admin' => config('mail.from.name')]),
                trans('email.forgot_password.note_access_link', ['reset_button' => trans('email.forgot_password.reset_button')]),
                route('password.reset', ['token' => $token]),
                trans('email.forgot_password.reset_button'),
            ];
            $content = preg_replace($dataFind, $dataReplace, $content);
            $data = [
                'content' => $content,
            ];

            $config = [
                'to' => $this->getEmailForPasswordReset(),
                'subject' => trans('email.forgot_password.reset_button'),
            ];

            sc_send_mail('mail.forgot_password', $data, $config, []);
        }

    }

/**
 * Update info Seller
 * @param  [array] $dataUpdate
 * @param  [int] $id
 */
    public static function updateInfo($dataUpdate, $id)
    {
        $dataUpdate = sc_clean($dataUpdate, 'password');
        $obj = self::find($id);
        return $obj->update($dataUpdate);
    }

/**
 * Create new Seller
 * @return [type] [description]
 */
    public static function createSeller($dataInsert)
    {
        // dd("DIE", $dataInsert);

        $dataUpdate = sc_clean($dataInsert, 'password');
        return self::create($dataUpdate);
    }
}
