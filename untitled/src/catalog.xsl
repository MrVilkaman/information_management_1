<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
				xsi:schemaLocation="urn:schemas-microsoft-com:xslt">


	<xsl:template match="/catalog">
		<HTML>
			<BODY>
				<H1>Каталог</H1>
				<TABLE BORDER="2">
					<TR>
						<TD width="200">Название</TD>
						<TD width="100">Страна</TD>
						<TD width="100">Количество дисков</TD>
						<TD width="300">Последний диск</TD>
					</TR>

					<xsl:apply-templates/>

				</TABLE>
			</BODY>
		</HTML>
	</xsl:template>

	<xsl:template match="performer">
		<TR>
			<TD width="100">
				<xsl:value-of select="name"/>
			</TD>
			<TD width="150">
				<xsl:apply-templates select="country"/>
				<xsl:value-of select="country"/>
			</TD>
			<TD width="100">
				<xsl:value-of select="count(disc)"/>
			</TD>
			<TD width="200">
				<xsl:apply-templates select="disc[last()]"/>
			</TD>
		</TR>
	</xsl:template>
	<xsl:template match="disc">
		<xsl:value-of select="album"/> (<xsl:value-of select="ReleaseYear"/>)<br/>
		Рейтинг: <xsl:value-of select="Rate"/>
		Цена: <xsl:value-of select="Price"/>
	</xsl:template>

	<xsl:template match="country">
		<xsl:variable name="name" select="current()"/>
		<xsl:choose>
			<xsl:when test="$name = 'USA'">
				<img src="Flags/usa.GIF" width="32"/>
			</xsl:when>
			<xsl:when test="$name = 'Canada'">
				<img src="Flags/can.gif" width="32"/>
			</xsl:when>
			<xsl:when test="$name = 'Sweden'">
				<img src="Flags/swe.GIF" width="32"/>
			</xsl:when>
			<xsl:when test="$name = 'Italy'">
				<img src="Flags/ita.gif" width="32"/>
			</xsl:when>
			<xsl:when test="$name = 'Netherlands'">
				<img src="Flags/ned.gif" width="32"/>
			</xsl:when>
			<xsl:when test="$name = 'Germany'">
				<img src="Flags/ger.gif" width="32"/>
			</xsl:when>
			<xsl:when test="$name = 'England'">
				<img src="Flags/eng.GIF" width="32"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="."/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>