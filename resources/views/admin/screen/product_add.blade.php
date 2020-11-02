@extends('admin.layout')

@section('main')
<style>
    #start-add{
        margin: 20px;
    }

.select-product{
    margin: 10px 0;
}
</style>

<section>

    <div class="row">
        <div class="col-md-12">
           <div class="box">
              <div class="box-header with-border">
                  <h2 class="box-title">{{ $title_description??'' }}</h2>
                  <div class="box-tools">
                      <div class="btn-group pull-right" style="margin-right: 5px">
                          <a href="{{ route('admin_product.index') }}" class="btn  btn-flat btn-default" title="List"><i class="fa fa-list"></i><span class="hidden-xs"> {{trans('admin.back_list')}}</span></a>
                      </div>
                  </div>
              </div>
              <!-- /.box-header -->

            <hr>

         <!-- form start -->
             <form action="{{ route('admin_product.create') }}" method="post" name="form_name" accept-charset="UTF-8" class="form-horizontal" id="form-main"  enctype="multipart/form-data">

                    <div class="box-body" id="main-add">
                        <div class="fields-group">

{{-- descriptions --}}
@foreach ($languages as $code => $language)

                            {{-- <div class="form-group ">
                                <label class="col-sm-2 control-label"></label>
                                <div class="col-sm-10">
                                    <b>{{ $language->name }}</b>
                                    {!! sc_image_render($language->icon,'20px','20px') !!}
                                </div>
                            </div> --}}

                            <div class="form-group {{ $errors->has('descriptions.'.$code.'.name') ? ' has-error' : '' }}">
                                <label for="{{ $code }}__name" class="col-sm-2 asterisk control-label">{{ trans('product.name') }}</label>
                                <div class="col-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-pencil fa-fw"></i></span>
                                        <input type="text" id="{{ $code }}__name" name="descriptions[{{ $code }}][name]" value="{!! old('descriptions.'.$code.'.name') !!}" class="form-control input-sm {{ $code.'__name' }}" placeholder="" />
                                    </div>
                                        @if ($errors->has('descriptions.'.$code.'.name'))
                                            <span class="help-block">
                                                <i class="fa fa-info-circle"></i> {{ $errors->first('descriptions.'.$code.'.name') }}
                                            </span>
                                        @endif
                                </div>
                            </div>

                            <div class="form-group kind kind0  {{ $errors->has('descriptions.'.$code.'.content') ? ' has-error' : '' }}">
                                <label for="{{ $code }}__content" class="col-sm-2 asterisk control-label">{{ trans('product.content') }}</label>
                                <div class="col-sm-10">
                                    <textarea  id="{{ $code }}__content" class="editor" name="descriptions[{{ $code }}][content]">
                                        {!! old('descriptions.'.$code.'.content') !!}
                                    </textarea>
                                    @if ($errors->has('descriptions.'.$code.'.content'))
                                        <span class="help-block">
                                            <i class="fa fa-info-circle"></i> {{ $errors->first('descriptions.'.$code.'.content') }}
                                        </span>
                                    @endif
                                </div>
                            </div>

@endforeach
{{-- //descriptions --}}


{{-- select category --}}
                            <div class="form-group  kind kind0 kind1 {{ $errors->has('category') ? ' has-error' : '' }}">
                                <hr>
        @php
        $listCate = [];
            if(is_array(old('category'))){
                foreach(old('category') as $value){
                    $listCate[] = (int)$value;
                }
            }
        @endphp
                                <label for="category" class="col-sm-2 asterisk control-label">{{ trans('product.admin.select_category') }}</label>
                                <div class="col-sm-10">
                                    <select class="form-control input-sm category select2"  multiple="multiple" data-placeholder="{{ trans('product.admin.select_category') }}" style="width: 100%;" name="category[]" >
                                        <option value=""></option>
                                        @foreach ($categories as $k => $v)
                                            <option value="{{ $k }}"  {{ (count($listCate) && in_array($k, $listCate))?'selected':'' }}>{{ $v }}</option>
                                        @endforeach
                                    </select>
                                        @if ($errors->has('category'))
                                            <span class="help-block">
                                                <i class="fa fa-info-circle"></i> {{ $errors->first('category') }}
                                            </span>
                                        @endif
                                </div>
                            </div>
{{-- //select category --}}

{{-- images --}}
                            <div class="form-group  kind kind0 kind1 {{ $errors->has('image') ? ' has-error' : '' }}">
                                <label for="image" class="col-sm-2 asterisk control-label">{{ trans('product.image') }}</label>
                                <div class="col-sm-10">
                                    <div class="input-group">
                                        <input type="text" id="image" name="image" value="{!! old('image') !!}" class="form-control input-sm image" placeholder=""  />
                                       <span class="input-group-btn">
                                         <a data-input="image" data-preview="preview_image" data-type="product" class="btn btn-sm btn-flat btn-primary lfm">
                                           <i class="fa fa-picture-o"></i> {{trans('product.admin.choose_image')}}
                                         </a>
                                       </span>
                                    </div>
                                        @if ($errors->has('image'))
                                            <span class="help-block">
                                                <i class="fa fa-info-circle"></i> {{ $errors->first('image') }}
                                            </span>
                                        @endif
                                    <div id="preview_image" class="img_holder"><img src="{{ old('image') }}"></div>

                        @if (!empty(old('sub_image')))
                            @foreach (old('sub_image') as $key => $sub_image)
                                @if ($sub_image)
                                <div class="group-image">
                                    <div class="input-group"><input type="text" id="sub_image_{{ $key }}" name="sub_image[]" value="{!! $sub_image !!}" class="form-control input-sm sub_image" placeholder=""  /><span class="input-group-btn"><span><a data-input="sub_image_{{ $key }}" data-preview="preview_sub_image_{{ $key }}" data-type="product" class="btn btn-sm btn-flat btn-primary lfm"><i class="fa fa-picture-o"></i> {{trans('product.admin.choose_image')}}</a></span><span title="Remove" class="btn btn-flat btn-sm btn-danger removeImage"><i class="fa fa-times"></i></span></span></div>
                                    <div id="preview_sub_image_{{ $key }}" class="img_holder"><img src="{{ $sub_image }}"></div>
                                </div>

                                @endif
                            @endforeach
                        @endif

                                    <button type="button" id="add_sub_image" class="btn btn-flat btn-success">
                                        <i class="fa fa-plus" aria-hidden="true"></i> {{ trans('product.admin.add_sub_image') }}
                                    </button>
                                </div>

                            </div>
{{-- //images --}}

{{-- sku --}}
                            <div class="form-group  kind kind0 kind1 kind2 {{ $errors->has('sku') ? ' has-error' : '' }}">
                                <label for="sku" class="col-sm-2 asterisk control-label">{{ trans('product.sku') }}</label>
                                <div class="col-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-pencil fa-fw"></i></span>
                                        <input type="text" style="width: 100px;"  id="sku" name="sku" value="{!! old('sku')??'' !!}" class="form-control input-sm sku" placeholder="" />
                                    </div>
                                        @if ($errors->has('sku'))
                                            <span class="help-block">
                                                <i class="fa fa-info-circle"></i> {{ $errors->first('sku') }}
                                            </span>
                                        @else
                                            <span class="help-block">
                                                {{ trans('product.sku_validate') }}
                                            </span>
                                        @endif
                                </div>
                            </div>
{{-- //sku --}}

{{-- select brand --}}
                            {{-- <div class="form-group  kind kind0 kind1  {{ $errors->has('brand_id') ? ' has-error' : '' }}">
                                <label for="brand_id" class="col-sm-2 asterisk control-label">{{ trans('product.brand') }}</label>
                                <div class="col-sm-10">
                                    <select class="form-control input-sm brand_id select2" style="width: 100%;" name="brand_id" >
                                        <option value=""></option>
                                        @foreach ($brands as $k => $v)
                                            <option value="{{ $k }}" {{ (old('brand_id') ==$k) ? 'selected':'' }}>{{ $v->name }}</option>
                                        @endforeach
                                    </select>
                                        @if ($errors->has('brand_id'))
                                            <span class="help-block">
                                                <i class="fa fa-info-circle"></i> {{ $errors->first('brand_id') }}
                                            </span>
                                        @endif
                                </div>
                            </div> --}}
{{-- //select brand --}}

{{-- select vendor --}}
                            <div class="form-group  kind kind0 kind1  {{ $errors->has('vendor_id') ? ' has-error' : '' }}">
                                <label for="vendor_id" class="col-sm-2 asterisk control-label">{{ trans('product.shop') }}</label>
                                <div class="col-sm-10">
                                    <select class="form-control input-sm vendor_id select2" style="width: 100%;" name="vendor_id" >
                                        <option value=""></option>
                                        @foreach ($vendors as $k => $v)
                                            <option value="{{ $k }}" {{ (old('vendor_id') ==$k) ? 'selected':'' }}>{{ $v->name }}</option>
                                        @endforeach
                                    </select>
                                        @if ($errors->has('vendor_id'))
                                            <span class="help-block">
                                                <i class="fa fa-info-circle"></i> {{ $errors->first('vendor_id') }}
                                            </span>
                                        @endif
                                </div>
                            </div>
{{--// select vendor --}}

{{-- price --}}
                            <div class="form-group  kind kind0 kind1  {{ $errors->has('price') ? ' has-error' : '' }}">
                                <label for="price" class="col-sm-2  control-label">{{ trans('product.price') }}</label>
                                <div class="col-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-pencil fa-fw"></i></span>
                                        <input type="number" style="width: 100px;"  id="price" name="price" value="{!! old('price')??0 !!}" class="form-control input-sm price" placeholder="" />
                                    </div>
                                        @if ($errors->has('price'))
                                            <span class="help-block">
                                                <i class="fa fa-info-circle"></i> {{ $errors->first('price') }}
                                            </span>
                                        @endif
                                </div>
                            </div>
{{-- //price --}}

{{-- price promotion --}}
                            <div class="form-group  kind kind0 kind1">
                                <label for="price" class="col-sm-2  control-label">{{ trans('product.price_promotion') }}</label>
                                <div class="col-sm-10">
    @if (old('price_promotion'))
                                <div class="price_promotion">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-pencil fa-fw"></i></span>
                                        <input type="number" style="width: 100px;"  id="price_promotion" name="price_promotion" value="{!! old('price_promotion')??0 !!}" class="form-control input-sm price" placeholder="" />
                                        <span title="Remove" class="btn btn-flat btn-sm btn-danger removePromotion"><i class="fa fa-times"></i></span>
                                    </div>

                                    <div class="form-inline">
                                      <div class="input-group">
                                        {{ trans('product.price_promotion_start') }}<br><div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw"></i></span>
                                        <input type="text" style="width: 100px;"  id="price_promotion_start" name="price_promotion_start" value="{!!old('price_promotion_start')!!}" class="form-control input-sm price_promotion_start date_time" placeholder="" />
                                        </div>
                                      </div>

                                      <div class="input-group">
                                        {{ trans('product.price_promotion_end') }}<br><div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-calendar fa-fw"></i></span>
                                        <input type="text" style="width: 100px;"  id="price_promotion_end" name="price_promotion_end" value="{!!old('price_promotion_end')!!}" class="form-control input-sm price_promotion_end date_time" placeholder="" />
                                        </div>
                                      </div>
                                    </div>
                                </div>
    @else
                                  <button type="button" id="add_product_promotion" class="btn btn-flat btn-success">
                                        <i class="fa fa-plus" aria-hidden="true"></i> {{ trans('product.admin.add_product_promotion') }}
                                    </button>
    @endif




                                </div>
                            </div>
{{-- //price promotion --}}

{{-- stock --}}
                            <div class="form-group  kind kind0  kind1 {{ $errors->has('stock') ? ' has-error' : '' }}">
                                <label for="stock" class="col-sm-2  control-label">{{ trans('product.stock') }}</label>
                                <div class="col-sm-8">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-pencil fa-fw"></i></span>
                                        <input type="number" style="width: 100px;"  id="stock" name="stock" value="{!! old('stock')??0 !!}" class="form-control input-sm stock" placeholder="" />
                                    </div>
                                        @if ($errors->has('stock'))
                                            <span class="help-block">
                                                <i class="fa fa-info-circle"></i> {{ $errors->first('stock') }}
                                            </span>
                                        @endif
                                </div>
                            </div>
{{-- //stock --}}

{{-- type --}}
                            <div class="form-group  kind kind0 kind1  {{ $errors->has('type') ? ' has-error' : '' }}">
                                <label for="type" class="col-sm-2  control-label">{{ trans('product.type') }}</label>
                                <div class="col-sm-8">
                                @foreach (  $types as $key => $type)
                                    <label class="radio-inline"><input type="radio" name="type" value="{{ $key }}"  {{ ((!old() && $key ==0) || old('type') == $key)?'checked':'' }}>{{ $type }}</label>
                                @endforeach
                                        @if ($errors->has('type'))
                                            <span class="help-block">
                                                <i class="fa fa-info-circle"></i> {{ $errors->first('type') }}
                                            </span>
                                        @endif
                                </div>
                            </div>
{{-- //type --}}

{{-- writer name --}}

                            <div class="form-group  kind kind0 kind1  {{ $errors->has('writer') ? ' has-error' : '' }}">
                            <label for="writer" class="col-sm-2 asterisk control-label">{{ trans('product.writer') }}</label>
                            <div class="col-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-pencil fa-fw"></i></span>
                                    <input type="text" id="writer" name="writer" value="{!! old('writer') !!}" class="form-control input-sm writer" placeholder="" />
                                </div>
                                    @if ($errors->has('writer'))
                                        <span class="help-block">
                                            <i class="fa fa-info-circle"></i> {{ $errors->first('writer') }}
                                        </span>
                                    @endif
                            </div>
                            </div>

{{-- //writer name --}}


{{-- Status --}}
<div class="form-group  ">
    <label for="status" class="col-sm-2  control-label">{{ trans('product.status') }}</label>
    <div class="col-sm-8">
       <input type="checkbox" name="status"  {{ old('status')}}>
    </div>
</div>

{{-- 
@if (!empty($attributeGroup))
                        <hr>

                        <div class="row">
                            <div class="col-sm-2">
                                <div class="form-group kind kind0">
                                    @foreach ($attributeGroup as $attGroupId => $attName)
                                    <b>{{ $attName }}:</b>
                                        
                                </div>
                            </div>

                            <div class="col-sm-10">
                                
                            <div class="form-group kind kind0">
                                    <table width="100%">
                                            @if (!empty(old('attribute')[$attGroupId]))
                                                @foreach (old('attribute')[$attGroupId] as $attValue)
                                                    @if ($attValue)
                                                        @php
                                                            $newHtml = str_replace('attribute_group', $attGroupId, $htmlProductAtrribute);
                                                            $newHtml = str_replace('attribute_value', $attValue, $newHtml);
                                                        @endphp
                                                        {!! $newHtml !!}
                                                    @endif
                                                @endforeach
                                            @endif
                                        <tr><td colspan="2"><button type="button" class="btn btn-flat btn-success add-attribute" data-id="{{ $attGroupId }}">
                                        <i class="fa fa-plus" aria-hidden="true"></i> {{ trans('product.admin.add_attribute') }}
                                    </button>
                                </td></tr>
                                    </table>
                                    @endforeach
                                </div>
                            </div>
                        </div>
@endif --}}
{{-- //end List product attributes --}}

                        </div>
                    </div>



                    <!-- /.box-body -->

                    <div class="box-footer kind kind0  kind1 kind2" id="box-footer">
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



@push('styles')
<!-- Select2 -->
<link rel="stylesheet" href="{{ asset('admin/AdminLTE/bower_components/select2/dist/css/select2.min.css')}}">

{{-- switch --}}
<link rel="stylesheet" href="{{ asset('admin/plugin/bootstrap-switch.min.css')}}">

{{-- input image --}}
{{-- <link rel="stylesheet" href="{{ asset('admin/plugin/fileinput.min.css')}}"> --}}

{{-- Date Picker --}}
<link rel="stylesheet" href="{{ asset('admin/AdminLTE/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css')}}">

{{-- Daterange picker --}}
<link rel="stylesheet" href="{{ asset('admin/AdminLTE/bower_components/bootstrap-daterangepicker/daterangepicker.css')}}">

@endpush

@push('scripts')

<!--ckeditor-->
<script src="{{ asset('packages/ckeditor/ckeditor.js') }}"></script>
<script src="{{ asset('packages/ckeditor/adapters/jquery.js') }}"></script>

<!-- Select2 -->
<script src="{{ asset('admin/AdminLTE/bower_components/select2/dist/js/select2.full.min.js')}}"></script>

{{-- input image --}}
{{-- <script src="{{ asset('admin/plugin/fileinput.min.js')}}"></script> --}}


{{-- switch --}}
<script src="{{ asset('admin/plugin/bootstrap-switch.min.js')}}"></script>

<!-- datepicker -->
<script src="{{ asset('admin/AdminLTE/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js')}}"></script>


<script type="text/javascript">
    $("[name='top'],[name='status']").bootstrapSwitch();
</script>

<script type="text/javascript">

// Promotion
$('#add_product_promotion').click(function(event) {
    $(this).before('<div class="price_promotion"><div class="input-group"><span class="input-group-addon"><i class="fa fa-pencil fa-fw"></i></span><input type="number" style="width: 100px;"  id="price_promotion" name="price_promotion" value="0" class="form-control input-sm price" placeholder="" /><span title="Remove" class="btn btn-flat btn-sm btn-danger removePromotion"><i class="fa fa-times"></i></span></div><div class="form-inline"><div class="input-group">{{ trans('product.price_promotion_start') }}<br><div class="input-group"><span class="input-group-addon"><i class="fa fa-calendar fa-fw"></i></span><input type="text" style="width: 100px;"  id="price_promotion_start" name="price_promotion_start" value="" class="form-control input-sm price_promotion_start date_time" placeholder="" /></div></div><div class="input-group">{{ trans('product.price_promotion_end') }}<br><div class="input-group"><span class="input-group-addon"><i class="fa fa-calendar fa-fw"></i></span><input type="text" style="width: 100px;"  id="price_promotion_end" name="price_promotion_end" value="" class="form-control input-sm price_promotion_end date_time" placeholder="" /></div></div></div></div>');
    $(this).hide();
    $('.removePromotion').click(function(event) {
        $(this).closest('.price_promotion').remove();
        $('#add_product_promotion').show();
    });
    $('.date_time').datepicker({
      autoclose: true,
      format: 'yyyy-mm-dd'
    })
});
$('.removePromotion').click(function(event) {
    $('#add_product_promotion').show();
    $(this).closest('.price_promotion').remove();
});
//End promotion

// Add sub images
var id_sub_image = {{ old('sub_image')?count(old('sub_image')):0 }};
$('#add_sub_image').click(function(event) {
    id_sub_image +=1;
    $(this).before('<div class="group-image"><div class="input-group"><input type="text" id="sub_image_'+id_sub_image+'" name="sub_image[]" value="" class="form-control input-sm sub_image" placeholder=""  /><span class="input-group-btn"><span><a data-input="sub_image_'+id_sub_image+'" data-preview="preview_sub_image_'+id_sub_image+'" data-type="product" class="btn btn-sm btn-flat btn-primary lfm"><i class="fa fa-picture-o"></i> {{trans('product.admin.choose_image')}}</a></span><span title="Remove" class="btn btn-flat btn-sm btn-danger removeImage"><i class="fa fa-times"></i></span></span></div><div id="preview_sub_image_'+id_sub_image+'" class="img_holder"></div></div>');
    $('.removeImage').click(function(event) {
        $(this).closest('div').remove();
    });
    $('.lfm').filemanager();
});
    $('.removeImage').click(function(event) {
        $(this).closest('.group-image').remove();
    });
//end sub images

// Select product in group
$('#add_product_in_group').click(function(event) {
    var htmlSelectGroup = `{!! $htmlSelectGroup !!}`;
    $(this).before(htmlSelectGroup);
    $('.select2').select2();
    $('.removeproductInGroup').click(function(event) {
        $(this).closest('table').remove();
    });
});
$('.removeproductInGroup').click(function(event) {
    $(this).closest('table').remove();
});
//end select in group

// Select product in build
$('#add_product_in_build').click(function(event) {
    var htmlSelectBuild = `{!! $htmlSelectBuild !!}`;
    $(this).before(htmlSelectBuild);
    $('.select2').select2();
    $('.removeproductBuild').click(function(event) {
        $(this).closest('table').remove();
    });
});
$('.removeproductBuild').click(function(event) {
    $(this).closest('table').remove();
});
//end select in build


// Select product attributes
$('.add-attribute').click(function(event) {
    var htmlProductAtrribute = '{!! $htmlProductAtrribute??'' !!}';
    var attGroup = $(this).attr("data-id");
    htmlProductAtrribute = htmlProductAtrribute.replace("attribute_group", attGroup);
    htmlProductAtrribute = htmlProductAtrribute.replace("attribute_value", "");
    $(this).closest('tr').before(htmlProductAtrribute);
    $('.removeAttribute').click(function(event) {
        $(this).closest('tr').remove();
    });
});
$('.removeAttribute').click(function(event) {
    $(this).closest('tr').remove();
});
//end select attributes

$(document).ready(function() {
    $('.select2').select2();
});
// image
// with plugin options
// $("input.image").fileinput({"browseLabel":"Browse","cancelLabel":"Cancel","showRemove":true,"showUpload":false,"dropZoneEnabled":false});

//Date picker
$('.date_time').datepicker({
  autoclose: true,
  format: 'yyyy-mm-dd'
})


$('textarea.editor').ckeditor(
    {
        filebrowserImageBrowseUrl: '/{{ config('lfm.url_prefix') }}?type=product',
        filebrowserImageUploadUrl: '/{{ config('lfm.url_prefix') }}/upload?type=product&_token={{csrf_token()}}',
        filebrowserBrowseUrl: '/{{ config('lfm.url_prefix') }}?type=Files',
        filebrowserUploadUrl: '/{{ config('lfm.url_prefix') }}/upload?type=file&_token={{csrf_token()}}',
        filebrowserWindowWidth: '900',
        filebrowserWindowHeight: '500'
    }
);

// @include('admin.component.script')


</script>

@endpush






</section>
@endsection

@section('breadcrumb')
    <div class="breadcrumbs">
        <ol class="breadcrumb">
          <li><a href="{{ route('home') }}">Home</a></li>
          <li class="active">{{ $title }}</li>
        </ol>
    </div>
@endsection