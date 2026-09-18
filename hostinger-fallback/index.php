<?php

/**
 * استخدم هذا الملف فقط إذا لم يكن بالإمكان تغيير "Document Root" في hPanel
 * ليشير مباشرة إلى مجلد public/. انسخه إلى public_html مع ملف .htaccess
 * المرافق له، بعد رفع بقية المشروع في مجلد شقيق مثل tasyiir- (خارج public_html).
 *
 * هذا الملف نسخة من public/index.php معدّلة لتشير إلى مجلد المشروع
 * الحقيقي عبر متغير APP_BASE_PATH بدل __DIR__/... مباشرة.
 */

use Illuminate\Foundation\Application;
use Illuminate\Http\Request;

define('LARAVEL_START', microtime(true));

// عدّل هذا المسار ليطابق مكان رفعك للمشروع الفعلي على الخادم
// مثال: '/home/u123456789/domains/your-domain.com/tasyiir'
$appBasePath = getenv('TASYIIR_APP_PATH') ?: dirname(__DIR__).'/tasyiir';

if (file_exists($maintenance = $appBasePath.'/storage/framework/maintenance.php')) {
    require $maintenance;
}

require $appBasePath.'/vendor/autoload.php';

/** @var Application $app */
$app = require_once $appBasePath.'/bootstrap/app.php';

$app->usePublicPath(__DIR__);

$app->handleRequest(Request::capture());
