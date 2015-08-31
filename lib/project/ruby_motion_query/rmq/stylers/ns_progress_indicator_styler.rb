module RubyMotionQuery
  module Stylers
    class NSProgressIndicatorStyler < NSControlStyler

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
        view.incrementBy = v
      end
      def increment
        view.increment
      end

      def indeterminate=(v)
        view.indeterminate = v
      end
      def indeterminate?
        view.indeterminate
      end

      def style=(v)
        view.style = PROGRESS_STYLES[v] || v
      end
      def style
        view.style
      end

      PROGRESS_STYLES = {
          bar: NSProgressIndicatorBarStyle,
          spin: NSProgressIndicatorSpinningStyle
      }
    end
  end
end
