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


-- 7. Da quanti dipartimenti è composta l'università? (12)


-- 8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50)



-- ------------------------------------------ QUERY CON GROUP BY


-- 1. Contare quanti iscritti ci sono stati ogni anno


-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio


-- 3. Calcolare la media dei voti di ogni appello d'esame


-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento