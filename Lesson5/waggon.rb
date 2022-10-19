require_relative 'manufacture.rb'

class Waggon
  include Manufacture
  def initialize(name)
    @name = name
  end
end