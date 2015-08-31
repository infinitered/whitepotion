module RubyMotionQuery
  module Stylers
    class NSSegmentedControlStyler

      def style=(v)
        view.segmentStyle = SEGMENT_STYLES[v] || v
      end

      def style
        view.segmentStyle
      end

      def segments=(v)
        raise ArgumentError.new("segments should be an array") unless v.is_a?(Array)

        view.setSegmentCount(v.length)

        v.each_with_index do |data, idx|
          label = data
          image = nil
          enabled = true
          selected = idx.zero?

          if data.is_a?(Hash)
            label = data[:title]
            image = data[:image]
            enabled = data.fetch(:enabled, true)
            selected = data.fetch(:selected, true)
          end

          view.setLabel(label, forSegment: idx)
          view.setImage(image, forSegment: idx) if image
          view.setEnabled(enabled, forSegment: idx)
          view.setSelected(selected, forSegment: idx)
        end
      end

      SEGMENT_STYLES = {
          automatic: NSSegmentStyleAutomatic,
          rounded: NSSegmentStyleRounded,
          texture_rounded: NSSegmentStyleTexturedRounded,
          round_rect: NSSegmentStyleRoundRect,
          texture_square: NSSegmentStyleTexturedSquare,
          capsule: NSSegmentStyleCapsule,
          small_squere: NSSegmentStyleSmallSquare,
          separated: NSSegmentStyleSeparated
      }
    end
  end
end
