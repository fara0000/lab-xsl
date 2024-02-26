<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" indent="yes"/>

  <!-- Идентификатор корня документа -->
  <xsl:template match="/">
    <html>
      <head>
        <style>
          .math {
          font-size: 16px; /* Размер шрифта */
          font-family: Arial, sans-serif; /* Шрифт */
          }
        </style>
      </head>
      <body>
        <div class="math">
          <!-- Применяем шаблон для корневого элемента -->
          <xsl:apply-templates select="строка/корень"/>
        </div>
      </body>
    </html>
  </xsl:template>

  <!-- Шаблон для корневого элемента -->
  <xsl:template match="корень">
    <math>
      <!-- Применяем шаблон для всех дочерних элементов -->
      <xsl:apply-templates/>
    </math>
  </xsl:template>

  <!-- Шаблон для оператора -->
  <xsl:template match="оператор">
    <mo>
      <xsl:value-of select="."/>
    </mo>
  </xsl:template>

  <!-- Шаблон для операнда -->
  <xsl:template match="операнд">
    <mi>
      <xsl:value-of select="."/>
    </mi>
  </xsl:template>

  <!-- Шаблон для числа -->
  <xsl:template match="число">
    <mn>
      <xsl:value-of select="."/>
    </mn>
  </xsl:template>

  <!-- Шаблон для верхнего индекса -->
  <xsl:template match="верх">
    <msup>
      <xsl:apply-templates select="*"/>
    </msup>
  </xsl:template>

  <!-- Шаблон для нижнего индекса -->
  <xsl:template match="низ">
    <msub>
      <xsl:apply-templates select="*"/>
    </msub>
  </xsl:template>

  <!-- Шаблон для дроби -->
  <xsl:template match="дробь">
    <mfrac>
      <xsl:apply-templates select="*"/>
    </mfrac>
  </xsl:template>

  <!-- Шаблон для выражения "низверх" -->
  <xsl:template match="низверх">
    <msubsup>
      <xsl:apply-templates select="*"/>
    </msubsup>
  </xsl:template>
</xsl:stylesheet>
