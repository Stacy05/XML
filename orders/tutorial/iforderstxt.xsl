<?xml version="1.0" encoding="UTF-8" ?>
<!--
   New Perspectives on XML, 3rd Edition
   Tutorial 8
   Tutorial Case

   Illuminated Fixtures Orders Style Sheet
   Author: 
   Date:   

   Filename:         iforders.xsl
   Supporting Files: 
-->


<xsl:stylesheet version="2.0"
     xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

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

               <h1>Recent Orders</h1>
               <table id="shipmentList">
                  <thead>                  
                     <tr>
                        <th>ID</th>
                        <th>Order Date</th>
                        <th>Item(s)</th>
                        <th>Ordered By</th>
                        <th>Service</th>
                     </tr>
                  </thead>	
                  <tbody>			
       	          <xsl:apply-templates select="orders/order" />
                  </tbody>
               </table>
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
            <xsl:value-of select="orderDate" />
         </td>
         <td class="itemCell">
            <xsl:value-of select="items/itemID" />
         </td>
         <td class="custCell">
            <xsl:value-of select="custID" />
         </td>
         <td class="serviceCell">
            <xsl:value-of select="shipType" />
         </td>
      </tr>
   </xsl:template>

</xsl:stylesheet>

