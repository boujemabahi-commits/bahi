# استخدام هذا المجلد (فقط عند تعذّر تغيير Document Root)

خطط Hostinger Business/Cloud تسمح عادة بتعديل "Document Root" لتشير مباشرة إلى
مجلد `public/` (الطريقة الموصى بها، اشرحها في `DEPLOY_HOSTINGER.md`). استخدم
هذا المجلد فقط إذا لم تجد هذا الخيار في لوحة التحكم.

## الخطوات

1. ارفع كامل مشروع الموقع (كل الملفات ما عدا محتوى `public/`) إلى مجلد **خارج**
   `public_html`، مثلاً: `~/tasyiir` (بجانب `public_html` وليس بداخله).
2. انسخ **كل محتوى** مجلد `public/` من المشروع (بما فيه `fonts`, `icons`,
   `vendor` (ملفات Chart.js وليس composer)، `build`, `favicon.ico`,
   `robots.txt`) إلى `public_html`.
3. احذف `index.php` و`.htaccess` اللذين نسختهما للتو من `public/` داخل
   `public_html`، واستبدلهما بالملفين الموجودين في هذا المجلد
   (`hostinger-fallback/index.php` و`hostinger-fallback/.htaccess`).
4. افتح `public_html/index.php` وعدّل السطر:
   ```php
   $appBasePath = getenv('TASYIIR_APP_PATH') ?: dirname(__DIR__).'/tasyiir';
   ```
   ليطابق المسار الفعلي لمجلد المشروع الذي رفعته في الخطوة 1 (المسار الكامل
   من الجذر، مثال: `/home/u123456789/domains/your-domain.com/tasyiir`).
5. تأكد أن `storage/` و`bootstrap/cache/` داخل مجلد المشروع (وليس `public_html`)
   قابلان للكتابة (`chmod -R 775`).

باقي خطوات الإعداد (قاعدة البيانات، `.env`، composer install، migrate) هي
نفسها الموضحة في `DEPLOY_HOSTINGER.md`.
