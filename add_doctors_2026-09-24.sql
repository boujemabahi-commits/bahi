-- إضافة أطباء جدد من بطاقات الزيارة (2026-09-24)
-- ملاحظة: الدكتورة فاطمة ايت سيدي احمد موجودة مسبقاً (id = 36)، لذلك نحدّث بياناتها بدل إضافتها مرة ثانية.

SET NAMES utf8mb4;
START TRANSACTION;

INSERT INTO `doctors` (
  `image_url`, `name_ar`, `name_fr`, `name_en`, `gender`, `languages`, `home_visit`, `teleconsult_available`,
  `specialty_ar`, `specialty_fr`, `specialty_en`,
  `location_ar`, `location_fr`, `location_en`,
  `bio_ar`, `bio_fr`, `bio_en`,
  `whatsapp`, `phone`, `email`, `instagram`, `maps_url`,
  `tags_ar`, `tags_fr`, `tags_en`,
  `sub_specialties_ar`, `sub_specialties_fr`, `sub_specialties_en`,
  `qualifications_ar`, `qualifications_fr`, `qualifications_en`,
  `shift1_start`, `shift1_end`, `shift2_start`, `shift2_end`,
  `display_order`, `is_visible`, `duty_status`, `booking_enabled`
) VALUES
-- 1) Dr Boughaleb Wafa — Chirurgienne dentiste
(
  NULL, 'الدكتورة بوغالب وفاء', 'Dr. Boughaleb Wafa', 'Dr. Boughaleb Wafa', 'female', 'العربية, Français', 0, 0,
  'طبيب أسنان', 'Dentiste', 'Dentist',
  'رقم 01، بلوك 12، الطابق 2، زنقة حي أحمد أخنوش (زنقة مراكش)، الحي الصناعي، أكادير، المغرب',
  'N°01, Bloc 12, Étage 02, Rue Hay Ahmed Akhennouch (Rue Marrakech), Q.I, Agadir, Maroc',
  'No. 01, Block 12, 2nd Floor, Rue Hay Ahmed Akhennouch (Rue Marrakech), Industrial Quarter, Agadir, Morocco',
  'الدكتورة بوغالب وفاء جرّاحة أسنان بمدينة أكادير، تقدم رعاية شاملة لصحة الفم والأسنان في بيئة مريحة، مع الحرص على الدقة والعناية بكل مريض لضمان ابتسامة صحية وجميلة.',
  'Dr. Boughaleb Wafa est chirurgienne-dentiste à Agadir. Elle propose des soins bucco-dentaires complets dans un cadre confortable, avec précision et attention portée à chaque patient pour un sourire sain et harmonieux.',
  'Dr. Boughaleb Wafa is a dental surgeon in Agadir. She provides comprehensive oral care in a comfortable setting, with precision and personal attention to every patient for a healthy, harmonious smile.',
  NULL, '212521125059', NULL, 'https://www.instagram.com/dr_wafa_boughaleb/',
  'https://www.google.com/maps/search/?api=1&query=Rue+Hay+Ahmed+Akhennouch+Rue+Marrakech+Agadir',
  'طبيب أسنان, علاج الأسنان, تجميل الأسنان, تركيبات الأسنان',
  'Dentiste, Soins dentaires, Esthétique dentaire, Prothèse',
  'Dentist, Dental care, Cosmetic dentistry, Prosthetics',
  'علاج الأسنان, جراحة الفم والأسنان, تبييض الأسنان, تركيبات الأسنان',
  'Soins dentaires, Chirurgie buccale, Blanchiment dentaire, Prothèse',
  'Dental care, Oral surgery, Teeth whitening, Prosthodontics',
  'دكتوراه في جراحة الأسنان', 'Docteur en chirurgie dentaire', 'Doctor of Dental Surgery',
  '09:00:00', '13:00:00', '15:00:00', '19:00:00',
  27, 1, 'regular', 1
),
-- 2) Dr Boutraih Lahoussine — Chirurgie orthopédique, traumatologie & médecine du sport
(
  NULL, 'الدكتور بوطرايح الحسين', 'Dr. Boutraih Lahoussine', 'Dr. Boutraih Lahoussine', 'male', 'العربية, Français', 0, 0,
  'جراحة العظام والمفاصل', 'Chirurgien orthopédiste traumatologue', 'Orthopedic & Trauma Surgeon',
  'عمارة سلام سانتر، رقم 208، الطابق 2، زنقة فاس، الباطوار، قرب سينما السلام، أكادير، المغرب',
  'Imm. Salam Center, N°208, 2ème étage, Rue de Fès (Abattoirs), près du Cinéma Salam, Agadir, Maroc',
  'Salam Center Bldg, No. 208, 2nd Floor, Rue de Fès (Abattoirs), near Cinema Salam, Agadir, Morocco',
  'الدكتور بوطرايح الحسين أخصائي في جراحة العظام والمفاصل والكسور والطب الرياضي، خريج كليات الطب ببواتييه ومراكش وطبيب سابق بمستشفيات فرنسا. يقدم رعاية متكاملة من التشخيص إلى الجراحة والتأهيل، بما في ذلك الجراحة بالمنظار واستبدال المفاصل والعلاج بالبلازما الغنية بالصفائح.',
  'Le Dr. Boutraih Lahoussine est spécialiste en chirurgie orthopédique, traumatologie et médecine du sport, diplômé des Facultés de Médecine de Poitiers et de Marrakech et ancien médecin des hôpitaux de France. Il assure une prise en charge complète, du diagnostic à la chirurgie : arthroscopie, prothèses articulaires et thérapie PRP.',
  'Dr. Boutraih Lahoussine is a specialist in orthopedic surgery, traumatology and sports medicine, a graduate of the Faculties of Medicine of Poitiers and Marrakech and a former physician in French hospitals. He provides complete care from diagnosis to surgery, including arthroscopy, joint replacement and PRP therapy.',
  '212614050581', '212528828828', 'doc.boutraih@gmail.com', NULL,
  'https://www.google.com/maps/search/?api=1&query=Salam+Center+Rue+de+Fes+Agadir',
  'جراحة العظام, الكسور, المفاصل, الطب الرياضي, المنظار, PRP',
  'Orthopédie, Traumatologie, Fractures, Articulations, Médecine du sport, Arthroscopie, PRP',
  'Orthopedics, Traumatology, Fractures, Joints, Sports medicine, Arthroscopy, PRP',
  'جراحة الكسور والكلوم, تقويم العظام والمفاصل, الجراحة الاستبدالية للمفاصل, الجراحة بالمنظار, طب وجراحة أمراض الروماتيزم, الطب الرياضي, العلاج بالبلازما الغنية بالصفائح',
  'Chirurgie traumatologique, Chirurgie orthopédique, Chirurgie prothétique, Chirurgie arthroscopique, Pathologie et chirurgie des maladies rhumatismales, Médecine et traumatologie du sport, Thérapie PRP',
  'Trauma surgery, Orthopedic surgery, Joint replacement surgery, Arthroscopic surgery, Rheumatic disease pathology and surgery, Sports medicine and traumatology, PRP therapy',
  'خريج كليات الطب ببواتييه ومراكش, طبيب سابق بمستشفيات فرنسا',
  'Diplômé des Facultés de Médecine de Poitiers et de Marrakech, Ancien médecin des hôpitaux de France',
  'Graduate of the Faculties of Medicine of Poitiers and Marrakech, Former physician in French hospitals',
  '09:00:00', '13:00:00', '15:00:00', '19:00:00',
  28, 1, 'regular', 1
),
-- 3) Dr Lahrech Siham — Médecin généraliste
(
  NULL, 'الدكتورة لحرش سهام', 'Dr. Lahrech Siham', 'Dr. Lahrech Siham', 'female', 'العربية, Français', 0, 0,
  'طبيب عام', 'Médecin généraliste', 'General Practitioner',
  'الطابق الأول، رقم 231، شارع عبد الرحيم بوعبيد، حي الوفاء، أكادير، المغرب',
  '1er étage, N°231, Avenue Abderrahim Bouabid, Cité El Wafa, Agadir, Maroc',
  '1st Floor, No. 231, Avenue Abderrahim Bouabid, Cité El Wafa, Agadir, Morocco',
  'الدكتورة لحرش سهام طبيبة عامة بأكادير، تقدم تقييماً ومتابعة شخصية في الطب النفسي وعلاج الإدمان، والتجميل النسائي، ومتابعة الحمل بشكل كامل ومخصص لكل مريضة.',
  'Dr. Lahrech Siham est médecin généraliste à Agadir. Elle propose une évaluation, un suivi et une prise en charge personnalisée en psychiatrie et addictologie, en esthétique gynécologique et en suivi de grossesse.',
  'Dr. Lahrech Siham is a general practitioner in Agadir. She offers personalized assessment, follow-up and care in psychiatry and addiction medicine, gynecological aesthetics and pregnancy monitoring.',
  NULL, '212528201396', NULL, NULL,
  'https://www.google.com/maps/search/?api=1&query=231+Avenue+Abderrahim+Bouabid+Cite+El+Wafa+Agadir',
  'طبيب عام, الطب النفسي, علاج الإدمان, التجميل النسائي, متابعة الحمل',
  'Médecin généraliste, Psychiatrie, Addictologie, Esthétique gynécologique, Suivi de grossesse',
  'General practitioner, Psychiatry, Addiction medicine, Gynecological aesthetics, Pregnancy follow-up',
  'الطب النفسي وعلاج الإدمان, التجميل النسائي, متابعة الحمل',
  'Psychiatrie & Addictologie, Esthétique gynécologique, Suivi de grossesse',
  'Psychiatry & Addiction medicine, Gynecological aesthetics, Pregnancy follow-up',
  'دكتوراه في الطب العام', 'Docteur en médecine générale', 'Doctor of General Medicine',
  '09:00:00', '13:00:00', '15:00:00', '19:00:00',
  29, 1, 'regular', 1
);

-- 4) Dr Fatima Ait Sidi Ahmed (موجودة: id = 36) — تحديث بمعلومات البطاقة
UPDATE `doctors` SET
  `gender` = 'female',
  `name_ar` = 'الدكتورة فاطمة ايت سيدي احمد',
  `name_fr` = 'Dr. Fatima Ait Sidi Ahmed',
  `name_en` = 'Dr. Fatima Ait Sidi Ahmed',
  `location_ar` = 'مركز الحمراء لطب الأسنان، شارع عبد الرحيم بوعبيد (شارع الحمراء سابقا) رقم 255 شقة 1، فوق سهام بنك، أكادير، المغرب',
  `location_fr` = 'Centre Dentaire El Hamra, Bd. Abderrahim Bouabid (ex rue Elhamra) N°255, App. 1, au-dessus de Saham Bank, Agadir, Maroc',
  `location_en` = 'Centre Dentaire El Hamra, Bd. Abderrahim Bouabid (formerly Rue Elhamra) No. 255, Apt 1, above Saham Bank, Agadir, Morocco',
  `sub_specialties_ar` = 'علاج, جراحة, تبييض, علاج امراض اللثة, طب أسنان الأطفال, اشعة, تعويض',
  `sub_specialties_fr` = 'Soins, Chirurgie, Blanchiment, Parodontie, Pédodontie, Radio, Prothèse',
  `sub_specialties_en` = 'Dental care, Surgery, Whitening, Periodontics, Pediatric dentistry, X-ray, Prosthetics'
WHERE `id` = 36;

COMMIT;
