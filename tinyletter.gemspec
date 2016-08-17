# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'tinyletter/version'

Gem::Specification.new do |spec|
  spec.name = 'tinyletter'
  spec.version = Tinyletter::VERSION
  spec.date = '2016-08-17'
  spec.summary = 'Retrieves the metadata of a given tinyletter.'
  spec.description = 'Retrieves the metadata of a given tinyletter.'
  spec.authors = ['Javier Arce']
  spec.email = 'javierarce@gmail.com'
  spec.homepage = 'https://github.com/javierarce/tinyletter'
  spec.license = 'MIT'

  spec.files = Dir['README.md', 'lib/**/{*,.[a-z]*}']
  spec.executables << 'tinyletter'
  spec.require_paths = ['lib']

  spec.required_ruby_version = '~> 2.1'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'byebug', '~> 3.5', '>= 3.5.1'
  spec.add_development_dependency 'rubocop', '~> 0.39.0'

  spec.add_dependency 'mechanize', '~> 2.7.4', '>= 2.7.4'
end
