class Luhn
  def self.is_valid?(number)
    self.new.is_valid?(number)
  end

  def is_valid?(number)
    sum = 0 # Set Sum to 0 at the start
    number_array = number_to_array_of_intergers(number)
    number_array = reverse_to_start_from_right(number_array)
    number_array = double_every_other(number_array)
    number_array = subtract_9_if_over_9(number_array)

    sum = number_array.inject(:+)
    luhn_sum_valid?(sum)
  end

  private

  def luhn_sum_valid?(sum)
     (sum % 10) == 0
  end

  def double_every_other(number_array)
    number_array.each_with_index.map { |digit, index| (index % 2 != 0) ? digit * 2 : digit }
  end

  def subtract_9_if_over_9(number_array)
    number_array.map { |num| (num > 9) ? num - 9 : num }
  end

  def reverse_to_start_from_right(number_array)
    number_array.reverse
  end

  def number_to_array_of_intergers(number)
    number.to_s.split("").map(&:to_i)
  end
end


