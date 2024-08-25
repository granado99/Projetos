## 1.Entendendo a tabela
select
	*
from
	usa_baby_names ubn

	
## 2.Os nomes que mais aparecem em todos os anos.'James','John','Robert'...
SELECT 
	first_name,
	sum(num) 
FROM 
	usa_baby_names ubn 
GROUP BY
	first_name 
ORDER BY 
	sum(num)  DESC 

## 3.Qual a popularidade dos nomes?
SELECT 
    first_name,
    COUNT("year") AS contagem_anos,
    CASE
        WHEN COUNT("year") > 70 THEN 'Clássico'
        WHEN COUNT("year") > 40 THEN 'Popular'
        WHEN COUNT("year") >20 THEN 'Mediano'
        ELSE 'Modinha'
    END AS Classificação
FROM 
    usa_baby_names ubn 
GROUP BY
    first_name
ORDER BY 
	contagem_anos DESC 
	
	
	
## 4. Quais são os nomes femininos mais bem classificados?

SELECT 
    first_name,
    SUM(num) AS quantidade
FROM 
    usa_baby_names ubn 
WHERE 
    sex = 'F' 
GROUP BY 
    first_name 
ORDER BY 
    quantidade DESC LIMIT 10;

	

##5. Escolher um nome de bebe feminino, que termine com a letra A, não quer nome entre os top10 mais vistos, e que seja de 2015 pra frente.
SELECT 
    first_name,
    SUM(num) AS contagem
FROM 
    usa_baby_names ubn
WHERE 
    first_name LIKE '%a'
    AND 
    "year" >= 2015
    AND 
    sex = 'F'
    AND
    first_name NOT IN (
        SELECT
            first_name
        FROM
            usa_baby_names ubn
        WHERE
            sex = 'F'
        GROUP BY
            first_name
        ORDER BY
            SUM(num) DESC
        LIMIT 10
    )
GROUP BY 
    first_name
ORDER BY 
    contagem DESC;


## 6. Quando o nome Oivia se tornou popular?
SELECT 
	*
FROM 
	usa_baby_names ubn 
WHERE 
	first_name = "Olivia"
ORDER BY 
	num DESC 

## 7. Qual é o nome masculino mais dado a cada ano?

SELECT 
    year,
    first_name,
    MAX(num) AS max_num
FROM usa_baby_names ubn 
WHERE sex = 'M'
GROUP BY year;


## 8. Qual é o nome masculino que mais apareceu de todos os anos?
 	
WITH NomePopular AS (
  SELECT 
    year,
    first_name,
    MAX(num) AS max_num
  FROM usa_baby_names ubn 
  WHERE sex = 'M'
  GROUP BY year
)

SELECT 
  first_name,
  COUNT(first_name) AS contagem
FROM
  NomePopular
GROUP BY first_name
ORDER BY contagem DESC ;

 
