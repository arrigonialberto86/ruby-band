$:.unshift File.dirname(__FILE__)

require 'classifier_utils'
require 'active_support/concern'
require 'active_support/core_ext/string'
require 'active_support/core_ext/module'

module ClassBuilder
  module Classifiers
    extend ActiveSupport::Concern

    included do
      def self.build_classes(*class_names)

        class_names.each do |classifier|
          including_module = self.name.demodulize.downcase #e.g. lazy, trees, ...
          java_import "weka.classifiers.#{including_module}.#{classifier}"

          module_eval <<-CLASS_DEFINITION, __FILE__, __LINE__ + 1
            class #{classifier}
              include ClassifierUtils

              class Base < #{classifier}
                def initialize(&block)
                  super

                  if block_given?
                    init_instance_classifier(&block)
                  else
                    init_classifier
                  end
                end
              end
            end
          CLASS_DEFINITION
        end
      end

    end
  end
end