@extends('templates.'.sc_store('template').'.shop_layout')

@section('main')

    <section id="form-login"><!--form-->
        <div class="container">
            <div class="row">
                <div class="col-sm-8 col-sm-offset-2">
                    @if ($message = Session::get('successMessage'))
                    <div class="alert alert-success alert-block">
                        <button type="button" class="close" data-dismiss="alert">×</button>	
                            <strong>{{ $message }}</strong>
                    </div>
                    @elseif ($message = Session::get('failedMessage'))
                    <div class="alert alert-danger alert-block">
                        <button type="button" class="close" data-dismiss="alert">×</button>	
                            <strong>{{ $message }}</strong>
                    </div>
                    @endif
                </div>
            </div>

            <div class="row">
                <h2 class="title text-center"><span>{{ $title }}</span></h2>
                <div class="col-sm-4">
                    <div class="login-form"><!--login form-->
                        <h2>{{ trans('account.title_login') }}</h2>
                        <form action="{{ route('postSellerLogin') }}" method="post"  class="box">
                            {!! csrf_field() !!}
                            <div class="form-group{{ $errors->has('email') ? ' has-error' : '' }}">
                                <label for="email" class="control-label">{{ trans('account.email') }}</label>
                                    <input class="is_required validate account_input form-control {{ ($errors->has('email'))?"input-error":"" }}"   type="text" name="email" placeholder="{{ trans('account.email') }}" value="{{ old('email') }}" >
                                        @if ($errors->has('email'))
                                            <span class="help-block">
                                                {{ $errors->first('email') }}
                                            </span>
                                        @endif

                            </div>
                            <div class="form-group{{ $errors->has('password') ? ' has-error' : '' }}">
                                <label for="password" class="control-label">{{ trans('account.password') }}</label>
                                    <input class="is_required validate account_input form-control {{ ($errors->has('password'))?"input-error":"" }}" type="password" name="password" placeholder="{{ trans('account.password') }}" value="" >
                                        @if ($errors->has('password'))
                                            <span class="help-block">
                                                {{ $errors->first('password') }}
                                            </span>
                                        @endif

                            </div>
                        <p class="lost_password form-group">
                            <a class="btn btn-link" href="{{ route('forgot') }}">
                                {{ trans('account.password_forgot') }}
                            </a>
                            <br>
                        </p>
                            <button type="submit" name="SubmitLogin" class="btn btn-default">{{ trans('account.login') }}</button>
                        </form>
                    </div><!--/login form-->
                </div>
                <div class="col-sm-1">
                    <h2 class="or">OR</h2>
                </div>
                <div class="col-sm-7">
                    <div class="signup-form"><!--sign up form-->
                        <h2>{{ trans('account.title_seller_register') }}</h2>
                        <form action="{{route('postSellerRegister')}}" method="post"  class="box">
                            {!! csrf_field() !!}
                <div class="row form_content {{ (old('check_red'))?'in':'' }}" id="collapseExample">

                    <div class="col-sm-12">
                        <p><strong>Personal Information</strong></p>
                    </div>

                    <div class="col-sm-12 form-group{{ $errors->has('reg_full_name') ? ' has-error' : '' }}">
                        <input  type="text" class="is_required validate account_input form-control {{ ($errors->has('reg_full_name'))?"input-error":"" }}"   name="reg_full_name" placeholder="{{ trans('account.full_name') }}" value="{{ old('reg_full_name') }}">
                        @if ($errors->has('reg_full_name'))
                        <span class="help-block">
                            {{ $errors->first('reg_full_name') }}
                        </span>
                        @endif
                    </div>

                    <div class="col-sm-6 form-group{{ $errors->has('reg_email') ? ' has-error' : '' }}">
                        <input  type="text" class="is_required validate account_input form-control {{ ($errors->has('reg_email'))?"input-error":"" }}"   name="reg_email" placeholder="{{ trans('account.email') }}" value="{{ old('reg_email') }}">
                        @if ($errors->has('reg_email'))
                        <span class="help-block">
                            {{ $errors->first('reg_email') }}
                        </span>
                        @endif
                    </div>

                    <div class="col-sm-6 form-group{{ $errors->has('reg_phone') ? ' has-error' : '' }}">
                        <input  type="text" class="is_required validate account_input form-control {{ ($errors->has('reg_phone'))?"input-error":"" }}"   name="reg_phone" placeholder="{{ trans('account.phone') }}" value="{{ old('reg_phone') }}">
                        @if ($errors->has('reg_phone'))
                        <span class="help-block">
                            {{ $errors->first('reg_phone') }}
                        </span>
                        @endif
                    </div>

                    <div class="col-sm-12">
                        <p><strong>Address Information</strong></p>
                    </div>

                    <div class="col-sm-6 form-group{{ $errors->has('reg_address') ? ' has-error' : '' }}">
                        <input  type="text" class="is_required validate account_input form-control {{ ($errors->has('reg_address'))?"input-error":"" }}"   name="reg_address" placeholder="{{ trans('account.address') }}" value="{{ old('reg_address') }}">
                        @if ($errors->has('reg_address'))
                        <span class="help-block">
                            {{ $errors->first('reg_address') }}
                        </span>
                        @endif
                    </div>

                    <div class="col-sm-6 form-group  {{ $errors->has('reg_district') ? ' has-error' : '' }}">
                        <select class="is_required validate account_input form-control reg_district" style="width: 100%;" name="reg_district" id="country">
                            <option value="">Please Select District</option>
                            @foreach ($districts as $k => $v)
                                <option value="{{ $k }}" {{ (old('reg_district') ==$k) ? 'selected':'' }}>{{ $v }}</option>
                            @endforeach
                        </select>
                            @if ($errors->has('reg_district'))
                                <span class="help-block">
                                    {{ $errors->first('reg_district') }}
                                </span>
                            @endif
                    </div>

                    <div class="col-sm-12">
                        <p><strong>Login Information</strong></p>
                    </div>

                    <div class="col-sm-6 form-group{{ $errors->has('reg_password') ? ' has-error' : '' }}">
                        <input  type="password" class="is_required validate account_input form-control {{ ($errors->has('reg_password'))?"input-error":"" }}"   name="reg_password" placeholder="{{ trans('account.password') }}" value="">
                        @if ($errors->has('reg_password'))
                        <span class="help-block">
                            {{ $errors->first('reg_password') }}
                        </span>
                        @endif
                    </div>
                    <div class="col-sm-6 form-group{{ $errors->has('reg_password_confirmation') ? ' has-error' : '' }}">
                        <input type="password" class="is_required validate account_input form-control {{ ($errors->has('reg_password_confirmation'))?"input-error":"" }}"  placeholder="{{ trans('account.password_confirm') }}" name="reg_password_confirmation" value="">
                        @if ($errors->has('reg_password_confirmation'))
                        <span class="help-block">
                            {{ $errors->first('reg_password_confirmation') }}
                        </span>
                        @endif
                    </div>
                    <input type="hidden" name="check_red" value="1">
                    <input type="hidden" name="check_seller" value="1">
                    <div class="col-sm-6 submit">
                        <button type="submit" name="SubmitCreate" class="btn btn-default">{{ trans('account.signup') }}</button>
                    </div>
                </div>

                        </form>
                    </div><!--/sign up form-->
                </div>
            </div>
        </div>
    </section><!--/form-->
@endsection

@section('breadcrumb')
    <div class="breadcrumbs">
        <ol class="breadcrumb">
          <li><a href="{{ route('home') }}">Home</a></li>
          <li class="active">{{ $title }}</li>
        </ol>
      </div>
@endsection
