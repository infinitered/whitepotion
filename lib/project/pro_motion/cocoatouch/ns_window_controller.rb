module ProMotion
  class WindowController < NSWindowController

    def windowDidLoad
      self.did_load if respond_to?(:did_load)
    end

    def windowWillLoad
      self.will_load if respond_to?(:will_load)
    end

    def app
      RubyMotionQuery::RMQ.app
    end

  end
end