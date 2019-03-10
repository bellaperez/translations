#!/bin/sh

LANG="$2"

message_output() {
    echo "$0 [ make-pot | update-po | make-xml | make-bz2 ] [ ca | es ]"
    echo
    echo "  # Look before ─ when updating do it while translating (into cpu_x_[ ca | es ].po file):"
    echo "      \\\n -> "'\\'"\\\n"
    echo "       ' -> "'\\'"\\'"
    echo
    echo "  # Look after (into strings_[ ca | es ].xml file):"
    echo "      <![CDATA[ ... ]]>"
    echo
    exit 0
  }

language_id() {
    case $1 in
      ca|es)
        echo
      ;;
      *)
        message_output
      ;;
    esac
  }

case $1 in
  make-pot)
    language_id $2
    # Create POT template file
    itstool --out=cpu_x.pot --strict translatestrings.xml 
  ;;
  update-po)
    language_id $2
    # Update PO file
    msgmerge --update cpu_x_$LANG.po cpu_x.pot
  ;;
  make-xml)
    language_id $2
    # Create XML translation
    msgfmt  -o cpu_x_$LANG.mo cpu_x_$LANG.po
    itstool -m cpu_x_$LANG.mo -o strings_$LANG.xml translatestrings.xml
  ;;
  make-bz2)
    tar -cvjf Catalan-Spanish.tbz2 strings_*
  ;;
  *)
    message_output
  ;;
esac

exit 0

