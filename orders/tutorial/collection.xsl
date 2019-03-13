<?xml version="1.0" encoding="UTF-8" ?>
<!--
   New Perspectives on XML, 3rd Edition
   Tutorial 8
   Tutorial Case

   Style Sheet to Collate Shipping Documents
   Author: Stacy Barone
   Date:   03/22/15
   Filename:         collection.xsl
   Supporting Files: 
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
   <xsl:template name="list">
      <orders>
         <xsl:for-each select="collection('.?select=shipdoc*.xml')">
            <order orderID="{shipment/@shipID}">
               <orderDate>
                  <xsl:value-of select="shipment/shipDateTime"></xsl:value-of>
               </orderDate>
               <xsl:copy-of select="shipment/shipType"></xsl:copy-of>
               <xsl:copy-of select="shipment/items"></xsl:copy-of>
               <xsl:copy-of select="shipment/custID"></xsl:copy-of>
            </order>
         </xsl:for-each>
      </orders>
   </xsl:template>
   
   
   
</xsl:stylesheet>