module Codebreaker
  class Validator
    DIFFICULTIES = %w[hell medium easy]

    class << self
      def valid_name?(name)
        exit(true) if name == "exit"
        name.length.between?(3, 20)
      end

      def valid_difficulty?(difficulty)
        exit(true) if difficulty == "exit"
        DIFFICULTIES.include?(difficulty)
      end

      def valid_input?(input)
        exit(true) if input == "exit"

        input.match?(/^[1-6]{4}$/) || input == "hint"
      end
    end
  end
end
