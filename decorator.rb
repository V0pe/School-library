require './person'

class Nameable
    def correct_name
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end
  end

  class NameComponent < Nameable
    def correct_name
      'ConcreteComponent'
    end
  end
  class Decorator < Nameable
    attr_accessor :name
  
    # @param [Component] component
    def initialize(nameable)
      @nameable = nameable
    end
  
    def correct_name
      @nameable.correct_name
    end
  end
  
  class CapitalizeDecorator < Decorator
    def correct_name
      @nameable.correct_name.upcase!
    end
  end

  class TrimmerDecorator < Decorator
    def correct_name
      @nameable.correct_name.strip!
    end
  end
