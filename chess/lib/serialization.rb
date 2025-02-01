# frozen_string_literal: true

require 'yaml'

module Serialization
  def self.save(game, filename)
    File.write(filename, YAML.dump(game))
  end

  def self.load(filename)
    YAML.load_file(filename)
  end
end