module RubyMotionQuery
  module Stylers
    class NSStepperStyler < NSControlStyler

      def max_value=(v)
        view.maxValue = v
      end
      def max_value
        view.maxValue
      end

      def min_value=(v)
        view.minValue = v
      end
      def min_value
        view.minValue
      end

      def increment=(v)
        view.increment = v
      end
      def increment
        view.increment
      end

    end
  end
end
