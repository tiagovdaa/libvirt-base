<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="xml" indent="yes"/>

  <!-- Identity transform -->
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()" />
    </xsl:copy>
  </xsl:template>

  <!-- Insert <permissions> under <target> -->
  <xsl:template match="target">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()" />
      <permissions>
        <mode>${mode}</mode>
        <owner>${uid}</owner>
        <group>${gid}</group>
      </permissions>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>
