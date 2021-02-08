module Codebreaker
  class HintsManager
    def initialize(hints_total, secret_number)
      @hints_total = hints_total
      @secret_number = secret_number
      @hints = prepare_hints
    end

    def give_hint
      @hints.pop
    end

    def hints_used
      @hints_total - hints_left
    end

    def hints?
      @hints.any?
    end

    def hints_left
      @hints.length
    end

    private

    def prepare_hints
      @secret_number.chars.shuffle.take(@hints_total)
    end
  end
end
