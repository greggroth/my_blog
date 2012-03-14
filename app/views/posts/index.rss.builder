xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title       "Coded World"
    xml.link        posts_url
    xml.description "Coded World Blog (greggroth.heroku.com)"
    
    @posts.each do |post|
      xml.item do
        xml.title          post.title
        xml.link           post_url(post)
        xml.description    post.rendered_body
        xml.pubDate        post.created_at.to_s(:rfc822)
        xml.guid           post_url(post)
      end
    end
  end
end