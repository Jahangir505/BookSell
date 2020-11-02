<?php
#app/Http/Admin/Controllers/SellerUserController.php
namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Models\ShopCountry;
use App\Models\ShopDistrict;
use App\Models\ShopLanguage;
use App\Models\SellerUser;
use Illuminate\Http\Request;
use Validator;

class SellerUserController extends Controller
{
    public $lang, $languages, $countries;

    public function __construct()
    {
        $this->lang = app()->getLocale();
        $this->languages = ShopLanguage::getList();
        $this->countries = ShopCountry::getList();
        $this->districts = ShopDistrict::getList();

    }

    public function index()
    {
        $data = [
            'title' => trans('customer.admin.seller.list'),
            'sub_title' => '',
            'icon' => 'fa fa-indent',
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
            'id' => trans('customer.id'),
            'email' => trans('customer.email'),
            'name' => trans('customer.name'),
            'phone' => trans('customer.phone'),
            'address' => trans('customer.address'),
            'district' => trans('customer.district'),
            'status' => trans('customer.status'),
            'created_at' => trans('customer.created_at'),
            // 'updated_at' => trans('customer.updated_at'),
            'action' => trans('customer.admin.action'),
        ];
        $sort_order = request('sort_order') ?? 'id_desc';
        $keyword = request('keyword') ?? '';
        $arrSort = [
            'id__desc' => trans('customer.admin.sort_order.id_desc'),
            'id__asc' => trans('customer.admin.sort_order.id_asc'),
            'first_name__desc' => trans('customer.admin.sort_order.first_name_desc'),
            'first_name__asc' => trans('customer.admin.sort_order.first_name_asc'),
            'last_name__desc' => trans('customer.admin.sort_order.last_name_desc'),
            'last_name__asc' => trans('customer.admin.sort_order.last_name_asc'),
        ];
        $obj = new SellerUser;

        if ($keyword) {
            $obj = $obj->whereRaw('(id = ' . (int) $keyword . ' OR email like "%' . $keyword . '%" OR name like "%' . $keyword . '%" )');
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
            $dataTr[] = [
                'check_row' => '<input type="checkbox" class="grid-row-checkbox" data-id="' . $row['id'] . '">',
                'id' => $row['id'],
                'email' => $row['email'],
                'name' => $row['name'],
                'phone' => $row['phone'],
                'address' => $row['address'],
                'district' => $this->districts[$row['district']]->name ?? '',
                'status' => $row['status'] ? '<span class="label label-success">ON</span>' : '<span class="label label-danger">OFF</span>',
                'created_at' => $row['created_at'],
                // 'updated_at' => $row['updated_at'],
                'action' => '
                    <a href="' . route('admin_seller.edit', ['id' => $row['id']]) . '"><span title="' . trans('customer.admin.edit') . '" type="button" class="btn btn-flat btn-primary"><i class="fa fa-edit"></i></span></a>&nbsp;

                    <span onclick="deleteItem(' . $row['id'] . ');"  title="' . trans('admin.delete') . '" class="btn btn-flat btn-danger"><i class="fa fa-trash"></i></span>'
                ,
            ];
        }

        $data['listTh'] = $listTh;
        $data['dataTr'] = $dataTr;
        $data['pagination'] = $dataTmp->appends(request()->except(['_token', '_pjax']))->links('admin.component.pagination');
        $data['result_items'] = trans('customer.admin.result_item', ['item_from' => $dataTmp->firstItem(), 'item_to' => $dataTmp->lastItem(), 'item_total' => $dataTmp->total()]);
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
                           <a href="' . route('admin_seller.create') . '" class="btn  btn-success  btn-flat" title="New" id="button_create_new">
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
      var url = '" . route('admin_seller.index') . "?sort_order='+$('#order_sort option:selected').val();
      $.pjax({url: url, container: '#pjax-container'})
    });";

//=menu_sort

//menu_search

        $data['menu_search'] = '
                <form action="' . route('admin_seller.index') . '" id="button_search">
                   <div onclick="$(this).submit();" class="btn-group pull-right">
                           <a class="btn btn-flat btn-primary" title="Refresh">
                              <i class="fa  fa-search"></i><span class="hidden-xs"> ' . trans('admin.search') . '</span>
                           </a>
                   </div>
                   <div class="btn-group pull-right">
                         <div class="form-group">
                           <input type="text" name="keyword" class="form-control" placeholder="' . trans('customer.admin.search_place') . '" value="' . $keyword . '">
                         </div>
                   </div>
                </form>';
//=menu_search

        $data['url_delete_item'] = route('admin_seller.delete');

        return view('admin.screen.list')
            ->with($data);
    }

/**
 * Form create new order in admin
 * @return [type] [description]
 */
    public function create()
    {
        $data = [
            'title' => trans('customer.admin.seller.add_new_title'),
            'sub_title' => '',
            'title_description' => trans('customer.admin.seller.add_new_des'),
            'icon' => 'fa fa-plus',
            'countries' => (new ShopCountry)->getList(),
            'districts' => (new ShopDistrict)->getList(),
            'seller' => [],
            'url_action' => route('admin_seller.create'),

        ];

        return view('admin.screen.seller')
            ->with($data);
    }

/**
 * Post create new order in admin
 * @return [type] [description]
 */
    public function postCreate()
    {
        $data = request()->all();
        $dataOrigin = request()->all();
        $validator = Validator::make($dataOrigin, [
            'email' => 'required|email|unique:shop_user,email',
            'address' => 'required|string|max:100',
            'district' => 'required',
            'name' => 'required|string|max:100',
            'phone' => 'required|string|max:20',
            'password' => 'required|string|max:100',
        ]);

        if ($validator->fails()) {
            return redirect()->back()
                ->withErrors($validator)
                ->withInput();
        }

        $dataInsert = [
            'email' => $data['email'],
            'address' => $data['address'],
            'district' => $data['district'],
            'name' => $data['name'],
            'phone' => $data['phone'],
            'password' => bcrypt($data['password']),
            'status' => empty($data['status']) ? 0 : 1,
        ];

        SellerUser::createSeller($dataInsert);

        return redirect()->route('admin_seller.index')->with('success', trans('customer.admin.create_success'));

    }

/**
 * Form edit
 */
    public function edit($id)
    {
        $seller = SellerUser::find($id);
        if ($seller === null) {
            return 'no data';
        }
        $data = [
            'title' => trans('customer.admin.edit'),
            'sub_title' => '',
            'title_description' => '',
            'icon' => 'fa fa-pencil-square-o',
            'seller' => $seller,
            'countries' => (new ShopCountry)->getList(),
            'districts' => (new ShopDistrict)->getList(),
            'url_action' => route('admin_seller.edit', ['id' => $seller['id']]),
        ];
        return view('admin.screen.seller')
            ->with($data);
    }

/**
 * update status
 */
    public function postEdit($id)
    {
        $customer = SellerUser::find($id);
        $data = request()->all();
        $dataOrigin = request()->all();
        $validator = Validator::make($dataOrigin, [
            'email' => 'required|email|unique:seller_user,email,' . $customer->id . ',id',
            'address' => 'required|string|max:100',
            'district' => 'required',
            'name' => 'required|string|max:100',
            'phone' => 'required|string|max:20',
            // 'password' => 'required|string|max:100',
        ]);

        if ($validator->fails()) {
            return redirect()->back()
                ->withErrors($validator)
                ->withInput();
        }
//Edit

        $dataUpdate = [
            'email' => $data['email'],
            'address' => $data['address'],
            'district' => $data['district'],
            'name' => $data['name'],
            'phone' => $data['phone'],
            'password' => $data['password'] ? bcrypt($data['password']) : $customer->password,
            'status' => empty($data['status']) ? 0 : 1,
        ];
        if ($data['password']) {
            $dataUpdate['password'] = bcrypt($data['password']);
        }
        SellerUser::updateInfo($dataUpdate, $id);
//
        return redirect()->route('admin_seller.index')->with('success', trans('customer.admin.edit_success'));

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
            SellerUser::destroy($arrID);
            return response()->json(['error' => 0, 'msg' => '']);
        }
    }

}
