require 'rails/generators/rails/resource/resource_generator'
require 'rails/generators/rails/scaffold_controller/scaffold_controller_generator'

module Showbuilder
  module Generators
    class ScaffoldGenerator < Rails::Generators::ResourceGenerator
      remove_hook_for :resource_controller
      remove_class_option :actions
      hook_for :slim, :in => :showbuilder, :as => :scaffold
      #hook_for :scaffold_controller, in: :rails, required: true
    end
  end
end