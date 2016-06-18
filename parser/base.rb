require 'open-uri'
require 'yaml'

module Parser
  class Base
    attr_reader :resource

    def initialize(resource)
      @resource = resource
    end

    def document

    end

    private

    def config
      YAML.load_file('../config.yml')[resource]
    end

    def response
      open(config['endpoint'])
    end

    def yaml()

    end
  end
end
