module RubyMotionQuery
  class RMQ

    # @return [RMQ]
    def attr(new_settings)
      selected.each do |view|
        new_settings.each do |k,v|
          view.send "#{k}=", v
        end
      end
      self
    end

    # Get or set the most common data for a particuliar view(s) in a
    # performant way (more performant than attr)
    # For example, text for UILabel, image for UIImageView
    #
    # @return [RMQ]
    def data(new_data = :rmq_not_provided)
      if new_data != :rmq_not_provided
        selected.each do |view|
          case view
            when NSTextField then view.setStringValue new_data
            when NSButton then view.title = new_data
            when NSSlider then view.doubleValue = new_data
            # TODO, finish
          end
        end

        self
      else
        out = selected.map do |view|
          case view
          when NSTextField then view.stringValue
          when NSButton then view.title
          when NSSlider then view.doubleValue
          # TODO, finish
          end
        end

        out = out.first if out.length == 1
        out
      end
    end

    # Allow users to set data with equals
    #
    # @return [RMQ]
    #
    # @example
    #   rmq(my_view).data = 'some data'
    def data=(new_data)
      self.data(new_data)
    end

    # @return [RMQ]
    def send(method, args = nil)
      selected.each do |view|
        if view.respond_to?(method)
          if args
            view.__send__ method, args
          else
            view.__send__ method
          end
        end
      end
      self
    end

    # Sets the last selected view as the first responder
    #
    # @return [RMQ]
    #
    # @example
    #   rmq(my_view).next(UITextField).focus
    def focus
      unless RMQ.is_blank?(selected)
        selected.last.becomeFirstResponder
      end
      self
    end
    alias :become_first_responder :focus

    # @return [RMQ]
    def hide
      selected.each { |view| view.hidden = true }
      self
    end

    # @return [RMQ]
    def show
      selected.each { |view| view.hidden = false }
      self
    end

    # @return [RMQ]
    def toggle
      selected.each { |view| view.hidden = !view.hidden? }
      self
    end

    # @return [RMQ]
    def toggle_enabled
      selected.each { |view| view.enabled = !view.enabled? }
      self
    end

    def enable
      selected.each { |view| view.enabled = true }
      self
    end

    def disable
      selected.each { |view| view.enabled = false }
      self
    end

    def enable_interaction
      selected.each { |view| view.userInteractionEnabled = true }
      self
    end

    def disable_interaction
      selected.each { |view| view.userInteractionEnabled = false }
      self
    end

    # For UIActivityIndicatorViews
    def start_animating
      selected.each do |view|
        view.startAnimating if view.respond_to?(:startAnimating)
      end
      self
    end

    # For UIActivityIndicatorViews
    def stop_animating
      selected.each do |view|
        view.stopAnimating if view.respond_to?(:startAnimating)
      end
      self
    end

  end
end
