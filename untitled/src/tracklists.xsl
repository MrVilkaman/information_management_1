<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
				xsi:schemaLocation="urn:schemas-microsoft-com:xslt">


	<xsl:template match="/tracklists">
		<HTML>
			<BODY>
				<H1>Каталог</H1>
				<TABLE BORDER="2">
					<TR>
						<TD width="100">Треклист</TD>
						<TD width="100">Список треков</TD>
						<TD width="100">Обложка</TD>
					</TR>

					<xsl:apply-templates select="tracklist"/>
				</TABLE>
			</BODY>
		</HTML>
	</xsl:template>

	<xsl:template match="tracklist">
		<TR>
			<TD width="100">
				<xsl:value-of select="title"/>
			</TD>
			<TD width="300">
				<xsl:apply-templates select="track"/>
				<!--<xsl:value-of select="track"/>-->
			</TD>
			<TD width="100">
				<xsl:variable name="src" select="@src"/>
				<img src="{$src}" width="72"/>
			</TD>
		</TR>
	</xsl:template>

	<xsl:template match="track">
		<xsl:number format="0" level="single"/>)
		<xsl:value-of select="song"/> (<xsl:value-of select="min"/>:<xsl:value-of select="sec"/>)
		<br/>
	</xsl:template>

</xsl:stylesheet>