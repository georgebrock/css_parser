require File.join(File.dirname(__FILE__), *%w[ .. test_helper ])

class ColorsTest < Test::Unit::TestCase
  RED = {:red => 255, :green => 0, :blue => 0}

  context 'According to section 4.3.6 of the CSS spec, parsing CSS containing colours' do
    should 'accept colours as a three digit hex code' do
      stylesheet = parse 'em { color: #f00 }'
      assert_equal RED, stylesheet.rule_sets.first.declarations['color']
    end

    should 'accept colours as a six digit hex code' do
      stylesheet = parse 'em { color: #ff0000 }'
      assert_equal RED, stylesheet.rule_sets.first.declarations['color']
    end

    should 'accept colours as a set of RGB values' do
      stylesheet = parse 'em { color: rgb(255,0,0) }'
      assert_equal RED, stylesheet.rule_sets.first.declarations['color']
    end

    should 'accept colours as a set of RGB percentages' do
      stylesheet = parse 'em { color: rgb(100%, 0%, 0%) }'
      assert_equal RED, stylesheet.rule_sets.first.declarations['color']
    end
  end
end
