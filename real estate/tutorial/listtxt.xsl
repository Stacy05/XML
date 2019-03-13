<?xml version="1.0" encoding="UTF-8" ?>
<!--
   New Perspectives on XML, 3rd Edition
   Tutorial 7
   Tutorial Case

   Real Estate Listings Style Sheet
   Author: 
   Date:   

   Filename:         listings.xsl
   Supporting Files: 
-->


<xsl:stylesheet version="1.0"
     xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

   <xsl:output method="html"
      doctype-system="about:legacy-compat"
      encoding="UTF-8"
      indent="yes" />


   <xsl:template match="/">
      <html>
         <head>
            <title>Real Estate Listings</title>
            <link href="brstyles.css" rel="stylesheet" type="text/css" />
         </head>

         <body>
            <div id="wrap">
               <header>
                  <img src="brlogo.png" alt="Bowline Realty" />
               </header>

               <h1>New Listings</h1>
               <xsl:apply-templates select="listings/property" />

             </div>
         </body>
      </html>
   </xsl:template>


   <xsl:template match="property">
      <table class="head" cellpadding="2">
         <tr>
            <th>Price</th>
            <td><xsl:value-of select="format-number(price,'$#,##0')" /></td>
            <th>Sq. Feet</th>
            <td><xsl:value-of select="sqfeet" /></td>
         </tr>
         <tr>
            <th rowspan="2">Address</th>
            <td rowspan="2">
               <xsl:value-of select="street" /><br />
               <xsl:value-of select="city" />, <xsl:value-of select="state" />
               <xsl:text> </xsl:text><xsl:value-of select="zip" />
            </td>
            <th>Baths</th>
            <td><xsl:value-of select="bathrooms" /></td>
         </tr>
         <tr>  
            <th>Bedrooms</th>
            <td><xsl:value-of select="bedrooms" /></td>
         </tr>
         <tr>	
            <th>Style</th>
            <td><xsl:value-of select="style" /></td>
            <th>Garage</th>
            <td><xsl:value-of select="garage" /></td>
         </tr>
         <tr>
            <th>Age</th>
            <td><xsl:value-of select="age" /></td>
            <th>Listing #</th>
            <td><xsl:value-of select="@rln" /></td>
         </tr>
         <tr>
            <td class="description" colspan="4">
               <xsl:value-of select="description" />
            </td>
         </tr>
      </table>
   </xsl:template>


</xsl:stylesheet>