require 'polyglot'
require 'treetop'

module CSS
  autoload :Stylesheet, 'css/stylesheet'
  autoload :AtRule, 'css/at_rule'
  autoload :RuleSet, 'css/rule_set'
  autoload :Selector, 'css/selector'
  autoload :Declaration, 'css/declaration'

  Treetop.load File.expand_path('../../grammar/css3', __FILE__)

end
