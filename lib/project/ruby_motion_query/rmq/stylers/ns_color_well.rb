module RubyMotionQuery
  module Stylers

    class NSColorWellStyler < NSControlStyler

      def color=(v)
        view.color = v
      end
      def color
        view.color
      end

    end
  end
end
