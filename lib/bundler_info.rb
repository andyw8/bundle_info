require_relative "bundler_info/version"
require 'gemnasium/parser'
require 'gems'
require 'active_support/core_ext/string'

module BundlerInfo
  class CommandLine
  	def self.invoke(args)
      if args.any?
        target = args.first
      elsif Dir.glob('*.gemspec').any?
        gemspec_path = Dir.glob('*.gemspec').first
        gemspec = File.open(gemspec_path).read
        gems = Gemnasium::Parser::Gemspec.new(gemspec)
      elsif File.exist?('Gemfile')
        gemfile = File.open('Gemfile').read
        gems = Gemnasium::Parser::Gemfile.new(gemfile)
      else
        puts "No Gemfile or gemspec found in current directory"
        exit
      end

      gems.dependencies.map do |dep|
        info = Gems.info dep.name
        puts "#{dep.name}: #{info['info'].truncate(80)}"
      end
    end
  end
end




