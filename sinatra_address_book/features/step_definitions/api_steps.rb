Given /^I send and accept JSON$/ do
  header 'Accept', 'application/json'
  header 'Content-Type', 'application/json'
end

When /^I send a GET request to "([^"]*)"$/ do |path|
  path = Mustache.render(path, {:id => @id})
  get path 
end

When /^I send a POST request to "([^\"]*)" with the following:$/ do |path, body|
  post path, body
end

When /^I send a PUT request to "([^"]*)" with the following:$/ do |path, body|
  path = Mustache.render(path, {:id => @id}) 
  put path, body
end

When /^I send a DELETE request to "([^"]*)"$/ do |path|
  path = Mustache.render(path, {:id => @id})
  delete path
end

Then /^the response status should be "([^"]*)"$/ do |status|
  begin
    last_response.status.should eq(status.to_i)
  rescue RSpec::Expectations::ExpectationNotMetError => e
    puts "Response body:"
    puts last_response.body
    raise e 
  end
end

Then /^the response body should be a JSON representation of the (\w+)$/ do |model|
  last_response.body.should eq(model.constantize.last.to_json)
end

Then /^the response body should be a JSON representation of the (\w+) list$/ do |model|
  last_response.body.should eq(model.constantize.all.to_json)
end

Then /^the response body should have (\d+) cards$/ do |count|
  JSON.parse(last_response.body).length.should eq(count.to_i)
end

Then /^show me the response body$/ do
  puts last_response.body
end

