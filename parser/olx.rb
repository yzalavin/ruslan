module Parser
  class OLX
    attr_reader :document
    attr_accessor :flats

    def initialize
      @document = Parser::Base.new(:OLX).document
      @flats = []
    end

    def new_flats
      compose_new_flats
      insert_new_flats
      flats
    end

    private

    def compose_new_flats
      requested_flats.each do |flat|
        current_flats.include?(flat) ? break : flats.push(flat)
      end
    end

    def insert_new_flats
      flats.each { |l| table.insert(link: l) }
    end

    def requested_flats
      document.css(links_selector).map { |l|  l['href'] }
    end

    def current_flats
      table.all.map { |flat| flat[:link] }
    end

    def links_selector
      'table#offers_table td.offer h3 a.detailsLink'
    end

    def table
      Database.new.table(:olx)
    end
  end
end
