require 'active_support/concern'
require 'active_support/core_ext/string'
require 'active_support/core_ext/module'
require 'active_support/inflector'

module Weka
  module Filters
    module Unsupervised
      module ClassBuilder
        extend ActiveSupport::Concern

        included do
          def self.build_classes(*class_names)

            class_names.each do |filter|
              including_modules = self.to_s.split('::')[-2..-1]
              java_import "weka.filters.#{including_modules.join('.').downcase}.#{filter}"

              require "ruby-band/weka/filters/#{including_modules.first.downcase}/utils"

              module_eval <<-CLASS_DEFINITION, __FILE__, __LINE__ + 1
                class #{filter}
                  include Utils
                end

                Weka::Filters::#{including_modules.join('::')}::#{filter}.__persistent__ = true
              CLASS_DEFINITION

            end
          end

        end
      end
    end
  end
end