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

recipe_path = parse_recipe_path!
recipe_titles = YAML.load_file(File.join(__dir__, recipe_path))
puts recipe_titles.join("\n")
