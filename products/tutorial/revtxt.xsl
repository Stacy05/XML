<?xml version="1.0" encoding="UTF-8" ?>
<!--
   New Perspectives on XML, 3rd Edition
   Tutorial 6
   Tutorial Case

   Harpe Gaming Review Style Sheet
   Author: 
   Date:   

   Filename:         reviews.xsl
   Supporting Files: 
-->


<xsl:stylesheet version="1.0"
     xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
     xmlns:r="http://example.com/reviews">


   <xsl:template match="r:review">
      <h2>
         <xsl:value-of select="r:title" />
      </h2>
      <table id="reviewTable">
         <tr>
            <th>Review Date:</th>
            <td>
               <xsl:value-of select="r:reviewDate" />
            </td>
         </tr>
      </table>

      <xsl:copy-of select="r:description/*" />

   </xsl:template>


</xsl:stylesheet>
