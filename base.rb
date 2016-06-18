Dir['initializer/*'].each { |file| require_relative file }
require_relative 'parser/base'
require_relative 'parser/olx'
