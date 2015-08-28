module RubyMotionQuery
  module Stylers
    class NSSliderStyler < NSControlStyler

      def type=(v)
        value.sliderType = SLIDER_TYPES[v] || v
      end
      def type
        value.sliderType
      end

      def linear
        self.type = :linear
      end

      def linear?
        self.type == NSLinearSlider
      end

      def circular
        self.type = :circular
      end

      def circular?
        self.type == NSCircularSlider
      end

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

      def number_of_tickmarks=(v)
        view.numberOfTickMarks = v
      end

      def number_of_tickmarks
        view.numberOfTickMarks
      end

      def tickmark_position=(v)
        view.tickMarkPosition = TICKMARK_POSITIONS[v] || v
      end

      def tickmark_position
        view.tickMarkPosition
      end

      TICKMARK_POSITIONS = {
          below: NSTickMarkBelow,
          above: NSTickMarkAbove,
          left: NSTickMarkLeft,
          right: NSTickMarkRight
      }

      SLIDER_TYPES = {
          linear: NSLinearSlider,
          circular: NSCircularSlider
      }

    end
  end
end
