@extends('templates.'.sc_store('template').'.shop_layout')
@section('main')
<section>
    <div class="container">
        <div class="row profile">
            @include('templates.'.sc_store('template').'.seller.seller_left_menu')
            <div class="col-md-9">
                <div class="seller-profile">
                    <h3 class="welcome-message">Welcome to BookiMind, You can upload & sell your book here.</h3>

                    <h2 class="title text-center"><span>Quick Process</span></h2>

                    <div class="ui-panel is-rounded post-rules">
                        <div class="ui-panel-content ui-panel-block">
                            <p class="h4">All books posted on BookiMind.com must follow this process: </p>
                            <div class="row">
                                <ul class="col-12 lg-6">
                                    <li>First, You have to <a href="{{ route('shop.create') }}">create your shop</a>,
                                        then add your book under the shop.</li>
                                    <li>After creating your shop, admin will check it then approve it.</li>
                                    <li>Without approving your shop by admin you can not add your book here.</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <h2 class="title text-center"><span>Post Your Book</span></h2>
                    <div class="boxed-area">
                        <nav class="ui-nav-stack">
                            <ul class="nav">
                                <li class=""> <a class="nav-link" href="{{ route('shop.create') }}"><span
                                    class="glyphicon glyphicon-th-large"></span>
                                Create Shop</a></li>
                                <li class=""> <a class="nav-link" href="{{ route('product.create') }}"><span
                                            class="glyphicon glyphicon-th"></span>
                                        Create Product</a></li>
                                <li class=""> <a class="nav-link" href="{{ route('order.index') }}"><span
                                    class="glyphicon glyphicon-shopping-cart"></span>
                                Your Order List</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
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