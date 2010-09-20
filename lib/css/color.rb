class CSS::Color < CSS::Term
  def value
    rgb = [red.text_value.strip, green.text_value.strip, blue.text_value.strip]
    string = text_value.strip

    if string =~ /^#/
      rgb.map!{|c| c*2 } if string.length == 4
      rgb.map!{|c| c.hex }
    else
      rgb.map! do |c|
        if c =~ /^([0-9]+)%$/
          (255 * $1.to_i / 100.0).round
        else
          c.to_i
        end
      end
    end

    Hash[ [:red, :green, :blue].zip(rgb) ]
  end
end
