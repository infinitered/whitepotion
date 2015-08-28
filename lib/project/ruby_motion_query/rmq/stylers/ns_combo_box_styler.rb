module RubyMotionQuery
  module Stylers

    class NSComboBoxStyler < NSTextFieldStyler

      def has_vertical_slider=(v)
        view.hasVerticalSlider = v
      end

      def has_vertical_slider?
        view.hasVerticalSlider
      end

      def intercell_spacing=(v)
        view.intercellSpacing = v
      end

      def intercell_spacing
        view.intercellSpacing
      end

      def button_bordered=(v)
        view.buttonBordered = v
      end

      def button_bordered?
        view.buttonBordered
      end

      def item_height=(v)
        view.itemHeight = v
      end

      def item_height
        view.itemHeight
      end

      def number_of_visible_items=(v)
        view.numberOfVisibleItems = v
      end

      def number_of_visible_items
        view.numberOfVisibleItems
      end

      def items=(v)
        view.addItemsWithObjectValues(v)
      end

    end
  end
end
