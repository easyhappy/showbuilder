require 'rails/generators/rails/resource/resource_generator'
require 'rails/generators/rails/scaffold_controller/scaffold_controller_generator'

module Showbuilder
  module Generators
    class ScaffoldGenerator < Rails::Generators::ResourceGenerator
      remove_hook_for :resource_controller
      remove_class_option :actions

      class_option :slim, :default => true
      hook_for     :slim,     :in => :showbuilder
    end
  end
end