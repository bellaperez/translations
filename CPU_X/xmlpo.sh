#!/bin/sh

# Create POT template file
# itstool --out=cpu_x.pot translatestrings.xml 
# Bé

# Merge my old XML translations
# Manually

# Update PO file
# msgmerge --update cpu_x_ca.po cpu_x.pot
# Bé

# Mirar abans (en actualitzar fer-ho mentre es tradueix):
# \n -> \\n
# '  -> \\'
# Create my XML translation
msgfmt  -o cpu_x_ca.mo cpu_x_ca.po
itstool -m cpu_x_ca.mo -o strings_ca.xml translatestrings.xml

# Mirar d'esprés:
# <![CDATA[Ajuda i política]]>

exit 0

