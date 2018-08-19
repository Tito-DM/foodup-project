require 'recipe.rb'

Given("the following recipe exist:") do |recipe_table|
 recipe_table.hashes.each do |recipe|
    Recipe.create!(recipe)
  end
end


Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

When("I fill in {string} with {string}") do |string, string2|
  fill_in string,	with: string2
end

When /^I press on (.*)$/ do |button|
  find('input[name="commit"]').click
end

Then("the number of {string} on the database should be {int}") do |string, int|
   expect(Recipe.count).to eq int if string = 'recip'
end

Then("I should see {string}") do |string|
  page.should have_content(string)
end

Then("show me the page") do
  save_and_open_page
end