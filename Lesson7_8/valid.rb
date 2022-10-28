module Validation

  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end
  
  module ClassMethods
    def validate(name, type, *param)
      @validate ||= []
      @validate << {name: name, type: type, param: param}
    end
  end

  module InstanceMethods

    def valid?
      validate!
      true
    rescue RuntimeError
      false
    end
    
    def validate!
      self.class.instance_variable_get(:@validate).each do |valid_hash|

        name = valid_hash[:name]
        value = self.name
        type = valid_hash[:type]
        param = valid_hash[:param][0]
        send(type.to_sym, name, value, param)
      end
    end
    
    def persence(name, value, _)
      raise 'Name cannot be empty' if name.nil?
    end

    def format(name, value, regexp)
      raise "Invalid format" if value.to_s !~ regexp
    end

    def type(name, value, param)
      raise "Type error!" unless value.is_a?(param) && name.class = param
    end
  end
end