class HtmlToGet
  def get_html(html)
    html.gsub!("<div>", "\n")
    html.gsub!("</div>", "\n")
    html.gsub!("<br>", "\n")  
    @html_change = html
  end

  def show_view
    puts @html_change
  end 
end

input = HtmlToGet.new
input.get_html("<div>Hello Ruby</div><<<br>>><div>Will</div> be</div>Fun<p></p>")
input.show_view
