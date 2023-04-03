--Challenge 1
SELECT a.au_id AS 'AUTHOR ID',
a.au_lname AS 'LAST NAME',
a.au_fname AS 'FIRST NAME',
ts.title AS 'TITLE',
pub.pub_name AS 'PUBLISHERS'
FROM authors a 
INNER JOIN titleauthor ta ON a.au_id = ta.au_id 
INNER JOIN titles ts ON ta.title_id = ts.title_id 
INNER JOIN publishers pub ON ts.pub_id = pub.pub_id 

--Challenge 2
SELECT a.au_id AS 'AUTHOR ID',
a.au_lname AS 'LAST NAME',
a.au_fname AS 'FIRST NAME',
pub.pub_name AS 'PUBLISHERS',
COUNT(ts.title_id) AS 'TITLE COUNT'
FROM authors a 
INNER JOIN titleauthor ta ON a.au_id = ta.au_id 
INNER JOIN titles ts ON ta.title_id = ts.title_id 
INNER JOIN publishers pub ON ts.pub_id = pub.pub_id 
GROUP BY ts.title_id 

--Challenge 3
SELECT a.au_id AS 'AUTHOR ID',
a.au_lname AS 'LAST NAME',
a.au_fname AS 'FIRST NAME',
SUM(s.qty) AS 'TOTAL'
FROM authors a 
FULL JOIN titleauthor ta ON a.au_id = ta.au_id 
LEFT JOIN sales s ON ta.title_id = s.title_id 
GROUP BY a.au_id
ORDER BY TOTAL DESC 
LIMIT 3

--Challenge 4
SELECT a.au_id AS 'AUTHOR ID',
a.au_lname AS 'LAST NAME',
a.au_fname AS 'FIRST NAME',
IFNULL (SUM(s.qty), 0) AS 'TOTAL'
FROM authors a 
FULL JOIN titleauthor ta ON a.au_id = ta.au_id 
LEFT JOIN sales s ON ta.title_id = s.title_id 
GROUP BY a.au_id
ORDER BY TOTAL DESC 