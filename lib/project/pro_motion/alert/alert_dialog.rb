class AlertDialog < NSAlert

  def initialize(options={}, &block)
    self.init

    @options = {
        message: nil,
        title: nil,
        style: :information,
        show: true,
        buttons: ['OK', 'Cancel'],
        view: nil,
        window: nil,
        icon: nil
    }.merge(options)

    @callback = block

    raise ArgumentError.new(":message option can not be nil") if @options[:message].nil?

    self.alertStyle = alert_style(@options[:style])
    self.accessoryView = @options[:view]
    self.informativeText = @options[:message]
    self.messageText = @options[:title]
    self.icon = @options[:icon]

    @options[:buttons].each do |title|
      addButtonWithTitle(title)
    end

    self.show if @options[:show]
    self
  end

  def show
    # beginSheetModalForWindow:completionHandler: is 10.9+
    if @options[:window] && self.respond_to?('beginSheetModalForWindow:completionHandler:')
      window = @options[:window]
      if window.is_a?(NSWindowController)
        window = window.window
      end

      self.beginSheetModalForWindow(window,
                                    completionHandler: -> (return_code) {
                                      @callback.call(return_code) if @callback
                                    })
    else
      response = runModal
      @callback.call(response) if @callback
    end
  end

  def alert_style(symbol)
    {
        warning: NSWarningAlertStyle,
        information: NSInformationalAlertStyle,
        critical: NSCriticalAlertStyle
    }[symbol] || symbol
  end

end