# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'asciidoctor-legal/version'

Gem::Specification.new do |s|
  s.name          = "asciidoctor-legal"
  s.version       = Asciidoctor::Legal::VERSION
  s.authors       = ["Horacio Sanson"]
  s.email         = ["hsanson@gmail.com"]
  s.description   = %q{Asciidoctor legal extension}
  s.summary       = %q{Extensions and features tailred at writing legal documents like patents and contracts.}
  s.platform      = $platform
  s.homepage      = "https://github.com/hsanson/asciidoctor-legal"
  s.license       = "MIT"

  begin
    s.files             = `git ls-files -z -- */* {CHANGELOG,LICENSE,README,Rakefile}*`.split "\0"
  rescue
    s.files             = Dir['**/*']
  end
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  s.add_development_dependency "bundler", "~> 1.3"
  s.add_development_dependency "rake", "~> 10.5"
  s.add_development_dependency "nokogiri", "~> 1.6"
  s.add_runtime_dependency "asciidoctor", "~> 1.5"
end
