require 'ruby-band/weka/filters/supervised/utils'

module Weka
  module Filters
  	module Supervised
  		module Instance
  			java_import "weka.filters.supervised.instance.Resample"

        class Resample
          include Weka::Filters::Supervised::Utils
        end
  		end
  	end
  end
end