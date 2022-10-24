require_relative 'manufacture.rb'

class Waggon
  include Manufacture
  attr_accessor :name, :size
  attr_reader :taken, :taken, :full_size

  def initialize(name, size)
    @name = name
    @size = size.to_i
    @taken = 0
    @full_size = size.to_i
  end

  def take_place
    unless self.size.zero?
      @taken += 1
      @size -= 1
    else 
      puts "Не достаточно свободных мест!"
    end
  end

end