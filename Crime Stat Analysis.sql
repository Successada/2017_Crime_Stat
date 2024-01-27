create database CrimeRecord
use CrimeRecord

select * from CrimeRegion
select * from crimestat


---------CRIME STATISTICS DATA
--You have just been employed as a Data Analyst to work with the Nigerian Police Force to analyze the data of crimes committed in the country
--in the year 2017 and provide insights and recommendations to reduce and completely eradicate these crimes.
--The Inspector General of Police wants you to prepare a report from the crime statistics and is asking for the following information from your report:

--1. Which state has the highest crime in the year?
select top 1 STATE,sum(NUMBER)as CRIME from CrimeStat
GROUP BY STATE
order by CRIME desc

--2. Which state is said to be the most peaceful state with the least crime for the year?
select top 1 STATE,sum(NUMBER)as CRIME from CrimeStat
GROUP BY STATE
order by CRIME asc

--3. What is the sum total of all crimes committed in the North East?
select R.REGION,sum(S.NUMBER)as Crime from CrimeRegion as R
left join CrimeStat as S
on R.STATE=S.STATE
where R.REGION='NORTH EAST'
group by R.REGION 

--4. Which state has the highest number of crimes against lawful authorities?
select top 1 STATE,OFFENCE_CATEGORY,sum(NUMBER) as Crime from CrimeStat
where OFFENCE_CATEGORY='OFFENCES AGAINST LAWFUL AUTH'
group by STATE,OFFENCE_CATEGORY
order by Crime desc

--5. Which geo-political region is said to have the highest crime rate?
select top 1 R.REGION,sum(S.NUMBER)crime from CrimeRegion as R
left join CrimeStat as S
on R.STATE=S.STATE
group by R.REGION
order by crime desc

--6. What is the number of crimes committed in Lagos state?
select R.STATE,SUM(S.NUMBER)AS CRIME from CrimeRegion as R
left join CrimeStat as S
on R.STATE=S.STATE
where R.STATE='LAGOS STATE'
GROUP BY R.STATE

--7. Which region and state has the highest number of crimes against properties?
select TOP 1 R.REGION,S.STATE,SUM(S.NUMBER)AS CRIME from CrimeRegion as R
left join CrimeStat as S
on R.STATE=S.STATE
WHERE OFFENCE_CATEGORY='OFFENCES AGAINST PROPERTY' 
GROUP BY R.REGION,S.STATE
ORDER BY CRIME DESC

--8. Highlight the top 5 states with the highest number of crimes committed.
SELECT TOP 5 STATE,SUM(NUMBER)AS CRIME FROM CrimeStat
GROUP BY STATE
ORDER BY CRIME DESC

--9. Which South Eastern state has the least number of crimes committed?
SELECT TOP 1 S.STATE,SUM(S.NUMBER)AS CRIME FROM CrimeRegion AS R
LEFT JOIN CrimeStat AS S
ON R.STATE=S.STATE
WHERE R.REGION='SOUTH EAST'
GROUP BY S.STATE
ORDER BY CRIME ASC

--10. Which region would you recommend that the security agencies should pay lower attention to?
select R.REGION,SUM(S.NUMBER)AS CRIME from CrimeRegion as R
left join CrimeStat as S
on R.STATE=S.STATE
GROUP BY R.REGION
ORDER BY CRIME ASC
--The region the security agencies should pay lower attention to is NORTH EAST



