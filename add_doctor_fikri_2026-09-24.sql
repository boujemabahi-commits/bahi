-- إضافة الدكتورة أمال فكري (طبيبة نفسية - معالجة نفسية - طب الإدمان)
-- ملاحظة: البطاقة لا تحتوي على عنوان العيادة، لذلك تُضاف مخفية (is_visible = 0) إلى أن يُضاف العنوان.
SET NAMES utf8mb4;

INSERT INTO `doctors` (
  `image_url`, `name_ar`, `name_fr`, `name_en`, `gender`, `languages`, `home_visit`, `teleconsult_available`,
  `specialty_ar`, `specialty_fr`, `specialty_en`,
  `location_ar`, `location_fr`, `location_en`,
  `bio_ar`, `bio_fr`, `bio_en`,
  `whatsapp`, `phone`, `email`,
  `tags_ar`, `tags_fr`, `tags_en`,
  `sub_specialties_ar`, `sub_specialties_fr`, `sub_specialties_en`,
  `qualifications_ar`, `qualifications_fr`, `qualifications_en`,
  `working_hours_ar`, `working_hours_fr`, `working_hours_en`,
  `shift1_start`, `shift1_end`, `shift2_start`, `shift2_end`,
  `display_order`, `is_visible`, `duty_status`, `booking_enabled`
) VALUES (
  NULL, 'الدكتورة أمال فكري', 'Dr. Amal Fikri', 'Dr. Amal Fikri', 'female', 'العربية, Français', 0, 0,
  'طبيبة نفسية', 'Psychiatre', 'Psychiatrist',
  NULL, NULL, NULL,
  'الدكتورة أمال فكري طبيبة نفسية ومعالجة نفسية ومتخصصة في طب الإدمان، خريجة كلية الطب والصيدلة بفاس، وحاصلة على دبلوم طب الإدمان من جامعة باريس ساكلاي بفرنسا. عملت سابقاً بالمستشفى الجامعي الحسن الثاني والمستشفى الجامعي للطب النفسي وعلاج الإدمان ابن الحسن بفاس، وتقدم تقييماً ومتابعة نفسية شاملة وعلاجاً مخصصاً لكل مريض.',
  'Le Dr. Amal Fikri est psychiatre, psychothérapeute et addictologue, lauréate de la Faculté de Médecine et de Pharmacie de Fès et diplômée de l''Université Paris-Saclay en addictologie. Ancien médecin interne au CHU Hassan II et à l''Hôpital psychiatrique Ibn Al Hassan de Fès, elle assure une évaluation, un suivi et une prise en charge personnalisée de chaque patient.',
  'Dr. Amal Fikri is a psychiatrist, psychotherapist and addiction specialist, a graduate of the Faculty of Medicine and Pharmacy of Fez with a diploma in addiction medicine from Université Paris-Saclay, France. A former resident physician at CHU Hassan II and the Ibn Al Hassan Psychiatric Hospital in Fez, she provides personalized assessment, follow-up and care for every patient.',
  '212695243845', '212695243845', 'drfikriamal@gmail.com',
  'طبيبة نفسية, العلاج النفسي, طب الإدمان, الاكتئاب, القلق',
  'Psychiatre, Psychothérapie, Addictologie, Dépression, Anxiété',
  'Psychiatrist, Psychotherapy, Addiction medicine, Depression, Anxiety',
  'الطب النفسي, العلاج النفسي, طب الإدمان',
  'Psychiatrie, Psychothérapie, Addictologie',
  'Psychiatry, Psychotherapy, Addiction medicine',
  'خريجة كلية الطب والصيدلة بفاس, دبلوم طب الإدمان - جامعة باريس ساكلاي، فرنسا, دبلوم من الجامعة الدولية بالرباط, طبيبة داخلية سابقة بالمستشفى الجامعي الحسن الثاني ومستشفى ابن الحسن للطب النفسي بفاس',
  'Lauréate de la Faculté de Médecine et de Pharmacie de Fès, Diplômée de l''Université Paris-Saclay (Addictologie), Diplômée de l''Université Internationale de Rabat, Ancien médecin interne au CHU Hassan II et à l''Hôpital psychiatrique Ibn Al Hassan de Fès',
  'Graduate of the Faculty of Medicine and Pharmacy of Fez, Diploma from Université Paris-Saclay (Addiction medicine), Diploma from the International University of Rabat, Former resident physician at CHU Hassan II and Ibn Al Hassan Psychiatric Hospital, Fez',
  'الإثنين - الجمعة: 09:00 - 13:00 و 15:00 - 19:00\r\nالسبت: 09:00 - 13:00\r\nالأحد: مغلق',
  'Lundi - Vendredi: 09:00 - 13:00 et 15:00 - 19:00\r\nSamedi: 09:00 - 13:00\r\nDimanche: Fermé',
  'Monday - Friday: 09:00 - 13:00 and 15:00 - 19:00\r\nSaturday: 09:00 - 13:00\r\nSunday: Closed',
  '09:00:00', '13:00:00', '15:00:00', '19:00:00',
  30, 0, 'regular', 1
);
