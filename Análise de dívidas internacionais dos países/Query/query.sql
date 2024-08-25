## 1. Entendendo a base de dados

SELECT 
	*
FROM 
	international_debt id 
	
## 2. Quantos paises tem dividas?

SELECT 
	COUNT(DISTINCT (country_name)) as qtd_paises
from
	international_debt id 
	
## 3. Quais indicadores existem?

SELECT 
	DISTINCT (indicator_code)
from
	international_debt id 
	
## 4. Qual a divida total de cada pais?

SELECT 
	country_name,
	SUM(debt) as divida
from
	international_debt id 
group by
	country_name
order BY 
	divida DESC 
	
## 5. Média das dívidas de cada indicador

SELECT 
	indicator_code,
	AVG(debt) as media_dividas
from
	international_debt id
group by
	indicator_code 
order BY 
	media_dividas DESC 

	
	## 6. Quais país tem o maior montante de dívida na categoria de dívidas de longo prazo?
	
SELECT 
	country_name,
	indicator_name,
	indicator_code,
	debt 
from
	international_debt id 
WHERE 
	indicator_code = "DT.AMT.DLXF.CD"
order BY 
	debt DESC 
	
	
	## 7. Qual a divida que é a mais comum?
	
	SELECT 
		indicator_code,
		COUNT(indicator_code) as contagem
	from
		international_debt id
	group by
		indicator_code 
	order by contagem DESC 
	
	## 8. Qual o maior divida e o  indicador de cada país?
	
	SELECT 
		country_name,
		indicator_code,
		MAX(debt) as maior_divida
	from
		international_debt id 
	group by
		country_name
	order by maior_divida DESC 
