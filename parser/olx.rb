module Parser
  class OLX
    attr_reader :document

    def initialize
      @document = Parser::Base.new(:OLX).document
    end

    def links
      document.css(links_selector).map { |l|  l['href'] }
    end

    def insert_links
      links.each { |l| table.insert(link: l) }
    end

    private

    def links_selector
      'table#offers_table td.offer h3 a.detailsLink'
    end

    def table
      Database.new.table(:olx)
    end
  end
end
