require 'polyglot'
require 'treetop'

module CSS
  Treetop.load File.expand_path('../../grammar/css3', __FILE__)
end
