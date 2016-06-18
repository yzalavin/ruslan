module Parser
  class OLX
    attr_reader :document

    def initialize
      @document = Parser::Base.new(:OLX).document
    end

    def links
      document.css(links_selector).map { |l|  l['href'] }
    end

    private

    def links_selector
      'table#offers_table td.offer h3 a.detailsLink'
    end
  end
end
