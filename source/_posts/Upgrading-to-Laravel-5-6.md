---
title: L6.5
date: 2018-02-27 02:44:21
tags:
---

**app/Exceptions/Handler.php**

```diff
+    protected function whoopsHandler()
+    {
+        if (app()->runningInConsole()) {
+            return new \NunoMaduro\Collision\Handler();
+        }
+        return parent::whoopsHandler();
+    }
```

**app/Http/Middleware/TrustProxies.php***

```diff
-    /**
-     * The current proxy header mappings.
-     *
-     * @var array
-     */
-    protected $headers = [
-        Request::HEADER_FORWARDED         => 'FORWARDED',
-        Request::HEADER_X_FORWARDED_FOR   => 'X_FORWARDED_FOR',
-        Request::HEADER_X_FORWARDED_HOST  => 'X_FORWARDED_HOST',
-        Request::HEADER_X_FORWARDED_PORT  => 'X_FORWARDED_PORT',
-        Request::HEADER_X_FORWARDED_PROTO => 'X_FORWARDED_PROTO',
-    ];
+    protected $headers = Request::HEADER_X_FORWARDED_ALL;
```

**composer.json b/composer.json**

```diff
-        "fideloper/proxy": "~3.3",
+        "fideloper/proxy": "~4.0",
-        "laravel/framework": "5.5.*",
+        "laravel/framework": "5.6.*",
-        "roave/security-advisories": "dev-master",
-        "phpunit/phpunit": "~6.0"
+        "phpunit/phpunit": "~7.0"
```

**config/app.php**

```diff
-
-    /*
-    |--------------------------------------------------------------------------
-    | Logging Configuration
-    |--------------------------------------------------------------------------
-    |
-    | Here you may configure the log settings for your application. Out of
-    | the box, Laravel uses the Monolog PHP logging library. This gives
-    | you a variety of powerful log handlers / formatters to utilize.
-    |
-    | Available Settings: "single", "daily", "syslog", "errorlog"
-    |
-    */
-
-    'log' => env('APP_LOG', 'single'),
-
-    'log_level' => env('APP_LOG_LEVEL', 'debug'),
```

**tests/CreatesApplication.php**

```diff
+use Illuminate\Support\Facades\Hash
    ...
         $app->make(Kernel::class)->bootstrap();
-
+        Hash::driver('bcrypt')->setRounds(4);
         return $app;
     }
```

**https://github.com/laravel/laravel/tree/master/config**
```diff
+ hashing.php
+ logging.php
```