require 'treetop'
require File.join(File.dirname(__FILE__), *%w[ treetop runtime syntax_node ])

module CSS
  autoload :Stylesheet, 'css/stylesheet'
  autoload :RuleSet, 'css/rule_set'
  autoload :Selector, 'css/selector'
  autoload :Declaration, 'css/declaration'

  def self.parse(css)
    Treetop.load File.join(File.dirname(__FILE__), *%w[ .. grammar css-2.1 ]) unless defined? CSSParser
    CSSParser.new.parse(css)
  end
end
