<?php
#app/Http/Admin/Controllers/ShopOrderController.php
namespace App\Http\Controllers\Seller;

use App\Http\Controllers\GeneralController;
use App\Http\Controllers\Controller;
use App\Models\ShopAttributeGroup;
use App\Models\ShopCountry;
use App\Models\ShopDistrict;
use App\Models\ShopUpazila;
use App\Models\ShopCurrency;
use App\Models\ShopOrder;
use App\Models\ShopOrderDetail;
use App\Models\ShopOrderStatus;
use App\Models\ShopOrderTotal;
use App\Models\ShopPaymentStatus;
use App\Models\ShopProduct;
use App\Models\ShopVendor;
use App\Models\ShopShippingStatus;
use App\Models\ShopUser;
use DB;
use Illuminate\Http\Request;
use Validator;

class ShopOrderController extends GeneralController
{
    public $statusPayment, $statusOrder, $statusShipping, $statusOrderMap, $statusShippingMap, $currency, $country, $district, $upazila, $countryMap, $districtMap, $upazilaMap;
    
    public function __construct()
    {
        parent::__construct();
        $this->statusOrder = ShopOrderStatus::getListStatus();
        $this->statusOrderMap = ShopOrderStatus::mapValue();
        $this->currency = ShopCurrency::getList();
        $this->country = ShopCountry::getArray();
        $this->countryMap = ShopCountry::mapValue();
        $this->district = ShopDistrict::getArray();
        $this->districtMap = ShopDistrict::mapValue();
        $this->upazila = ShopUpazila::getArray();
        $this->upazilaMap = ShopUpazila::mapValue();
        $this->statusPayment = ShopPaymentStatus::getListStatus();
        $this->statusShipping = ShopShippingStatus::getListStatus();
        $this->statusShippingMap = ShopShippingStatus::mapValue();

    }

    /**
     * Index interface.
     *
     * @return Content
     */
    public function index()
    {
        $seller_id = auth()->guard('sellerUser')->id();

        $data = [
            'title' => trans('order.admin.list'),
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
            'id' => trans('order.admin.id'),
            'email' => trans('order.admin.email'),
            // 'subtotal' => trans('order.admin.subtotal'),
            // 'shipping' => trans('order.admin.shipping'),
            'discount' => trans('order.admin.discount'),
            'total' => trans('order.admin.total'),
            'payment_method' => trans('order.admin.payment_method_short'),
            // 'currency' => trans('order.admin.currency'),
            'status' => trans('order.admin.status'),
            // 'created_at' => trans('order.admin.created_at'),
            'action' => trans('order.admin.action'),
        ];
        $sort_order = request('sort_order') ?? 'id_desc';
        $keyword = request('keyword') ?? '';
        $order_status = request('order_status') ?? '';
        $arrSort = [
            'id__desc' => trans('order.admin.sort_order.id_desc'),
            'id__asc' => trans('order.admin.sort_order.id_asc'),
            'email__desc' => trans('order.admin.sort_order.email_desc'),
            'email__asc' => trans('order.admin.sort_order.email_asc'),
            'created_at__desc' => trans('order.admin.sort_order.date_desc'),
            'created_at__asc' => trans('order.admin.sort_order.date_asc'),
        ];

        $obj_temp = new ShopProduct;
        $obj_temp = $obj_temp->getSellerProduct($seller_id);

        $obj = new ShopOrder;
        if ($keyword) {
            $obj = $obj->whereRaw('(id = ' . (int) $keyword . ' OR email like "%' . $keyword . '%" )');
        }
        if ((int) $order_status) {
            $obj = $obj->where('status', (int) $order_status);
        }
        if ($sort_order && array_key_exists($sort_order, $arrSort)) {
            $field = explode('__', $sort_order)[0];
            $sort_field = explode('__', $sort_order)[1];
            $obj = $obj->orderBy($field, $sort_field);

        } else {
            $obj = $obj->orderBy('id', 'desc');
        }
        $dataTmp = $obj->paginate(20);

        $styleStatus = $this->statusOrder;
        array_walk($styleStatus, function (&$v, $k) {
            $v = '<span class="label label-' . (ShopOrder::$mapStyleStatus[$k] ?? 'light') . '">' . $v . '</span>';
        });
        $dataTr = [];
        foreach ($dataTmp as $key => $row) {
            $dataTr[] = [
                'check_row' => '<input type="checkbox" class="grid-row-checkbox" data-id="' . $row['id'] . '">',
                'id' => $row['id'],
                'email' => $row['email'] ?? 'N/A',
                // 'subtotal' => sc_currency_render_symbol($row['subtotal'] ?? 0, $row['currency']),
                // 'shipping' => sc_currency_render_symbol($row['shipping'] ?? 0, $row['currency']),
                'discount' => sc_currency_render_symbol($row['discount'] ?? 0, $row['currency']),
                'total' => sc_currency_render_symbol($row['total'] ?? 0, $row['currency']),
                'payment_method' => $row['payment_method'],
                // 'currency' => $row['currency'] . '/' . $row['exchange_rate'],
                'status' => $styleStatus[$row['status']],
                // 'created_at' => $row['created_at'],
                'action' => '
                                <a href="' . route('order.detail', ['id' => $row['id']]) . '"><span title="' . trans('order.admin.edit') . '" type="button" class="btn btn-flat btn-primary"><i class="fa fa-edit"></i></span></a>&nbsp;

                                <span onclick="deleteItem(' . $row['id'] . ');"  title="' . trans('admin.delete') . '" class="btn btn-flat btn-danger"><i class="fa fa-trash"></i></span>'
                ,
            ];
        }

        $data['listTh'] = $listTh;
        $data['dataTr'] = $dataTr;
        $data['pagination'] = $dataTmp->appends(request()->except(['_token', '_pjax']))->links('admin.component.pagination');
        $data['result_items'] = trans('order.admin.result_item', ['item_from' => $dataTmp->firstItem(), 'item_to' => $dataTmp->lastItem(), 'item_total' => $dataTmp->total()]);
//menu_left
        $data['menu_left'] = '<div class="pull-left">
                    <button type="button" class="btn btn-default grid-select-all"><i class="fa fa-square-o"></i></button> &nbsp;

                    <a class="btn   btn-flat btn-danger grid-trash" title="Delete"><i class="fa fa-trash-o"></i><span class="hidden-xs"> ' . trans('admin.delete') . '</span></a> &nbsp;

                    <a class="btn   btn-flat btn-primary grid-refresh" title="Refresh"><i class="fa fa-refresh"></i><span class="hidden-xs"> ' . trans('admin.refresh') . '</span></a> &nbsp;</div>
                    ';
//=menu_left


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
      var url = '" . route('order.index') . "?sort_order='+$('#order_sort option:selected').val();
      $.pjax({url: url, container: '#pjax-container'})
    });";

//=menu_sort

//menu_search

        $optionStatus = '';
        foreach ($this->statusOrder as $key => $status) {
            $optionStatus .= '<option  ' . (($order_status == $key) ? "selected" : "") . ' value="' . $key . '">' . $status . '</option>';
        }
        $data['menu_search'] = '
                <form action="' . route('order.index') . '" id="button_search">
                   <div onclick="$(this).submit();" class="btn-group pull-right">
                           <a class="btn btn-flat btn-primary" title="Refresh">
                              <i class="fa  fa-search"></i><span class="hidden-xs"> ' . trans('admin.search') . '</span>
                           </a>
                   </div>
                   <div class="btn-group pull-right">
                         <div class="form-group">
                           <input type="text" name="keyword" class="form-control" placeholder="' . trans('order.admin.search_place') . '" value="' . $keyword . '">
                         </div>
                   </div>

                   <div class="btn-group pull-right"  style="margin-right: 10px">
                        <div class="form-group">
                           <select class="form-control" name="order_status">
                             <option value="">' . trans('order.admin.search_order.status') . '</option>
                             ' . $optionStatus . '
                            </select>
                        </div>
                    </div>
                </form>';
//=menu_search

        $data['url_delete_item'] = route('order.delete');

        return view('templates.' . sc_store('template') . '.seller.order.index')
            ->with($data);
    }

/**
 * Order detail
 * @param  [type] $id [description]
 * @return [type]     [description]
 */
    public function detail($id)
    {

        $order = ShopOrder::find($id);
        if ($order === null) {
            return 'no data';
        }
        $products = ShopProduct::getArrayProductName();
        $shop = new ShopVendor;
        $paymentMethodTmp = sc_get_extension('payment', $onlyActive = false);
        foreach ($paymentMethodTmp as $key => $value) {
            $paymentMethod[$key] = sc_language_render($value->detail);
        }
        $shippingMethodTmp = sc_get_extension('shipping', $onlyActive = false);
        foreach ($shippingMethodTmp as $key => $value) {
            $shippingMethod[$key] = sc_language_render($value->detail);
        }
        return view('templates.' . sc_store('template') . '.seller.order.order_edit')->with(
            [
                "title" => trans('order.order_detail'),
                "sub_title" => '',
                'icon' => 'fa fa-file-text-o',
                "order" => $order,
                "products" => $products,
                "shop" => $shop,
                "statusOrder" => $this->statusOrder,
                "statusPayment" => $this->statusPayment,
                "statusShipping" => $this->statusShipping,
                "statusOrderMap" => $this->statusOrderMap,
                "statusShippingMap" => $this->statusShippingMap,
                'dataTotal' => ShopOrderTotal::getTotal($id),
                'attributesGroup' => ShopAttributeGroup::pluck('name', 'id')->all(),
                'paymentMethod' => $paymentMethod,
                'shippingMethod' => $shippingMethod,
                'country' => $this->country,
                'district' => $this->district,
                'upazila' => $this->upazila
            ]);
    }

/**
 * [getInfoUser description]
 * @param   [description]
 * @return [type]           [description]
 */
    public function getInfoUser()
    {
        $id = request('id');
        return ShopUser::find($id)->toJson();
    }
/**
 * [getInfoProduct description]
 * @param   [description]
 * @return [type]           [description]
 */
    public function getInfoProduct()
    {
        $id = request('id');
        $sku = request('sku');
        if ($id) {
            $product = ShopProduct::find($id);
        } else {
            $product = ShopProduct::where('sku', $sku)->first();
        }
        $arrayReturn = $product->toArray();
        $arrayReturn['renderAttDetails'] = $product->renderAttributeDetailsAdmin();
        $arrayReturn['price_final'] = $product->getFinalPrice();
        return json_encode($arrayReturn);
    }

    public function postOrderUpdate()
    {
        $id = request('pk');
        $field = request('name');
        $value = request('value');
        if ($field == 'shipping' || $field == 'discount' || $field == 'received') {
            $order_total_origin = ShopOrderTotal::find($id);
            $order_id = $order_total_origin->order_id;
            $oldValue = $order_total_origin->value;
            $order = ShopOrder::find($order_id);
            $fieldTotal = [
                'id' => $id,
                'code' => $field,
                'value' => $value,
                'text' => sc_currency_render_symbol($value, $order->currency),
            ];
            ShopOrderTotal::updateField($fieldTotal);
        } else {
            $arrFields = [
                $field => $value,
            ];
            $order_id = $id;
            $order = ShopOrder::find($order_id);
            $oldValue = $order->{$field};
            ShopOrder::updateInfo($arrFields, $order_id);
        }

        //Add history
        $dataHistory = [
            'order_id' => $order_id,
            'content' => 'Change <b>' . $field . '</b> from <span style="color:blue">\'' . $oldValue . '\'</span> to <span style="color:red">\'' . $value . '\'</span>',
            'order_status_id' => $order->status,
        ];
        (new ShopOrder)->addOrderHistory($dataHistory);

        if ($order_id) {
            $orderUpdated = ShopOrder::find($order_id);
            if ($orderUpdated->balance == 0 && $orderUpdated->total != 0) {
                $style = 'style="color:#0e9e33;font-weight:bold;"';
            } else
            if ($orderUpdated->balance < 0) {
                $style = 'style="color:#ff2f00;font-weight:bold;"';
            } else {
                $style = 'style="font-weight:bold;"';
            }
            $blance = '<tr ' . $style . ' class="data-balance"><td>' . trans('order.balance') . ':</td><td align="right">' . sc_currency_format($orderUpdated->balance) . '</td></tr>';
            return json_encode(['error' => 0, 'msg' => [
                'total' => sc_currency_format($orderUpdated->total),
                'subtotal' => sc_currency_format($orderUpdated->subtotal),
                'shipping' => sc_currency_format($orderUpdated->shipping),
                'discount' => sc_currency_format($orderUpdated->discount),
                'received' => sc_currency_format($orderUpdated->received),
                'balance' => $blance,
            ],
            ]);
        } else {
            return json_encode(['error' => 1, 'msg' => 'Error ']);
        }
    }


/**
 * [postDeleteItem description]
 * @param   [description]
 * @return [type]           [description]
 */
    public function postDeleteItem()
    {
        try {
            $data = request()->all();
            $pId = $data['pId'] ?? 0;
            $itemDetail = (new ShopOrderDetail)->where('id', $pId)->first();
            $order_id = $itemDetail->order_id;
            $product_id = $itemDetail->product_id;
            $qty = $itemDetail->qty;
            $itemDetail->delete(); //Remove item from shop order detail
            $order = ShopOrder::find($order_id);
            //Update total price
            $subtotal = ShopOrderDetail::select(DB::raw('sum(total_price) as subtotal'))
                ->where('order_id', $order_id)
                ->first()->subtotal;
            ShopOrderTotal::updateSubTotal($order_id, empty($subtotal) ? 0 : $subtotal);
            //Update stock, sold
            ShopProduct::updateStock($product_id, -$qty);

            //Add history
            $dataHistory = [
                'order_id' => $order_id,
                'content' => 'Remove item pID#' . $pId,
                'admin_id' => Admin::user()->id,
                'order_status_id' => $order->status,
            ];
            (new ShopOrder)->addOrderHistory($dataHistory);
            return json_encode(['error' => 0, 'msg' => '']);
        } catch (\Exception $e) {
            return json_encode(['error' => 1, 'msg' => 'Error: ' . $e->getMessage()]);

        }
    }

/*
Delete list order ID
Need mothod destroy to boot deleting in model
 */
    public function deleteList()
    {
        if (!request()->ajax()) {
            return response()->json(['error' => 1, 'msg' => 'Method not allow!']);
        } else {
            $ids = request('ids');
            $arrID = explode(',', $ids);
            ShopOrder::destroy($arrID);
            return response()->json(['error' => 0, 'msg' => '']);
        }
    }

/*
Export order detail order
 */
    public function exportDetail()
    {
        $type = request('type');
        $order_id = request('order_id') ?? 0;
        $order = ShopOrder::with(['details', 'orderTotal'])->find($order_id);
        if ($order) {
            $data = array();
            $data['name'] = $order['first_name'] . ' ' . $order['last_name'];
            $data['address'] = $order['address'] . ', ' . $order['upazila'] . ', ' . $order['district'] . ', '-', ' . $order['post'] . ', ' . $order['country'];
            $data['phone'] = $order['phone'];
            $data['email'] = $order['email'];
            $data['comment'] = $order['comment'];
            $data['payment_method'] = $order['payment_method'];
            $data['shipping_method'] = $order['shipping_method'];
            $data['created_at'] = $order['created_at'];
            $data['currency'] = $order['currency'];
            $data['exchange_rate'] = $order['exchange_rate'];
            $data['subtotal'] = $order['subtotal'];
            $data['shipping'] = $order['shipping'];
            $data['discount'] = $order['discount'];
            $data['total'] = $order['total'];
            $data['received'] = $order['received'];
            $data['balance'] = $order['balance'];
            $data['id'] = $order->id;
            $data['details'] = [];
            if ($order->details) {
                foreach ($order->details as $key => $detail) {
                    $data['details'][] = [
                        $key + 1, $detail->sku, $detail->name, $detail->qty, $detail->price, $detail->total_price,
                    ];
                }
            }
            $options = ['filename' => 'Order ' . $order_id];
            return \Export::export($type, $data, $options);

        }
    }

}
