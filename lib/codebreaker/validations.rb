module Codebreaker
  module PropertyValidatable
    def name_valid?(name)
      name.length.between?(3, 20)
    end

    def valid_number?(number)
      return false unless number.length == 4

      number.split("").all? { |num| num.to_i.between?(1, 6) }
    end
  end
end
