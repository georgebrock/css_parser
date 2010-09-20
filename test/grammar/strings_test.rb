require File.join(File.dirname(__FILE__), *%w[ .. test_helper ])

class StringsTest < Test::Unit::TestCase
  context 'According to section 4.3.7 of the CSS spec, parsing CSS containing strings' do
    should 'accept strings enclosed in double quotes' do
      stylesheet = parse %q[ p:after { content: "A string" } ]
      assert_equal 'A string', stylesheet.rule_sets.first.declarations['content']
    end

    should 'accept strings enclosed in single quotes' do
      stylesheet = parse %q[ p:after { content: 'A string' } ]
      assert_equal "A string", stylesheet.rule_sets.first.declarations['content']
    end

    should 'accept strings containing escaped quotes' do
      stylesheet = parse %q[ p:after { content: "A \\" string" } ]
      assert_equal 'A \\" string', stylesheet.rule_sets.first.declarations['content']

      stylesheet = parse %q[ p:after { content: "A \\22 string" } ]
      assert_equal 'A \\22 string', stylesheet.rule_sets.first.declarations['content']

      stylesheet = parse %q[ p:after { content: 'A \\' string' } ]
      assert_equal "A \\' string", stylesheet.rule_sets.first.declarations['content']

      stylesheet = parse %q[ p:after { content: 'A \\27 string' } ]
      assert_equal "A \\27 string", stylesheet.rule_sets.first.declarations['content']
    end

    should 'accept strings that are split over multiple lines' do
      [
        %Q[ p:after { content: "A\\\n string" } ],
        %Q[ p:after { content: "A\\\r\n string" } ],
        %Q[ p:after { content: "A\\\r string" } ]
      ].each do |css|
        stylesheet = parse css
        assert_equal "A string", stylesheet.rule_sets.first.declarations['content']
      end
    end
  end
end
