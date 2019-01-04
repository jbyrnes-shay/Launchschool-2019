require 'yaml'

MSGS = YAML.safe_load(File.open('yaml_test.yml'))

p MSGS