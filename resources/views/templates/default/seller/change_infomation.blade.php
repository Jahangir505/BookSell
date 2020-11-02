@extends('templates.'.sc_store('template').'.shop_layout')

@section('main')
<div class="container">
    <div class="row justify-content-center">
            @include('templates.'.sc_store('template').'.seller.seller_left_menu')
            <div class="col-md-9">
            <div class="card">

                <div class="card-body">
                    <form method="POST" action="{{ route('seller.post_change_infomation') }}">
                        @csrf

                        <div class="form-group row {{ $errors->has('name') ? ' has-error' : '' }}">
                            <label for="name" class="col-md-4 col-form-label text-md-right">{{ trans('account.name') }}</label>

                            <div class="col-md-6">
                                <input id="name" type="text" class="form-control" name="name" required value="{{ (old('name'))?old('name'):$dataUser['name']}}">

                                @if($errors->has('name'))
                                    <span class="help-block">{{ $errors->first('name') }}</span>
                                @endif

                            </div>
                        </div>
 
                        <div class="form-group row {{ $errors->has('phone') ? ' has-error' : '' }}">
                            <label for="phone" class="col-md-4 col-form-label text-md-right">{{ trans('account.phone') }}</label>

                            <div class="col-md-6">
                                <input id="phone" type="text" class="form-control" name="phone" required value="{{ (old('phone'))?old('phone'):$dataUser['phone']}}">

                                @if($errors->has('phone'))
                                    <span class="help-block">{{ $errors->first('phone') }}</span>
                                @endif

                            </div>
                        </div>

                       <div class="form-group row {{ $errors->has('email') ? ' has-error' : '' }}">
                            <label for="email" class="col-md-4 col-form-label text-md-right">{{ trans('account.email') }}</label>

                            <div class="col-md-6">
                              {{ $dataUser['email'] }}

                            </div>
                        </div>


                       <div class="form-group row {{ $errors->has('address') ? ' has-error' : '' }}">
                            <label for="address" class="col-md-4 col-form-label text-md-right">{{ trans('account.address') }}</label>

                            <div class="col-md-6">
                                <input id="address" type="text" class="form-control" name="address" required value="{{ (old('address'))?old('address'):$dataUser['address']}}">

                                @if($errors->has('address'))
                                    <span class="help-block">{{ $errors->first('address') }}</span>
                                @endif

                            </div>
                        </div>

                        @php
                            $district = (old('district'))?old('district'):$dataUser['district'];
                        @endphp

                        <div class="form-group row {{ $errors->has('district') ? ' has-error' : '' }}">
                                <label for="district" class="col-md-4 col-form-label text-md-right">{{ trans('account.district') }}</label>
                                <div class="col-md-6">
                                <select class="is_required validate account_input form-control district" style="width: 100%;" name="district" >
                                    <option value=""></option>
                                    @foreach ($districts as $k => $v)
                                        <option value="{{ $k }}" {{ ($district ==$k) ? 'selected':'' }}>{{ $v }}</option>
                                    @endforeach
                                </select>
                                    @if ($errors->has('district'))
                                        <span class="help-block">
                                            {{ $errors->first('district') }}
                                        </span>
                                    @endif
                                </div>
                        </div>

                        <div class="form-group row mb-0">
                            <div class="col-md-6 offset-md-4">
                                <button type="submit" class="btn btn-primary">
                                    {{ trans('account.update_infomation') }}
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
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
