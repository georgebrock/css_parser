$: << File.join(File.dirname(__FILE__), *%w[ .. lib ])

require 'css'
require 'shoulda'
require 'redgreen' if ENV['TM_PID'].nil?
