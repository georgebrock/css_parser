require 'treetop'
require File.join(File.dirname(__FILE__), *%w[ treetop runtime syntax_node ])

module CSS
  autoload :Stylesheet, 'css/stylesheet'
  autoload :RuleSet, 'css/rule_set'
  autoload :Selector, 'css/selector'
  autoload :Declaration, 'css/declaration'
  autoload :Expression, 'css/expression'

  def self.parser
    @parser ||= (
      Treetop.load File.join(File.dirname(__FILE__), *%w[ .. grammar css-2.1 ])
      CSSParser.new
    )
  end

  def self.parse(css)
    parser.parse(css)
  end
end
