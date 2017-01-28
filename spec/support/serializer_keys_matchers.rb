module SerializerKeysMatcher
  RSpec.configure do |config|
    config.include self, type: :serializer
  end

  def expect_to_have_keys(object, *keys)
    keys.each do |key|
      expect(object).to have_key key
    end
  end
end
