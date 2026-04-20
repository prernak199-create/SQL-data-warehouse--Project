
--checking for Standardisation and consistency 
select distinct gender from gold.dim_customers;
---------------------------------------------------------------------------------------------------------------
select distinct ci.cst_gndr,
ca.gen,
CASE WHEN ci.cst_gndr!='n/a' then ci.cst_gndr --CRM is the Master for gender info
ELSE COALESCE(ca.gen,'n/a')
END AS new_gen
from silver.crm_cust_info ci
left join silver.erp_cust_az12 ca
on ci.cst_key= ca.cid
LEFT JOIN silver.erp_loc_a101 la
on ci.cst_key=la.cid
ORDER BY
1,2;


