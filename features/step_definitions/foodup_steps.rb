require 'recipe.rb'

Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

When("I fill in {string} with {string}") do |string, string2|
  fill_in string,	with: string2
end

When /^I press on (.*)$/ do |button|
  find('input[name="commit"]').click
end


Then("the number of recip on the database should be {int}") do |int|

  expect(Recipe.count).to eq int
end

Then("I should see {string}") do |string|
  page.should have_content(string)
end