module Codebreaker
  class Player
    DATA_PATH = "./data/players.yaml".freeze

    attr_reader :difficulty
    attr_accessor :name, :attempts_total, :attempts_used, :hints_total, :hints_used

    def difficulty=(difficulty)
      @difficulty = difficulty
      @hints_used = 0
      @attempts_used = 0
      set_total_attempts_and_hints
    end

    def set_total_attempts_and_hints
      @attempts_total, @hints_total = case difficulty
                                      when "easy" then [15, 2]
                                      when "medium" then [10, 1]
                                      when "hell" then [5, 1]
                                      end
    end

    def has_hints?
      hints_total > hints_used
    end

    def has_attempts?
      attempts_total > attempts_used
    end

    def hints_left
      hints_total - hints_used
    end

    def attempts_left
      attempts_total - attempts_used
    end

    def self.all
      return [] unless File.exist?(DATA_PATH)

      stats = YAML.safe_load(File.read(DATA_PATH), permitted_classes: [Codebreaker::Stats, Codebreaker::Player],
                                                   aliases: true)
      stats&.players
    end
  end
end
