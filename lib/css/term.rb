class CSS::Term < Treetop::Runtime::SyntaxNode
  def value
    text_value.strip
  end
end
