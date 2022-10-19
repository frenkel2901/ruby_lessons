module InstanceCounter
  def self.include(base)
    base.extend ClassMethod
    base.send :include, InstanceMethods
  end

  module ClassMethod
    def instance_start
      @counter ||= 0
    end

    def instances
      @counter = self.instance_start + 1
    end
  end

  module InstanceMethods

    def register_instances
      self.class.instances
    end
  end
end