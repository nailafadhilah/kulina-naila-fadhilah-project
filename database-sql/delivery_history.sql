# Author : Naila Fadhilah Fithriah
# Date   : 15 November 2020
# Kulina - Data Analyst - Preliminary Test
# SQL

# Create SQL Query
USE db_kulina;

SELECT * FROM ku_order_detail;

CREATE VIEW delivery_history AS
SELECT 
    ku.id AS 'User ID', 
    ku.name AS 'Username', 
    ku.email AS 'User Email', 
    ku.phone AS 'User Phone Number', 
    kod.delivery_date AS 'Delivery Date', 
    kp.name AS 'Product Name', 
    kc.name AS 'Product Category', 
    kod.quantity AS 'Quantity', 
    kul.address AS 'Address',
IFNULL((SELECT SUM(kodt.quantity) FROM ku_order_detail kodt WHERE kodt.id < kod.id), '-') AS 'Progressive Total',
  (SELECT SUM(kodt.quantity) FROM ku_order_detail kodt WHERE kodt.id <= kod.id) AS 'Cumulative Total'
FROM ku_order_detail kod
JOIN ku_user_location kul ON kul.id = kod.user_location_id
JOIN ku_order ko ON ko.id = kod.order_id
JOIN ku_product kp ON kp.id = kod.product_id
JOIN ku_order_detail_status kods ON  kods.id = kod.status
JOIN ku_product_category kpc ON kpc.product_id = kp.id
JOIN ku_category kc ON kc.id = kpc.category_id
JOIN ku_user ku ON kul.user_id = ku.id
WHERE kods.name = 
			(SELECT name
			FROM ku_order_detail_status
			WHERE name = 'success')
AND YEAR(kod.delivery_date) = '2019' AND MONTH(kod.delivery_date) = '09'
ORDER BY kod.delivery_date, ku.id ASC;

SELECT * FROM delivery_history;