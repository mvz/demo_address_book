Then /^the first name in the JSON representation of the card should be "([^"]*)"$/ do |first_name|
  JSON.parse(last_response.body)['first_name'].should eq(first_name)
end

Then /^the response body should be a JSON v(\d+) representation of the Card$/ do |version|
  last_response.body.should eq(Card.last.send("to_json_v#{version}"))
end
