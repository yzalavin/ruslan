require 'open-uri'
require 'yaml'
require 'nokogiri'

module Parser
  class Base
    attr_reader :resource

    def initialize(resource)
      @resource = resource
    end

    def document
      Nokogiri::HTML(response)
    end

    private

    def config
      YAML.load_file('config.yml').deep_symbolize_keys[resource]
    end

    def response
      open(config[:endpoint])
    end
  end
end
