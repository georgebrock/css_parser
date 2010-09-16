require File.join(File.dirname(__FILE__), *%w[ .. test_helper ])

class CSSTest < Test::Unit::TestCase

  context 'Parsing some CSS' do
    setup do
      @stylesheet = CSS.parse <<-CSS
        p, div {
          color: blue;
          font-size: 1em;
        }
      CSS
    end

    should 'find the rule set' do
      assert_equal 1, @stylesheet.rule_sets.size
    end

    should 'find the selectors in the rule set' do
      expected_selectors = ['div', 'p']
      assert_equal expected_selectors, @stylesheet.rule_sets.first.selectors.sort
    end

    should 'find the rule declarations in the rule set' do
      expected_declarations = {'color' => 'blue', 'font-size' => '1em'}
      assert_equal expected_declarations, @stylesheet.rule_sets.first.declarations
    end
  end

end
