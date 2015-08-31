module RubyMotionQuery
  module Stylers
    class NSDatePickerStyler < NSControlStyler

      def min_date=(v)
        view.minDate = v
      end
      def min_date
        view.minDate
      end

      def max_date=(v)
        view.maxDate = v
      end
      def max_date
        view.maxDate
      end

    end
  end
end
