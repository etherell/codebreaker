# frozen_string_literal: true

module Codebreaker
  class Game
    COMPLETE_MATCH = '+'
    PARTIAL_MATCH = '-'

    attr_reader :secret_number

    def initialize
      @secret_number = generate_secret_code
      @player_number = ''
    end

    def player_number=(player_number)
      clear_result
      @player_number = player_number
    end

    def win?
      @result.match?(/^\+{4}$/)
    end

    def result
      @result ||= numbers_complete_comparison.concat(numbers_partial_comparison).join.to_s
    end

    private

    def generate_secret_code
      Array.new(4) { rand(1..6) }.join
    end

    def clear_result
      @result = nil
    end

    def numbers_complete_comparison
      @secret_number.chars.zip(@player_number.chars).map do |secret_num, input_num|
        next if secret_num != input_num

        @player_number.slice!(input_num)
        COMPLETE_MATCH
      end
    end

    def numbers_partial_comparison
      @secret_number.chars.map do |secret_num|
        next if @player_number.empty?
        next unless @player_number.chars.include?(secret_num)

        @player_number.slice!(secret_num)
        PARTIAL_MATCH
      end
    end
  end
end
