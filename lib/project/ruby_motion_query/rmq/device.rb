module RubyMotionQuery
  class RMQ
    # @return [Device]
    def device
      Device
    end

    # @return [Device]
    def self.device
      Device
    end
  end

  class Device
    class << self
      # Find out what version of iOS you're using.
      # `rmq.device.is_version? 8`
      # `rmq.device.is_version? "7.1"`
      #
      # @return [Boolean]
      def is_version? version
        !!osx_version.match("^#{version}")
      end

      def osx_version
        NSProcessInfo.processInfo.operatingSystemVersionString
      end

      # Identify if current version is at least that of what is passed.
      # Will not work if apple ever does semantic versions like 8.2.1
      # `rmq.device.ios_at_least? 8`
      # `rmq.device.ios_at_least? 7.1`
      #
      # @return [Boolean]
      def ios_at_least? version
        version.to_f.round(3) <= osx_version.to_f.round(3)
      end

      # @return [NSScreen]
      def screen
        NSScreen.mainScreen
      end

      def size_a
        @_size_a ||= screen.frame.size.to_a.sort
      end

      # Width is the width of the device, regardless of its orientation.
      # This is static. If you want the width with the correct orientation, use
      # screen_width
      #
      # @return [Numeric]
      def width
        size_a[0]
      end
      def width_landscape
        size_a[1]
      end

      # Height is the height of the device, regardless of its orientation.
      # This is static. If you want the height with the correct orientation, use
      # screen_height
      #
      # @return [Numeric]
      def height
        size_a[1]
      end
      def height_landscape
        size_a[0]
      end

      # @return [Numeric]
      def screen_width
        width
      end

      # @return [Numeric]
      def screen_height
        height
      end

      def retina?
        if @_retina.nil?
          main_screen = Device.screen
          @_retina = !!(main_screen.userSpaceScaleFactor == 2.0)
        end

        @_retina
      end

      # @return :unknown or from ORIENTATIONS
      def orientation
        if @custom_orientation
          @custom_orientation
        else
          orientation = UIApplication.sharedApplication.statusBarOrientation
          ORIENTATIONS[orientation] || :unknown
        end
      end

      def log
        puts "Device Info:\n" << "-" * 12
        [:retina?, :screen_height, :screen_width, :osx_version].each do |method|
          puts "#{method}: #{self.send(method)}"
        end
      end

    end
  end
end
