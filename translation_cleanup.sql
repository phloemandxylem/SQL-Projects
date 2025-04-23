--Select sales person name from those common to the set of bowlers who have earned revenue over 20000 this quarter and last quarter
Select SalesData.SalesFullName
FROM
  (SELECT DISTINCT Person.PersonId
