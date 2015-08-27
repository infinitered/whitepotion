module RubyMotionQuery
  module Stylers
    class NSSliderStyler < NSControlStyler

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

    end
  end
end
