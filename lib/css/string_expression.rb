class CSS::StringExpression < CSS::Term
  def value
    value = string_contents.text_value
  end
end
