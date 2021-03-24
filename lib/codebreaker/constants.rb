module Codebreaker
  module Constants
    COMPLETE_MATCH = '+'.freeze
    PARTIAL_MATCH = '-'.freeze
    DIFFICULTIES = {
      'easy' => { attempts: 15, hints: 2 },
      'medium' => { attempts: 10, hints: 1 },
      'hell' => { attempts: 5, hints: 1 }
    }.freeze
    NOT_PUBLIC_PARAMS = %i[@hints @secret_number].freeze
    WIN_RESULT = '++++'.freeze
  end
end
