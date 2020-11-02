@extends('templates.'.sc_store('template').'.shop_layout')

@section('main')
<div class="container">

        <div class="row">
             @include('templates.'.sc_store('template').'.seller.seller_left_menu')
             <div class="col-md-9">
           <div class="col-md-12">
              <div class="box">
                 <div class="row box-header with-border">
                     <div class="col-md-6">
                    <h4 class="box-title">{{ $title_description??'' }}</h4>
                     </div>
                    <div class="col-md-6 box-tools">
                        <div class="btn-group pull-right" style="margin-right: 5px">
                            <a href="{{ route('shop.index') }}" class="btn  btn-flat btn-default" title="List"><i class="fa fa-list"></i><span class="hidden-xs"> {{trans('admin.back_list')}}</span></a>
                        </div>
                    </div>
                </div>
                <!-- /.box-header -->
                <hr>
                <!-- form start -->
                <form action="{{ $url_action }}" method="post" accept-charset="UTF-8" class="form-horizontal" id="form-main"  enctype="multipart/form-data">


                    <div class="box-body">
                        <div class="fields-group">


                    <div class="box-body">
                        <div class="fields-group">

                            <div class="form-group   {{ $errors->has('name') ? ' has-error' : '' }}">
                                <label for="name" class="col-sm-2  control-label">{{ trans('vendor.name') }}</label>
                                <div class="col-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-pencil fa-fw"></i></span>
                                        <input type="text" id="name" name="name" value="{!! old()?old('name'):$vendor['name']??'' !!}" class="form-control" placeholder="" />
                                    </div>
                                        @if ($errors->has('name'))
                                            <span class="help-block">
                                                {{ $errors->first('name') }}
                                            </span>
                                        @endif
                                </div>
                            </div>

                            <div class="form-group   {{ $errors->has('email') ? ' has-error' : '' }}">
                                <label for="email" class="col-sm-2  control-label">{{ trans('vendor.email') }}</label>
                                <div class="col-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-pencil fa-fw"></i></span>
                                        <input type="email" id="email" name="email" value="{!! old()?old('email'):$vendor['email']??'' !!}" class="form-control" placeholder="" />
                                    </div>
                                        @if ($errors->has('email'))
                                            <span class="help-block">
                                                {{ $errors->first('email') }}
                                            </span>
                                        @endif
                                </div>
                            </div>


                            <div class="form-group   {{ $errors->has('phone') ? ' has-error' : '' }}">
                                <label for="phone" class="col-sm-2  control-label">{{ trans('vendor.phone') }}</label>
                                <div class="col-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-pencil fa-fw"></i></span>
                                        <input type="text" id="phone" name="phone" value="{!! old()?old('phone'):$vendor['phone']??'' !!}" class="form-control" placeholder="" />
                                    </div>
                                        @if ($errors->has('phone'))
                                            <span class="help-block">
                                                {{ $errors->first('phone') }}
                                            </span>
                                        @endif
                                </div>
                            </div>


                            <div class="form-group   {{ $errors->has('url') ? ' has-error' : '' }}">
                                <label for="url" class="col-sm-2  control-label">{{ trans('vendor.url') }}</label>
                                <div class="col-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-pencil fa-fw"></i></span>
                                        <input type="text" id="url" name="url" value="{!! old()?old('url'):$vendor['url']??'' !!}" class="form-control" placeholder="" />
                                    </div>
                                        @if ($errors->has('url'))
                                            <span class="help-block">
                                                {{ $errors->first('url') }}
                                            </span>
                                        @endif
                                </div>
                            </div>



                            <div class="form-group   {{ $errors->has('address') ? ' has-error' : '' }}">
                                <label for="address" class="col-sm-2  control-label">{{ trans('vendor.address') }}</label>
                                <div class="col-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-pencil fa-fw"></i></span>
                                        <input type="text" id="address" name="address" value="{!! old()?old('address'):$vendor['address']??'' !!}" class="form-control" placeholder="" />
                                    </div>
                                        @if ($errors->has('address'))
                                            <span class="help-block">
                                                {{ $errors->first('address') }}
                                            </span>
                                        @endif
                                </div>
                            </div>


                            <div class="form-group   {{ $errors->has('image') ? ' has-error' : '' }}">
                                <label for="image" class="col-sm-2  control-label">{{ trans('vendor.image') }}</label>
                                <div class="col-sm-10">
                                    <div class="input-group">
                                        <input type="text" id="image" name="image" value="{!! old('image',$vendor['image']??'') !!}" class="form-control input-sm image" placeholder=""  />
                                       <span class="input-group-btn">
                                         <a data-input="image" data-preview="preview_image" data-type="vendor" class="btn btn-sm btn-primary lfm">
                                           <i class="fa fa-picture-o"></i> {{trans('product.admin.choose_image')}}
                                         </a>
                                       </span>
                                    </div>
                                        @if ($errors->has('image'))
                                            <span class="help-block">
                                                {{ $errors->first('image') }}
                                            </span>
                                        @endif
                                    <div id="preview_image" class="img_holder"><img src="{{ old('image',$vendor['image']??'') }}"></div>
                                </div>
                            </div>

                            <div class="form-group   {{ $errors->has('sort') ? ' has-error' : '' }}">
                                <label for="sort" class="col-sm-2  control-label">{{ trans('vendor.sort') }}</label>
                                <div class="col-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-pencil fa-fw"></i></span>
                                        <input type="number" style="width: 100px;" min = 0 id="sort" name="sort" value="{!! old()?old('sort'):$vendor['sort']??0 !!}" class="form-control sort" placeholder="" />
                                    </div>
                                        @if ($errors->has('sort'))
                                            <span class="help-block">
                                                {{ $errors->first('sort') }}
                                            </span>
                                        @endif
                                </div>
                            </div>


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
   </div>


@endsection


@section('breadcrumb')
    <div class="breadcrumbs">
        <ol class="breadcrumb">
          <li><a href="{{ route('home') }}">Home</a></li>
          <li class="active">{{ $title }}</li>
        </ol>
    </div>
@endsection

@push('styles')
<!-- Select2 -->
<link rel="stylesheet" href="{{ asset('admin/AdminLTE/bower_components/select2/dist/css/select2.min.css')}}">

{{-- switch --}}
<link rel="stylesheet" href="{{ asset('admin/plugin/bootstrap-switch.min.css')}}">

@endpush

@push('scripts')

<script src="{{ asset('packages/ckeditor/ckeditor.js') }}"></script>
<script src="{{ asset('packages/ckeditor/adapters/jquery.js') }}"></script>

<!-- Select2 -->
<script src="{{ asset('admin/AdminLTE/bower_components/select2/dist/js/select2.full.min.js')}}"></script>

{{-- switch --}}
<script src="{{ asset('admin/plugin/bootstrap-switch.min.js')}}"></script>

<script type="text/javascript">
    $("[name='top'],[name='status']").bootstrapSwitch();
</script>

<script type="text/javascript">

$(document).ready(function() {
    $('.select2').select2()
});



</script>

    @include('templates.default.seller.component.script')

@endpush
