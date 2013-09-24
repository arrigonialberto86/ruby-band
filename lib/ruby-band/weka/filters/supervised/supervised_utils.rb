module Supervised_Util
  java_import "weka.core.Utils"

  #Instance methods list
  def options_list
    listOptions.map {|key| "#{key.synopsis} #{key.description}"}.join("\n")
  end

  def filter_options(options_string)
    options = Utils.splitOptions(options_string)
    setOptions(options)
  end

  def data(instances)
    setInputFormat(instances)
    @input = instances
  end

  def description
    globalInfo
  end

  # *args is an optional Instances data object
  def use(*args)
    if args[0]
      Filter.useFilter(args[0],self)
    else
      Filter.useFilter(@input,self)
    end
  end

  def set(&block)
    self.instance_eval(&block)
  end

end


