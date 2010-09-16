Gem::Specification.new do |s|
  s.name = 'css'
  s.version = '0.0.0'
  s.date = '2010-09-16'

  s.authors = ['George Brocklehurst']
  s.email = 'george.brocklehurst@gmail.com'
  s.homepage = 'http://georgebrock.com'

  s.files = Dir['README.md,{test,lib}/**/*']
  s.require_paths = ['lib']
  s.rubygems_version = '1.3.6'
  s.summary = 'A CSS 2.1 parser'

  s.add_dependency('treetop', '>= 1.4.2')

  s.add_development_dependency('shoulda', '2.10.3')
  s.add_development_dependency('redgreen')
end
