require 'recipe.rb'

Given("{string} has the following recipe exist:") do |email, recipe_table|
  user = User.find_by_email(email)
  recipe_table.hashes.each do |recipe|
    user.recipes.create!(recipe)
  end
end


Given("the following ingredients exist:") do |ingredient_table|
  ingredient_table.hashes.each do |ingredient|
    recipe = Recipe.find(ingredient[:id])
    recipe.ingredient.create!(ingredient)
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
  find('input[value= "Create User"]').click  if button == "create user"
  find('input[value= "Create Recipe"]').click if button == "create recipe"
  find('input[value= "add ingredient"]').click if button == 'add ingredient'
  find('input[value= "add step"]').click if button == 'add step'



  # if button = 'comment'
  # find('input[id= "comment"]').click
  # end

  # if button = 'add comment'
  #   find('input[value= "add comment"]').click
  # end


end



Then("The number of {string} should be igual {int}") do |string, int|
  expect(User.count).to eq int if string == "user"
  expect(Recipe.count).to eq int if string == 'recip'
   expect(Recipe.count).to eq int if string == 'recipe-del'
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

Given("the following user exists:") do |table|
  table.hashes.each do |user|
    FactoryBot.create(:user, user)
  end
end

When("I visit the {string} show page") do |text|
    user = User.find_by_email(text)
    visit user_path(user)
end

Given("I visit the {string} recipe {string} show page") do |string, string2|
    user = User.find_by_email(string)
    recipe = user.recipes.find_by(name: string2)
    visit user_recipe_path(user,recipe)
end

When("I click on {string}") do |text|
  click_link_or_button text
end

Given("{string} has the following ingredient exist:") do |recipe_name, ingredient_table|
  recipe = Recipe.find_by(name:recipe_name)
  ingredient_table.hashes.each do |ingredient|
    recipe.ingredient.create!(ingredient)
  end
end

Given("{string} has the following step exist:") do |recipe_name, step_table|
  recipe = Recipe.find_by(name:recipe_name)
  step_table.hashes.each do |step|
    recipe.steps.create!(step)
  end
end

Then("I should not see {string}") do |string|
  page.should have_no_content(string)
end