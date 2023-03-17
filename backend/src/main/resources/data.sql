INSERT INTO tb_user (name, email, password) VALUES ('Alex Brown', 'alex@gmail.com', '$2a$10$eACCYoNOHEqXve8aIWT8Nu3PkMXWBaOxJ9aORUYzfMQCbVBIhZ8tG');
INSERT INTO tb_user (name, email, password) VALUES ('Bob Brown', 'bob@gmail.com', '$2a$10$eACCYoNOHEqXve8aIWT8Nu3PkMXWBaOxJ9aORUYzfMQCbVBIhZ8tG');
INSERT INTO tb_user (name, email, password) VALUES ('Maria Green', 'maria@gmail.com', '$2a$10$eACCYoNOHEqXve8aIWT8Nu3PkMXWBaOxJ9aORUYzfMQCbVBIhZ8tG');

INSERT INTO tb_role (authority) VALUES ('ROLE_STUDENT');
INSERT INTO tb_role (authority) VALUES ('ROLE_INSTRUCTOR');
INSERT INTO tb_role (authority) VALUES ('ROLE_ADMIN');

INSERT INTO tb_user_role (user_id, role_id) VALUES (1, 1);

INSERT INTO tb_user_role (user_id, role_id) VALUES (2, 1);
INSERT INTO tb_user_role (user_id, role_id) VALUES (2, 2);

INSERT INTO tb_user_role (user_id, role_id) VALUES (3, 1);
INSERT INTO tb_user_role (user_id, role_id) VALUES (3, 2);
INSERT INTO tb_user_role (user_id, role_id) VALUES (3, 3);

INSERT INTO TB_COURSE (name, img_uri, img_gray_uri) VALUES ('Bootcamp HTML', 'https://cuboup.s3.sa-east-1.amazonaws.com/br/wp-content/uploads/2022/08/14174056/Terraform-Course-Image.png', 'https://get.pxhere.com/photo/learn-online-book-silhouette-icon-concept-study-education-research-library-world-encyclopedia-global-learning-university-web-internet-course-webinar-guide-read-publish-design-logo-symbol-emblem-line-art-clip-art-1620283.jpg');
 
INSERT INTO TB_OFFER (edition, start_moment, end_moment, course_id) VALUES ('1.0', TIMESTAMP WITH TIME ZONE '2020-11-20T03:00:00Z', TIMESTAMP WITH TIME ZONE '2021-11-20T03:00:00Z', 1);
INSERT INTO TB_OFFER (edition, start_moment, end_moment, course_id) VALUES ('2.0', TIMESTAMP WITH TIME ZONE '2020-12-20T03:00:00Z', TIMESTAMP WITH TIME ZONE '2021-12-20T03:00:00Z', 1);
 
INSERT INTO TB_RESOURCE (title, description, position, img_uri, type, offer_id) VALUES ('Trilha HTML', 'Trilha principal do curso', 1, 'https://cuboup.s3.sa-east-1.amazonaws.com/br/wp-content/uploads/2022/08/14174056/Terraform-Course-Image.png', 1, 1);
INSERT INTO TB_RESOURCE (title, description, position, img_uri, type, offer_id) VALUES ('Forum', 'Tire suas dúvidas', 2, 'https://cuboup.s3.sa-east-1.amazonaws.com/br/wp-content/uploads/2022/08/14174056/Terraform-Course-Image.png', 2, 1);
INSERT INTO TB_RESOURCE (title, description, position, img_uri, type, offer_id) VALUES ('Lives', 'Lives exclusivas para a turma', 3, 'https://cuboup.s3.sa-east-1.amazonaws.com/br/wp-content/uploads/2022/08/14174056/Terraform-Course-Image.png', 0, 1);
 
INSERT INTO TB_SECTION (title, description, position, img_uri, resource_id, prerequisite_id) VALUES ('Capítulo 1', 'Neste capítulo vamos começar', 1, 'https://cuboup.s3.sa-east-1.amazonaws.com/br/wp-content/uploads/2022/08/14174056/Terraform-Course-Image.png', 1, NULL);
INSERT INTO TB_SECTION (title, description, position, img_uri, resource_id, prerequisite_id) VALUES ('Capítulo 2', 'Neste capítulo vamos continuar', 2, 'https://cuboup.s3.sa-east-1.amazonaws.com/br/wp-content/uploads/2022/08/14174056/Terraform-Course-Image.png', 1, 1);
INSERT INTO TB_SECTION (title, description, position, img_uri, resource_id, prerequisite_id) VALUES ('Capítulo 3', 'Neste capítulo vamos finalizar', 3, 'https://cuboup.s3.sa-east-1.amazonaws.com/br/wp-content/uploads/2022/08/14174056/Terraform-Course-Image.png', 1, 2);
  
INSERT INTO TB_ENROLLMENT (user_id, offer_id, enroll_moment, refund_moment, available, only_update) VALUES (1, 1, TIMESTAMP WITH TIME ZONE '2020-11-20T13:00:00Z', NULL, true, false);
INSERT INTO TB_ENROLLMENT (user_id, offer_id, enroll_moment, refund_moment, available, only_update) VALUES (2, 1, TIMESTAMP WITH TIME ZONE '2020-11-20T13:00:00Z', NULL, true, false);
  
INSERT INTO TB_LESSON (title, position, section_id) VALUES ('Aula 1 do Capítulo 1', 1, 1);
INSERT INTO TB_CONTENT (id, text_content, video_uri) VALUES (1, 'Material de Apoio: abc', 'https://www.youtube.com/watch?v=0_e9Egeyk2E');
  
INSERT INTO TB_LESSON (title, position, section_id) VALUES ('Aula 2 do Capítulo 1', 2, 1);
INSERT INTO TB_CONTENT (id, text_content, video_uri) VALUES (2, 'Material de Apoio: abc', 'https://www.youtube.com/watch?v=0_e9Egeyk2E');
  
INSERT INTO TB_LESSON (title, position, section_id) VALUES ('Aula 3 do Capítulo 1', 3, 1);
INSERT INTO TB_CONTENT (id, text_content, video_uri) VALUES (3, 'Material de Apoio: abc', 'https://www.youtube.com/watch?v=0_e9Egeyk2E');
  
INSERT INTO TB_LESSON (title, position, section_id) VALUES ('Tarefa do Capítulo 1', 4, 1);
INSERT INTO TB_TASK (id, description, question_count, approval_count, weight, due_date) VALUES (4, 'Fazer um trabalho', 5, 4, 1.0, TIMESTAMP WITH TIME ZONE '2020-11-25T13:00:00Z');
  
INSERT INTO TB_LESSONS_DONE (lesson_id, user_id, offer_id) VALUES (1, 1, 1);
INSERT INTO TB_LESSONS_DONE (lesson_id, user_id, offer_id) VALUES (2, 1, 1);
  
INSERT INTO tb_notification (text, moment, read, route, user_id) VALUES ('Primeiro feedback de tarefa: favor revisar', TIMESTAMP WITH TIME ZONE '2020-12-10T13:00:00Z', true, '/offers/1/resource/1/sections/1', 1);
INSERT INTO tb_notification (text, moment, read, route, user_id) VALUES ('Segundo feedback: favor revisar', TIMESTAMP WITH TIME ZONE '2020-12-12T13:00:00Z', true, '/offers/1/resource/1/sections/1', 1);
INSERT INTO tb_notification (text, moment, read, route, user_id) VALUES ('Terceiro feedback: favor revisar', TIMESTAMP WITH TIME ZONE '2020-12-14T13:00:00Z', true, '/offers/1/resource/1/sections/1', 1);

INSERT INTO tb_deliver (uri, moment, status, feedback, correct_Count, lesson_id, user_id, offer_id) VALUES ('https://github.com/devsuperior/bds-dslearn', TIMESTAMP WITH TIME ZONE '2020-12-10T10:00:00Z', 0, null, null, 4, 1, 1);