class CSS::StringExpression < CSS::Term
  def value
    value = string_contents.text_value

    value.gsub!(/\\(?:\r\n|\n|\r)/, '')

    value.gsub!(/\\([0-9a-fA-F]{1,6})/){|char_code|
      replacement = '.'
      replacement[0] = $1.hex
      replacement
    }

    value.gsub!(/\\([\\'"{}])/, '\1')

    value
  end
end
