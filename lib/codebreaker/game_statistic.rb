module Codebreaker
  class GameStatistic
    attr_reader :difficulty, :secret_number
    attr_accessor :attempts_total, :attempts_used, :hints_total, :player_name, :hints

    def initialize(difficulty)
      @hints_used = 0
      @attempts_used = 0
      @difficulty = difficulty
      set_total_attempts_and_hints
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

    def to_h
      instance_variables.each_with_object({}) do |param_name, hash|
        next if Consts::NOT_PUBLIC_PARAMS.include?(param_name)

        hash[param_name.to_s.delete('@')] = instance_variable_get(param_name)
      end
    end

    private

    def prepare_hints
      @hints = secret_number.chars.shuffle.take(@hints_total)
    end

    def set_total_attempts_and_hints
      @attempts_total = Codebreaker::Consts::DIFFICULTIES[difficulty][:attempts]
      @hints_total = Codebreaker::Consts::DIFFICULTIES[difficulty][:hints]
    end
  end
end
