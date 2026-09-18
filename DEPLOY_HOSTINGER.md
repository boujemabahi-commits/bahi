# نشر TASYIIR على استضافة Hostinger Business

هذا الدليل يشرح خطوة بخطوة كيفية رفع الموقع (تطبيق Laravel 12 + Livewire 3)
على استضافة **Hostinger Business** وتشغيله بشكل كامل مع قاعدة بيانات MySQL.

الأصول الأمامية (CSS/JS المبنية بـ Tailwind، الخطوط، الأيقونات، Chart.js)
جاهزة ومبنية مسبقًا داخل `public/build`، `public/fonts`، `public/icons`،
`public/vendor` — **لست بحاجة لتثبيت Node.js على الاستضافة إطلاقًا**.
تحتاج فقط إلى تشغيل Composer مرة واحدة عبر SSH لتثبيت مكتبات PHP (Laravel،
Livewire...) لأن حجمها كبير ولم تُرفع إلى المستودع.

---

## المتطلبات

- خطة Hostinger Business (أو أعلى) — تتضمن SSH وPHP 8.2+ وقاعدة بيانات MySQL.
- اسم نطاق (Domain) مربوط بالحساب.
- الوصول إلى **hPanel**.

---

## الخطوة 1 — تفعيل SSH

1. من hPanel: **Advanced → SSH Access** → فعّله إن لم يكن مفعّلاً، ودوّن
   المضيف (Host) والمنفذ (Port) واسم المستخدم.
2. اتصل بالخادم:
   ```bash
   ssh u123456789@your-domain.com -p 65002
   ```

---

## الخطوة 2 — إنشاء قاعدة بيانات MySQL

1. من hPanel: **Databases → MySQL Databases**.
2. أنشئ قاعدة بيانات جديدة (مثال: `u123456789_tasyiir`) ومستخدمًا بكلمة مرور
   قوية، وامنحه كل الصلاحيات على القاعدة.
3. دوّن: اسم القاعدة، اسم المستخدم، كلمة المرور، والمضيف (عادة `localhost`).

---

## الخطوة 3 — رفع ملفات المشروع

**مهم:** لا تضع ملفات المشروع مباشرة داخل `public_html`. فقط مجلد `public/`
من المشروع يجب أن يكون مرئيًا من الويب؛ باقي الملفات (`.env`, `app/`,
`database/`...) يجب أن تبقى خارج متناول الزوار.

### الطريقة الموصى بها: مجلد شقيق لـ public_html + تعديل Document Root

1. عبر **File Manager** أو **FTP**، أنشئ مجلدًا بجانب `public_html`، مثلاً:
   `~/tasyiir` (أي `/home/u123456789/tasyiir`).
2. ارفع كل محتوى هذا المستودع إلى `~/tasyiir` (يمكنك ضغط المشروع محليًا إلى
   ملف zip ورفعه عبر File Manager ثم فك الضغط، أو استخدام Git — انظر الخيار
   البديل أدناه).
3. من hPanel: **Websites → إدارة الموقع → Advanced → Document Root** (أو
   "Manage Domain" حسب الواجهة)، غيّر المسار إلى:
   ```
   /home/u123456789/tasyiir/public
   ```
   (خطة Business تدعم تعديل Document Root للنطاق الرئيسي والنطاقات الفرعية.)

   > إن لم تجد هذا الخيار إطلاقًا في نسختك من hPanel، استخدم ملفات
   > `hostinger-fallback/` الموجودة في هذا المستودع بدل ذلك — راجع
   > `hostinger-fallback/README.md` لشرح تلك الطريقة البديلة.

### خيار بديل لرفع الملفات: Git من داخل hPanel

من hPanel: **Advanced → Git** → أضف مستودعًا جديدًا، الصق رابط هذا المستودع
على GitHub والفرع المطلوب، واختر مجلد الوجهة `tasyiir` (وليس `public_html`).
هذا يسمح لاحقًا بتحديث الموقع بسحب آخر التغييرات (Pull) من نفس الصفحة.

---

## الخطوة 4 — تثبيت مكتبات PHP عبر SSH

```bash
cd ~/tasyiir
composer install --no-dev --optimize-autoloader
```

إن لم يكن أمر `composer` متوفرًا مباشرة، جرّب `php ~/composer.phar` أو نزّله:

```bash
curl -sS https://getcomposer.org/installer | php
php composer.phar install --no-dev --optimize-autoloader
```

---

## الخطوة 5 — إعداد ملف البيئة `.env`

```bash
cp .env.hostinger.example .env
php artisan key:generate
nano .env
```

عدّل داخل `.env`:

- `APP_URL=https://your-domain.com`
- `DB_DATABASE` و`DB_USERNAME` و`DB_PASSWORD` بالقيم من الخطوة 2
- بيانات `MAIL_*` إن كنت ستفعّل البريد لاحقًا (اختياري الآن)

---

## الخطوة 6 — تهيئة قاعدة البيانات

```bash
php artisan migrate --force
php artisan storage:link
```

`--force` مطلوب لأن `APP_ENV=production`. **لا تُشغّل `--seed`** في بيئة
إنتاج حقيقية (تُنشئ بيانات تجريبية وهمية)؛ بدلاً من ذلك أنشئ حساب المشرف
الأول للمنصة:

```bash
php artisan make:platform-admin ops@your-domain.com "اسمك" "كلمة-مرور-قوية"
```

سجّل الدخول بهذا الحساب من `https://your-domain.com/admin` لمراجعة/الموافقة
على طلبات تسجيل المراكز عبر `/register-center`.

> إذا أردت تجربة الموقع أولاً ببيانات تجريبية جاهزة (تسجيلات دخول موضّحة في
> `SETUP.md`)، شغّل `php artisan migrate:fresh --seed` بدل الأمرين أعلاه، ثم
> أعد تشغيل `make:platform-admin` بعدها (لأن `migrate:fresh` يمسح كل شيء).

---

## الخطوة 7 — الصلاحيات

```bash
chmod -R 775 storage bootstrap/cache
```

---

## الخطوة 8 — جدولة المهام (Cron)

من hPanel: **Advanced → Cron Jobs** → أضف مهمة تعمل كل دقيقة:

```
* * * * * php /home/u123456789/tasyiir/artisan schedule:run >> /dev/null 2>&1
```

هذا يشغّل `enrollments:rollover` يوميًا (تحديث حالة الدفعات المتأخرة). الموقع
يعمل حتى بدون هذا الأمر لأن نفس العملية تُنفَّذ تلقائيًا عند فتح لوحة التحكم،
لكن يُفضّل ضبطه.

---

## الخطوة 9 — تفعيل SSL

من hPanel: **Security → SSL** → فعّل الشهادة المجانية (Let's Encrypt) وفعّل
"Force HTTPS".

---

## الخطوة 10 — التحقق

افتح `https://your-domain.com` — يجب أن يُعيد توجيهك لصفحة تسجيل الدخول.
سجّل الدخول بحساب المشرف الذي أنشأته، أو بأحد الحسابات التجريبية إن استخدمت
`--seed` (انظر جدول الحسابات في `SETUP.md`).

---

## تحديث الموقع لاحقًا

```bash
cd ~/tasyiir
git pull        # أو ارفع الملفات الجديدة يدويًا
composer install --no-dev --optimize-autoloader
php artisan migrate --force
php artisan optimize:clear && php artisan optimize
```

إن عدّلت ملفات `resources/css` أو `resources/js` تحتاج لإعادة بناء الأصول
محليًا (`npm run build`) ورفع محتوى `public/build` المحدّث، لأن الاستضافة لا
تملك Node.js مثبّتًا افتراضيًا.

---

## استكشاف الأخطاء الشائعة

- **صفحة بيضاء / خطأ 500**: تأكد أن `APP_DEBUG=false` في الإنتاج، وراجع
  `storage/logs/laravel.log`.
- **خطأ في الاتصال بقاعدة البيانات**: تحقق من `DB_HOST`/`DB_DATABASE`/
  `DB_USERNAME`/`DB_PASSWORD` في `.env`، ومن أن المستخدم لديه صلاحيات على
  القاعدة من hPanel.
- **الصور/الخطوط لا تظهر**: تأكد أن Document Root يشير فعلاً إلى `public/`
  وليس إلى جذر المشروع.
- **CSS غير محدث بعد تعديل التصميم**: أعد `npm run build` محليًا وارفع
  `public/build` من جديد.
