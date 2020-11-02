@extends('templates.'.sc_store('template').'.shop_layout')

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
<div class="container">

   <div class="row">
      <div class="col-md-12">
         <div class="box">
            <div class="row box-header with-border">
                <div class="col-md-offset-2  col-md-10">
                    <h4 class="box-title">Request a Book</h4>
                </div>
            </div>
            <!-- /.box-header -->

            <hr>

         <!-- form start -->
             <form action="{{ route('postBookRequest') }}" method="post" name="form_name" accept-charset="UTF-8" class="form-horizontal" id="form-main"  enctype="multipart/form-data">

                    <div class="box-body" id="main-add">
                        <div class="fields-group">

{{-- descriptions --}}
@foreach ($languages as $code => $language)

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

                            <div class="form-group {{ $errors->has('descriptions.'.$code.'.content') ? ' has-error' : '' }}">
                                <label for="{{ $code }}__content" class="col-sm-2 asterisk control-label">Contact Details</label>
                                <div class="col-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-pencil fa-fw"></i></span>
                                        <input type="text" id="{{ $code }}__content" name="descriptions[{{ $code }}][content]" value="{!! old('descriptions.'.$code.'.content') !!}" class="form-control input-sm {{ $code.'__content' }}" placeholder="" />
                                    </div>
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
                            {{-- <div class="form-group  kind kind0 kind1 {{ $errors->has('image') ? ' has-error' : '' }}">
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

                            </div> --}}
{{-- //images --}}

{{-- price --}}
                            {{-- <div class="form-group  kind kind0 kind1  {{ $errors->has('price') ? ' has-error' : '' }}">
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
                            </div> --}}
{{-- //price --}}

{{-- stock --}}
{{-- <div class="form-group  kind kind0  kind1 {{ $errors->has('stock') ? ' has-error' : '' }}">
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
</div> --}}
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

// // Select product in group
// $('#add_product_in_group').click(function(event) {
//     var htmlSelectGroup = '{!! $htmlSelectGroup !!}';
//     $(this).before(htmlSelectGroup);
//     $('.select2').select2();
//     $('.removeproductInGroup').click(function(event) {
//         $(this).closest('table').remove();
//     });
// });
// $('.removeproductInGroup').click(function(event) {
//     $(this).closest('table').remove();
// });
// //end select in group

// // Select product in build
// $('#add_product_in_build').click(function(event) {
//     var htmlSelectBuild = '{!! $htmlSelectBuild !!}';
//     $(this).before(htmlSelectBuild);
//     $('.select2').select2();
//     $('.removeproductBuild').click(function(event) {
//         $(this).closest('table').remove();
//     });
// });
// $('.removeproductBuild').click(function(event) {
//     $(this).closest('table').remove();
// });
// //end select in build


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
          <li class="active">Request a Book</li>
        </ol>
    </div>
@endsection