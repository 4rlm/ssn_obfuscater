require "ssn_obfuscater/version"

require "ssn_obfuscater/solver"
# require 'mechanizer'
# require 'faker'
require 'pry'

module SsnObfuscater

  def self.parse(args={})
    result_hash = self::Solver.new.parse(args)
  end

end
