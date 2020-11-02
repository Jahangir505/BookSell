<?php
#app/Http/Controller/ShopFront.php
namespace App\Http\Controllers;

use App\Models\ShopAttributeGroup;
use App\Models\ShopBrand;
use App\Models\ShopBanner;
use App\Models\ShopCategory;
use App\Models\ShopProductCategory;
use App\Models\ShopCategoryDescription;
use App\Models\ShopProduct;
use App\Models\ShopLanguage;
use App\Models\ShopProductDescription;
use App\Models\ShopProductReview;
use App\Models\ShopVendor;
use Illuminate\Http\Request;
use Validator;


class ShopFront extends GeneralController
{
    public $lang, $languages, $types, $virtuals, $attributeGroup;
    public function __construct()
    {
        parent::__construct();
        $this->lang = app()->getLocale();
        $this->languages = ShopLanguage::getList();
        $this->attributeGroup = ShopAttributeGroup::getList();
        $this->virtuals = [
            SC_VIRTUAL_PHYSICAL => trans('product.virtuals.physical'),
            SC_VIRTUAL_DOWNLOAD => trans('product.virtuals.download'),
            SC_VIRTUAL_ONLY_VIEW => trans('product.virtuals.only_view'),
            SC_VIRTUAL_SERVICE => trans('product.virtuals.service'),
        ];
        $this->types = [
            SC_PRODUCT_NEW => trans('product.types.new'),
            SC_PRODUCT_USED => trans('product.types.used'),
            SC_PRODUCT_PAPER_BACK => trans('product.types.paper_back'),
            SC_PRODUCT_HARD_COVER => trans('product.types.hard_cover'),
            SC_PRODUCT_PRE_ORDER => trans('product.types.pre_order'),
            SC_PRODUCT_ORIGINAL => trans('product.types.original'),
        ];
    }
/**
 * [index description]
 * @return [type] [description]
 */
    public function index(Request $request)
    {
        $itemsList = (new ShopVendor)->getVendors($limit = 4, $opt = 'random');
        $vendorList = (new ShopVendor)->getVendors($limit = sc_config('product_list'), $opt = 'random');
        $products = (new ShopVendor)->getProductsToVendor(1, $limit = sc_config('product_list'), $opt = 'random');
        $category = ShopCategory::join('shop_category_description','shop_category_description.category_id','shop_category.id')->where('top','1')->limit(4)->get();
        $bests = ShopProduct::bestSales()->limit(6)->get();
        $banner = ShopBanner::where('type','1')->limit(2)->get();
        $mustRead = ShopProduct::join('shop_product_category','shop_product_category.product_id','shop_product.id')->where('category_id','69')->get();

        return view('templates.' . sc_store('template') . '.shop_home',
            array(
                'products_new' => (new ShopProduct)->getProducts($type = null, $limit = sc_config('product_new'), $opt = null),
                // 'products_hot' => (new ShopProduct)->getProducts($type = SC_PRODUCT_HOT, $limit = sc_config('product_hot'), $opt = 'random'),
                'categories' => (new ShopCategory)->getCategoriesAll(),
                'products_build' => (new ShopProduct)->getTopBuild($limit = 4),
                'products_group' => (new ShopProduct)->getTopGroup($limit = 4),
                'layout_page' => 'home',
                
                'title' => trans('front.home'),
                'itemsList' => $itemsList,
                'types'     => $this->types,
                'products' => $products,
                'category'   => $category,
                'best_products' => $bests,
                'banner'        => $banner,
                'vendorList' => $vendorList,
                'mustRead'      => $mustRead,


            )
        );
    }

/**
 * [getCategories description]
 * @param  Request $request [description]
 * @return [type]           [description]
 */
    public function getCategories(Request $request)
    {
        $sortBy = null;
        $sortOrder = 'asc';
        $filter_sort = request('filter_sort') ?? '';
        $filterArr = [
            'sort_desc' => ['sort', 'desc'],
            'sort_asc' => ['sort', 'asc'],
            'id_desc' => ['id', 'desc'],
            'id_asc' => ['id', 'asc'],
        ];
        if (array_key_exists($filter_sort, $filterArr)) {
            $sortBy = $filterArr[$filter_sort][0];
            $sortOrder = $filterArr[$filter_sort][1];
        }

        $itemsList = (new ShopCategory)->getCategories($parent = 0, $limit = sc_config('item_list'), $opt = 'paginate', $sortBy, $sortOrder);
        return view('templates.' . sc_store('template') . '.shop_item_list',
            array(
                'title' => trans('front.categories'),
                'itemsList' => $itemsList,
                'keyword' => '',
                'description' => '',
                'layout_page' => 'item_list',
                'filter_sort' => $filter_sort,
            ));
    }

/**
 * [productToCategory description]
 * @param  [type] $key [description]
 * @return [type]      [description]
 */
    public function productToCategory($name, $id)
    {
        $sortBy = null;
        $sortOrder = 'asc';
        $filter_sort = request('filter_sort') ?? '';
        $filterArr = [
            'price_desc' => ['price', 'desc'],
            'price_asc' => ['price', 'asc'],
            'sort_desc' => ['sort', 'desc'],
            'sort_asc' => ['sort', 'asc'],
            'id_desc' => ['id', 'desc'],
            'id_asc' => ['id', 'asc'],
        ];
        if (array_key_exists($filter_sort, $filterArr)) {
            $sortBy = $filterArr[$filter_sort][0];
            $sortOrder = $filterArr[$filter_sort][1];
        }

        $category = (new ShopCategory)->find($id);
        if ($category) {
            $products = (new ShopProduct)->getProductsToCategory($category->id, $limit = sc_config('product_list'), $opt = 'paginate', $sortBy, $sortOrder);
            $itemsList = (new ShopCategory)->getCategories($parent = $id);
            return view('templates.' . sc_store('template') . '.shop_products_list',
                array(
                    'title' => $category->name,
                    'description' => $category->description,
                    'keyword' => '',
                    'products' => $products,
                    'types'     => $this->types,
                    'itemsList' => $itemsList,
                    'layout_page' => 'product_list',
                    'og_image' => url($category->getImage()),
                    'filter_sort' => $filter_sort,
                )
            );
        } else {
            return $this->itemNotFound();
        }

    }

/**
 * All products
 * @param  [type] $key [description]
 * @return [type]      [description]
 */
    public function allProducts()
    {
        $sortBy = null;
        $sortOrder = 'asc';
        $filter_sort = request('filter_sort') ?? '';
        $filterArr = [
            'price_desc' => ['price', 'desc'],
            'price_asc' => ['price', 'asc'],
            'sort_desc' => ['sort', 'desc'],
            'sort_asc' => ['sort', 'asc'],
            'id_desc' => ['id', 'desc'],
            'id_asc' => ['id', 'asc'],
        ];
        if (array_key_exists($filter_sort, $filterArr)) {
            $sortBy = $filterArr[$filter_sort][0];
            $sortOrder = $filterArr[$filter_sort][1];
        }

        $products = (new ShopProduct)->getProducts($type = null, $limit = sc_config('product_list'), $opt = 'paginate', $sortBy, $sortOrder);
        return view('templates.' . sc_store('template') . '.shop_products_list',
            array(
                'title' => trans('front.all_product'),
                'keyword' => '',
                'description' => '',
                'products' => $products,
                'types'     => $this->types,
                'layout_page' => 'product_list',
                'filter_sort' => $filter_sort,
            )
        );
    }

/**
 * [productDetail description]
 * @param  [type] $name [description]
 * @param  [type] $id   [description]
 * @return [type]       [description]
 */
    public function productDetail($name, $id)
    {
        $product = (new ShopProduct)->getProduct($id);
        $review = (new ShopProductReview)->getReviewAll();
        // dd($review);
        if ($product && $product->status && (sc_config('product_display_out_of_stock') || $product->stock > 0)) {
            //Update last view
            $product->view += 1;
            $product->date_lastview = date('Y-m-d H:i:s');
            $product->save();
            //End last viewed

            //Product last view
            if (!empty(sc_config('LastViewProduct'))) {
                $arrlastView = empty(\Cookie::get('productsLastView')) ? array() : json_decode(\Cookie::get('productsLastView'), true);
                $arrlastView[$id] = date('Y-m-d H:i:s');
                arsort($arrlastView);
                \Cookie::queue('productsLastView', json_encode($arrlastView), (86400 * 30));
            }
            //End product last view

            $vendor = ShopVendor::find($product->vendor_id);
            $categoryId = (new ShopProductCategory)->where('product_id', $product->id)->first();
            $category = (new ShopCategoryDescription)->where('category_id', $categoryId->category_id)->first();
            $categories = $product->categories->keyBy('id')->toArray();
            $arrCategoriId = array_keys($categories);
            $productsToCategory = (new ShopProduct)->getProductsToCategory($arrCategoriId, $limit = sc_config('product_relation'), $opt = 'random');
            //Check product available
            return view('templates.' . sc_store('template') . '.shop_product_detail',
                array(
                    'title' => $product->name,
                    'description' => $product->description,
                    'types' => $this->types,
                    'product' => $product,
                    'review' => $review,
                    'category' => $category,
                    'shop' => $vendor,
                    'attributesGroup' => ShopAttributeGroup::all()->keyBy('id'),
                    'productsToCategory' => $productsToCategory,
                    'og_image' => url($product->getImage()),
                    'layout_page' => 'product_detail',
                )
            );
        } else {
            return $this->itemNotFound();
        }

    }
/**
 * Get product info
 * @param  [int] $id [description]
 * @return [json]     [description]
 */
    public function productInfo()
    {
        $id = request('id') ?? 0;
        $product = (new ShopProduct)->getProduct($id);
        $product['showPrice'] = $product->showPrice();
        $product['brand_name'] = $product->brand->name;
        $showImages = '
        <div class="carousel-inner">
        <div class="view-product item active"  data-slide-number="0">
            <img src="' . asset($product->getImage()) . '" alt="">
        </div>';

        if ($product->images->count()) {
            foreach ($product->images as $key => $image) {
                $showImages .= '<div class="view-product item"  data-slide-number="' . ($key + 1) . '">
              <img src="' . asset($image->getImage()) . '" alt="">
            </div>';
            }
        }
        $showImages .= '</div>';
        if ($product->images->count()) {
            $showImages .= '<a class="left item-control" href="#similar-product" data-slide="prev">
              <i class="fa fa-angle-left"></i>
              </a>
              <a class="right item-control" href="#similar-product" data-slide="next">
              <i class="fa fa-angle-right"></i>
              </a>';
        }

        $availability = '';
        if (sc_config('show_date_available') && $product->date_available >= date('Y-m-d H:i:s')) {
            $availability .= $product->date_available;
        } elseif ($product->stock <= 0 && sc_config('product_buy_out_of_stock') == 0) {
            $availability .= trans('product.out_stock');
        } else {
            $availability .= trans('product.in_stock');
        }
        $product['availability'] = $availability;
        $product['showImages'] = $showImages;
        $product['url'] = $product->getUrl();
        return response()->json($product);

    }

/**
 * [brands description]
 * @param  Request $request [description]
 * @return [type]           [description]
 */
    public function getBrands(Request $request)
    {
        $sortBy = null;
        $sortOrder = 'asc';
        $filter_sort = request('filter_sort') ?? '';
        $filterArr = [
            'name_desc' => ['name', 'desc'],
            'name_asc' => ['name', 'asc'],
            'sort_desc' => ['sort', 'desc'],
            'sort_asc' => ['sort', 'asc'],
            'id_desc' => ['id', 'desc'],
            'id_asc' => ['id', 'asc'],
        ];
        if (array_key_exists($filter_sort, $filterArr)) {
            $sortBy = $filterArr[$filter_sort][0];
            $sortOrder = $filterArr[$filter_sort][1];
        }

        $itemsList = (new ShopBrand)->getBrands($limit = sc_config('item_list'), $opt = 'paginate', $sortBy, $sortOrder);
        return view('templates.' . sc_store('template') . '.shop_item_list',
            array(
                'title' => trans('front.brands'),
                'itemsList' => $itemsList,
                'keyword' => '',
                'description' => '',
                'layout_page' => 'item_list',
                'filter_sort' => $filter_sort,
            ));
    }

/**
 * [productToBrand description]
 * @param  [type] $name [description]
 * @param  [type] $id   [description]
 * @return [type]       [description]
 */
    public function productToBrand($name, $id)
    {
        $sortBy = null;
        $sortOrder = 'asc';
        $filter_sort = request('filter_sort') ?? '';
        $filterArr = [
            'price_desc' => ['price', 'desc'],
            'price_asc' => ['price', 'asc'],
            'sort_desc' => ['sort', 'desc'],
            'sort_asc' => ['sort', 'asc'],
            'id_desc' => ['id', 'desc'],
            'id_asc' => ['id', 'asc'],
        ];
        if (array_key_exists($filter_sort, $filterArr)) {
            $sortBy = $filterArr[$filter_sort][0];
            $sortOrder = $filterArr[$filter_sort][1];
        }

        $brand = ShopBrand::find($id);
        return view('templates.' . sc_store('template') . '.shop_products_list',
            array(
                'title' => $brand->name,
                'description' => '',
                'keyword' => '',
                'layout_page' => 'product_list',
                'types'     => $this->types,
                'products' => $brand->getProductsToBrand($id, $limit = sc_config('product_list'), $opt = 'paginate', $sortBy, $sortOrder),
                'filter_sort' => $filter_sort,
            )
        );
    }

/**
 * [vendors description]
 * @param  Request $request [description]
 * @return [type]           [description]
 */
    public function getVendors(Request $request)
    {
        $sortBy = null;
        $sortOrder = 'asc';
        $filter_sort = request('filter_sort') ?? '';
        $filterArr = [
            'name_desc' => ['name', 'desc'],
            'name_asc' => ['name', 'asc'],
            'sort_desc' => ['sort', 'desc'],
            'sort_asc' => ['sort', 'asc'],
            'id_desc' => ['id', 'desc'],
            'id_asc' => ['id', 'asc'],
        ];
        if (array_key_exists($filter_sort, $filterArr)) {
            $sortBy = $filterArr[$filter_sort][0];
            $sortOrder = $filterArr[$filter_sort][1];
        }

        $itemsList = (new ShopVendor)->getVendors($limit = sc_config('item_list'), $opt = 'paginate', $sortBy, $sortOrder);

        return view('templates.' . sc_store('template') . '.shop_item_list',
            array(
                'title' => trans('front.vendors'),
                'itemsList' => $itemsList,
                'keyword' => '',
                'description' => '',
                'layout_page' => 'item_list',
                'filter_sort' => $filter_sort,
            ));
    }

/**
 * [productToVendor description]
 * @param  [type] $name [description]
 * @param  [type] $id   [description]
 * @return [type]       [description]
 */
    public function productToVendor($name, $id)
    {
        $sortBy = null;
        $sortOrder = 'asc';
        $filter_sort = request('filter_sort') ?? '';
        $filterArr = [
            'price_desc' => ['price', 'desc'],
            'price_asc' => ['price', 'asc'],
            'sort_desc' => ['sort', 'desc'],
            'sort_asc' => ['sort', 'asc'],
            'id_desc' => ['id', 'desc'],
            'id_asc' => ['id', 'asc'],
        ];
        if (array_key_exists($filter_sort, $filterArr)) {
            $sortBy = $filterArr[$filter_sort][0];
            $sortOrder = $filterArr[$filter_sort][1];
        }

        $vendor = ShopVendor::find($id);
        return view('templates.' . sc_store('template') . '.shop_products_list',
            array(
                'title' => $vendor->name,
                'description' => '',
                'keyword' => '',
                'layout_page' => 'product_list',
                'types'     => $this->types,
                'products' => $vendor->getProductsToVendor($id, $limit = sc_config('product_list'), $opt = 'paginate', $sortBy, $sortOrder),
                'filter_sort' => $filter_sort,
            )
        );
    }

/**
 * [search description]
 * @param  Request $request [description]
 * @return [type]           [description]
 */
   public function search(Request $request)
{
    $sortBy = null;
    $sortOrder = 'asc';
    $filter_sort = request('filter_sort') ?? '';
    $filterArr = [
        'price_desc' => ['price', 'desc'],
        'price_asc' => ['price', 'asc'],
        'sort_desc' => ['sort', 'desc'],
        'sort_asc' => ['sort', 'asc'],
        'id_desc' => ['id', 'desc'],
        'id_asc' => ['id', 'asc'],
    ];
    if (array_key_exists($filter_sort, $filterArr)) {
        $sortBy = $filterArr[$filter_sort][0];
        $sortOrder = $filterArr[$filter_sort][1];
    }
    $keyword = request('keyword') ?? '';
    
   //$products = DB::table('shop_product')->join('hop_product_description', 'hop_product_description.product_id', '=' , 'shop_product.id')->select('shop_product.name');
    if( $request->ajax() ){
        $products = (new ShopProduct)->ajaxSearch($keyword);
        return response()->json($products);
    }

    $products = (new ShopProduct)->getSearch($keyword, $limit = sc_config('product_list'), $sortBy, $sortOrder);

    return view('templates.' . sc_store('template') . '.shop_products_list',
        array(
            'title' => trans('front.search') . ': ' . $keyword,
            'products' => $products,
            'layout_page' => 'product_list',
            'types'     => $this->types,
            'filter_sort' => $filter_sort,
        ));
}

    public function bookRequest(Request $request) {
        auth()->guard('sellerUser');
        $seller_id = auth()->guard('sellerUser')->id();


        $listProductSingle = (new ShopProduct)->getListSigle();

        // html select product group
        $htmlSelectGroup = '<div class="select-product">';
        $htmlSelectGroup .= '<table width="100%"><tr><td width="80%"><select class="form-control productInGroup select2" data-placeholder="' . trans('product.admin.select_product_in_group') . '" style="width: 100%;" name="productInGroup[]" >';
        $htmlSelectGroup .= '';
        foreach ($listProductSingle as $k => $v) {
            $htmlSelectGroup .= '<option value="' . $k . '">' . $v['name'] . '</option>';
        }
        $htmlSelectGroup .= '</select></td><td><span title="Remove" class="btn btn-flat btn-danger removeproductInGroup"><i class="fa fa-times"></i></span></td></tr></table>';
        $htmlSelectGroup .= '</div>';
        //End select product group

        // html select product build
        $htmlSelectBuild = '<div class="select-product">';
        $htmlSelectBuild .= '<table width="100%"><tr><td width="70%"><select class="form-control productInGroup select2" data-placeholder="' . trans('product.admin.select_product_in_build') . '" style="width: 100%;" name="productBuild[]" >';
        $htmlSelectBuild .= '';
        foreach ($listProductSingle as $k => $v) {
            $htmlSelectBuild .= '<option value="' . $k . '">' . $v['name'] . '</option>';
        }
        $htmlSelectBuild .= '</select></td><td style="width:100px"><input class="form-control"  type="number" name="productBuildQty[]" value="1" min=1></td><td><span title="Remove" class="btn btn-flat btn-danger removeproductBuild"><i class="fa fa-times"></i></span></td></tr></table>';
        $htmlSelectBuild .= '</div>';
        //end select product build

        // html select attribute
        $htmlProductAtrribute = '<tr><td><input type="text" name="attribute[attribute_group][]" value="attribute_value" class="form-control input-sm" placeholder="' . trans('product.admin.add_attribute_place') . '" /></td><td><span title="Remove" class="btn btn-flat btn-sm btn-danger removeAttribute"><i class="fa fa-times"></i></span></td></tr>';
        //end select attribute

        // html add more images
        $htmlMoreImage = '<div class="input-group"><input type="text" id="id_sub_image" name="sub_image[]" value="image_value" class="form-control input-sm sub_image" placeholder=""  /><span class="input-group-btn"><a data-input="id_sub_image" data-preview="preview_sub_image" data-type="product" class="btn btn-sm btn-primary lfm"><i class="fa fa-picture-o"></i> Choose</a></span></div><div id="preview_sub_image" class="img_holder"></div>';
        //end add more images

        $data = [
            'title' => trans('product.admin.add_new_title'),
            'sub_title' => '',
            'title_description' => trans('product.admin.add_new_des'),
            'icon' => 'fa fa-plus',
            'languages' => $this->languages,
            'categories' => (new ShopCategory)->getTreeCategories(),
            'brands' => (new ShopBrand)->getList(),
            'vendors' => (new ShopVendor)
                        ->where('user_id', '=', $seller_id)
                        ->where('status', '=', 1)
                        ->get()
                        ->keyBy('id'),
            'types' => $this->types,
            'virtuals' => $this->virtuals,
            'attributeGroup' => $this->attributeGroup,
            'htmlSelectGroup' => $htmlSelectGroup,
            'htmlSelectBuild' => $htmlSelectBuild,
            'listProductSingle' => $listProductSingle,
            'htmlProductAtrribute' => $htmlProductAtrribute,
            'htmlMoreImage' => $htmlMoreImage,
        ];
        return view('templates.' . sc_store('template') . '.book_request',
        with($data));
    }

    public function postBookRequest() {
        $data = request()->all();
        $dataOrigin = request()->all();
            $arrValidation = [
                // 'image' => 'required',
                'descriptions.*.name' => 'required|string|max:100',
                'descriptions.*.content' => 'required|string',
                'category' => 'required',
                'writer' => 'required',
            ];
            $arrMsg = [
                'descriptions.*.name.required' => trans('validation.required', ['attribute' => trans('product.name')]),
                'descriptions.*.content.required' => trans('validation.required', ['attribute' => trans('product.content')]),
                'category.required' => trans('validation.required', ['attribute' => trans('product.category')]),
                'sku.regex' => trans('product.sku_validate'),
            ];

        $validator = Validator::make($dataOrigin, $arrValidation, $arrMsg ?? []);

        if ($validator->fails()) {
            return redirect()->back()
                ->withErrors($validator)
                ->withInput();
        }
        $category = $data['category'] ?? [];
        $attribute = $data['attribute'] ?? [];
        $descriptions = $data['descriptions'];
        $productInGroup = $data['productInGroup'] ?? [];
        $productBuild = $data['productBuild'] ?? [];
        $productBuildQty = $data['productBuildQty'] ?? [];
        $subImages = $data['sub_image'] ?? '';
        $dataInsert = [
            'user_id' => 0,
            // 'brand_id' => $data['brand_id'],
            'vendor_id' => 0,
            'price' => $data['price'] ?? 0,
            'cost' => $data['cost'] ?? 0,
            'stock' => $data['stock'] ?? 0,
            'type' => $data['type'] ?? SC_PRODUCT_NORMAL,
            'writer' => $data['writer'],
            'virtual' => $data['virtual'] ?? SC_VIRTUAL_PHYSICAL,
            'date_available' => !empty($data['date_available']) ? $data['date_available'] : null,
            'sku' => mt_rand(10000000,99999999),
            'image' => 'images/no-image.jpg',
            'status' => 0,
            'sort' => 0,
            'is_requested' => 1,
        ];

        //insert product
        $id = ShopProduct::insertGetId($dataInsert);
        $product = ShopProduct::find($id);

        //Promoton price
        if (isset($data['price_promotion'])) {
            $arrPromotion['price_promotion'] = $data['price_promotion'];
            $arrPromotion['date_start'] = $data['price_promotion_start'] ? $data['price_promotion_start'] : null;
            $arrPromotion['date_end'] = $data['price_promotion_end'] ? $data['price_promotion_end'] : null;
            $product->promotionPrice()->create($arrPromotion);
        }

        //Insert category
        if ($category) {
            $product->categories()->attach($category);
        }
        //Insert group
        if ($productInGroup) {
            $arrDataGroup = [];
            foreach ($productInGroup as $pID) {
                if ((int) $pID) {
                    $arrDataGroup[$pID] = new ShopProductGroup(['product_id' => $pID]);
                }
            }
            $product->groups()->saveMany($arrDataGroup);
        }

        //Insert Build
        if ($productBuild) {
            $arrDataBuild = [];
            foreach ($productBuild as $key => $pID) {
                if ((int) $pID) {
                    $arrDataBuild[$pID] = new ShopProductBuild(['product_id' => $pID, 'quantity' => $productBuildQty[$key]]);
                }
            }
            $product->builds()->saveMany($arrDataBuild);
        }

        //Insert attribute
        if ($attribute) {
            $arrDataAtt = [];
            foreach ($attribute as $group => $rowGroup) {
                if (count($rowGroup)) {
                    foreach ($rowGroup as $key => $nameAtt) {
                        if ($nameAtt) {
                            $arrDataAtt[] = new ShopProductAttribute(['name' => $nameAtt, 'attribute_group_id' => $group]);
                        }
                    }
                }

            }
            $product->attributes()->saveMany($arrDataAtt);
        }

        //Insert description
        $dataDes = [];
        $languages = $this->languages;
        foreach ($languages as $code => $value) {
            $dataDes[] = [
                'product_id' => $product->id,
                'lang' => $code,
                'name' => $descriptions[$code]['name'],
                'keyword' => $descriptions[$code]['keyword'] ?? '',
                'description' => $descriptions[$code]['description'] ?? '',
                'content' => $descriptions[$code]['content'] ?? '',
            ];
        }

        ShopProductDescription::insert($dataDes);

        //Insert sub mages
        if ($subImages) {
            $arrSubImages = [];
            foreach ($subImages as $key => $image) {
                if ($image) {
                    $arrSubImages[] = new ShopProductImage(['image' => $image]);
                }
            }
            $product->images()->saveMany($arrSubImages);
        }

        return redirect()->route('home')->with('success', 'Your product request successfully send to admin.');
    }

}
