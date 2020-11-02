@extends('templates.'.sc_store('template').'.shop_layout')

@section('main')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-2">
        </div>
        <div class="col-md-8">
            <div class="card">

                <div class="card-body">
                    <form method="POST" action="{{ route('member.post_change_infomation') }}">
                        @csrf

                        <div class="form-group row {{ $errors->has('first_name') ? ' has-error' : '' }}">
                            <label for="first_name" class="col-md-4 col-form-label text-md-right">{{ trans('account.first_name') }}</label>

                            <div class="col-md-6">
                                <input id="first_name" type="text" class="form-control" name="first_name" required value="{{ (old('first_name'))?old('first_name'):$dataUser['first_name']}}">

                                @if($errors->has('first_name'))
                                    <span class="help-block">{{ $errors->first('first_name') }}</span>
                                @endif

                            </div>
                        </div>
                        <div class="form-group row {{ $errors->has('last_name') ? ' has-error' : '' }}">
                            <label for="last_name" class="col-md-4 col-form-label text-md-right">{{ trans('account.last_name') }}</label>

                            <div class="col-md-6">
                                <input id="last_name" type="text" class="form-control" name="last_name" required value="{{ (old('last_name'))?old('last_name'):$dataUser['last_name']}}">

                                @if($errors->has('last_name'))
                                    <span class="help-block">{{ $errors->first('last_name') }}</span>
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

                    @php
                        $upazila = (old('upazila'))?old('upazila'):$dataUser['upazila'];
                    @endphp

                    <div class="form-group row {{ $errors->has('upazila') ? ' has-error' : '' }}">
                            <label for="upazila" class="col-md-4 col-form-label text-md-right">{{ trans('account.upazila') }}</label>
                            <div class="col-md-6">
                            <select class="is_required validate account_input form-control upazila" style="width: 100%;" name="upazila" >
                                <option value=""></option>
                                @foreach ($upazilas as $k => $v)
                                    <option value="{{ $k }}" {{ ($upazila ==$k) ? 'selected':'' }}>{{ $v }}</option>
                                @endforeach
                            </select>
                                @if ($errors->has('upazila'))
                                    <span class="help-block">
                                        {{ $errors->first('upazila') }}
                                    </span>
                                @endif
                            </div>
                    </div>

                       <div class="form-group row {{ $errors->has('post') ? ' has-error' : '' }}">
                            <label for="post" class="col-md-4 col-form-label text-md-right">{{ trans('account.post') }}</label>
                            <div class="col-md-6">
                                <input id="post" type="text" class="form-control" name="post" required value="{{ (old('post'))?old('post'):$dataUser['post']}}">

                                @if($errors->has('post'))
                                    <span class="help-block">{{ $errors->first('post') }}</span>
                                @endif

                            </div>
                        </div>
                    @php
                        $country = (old('country'))?old('country'):$dataUser['country'];
                    @endphp

                    <div class="form-group row {{ $errors->has('country') ? ' has-error' : '' }}">
                            <label for="country" class="col-md-4 col-form-label text-md-right">{{ trans('account.country') }}</label>
                            <div class="col-md-6">
                            <select class="form-control country" style="width: 100%;" name="country" >
                                <option value="BD">Bangladesh</option>
                                @foreach ($countries as $k => $v)
                                    <option value="{{ $k }}" {{ ($country ==$k) ? 'selected':'' }}>{{ $v }}</option>
                                @endforeach
                            </select>
                                @if ($errors->has('country'))
                                    <span class="help-block">
                                        {{ $errors->first('country') }}
                                    </span>
                                @endif
                            </div>
                    </div>

                    
                    <div class="form-group row {{ $errors->has('occupation') ? ' has-error' : '' }}">
                        <label for="occupation" class="col-md-4 col-form-label text-md-right">{{ trans('account.occupation') }}</label>

                        <div class="col-md-6">
                            <input id="occupation" type="text" class="form-control" name="occupation" value="{{ (old('occupation'))?old('occupation'):$dataUser['occupation']}}">

                            @if($errors->has('occupation'))
                                <span class="help-block">{{ $errors->first('occupation') }}</span>
                            @endif

                        </div>
                    </div>

                    <div class="form-group row {{ $errors->has('educational_institute') ? ' has-error' : '' }}">
                        <label for="educational_institute" class="col-md-4 col-form-label text-md-right">{{ trans('account.educational_institute') }}</label>

                        <div class="col-md-6">
                            <input id="educational_institute" type="text" class="form-control" name="educational_institute" value="{{ (old('educational_institute'))?old('educational_institute'):$dataUser['educational_institute']}}">

                            @if($errors->has('educational_institute'))
                                <span class="help-block">{{ $errors->first('educational_institute') }}</span>
                            @endif

                        </div>
                    </div>

                    <div class="form-group row {{ $errors->has('birthdate') ? ' has-error' : '' }}">
                        <label for="birthdate" class="col-md-4 col-form-label text-md-right">{{ trans('account.birthdate') }}</label>

                        <div class="col-md-6">
                            <input id="birthdate" type="date" class="form-control" name="birthdate" value="{{ (old('birthdate'))?old('birthdate'):$dataUser['birthdate']}}">

                            @if($errors->has('birthdate'))
                                <span class="help-block">{{ $errors->first('birthdate') }}</span>
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
