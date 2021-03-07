module Codebreaker
  class GameStatistic
    attr_reader :difficulty
    attr_accessor :attempts_total, :attempts_used, :hints_total, :player_name, :hints

    def initialize(difficulty)
      @hints_used = 0
      @attempts_used = 0
      @difficulty = difficulty
      @attempts_total = Constants::DIFFICULTIES[difficulty][:attempts]
      @hints_total = Constants::DIFFICULTIES[difficulty][:hints]
    end

    def secret_number=(secret_number)
      @secret_number = secret_number
      prepare_hints
    end

    def give_hint
      @hints.pop
    end

    def hints_used
      @hints_used = @hints_total - hints_left
    end

    def hints_left
      @hints.length
    end

    def hints?
      @hints.any?
    end

    def attempts_left
      attempts_total - attempts_used
    end

    def to_hash
      {
        hints_used: @hints_used,
        attempts_used: @attempts_used,
        difficulty: @difficulty,
        attempts_total: @attempts_total,
        hints_total: @hints_total
      }
    end

    private

    def prepare_hints
      @hints = @secret_number.chars.shuffle.take(@hints_total)
    end
  end
end
