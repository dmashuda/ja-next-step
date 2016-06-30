json.array!(@keywords) do |keyword|
  json.extract! keyword, :id, :label
  json.url keyword_url(keyword, format: :json)
end
