truncate table homework_assigns;
truncate table homework_student_uploads;
truncate table homework_student_upload_requirements;
truncate table homework_teacher_attachements;
truncate table teams;
truncate table team_students;
truncate table homeworks;


INSERT INTO `teams` (`id`, `name`, `cid`, `teacher_id`, `created_at`, `updated_at`) VALUES
(1, '一班', '001', 3, NULL, NULL),
(2, '二班', '002', 6, NULL, NULL),
(3, '三班', '003', 7, NULL, NULL);

INSERT INTO `team_students` (`id`, `team_id`, `student_id`, `created_at`, `updated_at`) VALUES
(1, 1, 26, NULL, NULL),
(2, 1, 27, NULL, NULL),
(3, 1, 28, NULL, NULL),
(4, 2, 29, NULL, NULL),
(5, 2, 30, NULL, NULL),
(6, 3, 31, NULL, NULL),
(7, 3, 32, NULL, NULL),
(8, 3, 33, NULL, NULL);
