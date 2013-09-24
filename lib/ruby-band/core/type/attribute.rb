require 'java'

module Core
  module Type
    
    java_import "weka.core.Attribute"
    java_import "weka.core.FastVector"

    class Attribute

    end

    # Return an Numeric Attribute class object
    # * *Args*    :
    #   - +name_of_attr+ -> a String, the name of the attribute 
    def self.create_numeric_attr(name_of_attr)
    	numeric = Attribute.new name_of_attr
    	return numeric
    end

    # Return an Date Attribute class object
    # * *Args*    :
    #   - +name_of_attr+ -> a String, the name of the attribute 
    #   - +format+ -> The format of the attribute 
    def self.create_date_attr(name_of_attr,format)
    	date = Attribute.new(name_of_attr,format)
    	return date
    end

    # Return a Nominal Attribute class object
    # * *Args*    :
    #   - +name_of_attr+ -> a String, the name of the attribute 
    #   - +values_list+ -> An array, the list of nominal values
    def self.create_nominal_attr(name_of_attr,values_list)
    	labels = FastVector.new
    	values_list.each {|value| labels.addElement(value)}
    	nominal = Attribute.new(name_of_attr,labels)  
    	return nominal
    end

    # Return a String Attribute class object
    # * *Args*    :
    #   - +name_of_attr+ -> a String, the name of the attribute 
    def self.create_string_attr(name_of_attr)
        construct = Attribute.java_class.constructor(Java::java.lang.String,Java::weka.core.FastVector)
        string = construct.new_instance(name_of_attr,nil).to_java
    	return string
    end
  end

end    


