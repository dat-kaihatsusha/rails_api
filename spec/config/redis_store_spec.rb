require "rails_helper"

describe "RedisStoreTest" do
  it "active" do
    key = Digest::SHA1.hexdigest("test")
    expect(Rails.cache.read(key)).to be nil
    
    Rails.cache.write(key, true)
    expect(Rails.cache.read(key)).to be true
    
    Rails.cache.delete(key)
    expect(Rails.cache.read(key)).to be nil
  end
end