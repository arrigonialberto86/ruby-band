$:.unshift File.dirname(__FILE__)
require 'functions_utils'

module Weka
	module Classifier
    #This module stores the classifiers from the 'weka.classifiers.functions' package
		module Functions
      java_import 'weka.classifiers.functions.LinearRegression'
      java_import 'weka.classifiers.functions.PLSClassifier'
      java_import 'weka.classifiers.functions.RBFNetwork'
      java_import 'weka.classifiers.functions.GaussianProcesses'
      java_import 'weka.classifiers.functions.LeastMedSq'
      java_import 'weka.classifiers.functions.LibSVM'
      java_import 'weka.classifiers.functions.SMO'
      java_import 'weka.classifiers.functions.SMOreg'
      java_import 'weka.classifiers.functions.SPegasos'
      java_import 'weka.classifiers.functions.VotedPerceptron'
      java_import 'weka.classifiers.functions.Winnow'


      class LeastMedSq
        include Functions_utils
        class Base < LeastMedSq
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

      class LibSVM
        include Functions_utils
        class Base < LibSVM
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

      class LinearRegression
        include Functions_utils
        class Base < LinearRegression
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

      class PLSClassifier
        include Functions_utils
        class Base < PLSClassifier
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

      class RBFNetwork
        include Functions_utils
        class Base < RBFNetwork
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

      class SMO
        include Functions_utils
        class Base < SMO
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

      class SMOreg
        include Functions_utils
        class Base < SMOreg
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

      class SPegasos
        include Functions_utils
        class Base < SPegasos
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

      class GaussianProcesses
        include Functions_utils
        class Base < GaussianProcesses
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

      class VotedPerceptron
        include Functions_utils
        class Base < VotedPerceptron
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

      class Winnow
        include Functions_utils
        class Base < Winnow
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

    end
  end
end