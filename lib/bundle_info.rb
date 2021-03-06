require "bundle_info/version"
require 'gemnasium/parser'
require 'gems'
require 'active_support/core_ext/string'
require 'colored'

module BundleInfo
  class CommandLine
    def self.invoke(args)
      if Dir.glob('*.gemspec').any?
        gemspec_path = Dir.glob('*.gemspec').first
        gemspec = File.open(gemspec_path).read
        gems = Gemnasium::Parser::Gemspec.new(gemspec)
      elsif File.exist?('Gemfile')
        gemfile = File.open('Gemfile').read
        gems = Gemnasium::Parser::Gemfile.new(gemfile)
      else
        puts "No Gemfile or .gemspec found in current directory"
        exit
      end
      gems.dependencies.map do |dep|
        info = Gems.info dep.name
        output = "#{dep.name}:".green
        if info && info['info']
          desc = info['info'].gsub(/\n/, ' ')
          output += " #{desc.truncate(80)}"
        end
        puts output
      end
    end
  end
end