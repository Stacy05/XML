xquery version "1.0";

(: 
   New Perspectives on XML, 3rd Edition
   Tutorial 9
   Tutorial Assignment

   General query on stores and cities

   Author:Stacy Barone
   Date: 03/29/15      

   Filename:   gjc_query1.xq

 :)
 
 declare variable $state as xs:string external;
 declare variable $storeList
 := doc('gjc_stores.xml')//store[state=$state];
 
 
 <stateStores state="{$state}"
 storeCount="{
 	count($storeList)
 	}">
 	{
 	  $storeList
 	}
</stateStores>