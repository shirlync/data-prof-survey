-- Looking at all the data (after excluding irrelevant columns)
SELECT 
	  [Unique ID]
      ,[Q1 - Which Title Best Fits your Current Role?]
      ,[Q2 - Did you switch careers into Data?]
      ,[Q3 - Current Yearly Salary (in USD)]
      ,[Q4 - What Industry do you work in?]
      ,[Q5 - Favorite Programming Language]
      ,[Q6 - How Happy are you in your Current Position with the followi]
      ,[Q6 - How Happy are you in your Current Position with the follow1]
      ,[Q6 - How Happy are you in your Current Position with the follow2]
      ,[Q6 - How Happy are you in your Current Position with the follow3]
      ,[Q6 - How Happy are you in your Current Position with the follow4]
      ,[Q6 - How Happy are you in your Current Position with the follow5]
      ,[Q7 - How difficult was it for you to break into Data?]
      ,[Q8 - If you were to look for a new job today, what would be the ]
      ,[Q9 - Male/Female?]
      ,[Q10 - Current Age]
      ,[Q11 - Which Country do you live in?]
      ,[Q12 - Highest Level of Education]
      ,[Q13 - Ethnicity]
  FROM [DataProfSurvey_ATA_June2023].[dbo].['DataProfSurvey_June2023']

-- Creating new table, and rename columns to data that I want to see
DROP TABLE IF EXISTS datapro_v3

CREATE TABLE datapro_v3 (
resp_id nvarchar(255)
,designation nvarchar(255)
,switch_to_data nvarchar(255)
,salary nvarchar(255)
,industry nvarchar(255)
,fave_programming_language nvarchar(255)
,happy_in_salary numeric
,happy_in_worklifebal numeric
,happy_in_coworkers numeric
,happy_in_mgmt numeric
,happy_in_upwardmobility numeric
,happy_in_learnnewthings numeric
,difficulty_into_data nvarchar(255)
,impt_in_newjob nvarchar(255)
,gender nvarchar(255)
,age nvarchar(255)
,country nvarchar(255)
,education_level nvarchar(255)
,ethnicity nvarchar(255)
)

INSERT INTO datapro_v3

SELECT 
	[Unique ID]
	,[Q1 - Which Title Best Fits your Current Role?]
	,[Q2 - Did you switch careers into Data?]
	,[Q3 - Current Yearly Salary (in USD)]
	,[Q4 - What Industry do you work in?]
    ,[Q5 - Favorite Programming Language]
    ,[Q6 - How Happy are you in your Current Position with the followi]
    ,[Q6 - How Happy are you in your Current Position with the follow1]
    ,[Q6 - How Happy are you in your Current Position with the follow2]
    ,[Q6 - How Happy are you in your Current Position with the follow3]
    ,[Q6 - How Happy are you in your Current Position with the follow4]
    ,[Q6 - How Happy are you in your Current Position with the follow5]
    ,[Q7 - How difficult was it for you to break into Data?]
    ,[Q8 - If you were to look for a new job today, what would be the ]
    ,[Q9 - Male/Female?]
    ,[Q10 - Current Age]
    ,[Q11 - Which Country do you live in?]
    ,[Q12 - Highest Level of Education]
    ,[Q13 - Ethnicity]
FROM [DataProfSurvey_ATA_June2023].[dbo].['DataProfSurvey_June2023']

SELECT *
FROM datapro_v3

-- Cleaning column: designation
SELECT DISTINCT
	designation
FROM datapro_v3

UPDATE datapro_v3
SET designation = REPLACE(designation, 'Other (Please Specify):', '')
WHERE designation LIKE 'Other (Please Specify):%';

UPDATE datapro_v3
SET designation = 
    CASE 
		WHEN designation = 'Business Analys' THEN 'Business Analyst'
		WHEN designation = 'Business Intelligence Analyst' THEN 'BI Analyst'
		WHEN designation = 'Business Intelligence Consultant' THEN 'BI Consultant'
		WHEN designation = 'Business Intelligence Developer' THEN 'BI Developer'
		WHEN designation = 'Business Intelligence Engineer' THEN 'BI Engineer'
		WHEN designation = 'BI consultant' THEN 'BI Consultant'
		WHEN designation = 'DBA' THEN 'Database Administrator'
		WHEN designation = 'Does a social media analyst count?' THEN 'Social Media Analyst'
		WHEN designation = 'Financial Analyst' THEN 'Finance Analyst'
		WHEN designation = 'FP&A Analyst' THEN 'Finance Analyst'
		WHEN designation = 'I work with data tools and can create simple dashboards but I am not a data scientist' THEN 'Data Analyst'
		WHEN designation = 'Insights analyst' THEN 'Insights Analyst'
		WHEN designation = 'Investigation specialist' THEN 'Investigation Specialist'
		WHEN designation = 'Jr. Data Scientist' THEN 'Junior Data Scientist'
		WHEN designation = 'Manager of a team of Data Analysts' THEN 'Analytics Manager'
		WHEN designation = 'Manager, Business Intelligence Develop' THEN 'BI Manager'
		WHEN designation = 'PMO' THEN 'Product Manager'
		WHEN designation = 'Analyst' THEN 'Data Analyst'
		WHEN designation = 'Analyst Primary Market Intelligence' THEN 'BI Analyst'
		WHEN designation = 'Billing analyst' THEN 'Billing Analyst'
		WHEN designation = 'Data manager' THEN 'Data Manager'
		WHEN designation = 'Power Bi Developer' THEN 'Power BI Developer'
		WHEN designation = 'Product owner' THEN 'Product Owner'
		WHEN designation = 'Reporting Adm' THEN 'Reporting Administrator'
		WHEN designation = 'RF Engineer' THEN 'Radio Frequency Engineer'
		WHEN designation = 'Sales & Marketing' THEN 'Sales & Marketing Analyst'
		WHEN designation = 'software engineer' THEN 'Software Engineer'
		WHEN designation = 'Software Engineer, AI' THEN 'Software Engineer'
		WHEN designation = 'Sr. Supply Chain Analyst' THEN 'Senior Supply Chain Analyst'
		WHEN designation = 'Student working as a data analyst intern' THEN 'Student/Looking/None'
		WHEN designation = 'Other (Please Specify)' THEN 'Student/Looking/None'
		WHEN designation = 'Systems configuration' THEN 'System Administrator'
		WHEN designation = 'Tableau admin' THEN 'Tableau Administrator'
		WHEN designation = 'Teacher' THEN 'Educator'
		WHEN designation = 'Technical consulta' THEN 'Technical Consultant'
		WHEN designation = 'Account manager' THEN 'Account Manager'
		WHEN designation = 'Ads operations' THEN 'Ads Operator'
		WHEN designation = 'Researchers' THEN 'Researcher'
		WHEN designation = 'Software support' THEN 'Software Support'
		WHEN designation = 'Director of Data Analytics' THEN 'Analytics Director'
		WHEN designation = 'Director' THEN 'Analytics Director'
    END
WHERE designation IN ('Business Analys','Business Intelligence Analyst','Business Intelligence Consultant'
	,'Business Intelligence Developer','Business Intelligence Engineer','BI consultant','DBA','Does a social media analyst count?'
	,'Financial Analyst','FP&A Analyst','I work with data tools and can create simple dashboards but I am not a data scientist' 
	,'Insights analyst','Investigation specialist','Jr. Data Scientist','Manager of a team of Data Analysts'
	,'Manager, Business Intelligence Develop','PMO','Analyst','Analyst Primary Market Intelligence','Data manager'
	,'Billing analyst','Power Bi Developer','Reporting Adm','RF Engineer','Sales & Marketing','software engineer','Software Engineer, AI'
	,'Sr. Supply Chain Analyst','Student working as a data analyst intern','Other (Please Specify)','Systems configuration'
	,'Tableau admin','Teacher','Technical consulta','Account manager','Ads operations','Product owner','Researchers','Software support'
	,'Director of Data Analytics','Director')

-- Cleaning column: industry
SELECT *
FROM datapro_v3
WHERE industry like 'None'
ORDER BY 1 

-- Remove Other please specify
UPDATE datapro_v3
SET industry = REPLACE(industry, 'Other (Please Specify):', '')
WHERE industry LIKE 'Other (Please Specify):%'

UPDATE datapro_v3
SET industry = 
    CASE 
		WHEN industry = ' Manufacturering' THEN 'Manufacturing'
		WHEN industry = 'Air transpo' THEN 'Aviation'
		WHEN industry = 'Avia' THEN 'Aviation'
		WHEN industry = 'Arrosp' THEN 'Aerospace'
		WHEN industry = 'Automobile (cars)' THEN 'Automotive'
		WHEN industry = 'Automobile Industry' THEN 'Automotive'
		WHEN industry = 'Beverage and foods' THEN 'Food & Beverage'
		WHEN industry = 'Biotech' THEN 'Biotechnology'
		WHEN industry = 'Cobsukting' THEN 'Consulting'
		WHEN industry = 'Cons' THEN 'Costruction'
		WHEN industry = 'Consumer Elec' THEN 'Consumer Electronics'
		WHEN industry = 'Consumer retail' THEN 'Retail'
		WHEN industry = 'Currently studying . Previously worked in Power Generation' THEN 'None'
		WHEN industry = 'Digital Mar' THEN 'Digital Marketing'
		WHEN industry = 'Ecom' THEN 'E-commerce'
		WHEN industry = 'Ecommerce' THEN 'E-commerce'
		WHEN industry = 'Energy (oil and gas)' THEN 'Energy'
		WHEN industry = 'fashion/online store' THEN 'E-commerce'
		WHEN industry = 'Food and bece' THEN 'Food & Beverage'
		WHEN industry = 'Food and Beverages' THEN 'Food & Beverage'
		WHEN industry = 'Foodservice' THEN 'Food & Beverage'
		WHEN industry = 'Foodservice Franchising' THEN 'Food & Beverage'
		WHEN industry = 'Gover' THEN 'Government'
		WHEN industry = 'Government Administration' THEN 'Government'
		WHEN industry = 'Government programs' THEN 'Government'
		WHEN industry = 'Home maker' THEN 'None'
		WHEN industry = 'I am a student' THEN 'None'
		WHEN industry = 'I am student.' THEN 'None'
		WHEN industry = 'i`m currently student' THEN 'None'
		WHEN industry = 'Igaming' THEN 'Gaming'
		WHEN industry = 'Interning in Sciences, Weather and Meteorological data' THEN 'Meteorology'
		WHEN industry = 'last mile delivery logistics' THEN 'Logistics'
		WHEN industry = 'Logistics and warehousing' THEN 'Logistics'
		WHEN industry = 'Manuf' THEN 'Manufacturing'
		WHEN industry = 'Manufa' THEN 'Manufacturing'
		WHEN industry = 'Manufacturing (Chemicals)' THEN 'Manufacturing'
		WHEN industry = 'Medical industry' THEN 'Healthcare'
		WHEN industry = 'Non profit Animal Welfare' THEN 'Non-Profit Organization'
		WHEN industry = 'Non Profit Organization' THEN 'Non-Profit Organization'
		WHEN industry = 'none' THEN 'None'
		WHEN industry = 'Nonprofit' THEN 'Non-Profit Organization'
		WHEN industry = 'Not currently working' THEN 'None'
		WHEN industry = 'Not working at the moment, but previously I have been into Education industry' THEN 'None'
		WHEN industry = 'Oil and gas' THEN 'Energy'
		WHEN industry = 'Other (Please Specify)' THEN 'None'
		WHEN industry = 'Reta' THEN 'Retail'
		WHEN industry = 'Retails' THEN 'Retail'
		WHEN industry = 'Semiconductor manufacturing' THEN 'Manufacturing'
		WHEN industry = 'Space & Defense' THEN 'Aerospace'
		WHEN industry = 'State' THEN 'Government'
		WHEN industry = 'State Government' THEN 'Government'
		WHEN industry = 'Student' THEN 'None'
		WHEN industry = 'Supply Chain' THEN 'Logistics'
		WHEN industry = 'Supply Chain - warehousing, transpiration and' THEN 'Logistics'
		WHEN industry = 'Taking bootcamp' THEN 'None'
		WHEN industry = 'Unemployed, trying to switch career' THEN 'None'
		WHEN industry = 'Third Party Logistics' THEN 'Logistics'
		WHEN industry = 'Utili' THEN 'Utilities'
		WHEN industry = 'Warehouse' THEN 'Logistics'
		WHEN industry = '' THEN 'None'
		WHEN industry = 'Audit Firm' THEN 'Audit Services'
		WHEN industry = 'Chemical Manufacturing' THEN 'Manufacturing'
		WHEN industry = 'Clean Energy' THEN 'Energy'
		WHEN industry = 'Costruction' THEN 'Construction'
		WHEN industry = 'Coworking space' THEN 'Co-working'
		WHEN industry = 'Culture' THEN 'Cultural'
		WHEN industry = 'Customer support' THEN 'Customer Services'
		WHEN industry = 'Customer Service' THEN 'Customer Services'
		WHEN industry = 'Data insights company' THEN 'Analytics Services'
		WHEN industry = 'Demography and Social Statistics' THEN 'Government'
		WHEN industry = 'Digital Marketing' THEN 'Marketing'
		WHEN industry = 'Direct Marketing' THEN 'Marketing'
		WHEN industry = 'Consumer Electronics' THEN 'Electronics'
		WHEN industry = 'General contractor' THEN 'Construction'
		WHEN industry = 'Home and living' THEN 'Retail'
		WHEN industry = 'Homelessness' THEN 'Non-Profit Organization'
		WHEN industry = 'IT' THEN 'IT & Technology'
		WHEN industry = 'Tech' THEN 'IT & Technology'
		WHEN industry = 'Management' THEN 'Consulting'
		WHEN industry = 'Media & advertising' THEN 'Advertising'
		WHEN industry = 'NGO - Legislation' THEN 'Non-Profit Organization'
		WHEN industry = 'Social work' THEN 'Non-Profit Organization'
		WHEN industry = 'Police / Emergency Services' THEN 'Law Enforcement'
		WHEN industry = 'Outsourcing' THEN 'Professional Services'
		WHEN industry = 'Public transport' THEN 'Transportation'
		WHEN industry = 'Renewable Resources' THEN 'Energy'
		WHEN industry = 'Research (non-clincial)' THEN 'Research (Non-Clinical)'
		WHEN industry = 'Sensors' THEN 'Manufacturing'
		WHEN industry = 'Sports/Marketing' THEN 'Sports'
		WHEN industry = 'sports' THEN 'Sports'
		WHEN industry = 'Staffing and Recruting' THEN 'Staffing & Recruitment'
		WHEN industry = 'Workforce' THEN 'Staffing & Recruitment'
		WHEN industry = 'Cosmetics' THEN 'Beauty'
		WHEN industry = 'Distribution' THEN 'Logistics'
    END
WHERE industry IN (' Manufacturering','Air transpo','Arrosp','Automobile (cars)','Automobile Industry','Avia'
					,'Beverage and foods','Biotech','Cobsukting','Cons','Consulti','Consumer Elec','Consumer retail'
					,'Currently studying . Previously worked in Power Generation','Digital Mar','Ecom','Ecommerce'
					,'Energy (oil and gas)','fashion/online store','Food and bece','Foodservice','Food and Beverages'
					,'Foodservice Franchising','Gover','Government Administration','Government programs','Home maker'
					,'I am a student','I am student.','i`m currently student','Igaming','Interning in Sciences, Weather and Meteorological data'
					,'last mile delivery logistics','Logistics and warehousing','Looking for job','Manuf','Manufa'
					,'Manufacturing (Chemicals)','Medical industry','Non profit Animal Welfare','Non Profit Organization'
					,'none','None for now','Nonprofit','Not currently working','Not working at the moment, but previously I have been into Education industry'
					,'Not working yet','Oil and gas','Other (Please Specify)','Reta','Retails','Semiconductor manufacturing'
					,'Space & Defense','State','State Government','Student','Supply Chain','Supply Chain - warehousing, transpiration and'
					,'Taking bootcamp','Third Party Logistics','Unemployed, trying to switch career','Utili','Warehouse'
					,'NULL','','Audit Firm','Chemical Manufacturing','Clean Energy','Costruction','Coworking space'
					,'Customer support','Customer Service','Data insights company','Demography and Social Statistics','Digital Marketing'
					,'Direct Marketing','Consumer Electronics','General contractor','Home and living','Homelessness'
					,'IT','Tech','Management','Media & advertising','NGO - Legislation','Police / Emergency Services'
					,'Outsourcing','Public transport','Renewable Resources','Research (non-clincial)','Sensors','Social work'
					,'Sports/Marketing','Staffing and Recruting','Workforce','Cosmetics','Culture','Distribution','sports')

-- Set NULL as None
UPDATE datapro_v3
SET industry = COALESCE(industry, 'None')

-- Cleaning column: Favourite Programming Language
SELECT DISTINCT
	fave_programming_language
FROM datapro_v3
ORDER BY 1 

UPDATE datapro_v3
SET fave_programming_language = REPLACE(fave_programming_language, 'Other:', '')
WHERE fave_programming_language LIKE 'Other:%'

UPDATE datapro_v3
SET fave_programming_language = 
    CASE 
		WHEN fave_programming_language = 'Excel/SQL' THEN 'Excel'
		WHEN fave_programming_language = 'Dont require' THEN 'None'
		WHEN fave_programming_language = 'I currently do not work with programming languages yet' THEN 'None'
		WHEN fave_programming_language = 'I don’t know any' THEN 'None'
		WHEN fave_programming_language = 'I don''t use programming in my role' THEN 'None'
		WHEN fave_programming_language = 'I do analysis and create presentations based on datasets provided by others' THEN 'None'
		WHEN fave_programming_language = 'i mean, i mostly work in SQL and its variants?' THEN 'SQL'
		WHEN fave_programming_language = 'If SQL is categorised as a programming language then I will definitely say SQL. Since I am still learning, I can''t give a definite answer in relation to the abover mentioned but for the sake of choosing I will say R then followed by python' THEN 'SQL'
		WHEN fave_programming_language = 'JavaScript' THEN 'Javascript'
		WHEN fave_programming_language = 'Java' THEN 'Javascript'
		WHEN fave_programming_language = 'Mainly use Excel' THEN 'Excel'
		WHEN fave_programming_language = 'Just started learning' THEN 'None'
		WHEN fave_programming_language = 'Knowledge of Excel and SQL yet' THEN 'Excel'
		WHEN fave_programming_language = 'Mostly use sql but that’s not programming language..' THEN 'SQL'
		WHEN fave_programming_language = 'NA' THEN 'None'
		WHEN fave_programming_language = 'None at the moment' THEN 'None'
		WHEN fave_programming_language = 'Other' THEN 'None'
		WHEN fave_programming_language = 'Php' THEN 'PHP'
		WHEN fave_programming_language = 'Power bi' THEN 'Power BI'
		WHEN fave_programming_language = 'Qlik sense script' THEN 'Qlik Sense'
		WHEN fave_programming_language = 'SAS SQL' THEN 'SAS'
		WHEN fave_programming_language = 'Sql' THEN 'SQL'
		WHEN fave_programming_language = 'Sql &  plsql' THEN 'SQL'
		WHEN fave_programming_language = 'SQL because that is all I know really well so far.' THEN 'SQL'
		WHEN fave_programming_language = 'SQL Postgres' THEN 'SQL'
		WHEN fave_programming_language = 'unknown' THEN 'None'
		WHEN fave_programming_language = 'Vba' THEN 'VBA'
	END
WHERE fave_programming_language IN ('Excel/SQL','Dont require','I currently do not work with programming languages yet'
			,'I don''t use programming in my role','I don’t know any','I do analysis and create presentations based on datasets provided by others'
			,'i mean, i mostly work in SQL and its variants?','If SQL is categorised as a programming language then I will definitely say SQL. Since I am still learning, I can''t give a definite answer in relation to the abover mentioned but for the sake of choosing I will say R then followed by python'
			,'JavaScript','Java','Just started learning','Knowledge of Excel and SQL yet','Mainly use Excel'
			,'Mostly use sql but that’s not programming language..','NA','None at the moment','Other','Php','Power bi'
			,'Qlik sense script','SAS SQL','Sql','Sql &  plsql','SQL because that is all I know really well so far.'
			,'SQL Postgres','unknown','Vba')

-- If still student/looking for job/don't have job, respondents should not have salary, industry and answer the happiness ratings
SELECT * FROM datapro_v3
WHERE designation = 'Student/Looking/None'

UPDATE datapro_v3
SET salary = NULL
    ,industry = NULL
	,happy_in_coworkers = NULL
	,happy_in_salary = NULL
	,happy_in_worklifebal = NULL
	,happy_in_mgmt = NULL
	,happy_in_upwardmobility = NULL
	,happy_in_learnnewthings = NULL
WHERE designation = 'Student/Looking/None'

-- Cleaning column: country
SELECT DISTINCT country FROM datapro_v3

UPDATE datapro_v3
SET country = REPLACE(country, 'Other (Please Specify):', '')
WHERE country LIKE 'Other (Please Specify):%'

UPDATE datapro_v3
SET country = 
    CASE 
		WHEN country = ' Somalia' THEN 'Somalia'
		WHEN country = 'Africa (Nigeria)' THEN 'Nigeria'
		WHEN country = 'Argentine' THEN 'Argentina'
		WHEN country = 'Austr' THEN 'Australia'
		WHEN country = 'Brazik' THEN 'Brazil'
		WHEN country = 'Fin' THEN 'Finland'
		WHEN country = 'ghana' THEN 'Ghana'
		WHEN country = 'Ire' THEN 'Ireland'
		WHEN country = 'Irel' THEN 'Ireland'
		WHEN country = 'Kenua' THEN 'Kenya'
		WHEN country = 'Leba' THEN 'Lebanon'
		WHEN country = 'Niger' THEN 'Nigeria'
		WHEN country = 'Other (Please Specify)' THEN 'None'
		WHEN country = 'Perú' THEN 'Peru'
		WHEN country = 'Portugsl' THEN 'Portugal'
		WHEN country = 'Republic democratic of Congo' THEN 'Congo'
		WHEN country = 'SG' THEN 'Singapore'
		WHEN country = 'Sri lanka' THEN 'Sri Lanka'
		WHEN country = 'TUNISIA' THEN 'Tunisia'
		WHEN country = 'UAE' THEN 'United Arab Emirates'
		WHEN country = 'uzb' THEN 'Uzbekistan'
		WHEN country = 'Aisa' THEN 'None'
	END
WHERE country IN (' Somalia','Africa (Nigeria)','Argentine','Austr','Fin','Brazik','ghana','Ire','Irel','Kenua','Leba'
				,'Niger','Other (Please Specify)','Perú','Portugsl','Republic democratic of Congo','SG','TUNISIA'
				,'Sri lanka','UAE','uzb','Aisa')

-- Remove ethnicity column
ALTER TABLE datapro_v3
DROP COLUMN ethnicity

-- Cleaning column: education_level
SELECT DISTINCT education_level FROM datapro_v3

UPDATE datapro_v3
SET education_level = 'None'
WHERE education_level = ''

-- Cleaning column: age
SELECT DISTINCT age, age_group FROM datapro_v3
SELECT * FROM datapro_v3

ALTER TABLE datapro_v3
ADD age_group nvarchar(255)

UPDATE datapro_v3
SET age_group = 
    CASE 
		WHEN age < 20 THEN 'Less than 20'
		WHEN age < 30 THEN 'In the 20s'
		WHEN age < 40 THEN 'In the 30s'
		WHEN age < 50 THEN 'In the 40s'
		WHEN age < 60 THEN 'In the 50s'
		WHEN age < 70 THEN 'In the 60s'
		ELSE 'More than 70'
	END

-- Cleaning column: importance when looking for new job
SELECT DISTINCT impt_in_newjob, impt_in_newjob_group FROM datapro_v3

ALTER TABLE datapro_v3
ADD impt_in_newjob_group nvarchar(255)

UPDATE datapro_v3
SET impt_in_newjob = REPLACE(impt_in_newjob, 'Other (Please Specify):', '')
WHERE impt_in_newjob LIKE 'Other (Please Specify):%'

UPDATE datapro_v3
SET impt_in_newjob_group = 
    CASE 
		WHEN impt_in_newjob = 'All of the above' THEN 'Better salary, Remote work, Good culture, Good work/life balance'
		WHEN impt_in_newjob = 'All of the options are important to me when looking for a new job' THEN 'Better salary, Remote work, Good culture, Good work/life balance'
		WHEN impt_in_newjob = 'Better Tech Stack' THEN 'Strong data-driven company/team'
		WHEN impt_in_newjob = 'Better Salary' THEN 'Better salary'
		WHEN impt_in_newjob = 'Better work & remote salary' THEN 'Better salary, Remote work'
		WHEN impt_in_newjob = 'Both Good work / life Balance and Good Culture' THEN 'Good culture, Good work/life balance'
		WHEN impt_in_newjob = 'Career Advancedment' THEN 'Good opportunities/development/advancement'
		WHEN impt_in_newjob = 'Challenging / exciting problems' THEN 'Challenging/Exciting problems'
		WHEN impt_in_newjob = 'Collaboration' THEN 'Teamwork/Collaboration'
		WHEN impt_in_newjob = 'Currently very happy with where I am.' THEN 'None'
		WHEN impt_in_newjob = 'Different job title, either product owner or consulting' THEN 'Designation'
		WHEN impt_in_newjob = 'Good Culture' THEN 'Good culture'
		WHEN impt_in_newjob = 'Good opportunities in projects and learnjng' THEN 'Good opportunities/development/advancement'
		WHEN impt_in_newjob = 'Development' THEN 'Good opportunities/development'
		WHEN impt_in_newjob = 'I just started and I don''t like programming so much, so I would search for a more "impactiful" role. Meaning: being able to take decisions that steer the business.' THEN 'Challenging/Exciting problems'
		WHEN impt_in_newjob = 'I would say a combination of good work/life balance with a better pay and the exposure to a workplace that supposed growth' THEN 'Better salary, Good work/life balance, Good opportunities/development'
		WHEN impt_in_newjob = 'Intresting work' THEN 'Challenging/Exciting problems'
		WHEN impt_in_newjob = 'an environment that encourages growth like where I work currently and better salary' THEN 'Better salary, Good opportunities/development'
		WHEN impt_in_newjob = 'Better Salary' THEN 'Better salary'
		WHEN impt_in_newjob = 'Good Work/Life Balance' THEN 'Good work/life balance'
		WHEN impt_in_newjob = 'Learning new skills' THEN 'Good opportunities/development/advancement'
		WHEN impt_in_newjob = 'Learning New Things' THEN 'Good opportunities/development/advancement'
		WHEN impt_in_newjob = 'Learning opportunity' THEN 'Good opportunities/development/advancement'
		WHEN impt_in_newjob = 'Learning possibilities' THEN 'Good opportunities/development/advancement'
		WHEN impt_in_newjob = 'Mentorship from leading Data Analyst' THEN 'Leadership/Mentorship'
		WHEN impt_in_newjob = 'Mix of better salary, good work/life balance, remote work and good culture' THEN 'Better salary, Remote work, Good culture, Good work/life balance'
		WHEN impt_in_newjob = 'My passion is to become a Data analyst' THEN 'None'
		WHEN impt_in_newjob = 'Opportunities for growth' THEN 'Good opportunities/development/advancement'
		WHEN impt_in_newjob = 'Opportunity for advancement' THEN 'Good opportunities/development/advancement'
		WHEN impt_in_newjob = 'Opportunity to learn' THEN 'Good opportunities/development/advancement'
		WHEN impt_in_newjob = 'Projects I’m interested in' THEN 'Challenging/Exciting problems'
		WHEN impt_in_newjob = 'Remote too' THEN 'Remote work'
		WHEN impt_in_newjob = 'Remote Work' THEN 'Remote work'
		WHEN impt_in_newjob = 'Salary and expo' THEN 'Better salary'
		WHEN impt_in_newjob = 'The work' THEN 'Challenging/Exciting problems'
		WHEN impt_in_newjob = 'Want to move from Australia to Canada, so position in desired country' THEN 'Desired country'
		WHEN impt_in_newjob = 'Strong organizational data strategy, high-performing team' THEN 'Strong data-driven company/team'
		WHEN impt_in_newjob = 'Data Maturity' THEN 'Strong data-driven company/team'
		WHEN impt_in_newjob = 'Good Work/Life Balance' THEN 'Good work/life balance'
		WHEN impt_in_newjob = 'In office work' THEN 'Work in the office'
		WHEN impt_in_newjob = 'Responsibilities' THEN 'Good opportunities/development/advancement'
	END
WHERE impt_in_newjob IN ('All of the above','All of the options are important to me when looking for a new job'
			,'Better Tech Stack','Challenging / exciting problems','Collaboration','Currently very happy with where I am.'
			,'Different job title, either product owner or consulting','Good Culture','Development'
			,'Good opportunities in projects and learnjng','I just started and I don''t like programming so much, so I would search for a more "impactiful" role. Meaning: being able to take decisions that steer the business.'
			,'I would say a combination of good work/life balance with a better pay and the exposure to a workplace that supposed growth'
			,'Intresting work','an environment that encourages growth like where I work currently and better salary','Better Salary'
			,'Better work & remote salary','Career Advancedment','Both Good work / life Balance and Good Culture'
			,'Development','Learning new skills','Learning New Things','Learning opportunity','Learning possibilities'
			,'Mentorship from leading Data Analyst','Mix of better salary, good work/life balance, remote work and good culture'
			,'My passion is to become a Data analyst','Opportunities for growth','Opportunity for advancement','Opportunity to learn'
			,'Remote too','Remote Work','Salary and expo','The work','Want to move from Australia to Canada, so position in desired country'
			,'Strong organizational data strategy, high-performing team','Projects I’m interested in','Data Maturity'
			,'Good Work/Life Balance','In office work','Responsibilities')

-- Cleaning column: salary
ALTER TABLE datapro_v3
DROP COLUMN salary_group

ALTER TABLE datapro_v3
ADD avg_salary_group float

SELECT DISTINCT salary, avg_salary_group FROM datapro_v3

UPDATE datapro_v3
SET avg_salary_group = 
    CASE 
        WHEN salary = '0-40k' THEN (0+40)/2
        WHEN salary = '106k-125k' THEN (106+125)/2
		WHEN salary = '125k-150k' THEN (150+125)/2
		WHEN salary = '150k-225k' THEN (150+225)/2
		WHEN salary = '225k+' THEN 225
		WHEN salary = '41k-65k' THEN (41+65)/2
		WHEN salary = '66k-85k' THEN (66+85)/2
		WHEN salary = '86k-105k' THEN (86+105)/2
        ELSE NULL
    END

SELECT * FROM datapro_v3




