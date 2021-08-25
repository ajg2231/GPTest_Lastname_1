/*CREATE TABLE blue_roots_donors_3 (
	voterID int PRIMARY KEY,
	Urbanicity varchar(10),
	Date_of_birth int,
	Gender char(1),
	Married bit,
	Homeowner bit,
	Has_children bit,
	Zipcode char(4),
	Modeled_charitable_giving int,
	Household_income int,
	Unaffiliated_voter bit,
	Modeled_activist_score real,
	Modeled_turnout_score real,
	Discretionary_income_level int,
	Nonsaver_level int,
	Modeled_partisan_score real,
	Survey_Respondent bit,
	Liberal_cause_donation int
);

COPY blue_roots_donors_3(voterID, Urbanicity, Date_of_birth, Gender, Married, Homeowner, Has_children, Zipcode, Modeled_charitable_giving, Household_income, Unaffiliated_voter, Modeled_activist_score, Modeled_turnout_score, Discretionary_income_level, Nonsaver_level, Modeled_partisan_score, Survey_Respondent, Liberal_Cause_Donation)
	FROM '/Users/alexandergoldstein/Desktop/gp_test_data.csv'
	DELIMITER ','
	CSV HEADER;
	
SELECT * FROM blue_roots_donors_3 WHERE Modeled_partisan_score > 80 AND Modeled_partisan_score > 70;*/

COPY (SELECT *,
	NTILE(2) OVER (partition by Modeled_partisan_score order by Modeled_turnout_score desc)
	FROM blue_roots_donors_3
	WHERE Modeled_partisan_score > 80
	AND Modeled_turnout_score > 70)
TO '/Users/alexandergoldstein/Desktop/blue_roots_3.csv'
CSV HEADER;
	