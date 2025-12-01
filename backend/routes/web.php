<?php


use Illuminate\Support\Facades\Route;

// Si quieres que la raíz sirva el frontend
Route::get('/', function () {
    return file_get_contents(public_path('index.html'));
});

// Captura todas las rutas (SPA) excepto las de API
Route::get('/{any}', function () {
    return file_get_contents(public_path('index.html'));
})->where('any', '^(?!api).*$');

