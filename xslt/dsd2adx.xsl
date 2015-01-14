<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:m="http://www.SDMX.org/resources/SDMXML/schemas/v2_0/message"
    xmlns:s="http://www.SDMX.org/resources/SDMXML/schemas/v2_0/structure"
    xmlns="http://ihe.net/adx"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    version="2.0">
    
    <xsl:output method="xml" indent="yes" />

    <xsl:template match="/m:Structure">
        <xs:schema targetNamespace="http://www.SDMX.org/resources/SDMXML/schemas/v1_0/message">
        <xs:element name="dataValueSet">
		<xs:annotation>
			<xs:documentation>datavalueSet is the root container element for datavalues</xs:documentation>
		</xs:annotation>
	</xs:element>    
        </xs:schema>

    </xsl:template>
</xsl:stylesheet>