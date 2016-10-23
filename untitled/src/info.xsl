<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
				xsi:schemaLocation="urn:schemas-microsoft-com:xslt">


	<xsl:template match="/info">
		<HTML>
			<BODY>
				<TABLE BORDER="2">
					<TR>
					<TD width="450">
						<xsl:variable name="src" select="pic"/>
						<img src="{$src}" width="72" align="left" vspace="5" hspace="5"/>
							Стиль:
							<xsl:for-each select="style"><xsl:value-of select="."/>,&#160;</xsl:for-each><br/>
							Год: <xsl:value-of select="yearstart"/><br/>
							<xsl:for-each select="influence"><xsl:value-of select="."/>,&#160;</xsl:for-each><br/>
						</TD>

					</TR>
					Участник:
					<xsl:apply-templates select="member"/>
					<br/><br/>
				</TABLE>



				История:<br/>
				<xsl:value-of select="story"/>
			</BODY>
		</HTML>
	</xsl:template>

	<xsl:template match="member">
		<xsl:number format="0" level="single"/>)
		<xsl:value-of select="name"/>
		(<xsl:for-each select="instrument"><xsl:value-of select="."/>,&#160;</xsl:for-each>)
	</xsl:template>


</xsl:stylesheet>