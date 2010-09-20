class CSS::Expression < Treetop::Runtime::SyntaxNode
  def value
    return text_value.strip
  end
end
