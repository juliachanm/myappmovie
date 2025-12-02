<?php

return [
     'paths' => ['api/*'],
    'allowed_methods' => ['*'],
    'allowed_origins' => ['http://localhost:4200', 'http://127.0.0.1:4200','https://myappmovie-production.up.railway.app' ], 'http://127.0.0.1:8000',  // ← FALTABA ESTA
        'http://localhost:8000', 
    'allowed_headers' => ['*'],
    'exposed_headers' => [],
    'max_age' => 0,
    'supports_credentials' => false,
];
