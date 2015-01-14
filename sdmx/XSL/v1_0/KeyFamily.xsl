<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.1" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:message="http://www.SDMX.org/resources/SDMXML/schemas/v1_0/message" 
xmlns:common="http://www.SDMX.org/resources/SDMXML/schemas/v1_0/common" 
xmlns:structure="http://www.SDMX.org/resources/SDMXML/schemas/v1_0/structure" 
exclude-result-prefixes="xsl structure message common">

<xsl:output method="html" version="4.0" indent="yes"/>

<xsl:strip-space elements="*"/>

<xsl:param name="KeyFamID">notPassed</xsl:param>

<xsl:template match="/">

	<xsl:variable name="KFID">
		<xsl:choose>
			<xsl:when test="$KeyFamID = 'notPassed'">
				<xsl:value-of select="message:Structure/message:KeyFamilies/structure:KeyFamily[1]/@id"/>
			</xsl:when>
			<xsl:otherwise><xsl:value-of select="$KeyFamID"/></xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
     
     <xsl:variable name="KeyFamName" select="/message:Structure/message:KeyFamilies/structure:KeyFamily[@id = $KFID]/structure:Name"/>
     
     <head>
          <title lang="{$KeyFamName/@xml:lang}"><xsl:value-of select="$KeyFamName"/></title>
     </head>
     <frameset rows="22%, 78%">
          <frame src="{$KFID}/Header.html"/>
          <xsl:call-template name="Header">
               <xsl:with-param name="KFID"><xsl:value-of select="$KFID"/></xsl:with-param>
               <xsl:with-param name="KeyFamName"><xsl:value-of select="$KeyFamName"/></xsl:with-param>               
          </xsl:call-template>
          <frameset cols="20%, 80%">
               <frame src="{$KFID}/Menu.html"/>
               <frame src="{$KFID}/Instructions.html" name="Main"/>
               <xsl:call-template name="Menu">
                    <xsl:with-param name="KFID"><xsl:value-of select="$KFID"/></xsl:with-param>
                    <xsl:with-param name="KeyFamName"><xsl:value-of select="$KeyFamName"/></xsl:with-param>               
               </xsl:call-template>
               <xsl:call-template name="Instructions">
                    <xsl:with-param name="KFID"><xsl:value-of select="$KFID"/></xsl:with-param>
                    <xsl:with-param name="KeyFamName"><xsl:value-of select="$KeyFamName"/></xsl:with-param>               
               </xsl:call-template>
               <xsl:call-template name="Basic">
                    <xsl:with-param name="KFID"><xsl:value-of select="$KFID"/></xsl:with-param>
                    <xsl:with-param name="KeyFamName"><xsl:value-of select="$KeyFamName"/></xsl:with-param>               
               </xsl:call-template>
               <xsl:call-template name="Dimensions">
                    <xsl:with-param name="KFID"><xsl:value-of select="$KFID"/></xsl:with-param>
                    <xsl:with-param name="KeyFamName"><xsl:value-of select="$KeyFamName"/></xsl:with-param>               
               </xsl:call-template>
               <xsl:call-template name="Attributes">
                    <xsl:with-param name="KFID"><xsl:value-of select="$KFID"/></xsl:with-param>
                    <xsl:with-param name="KeyFamName"><xsl:value-of select="$KeyFamName"/></xsl:with-param>               
               </xsl:call-template>
               <xsl:call-template name="Concepts">
                    <xsl:with-param name="KFID"><xsl:value-of select="$KFID"/></xsl:with-param>
                    <xsl:with-param name="KeyFamName"><xsl:value-of select="$KeyFamName"/></xsl:with-param>               
               </xsl:call-template>
               <xsl:call-template name="ConceptTable">
                    <xsl:with-param name="KFID"><xsl:value-of select="$KFID"/></xsl:with-param>
                    <xsl:with-param name="KeyFamName"><xsl:value-of select="$KeyFamName"/></xsl:with-param>               
               </xsl:call-template>
               <xsl:call-template name="CodeLists">
                    <xsl:with-param name="KFID"><xsl:value-of select="$KFID"/></xsl:with-param>
                    <xsl:with-param name="KeyFamName"><xsl:value-of select="$KeyFamName"/></xsl:with-param>               
               </xsl:call-template>
               <xsl:call-template name="CodeListTable">
                    <xsl:with-param name="KFID"><xsl:value-of select="$KFID"/></xsl:with-param>
                    <xsl:with-param name="KeyFamName"><xsl:value-of select="$KeyFamName"/></xsl:with-param>               
               </xsl:call-template>
               <xsl:call-template name="Agencies">
                    <xsl:with-param name="KFID"><xsl:value-of select="$KFID"/></xsl:with-param>
                    <xsl:with-param name="KeyFamName"><xsl:value-of select="$KeyFamName"/></xsl:with-param>               
               </xsl:call-template>
               <xsl:if test="/message:Structure/message:KeyFamilies/structure:KeyFamily[@id = $KFID]/structure:Components/structure:Group">
                    <xsl:call-template name="Groups">
                         <xsl:with-param name="KFID"><xsl:value-of select="$KFID"/></xsl:with-param>
                         <xsl:with-param name="KeyFamName"><xsl:value-of select="$KeyFamName"/></xsl:with-param>               
                    </xsl:call-template>
               </xsl:if>
               <xsl:if test="/message:Structure/message:KeyFamilies/structure:KeyFamily[@id = $KFID]/structure:Components/structure:CrossSectionalMeasure">
                    <xsl:call-template name="Cross">
                         <xsl:with-param name="KFID"><xsl:value-of select="$KFID"/></xsl:with-param>
                         <xsl:with-param name="KeyFamName"><xsl:value-of select="$KeyFamName"/></xsl:with-param>               
                    </xsl:call-template>
               </xsl:if>
          </frameset>
     </frameset>
     
</xsl:template>

<xsl:template name="Header">
     <xsl:param name="KFID"/>
     <xsl:param name="KeyFamName"/>
     <xsl:document href="{$KFID}/Header.html" method="html" version="4.0" indent="yes">
          <head>
               <title lang="{$KeyFamName/@xml:lang}"><xsl:value-of select="$KeyFamName"/></title>
               <style type="text/css">
                    h1 {color: #0000DD; font-size: 18pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: center; line-height: 125%}
                    body {margin-top: 0; margin-right: 0; margin-left: 0; margin-bottom: 0; background-color: white}
               </style>               
          </head>
          <body><h1><img src="../SDMXLogo.gif" alt="Statistical Data and Metadata Exchange"/><br/><xsl:value-of select="$KeyFamName"/></h1></body>
     </xsl:document>
</xsl:template>

<xsl:template name="Menu">
     <xsl:param name="KFID"/>
     <xsl:param name="KeyFamName"/>
     <xsl:document href="{$KFID}/Menu.html" method="html" version="4.0" indent="yes">
          <head>
               <title lang="{$KeyFamName/@xml:lang}"><xsl:value-of select="$KeyFamName"/></title>
               <style type="text/css">
                    body {margin-top: 15; margin-right: 0; margin-left: 5; margin-bottom: 0; background-color: white}
                    li {list-style-type: none; padding-left: 0px}
                    .menuitem {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; line-height: 125%}
                    .listitem {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; text-indent: 0px; line-height: 125%}
               </style>               
          </head>
          <body>
               <a href="Instructions.html" target="Main" class="menuitem">Instructions</a><br/>
               <a href="Basic.html" target="Main" class="menuitem">Basic Information</a><br/>
               <a href="Dimensions.html" target="Main" class="menuitem">Dimensions</a><br/>
               <a href="Attributes.html" target="Main" class="menuitem">Attributes</a><br/>
               <xsl:if test="/message:Structure/message:KeyFamilies/structure:KeyFamily[@id = $KFID]/structure:Components/structure:Group">
                    <a href="Groups.html" target="Main" class="menuitem">Groups</a><br/>
               </xsl:if>
               <xsl:if test="/message:Structure/message:KeyFamilies/structure:KeyFamily[@id = $KFID]/structure:Components/structure:CrossSectionalMeasure">
                    <a href="CrossSectional.html" target="Main" class="menuitem">Cross Sectional Information</a><br/>
               </xsl:if>
               <a href="Concepts.html" target="Main" class="menuitem">Concepts</a><br/>
               <a href="CodeLists.html" target="Main" class="menuitem">Code Lists</a><br/>
          </body>
     </xsl:document>
</xsl:template>

<xsl:template name="Instructions">
     <xsl:param name="KFID"/>
     <xsl:param name="KeyFamName"/>
     <xsl:document href="{$KFID}/Instructions.html" method="html" version="4.0" indent="yes">
          <head>
               <title lang="{$KeyFamName/@xml:lang}"><xsl:value-of select="$KeyFamName"/></title>
               <style type="text/css">
                    body {margin-top: 25; margin-right: 25; margin-left: 25; margin-bottom: 0; background-color: white}
                    table {border-color: #0000DD}
                    h2 {color: #0000DD; font-size: 12pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left}
                    p {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: normal; text-align: left}
               </style>               
          </head>
          <body>
               <h2>Key Family Viewer: <xsl:value-of select="$KeyFamName"/></h2>
               <p>This reference provides a view of the details of the <xsl:value-of select="$KeyFamName"/> key family.  Use the links at the left to view the details of the key family.  The content of these sections are described below.  To return to any previous window, use your browsers Back button.<br/><br/>
<b>Instructions</b><br/><br/>
 This link will return you to this page at any time.<br/><br/>
 <b>Basic Information</b><br/><br/>
This page contains the basic information about the key family, such as ID and version, as well as any annotations.  From this page, you can also view the details of the key family Agency by clicking on the agency name.<br/><br/>
 <b>Dimensions</b><br/><br/>
 This page contains all dimensions of the key family.  Only the basic information (name, concept ID, and allowed values) is displayed here.  To view more details about a particular dimension,  you can click on the dimension name, contained in the first row of each table.  This will take you to a more detailed display of that dimension, including; concept ID, the code list associated with it, allowed values, cross sectional measures and attachments, associated groups, and annotations.  From this page, you can view more information about a concept (also applies to the main key family dimension page), code list, or group by clicking on it.<br/><br/>
 <b>Attributes</b><br/><br/>
 This page contains all attributes of the key family (including the primary measure).  Only the basic information (name, concept ID, allowed values/text format, assignment status, and attachment level) is displayed here.  To view more details about a particular attribute,  you can click on the attribute name, contained in the first row of each table.  This will take you to a more detailed display of that attribute, including; concept ID, allowed values/text format, assignment status, and attachment level, cross sectional and group attachments, and annotations.  From this page, you can view more information about a concept (also applies to the main key family dimension page), code list, cross sectional measure, or group by clicking on it.<br/><br/>
 <b>Groups</b><br/><br/>
This page contains the basic information about all groups in the key family, if applicable.  Only the dimensions associated with the group are displayed on this page.  You can view more detailed information about a group or a dimension associated with a group by clicking on its name.  Clicking on the group name will display more detailed information about a group, including; ID, dimensions associated with it, attributes attached to it, and annotations.  You can view more details of any of these dimensions or attributes by clicking on them.<br/><br/>
 <b>Cross Sectional Information</b><br/><br/>
This page contains the cross sectional information associated with the key family, if applicable.  Attachment levels for all attributes and dimensions are displayed, as well as the cross sectional measures.  You view more details about any attribute, dimension, or cross sectional measure by clicking on its name.  Clicking on the name of a cross sectional measure will display all detailed information about that measure, including concept ID, dimension, value, attached attributes, and annotations.  Again, more detail about any concept, dimension, or attribute can be viewed by clicking on it.
</p>
          </body>
     </xsl:document>
</xsl:template>

<xsl:template name="Basic">
     <xsl:param name="KFID"/>
     <xsl:param name="KeyFamName"/>
     <xsl:document href="{$KFID}/Basic.html" method="html" version="4.0" indent="yes">
          <head>
               <title lang="{$KeyFamName/@xml:lang}"><xsl:value-of select="$KeyFamName"/></title>
               <style type="text/css">
                    body {margin-top: 25; margin-right: 25; margin-left: 25; margin-bottom: 0; background-color: white}
                    table {border-color: #0000DD}
                    h2 {color: #0000DD; font-size: 12pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left}
                    .thead {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; width: 100%;  background-color: #AAAAAA; border-color: #0000DD}
                    .field {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; width: 20%;  background-color: #AAAAAA; border-color: #0000DD}
                    .field2 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; text-indent: 10px; width: 20%; background-color:#CCCCCC; border-color: #0000DD}
                    .data {color: black; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: normal; text-align: left; width: 80%; background-color: white; border-color: #0000DD}
                    .tablehead1 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; width: 100%; background-color: #AAAAAA; border-color: #0000DD; text-align: center}
                    .tablehead2 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; width: 60%; background-color: #CCCCCC; border-color: #0000DD}
                    .tablehead3 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; width: 20%; background-color: #CCCCCC; border-color: #0000DD}
                    .tablehead4 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; width: 10%; background-color: #CCCCCC; border-color: #0000DD}
                    .data1 {color: black; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: normal; text-align: left; width: 40%; background-color: white; border-color: #0000DD}
                    .data2 {color: black; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: normal; text-align: left; width: 20%; background-color: white; border-color: #0000DD}
                    .data3 {color: black; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: normal; text-align: left; width: 10%; background-color: white; border-color: #0000DD}
               </style>
          </head>
          <body>
               <h2>Basic Key Family Information</h2>
               <table cellpadding="3" cellspacing="1" border="1" width="100%">
                    <tbody>
                         <tr>
                              <td class="field" valign="top">ID</td><td class="data" valign="top"><xsl:value-of select="/message:Structure/message:KeyFamilies/structure:KeyFamily[@id = $KFID]/@id"/></td>
                         </tr>
                              <xsl:if test="/message:Structure/message:KeyFamilies/structure:KeyFamily[@id = $KFID]/@version">
                                   <tr>
                                        <td class="field" valign="top">Version</td><td class="data" valign="top"><xsl:value-of select="/message:Structure/message:KeyFamilies/structure:KeyFamily[@id = $KFID]/@version"/></td>
                                   </tr>
                              </xsl:if>
                              <xsl:if test="/message:Structure/message:KeyFamilies/structure:KeyFamily[@id = $KFID]/@agency">
                                   <xsl:variable name="AgencyID" select="/message:Structure/message:KeyFamilies/structure:KeyFamily[@id = $KFID]/@agency"/>
                                   <xsl:variable name="Agency">
                                        <xsl:choose>
                                             <xsl:when test="/message:Structure/message:Header/message:Sender[@id = $AgencyID]/message:Name">
                                                  <xsl:value-of select="/message:Structure/message:Header/message:Sender[@id = $AgencyID]/message:Name"/>
                                             </xsl:when>
                                             <xsl:when test="/message:Structure/message:Header/message:Receiver[@id = $AgencyID]/message:Name">
                                                  <xsl:value-of select="/message:Structure/message:Header/message:Receiver[@id = $AgencyID]/message:Name"/>
                                             </xsl:when>
                                             <xsl:when test="/message:Structure/message:Agencies/structure:Agency[@id = $AgencyID]/structure:Name">
                                                  <xsl:value-of select="/message:Structure/message:Agencies/structure:Agency[@id = $AgencyID]/structure:Name"/>
                                             </xsl:when>
                                             <xsl:otherwise>
                                                  <xsl:value-of select="$AgencyID"/>
                                             </xsl:otherwise>
                                        </xsl:choose>
                                   </xsl:variable>
                                   <tr>
                                        <td class="field" valign="top">Agency</td><td class="data" valign="top"><a href="Ag{$AgencyID}.html" class="data"><xsl:value-of select="$Agency"/></a></td>
                                   </tr>
                              </xsl:if>
                              <xsl:if test="/message:Structure/message:KeyFamilies/structure:KeyFamily[@id = $KFID]/@uri">
                                   <tr>
                                        <td class="field" valign="top">URI</td><td class="data" valign="top"><xsl:value-of select="/message:Structure/message:KeyFamilies/structure:KeyFamily[@id = $KFID]/@uri"/></td>
                                   </tr>
                              </xsl:if>
                    </tbody>
               </table><br/>
               <xsl:for-each select="/message:Structure/message:KeyFamilies/structure:KeyFamily[@id = $KFID]/structure:Annotations/common:Annotation">
                    <table cellpadding="3" cellspacing="1" border="1" width="100%">
                         <tbody>
                              <tr>
                                   <th class="thead" colspan="2">Annotation</th>
                              </tr>
                              <xsl:if test="common:AnnotationTitle">
                                   <tr>
                                        <td class="field2" valign="top">Title</td><td class="data" valign="top"><xsl:value-of select="common:AnnotationTitle"/></td>
                                   </tr>
                              </xsl:if>
                              <xsl:if test="common:AnnotationType">
                                   <tr>
                                        <td class="field2" valign="top">Type</td><td class="data" valign="top"><xsl:value-of select="common:AnnotationType"/></td>
                                   </tr>
                              </xsl:if>
                              <xsl:if test="common:AnnotationURL">
                                   <tr>
                                        <td class="field2" valign="top">URL</td><td class="data" valign="top"><a href="{common:AnnotationURL}" target="newwindow"><xsl:value-of select="common:AnnotationURL"/></a></td>
                                   </tr>
                              </xsl:if>
                              <xsl:if test="common:AnnotationText">
                                   <tr>
                                        <td class="field2" valign="top">Text</td><td class="data" valign="top"><xsl:value-of select="common:AnnotationText"/></td>
                                   </tr>
                              </xsl:if>                          
                         </tbody>
                    </table><br/>
               </xsl:for-each>
              <table cellpadding="3" cellspacing="1" border="1" width="100%">
			<tbody>
				<tr>
					<th colspan="4" class="tablehead1">Dimensions</th>
				</tr>
				<tr>
					<th colspan="2"  class="tablehead2">Statistical Concept</th><th  class="tablehead3">Sequence</th><th  class="tablehead3">CodeList</th>
				</tr>
				<xsl:for-each select="/message:Structure/message:KeyFamilies/structure:KeyFamily[@id = $KFID]/structure:Components/structure:Dimension">
					<xsl:variable name="Concept" select="@concept"/>
					<xsl:variable name="CodeList" select="@codelist"/>
					<tr>
						<td class="data1"><a href="Dim{$Concept}.html"  class="data"><xsl:value-of select="//structure:Concept[@id=$Concept]/structure:Name"/></a></td>
						<td class="data2"><a href="{$Concept}.html" class="data"><xsl:value-of select="$Concept"/></a></td>
						<td class="data2"><xsl:value-of select="position()"/></td>
						<td class="data2"><a href="{$CodeList}.html" class="data"><xsl:value-of select="$CodeList"/></a></td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
              <table cellpadding="3" cellspacing="1" border="1" width="100%">
			<tbody>
				<tr>
					<th colspan="5" class="tablehead1">Attributes</th>
				</tr>
				<tr>
					<th colspan="2" class="tablehead2">Statistical Concept</th><th class="tablehead4">Attachment</th><th class="tablehead3">Representation</th><th class="tablehead4">Usage</th>
				</tr>
				<xsl:for-each select="/message:Structure/message:KeyFamilies/structure:KeyFamily[@id = $KFID]/structure:Components/structure:Attribute">
					<xsl:variable name="Concept" select="@concept"/>
					<tr>
						<td class="data1"><a href="Att{$Concept}.html" class="data"><xsl:value-of select="//structure:Concept[@id=$Concept]/structure:Name"/></a></td>
						<td class="data2"><a href="{$Concept}.html" class="data"><xsl:value-of select="$Concept"/></a></td>
						<td class="data3"><xsl:value-of select="@attachmentLevel"/></td>
						<xsl:choose>
							<xsl:when test="not(@codelist)">
	                                             <xsl:choose>
	                                                  <xsl:when test="structure:TextFormat/@TextType='Alpha'">
	                                                       <td class="data2">Alpha <xsl:value-of select="structure:TextFormat/@length"/></td>
	                                                  </xsl:when>
	                                                  <xsl:when test="structure:TextFormat/@TextType='AlphaFixed'">
	                                                       <td class="data2">Fixed Alpha <xsl:value-of select="structure:TextFormat/@length"/></td>
	                                                  </xsl:when>
	                                                  <xsl:when test="structure:TextFormat/@TextType='Num'">
	                                                       <td class="data2">Numeric <xsl:value-of select="structure:TextFormat/@length"/><xsl:if test="structure:TextFormat/@decimals">.<xsl:value-of 	select="structure:TextFormat/@decimals"/></xsl:if></td>
	                                                  </xsl:when>
	                                                  <xsl:when test="structure:TextFormat/@TextType='NumFixed'">
	                                                       <td class="data2">Fixed Numeric <xsl:value-of select="structure:TextFormat/@length"/><xsl:if test="structure:TextFormat/@decimals">.<xsl:value-of 	select="structure:TextFormat/@decimals"/></xsl:if></td>
	                                                  </xsl:when>
	                                                  <xsl:when test="structure:TextFormat/@TextType='AlphaNum'">
	                                                       <td class="data2">Alphanumeric <xsl:value-of select="structure:TextFormat/@length"/></td>
	                                                  </xsl:when>
	                                                  <xsl:when test="structure:TextFormat/@TextType='AlphaNumFixed'">
	                                                       <td class="data2">Fixed Alphanumeric <xsl:value-of select="structure:TextFormat/@length"/></td>
	                                                  </xsl:when>
	                                             </xsl:choose>
							</xsl:when>
							<xsl:otherwise>
								<td class="data2"><a href="{@codelist}.html" class="data"><xsl:value-of select="@codelist"/></a></td>
							</xsl:otherwise>
						</xsl:choose>
						<td class="data3"><xsl:value-of select="@assignmentStatus"/></td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
          </body>
     </xsl:document>
</xsl:template>

<xsl:template name="Dimensions">
     <xsl:param name="KFID"/>
     <xsl:param name="KeyFamName"/>
     <xsl:document href="{$KFID}/Dimensions.html" method="html" version="4.0" indent="yes">
          <head>
               <title lang="{$KeyFamName/@xml:lang}"><xsl:value-of select="$KeyFamName"/></title>
               <style type="text/css">
                    body {margin-top: 25; margin-right: 25; margin-left: 25; margin-bottom: 0; background-color: white}
                    table {border-color: #0000DD}
                    h2 {color: #0000DD; font-size: 12pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left}
                    .field1 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; width: 100%; background-color: #AAAAAA; border-color: #0000DD}
                    .field2 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; text-indent: 10px; width: 20%; background-color:#CCCCCC; border-color: #0000DD}
                    .data1 {color: black; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: normal; text-align: left; width: 80%; background-color: white; border-color: #0000DD}
                    .allowedvals {width: 100%}
               </style>               
          </head>
          <body>
               <h2>Key Family Dimensions</h2>
               <xsl:for-each select="/message:Structure/message:KeyFamilies/structure:KeyFamily[@id = $KFID]/structure:Components/structure:Dimension">
                    <table cellpadding="3" cellspacing="1" border="1" width="100%">
                         <tbody>
                              <xsl:variable name="CodeList" select="@codelist"/>
                              <xsl:variable name="Concept" select="@concept"/>
                              <tr>
                                   <th class="field1" colspan="2">
                                        <xsl:if test="/message:Structure/message:Concepts/structure:Concept[@id=$Concept]">
                                             <a href="Dim{$Concept}.html" class="field1"><xsl:value-of select="/message:Structure/message:Concepts/structure:Concept[@id=$Concept]/structure:Name"/></a>
                                        </xsl:if>                                   
                                   </th>
                              </tr>
                              <tr>
                                   <td class="field2"  valign="top">Concept ID</td><td class="data1" valign="top"><a href="{$Concept}.html" class="data1"><xsl:value-of select="$Concept"/></a></td>
                              </tr>
                              <xsl:if test="/message:Structure/message:CodeLists/structure:CodeList[@id=$CodeList]">
                                    <tr>
                                        <td class="field2" valign="top">Allowed Values</td>
                                        <td class="data1" valign="top">
                                             <select class="allowedvals">
                                                  <optgroup label="Allowed Values">
                                                       <xsl:for-each select="/message:Structure/message:CodeLists/structure:CodeList[@id=$CodeList]/structure:Code">
                                                            <option><xsl:value-of select="@value"/> - <xsl:value-of select="structure:Description"/></option>
                                                       </xsl:for-each>
                                                  </optgroup>
                                             </select>
                                        </td>
                                   </tr>
                              </xsl:if>
                         </tbody>
                    </table><br/>
               </xsl:for-each>
               <xsl:for-each select="/message:Structure/message:KeyFamilies/structure:KeyFamily[@id = $KFID]/structure:Components/structure:TimeDimension">
                    <table cellpadding="3" cellspacing="1" border="1" width="100%">
                         <tbody>
                              <xsl:variable name="Concept" select="@concept"/>
                              <tr>
                                   <th class="field1" colspan="2">
                                        <xsl:if test="/message:Structure/message:Concepts/structure:Concept[@id=$Concept]">
                                             <a href="Dim{$Concept}.html" class="field1">Time Dimension - <xsl:value-of select="/message:Structure/message:Concepts/structure:Concept[@id=$Concept]/structure:Name"/></a>
                                        </xsl:if>                                   
                                   </th>
                              </tr>
                              <tr>
                                   <td class="field2" valign="top">Concept ID</td><td class="data1" valign="top"><a href="{$Concept}.html" class="data1"><xsl:value-of select="$Concept"/></a></td>
                              </tr>
                         </tbody>
                    </table>
               </xsl:for-each>
          </body>
     </xsl:document>

     <xsl:for-each select="/message:Structure/message:KeyFamilies/structure:KeyFamily[@id = $KFID]/structure:Components/structure:Dimension">
          <xsl:document href="{$KFID}/Dim{@concept}.html" method="html" version="4.0" indent="yes">
               <head>
                    <title lang="{$KeyFamName/@xml:lang}"><xsl:value-of select="$KeyFamName"/></title>
                    <style type="text/css">
                         body {margin-top: 25; margin-right: 25; margin-left: 25; margin-bottom: 0; background-color: white}
                         table {border-color: #0000DD}
                         h2 {color: #0000DD; font-size: 12pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left}
                         .field1 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; width: 100%; background-color: #AAAAAA; border-color: #0000DD}
                         .field2 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; text-indent: 10px; width: 20%; background-color:     #CCCCCC; border-color: #0000DD}
                         .field3 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; width: 20%; background-color: #AAAAAA; border-color: #0000DD}
                         .data1 {color: black; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: normal; text-align: left; width: 80%; background-color: white; border-color: #0000DD}
                         .allowedvals {width: 100%}
                    </style>               
               </head>
               <body>
                    <xsl:variable name="CodeList" select="@codelist"/>
                    <xsl:variable name="Concept" select="@concept"/>
                    <xsl:variable name="DimDisplayName">
                         <xsl:choose>
                              <xsl:when test="/message:Structure/message:Concepts/structure:Concept[@id=$Concept]">
                                   <xsl:value-of select="/message:Structure/message:Concepts/structure:Concept[@id=$Concept]/structure:Name"/>
                              </xsl:when>
                              <xsl:otherwise>
                                   <xsl:value-of select="$Concept"/>
                              </xsl:otherwise>
                         </xsl:choose>
                    </xsl:variable>
                    <h2>Key Family Dimension: <xsl:value-of select="$DimDisplayName"/></h2>
                    <table cellpadding="3" cellspacing="1" border="1" width="100%">
                         <tbody>
                              <tr>
                                   <td class="field3" valign="top">Concept ID</td><td class="data1" valign="top"><a href="{$Concept}.html" class="data1"><xsl:value-of select="$Concept"/></a></td>
                              </tr>
                              <xsl:if test="/message:Structure/message:CodeLists/structure:CodeList[@id=$CodeList]">
                                    <tr>
                                        <td class="field3" valign="top">Code List</td>
                                        <td class="data1" valign="top">
                                             <a href="{$CodeList}.html" class="data1"><xsl:value-of select="/message:Structure/message:CodeLists/structure:CodeList[@id=$CodeList]/structure:Name"/></a>
                                        </td>
                                   </tr>
                                    <tr>
                                        <td class="field3" valign="top">Allowed Values</td>
                                        <td class="data1" valign="top">
                                             <select class="allowedvals">
                                                  <optgroup label="Allowed Values">
                                                       <xsl:for-each select="/message:Structure/message:CodeLists/structure:CodeList[@id=$CodeList]/structure:Code">
                                                            <option><xsl:value-of select="@value"/> - <xsl:value-of select="structure:Description"/></option>
                                                       </xsl:for-each>
                                                  </optgroup>
                                             </select>
                                        </td>
                                   </tr>
                              </xsl:if>
                              <xsl:if test="@*[name()!='isMeasureDimension' and name()!='isFrequencyDimension' and .='true']">
                                   <tr>
                                        <td class="field3" valign="top">Cross Sectional Attachments</td>
                                        <td class="data1" valign="top">
                                             <xsl:for-each select="@*[name()!='isMeasureDimension' and name()!='isFrequencyDimension' and .='true']">
                                                  <xsl:value-of select="substring(name(),21)"/><xsl:if test="not(position()=last())"><br/></xsl:if>
                                             </xsl:for-each>
                                        </td>
                                   </tr>
                              </xsl:if>
                              <xsl:if test="/message:Structure/message:KeyFamilies/structure:KeyFamily[@id = $KFID]/structure:Components/structure:Group[structure:DimensionRef=$Concept]">
                                   <tr>
                                        <td class="field3" valign="top">Associated Groups</td>
                                        <td class="data1" valign="top">
                                             <xsl:for-each select="/message:Structure/message:KeyFamilies/structure:KeyFamily[@id = $KFID]/structure:Components/structure:Group[structure:DimensionRef=$Concept]">
                                                  <a href="Grp{@id}.html" class="data1"><xsl:value-of select="@id"/></a><xsl:if test="not(position()=last())"><br/></xsl:if>
                                             </xsl:for-each>
                                        </td>
                                   </tr>
                              </xsl:if>
                         </tbody>
                    </table><br/>
                    <xsl:if test="@isMeasureDimension='true'">
                         <xsl:for-each select="/message:Structure/message:KeyFamilies/structure:KeyFamily[@id = $KFID]/structure:Components/structure:CrossSectionalMeasure[@measureDimension=$Concept]">
                              <table cellpadding="3" cellspacing="1" border="1" width="100%">
                                   <tbody>
                                        <xsl:variable name="CSConcept" select="@concept"/>
                                        <xsl:variable name="CSDisplay">
                                             <xsl:choose>
                                                  <xsl:when test="/message:Structure/message:Concepts/structure:Concept[@id=$CSConcept]">
                                                       <xsl:value-of select="/message:Structure/message:Concepts/structure:Concept[@id=$CSConcept]/structure:Name"/>
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                       <xsl:value-of select="$Concept"/>
                                                  </xsl:otherwise>
                                             </xsl:choose>
                                        </xsl:variable>
                                        <tr>
                                             <th class="field1" colspan="2">Cross Sectional Measure: <xsl:value-of select="$CSDisplay"/></th>
                                        </tr>
                                        <tr>
                                             <td class="field2" valign="top">Concept ID</td>
                                             <td class="data1" valign="top"><a href="{$CSConcept}.html" class="data1"><xsl:value-of select="$CSConcept"/></a></td>
                                        </tr>
                                        <tr>
                                             <td class="field2" valign="top">Measure</td>
                                             <td class="data1" valign="top"><xsl:value-of select="@code"/></td>
                                        </tr>
                                   </tbody>
                              </table><br/>
                         </xsl:for-each>
                    </xsl:if>
                    <xsl:for-each select="structure:Annotations/common:Annotation">
                         <table cellpadding="3" cellspacing="1" border="1" width="100%">
                              <tbody>
                                   <tr>
                                        <th class="field1" colspan="2">Annotation</th>
                                   </tr>
                                   <xsl:if test="common:AnnotationTitle">
                                        <tr>
                                             <td class="field2" valign="top">Title</td><td class="data1" valign="top"><xsl:value-of select="common:AnnotationTitle"/></td>
                                        </tr>
                                   </xsl:if>
                                   <xsl:if test="common:AnnotationType">
                                        <tr>
                                             <td class="field2" valign="top">Type</td><td class="data1" valign="top"><xsl:value-of select="common:AnnotationType"/></td>
                                        </tr>
                                   </xsl:if>
                                   <xsl:if test="common:AnnotationURL">
                                        <tr>
                                             <td class="field2" valign="top">URL</td><td class="data1" valign="top"><a href="{common:AnnotationURL}" target="newwindow"><xsl:value-of select="common:AnnotationURL"/></a></td>
                                        </tr>
                                   </xsl:if>
                                   <xsl:if test="common:AnnotationText">
                                        <tr>
                                             <td class="field2" valign="top">Text</td><td class="data1" valign="top"><xsl:value-of select="common:AnnotationText"/></td>
                                        </tr>
                                   </xsl:if>                          
                              </tbody>
                         </table><br/>
                    </xsl:for-each>                    
               </body>
          </xsl:document>
     </xsl:for-each>
     <xsl:for-each select="/message:Structure/message:KeyFamilies/structure:KeyFamily[@id = $KFID]/structure:Components/structure:TimeDimension">
          <xsl:document href="{$KFID}/Dim{@concept}.html" method="html" version="4.0" indent="yes">
               <head>
                    <title lang="{$KeyFamName/@xml:lang}"><xsl:value-of select="$KeyFamName"/></title>
                    <style type="text/css">
                         body {margin-top: 25; margin-right: 25; margin-left: 25; margin-bottom: 0; background-color: white}
                         table {border-color: #0000DD}
                         h2 {color: #0000DD; font-size: 12pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left}
                         .field1 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; width: 100%; background-color: #AAAAAA; border-color: #     003366}
                         .field2 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; text-indent: 10px; width: 20%; background-color:     #CCCCCC; border-color: #0000DD}
                         .field3 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; width: 20%; background-color: #AAAAAA; border-color: #     003366}
                         .data1 {color: black; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: normal; text-align: left; width: 80%; background-color: white; border-color: #     003366}
                         .allowedvals {width: 100%}
                    </style>
               </head>
               <body>
                    <xsl:variable name="Concept" select="@concept"/>
                    <xsl:variable name="DimDisplayName">
                         <xsl:choose>
                              <xsl:when test="/message:Structure/message:Concepts/structure:Concept[@id=$Concept]">
                                   <xsl:value-of select="/message:Structure/message:Concepts/structure:Concept[@id=$Concept]/structure:Name"/>
                              </xsl:when>
                              <xsl:otherwise>
                                   <xsl:value-of select="$Concept"/>
                              </xsl:otherwise>
                         </xsl:choose>
                    </xsl:variable>
                    <h2>Key Family Time Dimension: <xsl:value-of select="$DimDisplayName"/></h2>
                    <table cellpadding="3" cellspacing="1" border="1" width="100%">
                         <tbody>
                              <tr>
                                   <td class="field3" valign="top">Concept ID</td><td class="data1" valign="top"><a href="{$Concept}.html" class="data1"><xsl:value-of select="$Concept"/></a></td>
                              </tr>
                              <xsl:if test=" structure:TextFormat">
                                    <tr>
                                         <td class="field3" valign="top">Non XML Format</td>
                                        <td class="data1" valign="top">
                                             <xsl:choose>
                                                  <xsl:when test="structure:TextFormat/@TextType='Alpha'">
                                                       Alpha <xsl:value-of select="structure:TextFormat/@length"/>
                                                  </xsl:when>
                                                  <xsl:when test="structure:TextFormat/@TextType='AlphaFixed'">
                                                       Fixed Alpha <xsl:value-of select="structure:TextFormat/@length"/>
                                                  </xsl:when>
                                                  <xsl:when test="structure:TextFormat/@TextType='Num'">
                                                       Numeric <xsl:value-of select="structure:TextFormat/@length"/><xsl:if test="structure:TextFormat/@decimals">.<xsl:value-of select="structure:TextFormat/@decimals"/></xsl:if>
                                                  </xsl:when>
                                                  <xsl:when test="structure:TextFormat/@TextType='NumFixed'">
                                                       Fixed Numeric <xsl:value-of select="structure:TextFormat/@length"/><xsl:if test="structure:TextFormat/@decimals">.<xsl:value-of select="structure:TextFormat/@decimals"/></xsl:if>
                                                  </xsl:when>
                                                  <xsl:when test="structure:TextFormat/@TextType='AlphaNum'">
                                                       Alphanumeric <xsl:value-of select="structure:TextFormat/@length"/>
                                                  </xsl:when>
                                                  <xsl:when test="structure:TextFormat/@TextType='AlphaNumFixed'">
                                                       Fixed Alphanumeric <xsl:value-of select="structure:TextFormat/@length"/>
                                                  </xsl:when>
                                             </xsl:choose>
                                        </td>
                                   </tr>
                              </xsl:if>
                         </tbody>
                    </table><br/>
                    <xsl:for-each select="structure:Annotations/common:Annotation">
                         <table cellpadding="3" cellspacing="1" border="1" width="100%">
                              <tbody>
                                   <tr>
                                        <th class="field1" colspan="2">Annotation</th>
                                   </tr>
                                   <xsl:if test="common:AnnotationTitle">
                                        <tr>
                                             <td class="field2" valign="top">Title</td><td class="data1" valign="top"><xsl:value-of select="common:AnnotationTitle"/></td>
                                        </tr>
                                   </xsl:if>
                                   <xsl:if test="common:AnnotationType">
                                        <tr>
                                             <td class="field2" valign="top">Type</td><td class="data1" valign="top"><xsl:value-of select="common:AnnotationType"/></td>
                                        </tr>
                                   </xsl:if>
                                   <xsl:if test="common:AnnotationURL">
                                        <tr>
                                             <td class="field2" valign="top">URL</td><td class="data1" valign="top"><a href="{common:AnnotationURL}" target="newwindow"><xsl:value-of select="common:AnnotationURL"/></a></td>
                                        </tr>
                                   </xsl:if>
                                   <xsl:if test="common:AnnotationText">
                                        <tr>
                                             <td class="field2" valign="top">Text</td><td class="data1" valign="top"><xsl:value-of select="common:AnnotationText"/></td>
                                        </tr>
                                   </xsl:if>                          
                              </tbody>
                         </table><br/>
                    </xsl:for-each>
               </body>
          </xsl:document>
     </xsl:for-each>
</xsl:template>

<xsl:template name="Attributes">
     <xsl:param name="KFID"/>
     <xsl:param name="KeyFamName"/>
     <xsl:document href="{$KFID}/Attributes.html" method="html" version="4.0" indent="yes">
          <head>
               <title lang="{$KeyFamName/@xml:lang}"><xsl:value-of select="$KeyFamName"/></title>
               <style type="text/css">
                    body {margin-top: 25; margin-right: 25; margin-left: 25; margin-bottom: 0; background-color: white}
                    table {border-color: #0000DD}
                    h2 {color: #0000DD; font-size: 12pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left}
                    .field1 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; width: 100%; background-color: #AAAAAA; border-color: #0000DD}
                    .field2 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; text-indent: 10px; width: 20%; background-color: #CCCCCC; border-color: #0000DD}
                    .data1 {color: black; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: normal; text-align: left; width: 80%; background-color: white; border-color: #0000DD}
                    .allowedvals {width: 100%}
               </style>               
          </head>
          <body>
               <h2>Key Family Attributes</h2>
               <xsl:for-each select="/message:Structure/message:KeyFamilies/structure:KeyFamily[@id = $KFID]/structure:Components/structure:PrimaryMeasure">
                    <table cellpadding="3" cellspacing="1" border="1" width="100%">
                         <tbody>
                              <xsl:variable name="Concept" select="@concept"/>
                              <tr>
                                   <th class="field1" colspan="2">
                                        <xsl:if test="/message:Structure/message:Concepts/structure:Concept[@id=$Concept]">
                                             <a href="Att{$Concept}.html" class="field1">Primary Measure - <xsl:value-of select="/message:Structure/message:Concepts/structure:Concept[@id=$Concept]/structure:Name"/></a>
                                        </xsl:if>                                   
                                   </th>
                              </tr>
                              <tr>
                                   <td class="field2" valign="top">Concept ID</td><td class="data1" valign="top"><a href="{$Concept}.html" class="data1"><xsl:value-of select="$Concept"/></a></td>
                              </tr>
                         </tbody>
                    </table><br/>
               </xsl:for-each>
               <xsl:for-each select="/message:Structure/message:KeyFamilies/structure:KeyFamily[@id = $KFID]/structure:Components/structure:Attribute">
                    <table cellpadding="3" cellspacing="1" border="1" width="100%">
                         <tbody>
                              <xsl:variable name="CodeList" select="@codelist"/>
                              <xsl:variable name="Concept" select="@concept"/>
                              <tr>
                                   <th class="field1" colspan="2">
                                        <xsl:if test="/message:Structure/message:Concepts/structure:Concept[@id=$Concept]">
                                             <a href="Att{$Concept}.html" class="field1"><xsl:if test="@isTimeFormat='true'">Time Format - </xsl:if><xsl:value-of select="/message:Structure/message:Concepts/structure:Concept[@id=$Concept]/structure:Name"/></a>
                                        </xsl:if>                                   
                                   </th>
                              </tr>
                              <tr>
                                   <td class="field2" valign="top">Concept ID</td><td class="data1" valign="top"><a href="{$Concept}.html" class="data1"><xsl:value-of select="$Concept"/></a></td>
                              </tr>
                              <xsl:if test="/message:Structure/message:CodeLists/structure:CodeList[@id=$CodeList]">
                                    <tr>
                                         <td class="field2" valign="top">Allowed Values</td>
                                        <td class="data1" valign="top">
                                             <select class="allowedvals">
                                                  <optgroup label="Allowed Values">
                                                       <xsl:for-each select="/message:Structure/message:CodeLists/structure:CodeList[@id=$CodeList]/structure:Code">
                                                            <option><xsl:value-of select="@value"/> - <xsl:value-of select="structure:Description"/></option>
                                                       </xsl:for-each>
                                                  </optgroup>
                                             </select>
                                        </td>
                                   </tr>
                              </xsl:if>
                              <xsl:if test="structure:TextFormat">
                                    <tr>
                                         <td class="field2" valign="top">Text Format</td>
                                        <td class="data1" valign="top">
                                             <xsl:choose>
                                                  <xsl:when test="structure:TextFormat/@TextType='Alpha'">
                                                       Alpha <xsl:value-of select="structure:TextFormat/@length"/>
                                                  </xsl:when>
                                                  <xsl:when test="structure:TextFormat/@TextType='AlphaFixed'">
                                                       Fixed Alpha <xsl:value-of select="structure:TextFormat/@length"/>
                                                  </xsl:when>
                                                  <xsl:when test="structure:TextFormat/@TextType='Num'">
                                                       Numeric <xsl:value-of select="structure:TextFormat/@length"/><xsl:if test="structure:TextFormat/@decimals">.<xsl:value-of select="structure:TextFormat/@decimals"/></xsl:if>
                                                  </xsl:when>
                                                  <xsl:when test="structure:TextFormat/@TextType='NumFixed'">
                                                       Fixed Numeric <xsl:value-of select="structure:TextFormat/@length"/><xsl:if test="structure:TextFormat/@decimals">.<xsl:value-of select="structure:TextFormat/@decimals"/></xsl:if>
                                                  </xsl:when>
                                                  <xsl:when test="structure:TextFormat/@TextType='AlphaNum'">
                                                       Alphanumeric <xsl:value-of select="structure:TextFormat/@length"/>
                                                  </xsl:when>
                                                  <xsl:when test="structure:TextFormat/@TextType='AlphaNumFixed'">
                                                       Fixed Alphanumeric <xsl:value-of select="structure:TextFormat/@length"/>
                                                  </xsl:when>
                                             </xsl:choose>
                                        </td>
                                   </tr>
                              </xsl:if>
                              <tr>
                                   <td class="field2" valign="top">Attachment Level</td><td class="data1" valign="top"><xsl:value-of select="@attachmentLevel"/></td>
                              </tr>
                              <tr>
                                   <td class="field2" valign="top">Assignment Status</td><td class="data1" valign="top"><xsl:value-of select="@assignmentStatus"/></td>
                              </tr>
                         </tbody>
                    </table><br/>
               </xsl:for-each>
          </body>
     </xsl:document>

     <xsl:for-each select="/message:Structure/message:KeyFamilies/structure:KeyFamily[@id = $KFID]/structure:Components/structure:Attribute">
          <xsl:document href="{$KFID}/Att{@concept}.html" method="html" version="4.0" indent="yes">
               <head>
                    <title lang="{$KeyFamName/@xml:lang}"><xsl:value-of select="$KeyFamName"/></title>
                    <style type="text/css">
                         body {margin-top: 25; margin-right: 25; margin-left: 25; margin-bottom: 0; background-color: white}
                         table {border-color: #0000DD}
                         h2 {color: #0000DD; font-size: 12pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left}
                         .field1 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; width: 100%; background-color: #AAAAAA; border-color: #0000DD}
                         .field2 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; text-indent: 10px; width: 20%; background-color: #CCCCCC; border-color: #0000DD}
                         .field3 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; width: 20%; background-color: #AAAAAA; border-color: #0000DD}
                         .data1 {color: black; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: normal; text-align: left; width: 80%; background-color: white; border-color: #0000DD}
                         .allowedvals {width: 100%}
                    </style>
               </head>
               <body>
                    <xsl:variable name="CodeList" select="@codelist"/>
                    <xsl:variable name="Concept" select="@concept"/>
                    <xsl:variable name="AttDisplayName">
                         <xsl:choose>
                              <xsl:when test="/message:Structure/message:Concepts/structure:Concept[@id=$Concept]">
                                   <xsl:value-of select="/message:Structure/message:Concepts/structure:Concept[@id=$Concept]/structure:Name"/>
                              </xsl:when>
                              <xsl:otherwise>
                                   <xsl:value-of select="$Concept"/>
                              </xsl:otherwise>
                         </xsl:choose>
                    </xsl:variable>                    
                    <h2>Key Family <xsl:if test="@isTimeFormat='true'">Time Format</xsl:if> Attribute: <xsl:value-of select="$AttDisplayName"/></h2>
                    <table cellpadding="3" cellspacing="1" border="1" width="100%">
                         <tbody>
                              <tr>
                                   <td class="field3" valign="top">Concept ID</td><td class="data1" valign="top"><a href="{$Concept}.html" class="data1"><xsl:value-of select="$Concept"/></a></td>
                              </tr>
                              <xsl:if test="/message:Structure/message:CodeLists/structure:CodeList[@id=$CodeList]">
                                    <tr>
                                        <td class="field3" valign="top">Code List</td>
                                        <td class="data1" valign="top">
                                            <a href="{$CodeList}.html" class="data1"><xsl:value-of select="/message:Structure/message:CodeLists/structure:CodeList[@id=$CodeList]/structure:Name"/></a>
                                        </td>                                             
                                   </tr>
                                    <tr>
                                         <td class="field3" valign="top">Allowed Values</td>
                                        <td class="data1" valign="top">
                                             <select class="allowedvals">
                                                  <optgroup label="Allowed Values">
                                                       <xsl:for-each select="/message:Structure/message:CodeLists/structure:CodeList[@id=$CodeList]/structure:Code">
                                                            <option><xsl:value-of select="@value"/> - <xsl:value-of select="structure:Description"/></option>
                                                       </xsl:for-each>
                                                  </optgroup>
                                             </select>
                                        </td>
                                   </tr>
                              </xsl:if>
                              <xsl:if test="structure:TextFormat">
                                    <tr>
                                         <td class="field3" valign="top">Text Format</td>
                                        <td class="data1" valign="top">
                                             <xsl:choose>
                                                  <xsl:when test="structure:TextFormat/@TextType='Alpha'">
                                                       Alpha <xsl:value-of select="structure:TextFormat/@length"/>
                                                  </xsl:when>
                                                  <xsl:when test="structure:TextFormat/@TextType='AlphaFixed'">
                                                       Fixed Alpha <xsl:value-of select="structure:TextFormat/@length"/>
                                                  </xsl:when>
                                                  <xsl:when test="structure:TextFormat/@TextType='Num'">
                                                       Numeric <xsl:value-of select="structure:TextFormat/@length"/><xsl:if test="structure:TextFormat/@decimals">.<xsl:value-of select="structure:TextFormat/     @decimals"/></xsl:if>
                                                  </xsl:when>
                                                  <xsl:when test="structure:TextFormat/@TextType='NumFixed'">
                                                       Fixed Numeric <xsl:value-of select="structure:TextFormat/@length"/><xsl:if test="structure:TextFormat/@decimals">.<xsl:value-of select="structure:TextFormat/     @decimals"/></xsl:if>
                                                  </xsl:when>
                                                  <xsl:when test="structure:TextFormat/@TextType='AlphaNum'">
                                                       Alphanumeric <xsl:value-of select="structure:TextFormat/@length"/>
                                                  </xsl:when>
                                                  <xsl:when test="structure:TextFormat/@TextType='AlphaNumFixed'">
                                                       Fixed Alphanumeric <xsl:value-of select="structure:TextFormat/@length"/>
                                                  </xsl:when>
                                             </xsl:choose>
                                        </td>
                                   </tr>
                              </xsl:if>
                              <tr>
                                   <td class="field3" valign="top">Attachment Level</td><td class="data1" valign="top"><xsl:value-of select="@attachmentLevel"/></td>
                              </tr>
                              <tr>
                                   <td class="field3" valign="top">Assignment Status</td><td class="data1" valign="top"><xsl:value-of select="@assignmentStatus"/></td>
                              </tr>
                              <xsl:if test="@*[name()!='isTimeFormt' and .='true']">
                                   <tr>
                                        <td class="field3" valign="top">Cross Sectional Attachments</td>
                                        <td class="data1" valign="top">
                                             <xsl:for-each select="@*[name()!='isTimeFormat' and .='true']">
                                                  <xsl:value-of select="substring(name(),21)"/><xsl:if test="not(position()=last())"><br/></xsl:if>
                                             </xsl:for-each>
                                        </td>
                                   </tr>
                              </xsl:if>
                              <xsl:if test="structure:AttachmentGroup">
                                   <tr>
                                        <td class="field3" valign="top">Group Attachments</td>
                                        <td class="data1" valign="top">
                                             <xsl:for-each select="structure:AttachmentGroup">
                                                  <a href="Grp{.}.html" class="data1"><xsl:value-of select="."/></a><xsl:if test="not(position()=last())"><br/></xsl:if>
                                             </xsl:for-each>
                                        </td>
                                   </tr>
                              </xsl:if>
                              <xsl:if test="structure:AttachmentMeasure">
                                   <tr>
                                        <td class="field3" valign="top">Cross Sectional Measure Attachments</td>
                                        <td class="data1" valign="top">
                                             <xsl:for-each select="structure:AttachmentMeasure">
                                                  <a href="CSM{.}.html" class="data1"><xsl:value-of select="."/></a><xsl:if test="not(position()=last())"><br/></xsl:if>
                                             </xsl:for-each>
                                        </td>
                                   </tr>
                              </xsl:if>
                         </tbody>
                    </table><br/>
                    <xsl:for-each select="structure:Annotations/common:Annotation">
                         <table cellpadding="3" cellspacing="1" border="1" width="100%">
                              <tbody>
                                   <tr>
                                        <th class="field1" colspan="2">Annotation</th>
                                   </tr>
                                   <xsl:if test="common:AnnotationTitle">
                                        <tr>
                                             <td class="field2" valign="top">Title</td><td class="data1" valign="top"><xsl:value-of select="common:AnnotationTitle"/></td>
                                        </tr>
                                   </xsl:if>
                                   <xsl:if test="common:AnnotationType">
                                        <tr>
                                             <td class="field2" valign="top">Type</td><td class="data1" valign="top"><xsl:value-of select="common:AnnotationType"/></td>
                                        </tr>
                                   </xsl:if>
                                   <xsl:if test="common:AnnotationURL">
                                        <tr>
                                             <td class="field2" valign="top">URL</td><td class="data1" valign="top"><a href="{common:AnnotationURL}" target="newwindow"><xsl:value-of select="common:AnnotationURL"/></a></td>
                                        </tr>
                                   </xsl:if>
                                   <xsl:if test="common:AnnotationText">
                                        <tr>
                                             <td class="field2" valign="top">Text</td><td class="data1" valign="top"><xsl:value-of select="common:AnnotationText"/></td>
                                        </tr>
                                   </xsl:if>                          
                              </tbody>
                         </table><br/>
                    </xsl:for-each>                         
               </body>
          </xsl:document>
     </xsl:for-each>

     <xsl:for-each select="/message:Structure/message:KeyFamilies/structure:KeyFamily[@id = $KFID]/structure:Components/structure:PrimaryMeasure">
          <xsl:document href="{$KFID}/Att{@concept}.html" method="html" version="4.0" indent="yes">
               <head>
                    <title lang="{$KeyFamName/@xml:lang}"><xsl:value-of select="$KeyFamName"/></title>
                    <style type="text/css">
                         body {margin-top: 25; margin-right: 25; margin-left: 25; margin-bottom: 0; background-color: white}
                         table {border-color: #0000DD}
                         h2 {color: #0000DD; font-size: 12pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left}
                         .field1 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; width: 100%; background-color: #AAAAAA; border-color: #0000DD}
                         .field2 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; text-indent: 10px; width: 20%; background-color: #CCCCCC; border-color: #0000DD}
                         .field3 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; width: 20%; background-color: #AAAAAA; border-color: #0000DD}
                         .data1 {color: black; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: normal; text-align: left; width: 80%; background-color: white; border-color: #0000DD}
                         .allowedvals {width: 100%}
                    </style>
               </head>
               <body>
                    <xsl:variable name="Concept" select="@concept"/>
                    <xsl:variable name="AttDisplayName">
                         <xsl:choose>
                              <xsl:when test="/message:Structure/message:Concepts/structure:Concept[@id=$Concept]">
                                   <xsl:value-of select="/message:Structure/message:Concepts/structure:Concept[@id=$Concept]/structure:Name"/>
                              </xsl:when>
                              <xsl:otherwise>
                                   <xsl:value-of select="$Concept"/>
                              </xsl:otherwise>
                         </xsl:choose>
                    </xsl:variable>                    
                    <h2>Key Family Primary Measure: <xsl:value-of select="$AttDisplayName"/></h2>
                    <table cellpadding="3" cellspacing="1" border="1" width="100%">
                         <tbody>
                              <tr>
                                   <td class="field3" valign="top">Concept ID</td><td class="data1" valign="top"><a href="{$Concept}.html" class="data1"><xsl:value-of select="$Concept"/></a></td>
                              </tr>
                         </tbody>
                    </table><br/>
                    <xsl:for-each select="structure:Annotations/common:Annotation">
                         <table cellpadding="3" cellspacing="1" border="1" width="100%">
                              <tbody>
                                   <tr>
                                        <th class="field1" colspan="2">Annotation</th>
                                   </tr>
                                   <xsl:if test="common:AnnotationTitle">
                                        <tr>
                                             <td class="field2" valign="top">Title</td><td class="data1" valign="top"><xsl:value-of select="common:AnnotationTitle"/></td>
                                        </tr>
                                   </xsl:if>
                                   <xsl:if test="common:AnnotationType">
                                        <tr>
                                             <td class="field2" valign="top">Type</td><td class="data1" valign="top"><xsl:value-of select="common:AnnotationType"/></td>
                                        </tr>
                                   </xsl:if>
                                   <xsl:if test="common:AnnotationURL">
                                        <tr>
                                             <td class="field2" valign="top">URL</td><td class="data1" valign="top"><a href="{common:AnnotationURL}" target="newwindow"><xsl:value-of select="common:AnnotationURL"/></a></td>
                                        </tr>
                                   </xsl:if>
                                   <xsl:if test="common:AnnotationText">
                                        <tr>
                                             <td class="field2" valign="top">Text</td><td class="data1" valign="top"><xsl:value-of select="common:AnnotationText"/></td>
                                        </tr>
                                   </xsl:if>                          
                              </tbody>
                         </table><br/>
                    </xsl:for-each>                         
               </body>
          </xsl:document>
     </xsl:for-each>

</xsl:template>

<xsl:template name="Concepts">
     <xsl:param name="KFID"/>
     <xsl:param name="KeyFamName"/>
     <xsl:for-each select="/message:Structure/message:Concepts/structure:Concept">
          <xsl:document href="{$KFID}/{@id}.html" method="html" version="4.0" indent="yes">
               <head>
                    <title lang="{$KeyFamName/@xml:lang}"><xsl:value-of select="$KeyFamName"/></title>
                    <style type="text/css">
                         body {margin-top: 25; margin-right: 25; margin-left: 25; margin-bottom: 0; background-color: white}
                         table {border-color: #0000DD}
                         h2 {color: #0000DD; font-size: 12pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left}
                         .field1 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; width: 100%; background-color: #AAAAAA; border-color: #0000DD}
                         .field2 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; text-indent: 10px; width: 20%; background-color:     #CCCCCC; border-color: #0000DD}
                         .field3 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; width: 20%; background-color: #AAAAAA; border-color: #0000DD}
                         .data1 {color: black; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: normal; text-align: left; width: 80%; background-color: white; border-color: #0000DD}
                         .allowedvals {width: 100%}
                    </style>               
               </head>
               <body>
                    <h2>Key Family Concept: <xsl:value-of select="structure:Name"/></h2>
                    <table cellpadding="3" cellspacing="1" border="1" width="100%">
                         <tbody>
                              <tr>
                                   <td class="field3" valign="top">ID</td><td class="data1" valign="top"><xsl:value-of select="@id"/></td>
                              </tr>
                              <xsl:if test="@version">
                                    <tr>
                                        <td class="field3" valign="top">Version</td>
                                        <td class="data1" valign="top">
                                             <xsl:value-of select="@version"/>
                                        </td>
                                   </tr>
                              </xsl:if>
                              <xsl:if test="@agency">
                                   <xsl:variable name="AgencyID" select="@agency"/>
                                   <xsl:variable name="Agency">
                                        <xsl:choose>
                                             <xsl:when test="/message:Structure/message:Header/message:Sender[@id = $AgencyID]/message:Name">
                                                  <xsl:value-of select="/message:Structure/message:Header/message:Sender[@id = $AgencyID]/message:Name"/>
                                             </xsl:when>
                                             <xsl:when test="/message:Structure/message:Header/message:Receiver[@id = $AgencyID]/message:Name">
                                                  <xsl:value-of select="/message:Structure/message:Header/message:Receiver[@id = $AgencyID]/message:Name"/>
                                             </xsl:when>
                                             <xsl:when test="/message:Structure/message:Agencies/structure:Agency[@id = $AgencyID]/structure:Name">
                                                  <xsl:value-of select="/message:Structure/message:Agencies/structure:Agency[@id = $AgencyID]/structure:Name"/>
                                             </xsl:when>
                                             <xsl:otherwise>
                                                  <xsl:value-of select="$AgencyID"/>
                                             </xsl:otherwise>
                                        </xsl:choose>
                                   </xsl:variable>
                                   <tr>
                                        <td class="field3" valign="top">Agency</td><td class="data1" valign="top"><a href="Ag{$AgencyID}.html" class="data1"><xsl:value-of select="$Agency"/></a></td>
                                   </tr>
                              </xsl:if>
                              <xsl:if test="@uri">
                                   <tr>
                                        <td class="field3" valign="top">URI</td><td class="data1" valign="top"><xsl:value-of select="@uri"/></td>
                                   </tr>
                              </xsl:if>
                         </tbody>
                    </table><br/>
                    <xsl:for-each select="structure:Annotations/common:Annotation">
                         <table cellpadding="3" cellspacing="1" border="1" width="100%">
                              <tbody>
                                   <tr>
                                        <th class="field1" colspan="2">Annotation</th>
                                   </tr>
                                   <xsl:if test="common:AnnotationTitle">
                                        <tr>
                                             <td class="field2" valign="top">Title</td><td class="data1" valign="top"><xsl:value-of select="common:AnnotationTitle"/></td>
                                        </tr>
                                   </xsl:if>
                                   <xsl:if test="common:AnnotationType">
                                        <tr>
                                             <td class="field2" valign="top">Type</td><td class="data1" valign="top"><xsl:value-of select="common:AnnotationType"/></td>
                                        </tr>
                                   </xsl:if>
                                   <xsl:if test="common:AnnotationURL">
                                        <tr>
                                             <td class="field2" valign="top">URL</td><td class="data1" valign="top"><a href="{common:AnnotationURL}" target="newwindow"><xsl:value-of select="common:AnnotationURL"/></a></td>
                                        </tr>
                                   </xsl:if>
                                   <xsl:if test="common:AnnotationText">
                                        <tr>
                                             <td class="field2" valign="top">Text</td><td class="data1" valign="top"><xsl:value-of select="common:AnnotationText"/></td>
                                        </tr>
                                   </xsl:if>                          
                              </tbody>
                         </table><br/>
                    </xsl:for-each>                    
               </body>
          </xsl:document>
     </xsl:for-each>
</xsl:template>

<xsl:template name="ConceptTable">
     <xsl:param name="KFID"/>
     <xsl:param name="KeyFamName"/>
     <xsl:document href="{$KFID}/Concepts.html" method="html" version="4.0" indent="yes">
          <head>
               <title lang="{$KeyFamName/@xml:lang}"><xsl:value-of select="$KeyFamName"/></title>
               <style type="text/css">
                    body {margin-top: 25; margin-right: 25; margin-left: 25; margin-bottom: 0; background-color: white}
                    table {border-color: #0000DD}
                    h2 {color: #0000DD; font-size: 12pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left}
                    .field1 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; width: 100%; background-color: #AAAAAA; border-color: #0000DD; text-align: center}
                    .field2 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; text-indent: 10px; width: 20%; background-color: #CCCCCC; border-color: #0000DD}
                    .field3 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; width: 20%; background-color: #AAAAAA; border-color: #0000DD}
                    .field4 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; width: 20%; background-color: #CCCCCC; border-color: #0000DD}                         
                    .field5 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; width: 80%; background-color: #CCCCCC; border-color: #0000DD}
                    .field6 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; width: 60%; background-color: #CCCCCC; border-color: #0000DD}                         
                    .data1 {color: black; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: normal; text-align: left; width: 80%; background-color: white; border-color: #0000DD}
                    .data2 {color: black; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: normal; text-align: left; width: 20%; background-color: white; border-color: #0000DD}
                    .data3 {color: black; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: normal; text-align: left; width: 60%; background-color: white; border-color: #0000DD}
                    .allowedvals {width: 100%}
               </style>               
          </head>
          <body>
               <h2>Key Family Concepts</h2>
                    <table cellpadding="3" cellspacing="1" border="1" width="100%">
                         <tbody>
                              <tr>
                                   <th class="field1" colspan="3">Concepts</th>
                              </tr>
                              <tr>
                                   <td class="field4" valign="top">ID</td><td class="field5" valign="top">Description</td>
                              </tr>
                              <xsl:for-each select="//structure:Concept">
                              <xsl:variable name="ID" select="@id"/>
                              <tr>
                                   <td class="data2" valign="top"><a href="{$ID}.html" class="data2"><xsl:value-of select="$ID"/></a></td><td class="data1" valign="top"><xsl:value-of select="structure:Name"/></td>
                              </tr>
                              </xsl:for-each>
                         </tbody>
                    </table><br/>
          </body>
     </xsl:document>
</xsl:template>

<xsl:template name="CodeLists">
     <xsl:param name="KFID"/>
     <xsl:param name="KeyFamName"/>
     <xsl:for-each select="/message:Structure/message:CodeLists/structure:CodeList">
          <xsl:document href="{$KFID}/{@id}.html" method="html" version="4.0" indent="yes">
               <head>
                    <title lang="{$KeyFamName/@xml:lang}"><xsl:value-of select="$KeyFamName"/></title>
                    <style type="text/css">
                         body {margin-top: 25; margin-right: 25; margin-left: 25; margin-bottom: 0; background-color: white}
                         table {border-color: #0000DD}
                         h2 {color: #0000DD; font-size: 12pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left}
                         .field1 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; width: 100%; background-color: #AAAAAA; border-color: #0000DD}
                         .field2 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; text-indent: 10px; width: 20%; background-color: #CCCCCC; border-color: #0000DD}
                         .field3 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; width: 20%; background-color: #AAAAAA; border-color: #0000DD}
                         .field4 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; width: 20%; background-color: #CCCCCC; border-color: #0000DD}                         
                         .field5 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; width: 80%; background-color: #CCCCCC; border-color: #0000DD}
                         .field6 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; width: 60%; background-color: #CCCCCC; border-color: #0000DD}                         
                         .data1 {color: black; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: normal; text-align: left; width: 80%; background-color: white; border-color: #0000DD}
                         .data2 {color: black; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: normal; text-align: left; width: 20%; background-color: white; border-color: #0000DD}
                         .data3 {color: black; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: normal; text-align: left; width: 60%; background-color: white; border-color: #0000DD}
                         .allowedvals {width: 100%}
                    </style>               
               </head>
               <body>
                    <h2>Key Family Code List: <xsl:value-of select="structure:Name"/></h2>
                    <table cellpadding="3" cellspacing="1" border="1" width="100%">
                         <tbody>
                              <tr>
                                   <td class="field3" valign="top">ID</td><td class="data1" valign="top"><xsl:value-of select="@id"/></td>
                              </tr>
                              <xsl:if test="@version">
                                    <tr>
                                        <td class="field3" valign="top">Version</td>
                                        <td class="data1" valign="top">
                                             <xsl:value-of select="@version"/>
                                        </td>
                                   </tr>
                              </xsl:if>
                              <xsl:if test="@agency">
                                   <xsl:variable name="AgencyID" select="@agency"/>
                                   <xsl:variable name="Agency">
                                        <xsl:choose>
                                             <xsl:when test="/message:Structure/message:Header/message:Sender[@id = $AgencyID]/message:Name">
                                                  <xsl:value-of select="/message:Structure/message:Header/message:Sender[@id = $AgencyID]/message:Name"/>
                                             </xsl:when>
                                             <xsl:when test="/message:Structure/message:Header/message:Receiver[@id = $AgencyID]/message:Name">
                                                  <xsl:value-of select="/message:Structure/message:Header/message:Receiver[@id = $AgencyID]/message:Name"/>
                                             </xsl:when>
                                             <xsl:when test="/message:Structure/message:Agencies/structure:Agency[@id = $AgencyID]/structure:Name">
                                                  <xsl:value-of select="/message:Structure/message:Agencies/structure:Agency[@id = $AgencyID]/structure:Name"/>
                                             </xsl:when>
                                             <xsl:otherwise>
                                                  <xsl:value-of select="$AgencyID"/>
                                             </xsl:otherwise>
                                        </xsl:choose>
                                   </xsl:variable>
                                   <tr>
                                        <td class="field3" valign="top">Agency</td><td class="data1" valign="top"><a href="Ag{$AgencyID}.html" class="data1"><xsl:value-of select="$Agency"/></a></td>
                                   </tr>
                              </xsl:if>
                              <xsl:if test="@uri">
                                   <tr>
                                        <td class="field3" valign="top">URI</td><td class="data1" valign="top"><xsl:value-of select="@uri"/></td>
                                   </tr>
                              </xsl:if>
                         </tbody>
                    </table><br/>
                    <xsl:if test="structure:Code">
                         <xsl:choose>
                              <xsl:when test="structure:Code/structure:Annotations">
                                   <table cellpadding="3" cellspacing="1" border="1" width="100%">
                                        <tbody>
                                             <tr>
                                                  <th class="field1" colspan="3">Codes</th>
                                             </tr>
                                             <tr>
                                                  <th class="field4">Value</th><th class="field6">Description</th><th class="field4">Annotations</th>
                                             </tr>
                                             <xsl:for-each select="structure:Code">
                                                  <tr>
                                                       <td class="data2" valign="top"><xsl:value-of select="@value"/></td><td class="data3"><xsl:value-of select="structure:Description"/></td>
                                                       <td class="data2" valign="top">
                                                            <xsl:choose>
                                                                 <xsl:when test="structure:Annotations">
                                                                      <a href="{../@id}{@value}Ann.html" class="data2">View</a>
                                                                      <xsl:call-template name="CodeAnn">
                                                                           <xsl:with-param name="KeyFamID"><xsl:value-of select="$KFID"/></xsl:with-param>
                                                                           <xsl:with-param name="KeyFamName"><xsl:value-of select="$KeyFamName"/></xsl:with-param>
                                                                           <xsl:with-param name="CodeList"><xsl:value-of select="../@id"/></xsl:with-param>
                                                                           <xsl:with-param name="Code"><xsl:value-of select="@value"/></xsl:with-param>                                                                      
                                                                      </xsl:call-template>
                                                                 </xsl:when>
                                                                 <xsl:otherwise>None</xsl:otherwise>
                                                            </xsl:choose>
                                                       </td>
                                                  </tr>
                                             </xsl:for-each>
                                        </tbody>
                                   </table><br/>
                              </xsl:when>
                              <xsl:otherwise>
                                   <table cellpadding="3" cellspacing="1" border="1" width="100%">
                                        <tbody>
                                             <tr>
                                                  <th class="field1" colspan="3">Codes</th>
                                             </tr>
                                             <tr>
                                                  <th class="field4" valign="top">Value</th><th class="field5" valign="top">Description</th>
                                             </tr>
                                             <xsl:for-each select="structure:Code">
                                                  <tr>
                                                       <td class="data2" valign="top"><xsl:value-of select="@value"/></td><td class="data1" valign="top"><xsl:value-of select="structure:Description"/></td>
                                                  </tr>
                                             </xsl:for-each>
                                        </tbody>
                                   </table><br/>
                              </xsl:otherwise>
                         </xsl:choose>
                    </xsl:if>
                    <xsl:for-each select="structure:Annotations/common:Annotation">
                         <table cellpadding="3" cellspacing="1" border="1" width="100%">
                              <tbody>
                                   <tr>
                                        <th class="field1" colspan="2">Annotation</th>
                                   </tr>
                                   <xsl:if test="common:AnnotationTitle">
                                        <tr>
                                             <td class="field2" valign="top">Title</td><td class="data1" valign="top"><xsl:value-of select="common:AnnotationTitle"/></td>
                                        </tr>
                                   </xsl:if>
                                   <xsl:if test="common:AnnotationType">
                                        <tr>
                                             <td class="field2" valign="top">Type</td><td class="data1" valign="top"><xsl:value-of select="common:AnnotationType"/></td>
                                        </tr>
                                   </xsl:if>
                                   <xsl:if test="common:AnnotationURL">
                                        <tr>
                                             <td class="field2" valign="top">URL</td><td class="data1" valign="top"><a href="{common:AnnotationURL}" target="newwindow"><xsl:value-of select="common:AnnotationURL"/></a></td>
                                        </tr>
                                   </xsl:if>
                                   <xsl:if test="common:AnnotationText">
                                        <tr>
                                             <td class="field2" valign="top">Text</td><td class="data1" valign="top"><xsl:value-of select="common:AnnotationText"/></td>
                                        </tr>
                                   </xsl:if>                          
                              </tbody>
                         </table><br/>
                    </xsl:for-each>                    
               </body>
          </xsl:document>
     </xsl:for-each>
</xsl:template>

<xsl:template name="CodeListTable">
     <xsl:param name="KFID"/>
     <xsl:param name="KeyFamName"/>
     <xsl:document href="{$KFID}/CodeLists.html" method="html" version="4.0" indent="yes">
          <head>
               <title lang="{$KeyFamName/@xml:lang}"><xsl:value-of select="$KeyFamName"/></title>
               <style type="text/css">
                    body {margin-top: 25; margin-right: 25; margin-left: 25; margin-bottom: 0; background-color: white}
                    table {border-color: #0000DD}
                    h2 {color: #0000DD; font-size: 12pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left}
                    .field1 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; width: 100%; background-color: #AAAAAA; border-color: #0000DD; text-align: center}
                    .field2 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; text-indent: 10px; width: 20%; background-color: #CCCCCC; border-color: #0000DD}
                    .field3 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; width: 20%; background-color: #AAAAAA; border-color: #0000DD}
                    .field4 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; width: 20%; background-color: #CCCCCC; border-color: #0000DD}                         
                    .field5 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; width: 80%; background-color: #CCCCCC; border-color: #0000DD}
                    .field6 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; width: 60%; background-color: #CCCCCC; border-color: #0000DD}                         
                    .data1 {color: black; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: normal; text-align: left; width: 80%; background-color: white; border-color: #0000DD}
                    .data2 {color: black; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: normal; text-align: left; width: 20%; background-color: white; border-color: #0000DD}
                    .data3 {color: black; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: normal; text-align: left; width: 60%; background-color: white; border-color: #0000DD}
                    .allowedvals {width: 100%}
               </style>               
          </head>
          <body>
               <h2>Key Family Code Lists</h2>
                    <table cellpadding="3" cellspacing="1" border="1" width="100%">
                         <tbody>
                              <tr>
                                   <th class="field1" colspan="3">Code Lists</th>
                              </tr>
                              <tr>
                                   <td class="field4" valign="top">ID</td><td class="field5" valign="top">Description</td>
                              </tr>
                              <xsl:for-each select="//structure:CodeList">
                              <xsl:variable name="ID" select="@id"/>
                              <tr>
                                   <td class="data2" valign="top"><a href="{$ID}.html" class="data2"><xsl:value-of select="$ID"/></a></td><td class="data1" valign="top"><xsl:value-of select="structure:Name"/></td>
                              </tr>
                              </xsl:for-each>
                         </tbody>
                    </table><br/>
          </body>
     </xsl:document>
</xsl:template>

<xsl:template name="CodeAnn">
     <xsl:param name="KFID"/>
     <xsl:param name="KeyFamName"/>
     <xsl:param name="CodeList"/>
     <xsl:param name="Code"/>          
     <xsl:for-each select="/message:Structure/message:CodeLists/structure:CodeList[@id = $CodeList]/structure:Code[@value = $Code]">
          <xsl:document href="{$KFID}/{$CodeList}{$Code}Ann.html" method="html" version="4.0" indent="yes">
               <head>
                    <title lang="{$KeyFamName/@xml:lang}"><xsl:value-of select="$KeyFamName"/></title>
                    <style type="text/css">
                         body {margin-top: 25; margin-right: 25; margin-left: 25; margin-bottom: 0; background-color: white}
                         table {border-color: #0000DD}
                         h2 {color: #0000DD; font-size: 12pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left}
                         .field1 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; width: 100%; background-color: #AAAAAA; border-color: #0000DD}
                         .field2 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; text-indent: 10px; width: 20%; background-color: #CCCCCC; border-color: #0000DD}
                         .field3 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; width: 20%; background-color: #AAAAAA; border-color: #0000DD}
                         .field4 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; width: 20%; background-color: #CCCCCC; border-color: #0000DD}                         
                         .field5 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; width: 80%; background-color: #CCCCCC; border-color: #0000DD}
                         .field6 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; width: 60%; background-color: #CCCCCC; border-color: #0000DD}                         
                         .data1 {color: black; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: normal; text-align: left; width: 80%; background-color: white; border-color: #0000DD}
                         .data2 {color: black; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: normal; text-align: left; width: 20%; background-color: white; border-color: #0000DD}
                         .data3 {color: black; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: normal; text-align: left; width: 60%; background-color: white; border-color: #0000DD}
                         .allowedvals {width: 100%}
                    </style>               
               </head>
               <body>
                    <h2>Code <xsl:value-of select="$Code"/> Annotations</h2>
                    <xsl:for-each select="structure:Annotations/common:Annotation">
                         <table cellpadding="3" cellspacing="1" border="1" width="100%">
                              <tbody>
                                   <tr>
                                        <th class="field1" colspan="2">Annotation</th>
                                   </tr>
                                   <xsl:if test="common:AnnotationTitle">
                                        <tr>
                                             <td class="field2" valign="top">Title</td><td class="data1" valign="top"><xsl:value-of select="common:AnnotationTitle"/></td>
                                        </tr>
                                   </xsl:if>
                                   <xsl:if test="common:AnnotationType">
                                        <tr>
                                             <td class="field2" valign="top">Type</td><td class="data1" valign="top"><xsl:value-of select="common:AnnotationType"/></td>
                                        </tr>
                                   </xsl:if>
                                   <xsl:if test="common:AnnotationURL">
                                        <tr>
                                             <td class="field2" valign="top">URL</td><td class="data1" valign="top"><a href="{common:AnnotationURL}" target="newwindow"><xsl:value-of select="common:AnnotationURL"/></a></td>
                                        </tr>
                                   </xsl:if>
                                   <xsl:if test="common:AnnotationText">
                                        <tr>
                                             <td class="field2" valign="top">Text</td><td class="data1"  valign="top"><xsl:value-of select="common:AnnotationText"/></td>
                                        </tr>
                                   </xsl:if>                          
                              </tbody>
                         </table><br/>
                    </xsl:for-each>                    
               </body>
          </xsl:document>
     </xsl:for-each>
</xsl:template>

<xsl:template name="Groups">
     <xsl:param name="KFID"/>
     <xsl:param name="KeyFamName"/>
     <xsl:document href="{$KFID}/Groups.html" method="html" version="4.0" indent="yes">
          <head>
               <title lang="{$KeyFamName/@xml:lang}"><xsl:value-of select="$KeyFamName"/></title>
               <style type="text/css">
                    body {margin-top: 25; margin-right: 25; margin-left: 25; margin-bottom: 0; background-color: white}
                    table {border-color: #0000DD}
                    h2 {color: #0000DD; font-size: 12pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left}
                    .field1 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; width: 100%; background-color: #AAAAAA; border-color: #0000DD}
                    .field2 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; text-indent: 10px; width: 20%; background-color: #CCCCCC; border-color: #0000DD}
                    .data1 {color: black; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: normal; text-align: left; width: 80%; background-color: white; border-color: #0000DD}
                    .allowedvals {width: 100%}
               </style>               
          </head>
          <body>
               <h2>Key Family Groups</h2>
               <xsl:for-each select="/message:Structure/message:KeyFamilies/structure:KeyFamily[@id = $KFID]/structure:Components/structure:Group">
                    <table cellpadding="3" cellspacing="1" border="1" width="100%">
                         <tbody>
                              <tr>
                                   <th class="field1" colspan="2">
                                        <a href="Grp{@id}.html" class="field1"><xsl:value-of select="@id"/></a>                   
                                   </th>
                              </tr>
                              <xsl:for-each select="structure:DimensionRef">
                                   <xsl:variable name="Concept" select="."/>
                                   <xsl:variable name="DimDisplayName">
                                        <xsl:choose>
                                             <xsl:when test="/message:Structure/message:Concepts/structure:Concept[@id=$Concept]">
                                                  <xsl:value-of select="/message:Structure/message:Concepts/structure:Concept[@id=$Concept]/structure:Name"/>
                                             </xsl:when>
                                             <xsl:otherwise>
                                                  <xsl:value-of select="$Concept"/>
                                             </xsl:otherwise>
                                        </xsl:choose>
                                   </xsl:variable>
                                   <tr>
                                        <td class="field2" valign="top">Dimension</td><td class="data1" valign="top"><a href="Dim{$Concept}.html" class="data1"><xsl:value-of select="$DimDisplayName"/></a></td>
                                   </tr>
                              </xsl:for-each>
                         </tbody>
                    </table><br/>
               </xsl:for-each>
          </body>
     </xsl:document>

     <xsl:for-each select="/message:Structure/message:KeyFamilies/structure:KeyFamily[@id = $KFID]/structure:Components/structure:Group">
          <xsl:document href="{$KFID}/Grp{@id}.html" method="html" version="4.0" indent="yes">
               <head>
                    <title lang="{$KeyFamName/@xml:lang}"><xsl:value-of select="$KeyFamName"/></title>
                    <style type="text/css">
                         body {margin-top: 25; margin-right: 25; margin-left: 25; margin-bottom: 0; background-color: white}
                         table {border-color: #0000DD}
                         h2 {color: #0000DD; font-size: 12pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left}
                         .field1 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; width: 100%; background-color: #AAAAAA; border-color: #0000DD}
                         .field2 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; text-indent: 10px; width: 20%; background-color: #CCCCCC; border-color: #0000DD}
                         .field3 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; width: 20%; background-color: #AAAAAA; border-color: #0000DD}
                         .data1 {color: black; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: normal; text-align: left; width: 80%; background-color: white; border-color: #0000DD}
                         .allowedvals {width: 100%}
                    </style>
               </head>
               <body>
                    <xsl:variable name="GroupID" select="@id"/>
                    <h2>Key Family Group: <xsl:value-of select="@id"/></h2>
                    <table cellpadding="3" cellspacing="1" border="1" width="100%">
                         <tbody>
                              <tr>
                                   <td class="field3" valign="top">ID</td><td class="data1" valign="top"><xsl:value-of select="@id"/></td>
                              </tr>
                              <xsl:if test="structure:Description">
                                    <tr>
                                        <td class="field3" valign="top">Description</td>
                                        <td class="data1" valign="top">
                                            <xsl:value-of select="structure:Description"/>
                                        </td>                                             
                                   </tr>
                              </xsl:if>
                              <xsl:for-each select="structure:DimensionRef">
                                   <xsl:variable name="Concept" select="."/>
                                   <xsl:variable name="DimDisplayName">
                                        <xsl:choose>
                                             <xsl:when test="/message:Structure/message:Concepts/structure:Concept[@id=$Concept]">
                                                  <xsl:value-of select="/message:Structure/message:Concepts/structure:Concept[@id=$Concept]/structure:Name"/>
                                             </xsl:when>
                                             <xsl:otherwise>
                                                  <xsl:value-of select="$Concept"/>
                                             </xsl:otherwise>
                                        </xsl:choose>
                                   </xsl:variable>
                                   <tr>
                                        <td class="field3" valign="top">Dimension</td><td class="data1" valign="top"><a href="Dim{$Concept}.html" class="data1"><xsl:value-of select="$DimDisplayName"/></a></td>
                                   </tr>
                              </xsl:for-each>
                              <xsl:for-each select="/message:Structure/message:KeyFamilies/structure:KeyFamily[@id = $KFID]/structure:Components/structure:Attribute[structure:AttachmentGroup=$GroupID]">
                                   <xsl:variable name="Concept" select="@concept"/>
                                   <xsl:variable name="AttDisplayName">
                                        <xsl:choose>
                                             <xsl:when test="/message:Structure/message:Concepts/structure:Concept[@id=$Concept]">
                                                  <xsl:value-of select="/message:Structure/message:Concepts/structure:Concept[@id=$Concept]/structure:Name"/>
                                             </xsl:when>
                                             <xsl:otherwise>
                                                  <xsl:value-of select="$Concept"/>
                                             </xsl:otherwise>
                                        </xsl:choose>
                                   </xsl:variable>
                                   <tr>
                                        <td class="field3" valign="top">Attached Attrbiute</td><td class="data1" valign="top"><a href="Att{$Concept}.html" class="data1"><xsl:value-of select="$AttDisplayName"/></a></td>
                                   </tr>
                              </xsl:for-each>
                         </tbody>
                    </table><br/>
                    <xsl:for-each select="structure:Annotations/common:Annotation">
                         <table cellpadding="3" cellspacing="1" border="1" width="100%">
                              <tbody>
                                   <tr>
                                        <th class="field1" colspan="2">Annotation</th>
                                   </tr>
                                   <xsl:if test="common:AnnotationTitle">
                                        <tr>
                                             <td class="field2" valign="top">Title</td><td class="data1" valign="top"><xsl:value-of select="common:AnnotationTitle"/></td>
                                        </tr>
                                   </xsl:if>
                                   <xsl:if test="common:AnnotationType">
                                        <tr>
                                             <td class="field2" valign="top">Type</td><td class="data1" valign="top"><xsl:value-of select="common:AnnotationType"/></td>
                                        </tr>
                                   </xsl:if>
                                   <xsl:if test="common:AnnotationURL">
                                        <tr>
                                             <td class="field2" valign="top">URL</td><td class="data1" valign="top"><a href="{common:AnnotationURL}" target="newwindow"><xsl:value-of select="common:AnnotationURL"/></a></td>
                                        </tr>
                                   </xsl:if>
                                   <xsl:if test="common:AnnotationText">
                                        <tr>
                                             <td class="field2" valign="top">Text</td><td class="data1" valign="top"><xsl:value-of select="common:AnnotationText"/></td>
                                        </tr>
                                   </xsl:if>                          
                              </tbody>
                         </table><br/>
                    </xsl:for-each>                         
               </body>
          </xsl:document>
     </xsl:for-each>
</xsl:template>

<xsl:template name="Cross">
     <xsl:param name="KFID"/>
     <xsl:param name="KeyFamName"/>
     <xsl:document href="{$KFID}/CrossSectional.html" method="html" version="4.0" indent="yes">
          <head>
               <title lang="{$KeyFamName/@xml:lang}"><xsl:value-of select="$KeyFamName"/></title>
               <style type="text/css">
                    body {margin-top: 25; margin-right: 25; margin-left: 25; margin-bottom: 0; background-color: white}
                    table {border-color: #0000DD}
                    h2 {color: #0000DD; font-size: 12pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left}
                    .field1 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; width: 100%; background-color: #AAAAAA; border-color: #0000DD}
                    .field2 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; text-indent: 10px; width: 20%; background-color: #CCCCCC; border-color: #0000DD}
                    .data1 {color: black; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: normal; text-align: left; width: 80%; background-color: white; border-color: #0000DD}
                    .allowedvals {width: 100%}
               </style>               
          </head>
          <body>
               <h2>Key Family Cross Sectionial Information</h2>
               <xsl:if test="/message:Structure/message:KeyFamilies/structure:KeyFamily[@id = $KFID]/structure:Components/*[(name()='structure:Dimension' or name()='structure:Attribute') and @crossSectionalAttachDataSet='true']">
                    <table cellpadding="3" cellspacing="1" border="1" width="100%">
                         <tbody>
                              <tr>
                                   <th class="field1" colspan="2">Data Set Attachments</th>
                              </tr>
                              <xsl:for-each select="/message:Structure/message:KeyFamilies/structure:KeyFamily[@id = $KFID]/structure:Components/*[(name()='structure:Dimension' or name()='structure:Attribute') and @crossSectionalAttachDataSet='true']">
                                   <xsl:variable name="Concept" select="@concept"/>
                                   <xsl:variable name="DisplayName">
                                        <xsl:choose>
                                             <xsl:when test="/message:Structure/message:Concepts/structure:Concept[@id=$Concept]">
                                                  <xsl:value-of select="/message:Structure/message:Concepts/structure:Concept[@id=$Concept]/structure:Name"/>
                                             </xsl:when>
                                             <xsl:otherwise>
                                                  <xsl:value-of select="$Concept"/>
                                             </xsl:otherwise>
                                        </xsl:choose>
                                   </xsl:variable>
                                   <tr>
                                        <xsl:choose>
                                             <xsl:when test="name()='structure:Dimension'">
                                                  <td class="field2" valign="top">Dimension</td>
                                                  <td class="data1" valign="top"><a href="Dim{$Concept}.html" class="data1"><xsl:value-of select="$DisplayName"/></a></td>
                                             </xsl:when>
                                             <xsl:when test="name()='structure:Attribute'">
                                                  <td class="field2" valign="top">Attribute</td>
                                                  <td class="data1" valign="top"><a href="Att{$Concept}.html" class="data1"><xsl:value-of select="$DisplayName"/></a></td>
                                             </xsl:when>
                                        </xsl:choose>
                                   </tr>
                              </xsl:for-each>
                         </tbody>
                    </table><br/>     
               </xsl:if>
               <xsl:if test="/message:Structure/message:KeyFamilies/structure:KeyFamily[@id = $KFID]/structure:Components/*[(name()='structure:Dimension' or name()='structure:Attribute') and @crossSectionalAttachGroup='true']">
                    <table cellpadding="3" cellspacing="1" border="1" width="100%">
                         <tbody>
                              <tr>
                                   <th class="field1" colspan="2">Group Attachments</th>
                              </tr>
                              <xsl:for-each select="/message:Structure/message:KeyFamilies/structure:KeyFamily[@id = $KFID]/structure:Components/*[(name()='structure:Dimension' or name()='structure:Attribute') and @crossSectionalAttachGroup='true']">
                                   <xsl:variable name="Concept" select="@concept"/>
                                   <xsl:variable name="DisplayName">
                                        <xsl:choose>
                                             <xsl:when test="/message:Structure/message:Concepts/structure:Concept[@id=$Concept]">
                                                  <xsl:value-of select="/message:Structure/message:Concepts/structure:Concept[@id=$Concept]/structure:Name"/>
                                             </xsl:when>
                                             <xsl:otherwise>
                                                  <xsl:value-of select="$Concept"/>
                                             </xsl:otherwise>
                                        </xsl:choose>
                                   </xsl:variable>
                                   <tr>
                                        <xsl:choose>
                                             <xsl:when test="name()='structure:Dimension'">
                                                  <td class="field2" valign="top">Dimension</td>
                                                  <td class="data1" valign="top"><a href="Dim{$Concept}.html" class="data1"><xsl:value-of select="$DisplayName"/></a></td>
                                             </xsl:when>
                                             <xsl:when test="name()='structure:Attribute'">
                                                  <td class="field2" valign="top">Attribute</td>
                                                  <td class="data1" valign="top"><a href="Att{$Concept}.html" class="data1"><xsl:value-of select="$DisplayName"/></a></td>
                                             </xsl:when>
                                        </xsl:choose>
                                   </tr>
                              </xsl:for-each>
                         </tbody>
                    </table><br/>     
               </xsl:if>
               <xsl:if test="/message:Structure/message:KeyFamilies/structure:KeyFamily[@id = $KFID]/structure:Components/*[(name()='structure:Dimension' or name()='structure:Attribute') and @crossSectionalAttachSection='true']">
                    <table cellpadding="3" cellspacing="1" border="1" width="100%">
                         <tbody>
                              <tr>
                                   <th class="field1" colspan="2">Section Attachments</th>
                              </tr>
                              <xsl:for-each select="/message:Structure/message:KeyFamilies/structure:KeyFamily[@id = $KFID]/structure:Components/*[(name()='structure:Dimension' or name()='structure:Attribute') and @crossSectionalAttachSection='true']">
                                   <xsl:variable name="Concept" select="@concept"/>
                                   <xsl:variable name="DisplayName">
                                        <xsl:choose>
                                             <xsl:when test="/message:Structure/message:Concepts/structure:Concept[@id=$Concept]">
                                                  <xsl:value-of select="/message:Structure/message:Concepts/structure:Concept[@id=$Concept]/structure:Name"/>
                                             </xsl:when>
                                             <xsl:otherwise>
                                                  <xsl:value-of select="$Concept"/>
                                             </xsl:otherwise>
                                        </xsl:choose>
                                   </xsl:variable>
                                   <tr>
                                        <xsl:choose>
                                             <xsl:when test="name()='structure:Dimension'">
                                                  <td class="field2" valign="top">Dimension</td>
                                                  <td class="data1" valign="top"><a href="Dim{$Concept}.html" class="data1"><xsl:value-of select="$DisplayName"/></a></td>
                                             </xsl:when>
                                             <xsl:when test="name()='structure:Attribute'">
                                                  <td class="field2" valign="top">Attribute</td>
                                                  <td class="data1" valign="top"><a href="Att{$Concept}.html" class="data1"><xsl:value-of select="$DisplayName"/></a></td>
                                             </xsl:when>
                                        </xsl:choose>
                                   </tr>
                              </xsl:for-each>
                         </tbody>
                    </table><br/>     
               </xsl:if>
               <xsl:if test="/message:Structure/message:KeyFamilies/structure:KeyFamily[@id = $KFID]/structure:Components/*[(name()='structure:Dimension' or name()='structure:Attribute') and @crossSectionalAttachObservation='true']">
                    <table cellpadding="3" cellspacing="1" border="1" width="100%">
                         <tbody>
                              <tr>
                                   <th class="field1" colspan="2">Observation Attachments</th>
                              </tr>
                              <xsl:for-each select="/message:Structure/message:KeyFamilies/structure:KeyFamily[@id = $KFID]/structure:Components/*[(name()='structure:Dimension' or name()='structure:Attribute') and @crossSectionalAttachObservation='true']">
                                   <xsl:variable name="Concept" select="@concept"/>
                                   <xsl:variable name="DisplayName">
                                        <xsl:choose>
                                             <xsl:when test="/message:Structure/message:Concepts/structure:Concept[@id=$Concept]">
                                                  <xsl:value-of select="/message:Structure/message:Concepts/structure:Concept[@id=$Concept]/structure:Name"/>
                                             </xsl:when>
                                             <xsl:otherwise>
                                                  <xsl:value-of select="$Concept"/>
                                             </xsl:otherwise>
                                        </xsl:choose>
                                   </xsl:variable>
                                   <tr>
                                        <xsl:choose>
                                             <xsl:when test="name()='structure:Dimension'">
                                                  <td class="field2" valign="top">Dimension</td>
                                                  <td class="data1" valign="top"><a href="Dim{$Concept}.html" class="data1"><xsl:value-of select="$DisplayName"/></a></td>
                                             </xsl:when>
                                             <xsl:when test="name()='structure:Attribute'">
                                                  <td class="field2" valign="top">Attribute</td>
                                                  <td class="data1" valign="top"><a href="Att{$Concept}.html" class="data1"><xsl:value-of select="$DisplayName"/></a></td>
                                             </xsl:when>
                                        </xsl:choose>
                                   </tr>
                              </xsl:for-each>
                         </tbody>
                    </table><br/>     
               </xsl:if>
               <xsl:for-each select="/message:Structure/message:KeyFamilies/structure:KeyFamily[@id = $KFID]/structure:Components/structure:CrossSectionalMeasure">
                    <xsl:variable name="Concept" select="@concept"/>
                    <xsl:variable name="Dim" select="@measureDimension"/>
                    <xsl:variable name="Code" select="@code"/>
                    <xsl:variable name="CodeList" select="/message:Structure/message:KeyFamilies/structure:KeyFamily[@id = $KFID]/structure:Components/structure:Dimension[@concept=$Dim]/@codelist"/>
                    <xsl:variable name="DisplayName">
                         <xsl:choose>
                              <xsl:when test="/message:Structure/message:Concepts/structure:Concept[@id=$Concept]">
                                   <xsl:value-of select="/message:Structure/message:Concepts/structure:Concept[@id=$Concept]/structure:Name"/>
                              </xsl:when>
                              <xsl:otherwise>
                                   <xsl:value-of select="$Concept"/>
                              </xsl:otherwise>
                         </xsl:choose>
                    </xsl:variable>
                    <xsl:variable name="DimDisplayName">
                         <xsl:choose>
                              <xsl:when test="/message:Structure/message:Concepts/structure:Concept[@id=$Dim]">
                                   <xsl:value-of select="/message:Structure/message:Concepts/structure:Concept[@id=$Dim]/structure:Name"/>
                              </xsl:when>
                              <xsl:otherwise>
                                   <xsl:value-of select="$Dim"/>
                              </xsl:otherwise>
                         </xsl:choose>
                    </xsl:variable>
                    <xsl:variable name="CodeDisplayName">
                         <xsl:choose>
                              <xsl:when test="/message:Structure/message:CodeLists/structure:CodeList[@id=$CodeList]/structure:Code[@value=$Code]/structure:Description">
                                   <xsl:value-of select="$Code"/> - <xsl:value-of select="/message:Structure/message:CodeLists/structure:CodeList[@id=$CodeList]/structure:Code[@value=$Code]/structure:Description"/>
                              </xsl:when>
                              <xsl:otherwise>
                                   <xsl:value-of select="$Code"/>
                              </xsl:otherwise>
                         </xsl:choose>
                    </xsl:variable>                    
                    <table cellpadding="3" cellspacing="1" border="1" width="100%">
                         <tbody>
                              <tr>
                                   <th class="field1" colspan="2">
                                        <a href="CSM{$Concept}.html" class="field1"><xsl:value-of select="$DisplayName"/></a>
                                   </th>
                              </tr>
                              <tr>
                                   <td class="field2" valign="top">Dimension</td><td class="data1" valign="top"><a href="Dim{$Dim}.html" class="data1"><xsl:value-of select="$DimDisplayName"/></a></td>
                              </tr>
                              <tr>
                                   <td class="field2" valign="top">Value</td><td class="data1" valign="top"><xsl:value-of select="$CodeDisplayName"/></td>
                              </tr>
                         </tbody>
                    </table><br/>
               </xsl:for-each>
          </body>
     </xsl:document>

     <xsl:for-each select="/message:Structure/message:KeyFamilies/structure:KeyFamily[@id = $KFID]/structure:Components/structure:CrossSectionalMeasure">
          <xsl:document href="{$KFID}/CSM{@concept}.html" method="html" version="4.0" indent="yes">
               <head>
                    <title lang="{$KeyFamName/@xml:lang}"><xsl:value-of select="$KeyFamName"/></title>
                    <style type="text/css">
                         body {margin-top: 25; margin-right: 25; margin-left: 25; margin-bottom: 0; background-color: white}
                         table {border-color: #0000DD}
                         h2 {color: #0000DD; font-size: 12pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left}
                         .field1 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; width: 100%; background-color: #AAAAAA; border-color: #0000DD}
                         .field2 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; text-indent: 10px; width: 20%; background-color: #CCCCCC; border-color: #0000DD}
                         .field3 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; width: 20%; background-color: #AAAAAA; border-color: #0000DD}
                         .data1 {color: black; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: normal; text-align: left; width: 80%; background-color: white; border-color: #0000DD}
                         .allowedvals {width: 100%}
                    </style>
               </head>
               <body>
                    <xsl:variable name="Concept" select="@concept"/>
                    <xsl:variable name="Dim" select="@measureDimension"/>
                    <xsl:variable name="Code" select="@code"/>
                    <xsl:variable name="CodeList" select="/message:Structure/message:KeyFamilies/structure:KeyFamily[@id = $KFID]/structure:Components/structure:Dimension[@concept=$Dim]/@codelist"/>
                    <xsl:variable name="DisplayName">
                         <xsl:choose>
                              <xsl:when test="/message:Structure/message:Concepts/structure:Concept[@id=$Concept]">
                                   <xsl:value-of select="/message:Structure/message:Concepts/structure:Concept[@id=$Concept]/structure:Name"/>
                              </xsl:when>
                              <xsl:otherwise>
                                   <xsl:value-of select="$Concept"/>
                              </xsl:otherwise>
                         </xsl:choose>
                    </xsl:variable>
                    <xsl:variable name="DimDisplayName">
                         <xsl:choose>
                              <xsl:when test="/message:Structure/message:Concepts/structure:Concept[@id=$Dim]">
                                   <xsl:value-of select="/message:Structure/message:Concepts/structure:Concept[@id=$Dim]/structure:Name"/>
                              </xsl:when>
                              <xsl:otherwise>
                                   <xsl:value-of select="$Dim"/>
                              </xsl:otherwise>
                         </xsl:choose>
                    </xsl:variable>
                    <xsl:variable name="CodeDisplayName">
                         <xsl:choose>
                              <xsl:when test="/message:Structure/message:CodeLists/structure:CodeList[@id=$CodeList]/structure:Code[@value=$Code]/structure:Description">
                                   <xsl:value-of select="$Code"/> - <xsl:value-of select="/message:Structure/message:CodeLists/structure:CodeList[@id=$CodeList]/structure:Code[@value=$Code]/structure:Description"/>
                              </xsl:when>
                              <xsl:otherwise>
                                   <xsl:value-of select="$Code"/>
                              </xsl:otherwise>
                         </xsl:choose>
                    </xsl:variable>
                    <h2>Key Family Cross Sectional Measure: <xsl:value-of select="$DisplayName"/></h2>
                    <table cellpadding="3" cellspacing="1" border="1" width="100%">
                         <tbody>
                              <tr>
                                   <td class="field3" valign="top">Concept ID</td><td class="data1" valign="top"><a href="{$Concept}.html" class="data1"><xsl:value-of select="$Concept"/></a></td>
                              </tr>
                              <tr>
                                   <td class="field3" valign="top">Dimension</td><td class="data1" valign="top"><a href="{$Dim}.html" class="data1"><xsl:value-of select="$DimDisplayName"/></a></td>
                              </tr>
                              <tr>
                                   <td class="field3" valign="top">Value</td><td class="data1" valign="top"><xsl:value-of select="$CodeDisplayName"/></td>
                              </tr>
                              <xsl:for-each select="/message:Structure/message:KeyFamilies/structure:KeyFamily[@id = $KFID]/structure:Components/structure:Attribute[structure:AttachmentMeasure=$Concept]">
                                   <xsl:variable name="AttConcept" select="@concept"/>
                                   <xsl:variable name="AttDisplayName">
                                        <xsl:choose>
                                             <xsl:when test="/message:Structure/message:Concepts/structure:Concept[@id=$AttConcept]">
                                                  <xsl:value-of select="/message:Structure/message:Concepts/structure:Concept[@id=$AttConcept]/structure:Name"/>
                                             </xsl:when>
                                             <xsl:otherwise>
                                                  <xsl:value-of select="$AttConcept"/>
                                             </xsl:otherwise>
                                        </xsl:choose>
                                   </xsl:variable>
                                   <tr>
                                        <td class="field3" valign="top">Attached Attrbiute</td><td class="data1" valign="top"><a href="Att{$AttConcept}.html" class="data1"><xsl:value-of select="$AttDisplayName"/></a></td>
                                   </tr>
                              </xsl:for-each>
                         </tbody>
                    </table><br/>
                    <xsl:for-each select="structure:Annotations/common:Annotation">
                         <table cellpadding="3" cellspacing="1" border="1" width="100%">
                              <tbody>
                                   <tr>
                                        <th class="field1" colspan="2">Annotation</th>
                                   </tr>
                                   <xsl:if test="common:AnnotationTitle">
                                        <tr>
                                             <td class="field2" valign="top">Title</td><td class="data1" valign="top"><xsl:value-of select="common:AnnotationTitle"/></td>
                                        </tr>
                                   </xsl:if>
                                   <xsl:if test="common:AnnotationType">
                                        <tr>
                                             <td class="field2" valign="top">Type</td><td class="data1" valign="top"><xsl:value-of select="common:AnnotationType"/></td>
                                        </tr>
                                   </xsl:if>
                                   <xsl:if test="common:AnnotationURL">
                                        <tr>
                                             <td class="field2" valign="top">URL</td><td class="data1" valign="top"><a href="{common:AnnotationURL}" target="newwindow"><xsl:value-of select="common:AnnotationURL"/></a></td>
                                        </tr>
                                   </xsl:if>
                                   <xsl:if test="common:AnnotationText">
                                        <tr>
                                             <td class="field2" valign="top">Text</td><td class="data1" valign="top"><xsl:value-of select="common:AnnotationText"/></td>
                                        </tr>
                                   </xsl:if>                          
                              </tbody>
                         </table><br/>
                    </xsl:for-each>                         
               </body>
          </xsl:document>
     </xsl:for-each>
</xsl:template>

<xsl:template name="Agencies">
     <xsl:param name="KFID"/>
     <xsl:param name="KeyFamName"/>
     <xsl:for-each select="/message:Structure/message:Agencies/structure:Agency">
          <xsl:document href="{$KFID}/Ag{@id}.html" method="html" version="4.0" indent="yes">
               <head>
                    <title lang="{$KeyFamName/@xml:lang}"><xsl:value-of select="$KeyFamName"/></title>
                    <style type="text/css">
                         body {margin-top: 25; margin-right: 25; margin-left: 25; margin-bottom: 0; background-color: white}
                         table {border-color: #0000DD}
                         h2 {color: #0000DD; font-size: 12pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left}
                         .field1 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; width: 100%; background-color: #AAAAAA; border-color: #0000DD}
                         .field2 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; text-indent: 10px; width: 20%; background-color:     #CCCCCC; border-color: #0000DD}
                         .field3 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; width: 20%; background-color: #AAAAAA; border-color: #0000DD}
                         .data1 {color: black; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: normal; text-align: left; width: 80%; background-color: white; border-color: #0000DD}
                         .allowedvals {width: 100%}
                    </style>               
               </head>
               <body>
                    <h2>Key Family Agency: <xsl:value-of select="structure:Name"/></h2>
                    <table cellpadding="3" cellspacing="1" border="1" width="100%">
                         <tbody>
                              <tr>
                                   <td class="field3" valign="top">ID</td><td class="data1" valign="top"><xsl:value-of select="@id"/></td>
                              </tr>
                              <xsl:if test="@version">
                                    <tr>
                                        <td class="field3" valign="top">Version</td>
                                        <td class="data1" valign="top">
                                             <xsl:value-of select="@version"/>
                                        </td>
                                   </tr>
                              </xsl:if>
                              <xsl:if test="@uri">
                                   <tr>
                                        <td class="field3" valign="top">URI</td><td class="data1" valign="top"><xsl:value-of select="@uri"/></td>
                                   </tr>
                              </xsl:if>
                         </tbody>
                    </table><br/>
                    <xsl:for-each select="*[contains(local-name(), 'Contact')]">
                         <table cellpadding="3" cellspacing="1" border="1" width="100%">
                              <tbody>
                                   <tr>
                                        <th class="field1" colspan="2"><xsl:value-of select="substring-before(local-name(),'Contact')"/> Contact</th>
                                   </tr>
                                   <xsl:if test="structure:id">
                                        <tr>
                                             <td class="field2" valign="top">ID</td><td class="data1" valign="top"><xsl:value-of select="structure:id"/></td>
                                        </tr>
                                   </xsl:if>
                                   <xsl:if test="structure:Name">
                                        <tr>
                                             <td class="field2" valign="top">ID</td><td class="data1" valign="top"><xsl:value-of select="structure:Name"/></td>
                                        </tr>
                                   </xsl:if>                                   
                                   <xsl:if test="structure:Department">
                                        <tr>
                                             <td class="field2" valign="top">Department</td><td class="data1" valign="top"><xsl:value-of select="structure:Department"/></td>
                                        </tr>
                                   </xsl:if>
                                   <xsl:if test="structure:Role">
                                        <tr>
                                             <td class="field2" valign="top">Role</td><td class="data1" valign="top"><xsl:value-of select="structure:Role"/></td>
                                        </tr>
                                   </xsl:if>
                                   <xsl:for-each select="structure:Telephone">
                                        <tr>
                                             <td class="field2" valign="top">Telephone</td><td class="data1" valign="top"><xsl:value-of select="."/></td>
                                        </tr>
                                   </xsl:for-each>
                                   <xsl:for-each select="structure:Fax">
                                        <tr>
                                             <td class="field2" valign="top">Fax</td><td class="data1" valign="top"><xsl:value-of select="."/></td>
                                        </tr>
                                   </xsl:for-each>
                                   <xsl:for-each select="structure:X400">
                                        <tr>
                                             <td class="field2" valign="top">X400</td><td class="data1" valign="top"><xsl:value-of select="."/></td>
                                        </tr>
                                   </xsl:for-each>
                                   <xsl:for-each select="structure:URI">
                                        <tr>
                                             <td class="field2" valign="top">URI</td><td class="data1" valign="top"><xsl:value-of select="."/></td>
                                        </tr>
                                   </xsl:for-each>
                                   <xsl:for-each select="structure:Email">
                                        <tr>
                                             <td class="field2" valign="top">Email</td><td class="data1" valign="top"><xsl:value-of select="."/></td>
                                        </tr>
                                   </xsl:for-each>
                              </tbody>
                         </table><br/>
                    </xsl:for-each>
               </body>
          </xsl:document>
     </xsl:for-each>
     <xsl:for-each select="/message:Structure/message:Header/message:Sender">
          <xsl:document href="{$KFID}/Ag{@id}.html" method="html" version="4.0" indent="yes">
               <head>
                    <title lang="{$KeyFamName/@xml:lang}"><xsl:value-of select="$KeyFamName"/></title>
                    <style type="text/css">
                         body {margin-top: 25; margin-right: 25; margin-left: 25; margin-bottom: 0; background-color: white}
                         table {border-color: #0000DD}
                         h2 {color: #0000DD; font-size: 12pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left}
                         .field1 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; width: 100%; background-color: #AAAAAA; border-color: #0000DD}
                         .field2 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; text-indent: 10px; width: 20%; background-color:     #CCCCCC; border-color: #0000DD}
                         .field3 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; width: 20%; background-color: #AAAAAA; border-color: #0000DD}
                         .data1 {color: black; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: normal; text-align: left; width: 80%; background-color: white; border-color: #0000DD}
                         .allowedvals {width: 100%}
                    </style>               
               </head>
               <body>
                    <xsl:variable name="DisplayName">
                         <xsl:choose>
                              <xsl:when test="message:Name"><xsl:value-of select="message:Name"/></xsl:when>
                              <xsl:otherwise><xsl:value-of select="@id"/></xsl:otherwise>
                         </xsl:choose>
                    </xsl:variable>
                    <h2>Key Family Agency: <xsl:value-of select="$DisplayName"/></h2>
                    <table cellpadding="3" cellspacing="1" border="1" width="100%">
                         <tbody>
                              <tr>
                                   <td class="field3" valign="top">ID</td><td class="data1" valign="top"><xsl:value-of select="@id"/></td>
                              </tr>
                              <xsl:if test="message:Name">
                                   <tr>
                                        <td class="field3" valign="top">Name</td><td class="data1" valign="top"><xsl:value-of select="message:Name"/></td>
                                   </tr>
                              </xsl:if>
                         </tbody>
                    </table><br/>
                    <xsl:for-each select="message:Contact">
                         <table cellpadding="3" cellspacing="1" border="1" width="100%">
                              <tbody>
                                   <tr>
                                        <th class="field1" colspan="2">Contact</th>
                                   </tr>
                                   <xsl:if test="message:Name">
                                        <tr>
                                             <td class="field2" valign="top">ID</td><td class="data1" valign="top"><xsl:value-of select="message:Name"/></td>
                                        </tr>
                                   </xsl:if>                                   
                                   <xsl:if test="message:Department">
                                        <tr>
                                             <td class="field2" valign="top">Department</td><td class="data1" valign="top"><xsl:value-of select="message:Department"/></td>
                                        </tr>
                                   </xsl:if>
                                   <xsl:if test="message:Role">
                                        <tr>
                                             <td class="field2" valign="top">Role</td><td class="data1" valign="top"><xsl:value-of select="message:Role"/></td>
                                        </tr>
                                   </xsl:if>
                                   <xsl:for-each select="message:Telephone">
                                        <tr>
                                             <td class="field2" valign="top">Telephone</td><td class="data1" valign="top"><xsl:value-of select="."/></td>
                                        </tr>
                                   </xsl:for-each>
                                   <xsl:for-each select="message:Fax">
                                        <tr>
                                             <td class="field2" valign="top">Fax</td><td class="data1" valign="top"><xsl:value-of select="."/></td>
                                        </tr>
                                   </xsl:for-each>
                                   <xsl:for-each select="message:X400">
                                        <tr>
                                             <td class="field2" valign="top">X400</td><td class="data1" valign="top"><xsl:value-of select="."/></td>
                                        </tr>
                                   </xsl:for-each>
                                   <xsl:for-each select="message:URI">
                                        <tr>
                                             <td class="field2" valign="top">URI</td><td class="data1" valign="top"><xsl:value-of select="."/></td>
                                        </tr>
                                   </xsl:for-each>
                                   <xsl:for-each select="message:Email">
                                        <tr>
                                             <td class="field2" valign="top">Email</td><td class="data1" valign="top"><xsl:value-of select="."/></td>
                                        </tr>
                                   </xsl:for-each>
                              </tbody>
                         </table><br/>
                    </xsl:for-each>
               </body>
          </xsl:document>
     </xsl:for-each>
     <xsl:for-each select="/message:Structure/message:Header/message:Receiver">
          <xsl:document href="{$KFID}/Ag{@id}.html" method="html" version="4.0" indent="yes">
               <head>
                    <title lang="{$KeyFamName/@xml:lang}"><xsl:value-of select="$KeyFamName"/></title>
                    <style type="text/css">
                         body {margin-top: 25; margin-right: 25; margin-left: 25; margin-bottom: 0; background-color: white}
                         table {border-color: #0000DD}
                         h2 {color: #0000DD; font-size: 12pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left}
                         .field1 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; width: 100%; background-color: #AAAAAA; border-color: #0000DD}
                         .field2 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; text-indent: 10px; width: 20%; background-color:     #CCCCCC; border-color: #0000DD}
                         .field3 {color: #0000DD; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: bold; text-align: left; width: 20%; background-color: #AAAAAA; border-color: #0000DD}
                         .data1 {color: black; font-size: 10pt; font-family: Arial; font-style: normal; font-weight: normal; text-align: left; width: 80%; background-color: white; border-color: #0000DD}
                         .allowedvals {width: 100%}
                    </style>               
               </head>
               <body>
                    <xsl:variable name="DisplayName">
                         <xsl:choose>
                              <xsl:when test="message:Name"><xsl:value-of select="message:Name"/></xsl:when>
                              <xsl:otherwise><xsl:value-of select="@id"/></xsl:otherwise>
                         </xsl:choose>
                    </xsl:variable>
                    <h2>Key Family Agency: <xsl:value-of select="$DisplayName"/></h2>
                    <table cellpadding="3" cellspacing="1" border="1" width="100%">
                         <tbody>
                              <tr>
                                   <td class="field3" valign="top">ID</td><td class="data1" valign="top"><xsl:value-of select="@id"/></td>
                              </tr>
                              <xsl:if test="message:Name">
                                   <tr>
                                        <td class="field3" valign="top">Name</td><td class="data1" valign="top"><xsl:value-of select="message:Name"/></td>
                                   </tr>
                              </xsl:if>
                         </tbody>
                    </table><br/>
                    <xsl:for-each select="message:Contact">
                         <table cellpadding="3" cellspacing="1" border="1" width="100%">
                              <tbody>
                                   <tr>
                                        <th class="field1" colspan="2">Contact</th>
                                   </tr>
                                   <xsl:if test="message:Name">
                                        <tr>
                                             <td class="field2" valign="top">ID</td><td class="data1" valign="top"><xsl:value-of select="message:Name"/></td>
                                        </tr>
                                   </xsl:if>                                   
                                   <xsl:if test="message:Department">
                                        <tr>
                                             <td class="field2" valign="top">Department</td><td class="data1" valign="top"><xsl:value-of select="message:Department"/></td>
                                        </tr>
                                   </xsl:if>
                                   <xsl:if test="message:Role">
                                        <tr>
                                             <td class="field2" valign="top">Role</td><td class="data1" valign="top"><xsl:value-of select="message:Role"/></td>
                                        </tr>
                                   </xsl:if>
                                   <xsl:for-each select="message:Telephone">
                                        <tr>
                                             <td class="field2" valign="top">Telephone</td><td class="data1" valign="top"><xsl:value-of select="."/></td>
                                        </tr>
                                   </xsl:for-each>
                                   <xsl:for-each select="message:Fax">
                                        <tr>
                                             <td class="field2" valign="top">Fax</td><td class="data1" valign="top"><xsl:value-of select="."/></td>
                                        </tr>
                                   </xsl:for-each>
                                   <xsl:for-each select="message:X400">
                                        <tr>
                                             <td class="field2" valign="top">X400</td><td class="data1" valign="top"><xsl:value-of select="."/></td>
                                        </tr>
                                   </xsl:for-each>
                                   <xsl:for-each select="message:URI">
                                        <tr>
                                             <td class="field2" valign="top">URI</td><td class="data1" valign="top"><xsl:value-of select="."/></td>
                                        </tr>
                                   </xsl:for-each>
                                   <xsl:for-each select="message:Email">
                                        <tr>
                                             <td class="field2" valign="top">Email</td><td class="data1" valign="top"><xsl:value-of select="."/></td>
                                        </tr>
                                   </xsl:for-each>
                              </tbody>
                         </table><br/>
                    </xsl:for-each>
               </body>
          </xsl:document>
     </xsl:for-each>
</xsl:template>

</xsl:stylesheet>
