require 'rails/generators/rails/resource/resource_generator'
require 'rails/generators/rails/scaffold_controller/scaffold_controller_generator'

module Showbuilder
  module Generators
    class ScaffoldGenerator < Rails::Generators::ResourceGenerator
      source_root File.expand_path(File.join('..', 'templates'), __FILE__)

      argument :test, :type => :string, :default => "skip-test-framework"
      remove_hook_for :resource_controller
      remove_hook_for :orm

      remove_class_option :actions

      class_option :slim, :default => true
      hook_for     :slim,                    :in => :showbuilder
    
      def create_controller_file
        #如果config/showbuilder/controller.rb存在， 就使用自定义的文件
        file_path = 'controller.rb'
        custom_file = File.join(Rails.root, 'config/showbuilder/templates/controller.rb')
        if File.exist?(custom_file)
          file_path = custom_file
        end
   
        template file_path, File.join('app/controllers', class_path, "#{plural_name}_controller.rb")
      end

      def initialize_base_model_file
        #如果config/showbuilder/base_mongo.rb存在， 就使用自定义的文件
        file_path = 'base_mongo.rb'
        custom_file = File.join(Rails.root, 'config/showbuilder/templates/base_mongo.rb')
        
        if File.exist?(custom_file)
          file_path = custom_file
        end

        unless File.exist?(file_path)
          template file_path, File.join('lib', probject_name.downcase, "base_mongo.rb")
        end
      end

      def create_model_file
        #如果config/showbuilder/model.rb存在， 就使用自定义的文件
        file_path = 'model.rb'
        custom_file = File.join(Rails.root, 'config/showbuilder/templates/model.rb')
        if File.exist?(custom_file)
          file_path = custom_file
        end
        template file_path, File.join('app/models', class_path, "#{singular_name}.rb")
      end

      private
      def probject_name
        Rails.application.class.parent_name
      end
    end
  end
end