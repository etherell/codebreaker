module Codebreaker
  class Player
    attr_reader :name

    def initialize(name)
      @name = name
    end

    def to_h
      instance_variables.each_with_object({}) do |param_name, hash|
        hash[param_name.to_s.delete('@')] = instance_variable_get(param_name)
      end
    end
  end
end
