-- 1. Which courses are currently included (active) in the program? Include the course mnemonic and course name for each.

SELECT MnemonicID, CourseName 
FROM DS5111_SU24.SME5QYX.COURSES_ERD 
WHERE IsActive = TRUE;

-- 2. Which courses were included in the program, but are no longer active? Include the course mnemonic and course name for each.

SELECT MnemonicID, CourseName 
FROM DS5111_SU24.SME5QYX.COURSES_ERD
WHERE IsActive = FALSE;

-- 3. Which instructors are not current employees?

SELECT InstructorID, InstructorName 
FROM DS5111_SU24.SME5QYX.INSTRUCTORS_ERD 
WHERE IsActive = FALSE;

-- 4. For each course (active and inactive), how many learning outcomes are there?

SELECT MnemonicID, COUNT(OutcomeID) AS LearningOutcomeCount
FROM DS5111_SU24.SME5QYX.LEARNING_OUTCOMES_ERD
GROUP BY MnemonicID;

-- 5. Are there any courses with no learning outcomes? If so, provide their mnemonics and names. 
--THERE IS AN ERROR HERE IN MY ANSWER, I DIDN'T FIX THE SPELLING IN THIS NOTEBOOK TO MATCH THE OTHERS. DS_BIZ_ANALYTICS DOESN'T BELONG HERE, PLEASE IGNORE- I LOADED MY DATA IN WRONG!!

SELECT c.MnemonicID, c.CourseName
FROM DS5111_SU24.SME5QYX.COURSES_ERD c
LEFT JOIN LEARNING_OUTCOMES_ERD lo ON c.MnemonicID = lo.MnemonicID
WHERE lo.OutcomeID IS NULL;

-- 6. Which courses include SQL as a learning outcome? Include the learning outcome descriptions, course mnemonics, and course names in your solution.

SELECT lo.LEARNINGOUTCOME, c.MnemonicID, c.CourseName
FROM LEARNING_OUTCOMES_ERD lo
JOIN COURSES_ERD c ON lo.MnemonicID = c.MnemonicID
WHERE lo.LearningOutcome LIKE '%SQL%';

-- 7. Who taught course ds5100 in Summer 2021?

SELECT i.InstructorName
FROM DS5111_SU24.SME5QYX.COURSE_ASSIGNMENT_ERD ca
JOIN DS5111_SU24.SME5QYX.INSTRUCTORS_ERD i ON ca.InstructorID = i.InstructorID
WHERE ca.MnemonicID = 'ds5100' AND ca.Term = 'summer2021';

-- 8. Which instructors taught in Fall 2021? Order their names alphabetically, making sure the names are unique.

SELECT DISTINCT i.InstructorName
FROM DS5111_SU24.SME5QYX.COURSE_ASSIGNMENT_ERD ca
JOIN DS5111_SU24.SME5QYX.INSTRUCTORS_ERD i ON ca.InstructorID = i.InstructorID
WHERE ca.Term = 'fall2021'
ORDER BY i.InstructorName;

-- 9. How many courses did each instructor teach in each term? Order your results by term and then instructor.

SELECT ca.Term, i.InstructorName, COUNT(ca.MnemonicID) AS CourseCount
FROM DS5111_SU24.SME5QYX.COURSE_ASSIGNMENT_ERD ca
JOIN DS5111_SU24.SME5QYX.INSTRUCTORS_ERD i ON ca.InstructorID = i.InstructorID
GROUP BY ca.Term, i.InstructorName
ORDER BY ca.Term, i.InstructorName;

-- 10a. Which courses had more than one instructor for the same term? Provide the mnemonic and term for each. Note this occurs in courses with multiple sections.

SELECT ca.MnemonicID, ca.Term
FROM DS5111_SU24.SME5QYX.COURSE_ASSIGNMENT_ERD ca
GROUP BY ca.MnemonicID, ca.Term
HAVING COUNT(ca.InstructorID) > 1;

-- 10b. For courses with multiple sections, provide the term, course mnemonic, and instructor name for each. Hint: You can use your result from 10a in a subquery or WITH clause.

WITH MultipleInstructors AS (
    SELECT ca.MnemonicID, ca.Term
    FROM DS5111_SU24.SME5QYX.COURSE_ASSIGNMENT_ERD ca
    GROUP BY ca.MnemonicID, ca.Term
    HAVING COUNT(ca.InstructorID) > 1
)
SELECT ca.Term, ca.MnemonicID, i.InstructorName
FROM DS5111_SU24.SME5QYX.COURSE_ASSIGNMENT_ERD ca
JOIN DS5111_SU24.SME5QYX.INSTRUCTORS_ERD i ON ca.InstructorID = i.InstructorID
JOIN MultipleInstructors mi ON ca.MnemonicID = mi.MnemonicID AND ca.Term = mi.Term;
