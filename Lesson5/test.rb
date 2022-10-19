#Не работает так

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

class Test
  include InstanceCounter
  def initialize(name)
    @name = name
  end
end

# Test.instances выдает ошибку "Нет Метода"


# Так работает
module ClossMethod
  def instance_start
    @counter ||= 0
  end

  def instances
    @counter = self.instance_start + 1
  end
end

module InstonceMethods

  def register_instances
    self.class.instances
  end
end

class Tost
  extend ClossMethod
  include InstonceMethods
  def initialize(name)
    @name = name
  end
end

# Tost.instances выдает результат в виде числа"