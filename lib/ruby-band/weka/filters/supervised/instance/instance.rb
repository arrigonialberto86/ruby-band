require 'ruby-band/weka/filters/supervised/utils'

module Weka
  module Filters
  	module Supervised
      module Instance
        java_import "weka.filters.supervised.instance.Resample"
        java_import "weka.filters.supervised.instance.SpreadSubsample"

        class Resample
          include Weka::Filters::Supervised::Utils
        end

        class SpreadSubsample
          include Weka::Filters::Supervised::Utils
        end

        Weka::Filters::Supervised::Instance::Resample.__persistent__ = true
        Weka::Filters::Supervised::Instance::SpreadSubsample.__persistent__ = true

      end
    end
  end
end