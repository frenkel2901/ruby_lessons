require_relative 'manufacture'

class Waggon
  include Manufacture
  attr_accessor :name, :size
  attr_reader :taken, :full_size

  def initialize(name, size)
    @name = name
    @size = size.to_i
    @taken = 0
    @full_size = size.to_i
  end

  def take_place
    if self.size.zero?
      puts 'Not enough space!'
    else
      @taken += 1
      @size -= 1
    end
  end
end
