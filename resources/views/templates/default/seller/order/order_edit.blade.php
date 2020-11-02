@extends('templates.'.sc_store('template').'.shop_layout')

@section('main')
 <div class="row">
    @include('templates.'.sc_store('template').'.seller.seller_left_menu')
    <div class="col-md-9">
    <div class="col-md-12">
       <div class="box">

          <div class="box-header with-border">
              <h2 style="text-align: center;"><a><img style="width: 150px;" src="{{  asset('data/logo/BlueLogo.png') }}"></a></h2>
              <h3 class="box-title">{{ trans('order.order_detail') }} #{{ $order->id }}</h3>
              <div class="box-tools not-print">
                  <div class="btn-group pull-right" style="margin-right: 0px">
                      <a href="{{ route('order.index') }}" class="btn btn-sm btn-flat btn-default"><i class="fa fa-list"></i>&nbsp;{{ trans('admin.list') }}</a>
                  </div>
                  {{-- <div class="btn-group pull-right" style="margin-right: 10px">
                      <a href="{{ route('order.export_detail').'?order_id='.$order->id.'&type=invoice' }}" class="btn btn-sm btn-flat btn-twitter" title="Export"><i class="fa fa-file-excel-o"></i><span class="hidden-xs"> Excel</span></a>
                  </div> --}}
{{--                   <div class="btn-group pull-right" style="margin-right: 10px">
                      <a href="{{ route('order.export_detail').'?order_id='.$order->id.'&type=pdf' }}" class="btn btn-sm btn-flat btn-warning" title="Export"><i class="fa fa-file-pdf-o"></i><span class="hidden-xs"> PDF</span></a>
                  </div> --}}
                  <div class="btn-group pull-right" style="margin-right: 10px;border:1px solid #c5b5b5;">
                      <a class="btn btn-sm btn-flat" title="Export" onclick="order_print()"><i class="fa fa-print"></i><span class="hidden-xs"> Print</span></a>
                  </div>
              </div>
          </div>

          <div class="row" id="order-body">
            <div class="col-sm-6">
                 <table class="table table-bordered">
                    <tr>
                      <td class="td-title">{{ trans('order.shipping_first_name') }}:</td><td>{!! $order->first_name !!}</td>
                    </tr>
                    <tr>
                      <td class="td-title">{{ trans('order.shipping_last_name') }}:</td><td>{!! $order->last_name !!}</td>
                    </tr>
                    <tr>
                      <td class="td-title">{{ trans('order.shipping_phone') }}:</td><td>{!! $order->phone !!}</td>
                    </tr>
                    <tr>
                      <td class="td-title">{{ trans('order.email') }}:</td><td>{!! empty($order->email)?'N/A':$order->email!!}</td>
                    </tr>
                    <tr>
                      <td class="td-title">{{ trans('order.shipping_address') }}:</td><td>{!! $order->address !!}</td>
                    </tr>
                    <tr>
                      <td class="td-title">{{ trans('order.shipping_district') }}:</td><td>{{ $district[$order->district] }}</td>
                    </tr>
                    <tr>
                      <td class="td-title">{{ trans('order.shipping_upazila') }}:</td><td>{{ $upazila[$order->upazila] }}</td>
                    </tr>
                    <tr>
                      <td class="td-title">{{ trans('order.shipping_post') }}:</td><td>{!! $order->post !!}</td>
                    </tr>
                      <tr>
                      <td class="td-title">{{ trans('order.country') }}:</td><td>{{ $country[$order->country] }}</td>
                    </tr>
                </table>
            </div>
            <div class="col-sm-6">
                <table  class="table table-bordered">
                    <tr><td  class="td-title">{{ trans('order.order_status') }}:</td><td><a href="#" class="updateStatus" data-name="status" data-type="select" data-source ="{{ json_encode($statusOrderMap) }}"  data-pk="{{ $order->id }}" data-value="{!! $order->status !!}" data-url="{{ route("order.update") }}" data-title="{{ trans('order.order_status') }}">{{ $statusOrder[$order->status] }}</a></td></tr>
                    {{-- <tr><td>{{ trans('order.order_shipping_status') }}:</td><td>{{ $statusShipping[$order->shipping_status]??'' }}</td></tr>
                    <tr><td>{{ trans('order.shipping_method') }}:</td><td>{{ $order->shipping_method }}</td></tr> --}}
                    <tr><td>{{ trans('order.payment_method') }}:</td><td>{{ $order->payment_method }}</td></tr>
                  </table>
                 {{-- <table class="table table-bordered">
                    <tr>
                      <td class="td-title">{{ trans('order.currency') }}:</td><td>{{ $order->currency }}</td>
                    </tr>
                    <tr>
                      <td class="td-title">{{ trans('order.exchange_rate') }}:</td><td>{{ ($order->exchange_rate)??1 }}</td>
                    </tr>
                </table> --}}
            </div>

          </div>

@php
    if($order->balance == 0){
        $style = 'style="color:#0e9e33;font-weight:bold;"';
    }else
        if($order->balance < 0){
        $style = 'style="color:#ff2f00;font-weight:bold;"';
    }else{
        $style = 'style="font-weight:bold;"';
    }
@endphp

    <form id="form-add-item" action="" method="">
      @csrf
      <input type="hidden" name="order_id"  value="{{ $order->id }}">
      <div class="row">
        <div class="col-sm-12">
          <div class="box collapsed-box">
            <table class="table table-bordered">
                <thead>
                  <tr>
                    <th>{{ trans('product.name') }}</th>
                    <th>{{ trans('product.sku') }}</th>
                    <th>{{ 'Shop Name' }}</th>
                    <th>{{ 'Shop Address' }}</th>
                    <th class="product_price">{{ trans('product.price') }}</th>
                    <th class="product_qty">{{ trans('product.quantity') }}</th>
                    <th class="product_total">{{ trans('product.total_price') }}</th>
                    {{-- <th>{{ trans('admin.action') }}</th> --}}
                  </tr>
                </thead>
                <tbody>
                    @foreach ($order->details as $item)
                          <tr>
                            <td>{{ $item->name }}
                              @php
                              $html = '';
                                if($item->attribute && is_array(json_decode($item->attribute,true))){
                                  $array = json_decode($item->attribute,true);
                                      foreach ($array as $key => $element){
                                        $html .= '<br><b>'.$attributesGroup[$key].'</b> : <i>'.$element.'</i>';
                                      }
                                }
                              @endphp
                            {!! $html !!}
                            </td>
                            <td>{{ $item->sku }}</td>
                            <td>{{ $shop->getVendor($item['vendor_id']) ? $shop->getVendor($item['vendor_id'])->name : 'BOOKiMIND' }}</td>
                            <td>{{ $shop->getVendor($item['vendor_id']) ? $shop->getVendor($item['vendor_id'])->address : 'BOOKiMIND' }}</td>
                            <td class="product_price">{{ $item->price }}</td>
                            <td class="product_qty"> {{ $item->qty }}</td>
                            <td class="product_total item_id_{{ $item->id }}">{{ sc_currency_render_symbol($item->total_price,$order->currency)}}</td>
                            {{-- <td>
                                <button  onclick="deleteItem({{ $item->id }});" class="btn btn-danger btn-xs" data-title="Delete"><i class="fa fa-trash" aria-hidden="true"></i></button>
                            </td> --}}
                          </tr>
                    @endforeach

                    </form>
                </tbody>
              </table>
            </div>
        </div>

      </div>
</form>

      <div class="row">
        {{-- Total --}}
          <div class="col-sm-6">
            <div class="box collapsed-box">
                <table   class="table table-bordered">
                  @foreach ($dataTotal as $element)
                    @if ($element['code'] =='subtotal')
                      <tr><td  class="td-title-normal">{!! $element['title'] !!}:</td><td style="text-align:right" class="data-{{ $element['code'] }}">{{ sc_currency_format($element['value']) }}</td></tr>
                    @endif
                    @if ($element['code'] =='shipping')
                      <tr><td>{!! $element['title'] !!}:</td><td style="text-align:right">{{$element['value'] }}</td></tr>
                    @endif
                    @if ($element['code'] =='discount')
                      <tr><td>{!! $element['title'] !!}(-):</td><td style="text-align:right">{{$element['value'] }}</td></tr>
                    @endif

                     @if ($element['code'] =='total')
                      <tr style="background:#f5f3f3;font-weight: bold;"><td>{!! $element['title'] !!}:</td><td style="text-align:right" class="data-{{ $element['code'] }}">{{ sc_currency_format($element['value']) }}</td></tr>
                    @endif

                    @if ($element['code'] =='received')
                      <tr><td>{!! $element['title'] !!}(-):</td><td style="text-align:right">{{$element['value'] }}</td></tr>
                    @endif

                  @endforeach

                    <tr  {!! $style !!}  class="data-balance"><td>{{ trans('order.balance') }}:</td><td style="text-align:right">{{($order->balance === NULL)?sc_currency_format($order->total):sc_currency_format($order->balance) }}</td></tr>
              </table>
            </div>

          </div>
          {{-- //End total --}}


          {{-- History --}}
          <div class="col-sm-6">
            <div class="box collapsed-box">
              <table class="table box table-bordered">
                <tr>
                  <td  class="td-title">{{ trans('order.order_note') }}:</td>
                  <td>
                    <a href="#" class="updateInfo" data-name="comment" data-type="text" data-pk="{{ $order->id }}" data-url="{{ route("order.update") }}" data-title="" >{{ $order->comment }}
                    </a>
                </td>
                </tr>
              </table>
            </div>

          </div>
          {{-- //End history --}}

          </div>
          {{-- //End history --}}
      </div>
@php
  $htmlSelectProduct = '<tr>
              <td>
                <select onChange="selectProduct($(this));"  class="add_id form-control select2" name="add_id[]" style="width:100% !important;">
                <option value="0">'.trans('order.select_product').'</option>';
                if(count($products)){
                  foreach ($products as $pId => $productName){
                    $htmlSelectProduct .='<option  value="'.$pId.'" >'.$productName.'</option>';
                   }
                }
  $htmlSelectProduct .='
              </select>
              <span class="add_attr"></span>
            </td>
              <td><input type="text" disabled class="add_sku form-control"  value=""></td>
              <td><input onChange="update_total($(this));" type="number" min="0" class="add_price form-control" name="add_price[]" value="0"></td>
              <td><input onChange="update_total($(this));" type="number" min="0" class="add_qty form-control" name="add_qty[]" value="0"></td>
              <td><input type="number" disabled class="add_total form-control" value="0"></td>
              <td><button onClick="$(this).parent().parent().remove();" class="btn btn-danger btn-md btn-flat" data-title="Delete"><i class="fa fa-times" aria-hidden="true"></i></button></td>
            </tr>
          <tr>
          </tr>';
        $htmlSelectProduct = str_replace("\n", '', $htmlSelectProduct);
        $htmlSelectProduct = str_replace("\t", '', $htmlSelectProduct);
        $htmlSelectProduct = str_replace("\r", '', $htmlSelectProduct);
@endphp
    </div>
  </div>
</div>
 </div>
@endsection

@section('breadcrumb')
    <div class="breadcrumbs not-print">
        <ol class="breadcrumb">
          <li><a href="{{ route('home') }}">Home</a></li>
          <li class="active">{{ $title }}</li>
        </ol>
      </div>
@endsection

@push('styles')
<style type="text/css">
.history{
  max-height: 50px;
  max-width: 300px;
  overflow-y: auto;
}
.td-title{
  width: 35%;
  font-weight: bold;
}
.td-title-normal{
  width: 35%;
}
.product_qty{
  width: 80px;
  text-align: right;
}
.product_price,.product_total{
  width: 120px;
  text-align: right;
}

.box {
  position: relative;
  border-radius: 3px;
  background: #ffffff;
  border-top: 3px solid #d2d6de;
  margin-bottom: 20px;
  width: 100%;
  box-shadow: 0 1px 1px rgba(0,0,0,0.1);
}

.box-header {
  color: #444;
  display: block;
  padding: 10px;
  position: relative;
}

.box-header .box-title {
  display: inline-block;
  font-size: 18px;
  margin: 0;
  line-height: 1;
}

.box-header>.box-tools {
  position: absolute;
  right: 10px;
  top: 5px;
}

</style>
<!-- Ediable -->
<link rel="stylesheet" href="{{ asset('admin/plugin/bootstrap-editable.css')}}">
<!-- Select2 -->
<link rel="stylesheet" href="{{ asset('admin/AdminLTE/bower_components/select2/dist/css/select2.min.css')}}">
@endpush

@push('scripts')
{{-- //Pjax --}}
<script src="{{ asset('admin/plugin/jquery.pjax.js')}}"></script>

{{-- sweetalert --}}
<script src="{{ asset('admin/plugin/sweetalert2.all.min.js')}}"></script>

<!-- Ediable -->
<script src="{{ asset('admin/plugin/bootstrap-editable.min.js')}}"></script>

<!-- Select2 -->
<script src="{{ asset('admin/AdminLTE/bower_components/select2/dist/js/select2.full.min.js')}}"></script>

<script type="text/javascript">

$(document).ready(function() {
//Initialize Select2 Elements
$('.select2').select2();
});

function update_total(e){
    node = e.closest('tr');
    var qty = node.find('.add_qty').eq(0).val();
    var price = node.find('.add_price').eq(0).val();
    node.find('.add_total').eq(0).val(qty*price);
}

$(document).ready(function() {
  all_editable();
});

function all_editable(){
    $.fn.editable.defaults.params = function (params) {
        params._token = "{{ csrf_token() }}";
        return params;
    };

    $('.updateInfo').editable({});

    $(".updatePrice").on("shown", function(e, editable) {
      var value = $(this).text().replace(/,/g, "");
      editable.input.$input.val(parseInt(value));
    });
    $('.updateStatus').editable({
        validate: function(value) {
            if (value == '') {
                return '{{  trans('language.admin.not_empty') }}';
            }
        }
    });

    $('.updateInfoRequired').editable({
        validate: function(value) {
            if (value == '') {
                return '{{  trans('language.admin.not_empty') }}';
            }
        }
    });
    
    $('.updateStatus').editable({
        validate: function(value) {
            if (value == '') {
                return '{{  trans('language.admin.not_empty') }}';
            }
        }
    });
}

{{-- sweetalert2 --}}
function deleteItem(id){
  const swalWithBootstrapButtons = Swal.mixin({
    customClass: {
      confirmButton: 'btn btn-success',
      cancelButton: 'btn btn-danger'
    },
    buttonsStyling: true,
  })

  swalWithBootstrapButtons.fire({
    title: 'Are you sure to delete this item ?',
    text: "",
    type: 'warning',
    showCancelButton: true,
    confirmButtonText: 'Yes, delete it!',
    confirmButtonColor: "#DD6B55",
    cancelButtonText: 'No, cancel!',
    reverseButtons: true,

    preConfirm: function() {
        return new Promise(function(resolve) {
            $.ajax({
                method: 'post',
                url: '{{ route("order.delete_item") }}',
                data: {
                  'pId':id,
                    _token: '{{ csrf_token() }}',
                },
                success: function (data) {
                  location.reload();
                }
            });
        });
    }

  }).then((result) => {
    if (result.value) {
      swalWithBootstrapButtons.fire(
        'Deleted!',
        'Item has been deleted.',
        'success'
      )
    } else if (
      // Read more about handling dismissals
      result.dismiss === Swal.DismissReason.cancel
    ) {
      // swalWithBootstrapButtons.fire(
      //   'Cancelled',
      //   'Your imaginary file is safe :)',
      //   'error'
      // )
    }
  })
}
{{--/ sweetalert2 --}}


  $(document).ready(function(){
  // does current browser support PJAX
    if ($.support.pjax) {
      $.pjax.defaults.timeout = 2000; // time in milliseconds
    }

  });

    function order_print(){
      $('.not-print').hide();
      window.print();
      $('.not-print').show();
    }

</script>

@endpush
