require 'rails/generators/rails/resource/resource_generator'
require 'rails/generators/rails/scaffold_controller/scaffold_controller_generator'

module Showbuilder
  module Generators
    class ScaffoldGenerator < Rails::Generators::ResourceGenerator
      source_root File.expand_path(File.join('..', 'templates'), __FILE__)

      argument :test, :type => :string, :default => "skip-test-framework"
      remove_hook_for :resource_controller

      remove_class_option :actions

      class_option :slim, :default => true
      hook_for     :slim,                    :in => :showbuilder
    
      def create_controller_file
        template 'controller.rb', File.join('app/controllers', class_path, "#{plural_name}_controller.rb")
      end
    end
  end
end