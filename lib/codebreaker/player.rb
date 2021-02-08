# frozen_string_literal: true

module Codebreaker
  class Player
    attr_reader :difficulty
    attr_accessor :name, :attempts_total, :attempts_used, :hints_total, :hints_used

    DIFFICULTIES_DATA = {
      'easy' => [15, 2],
      'medium' => [10, 1],
      'hell' => [5, 1]
    }.freeze

    def initialize
      @hints_used = 0
      @attempts_used = 0
    end

    def difficulty=(difficulty)
      @difficulty = difficulty
      set_total_attempts_and_hints
    end

    def attempts_left
      attempts_total - attempts_used
    end

    private

    def set_total_attempts_and_hints
      @attempts_total, @hints_total = DIFFICULTIES_DATA[difficulty]
    end
  end
end
