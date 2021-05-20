#require 'webmock/rspec'
include WebMock::API

WebMock.enable!

# モックファイルを取得
def mock(name)
  fixture_path = File.expand_path('fixtures/webmock', __dir__)
  File.read(File.join(fixture_path, name))
end