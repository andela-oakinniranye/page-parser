FactoryGirl.define do
  factory :content do
    body "this is a body tag"
    link

    [:h1, :h2, :h3].each do |tag_type|
      factory "content_with_#{tag_type}" do
        tag tag_type
        body "this is a #{tag_type} body"
      end
    end

    factory :content_with_url do
      body 'http://www.whatever-content.com'
      tag :url
    end
  end
end
