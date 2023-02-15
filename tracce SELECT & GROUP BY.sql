-- ---------------------------------------  QUERY CON SELECT

-- 1. Selezionare tutti gli studenti nati nel 1990 (160)
SELECT surname, date_of_birth FROM `students` WHERE YEAR(date_of_birth) = 1990;

-- 2. Selezionare tutti i corsi che valgono più di 10 crediti (479)
SELECT id,name,cfu FROM `courses` WHERE cfu > 10;

-- 3. Selezionare tutti gli studenti che hanno più di 30 anni
SELECT surname, date_of_birth AS 'year' FROM `students` WHERE YEAR(date_of_birth) <= 1992;

-- 4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)
SELECT id,name,period,year FROM `courses` WHERE period LIKE 'I s%' AND year = 1;

-- 5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21)
SELECT * FROM `exams` WHERE HOUR(hour) >= HOUR("14:00:00") AND date = '2020/06/20';

-- 6. Selezionare tutti i corsi di laurea magistrale (38)
SELECT name,level FROM `degrees` WHERE level = 'magistrale';

-- 7. Da quanti dipartimenti è composta l'università? (12)
SELECT COUNT(*) as 'Tot dipartimenti' FROM `departments`;

-- 8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50)
SELECT surname, phone FROM `teachers` WHERE phone IS NULL;


-- ------------------------------------------ QUERY CON GROUP BY


-- 1. Contare quanti iscritti ci sono stati ogni anno
SELECT COUNT(*) AS 'iscritti annui',YEAR(enrolment_date) FROM `students` GROUP BY YEAR(enrolment_date);

-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT COUNT(*) as 'Uffici Insegnanti', office_address FROM `teachers` GROUP BY office_address;

-- 3. Calcolare la media dei voti di ogni appello d'esame
SELECT AVG(vote) as 'media voti', exam_id FROM `exam_student` GROUP BY exam_id;

-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT COUNT(*) as 'Corsi laurea', department_id FROM `degrees` GROUP BY department_id;


-- -------------------------------------------- QUERY JOIN


--1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT `students`.`surname`,`students`.`name`, `degrees`.`name`AS 'Corso' 
FROM `degrees` 
JOIN `students` 
ON `degrees`.`id` = `students`.`degree_id` 
WHERE `degrees`.`name` = 'Corso di Laurea in Economia';

--2.  Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze
SELECT `degrees`.`name`AS 'Corsi', `departments`.`name` AS 'Dipartimento' 
FROM `degrees` 
JOIN `departments` 
ON `departments`.`id` = `degrees`.`department_id` 
WHERE `departments`.`name` = 'Dipartimento di Neuroscienze';

--3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT `degrees`.`name` AS 'Corsi',`teachers`.`surname`AS 'Professore', `teachers`.`id`
FROM `courses`
JOIN `degrees`
ON `degrees`.`id` = `courses`.`degree_id`
JOIN `course_teacher`
ON `courses`.`id` = `course_teacher`.`course_id`
JOIN `teachers`
ON `teachers`.`id` = `course_teacher`.`teacher_id`
WHERE `teachers`.`id`= 44;

/*4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il
relativo dipartimento, in ordine alfabetico per cognome e nome */
SELECT DISTINCT`students`.`surname` AS 'Cognome Studenti',`students`.`name`AS 'Nome Studenti',`departments`.`name` AS 'Dipartimento',`degrees`.*
FROM `students`
LEFT JOIN `degrees`
ON `degrees`.`id` = `students`.`degree_id`
JOIN `departments`
ON `departments`.`id` = `degrees`.`department_id`
ORDER BY`students`.`surname` ASC;

--5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT `degrees`.`name`AS 'Tipo di Corso',`courses`.`name` AS 'Nome singolo corso',`teachers`.`surname`,`teachers`.`name`
FROM `degrees`
JOIN `courses`
ON `degrees`.`id` = `courses`.`degree_id`
JOIN `course_teacher`
ON `courses`.`id` = `course_teacher`.`course_id`
JOIN `teachers`
ON `teachers`.`id` = `course_teacher`.`teacher_id`;

