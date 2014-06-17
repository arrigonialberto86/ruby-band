require 'ruby-band/weka/filters/supervised/class_builder'

module Weka
  module Filters
  	module Supervised
      module Instance
        include ClassBuilder

        build_classes :Resample,
                      :SpreadSubsample,
                      :StratifiedRemoveFolds

      end
    end
  end
end