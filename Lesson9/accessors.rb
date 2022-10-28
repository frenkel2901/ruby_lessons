module Accessors
  @@storage = {}

  def attr_accessor_with_history(*names)
    names.each do |name|
      define_method(name) do
        instance_variable_get("@#{name}")
      end
      define_method("#{name}=") do |value|
        instance_variable_set("@#{name}", value)
        @values ||= []
        @values << value
        @@storage["@#{name}".to_sym] = @values
      end
      define_method("#{name}_history") do
        instance_variable_get("@#{name}")
        print @@storage["@#{name}".to_sym]
      end
    end
  end

  def strong_attr_accessor(name, name_class)
    define_method(name) do
      instance_variable_get("@#{name}")
    end
    define_method("#{name}=") do |value|
      raise TypeError.new("Type error!") unless value.is_a?(name_class.class)
      instance_variable_set("@#{name}", value)
      rescue TypeError => e
      puts "#Error: #{e}"
    end
  end
end
