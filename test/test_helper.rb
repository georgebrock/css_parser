$: << File.join(File.dirname(__FILE__), *%w[ .. lib ])

require 'css'
require 'shoulda'
require 'redgreen' if ENV['TM_PID'].nil?

class Test::Unit::TestCase
  def parse(css)
    stylesheet = CSS.parse(css)
    assert_not_nil stylesheet, "Failed to parse CSS: #{css}\n\nParser errors:\n  #{CSS.parser.terminal_failures.join("\n  ")}\n"
    stylesheet
  end
end
