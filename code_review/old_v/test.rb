require 'yaml'

MSGS = YAML.safe_load(File.open('messages.yml'))

p MSGS