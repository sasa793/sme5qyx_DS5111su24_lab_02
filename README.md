# Database Design Lab Answers

## *Part 1*

**1) What tables should you build?**

- **Courses**: contains course information like name, status, and description
- **Instructors**: contains instructors name and status
- **Course_Assignments**: describes what course is offered during each term with which instructor
- **Learning_Outcomes**: contains the learning objectives of each course

**2) For each table, what field(s) will you use for primary key?**

- **Courses**: MnemonicID
- **Instructors**: InstructorID 
- **Course_Assignments**: AssignmentID (superkey of  MnemonicID and InstructorID)
- **Learning_Outcomes**: OutcomeID

**3) For each table, what foreign keys will you use?**

- **Courses**: No foreign keys 
- **Instructors**: No foreign keys
- **Course_Assignments**: MnemonicID and InstructorID
- **Learning_Outcomes**: MnemonicID

**4) Learning outcomes, courses, and instructors need a flag to indicate if they are currently active or not. How will your database support this feature? In particular:**

**If a course will be taught again, it will be flagged as active. If the course won’t be taught again, it will be flagged as inactive.**
**It is important to track if an instructor is a current employee or not.**
**Learning outcomes for a course can change. You’ll want to track if a learning outcome is currently active or not.**

A boolean column was added to the tables Courses, Instructors, and Learning_Outcomes to handle this since it only affects those tables. The column was labeled “IsActive” with a TRUE or FALSE description, which will make everything easier to track.

**5) Is there anything to normalize in the database, and if so, how will you normalize it? Recall the desire to eliminate redundancy.**

Yes,there were a few things. By creating 2 separate tables with foreign keys that way they reference each other while avoiding redundancy. Also when dealing with non-atomic data like in the Course_Assignment table, it was normalized by having each instructor for the same course be a separate entry/row

**6) Are there indexes that you should build? Explain your reasoning.**

Yes I believe so. They should be built on primary and foreign keys (the 4 mentioned above in question 2). That way searches and joins will be quicker and the indexes will be also be useful when filtering data.

**7) Are there constraints to enforce? Explain your answer and strategy.**
**For example, these actions should not be allowed:**
**Entering learning objectives for a course not offered by the School of Data Science**
**Assigning an invalid instructor to a course**

- Each Instructor referenced in the courses_assigned table should already be in the instructor table. 
- All the data be correct and valid, that these are courses and information provided by the UVA School of Data Science
- Ensure columns have data populated and not null values
- Foreign keys should reference valid entries in other tables and match the primary key of other tables
- Primary keys are unique so there are no duplicates


**8) Draw and submit a Relational Model for your project. For an example, see Beginning Database Design Solutions page 115 Figure 5-28.**

About to upload in a sec, just finishign up part 2 real quick first :)

**9) Suppose you were asked if your database could also support the UVA SDS Residential MSDS Program. Explain any issues that might arise, changes to the database structure (schema), and new data that might be needed. Note you won’t actually need to support this use case for the project.**

Honestly, this shouldn’t be too bad. From my understanding, the residential and online programs have the same courses, just with different instructors. Our courses span a year and a half, while theirs are condensed into a year. Because of this, they might have different learning objectives to fit their program length so we’d need to adjust that table. We also need to add an extra column for the course delivery method. Similar to how SIS shows the location when we sign up for classes—whether it's “Web-based” or an actual classroom number—we can just indicate whether the course is online or residential. This will be useful in tables like instructors and course assignments. But we definitely need the data for all this as its not already provided like the residential was.

## *Part 2*

Coming soon, I'm working on it right now.. almost done ish!
