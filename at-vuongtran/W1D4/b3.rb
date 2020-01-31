class HtmlToText
  def initialize; end

  def get_html(html)
    html.gsub!("<div>", "") if html.index("<div>").zero? 
    html.gsub!("<div>", "\n")
    html.gsub!("</div>", "\n")
    html.gsub!("<br>", "\n")
    @output = html
  end

  def show_view
    print @output
  end
end

test = HtmlToText.new
test.get_html("<div>Hello Ruby</div><<<br>>><div>Will</div> be</div>Fun<p></p>")
test.show_view
