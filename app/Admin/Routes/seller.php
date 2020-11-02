<?php
$router->group(['prefix' => 'seller'], function ($router) {
    $router->get('/', 'SellerUserController@index')->name('admin_seller.index');
    $router->get('create', 'SellerUserController@create')->name('admin_seller.create');
    $router->post('/create', 'SellerUserController@postCreate')->name('admin_seller.create');
    $router->get('/edit/{id}', 'SellerUserController@edit')->name('admin_seller.edit');
    $router->post('/edit/{id}', 'SellerUserController@postEdit')->name('admin_seller.edit');
    $router->post('/delete', 'SellerUserController@deleteList')->name('admin_seller.delete');
});
