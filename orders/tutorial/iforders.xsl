<?xml version="1.0" encoding="UTF-8" ?>
<!--
   New Perspectives on XML, 3rd Edition
   Tutorial 8
   Tutorial Case

   Illuminated Fixtures Orders Style Sheet
   Author: Stacy Barone
   Date:   3/22/15

   Filename:         iforders.xsl
   Supporting Files: 
-->


<xsl:stylesheet version="2.0"
     xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
     xmlns:xs="http://www.w3.org/2001/XMLSchema"
     xmlns:fixt="http://example.com/illumfixtures"
     exclude-result-prefixes="xs fixt">

   <xsl:output method="html"
      doctype-system="about:legacy-compat"
      encoding="UTF-8"
      indent="yes" />


   <xsl:template match="/">
      <html>
         <head>
            <title>Recent Orders</title>
            <link href="ifstyles.css" rel="stylesheet" type="text/css" />
         </head>

         <body>
            <div id="wrap">
               <header>
                  <img src="iflogo.png" alt="Illuminated Fixtures" />
               </header>
               
               <aside>
                  Current Date:
                  <xsl:value-of select="format-date(current-date(), '[MNn] [D], [Y]')"></xsl:value-of>
               </aside>

               <h1>Recent Orders</h1>

               <xsl:for-each-group select="orders/order" group-by="custID">
               
               <xsl:sort select="current-grouping-key()"></xsl:sort>
                  
               <xsl:variable name="custList" 
                             select="doc('customers.xml')/customers/customer[@custID=current-grouping-key()]"></xsl:variable>
                  
               <h2>Customer ID:
                   <xsl:value-of select="current-grouping-key()"></xsl:value-of>
               </h2>
                  
                  <p>
                     <xsl:value-of select="$custList/firstName"></xsl:value-of>
                     <xsl:text> </xsl:text>
                     <xsl:value-of select="$custList/lastName"></xsl:value-of><br />
                     <xsl:value-of select="$custList/street"></xsl:value-of><br />
                     <xsl:value-of select="$custList/city"></xsl:value-of>,
                     <xsl:value-of select="$custList/state"></xsl:value-of>
                     <xsl:text></xsl:text>
                     <xsl:value-of select="$custList/zip"></xsl:value-of>
                  </p>
                  
               <table id="shipmentList">
                  <thead>                  
                     <tr>
                        <th>ID</th>
                        <th>Order Date</th>
                        <th>Item(s)</th>
                        
                        <th>Service</th>
                        <th>Est. Delivery</th>
                     </tr>
                  </thead>	
                  <tbody>			
       	          <xsl:apply-templates select="current-group()" />
                  </tbody>
               </table>
               </xsl:for-each-group>
             </div>
         </body>

      </html>
   </xsl:template>

   <xsl:template match="order">
      <tr>
         <td class="IDcell">
            <xsl:value-of select="@orderID" />
         </td>
         <td class="dateCell">
            <xsl:value-of select="format-dateTime(orderDate, '[MNn] [D], [Y]')" />
         </td>
         <td class="itemCell">
            <xsl:apply-templates select="items/itemID" />
         </td>
        
         <td class="serviceCell">
            <xsl:value-of select="shipType" />
         </td>
         <td class="deliveryCell">
            <xsl:variable name="shipDate"
               select="orderDate" as="xs:dateTime"></xsl:variable>
            
            <xsl:variable name="durations" select="('P1D', 'P2D', 'P5D')"></xsl:variable>
            <xsl:variable name="deliveryTypes" select="('Priority', 'Expedited', 'Standard')"></xsl:variable>
            <xsl:variable name="sType" select="shipType"></xsl:variable>
            <xsl:variable name="deliveryDays" select="$durations[index-of($deliveryTypes, $sType)]"></xsl:variable>
            
            <xsl:variable name="deliveryDate"
               select="$shipDate + xs:dayTimeDuration($deliveryDays)" as="xs:dateTime"></xsl:variable>
            <xsl:value-of select="format-dateTime(fixt:jumpToMonday($deliveryDate), '[FNn], [MNn] [D], [Y]')"></xsl:value-of>
         </td>
      </tr>
   </xsl:template>
   
   <xsl:template match="itemID">
      <xsl:variable name="itemList" select="doc('itemlist.xml')/items/item[itemID=current()]"></xsl:variable>
      <xsl:value-of select="current()"></xsl:value-of>:
      <xsl:value-of select="$itemList/item_description"></xsl:value-of>
      [<xsl:value-of select="$itemList/item_size"></xsl:value-of>]
      <br/><br/>
   </xsl:template>
   
   <xsl:function name="fixt:getWeekday" as="xs:string">
      <xsl:param name="dateValue" as="xs:dateTime"></xsl:param>
      <xsl:sequence select="format-dateTime($dateValue, '[FNn]')"></xsl:sequence>
   </xsl:function>
   
   <xsl:function name="fixt:jumpToMonday" as="xs:dateTime">
      <xsl:param name="date" as="xs:dateTime"></xsl:param>
      <xsl:sequence select="if(fixt:getWeekday($date)='Saturday')
                            then $date + xs:dayTimeDuration('P2D')
                            
                            else if(fixt:getWeekday($date)='Sunday')
                            then $date + xs:dayTimeDuration ('P1D')
                            
                            else $date">
         
      </xsl:sequence>
   </xsl:function>

</xsl:stylesheet>

