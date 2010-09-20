class CSS::Expression < Treetop::Runtime::SyntaxNode
  def value
    terms = elements_of_type(CSS::Term)
    if terms.size == 1 and terms.first.respond_to? :value
      terms.first.value
    else
      text_value.strip
    end
  end
end
