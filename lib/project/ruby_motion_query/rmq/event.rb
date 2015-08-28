module RubyMotionQuery
  class Event
    attr_accessor :block, :recognizer, :event, :sdk_event_or_recognizer, :gesture, :sender

    def initialize(sender, event, block)
      block = block.respond_to?('weak!') ? block.weak! : block

      #if CONTROL_EVENTS[event] == ValidationEvent
      #  return ValidationEvent.new(block)
      if (@sdk_event_or_recognizer = VIEW_GESTURES[event])
        @gesture = true
        @custom_event = false
      elsif sender.is_a?(NSControl) && event == :rmq_osx_trigger_event
        @gesture = false
        @custom_event = false
      else
        @gesture = false
        @sdk_event_or_recognizer = nil
        @custom_event = true
      end

      @sender = sender
      @event = event
      @block = block

      if @gesture
        @recognizer = @sdk_event_or_recognizer.alloc.initWithTarget(self, action: "handle_gesture_or_event:")
        @sender.addGestureRecognizer(@recognizer)
      elsif !@custom_event
        @sender.target = self
        @sender.action = "handle_gesture_or_event:"
      end

    end

    def handle_gesture_or_event(gesture)
      # Handle debounce logic
      if @debounce_length
        return if (@debounce_stamp + @debounce_length > Time.now)
        # update timestamp
        @debounce_stamp = Time.now
      end

      case @block.arity
        when 2
          @block.call(@sender, self)
        when 1
          @block.call(@sender)
        else
          @block.call
      end
    end

    def set_options(opts)
      if opts[:debounce]
        @debounce_length = opts[:debounce]
        @debounce_stamp = Time.now
      end

=begin
      if gesture?
        @recognizer.tap do |o|
          o.cancelsTouchesInView = opts[:cancels_touches_in_view] if opts.include?(:cancels_touches_in_view)
          o.delegate = opts[:delegate] if opts.include?(:delegate)
          o.numberOfTapsRequired = opts[:taps_required] if opts.include?(:taps_required)
          o.numberOfTouchesRequired = opts[:fingers_required] if opts.include?(:fingers_required)
          o.maximumNumberOfTouches = opts[:maximum_number_of_touches] if opts.include?(:maximum_number_of_touches)
          o.minimumNumberOfTouches = opts[:minimum_number_of_touches] if opts.include?(:minimum_number_of_touches)
          o.allowableMovement = opts[:allowable_movement] if opts.include?(:allowable_movement)
          o.minimumPressDuration = opts[:minimum_press_duration] if opts.include?(:minimum_press_duration)
          o.direction = opts[:direction] if opts.include?(:direction)
          o.rotation = opts[:rotation] if opts.include?(:rotation)
          o.scale = opts[:scale] if opts.include?(:scale)

          case event
            when :swipe_up then o.direction = UISwipeGestureRecognizerDirectionUp
            when :swipe_down then o.direction = UISwipeGestureRecognizerDirectionDown
            when :swipe_left then o.direction = UISwipeGestureRecognizerDirectionLeft
            when :swipe_right then o.direction = UISwipeGestureRecognizerDirectionRight
          end

          if opts.include?(:init)
            opts[:init].call(@recognizer)
          end
        end
      end
=end
    end

    #set_options

    def gesture?
      @gesture
    end

    def sdk_event?
      !@custom_event && !@gesture
    end

    def custom_event?
      @custom_event
    end

    def location
      if gesture?
        @recognizer.locationInView(@sender)
      else
        @sender.convertRect(@sender.bounds, toView: nil).origin
      end
    end

    def location_in(view)
      if gesture?
        @recognizer.locationInView(view)
      else
        @sender.convertRect(@sender.bounds, toView: view).origin
      end
    end

    def remove
      if @sender
=begin
        if self.gesture?
          @sender.removeGestureRecognizer(@recognizer)
        else
          @sender.removeTarget(self, action: "handle_gesture_or_event:", forControlEvents: @sdk_event_or_recognizer)
        end
=end
      end
    end

=begin
    CONTROL_EVENTS = {
      touch: UIControlEventTouchUpInside,
      touch_up: UIControlEventTouchUpInside,
      touch_down: UIControlEventTouchDown,
      touch_start: UIControlEventTouchDown | UIControlEventTouchDragEnter,
      touch_stop: UIControlEventTouchUpInside | UIControlEventTouchCancel | UIControlEventTouchDragExit,
      change:  UIControlEventValueChanged | UIControlEventEditingChanged,

      touch_down_repeat: UIControlEventTouchDownRepeat,
      touch_drag_inside: UIControlEventTouchDragInside,
      touch_drag_outside: UIControlEventTouchDragOutside,
      touch_drag_enter: UIControlEventTouchDragEnter,
      touch_drag_exit: UIControlEventTouchDragExit,
      touch_up_inside: UIControlEventTouchUpInside,
      touch_up_outside: UIControlEventTouchUpOutside,
      touch_cancel: UIControlEventTouchCancel,

      value_changed: UIControlEventValueChanged,

      editing_did_begin: UIControlEventEditingDidBegin,
      editing_changed: UIControlEventEditingChanged,
      editing_did_change: UIControlEventEditingChanged,
      editing_did_end: UIControlEventEditingDidEnd,
      editing_did_endonexit: UIControlEventEditingDidEndOnExit,

      all_touch: UIControlEventAllTouchEvents,
      all_editing: UIControlEventAllEditingEvents,

      application: UIControlEventApplicationReserved,
      system: UIControlEventSystemReserved,
      all: UIControlEventAllEvents,
      valid: ValidationEvent,
      invalid: ValidationEvent
    }
=end

    VIEW_GESTURES = {
        click: NSClickGestureRecognizer,
        magnification: NSMagnificationGestureRecognizer,
        pan: NSPanGestureRecognizer,
        press: NSPressGestureRecognizer,
        rotation: NSRotationGestureRecognizer,
    }

  end
end
