class AppDelegate < ProMotion::Delegate

  def will_launch(_)
    open MyWindowScreen.new
  end

end

class MyWindowScreenStylesheet < RubyMotionQuery::Stylesheet
  def label(st)
    st.text = 'Hello WhitePotion'
    st.act_as_label
    st.text_color = color.blue
    st.background_color = color.green
    st.frame = { l: 10, t: 10, w: 200, h: 30 }
  end

  def button(st)
    st.text = 'Click me'
    st.bezel_style = :textured_rounded
    st.frame = { fr: 20, fb: 20, w: 100, h: 50 }
  end

  def text(st)
    st.frame = { centered: :both, w: 300, h: 30 }
    st.placeholder = 'hide there !'
  end
end

class MyWindowScreen < ProMotion::WindowScreen
  stylesheet MyWindowScreenStylesheet

  def on_load
    append(NSTextField, :label)
    append(NSTextField, :text)
    append(NSButton, :button).on(:click) do
      app.alert(message: 'Hello Alert', title: 'Alert !', style: :critical, window: self) do |result|
        mp "click with #{result}"
      end
    end
  end

  def window_frame
    [[200, 200], [400, 400]]
  end

end