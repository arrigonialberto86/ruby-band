$:.unshift(File.expand_path(File.join(File.dirname(__FILE__),"../")))
require 'java'
require 'supervised_utils'

module Weka
  module Filter
  	module Supervised
  		module Instance
  			java_import "weka.filters.supervised.instance.Resample"

        class Resample
          include Supervised_Util
        end
  		end
  	end
  end
end