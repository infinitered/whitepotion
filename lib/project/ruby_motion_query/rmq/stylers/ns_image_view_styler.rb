module RubyMotionQuery
  module Stylers

    class NSImageViewStyler < NSControlStyler
      def image=(v)
        view.image = v
      end
      def image
        view.image
      end

      def image_alignment=(v)
        view.imageAlignment = IMAGE_ALIGNMENTS[v] || v
      end
      def image_alignment
        view.imageAlignment
      end

      def image_scaling=(v)
        view.imageScaling = IMAGE_SCALING[v] || v
      end
      def image_scaling
        view.imageScaling
      end

      IMAGE_ALIGNMENTS = {
          center: NSImageAlignCenter,
          top: NSImageAlignTop,
          top_left: NSImageAlignTopLeft,
          top_right: NSImageAlignTopRight,
          left: NSImageAlignLeft,
          bottom: NSImageAlignBottom,
          bottom_left: NSImageAlignBottomLeft,
          bottom_right: NSImageAlignBottomRight,
          right: NSImageAlignRight
      }

      IMAGE_SCALING = {
          proportionally_down: NSImageScaleProportionallyDown,
          axes_independently: NSImageScaleAxesIndependently,
          none: NSImageScaleNone,
          proportionally_up_or_down: NSImageScaleProportionallyUpOrDown
      }
    end

  end
end
