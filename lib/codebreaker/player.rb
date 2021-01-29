module Codebreaker
  class Player
    DIFFICULTIES = %w[Easy Medium Hell]

    attr_reader rating, name, difficulty, attempts_total,
                attempts_used, hints_total, hints_used

    def initialize(name)
      @rating = 0
      @name = "" if name.length.between?(3, 20)
      @difficulty = ""
      @attempts_total = 0
      @attempts_used = 0
      @hints_total = 0
      @hints_used = 0
    end

    def name=(name)
      @name = name if name.length.between?(3, 20)
    end

    def set_start_params
      case difficulty
      when "Easy"
        attempts_total = 15
        hints_total = 2
      when "medium"
        attempts_total = 10
        hints_total = 1
      when "Hell"
        attempts_total = 5
        hints_total = 1
      end
    end
  end
end
