require 'spec_helper'

describe Post do
  it "creates a new post" do
    post = Post.create!(title: "Test Title", body: "This is an awesome story")
    assert post.save
  end
end
