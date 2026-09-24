-- إضافة الخرائط (Google Maps) للأطباء 63، 64، 65
SET NAMES utf8mb4;

-- 63) Dr Boughaleb Wafa
UPDATE `doctors` SET
  `maps_url`    = 'https://www.google.com/maps/search/?api=1&query=Rue+Ahmed+Akhennouch+Quartier+Industriel+Agadir',
  `iframe_maps` = 'https://www.google.com/maps?q=Rue+Ahmed+Akhennouch,+Quartier+Industriel,+Agadir,+Maroc&output=embed'
WHERE `id` = 63;

-- 64) Dr Boutraih Lahoussine
UPDATE `doctors` SET
  `maps_url`    = 'https://www.google.com/maps/search/?api=1&query=Salam+Center+Rue+de+Fes+Agadir',
  `iframe_maps` = 'https://www.google.com/maps?q=Salam+Center,+Rue+de+F%C3%A8s,+Agadir,+Maroc&output=embed'
WHERE `id` = 64;

-- 65) Dr Lahrech Siham
UPDATE `doctors` SET
  `maps_url`    = 'https://www.google.com/maps/search/?api=1&query=231+Avenue+Abderrahim+Bouabid+Agadir',
  `iframe_maps` = 'https://www.google.com/maps?q=231+Avenue+Abderrahim+Bouabid,+Cit%C3%A9+El+Wafa,+Agadir,+Maroc&output=embed'
WHERE `id` = 65;

-- (اختياري) الإحداثيات: افتح Google Maps، اضغط بالزر الأيمن على مكان العيادة، انسخ الرقمين وضعهم هنا، ثم احذف "-- " من بداية السطر:
-- UPDATE `doctors` SET `lat` = 30.0000000, `lng` = -9.0000000 WHERE `id` = 63;
-- UPDATE `doctors` SET `lat` = 30.0000000, `lng` = -9.0000000 WHERE `id` = 64;
-- UPDATE `doctors` SET `lat` = 30.0000000, `lng` = -9.0000000 WHERE `id` = 65;
