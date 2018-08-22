require 'recipe.rb'

Given("the following recipe exist:") do |recipe_table|
 recipe_table.hashes.each do |recipe|
    Recipe.create!(recipe)
  end
end


Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

Then("It should navigate to {string}") do |page_name|
 visit path_to(page_name)
end


When("I fill in {string} with {string}") do |string, string2|
  fill_in string,	with: string2
end

Given("I  click {string}") do |link|
    click_link 'comment'
end

When /^I press on (.*)$/ do |button|

  # if button = "create recipe"
  # find('input[value= "Create Recipe"]').click
  # end
  # if button = 'comment'
  # find('input[id= "comment"]').click
  # end
  if button = 'add comment'
    find('input[value= "add comment"]').click
  end

  # if button = 'add step'
  # find('input[value= "add step"]').click
  # end

  # if button = 'add ingredient'
  # find('input[value= "add ingredient"]').click
  # end

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

Then("It should redirect me to {string}") do |comment_page|
   visit path_to(comment_page)
end