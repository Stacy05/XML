xquery version "1.0";

(: 
   New Perspectives on XML, 3rd Edition
   Tutorial 9
   Tutorial Assignment

   Query on large customer orders

   Author:     Stacy Barone
   Date:       03/29/15

   Filename:   gjc_query2.xq

 :)

<results>{

	for $o in doc('gjc_orders.xml')//order
	for $s in doc('gjc_stores.xml')//store
	for $c in doc('gjc_customers.xml')//customer
	let $total := sum($o/product/(@qty*@salesPrice))
	where $total >= 500
		and $o/@storeID=$s/@storeID
		and $o/@custID=$c/@custID
	order by $total descending
	
	return
	 <order
	  orderId="{$o/@orderID}"
	  orderDate="{$0/@orderDate}">
	  
	 <revenue>{
	   concat("$",round-half-to-even($total,2))
	   )</revenue>
	   
	   {$s}
	   {$c}
	   {$o/product}
	   </order>
}</results>