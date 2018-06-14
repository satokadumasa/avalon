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
end
