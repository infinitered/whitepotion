module ProMotion
  module DelegateModule

    attr_accessor :screens

    def applicationDidFinishLaunching(notification)
      did_launch(notification) if respond_to?(:did_launch)
    end

    def applicationWillFinishLaunching(notification)
      will_launch(notification) if respond_to?(:will_launch)
    end

    def applicationWillTerminate(notification)
      will_terminate(notification) if respond_to?(:will_terminate)
    end

    def applicationShouldTerminate(application)
      should_terminate(application) if respond_to?(:will_terminate)
    end

    def applicationShouldTerminateAfterLastWindowClosed(application)
      should_terminate_window_closed(application) if respond_to?(:should_terminate_window_closed)
    end

    def applicationWillBecomeActive(notification)
      will_become_active(notification) if respond_to?(:will_become_active)
    end

    def applicationDidBecomeActive(notification)
      did_become_active(notification) if respond_to?(:did_become_active)
    end

    def applicationWillResignActive(notification)
      will_resign_active(notification) if respond_to?(:will_resign_active)
    end

    def applicationDidResignActive(notification)
      did_resign_active(notification) if respond_to?(:did_resign_active)
    end

    def applicationWillHide(notification)
      will_hide(notification) if respond_to?(:will_hide)
    end

    def applicationDidHide(notification)
      did_hide(notification) if respond_to?(:did_hide)
    end

    def applicationWillUnhide(notification)
      will_unhide(notification) if respond_to?(:will_unhide)
    end

    def applicationDidUnhide(notification)
      did_unhide(notification) if respond_to?(:did_unhide)
    end

    def applicationShouldHandleReopen(application, hasVisibleWindows: flag)
      should_handle_reopen?(application, flag) if respond_to?('should_handle_reopen?')
    end

    def applicationDidUpdate(notification)
      did_update(notification) if respond_to?(:did_update)
    end

    def applicationWillUpdate(notification)
      will_update(notification) if respond_to?(:will_update)
    end

    def open(screen, args={})
      screen = screen.new if screen.respond_to?(:new)

      self.screens ||= []
      self.screens << screen
      screen.show(self)

=begin
      self.home_screen = screen

      self.window ||= self.ui_window.alloc.initWithFrame(UIScreen.mainScreen.bounds)
      self.window.rootViewController = (screen.navigationController || screen)
      self.window.tintColor = self.class.send(:get_tint_color) if self.window.respond_to?("tintColor=")
      self.window.makeKeyAndVisible
=end

      screen
    end

  end
end