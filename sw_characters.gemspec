
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "sw_characters/version"

Gem::Specification.new do |spec|
  spec.name          = "sw_characters"
  spec.version       = SwCharacters::VERSION
  spec.authors       = ["Matthew McCormack"]
  spec.email         = ["mmccormack1182@gmail.com"]

  spec.summary       = "An API built encyclopedia of characters, planets, species, and films from the Star Wars Universe."
  spec.description   = "An encyclopedia of all named characters in the Star Wars Movies, including their species, fims, and homeworlds. You can manually look through each list or search spefic characters by their name."
  spec.homepage      = "http://www.github.com/mlmccor/sw_characters"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://www.rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  # spec.bindir        = "exe"
  spec.executables  = ["sw_characters"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.license = 'MIT'

end
