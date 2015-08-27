module ProMotion
  class PanelScreen < ProMotion::WindowScreen

    def build_window
      frame =[[0, 0], [0, 0]]
      if self.respond_to?(:window_frame)
        frame = window_frame
      end
      self.window = NSPanel.alloc.initWithContentRect(frame,
                                                      styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask,
                                                      backing: NSBackingStoreBuffered,
                                                      defer: false)
    end

  end
end