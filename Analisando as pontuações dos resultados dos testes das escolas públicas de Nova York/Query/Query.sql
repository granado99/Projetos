## 1. Entendendo a base de dados

SELECT 
	*
FROM 
	schools_modified sm 
	
## 2. Quais escolas estão com o percentual zerado?


SELECT 
	school_name
from
	schools_modified sm 
WHERE 
	percent_tested = ''	

## 3. Quantidade de escolas x quantidade de escolas sem percentual
select 
	COUNT(school_name) as total_escolas,
	(
	SELECT
		COUNT(school_name)
	from
		schools_modified sm
	WHERE
		percent_tested = '' ) as escolas_semPercentual
from
	schools_modified sm
	
## 4. Quantos building_code diferentes existem?

SELECT 
	COUNT(DISTINCT (building_code)) 
from	
	schools_modified sm 
	
## 5. Melhor escola em matemática acima de 640 pontos.

SELECT
	school_name,
	average_math
FROM	
	schools_modified sm
WHERE 
	average_math > 640
ORDER BY
	average_math DESC
	
## 6. Qual a menor pontuação em matemática?
SELECT
	MIN(average_math) 
FROM	
	schools_modified sm

## 7. Maior pontuação em redação?
	SELECT 
		school_name,
		MAX(average_reading) AS melhor_nota
	FROM
		schools_modified sm 
	GROUP BY
		school_name 
	ORDER  BY 
		melhor_nota DESC 
	LIMIT 10
	
## 8. top 10 Escolas boas em todas as matérias?
SELECT 
	school_name,
	SUM(average_math) + SUM(average_reading) + SUM(average_writing) AS soma 
FROM
	schools_modified sm 
GROUP BY
	school_name 
ORDER  BY soma DESC 
LIMIT 10
	

## 9. bairros e suas quantidades de escolas com AS melhores notas?
SELECT 
    borough,
    COUNT(school_name) AS num_schools,
    (SUM(average_math) + SUM(average_reading) + SUM(average_writing))/COUNT(school_name) AS average_borough_sat
FROM schools_modified sm 	
GROUP BY borough
ORDER BY average_borough_sat DESC;


10. 5 melhores escolas em matematica NO Blooklyn.

SELECT 
	school_name,
	average_math 
FROM	
schools_modified sm 
WHERE 
	borough = "Brooklyn"
ORDER BY 
	average_math DESC 
LIMIT 5
