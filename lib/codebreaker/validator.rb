# frozen_string_literal: true

module Codebreaker
  class Validator
    DIFFICULTIES = %w[hell medium easy].freeze
    EXIT_INPUT = 'exit'
    HINT_INPUT = 'hint'

    class << self
      def valid_name?(name)
        exit_game if name == EXIT_INPUT
        name.length.between?(3, 20)
      end

      def valid_difficulty?(difficulty)
        exit_game if difficulty == EXIT_INPUT
        DIFFICULTIES.include?(difficulty)
      end

      def valid_input?(input)
        exit_game if input == EXIT_INPUT
        input.match?(/^[1-6]{4}$/) || input == HINT_INPUT
      end

      private

      def exit_game
        exit(true)
      end
    end
  end
end
