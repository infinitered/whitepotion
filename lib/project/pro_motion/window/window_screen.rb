module ProMotion
  class WindowScreen < ProMotion::WindowController
    include ProMotion::ScreenModule

    def init
      super.tap do
        build_window
        set_stylesheet

        self.on_load if self.respond_to?(:on_load)
      end
    end

    def build_window
      frame =[[0, 0], [0, 0]]
      if self.respond_to?(:window_frame)
        frame = window_frame
      end
      self.window = NSWindow.alloc.initWithContentRect(frame,
                                                       styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask,
                                                       backing: NSBackingStoreBuffered,
                                                       defer: false)
    end

    def view
      window.contentView
    end

    def show(sender=nil)
      showWindow(sender)
    end

    def append(view_or_constant, style=nil, opts = {})
      self.rmq.append(view_or_constant, style, opts)
    end
    def append!(view_or_constant, style=nil, opts = {})
      self.rmq.append!(view_or_constant, style, opts)
    end

    def prepend(view_or_constant, style=nil, opts = {})
      self.rmq.prepend(view_or_constant, style, opts)
    end
    def prepend!(view_or_constant, style=nil, opts = {})
      self.rmq.prepend!(view_or_constant, style, opts)
    end

    def create(view_or_constant, style=nil, opts = {})
      self.rmq.create(view_or_constant, style, opts)
    end
    def create!(view_or_constant, style=nil, opts = {})
      self.rmq.create!(view_or_constant, style, opts)
    end

    def build(view_or_constant, style = nil, opts = {})
      self.rmq.build(view_or_constant, style, opts)
    end
    def build!(view_or_constant, style = nil, opts = {})
      self.rmq.build!(view_or_constant, style, opts)
    end

    def reapply_styles
      self.rmq.all.reapply_styles
    end

    def color
      self.rmq.color
    end

    def font
      self.rmq.font
    end


    def stylesheet
      self.rmq.stylesheet
    end

    def stylesheet=(value)
      self.rmq.stylesheet = value
    end

    def self.stylesheet(style_sheet_class)
      @rmq_style_sheet_class = style_sheet_class
    end

    def self.rmq_style_sheet_class
      @rmq_style_sheet_class
    end

    protected

    def set_stylesheet
      if self.class.rmq_style_sheet_class
        self.rmq.stylesheet = self.class.rmq_style_sheet_class
        self.view.rmq.apply_style(:root_view) if self.rmq.stylesheet.respond_to?(:root_view)
      end
    end
  end
end