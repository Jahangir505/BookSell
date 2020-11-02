@extends('templates.'.sc_store('template').'.shop_layout')

@section('main')
<section >
<div class="container">
    <div class="row">
        <h2 class="title text-center">{{ trans('account.my_profile') }}</h2>

<div class="col-sm-3">
    <h4>Account</h4>
    <nav class="sidebar ui-nav-stack my-nav">
        <ul class="nav">
            <li class="nav-item ui-nav-item">
                <a class="nav-link" href="#en/my/dashboard">
                    My account
                    <span class="glyphicon glyphicon-chevron-right" style="float: right;"></span>
                </a>
                <div class="collapse show" id="ui-basic" style="">
                        <ul class="nav flex-column sub-menu">
                          <li class="nav-item"> <a class="nav-link active" href="../../pages/ui-features/buttons.html">Buttons</a></li>
                          <li class="nav-item"> <a class="nav-link" href="../../pages/ui-features/typography.html">Typography</a></li>
                        </ul>
                      </div>
            </li>
            <li class="nav-item ui-nav-item">
                <a class="nav-link" href="/en/my/membership">
                    Settings
                    <span class="glyphicon glyphicon-chevron-right" style="float: right;"></span>
                </a> 
            </li>
            <ul class="nav-item ui-nav-item">
                <li class="nav-item ui-nav-item"> <a class="nav-link" href="{{ route('seller.change_password') }}"><span class="glyphicon glyphicon-forward"></span> {{ trans('account.change_password') }}</a></li>
                <li class="nav-item ui-nav-item"> <a class="nav-link" href="{{ route('seller.change_infomation') }}"><span class="glyphicon glyphicon-forward"></span> {{ trans('account.change_infomation') }}</a></li>
                <li class="nav-item ui-nav-item"> <a class="nav-link" href="{{ route('product.index') }}"><span class="glyphicon glyphicon-forward"></span> {{ trans('account.product_list') }}</a></li>
                <li class="nav-item ui-nav-item"> <a class="nav-link" href="{{ route('shop.index') }}"><span class="glyphicon glyphicon-forward"></span> {{ trans('account.shop_list') }}</a></li>
            </ul>
        </ul>
    </nav>
    


    </div>
</div>
    <hr class="ui-divider sm-panel-wide xs-panel-wide is-s"></div>

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
