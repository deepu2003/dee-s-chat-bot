-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 15, 2024 at 05:20 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mce_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `question_answer`
--

CREATE TABLE `question_answer` (
  `question_id` int(11) NOT NULL,
  `question` longtext NOT NULL,
  `answer` longtext NOT NULL,
  `asked_count` int(11) DEFAULT 0,
  `created_dt` datetime NOT NULL DEFAULT current_timestamp(),
  `last_up_dt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `question_answer`
--

INSERT INTO `question_answer` (`question_id`, `question`, `answer`, `asked_count`, `created_dt`, `last_up_dt`) VALUES
(1, 'introductionMessage', 'Hi there! I\'m here to help. If you have any questions or need assistance, just let me know. For further support, could you please provide your email address?', 0, '2024-07-14 11:47:26', '2024-07-14 22:50:12'),
(2, 'noResultsMessage', 'Sorry, I cannot assist with that request.', 0, '2024-07-14 11:54:17', '2024-07-14 22:50:12'),
(3, 'What is vision?', 'To be an Institute of Excellence in Engineering Education and Research, producing socially responsible Professionals.<br>', 4, '2024-07-14 22:31:28', '2024-07-14 23:16:00'),
(4, 'What is mission?', '• Create conducive environment for learning & research <br> • Establish industry and academia collaborations <br> • Ensure professional and ethical values in all institutional endeavors <br>', 6, '2024-07-14 22:31:28', '2024-07-14 23:46:04'),
(5, 'What are the important telephone numbers for MCE, Hassan?', 'Principal: Dr. C.V. Venkatesh - 245317 <br>, MCE Office - 245317, 245683, 245658, 269234, 245216, 268371 <br>, Fax - [Fax Number], Boys Hostel - [Boys Hostel Numbers] <br>, Ladies Hostel - [Ladies Hostel Numbers]<br>, Canara Bank - [Canara Bank Number]<br>, SBM (Haralahally Branch) - [SBM Number]<br>, MTES (O) - [MTES Number]<br>', 2, '2024-07-14 22:31:28', '2024-07-14 23:46:08'),
(6, 'What is the telephone number of Principal of MCE, Hassan?', '245317<br>', 1, '2024-07-14 22:31:28', '2024-07-14 23:46:11'),
(7, 'What are the telephone numbers of MCE Office in Hassan?', '245317<br>', 10, '2024-07-14 22:31:28', '2024-07-14 23:46:17'),
(8, 'What is the fax number of MCE, Hassan?', '245683<br>', 0, '2024-07-14 22:31:28', '2024-07-14 22:50:12'),
(9, 'What are the telephone numbers of Boys Hostel in MCE, Hassan?', '245683<br>', 0, '2024-07-14 22:31:28', '2024-07-14 22:50:12'),
(10, 'What are the telephone numbers of Ladies Hostel in MCE, Hassan?', '269234<br>', 0, '2024-07-14 22:31:28', '2024-07-14 22:50:12'),
(11, 'What is the telephone number of Canara Bank in MCE, Hassan?', '269234<br>', 0, '2024-07-14 22:31:28', '2024-07-14 22:50:12'),
(12, 'What is the telephone number of SBM (Haralahally Branch) in MCE, Hassan?', '245216<br>', 0, '2024-07-14 22:31:28', '2024-07-14 22:50:12'),
(13, 'What is the telephone number of MTES (O) in MCE, Hassan?', '268371<br>', 0, '2024-07-14 22:31:28', '2024-07-14 22:50:12'),
(14, 'Who are the faculty and staff members at MCE, Hassan?', '1. Dr. C.V. Venkatesh, Principal - Chairman of the Council <br>\r\n  	2. Dr. P.C Srikanth, Dean (Planning & Development), Professor & Head, Dept. of E&C Engg <br>\r\n  	3. Dr. B. Uma, Dean (AA), Professor, Dept. of CS & Engg <br>\r\n  	4. Dr. S. Pradeep, Dean (Exams), Professor, Dept. of Mechanical Engg <br>\r\n  	5. Dr. H.S. Narasimhan, Associate Dean (Exams), Associate Professor, Dept. of Civil Engg <br>\r\n  	6. Dr. K. P. Ravikumar, Dean (SA), Professor, Dept. of Automobile Engg <br>\r\n  	7. Dr. A.J. Krishnaiah, Dean (PG Programmes), Professor, Dept. of Civil Engg <br>\r\n  	8. Dr. Mohankumar Chavan, Professor and Head, Dept. of Civil Engg <br>\r\n  	9. Dr. L. Laxman Naik, Professor & Head, Dept. of Mechanical Engg <br>\r\n  	10. Dr. N.S. Jyothi, Professor & Head, Dept. of E&E Engg <br>\r\n  	11. Dr. A.N. Basavaraju, Professor and Head, Dept. of Automobile Engg <br>\r\n  	12. Dr. MS Srinath, Professor and Head, Dept. of I&P Engg <br>\r\n  	13. Dr. A. Geetha Kiran, Professor and Head, Dept. of CS & Engg <br>\r\n  	14. Dr. G. Shivakumar, Dean (Research), Professor & Head, Dept. of E&I Engg <br>\r\n  	15. Dr. M.R. Rangaraju, I Year HoD, Professor and Head, Dept. of Physics <br>\r\n  	16. Dr. M.B. Jagadeesha, Professor & Head, Dept. of Chemistry <br>\r\n  	17. Dr. M.K. Partha, Professor & Head, Dept. of Mathematics <br>\r\n  	18. Sri. Sree Rajendra, PG Coordinator, Dept. of Mechanical Engg <br>\r\n  	19. Dr. Ezhil Vanna A, Professor, Dept. of Mechanical Engg <br>\r\n  	20. Dr. SRajanna, Associate Professor, Dept. of E&E Engg <br>\r\n  	21. Smt. R.S. Dakshayaini, Asst. Professor, Dept. of Civil Engg <br>\r\n  	22. Sri. B.B. Neelakantappa, Training and Placement Officer, Associate Professor, Dept. of CSC <br>\r\n  	23. Student representative<br>', 1, '2024-07-14 22:31:28', '2024-07-15 07:23:51'),
(15, 'Who are the external members (VTU Nominee) at MCE, Hassan?', '1. Dr. B. Sadashive Gowda, Principal, Vidyavardhaka College of Engineering, Mysuru <br>\r\n  	2. Dr. Shreedhara KS, Professor, Department of CSE, UBDT, Davanagere <br>\r\n  	3. Dr. Veena Desai, Professor, Department of ECE, Gogte Institute of Technology, Belagavi<br>', 0, '2024-07-14 22:31:28', '2024-07-14 22:50:12'),
(16, 'Who are the experts from industry and education sector at MCE, Hassan?', '1. Dr. Rajath Elias Soans, Senior Chief Engineer, Samsung Research Institutes, Bengaluru <br>\r\n  	2. Sri. Subramnaya A.G., Business Head, Micromatic Machine Tools Pvt. Ltd., Bengaluru <br>\r\n  	3. Sri. Sateesh Nanjappa, Vice President, Infosys <br>\r\n  	4. Dr. M.T. Venuraj, Professor Emeritus, Dept. of Civil Engg., M.C.E. Hassan <br>\r\n  	5. Sri. S. Premananda Shenoy, Director, Master Control Facility-ISRO, Hassan<br>', 0, '2024-07-14 22:31:28', '2024-07-14 22:50:12'),
(17, 'Who is the permanent invitee and academic advisor at MCE, Hassan?', 'Dr. N.C. Shivaprakash, Professor, Dept. of Instrumentation and Applied Physics, Indian Institute of Science, Bangalore<br>', 0, '2024-07-14 22:33:16', '2024-07-14 22:50:12'),
(18, 'What are the administrative officers and their contact details at MCE, Hassan?', '1. Principal - Dr. C.V. Venkatesh. B.E, M. Tech , Ph.D.<br>\r\n     	Email: cv@mcchassan.ac.in<br>\r\n     	Mobile: 9448719949, 9964911267<br>\r\n  	2. Dean - Academic Affairs - Dr. B. Uma.  B.E, M. Tech , Ph.D.<br>\r\n     	Email: bu@mcehassan.ac.in<br>\r\n     	Mobile: 9964911267<br>\r\n  	3. Dean - Planning & Development - Dr. P.C. Srikanth.  B.E, M. Tech , Ph.D.<br>\r\n     	Email: pcs@mcehassan.ac.in<br>\r\n     	Mobile: 9448401110<br>\r\n  	4. Dean - Exams - Dr. S. Pradeep. B.E, M. Sc, Ph.D.<br>\r\n     	Email: sp@mcehassan.ac.in<br>\r\n     	Mobile: 9740620519<br>\r\n  	5. Dean - SA - Dr. Ravikumar K.P. B.E, M. Tech , Ph.D.<br>\r\n     	Mobile: 9448919722, 9448427496<br>\r\n  	6. Associate-Dean Exams - Dr. H.S. Narashimhan. B.E, M. Tech , Ph.D.<br>\r\n     	Email: hsn@mcehassan.ac.in<br>\r\n	Mobile: 9448919722<br>\r\n  	7. Dean - PG Programmes - Dr. A.J. Krishnaiah. B.E, M. Sc(Engg), Ph.D.<br>\r\n     	Email: ajk@mcehassan.ac.in<br>\r\n     	Mobile: 9448427496<br>\r\n  	8. Dean - Research Programmes - Dr. G. Shivakumar. B.E, M. Tech , Ph.D.<br>\r\n     	Email: gs@mcehassan.ac.in<br>\r\n	Mobile: 9448742111<br>\r\n9. Co-ordinator - Library & Software Utilisation & Monitoring - Prof. K.A. Raghuram.<br>      \r\nEmail: rka@mcehassan.ac.in<br>\r\n	Mobile: 9731793730<br>\r\n 	10. Co-ordinator - Liaison Office - Dr. B. Ramesh.   B.E, M. Tech , Ph.D,FIE,<br>\r\n     	Email: br@mcehassan.ac.in<br>\r\n     	Mobile: 9448033872<br>\r\n	11. Training & Placement Officer - Mr. B.B. Neclakantappa <br>\r\nEmail: bbn@mcehassan.ac.in <br>\r\nMobile: 9480783006<br>\r\n12. Co-ordinator - TEQIP - Dr. N.S. Jyothi <br>\r\nEmail: ns@mcchassan.ac.in <br>\r\nMobile: 9448401110<br>\r\n13. Co-ordinator - SWAYAM - Dr. Ananda Babu J <br>\r\nEmail: abj@mcehassan.ac.in <br>\r\nMobile: 9844081383<br>\r\n14. Director - IIIC Co-ordinator : ME-RIISE - Dr. A. Geetha Kiran <br>\r\nEmail: agk@mcehassan.ac.in <br>\r\nMobile: 9448179074<br>\r\n15. Network Administrator - Mr. Tejonidhi M.R. <br>\r\nEmail: tmr@mcehassan.ac.in <br>\r\nMobile: 9844051956<br>\r\n16. Protocol Officer - Smt. Sumana Jayaprakash <br>\r\nEmail: -<br>\r\nMobile: 9449888177<br>', 0, '2024-07-14 22:33:16', '2024-07-14 22:50:12'),
(19, 'What is the definition of BoG?', 'Board of Governors (BoG)<br>', 0, '2024-07-14 22:33:16', '2024-07-14 22:50:12'),
(20, 'What is the definition of AC?', 'Academic Council (AC)<br>', 0, '2024-07-14 22:33:16', '2024-07-14 22:50:12'),
(21, 'What is the definition of BoS?', 'Board of Studies (BoS)<br>', 0, '2024-07-14 22:33:16', '2024-07-14 22:50:12'),
(22, 'What is the definition of BoE?', 'Board of Examiners (BoE)<br>', 0, '2024-07-14 22:33:16', '2024-07-14 22:50:12'),
(23, 'What is the definition of MEC?', 'Malpractice Enquiry Committee (MEC)<br>', 0, '2024-07-14 22:33:16', '2024-07-14 22:50:12'),
(24, 'What is the definition of GRC?', 'Grievance Redressal Committee (GRC)<br>', 0, '2024-07-14 22:33:16', '2024-07-14 22:50:12'),
(25, 'What is the definition of SDAC?', 'Standing Disciplinary Action Committee (SDAC)<br>', 0, '2024-07-14 22:33:16', '2024-07-14 22:50:12'),
(26, 'What is the definition of IQAC?', 'Internal Quality Assurance Cell (IQAC)<br>', 0, '2024-07-14 22:33:16', '2024-07-14 22:50:12'),
(27, 'What are the responsibilities of the Principal?', 'The Principal is the chief executive officer and administrative head of the college.<br>', 0, '2024-07-14 22:33:16', '2024-07-14 22:50:12'),
(28, 'What are the responsibilities of Dean AA?', 'Dean - Academic Affairs (Dean AA) oversees academic programs, curriculum development, and student academic affairs.<br>', 0, '2024-07-14 22:33:16', '2024-07-14 22:50:12'),
(29, 'What are the responsibilities of Dean SA?', 'Dean - Student Affairs (Dean SA) is responsible for student welfare, extracurricular activities, and discipline.<br>', 0, '2024-07-14 22:33:16', '2024-07-14 22:50:12'),
(30, 'What are the responsibilities of Dean Examinations?', 'Dean - Examinations manages the conduct of examinations and evaluation processes.<br>', 0, '2024-07-14 22:33:16', '2024-07-14 22:50:12'),
(31, 'What is CET?', 'Common Entrance Test (CET) conducted by the Government of Karnataka for admission to various courses.<br>', 1, '2024-07-14 22:33:16', '2024-07-15 00:32:48'),
(32, 'What is a Course?', 'A Course is a specific subject identified by its course-code and course-title with a specified syllabus offered during a specific academic session/semester.<br>', 0, '2024-07-14 22:33:16', '2024-07-14 22:50:12'),
(33, 'What is Curriculum?', 'Curriculum is the set of academic regulations, course structure, and course contents.<br>', 0, '2024-07-14 22:33:16', '2024-07-14 22:50:12'),
(34, 'What is the role of HoD?', 'Head of the Department (HoD) is responsible for departmental administration and academic leadership.<br>', 0, '2024-07-14 22:33:16', '2024-07-14 22:50:12'),
(35, 'What is the role of IAB?', 'Industry Advisory Board (IAB) provides guidance and industry perspective to the department.<br>', 0, '2024-07-14 22:33:16', '2024-07-14 22:50:12'),
(36, 'What is DAC?', 'Department Academic Committee/Internal Board of Studies (DAC) is responsible for academic affairs within a department.<br>', 0, '2024-07-14 22:33:16', '2024-07-14 22:50:12'),
(37, 'What is FA?', 'Faculty Adviser (FA) provides academic guidance and support to students.<br>', 0, '2024-07-14 22:33:16', '2024-07-14 22:50:12'),
(38, 'What is CF?', 'Course Faculty (CF) is responsible for teaching a specific course.<br>', 0, '2024-07-14 22:33:16', '2024-07-14 22:50:12'),
(39, 'What is CC?', 'Course Coordinator (CC) oversees the organization and administration of a specific course.<br>', 0, '2024-07-14 22:33:16', '2024-07-14 22:50:12'),
(40, 'What is FM?', 'Faculty Mentor (FM) provides mentorship and support to faculty members.<br>', 0, '2024-07-14 22:33:16', '2024-07-14 22:50:12'),
(41, 'What are the definitions of various terms and roles at MCE, Hassan?', '1. Department that offers the degree program the student has enrolled for: The Department responsible for offering the degree program in which a student is enrolled.<br>\r\n 	2. Program: Refers to the specific degree or course of study that a student is enrolled in.<br>\r\n 	3. Faculty who guides the project of the student(s) (ProjectGuide): The faculty member who provides guidance and supervision for student projects.<br>\r\n 	4. Set of governing rules (Regulations): The set of rules and guidelines that govern academic and administrative processes.<br>\r\n 	5. Visvesvaraya Technological University, Belagavi (VTU): A state university in Karnataka, India, governing engineering education.<br>\r\n 	6. Cumulative Grade Point Average (CGPA): The average of grade points obtained in all courses over multiple semesters.<br>\r\n 	7. Semester Grade Point Average (SGPA): The average of grade points obtained in courses during a specific semester.<br>\r\n 	8. Continuous Internal Evaluation (CIE): Includes assessments and evaluations conducted throughout the semester.<br>\r\n 	9. Semester End Examination (SEE): The final examination conducted at the end of each semester.<br>\r\n 	10. External Examination Centre (EC): Location where examinations are conducted outside of the college premises.<br>\r\n 	11. Provisional Degree Certificate (PDC): A temporary certificate awarded upon completion of degree requirements.<br>\r\n 	12. Campus Disciplinary Committee (CDC): Committee handling disciplinary matters within the college.<br>\r\n 	13. Parents Relations Centre (PRC): Facilitates communication and resolves issues between parents and the college.<br>\r\n 	14. Chief Superintendent of Examination (CSE): Oversees the conduct of examinations and ensures their smooth execution.<br>\r\n 	15. Deputy Chief Superintendent of Examination (Dy. CSE): Assists the CSE in managing examination procedures.<br>\r\n 	16. Special Grievance Redressal Committee (SGRC): Handles specific grievances and complaints brought forward by students or staff.<br>\r\n 	17. College Internal Complaints Committee (CICC): Addresses complaints related to harassment, discrimination, or misconduct within the college.<br>\r\n 	18. Board of Governors (BoG): The governing body responsible for overseeing the overall management and strategic direction of the college.<br>\r\n 	19. Academic Council (AC): A body responsible for academic policies, planning, and development at the college.<br>\r\n 	20. Board of Studies (BoS): A committee responsible for curriculum design, revision, and academic standards within specific disciplines.<br>\r\n 	21. Board of Examiners (BoE): Oversees the conduct and evaluation of examinations within the college.<br>\r\n 	22. Malpractice Enquiry Committee (MEC): Investigates and addresses cases of academic misconduct or malpractice.<br>\r\n 	23. Grievance Redressal Committee (GRC): Addresses and resolves grievances from students and faculty regarding academic or administrative matters.<br>\r\n 	24. Standing Disciplinary Action Committee (SDAC): Deals with disciplinary actions against students and staff for violations of college rules.<br>\r\n 	25. Internal Quality Assurance Cell (IQAC): Ensures quality enhancement and sustenance activities at the institutional level.<br>\r\n 	26. Principal: The chief executive officer and administrative head of the college.<br>\r\n 	27. Dean - Academic Affairs (Dean AA): Oversees academic programs, curriculum development, and student academic affairs.<br>\r\n 	28. Dean - Student Affairs (Dean SA): Responsible for student welfare, extracurricular activities, and discipline.<br>\r\n 	29. Dean - Examinations: Manages the conduct of examinations and evaluation processes.<br>\r\n 	30. Common Entrance Test (CET): Common Entrance Test conducted by the Government of Karnataka for admission to various courses.<br>\r\n 	31. Course: A specific subject identified by its course-code and course-title with a specified syllabus offered during an academic session/semester.<br>\r\n 	32. Curriculum: The set of academic regulations, course structure, and course contents.<br>\r\n 	33. Head of the Department (HoD): Responsible for departmental administration and academic leadership.<br>\r\n 	34. Industry Advisory Board (IAB): Provides guidance and industry perspective to the department.<br>\r\n 	35. Department Academic Committee/Internal Board of Studies (DAC): Responsible for academic affairs within a department.<br>\r\n 	36. Faculty Adviser (FA): Provides academic guidance and support to students.<br>\r\n 	37. Course Faculty (CF): Responsible for teaching a specific course.<br>\r\n 	38. Course Coordinator (CC): Oversees the organization and administration of a specific course.<br>\r\n 	39. Faculty Mentor (FM): Provides mentorship and support to faculty members.<br>', 0, '2024-07-14 22:36:01', '2024-07-14 22:50:12'),
(46, 'Who are the technical and administrative staff at MCE, Hassan?', '1. Mr. R. Manjunatha Kumar - Foreman/Programmer - rmk@mcehassan.ac.in - Contact: 9448427370<br>\r\n    2. Mrs. H. V. Meera - Foreman/Programmer - hvm@mcehassan.ac.in - Contact: 8880416655<br>\r\n    3. Mr. C. M. Somashekarappa - Assistant Instructor - mcs@mcehassan.ac.in - Contact: 9743737366<br>\r\n    4. Mr. Hemanth - Instructor - hta@mcehassan.ac.in - Contact: 9964901744<br>\r\n    5. Mrs. Manjula S - SDA - sma@mcehassan.ac.in - Contact: 9481116968<br>\r\n    6. Mrs. B. R. Nethravathi - Helper - nbr@mcehassan.ac.in - Contact: 9535729581<br>\r\n    7. Mr. Vinay Kumar H U - Helper - bsr@mcehassan.ac.in - Contact: Not Available<br>\r\n    8. Mr. Srinivas M. S. - Helper - sms@mcehassan.ac.in - Contact: 8792593221<br>\r\n    9. Ms. Meghana H. M. - Helper - hme@mcehassan.ac.in - Contact: 7019359232<br>\r\n    10. Mr. Srinivas B. S. - Instructor Mechanic - bsr@mcehassan.ac.in - Contact: 7406882603<br>', 1, '2024-07-14 22:40:24', '2024-07-15 00:33:03'),
(47, 'Who are the technical and administrative staff at the Department of Computer Science & Engineering, MCE, Hassan?', '1. Mr. B. B. Neelankatappa - Associate Professor / TPO - bbn@mcehassan.ac.in - Contact: 9448033872<br>\r\n    2. Dr. J. Chandrika - Professor - jc@mcehassan.ac.in - Contact: 9480783006<br>\r\n    3. Dr. Geethakiran A - Professor & Head - agk@mcehassan.ac.in - Contact: [Contact Number]<br>\r\n    4. Mr. H V Shashidhara - Associate Professor - hvs@mcehassan.ac.in - Contact: 9844352124<br>\r\n    5. Dr. Kavitha A. S. - Associate Professor - kks@mcehassan.ac.in - Contact: 9986699771<br>\r\n    6. Mrs. P. Sunitha - Assistant Professor - ps@mcehassan.ac.in - Contact: 8951181548<br>\r\n    7. Mrs. Ayeesha Siddigha - Assistant Professor - as@mcehassan.ac.in - Contact: 8970314569<br>\r\n    8. Mr. Keerthi K S - Assistant Professor - kks@mcehassan.ac.in - Contact: 8050487592<br>\r\n    9. Mr. Tejonidhi M. R. - Assistant Professor - tmr@mcehassan.ac.in - Contact: 9481116968<br>\r\n    10. Mrs. Kavyasri M. N. - Assistant Professor - mnk@mcehassan.ac.in - Contact: 9844051956<br>\r\n    11. Mrs. Shobha Chandra K. - Assistant Professor - ksc@mcehassan.ac.in - Contact: 9886894539<br>\r\n    12. Mrs. Shruthi T. R. - Assistant Professor - trs@mcehassan.ac.in - Contact: 7899561166<br>\r\n    13. Mr. Sumanth C. M. - Operator - cms@mcehassan.ac.in - Contact: 9535729581<br>\r\n    14. Mrs. Harshitha S - Assistant Professor - hss@mcehassan.ac.in - Contact: 9448871082<br>\r\n    15. Dr. Ramesh B - Professor - br@mcehassan.ac.in - Contact: 9448033872<br>\r\n    16. Mr. Prasanna K. S. - Assistant Professor - pks@mcehassan.ac.in - Contact: 9480943883<br>\r\n    17. Ms. Priya Neelakant - Assistant Professor - pn@mcehassan.ac.in - Contact: 9886894539<br>\r\n    18. Mr. A. M. Vinod - Assistant Professor - amv@mcehassan.ac.in - Contact: 8904289321<br>\r\n    19. Mr. Vasanth Kumar N. T. - Assistant Professor - ntv@mcehassan.ac.in - Contact: 8792593221<br>\r\n    20. Mr. Chandrashekar C. S. - Assistant Professor - csc@mcehassan.ac.in - Contact: 7019359232<br>\r\n    21. Mr. Ravikumar D - Assistant Professor - rd@mcehassan.ac.in - Contact: 7406882603<br>\r\n    22. Mrs. Varshitha K. C. - Assistant Professor - kcv@mcehassan.ac.in - Contact: 9731793730<br>\r\n    23. Mrs. Chandana H. M. - Assistant Professor - hmc@mcehassan.ac.in - Contact: 9448427496<br>\r\n    24. Mrs. Nayana R - Assistant Professor - nay@mcehassan.ac.in - Contact: 9448742111<br>\r\n    25. Mrs. Kavya D - Assistant Professor - dk@mcehassan.ac.in - Contact: 9740620519<br>\r\n    26. Mrs. Sangeetha S - Assistant Professor - sst@mcehassan.ac.in - Contact: 7892301196<br>\r\n    27. Mr. Madhu C. K. - Assistant Professor - mck@mcehassan.ac.in - Contact: 9448919722<br>\r\n    28. Mrs. Navyashree R - Assistant Professor - nvr@mcehassan.ac.in - Contact: 9964911267<br>\r\n    29. Dr. Arun Kumar - Assistant Professor - ak@mcehassan.ac.in - Contact: 9731793730<br>\r\n    30. Dr. Mallikarjun - Asst. Professor - mallikarjuna@2010@gmail.com - 9731283249<br>\r\n    31. Mrs. Nithyashree R - Asst. Professor - nithyashree.rn@mcchassan.ac.in - 7795691216<br>\r\n    32. Mrs. R. E. Margaret - Asst. Professor - rem@mcehassan.ac.in - Contact: 7892039359', 0, '2024-07-14 22:41:27', '2024-07-14 22:50:12'),
(48, 'What is the vision of Malnad Technical Education Society (MTES), Hassan?', 'To establish institutions of excellence and produce the best citizens who can contribute to global peace and prosperity', 0, '2024-07-14 22:41:27', '2024-07-14 22:50:12'),
(49, 'What is the mission of Malnad Technical Education Society (MTES), Hassan?', 'To contribute to the qualified manpower of the nation.<br>\r\n    To provide the best infrastructure and environment for quality education.<br>\r\n    To recruit and retain the finest faculty.<br>\r\n    To ensure enriching rewards to all stakeholders.<br>\r\n    To fulfill social obligations in all possible ways.', 0, '2024-07-14 22:41:27', '2024-07-14 22:50:12');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `created_dt` datetime NOT NULL DEFAULT current_timestamp(),
  `last_up_dt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `question_answer`
--
ALTER TABLE `question_answer`
  ADD PRIMARY KEY (`question_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `question_answer`
--
ALTER TABLE `question_answer`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
