class NSWindow

  def frame=(value)
    setFrame(value, display: true, animate: true)
    rect = Rect.object_to_cg_rect(value)
    self.contentView.frame = [[0, 0], rect.size]
  end

  def frame_for_window
  end

=begin
  def append(view_or_constant, style=nil, opts = {})
    self.contentView.append(view_or_constant, style, opts)
  end
  def append!(view_or_constant, style=nil, opts = {})
    self.contentView.append!(view_or_constant, style, opts)
  end

  def prepend(view_or_constant, style=nil, opts = {})
    self.contentView.prepend(view_or_constant, style, opts)
  end
  def prepend!(view_or_constant, style=nil, opts = {})
    self.contentView.prepend!(view_or_constant, style, opts)
  end

  def create(view_or_constant, style=nil, opts = {})
    self.contentView.create(view_or_constant, style, opts)
  end
  def create!(view_or_constant, style=nil, opts = {})
    self.contentView.create!(view_or_constant, style, opts)
  end

  def build(view_or_constant, style = nil, opts = {})
    self.contentView.build(view_or_constant, style, opts)
  end
  def build!(view_or_constant, style = nil, opts = {})
    self.contentView.build!(view_or_constant, style, opts)
  end

  def reapply_styles
    self.contentView.reapply_styles
  end


=end

end