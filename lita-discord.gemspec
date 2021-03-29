Gem::Specification.new do |spec|
  spec.name          = "lita-discord"
  spec.version       = "0.1.0"
  spec.authors       = ["Maxime 'biximilien' Gauthier"]
  spec.email         = ["maxime@gauthier.software"]
  spec.description   = "A Discord adapter for Lita."
  spec.summary       = "A Discord adapter for Lita."
  spec.homepage      = "https://github.com/biximilien/lita-discord"
  spec.license       = "MIT"
  spec.metadata      = { "lita_plugin_type" => "adapter" }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", ">= 4.8"
  spec.add_runtime_dependency "discordrb", "~> 3.4"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "rspec", ">= 3.0.0"
end
