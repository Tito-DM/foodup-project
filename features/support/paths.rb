# Taken from the cucumber-rails project.

module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /the home\s?page/
      recipes_path

    when /edit recipe\s?page/
       edit_user_recipe_path(1,1)
    when /the create new recip page/
     new_user_recipe_path(User.ids)
    when /the create new user page/
      new_user_path
    when /the details page for 'Calulu'/
      recipe_path(Recipe.where(name: 'calulu').ids)
    when /comment page/
      new_recipe_comment_path(Recipe.where(name: 'calulu').ids)




    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(NavigationHelpers)
