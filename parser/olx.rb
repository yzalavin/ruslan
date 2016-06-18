module Parser
  class OLX
    attr_reader :document

    def initialize
      @document = Base.new('OLX').document
    end

    def links
    end
  end
end
