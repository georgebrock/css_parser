class Treetop::Runtime::SyntaxNode
  def elements_of_type(klass)
    elements.inject([]) do |acc,node|
      acc += [node] if node.is_a? klass
      acc += node.elements_of_type(klass) unless node.terminal?
      acc
    end
  end
end
