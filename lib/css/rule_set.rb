class CSS::RuleSet < Treetop::Runtime::SyntaxNode
  def selectors
    @selectors ||= elements_of_type(CSS::Selector).map{|selector| selector.text_value.strip }
  end

  def declarations
    @declaration ||= elements_of_type(CSS::Declaration).inject({}) do |acc,declaration|
      acc.merge( declaration.property.text_value.strip => declaration.expr.value )
    end
  end

  def to_pretty_string
    selectors.join(",\n") + " {\n  " + declarations.join(";\n  ") + ";\n}"
  end

  def to_compact_string
    "#{selectors.join(', ')} { #{declarations.map{|key,value| "#{key}: #{value}" }.join('; ')} }"
  end
end
