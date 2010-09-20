class CSS::StringExpression < CSS::Term
  def value
    value = string_contents.text_value
    value.gsub(/\\(?:\r\n|\n|\r)/, '')
  end
end
