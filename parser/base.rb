require 'open-uri'

module Parser
  class Base
    attr_reader :url

    def initialize(url)
      @url = url
    end

    def document
    end
  end
end
