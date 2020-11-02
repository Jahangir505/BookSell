@extends('admin.layout')

@section('main')
   <div class="row">
      <div class="col-md-12">
         <div class="box">
                <div class="box-header with-border">
                    <h2 class="box-title">{{ $title_description??'' }}</h2>

                    <div class="box-tools">
                        <div class="btn-group pull-right" style="margin-right: 5px">
                            <a href="{{ route('admin_order.index') }}" class="btn  btn-flat btn-default" title="List"><i class="fa fa-list"></i><span class="hidden-xs"> {{trans('admin.back_list')}}</span></a>
                        </div>
                    </div>
                </div>
                <!-- /.box-header -->
                <!-- form start -->
                <form action="{{ route('admin_order.create') }}" method="post" accept-charset="UTF-8" class="form-horizontal" id="form-main">

                    <div class="box-body">
                        <div class="fields-group">
                            <div class="form-group  {{ $errors->has('user_id') ? ' has-error' : '' }}">
                                <label for="user_id" class="col-sm-2 asterisk control-label">{{ trans('order.select_customer') }}</label>
                                <div class="col-sm-8">
                                    <select class="form-control user_id select2" style="width: 100%;" name="user_id" >
                                        <option value=""></option>
                                        @foreach ($users as $k => $v)
                                            <option value="{{ $k }}" {{ (old('user_id') ==$k) ? 'selected':'' }}>{{ $v->name.'<'.$v->email.'>' }}</option>
                                        @endforeach
                                    </select>
                                        @if ($errors->has('user_id'))
                                            <span class="help-block">
                                                {{ $errors->first('user_id') }}
                                            </span>
                                        @endif
                                </div>
                            </div>

                            <input type="hidden" name="email">

                            <div class="form-group   {{ $errors->has('first_name') ? ' has-error' : '' }}">
                                <label for="first_name" class="col-sm-2  control-label">{{ trans('order.shipping_first_name') }}</label>
                                <div class="col-sm-8">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-pencil fa-fw"></i></span>
                                        <input type="text" id="first_name" name="first_name" value="{!! old('first_name') !!}" class="form-control first_name" placeholder="" />
                                    </div>
                                        @if ($errors->has('first_name'))
                                            <span class="help-block">
                                                {{ $errors->first('first_name') }}
                                            </span>
                                        @endif
                                </div>
                            </div>

                            <div class="form-group   {{ $errors->has('last_name') ? ' has-error' : '' }}">
                                <label for="last_name" class="col-sm-2  control-label">{{ trans('order.shipping_last_name') }}</label>
                                <div class="col-sm-8">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-pencil fa-fw"></i></span>
                                        <input type="text" id="last_name" name="last_name" value="{!! old('last_name') !!}" class="form-control last_name" placeholder="" />
                                    </div>
                                        @if ($errors->has('last_name'))
                                            <span class="help-block">
                                                {{ $errors->first('last_name') }}
                                            </span>
                                        @endif
                                </div>
                            </div>

                            <div class="form-group   {{ $errors->has('address') ? ' has-error' : '' }}">
                                <label for="address" class="col-sm-2  control-label">{{ trans('order.shipping_address') }}</label>
                                <div class="col-sm-8">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-pencil fa-fw"></i></span>
                                        <input type="text" id="address" name="address" value="{!! old('address') !!}" class="form-control address" placeholder="" />
                                    </div>
                                    @if ($errors->has('address'))
                                        <span class="help-block">
                                            {{ $errors->first('address') }}
                                        </span>
                                    @endif
                                </div>
                            </div>

                            <div class="form-group  {{ $errors->has('district') ? ' has-error' : '' }}">
                                <label for="district" class="col-sm-2 asterisk control-label">{{ trans('order.district') }}</label>
                                <div class="col-sm-8">
                                    <select class="is_required validate account_input form-control district select2" style="width: 100%;" name="district" >
                                        <option value=""></option>
                                        @foreach ($districts as $k => $v)
                                            <option value="{{ $k }}" {{ (old('district') ==$k) ? 'selected':'' }}>{{ $v }}</option>
                                        @endforeach
                                    </select>
                                        @if ($errors->has('district'))
                                            <span class="help-block">
                                                {{ $errors->first('district') }}
                                            </span>
                                        @endif
                                </div>
                            </div>

                            <div class="form-group  {{ $errors->has('upazila') ? ' has-error' : '' }}">
                                <label for="upazila" class="col-sm-2 asterisk control-label">{{ trans('order.upazila') }}</label>
                                <div class="col-sm-8">
                                    <select class="is_required validate account_input form-control upazila select2" style="width: 100%;" name="upazila" >
                                        <option value=""></option>
                                        @foreach ($upazilas as $k => $v)
                                            <option value="{{ $k }}" {{ (old('upazila') ==$k) ? 'selected':'' }}>{{ $v }}</option>
                                        @endforeach
                                    </select>
                                        @if ($errors->has('upazila'))
                                            <span class="help-block">
                                                {{ $errors->first('upazila') }}
                                            </span>
                                        @endif
                                </div>
                            </div>

                            <div class="form-group   {{ $errors->has('post') ? ' has-error' : '' }}">
                                <label for="post" class="col-sm-2  control-label">{{ trans('order.shipping_post') }}</label>
                                <div class="col-sm-8">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-pencil fa-fw"></i></span>
                                        <input type="text" id="post" name="post" value="{!! old('post') !!}" class="form-control post" placeholder="" />
                                    </div>
                                        @if ($errors->has('post'))
                                            <span class="help-block">
                                                {{ $errors->first('post') }}
                                            </span>
                                        @endif
                                </div>
                            </div>

                            <div class="form-group  {{ $errors->has('country') ? ' has-error' : '' }}">
                                <label for="country" class="col-sm-2 asterisk control-label">{{ trans('order.country') }}</label>
                                <div class="col-sm-8">
                                    <select class="form-control country select2" style="width: 100%;" name="country" >
                                        <option value=""></option>
                                        @foreach ($countries as $k => $v)
                                            <option value="{{ $k }}" {{ (old('country') ==$k) ? 'selected':'' }}>{{ $v }}</option>
                                        @endforeach
                                    </select>
                                        @if ($errors->has('country'))
                                            <span class="help-block">
                                                {{ $errors->first('country') }}
                                            </span>
                                        @endif
                                </div>
                            </div>

                            {{-- <div class="form-group   {{ $errors->has('occupation') ? ' has-error' : '' }}">
                                <label for="occupation" class="col-sm-2  control-label">{{ trans('order.shipping_occupation') }}</label>
                                <div class="col-sm-8">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-pencil fa-fw"></i></span>
                                        <input type="text" id="occupation" name="occupation" value="{!! old('occupation') !!}" class="form-control occupation" placeholder="" />
                                    </div>
                                    @if ($errors->has('occupation'))
                                        <span class="help-block">
                                            {{ $errors->first('occupation') }}
                                        </span>
                                    @endif
                                </div>
                            </div> --}}

                            {{-- <div class="form-group   {{ $errors->has('educational_institute') ? ' has-error' : '' }}">
                                <label for="educational_institute" class="col-sm-2  control-label">{{ trans('order.shipping_educational_institute') }}</label>
                                <div class="col-sm-8">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-pencil fa-fw"></i></span>
                                        <input type="text" id="educational_institute" name="educational_institute" value="{!! old('educational_institute') !!}" class="form-control educational_institute" placeholder="" />
                                    </div>
                                    @if ($errors->has('educational_institute'))
                                        <span class="help-block">
                                            {{ $errors->first('educational_institute') }}
                                        </span>
                                    @endif
                                </div>
                            </div> --}}

                            {{-- <div class="form-group   {{ $errors->has('birthdate') ? ' has-error' : '' }}">
                                <label for="birthdate" class="col-sm-2  control-label">{{ trans('order.shipping_birthdate') }}</label>
                                <div class="col-sm-8">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-pencil fa-fw"></i></span>
                                        <input type="date" id="birthdate" name="birthdate" value="{!! old('birthdate') !!}" class="form-control birthdate" placeholder="" />
                                    </div>
                                    @if ($errors->has('birthdate'))
                                        <span class="help-block">
                                            {{ $errors->first('birthdate') }}
                                        </span>
                                    @endif
                                </div>
                            </div> --}}

                            <div class="form-group   {{ $errors->has('phone') ? ' has-error' : '' }}">
                                <label for="phone" class="col-sm-2  control-label">{{ trans('order.shipping_phone') }}</label>
                                <div class="col-sm-8">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-phone fa-fw"></i></span>
                                        <input style="width: 150px" type="text" id="phone" name="phone" value="{!! old('phone') !!}" class="form-control phone" placeholder="Input Phone" />
                                    </div>
                                        @if ($errors->has('phone'))
                                            <span class="help-block">
                                                {{ $errors->first('phone') }}
                                            </span>
                                        @endif
                                </div>
                            </div>

                            {{-- <div class="form-group   {{ $errors->has('currency') ? ' has-error' : '' }}">
                                <label for="currency" class="col-sm-2 asterisk control-label">{{ trans('order.currency') }}</label>
                                <div class="col-sm-8">
                                    <select class="form-control currency select2" style="width: 100%;" name="currency" >
                                        <option value=""></option>
                                      @foreach ($currencies as $k => $v)
                                            <option value="{{ $k }}" {{ (old('currency') ==$k) ? 'selected':'' }}>{{ $v}}</option>
                                        @endforeach
                                    </select>
                                        @if ($errors->has('currency'))
                                            <span class="help-block">
                                                {{ $errors->first('currency') }}
                                            </span>
                                        @endif
                                </div>
                            </div> --}}

                            {{-- <div class="form-group   {{ $errors->has('exchange_rate') ? ' has-error' : '' }}">
                                <label for="exchange_rate" class="col-sm-2  control-label">{{ trans('order.exchange_rate') }}</label>
                                <div class="col-sm-8">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-money fw" aria-hidden="true"></i></span>
                                        <input style="width: 150px" type="text" id="exchange_rate" name="exchange_rate" value="{!! old('exchange_rate') !!}" class="form-control exchange_rate" placeholder="Input Exchange rate" />
                                    </div>
                                        @if ($errors->has('exchange_rate'))
                                            <span class="help-block">
                                                {{ $errors->first('exchange_rate') }}
                                            </span>
                                        @endif
                                </div>
                            </div> --}}
                            <div class="form-group">
                                <label for="comment" class="col-sm-2  control-label">{{ trans('order.note') }}</label>
                                <div class="col-sm-8">
                                    <textarea name="comment" class="form-control comment" rows="5" placeholder="">{!! old('comment') !!}</textarea>
                                </div>
                            </div>

                            <div class="form-group   {{ $errors->has('payment_method') ? ' has-error' : '' }}">
                                <label for="payment_method" class="col-sm-2  control-label">{{ trans('order.payment_method') }}</label>
                                <div class="col-sm-8">
                                    <select class="form-control payment_method select2" style="width: 100%;" name="payment_method">
                                      @foreach ($paymentMethod as $k => $v)
                                            <option value="{{ $k }}" {{ (old('payment_method') ==$k) ? 'selected':'' }}>{{ sc_language_render($v)}}</option>
                                        @endforeach
                                    </select>
                                        @if ($errors->has('payment_method'))
                                            <span class="help-block">
                                                {{ $errors->first('payment_method') }}
                                            </span>
                                        @endif
                                </div>
                            </div>

                            {{-- <div class="form-group   {{ $errors->has('shipping_method') ? ' has-error' : '' }}">
                                <label for="shipping_method" class="col-sm-2  control-label">{{ trans('order.shipping_method') }}</label>
                                <div class="col-sm-8">
                                    <select class="form-control shipping_method select2" style="width: 100%;" name="shipping_method">
                                      @foreach ($shippingMethod as $k => $v)
                                            <option value="{{ $k }}" {{ (old('shipping_method') ==$k) ? 'selected':'' }}>{{ sc_language_render($v)}}</option>
                                        @endforeach
                                    </select>
                                        @if ($errors->has('shipping_method'))
                                            <span class="help-block">
                                                {{ $errors->first('shipping_method') }}
                                            </span>
                                        @endif
                                </div>
                            </div> --}}

                            <div class="form-group   {{ $errors->has('status') ? ' has-error' : '' }}">
                                <label for="status" class="col-sm-2  control-label">{{ trans('order.status') }}</label>
                                <div class="col-sm-8">
                                    <select class="form-control status select2" style="width: 100%;" name="status">
                                      @foreach ($orderStatus as $k => $v)
                                            <option value="{{ $k }}" {{ (old('status') ==$k) ? 'selected':'' }}>{{ $v}}</option>
                                        @endforeach
                                    </select>
                                        @if ($errors->has('status'))
                                            <span class="help-block">
                                                {{ $errors->first('status') }}
                                            </span>
                                        @endif
                                </div>
                            </div>

                            <hr>

                        </div>

                    </div>
                    <!-- /.box-body -->

                    <div class="box-footer">
                            @csrf
                        <div class="col-md-2">
                        </div>

                        <div class="col-md-8">
                            <div class="btn-group pull-right">
                                <button type="submit" class="btn btn-primary">{{ trans('admin.submit') }}</button>
                            </div>

                            <div class="btn-group pull-left">
                                <button type="reset" class="btn btn-warning">{{ trans('admin.reset') }}</button>
                            </div>
                        </div>
                    </div>

                    <!-- /.box-footer -->
                </form>
            </div>
        </div>
    </div>

@endsection

@push('styles')
<!-- Select2 -->
  <link rel="stylesheet" href="{{ asset('admin/AdminLTE/bower_components/select2/dist/css/select2.min.css')}}">
@endpush

@push('scripts')
<!-- Select2 -->
<script src="{{ asset('admin/AdminLTE/bower_components/select2/dist/js/select2.full.min.js')}}"></script>

<script type="text/javascript">

$(document).ready(function() {
//Initialize Select2 Elements
$('.select2').select2()
});
$('[name="user_id"]').change(function(){
    addInfo();
});
$('[name="currency"]').change(function(){
    addExchangeRate();
});

function addExchangeRate(){
    var currency = $('[name="currency"]').val();
    var jsonCurrency = {!!$currenciesRate !!};
    $('[name="exchange_rate"]').val(jsonCurrency[currency]);
}

function addInfo(){
    id = $('[name="user_id"]').val();
    if(id){
       $.ajax({
            url : '{{ route('admin_order.user_info') }}',
            type : "get",
            dateType:"application/json; charset=utf-8",
            data : {
                 id : id
            },
            beforeSend: function(){
                $('#loading').show();
            },
            success: function(result){
                var returnedData = JSON.parse(result);
                $('[name="first_name"]').val(returnedData.first_name);
                $('[name="last_name"]').val(returnedData.last_name);
                $('[name="address"]').val(returnedData.address);
                $('[name="district"]').val(returnedData.district);
                $('[name="upazila"]').val(returnedData.upazila);
                $('[name="post"]').val(returnedData.post);
                $('[name="phone"]').val(returnedData.phone);
                $('[name="country"]').val(returnedData.country).change();
                $('#loading').hide();
            }
        });
       }else{
            $('#form-main').reset();
       }

}

</script>
@endpush
