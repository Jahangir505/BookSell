<?php
#app/Http/Controllers/ShopProductController.php
namespace App\Http\Controllers\Seller;

use App\Http\Controllers\GeneralController;
use App\Http\Controllers\Controller;
use App\Models\ShopAttributeGroup;
use App\Models\ShopBrand;
use App\Models\ShopCategory;
use App\Models\ShopLanguage;
use App\Models\ShopProduct;
use App\Models\ShopProductAttribute;
use App\Models\ShopProductBuild;
use App\Models\ShopProductDescription;
use App\Models\ShopProductGroup;
use App\Models\ShopProductImage;
use App\Models\ShopVendor;
use Illuminate\Http\Request;
use Validator;
use Auth;

class ShopProductController extends GeneralController
{
    public $lang, $languages, $types, $virtuals, $attributeGroup;

    public function __construct()
    {
        parent::__construct();
        $this->lang = app()->getLocale();
        $this->languages = ShopLanguage::getList();
        $this->attributeGroup = ShopAttributeGroup::getList();
        $this->types = [
            SC_PRODUCT_NEW => trans('product.types.new'),
            SC_PRODUCT_USED => trans('product.types.used'),
            SC_PRODUCT_PAPER_BACK => trans('product.types.paper_back'),
            SC_PRODUCT_HARD_COVER => trans('product.types.hard_cover'),
            SC_PRODUCT_PRE_ORDER => trans('product.types.pre_order'),
            SC_PRODUCT_ORIGINAL => trans('product.types.original'),
        ];
        $this->virtuals = [
            SC_VIRTUAL_PHYSICAL => trans('product.virtuals.physical'),
            SC_VIRTUAL_DOWNLOAD => trans('product.virtuals.download'),
            SC_VIRTUAL_ONLY_VIEW => trans('product.virtuals.only_view'),
            SC_VIRTUAL_SERVICE => trans('product.virtuals.service'),
        ];
    }

public function index()
    {
        auth()->guard('sellerUser');
        $seller_id = auth()->guard('sellerUser')->id();

        $data = [
            'title' => trans('product.admin.list'),
            'menu_left' => '',
            'menu_right' => '',
            'menu_sort' => '',
            'script_sort' => '',
            'menu_search' => '',
            'script_search' => '',
            'listTh' => '',
            'dataTr' => '',
            'pagination' => '',
            'result_items' => '',
            'url_delete_item' => '',
        ];

        $listTh = [
            'check_row' => '',
            'id' => trans('product.id'),
            'image' => trans('product.image'),
            'sku' => trans('product.sku'),
            'name' => trans('product.name'),
            'category' => trans('product.category'),
            'price' => trans('product.price'),
            'type' => trans('product.type'),
            'status' => trans('product.status'),
            'action' => trans('product.admin.action'),
        ];
        $keyword = request('keyword') ?? '';
        $sort_order = request('sort_order') ?? 'id_desc';
        $arrSort = [
            'id__desc' => trans('product.admin.sort_order.id_desc'),
            'id__asc' => trans('product.admin.sort_order.id_asc'),
            'name__desc' => trans('product.admin.sort_order.name_desc'),
            'name__asc' => trans('product.admin.sort_order.name_asc'),
        ];
        $obj = new ShopProduct;

        $obj = $obj
            ->leftJoin('shop_product_description', 'shop_product_description.product_id', 'shop_product.id')
            ->where('shop_product_description.lang', $this->lang)
            ->where('shop_product.user_id', $seller_id);

        if ($keyword) {
            $obj = $obj->whereRaw('(id = ' . (int) $keyword . ' OR shop_product_description.name like "%' . $keyword . '%" )');
        }
        if ($sort_order && array_key_exists($sort_order, $arrSort)) {
            $field = explode('__', $sort_order)[0];
            $sort_field = explode('__', $sort_order)[1];
            $obj = $obj->orderBy($field, $sort_field);

        } else {
            $obj = $obj->orderBy('id', 'desc');
        }
        $dataTmp = $obj->paginate(20);

        $dataTr = [];
        foreach ($dataTmp as $key => $row) {
            $type = $this->types[$row['type']] ?? $row['type'];
            if ($row['type'] == SC_PRODUCT_NEW) {
                $type = '<span class="label label-success">' . $type . '</span>';
            }
            $dataTr[] = [
                'check_row' => '<input type="checkbox" class="grid-row-checkbox" data-id="' . $row['id'] . '">',
                'id' => $row['id'],
                'image' => sc_image_render($row->getThumb(), '50px', '50px'),
                'sku' => $row['sku'],
                'name' => $row['name'],
                'category' => implode('; ', $row->categories->pluck('name')->toArray()),
                'price' => $row['price'],
                'type' => $type,
                'status' => $row['status'] ? '<span class="label label-success">ON</span>' : '<span class="label label-danger">OFF</span>',
                'action' => '
                    <a href="' . route('product.edit', ['id' => $row['id']]) . '"><span title="' . trans('product.admin.edit') . '" type="button" class="btn btn-flat btn-primary"><i class="fa fa-edit"></i></span></a>&nbsp;

                    <span onclick="deleteItem(' . $row['id'] . ');"  title="' . trans('admin.delete') . '" class="btn btn-flat btn-danger"><i class="fa fa-trash"></i></span>'
                ,
            ];
        }

        $data['listTh'] = $listTh;
        $data['dataTr'] = $dataTr;
        $data['pagination'] = $dataTmp->appends(request()->except(['_token', '_pjax']))->links('admin.component.pagination');
        $data['result_items'] = trans('product.admin.result_item', ['item_from' => $dataTmp->firstItem(), 'item_to' => $dataTmp->lastItem(), 'item_total' => $dataTmp->total()]);
//menu_left
        $data['menu_left'] = '<div class="pull-left">
                    <button type="button" class="btn btn-default grid-select-all"><i class="fa fa-square-o"></i></button> &nbsp;

                    <a class="btn   btn-flat btn-danger grid-trash" title="Delete"><i class="fa fa-trash-o"></i><span class="hidden-xs"> ' . trans('admin.delete') . '</span></a> &nbsp;

                    <a class="btn   btn-flat btn-primary grid-refresh" title="Refresh"><i class="fa fa-refresh"></i><span class="hidden-xs"> ' . trans('admin.refresh') . '</span></a> &nbsp;</div>
                    ';
//=menu_left

//menu_right
        $data['menu_right'] = '
                        <div class="btn-group pull-right" style="margin-right: 10px">
                           <a href="' . route('product.create') . '" class="btn  btn-success  btn-flat" title="New" id="button_create_new">
                           <i class="fa fa-plus"></i><span class="hidden-xs">' . trans('admin.add_new') . '</span>
                           </a>
                        </div>

                        ';
//=menu_right

//menu_sort

        $optionSort = '';
        foreach ($arrSort as $key => $status) {
            $optionSort .= '<option  ' . (($sort_order == $key) ? "selected" : "") . ' value="' . $key . '">' . $status . '</option>';
        }

        $data['menu_sort'] = '
                       <div class="btn-group pull-left">
                        <div class="form-group">
                           <select class="form-control" id="order_sort">
                            ' . $optionSort . '
                           </select>
                         </div>
                       </div>

                       <div class="btn-group pull-left">
                           <a class="btn btn-flat btn-primary" title="Sort" id="button_sort">
                              <i class="fa fa-sort-amount-asc"></i><span class="hidden-xs"> ' . trans('admin.sort') . '</span>
                           </a>
                       </div>';

        $data['script_sort'] = "$('#button_sort').click(function(event) {
      var url = '" . route('product.index') . "?sort_order='+$('#order_sort option:selected').val();
      $.pjax({url: url, container: '#pjax-container'})
    });";

//=menu_sort

//menu_search

        $data['menu_search'] = '
                <form action="' . route('product.index') . '" id="button_search">
                    <div class="btn-group">
                        <div class="form-group">
                            <input type="text" name="keyword" class="form-control" placeholder="' . trans('product.seller.search_place') . '" value="' . $keyword . '">
                        </div>
                    </div>
                   <div onclick="$(this).submit();" class="btn-group pull-right">
                           <a class="btn btn-flat btn-primary" title="Refresh">
                              <i class="fa  fa-search"></i><span class="hidden-xs"> ' . trans('admin.search') . '</span>
                           </a>
                   </div>
                </form>';
//=menu_search

        $data['url_delete_item'] = route('product.delete');

        return view('templates.' . sc_store('template') . '.seller.product.index')
            ->with($data);
    }

/**
 * Form create new order in admin
 * @return [type] [description]
 */
    public function create()
    {
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
        return view('templates.' . sc_store('template') . '.seller.product.create')
            ->with($data);
    }

/**
 * Post create new order in admin
 * @return [type] [description]
 */

    public function postCreate()
    {
        auth()->guard('sellerUser');
        $seller_id = auth()->guard('sellerUser')->id();

        $data = request()->all();
        $dataOrigin = request()->all();
            $arrValidation = [
                'image' => 'required',
                'sort' => 'numeric|min:0',
                'descriptions.*.name' => 'required|string|max:100',
                'descriptions.*.content' => 'required|string',
                'category' => 'required',
                'sku' => 'required|regex:/(^([0-9A-Za-z\-\._]+)$)/|unique:shop_product,sku',
                'vendor_id' => 'required',
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
        $subImages = $data['sub_image'] ?? [];
        $dataInsert = [
            'user_id' => $seller_id,
            // 'brand_id' => $data['brand_id'],
            'vendor_id' => $data['vendor_id'],
            'price' => $data['price'] ?? 0,
            'cost' => $data['cost'] ?? 0,
            'stock' => $data['stock'] ?? 0,
            'type' => $data['type'] ?? SC_PRODUCT_NORMAL,
            'writer' => $data['writer'],
            'virtual' => $data['virtual'] ?? SC_VIRTUAL_PHYSICAL,
            'date_available' => !empty($data['date_available']) ? $data['date_available'] : null,
            'sku' => $data['sku'],
            'image' => $data['image'],
            'status' => (!empty($data['status']) ? 1 : 0),
            'sort' => $data['sort'] ?? 0,
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

        return redirect()->route('product.index')->with('success', trans('product.admin.create_success'));

    }

/**
 * Form edit
 */
    public function edit($id)
    {
        auth()->guard('sellerUser');
        $seller_id = auth()->guard('sellerUser')->id();

        $product = ShopProduct::find($id);
        if ($product === null) {
            return 'no data';
        }

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
        $htmlProductAtrribute = '<tr><td><br><input type="text" name="attribute[attribute_group][]" value="attribute_value" class="form-control input-sm" placeholder="' . trans('product.admin.add_attribute_place') . '" /></td><td><br><span title="Remove" class="btn btn-flat btn-sm btn-danger removeAttribute"><i class="fa fa-times"></i></span></td></tr>';
        //end select attribute

        $data = [
            'title' => trans('product.admin.edit'),
            'sub_title' => '',
            'title_description' => trans('product.admin.edit_product'),
            'icon' => 'fa fa-pencil-square-o',
            'languages' => $this->languages,
            'product' => $product,
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
        ];
        return view('templates.' . sc_store('template') . '.seller.product.edit')
            ->with($data);
    }

/**
 * update status
 */
    public function postEdit($id)
    {
        auth()->guard('sellerUser');
        $seller_id = auth()->guard('sellerUser')->id();

        $product = ShopProduct::find($id);
        $data = request()->all();
        $dataOrigin = request()->all();
            $arrValidation = [
                'image' => 'required',
                'sort' => 'numeric|min:0',
                'descriptions.*.name' => 'required|string|max:100',
                'descriptions.*.content' => 'required|string',
                'category' => 'required',
                'sku' => 'required|regex:/(^([0-9A-Za-z\-\._]+)$)/|unique:shop_product,sku,' . $product->id . ',id',
                'vendor_id' => 'required',
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
//Edit

        $category = $data['category'] ?? [];
        $attribute = $data['attribute'] ?? [];
        $descriptions = $data['descriptions'];
        $productInGroup = $data['productInGroup'] ?? [];
        $productBuild = $data['productBuild'] ?? [];
        $productBuildQty = $data['productBuildQty'] ?? [];
        $subImages = $data['sub_image'] ?? [];
        $dataUpdate = [
            'user_id' => $seller_id,
            'image' => $data['image'] ?? '',
            // 'brand_id' => $data['brand_id'] ?? 0,
            'vendor_id' => $data['vendor_id'] ?? 0,
            'price' => $data['price'] ?? 0,
            'cost' => $data['cost'] ?? 0,
            'stock' => $data['stock'] ?? 0,
            'type' => $data['type'] ?? SC_PRODUCT_NORMAL,
            'writer' => $data['writer'] ?? '',
            'virtual' => $data['virtual'] ?? SC_VIRTUAL_PHYSICAL,
            'date_available' => !empty($data['date_available']) ? $data['date_available'] : null,
            'sku' => $data['sku'],
            'status' => (!empty($data['status']) ? 1 : 0),
            'sort' => $data['sort'] ?? 0,
        ];

        $product->update($dataUpdate);

        //Promoton price
        $product->promotionPrice()->delete();
        if (isset($data['price_promotion'])) {
            $arrPromotion['price_promotion'] = $data['price_promotion'];
            $arrPromotion['date_start'] = $data['price_promotion_start'] ? $data['price_promotion_start'] : null;
            $arrPromotion['date_end'] = $data['price_promotion_end'] ? $data['price_promotion_end'] : null;
            $product->promotionPrice()->create($arrPromotion);
        }

        $product->descriptions()->delete();
        $dataDes = [];
        foreach ($data['descriptions'] as $code => $row) {
            $dataDes[] = [
                'product_id' => $id,
                'lang' => $code,
                'name' => $row['name'],
                // 'keyword' => $row['keyword'],
                // 'description' => $row['description'],
                'content' => $row['content'] ?? '',
            ];
        }
        ShopProductDescription::insert($dataDes);

        //Update category
        $product->categories()->detach();
        if (count($category)) {
            $product->categories()->attach($category);
        }

        //Update attribute
        $product->attributes()->delete();
        if (count($attribute)) {
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

        //Update sub mages
        if ($subImages) {
            $product->images()->delete();
            $arrSubImages = [];
            foreach ($subImages as $key => $image) {
                if ($image) {
                    $arrSubImages[] = new ShopProductImage(['image' => $image]);
                }
            }
            $product->images()->saveMany($arrSubImages);
        }

//
        return redirect()->route('product.index')->with('success', trans('product.admin.edit_success'));

    }

/*
Delete list Item
Need mothod destroy to boot deleting in model
 */
    public function deleteList()
    {
        if (!request()->ajax()) {
            return response()->json(['error' => 1, 'msg' => 'Method not allow!']);
        } else {
            $ids = request('ids');
            $arrID = explode(',', $ids);
            $arrCantDelete = [];
            foreach ($arrID as $key => $id) {
                if (ShopProductBuild::where('product_id', $id)->first() || ShopProductGroup::where('product_id', $id)->first()) {
                    $arrCantDelete[] = $id;}
            }
            if (count($arrCantDelete)) {
                return response()->json(['error' => 1, 'msg' => trans('product.admin.cant_remove_child') . ': ' . json_encode($arrCantDelete)]);
            } else {
                ShopProduct::destroy($arrID);
                return response()->json(['error' => 0, 'msg' => '']);
            }

        }
    }

}
