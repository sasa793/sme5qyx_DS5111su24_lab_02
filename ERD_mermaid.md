# Below is the mermaid code I put in mermaid live editor to output the image placed in the README file

```
erDiagram

    COURSES {
        VARCHAR MnemonicID PK
        TEXT CourseName
        TEXT CourseDescription
        BOOL IsActive
    }

    INSTRUCTORS {
        VARCHAR InstructorID PK
        TEXT InstructorName
        BOOL IsActive
    }

    LEARNING_OUTCOMES {
        VARCHAR OutcomeID PK
        VARCHAR MnemonicID FK
        TEXT LearningOutcome
        BOOL IsActive
    }

    COURSE_ASSIGNMENT {
        VARCHAR AssignmentID PK
        VARCHAR MnemonicID FK
        VARCHAR Term
        VARCHAR InstructorID FK
    }

    COURSES ||--o{ LEARNING_OUTCOMES : ""
    COURSES ||--o{ COURSE_ASSIGNMENT : ""
    INSTRUCTORS ||--o{ COURSE_ASSIGNMENT : ""
   
