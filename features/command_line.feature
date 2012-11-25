@announce @no-clobber
Feature: Command line

  @gemfile
  Scenario: Valid Gemfile
    Given a file named "Gemfile" with:
      """
      source 'https://rubygems.org'

      group :development do
        gem 'awesome_print', '~> 1.0.2'
        gem 'benchmark-ips', '~> 1.2.0'
        gem 'pry', '~> 0.9.10'
        gem 'rake', '~> 0.9.2.2'
        gem 'mass_assignment_guard' # yanked gem
      end

      group :test do
        gem 'guard-minitest', '~> 0.5.0'
        gem 'minitest', '~> 3.3.0'
        gem 'rack-test', '~> 0.6.1'
        gem 'turn', '~> 0.9.6'
        gem 'i_dont_exist'
      end
      """
    When I run `bundle_info`
    Then the output should contain exactly:
      """
      awesome_print: Great Ruby dubugging companion: pretty print Ruby objects to visualize their ...
      benchmark-ips: A iterations per second enhancement to Benchmark
      pry: An IRB alternative and runtime developer console
      rake: Rake is a Make-like program implemented in Ruby. Tasks and dependencies aresp...
      mass_assignment_guard:
      guard-minitest: Guard::Minitest automatically run your tests with MiniTest framework (much li...
      minitest: minitest provides a complete suite of testing facilities supporting TDD, BDD,...
      rack-test: Rack::Test is a small, simple testing API for Rack apps. It can be used on it...
      turn: Turn provides a set of alternative runners for MiniTest, both colorful and in...
      i_dont_exist:

      """