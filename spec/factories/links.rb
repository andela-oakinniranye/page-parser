FactoryGirl.define do
  sequence(:url) do |i|
    "http://www.whatever-#{i}.com"
  end

  factory :link do
    url
  end

end
