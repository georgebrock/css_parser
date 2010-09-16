class CSS::Stylesheet < Treetop::Runtime::SyntaxNode
  def rule_sets
    elements_of_type(CSS::RuleSet)
  end
end
