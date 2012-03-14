xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title       "greggroth.heroku.com posts"
    xml.link        posts_url
    xml.description "greggroth.heroku.com Coded World Blog"
    
    @posts.each do |post|
      xml.item do
        xml.title          post.title
        xml.link           post_url(post)
        xml.description    post.body
        xml.pubDate        post.created_at.to_s(:rfc822)
        xml.guid           post_url(post)
      end
    end
  end
end