class HtmlToText
  def initialize; end

  def get_html(html)
    index_div = 0
    stack = []
    i = 0
    flag = false
    while i < html.size - 3 do
      if html[i..(i + 3)] == '<br>'
        html[i..(i + 3)] = "\n"
        flag = false
      elsif html[i..(i + 4)] == '<div>'
        stack << '<div>'
        html[i..(i + 4)] = flag ? "\n" : ""
        flag = true
      elsif html[i..(i + 5)] == '</div>'
        html[i..(i + 5)] = flag && stack.pop == '<div>' ? "\n" : ""
        flag = false
      else
        flag = true
      end
      i += 1
    end
    @output = html
  end

  def show_view
    print @output
  end
end

test = HtmlToText.new
test.get_html("<div>Hello Ruby</div><<<br>>><div>Will</div> be</div>Fun<p></p>")
test.show_view
