<?php
#app/Http/Controller/GeneralController.php
namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\ShopSubscribe;
use App\Models\ShopCategory;
use App\Models\ShopProduct;
use Illuminate\Http\Request;
use Mail;
use View;

class GeneralController extends Controller
{

    public function __construct()
    {
        
        $user = auth()->guard('sellerUser');
        $languages = sc_language_all();
        $currencies = sc_currency_all();
        $blocksContent = sc_block_content();
        $layoutsUrl = sc_link();
        $parent_category = ShopCategory::where('status', 1)->where('parent', 0)->get();
        $products = ShopProduct::getArrayProductName();
        view()->share('user', $user);
        view()->share('languages', $languages);
        view()->share('currencies', $currencies);
        view()->share('blocksContent', $blocksContent);
        view()->share('layoutsUrl', $layoutsUrl);
        view()->share('parent_category', $parent_category);
        view()->share('products', $products);

        if (sc_config('SITE_STATUS') != 'on') {
            $maintain_content = sc_store('maintain_content') ?? '';
            echo <<<HTML
 <section>
    <div class="container">
      <div class="row">
        <div id="columns" class="container">
          $maintain_content
        </div>
      </div>
    </div>
  </section>
HTML;
            exit;
        }
    }

/**
 * [emailShop description]
 * @param  Request $request [description]
 * @return [type]           [description]
 */
    public function emailShop(Request $request)
    {
        $data = $request->all();
        $validator = $request->validate([
            'subscribe_email' => 'required|email',
        ], [
            'subscribe_email.required' => trans('validation.required'),
            'subscribe_email.email' => trans('validation.email'),
        ]);

        $checkEmail = ShopSubscribe::where('email', $data['subscribe_email'])->first();
        if (!$checkEmail) {
            ShopSubscribe::insert(['email' => $data['subscribe_email']]);
        }
        return redirect()->back()->with(['message' => trans('front.subscribe.subscribe_success')]);
    }

    public function pageNotFound()
    {
        return view('templates.' . sc_store('template') . '.notfound',
            array(
                'title' => '404 - Page not found',
                'msg' => trans('front.page_not_found'),
                'description' => '',
                'keyword' => '',

            )
        );
    }
    public function itemNotFound()
    {
        return view('templates.' . sc_store('template') . '.notfound',
            array(
                'title' => '404 - Item not found',
                'msg' => trans('front.item_not_found'),
                'description' => '',
                'keyword' => '',

            )
        );
    }

}
