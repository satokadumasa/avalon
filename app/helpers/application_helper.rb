module ApplicationHelper
  def tag_convert(text)
    tags = [
      'strong',
      'h1',
      'h2',
      'h3',
      'h4',
    ]
    ws = ['(\W+)','(\w+)']
    tags.each do |tag|
      ws.each do |w|
        t = "<#{tag}:#{w}>"
        mds = text.scan(/#{t}/)
        if mds = text.scan(/#{t}/)
          mds.each do |md|
            if md[0]
              text = text.gsub(/<#{tag}:#{md[0]}>/, "<#{tag}>#{md[0]}</#{tag}>") 
            end
          end
        end
      end
    end
    text
  end

  def markdown(text)
    #optionの設定
    options = [
      :autolink, 
      :gh_blockcode, 
      :hard_wrap, 
      :no_intraemphasis,
      :fenced_code, 
      :filter_html
    ]
    #マークダウン
    Redcarpet.new(text, *options).to_html.html_safe
  end

  def Coderay(code)
    text = markdown(code)
    doc = Nokogiri::HTML(text)
    doc.search("//pre[@lang]").each do |pre|
      pre.replace CodeRay.scan(pre.text.rstrip, pre[:lang]).div(:line_numbers => :table)
    end
    doc.to_html.html_safe
  end
end
