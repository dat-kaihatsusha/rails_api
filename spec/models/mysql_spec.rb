require "rails_helper"

describe "MysqlTest" do
  it "ping" do
    expect(ActiveRecord::Base.connection.active?).to be true
  end
end