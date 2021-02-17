module Codebreaker
  class Game
    attr_reader :secret_number

    def initialize
      @secret_number = generate_secret_number
      @player_number = ''
      @result = ''
    end

    def player_number=(player_number)
      clear_result
      @player_number = player_number
    end

    def win?
      @result.match?(/^\+{4}$/)
    end

    def result
      set_result if @result.empty?
      @result
    end

    private

    def generate_secret_number
      Array.new(4) { rand(1..6) }.join
    end

    def clear_result
      @result = ''
    end

    def set_result
      copy_secret_number
      numbers_complete_comparison
      numbers_partial_comparison
    end

    def copy_secret_number
      @secret_number_copy = @secret_number.dup
    end

    def numbers_complete_comparison
      @secret_number_copy.chars.zip(@player_number.chars).each do |secret_digit, input_digit|
        next unless secret_digit == input_digit

        delete_digit_from_numbers(secret_digit)
        @result << Consts::COMPLETE_MATCH
      end
    end

    def delete_digit_from_numbers(digit)
      @player_number.sub!(digit, '')
      @secret_number_copy.sub!(digit, '')
    end

    def numbers_partial_comparison
      @secret_number_copy.chars.each do |secret_num|
        next if @player_number.empty?
        next unless @player_number.chars.include?(secret_num)

        @player_number.sub!(secret_num, '')
        @result << Consts::PARTIAL_MATCH
      end
    end
  end
end
