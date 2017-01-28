module ParserHtmlHelper
  RSpec.configure do |config|
    config.include self
  end

  def raw_html
    <<-EOF
      <html>
        <div>
          <div>
            <h1>#{h1}</h1>
            <hr>
          </div>
          <div>
            <h2>#{h2}</h2>
            <hr>
          </div>
          <div>
            <h3>#{h3}</h3>
            <hr>
          </div>
          <a href='#{url}'>Link to page<a>
        </div>
      </html>
    EOF
  end

  def h1
    "This is a header 1 tag"
  end

  def h2
    "This is a header 2 tag"
  end

  def h3
    "This is a header 3 tag"
  end

  def url
    "http://www.lim.global"
  end
end
