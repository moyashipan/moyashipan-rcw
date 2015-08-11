require 'yaml'

def parse_recipe_path!
  unless ARGV.length == 1
    puts <<-'EOS'
Invalid args.
Run like this: `ruby recipe.rb recipe.yaml`
    EOS
    exit
  end

  ARGV[0]
end

class Recipe
  attr_accessor :title

  def initialize(title)
    @title = title
  end

  def to_s
    title
  end
end

recipe_path = parse_recipe_path!
recipe_titles = YAML.load_file(File.join(__dir__, recipe_path))

recipes = recipe_titles.map do |title|
  Recipe.new(title)
end

recipes.each do |recipe|
  puts recipe
end
