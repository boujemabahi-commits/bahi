-- ساعات العمل المكتوبة للأطباء 63، 64، 65 (مطابقة لأوقات shift1/shift2 الحالية: 09:00-13:00 و 15:00-19:00)
SET NAMES utf8mb4;

UPDATE `doctors` SET
  `working_hours_ar` = 'الإثنين - الجمعة: 09:00 - 13:00 و 15:00 - 19:00\r\nالسبت: 09:00 - 13:00\r\nالأحد: مغلق',
  `working_hours_fr` = 'Lundi - Vendredi: 09:00 - 13:00 et 15:00 - 19:00\r\nSamedi: 09:00 - 13:00\r\nDimanche: Fermé',
  `working_hours_en` = 'Monday - Friday: 09:00 - 13:00 and 15:00 - 19:00\r\nSaturday: 09:00 - 13:00\r\nSunday: Closed'
WHERE `id` IN (63, 64, 65);
