module RubyMotionQuery
  module Stylers

    class NSControlStyler < NSViewStyler

      def text_alignment ; view.alignment ; end
      def text_alignment=(v) ; view.alignment = TEXT_ALIGNMENTS[v] || v ; end

      def font ; view.font ; end
      def font=(v) ; view.font = v ; end

      # Accessing the Text Attributes
      def text ; view.stringValue ; end
      def text=(v) ; view.stringValue = v ; end

      def attributed_text ; view.attributedStringValue ; end
      def attributed_text=(v) ; view.attributedStringValue = v ; end

=begin
      def content_vertical_alignment=(value)
        @view.contentVerticalAlignment = value
      end

      def content_vertical_alignment
        @view.contentVerticalAlignment
      end

      def content_horizontal_alignment=(value)
        @view.contentHorizontalAlignment = value
      end

      def content_horizontal_alignment
        @view.contentHorizontalAlignment
      end

      def selected=(value)
        @view.selected = value
      end

      def selected
        @view.isSelected
      end

      def highlighted=(value)
        @view.highlighted = value
      end

      def highlighted
        @view.isHighlighted
      end

      def state
        @view.state
      end
=end
    end

  end
end
