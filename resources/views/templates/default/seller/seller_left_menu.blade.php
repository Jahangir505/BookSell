
<div class="col-md-3 not-print">
    <div class="profile-sidebar">
        <!-- SIDEBAR USERPIC -->
        <div class="profile-userpic">
        <img src="{{ asset('data/avatar/seller-user.png') }}"
                class="img-responsive" alt="">
        </div>
        <!-- END SIDEBAR USERPIC -->
        <!-- SIDEBAR USER TITLE -->
        <div class="profile-usertitle">
            <div class="profile-usertitle-name">
                <a class="nav-link" href="{{ route('seller.index') }}">
                    {{ $user->user()->name }}
                </a>
            </div>
            <div class="profile-usertitle-job">
                {{ $user->user()->address }}
            </div>
            @include('templates.default.seller.component.notice')
        </div>
        <!-- END SIDEBAR USER TITLE -->
        <!-- SIDEBAR BUTTONS -->
        {{-- <div class="profile-userbuttons">
          <button type="button" class="btn btn-success btn-sm">Follow</button>
          <button type="button" class="btn btn-danger btn-sm">Message</button>
      </div> --}}
        <!-- END SIDEBAR BUTTONS -->
        <!-- SIDEBAR MENU -->

        <div class="profile-usermenu">
            {{-- <h2 class="title text-center">{{ trans('account.my_profile') }}</h2> --}}
            <div class="profile-usermenu">
                <h4>My Shop</h4>
                <ul class="nav">
                    <li class=""> <a class="nav-link" href="{{ route('order.index') }}"><span
                                class="glyphicon glyphicon-shopping-cart"></span>
                            {{ trans('account.order_list') }}</a></li>
                    <li class=""> <a class="nav-link" href="{{ route('product.index') }}"><span
                                class="glyphicon glyphicon-th"></span>
                            {{ trans('account.product_list') }}</a></li>
                    <li class=""> <a class="nav-link" href="{{ route('shop.index') }}"><span
                                class="glyphicon glyphicon-th-large"></span>
                            {{ trans('account.shop_list') }}</a></li>
                </ul>

                <h4>Account</h4>

                <ul class="nav">
                    <li class="">
                        <a class="nav-link" href="{{ route('seller.index') }}">
                            <i class="glyphicon glyphicon-user"></i>
                            My account
                        </a>
                    </li>

                    <li class=""> <a class="nav-link" href="{{ route('seller.change_password') }}">
                            <span class="glyphicon glyphicon-check"></span>
                            {{ trans('account.change_password') }}</a></li>
                    <li class=""> <a class="nav-link" href="{{ route('seller.change_infomation') }}">
                            <span class="glyphicon glyphicon-info-sign"></span>
                            {{ trans('account.change_infomation') }}</a></li>
                    <li><a href="{{ route('seller.logout') }}" rel="nofollow" onclick="event.preventDefault();
                                document.getElementById('logout-form').submit();"><i class="fa fa-power-off"></i>
                            {{ trans('front.logout') }}</a></li>
                    <form id="logout-form" action="{{ route('seller.logout') }}" method="POST" style="display: none;">
                        @csrf
                    </form>
                </ul>

            </div>
            <hr class="ui-divider sm-panel-wide xs-panel-wide is-s">
        </div>

    </div>
</div>