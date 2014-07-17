require 'rails/generators/erb/scaffold/scaffold_generator'

module Showbuilder
  module Generators
    class SlimGenerator < Erb::Generators::ScaffoldGenerator
      source_root File.expand_path(File.join('..', 'templates'), __FILE__)

      def copy_view_files
        available_views.each do |view|
          filename = filename_with_extensions view
          
          #如果config/showbuilder/xx.html.slim存在， 就使用自定义的文件
          file_path = "#{view}.html.slim"
          custom_file = File.join(Rails.root, 'config/showbuilder/templates', "#{view}.html.slim")
          if File.exist?(custom_file)
            file_path = custom_file
          end

          template file_path, File.join('app', 'views', controller_file_path, filename)
        end
      end

      hook_for :form_builder, :as => :scaffold

      protected
      def available_views
        ['index', 'edit', 'show', 'new', '_form']
      end

      def handler
        :slim
      end
    end
  end
end