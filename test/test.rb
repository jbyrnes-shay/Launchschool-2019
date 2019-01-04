require 'yaml'
messages = YAML.load(File.open('messages.yml'))

p messages['test'].values