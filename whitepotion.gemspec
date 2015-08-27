# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "project/version"

Gem::Specification.new do |spec|
  spec.name          = "whitepotion"
  spec.authors       = ["Benjamin Michotte"]
  spec.email         = ["bmichotte@gmail.com"]
  spec.description   = %q{WhitePotion - Just like RedPotion, but for OS X}
  spec.summary       = %q{WhitePotion - Just like RedPotion, but for OS X. The best combination of RubyMotion tools and libraries for OS X}
  spec.homepage      = "https://github.com/bmichotte/whitepotion"
  spec.license       = "MIT"

  files = []
  files << 'README.md'
  files.concat(Dir.glob('lib/**/*.rb'))
  files.concat(Dir.glob('templates/**/*.rb'))
  spec.files         = files

  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  #spec.executables   << 'bluepotion'
  #spec.executables   << 'bluepotion_add_line_numbers'
  #spec.executables   << 'bluepotion_remove_line_numbers'
  spec.require_paths = ["lib"]
  spec.version       = WhitePotion::VERSION

  spec.add_runtime_dependency "cdq"
  spec.add_runtime_dependency "motion_print"
  spec.add_runtime_dependency "MotionLocalize"
  spec.add_runtime_dependency "rake"
end