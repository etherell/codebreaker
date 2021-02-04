module Codebreaker
  class Game
    attr_accessor :secret_number, :player_number

    def initialize
      @result = []
      @secret_number = generate_code
    end

    def give_hint(player)
      player.hints_used += 1
      secret_number_arr.sample
    end

    def result
      check_complete_match
      check_partial_match
      @result.join.to_s
    end

    def win?
      @result.length == 4 && @result.all?(/\+/)
    end

    def clear_result
      @result = []
    end

    private

    def check_complete_match
      secret_number_arr.zip(player_number_arr).map do |secret_num, input_num|
        break if @player_number.empty?
        next if secret_num != input_num

        @result << "+"
        @player_number.slice!(input_num.to_s)
      end
    end

    def check_partial_match
      secret_number_arr.each do |secret_num|
        break if @player_number.empty?
        next unless player_number_arr.include?(secret_num)

        @result << "-"
        @player_number.slice!(secret_num.to_s)
      end
    end

    def generate_code
      arr = []
      4.times { arr << rand(1..6) }
      arr.join
    end

    def player_number_arr
      player_number.split("").map(&:to_i)
    end

    def secret_number_arr
      secret_number.split("").map(&:to_i)
    end
  end
end
