module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end
  
  module ClassMethods
    def start_instance
      @counter ||= 0
    end

    def instances
      @counter = self.start_instance + 1
    end
  end
  
  module InstanceMethods
    
  private
    def register_instance
      self.class.new_instance
    end
  end
end
