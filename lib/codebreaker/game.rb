module Codebreaker
  class Game
    attr_reader :result

    def initialize
      @secret_code = ""
      @input_number = ""
      @result = []
      @players = []
    end

    def start
      @secret_code = generate_code
    end

    def input_valid?(input)
      return false unless valid_number?(input)
      @player_input = input
      true
    end

    def check_input_number
      check_complete_match
      check_partial_match
    end

    def give_hint
      secret_code_arr.sample
    end

    def win?
      @result.map { |value| value == '+' }.length == 4
    end

    private

    include Codebreaker::PropertyValidatable

    def check_complete_match
      secret_code_arr.zip(input_arr).map do |secret_num, input_num|
        break if @input.empty?
        next if secret_num != input_num

        @result << '+'
        @input.slice!(input_num.to_s)
      end
    end

    def check_partial_match
      secret_code_arr.each do |secret_num|
        break if @input.empty?
        next unless input_arr.include?(secret_num)

        @result << '-'
        @input.slice!(secret_num.to_s)
      end
    end

    def generate_code
      arr = []
      4.times { arr << rand(1..6) }
      arr.join
    end

    def input_arr
      @input.split("").map(&:to_i)
    end

    def secret_code_arr
      @secret_code.split("").map(&:to_i)
    end
  end
end
