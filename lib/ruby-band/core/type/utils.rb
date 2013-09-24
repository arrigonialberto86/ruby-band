require 'java'

module Core
 	module Utils

		# Convert a bidimensional RubyArray to a java double [][]
		def Utils.bidimensional_to_double(ruby_array)
			ruby_array.to_java Java::double[]
		end

    def Utils.bidimensional_to_long(ruby_array)
      ruby_array.to_java Java::long[]
    end

		def Utils.double_to_a(java_array)
			ruby_array = []
			java_array.each {|val| ruby_array << val}
			ruby_array
		end

  end
end

class Array
  def is_2d?
    self.each do |item|
      return true if item.is_a? Array 
    end
    return false
  end
end