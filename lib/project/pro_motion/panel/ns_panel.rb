class NSPanel

  def frame=(value)
    setFrame(value, display: true, animate: true)
  end

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

end