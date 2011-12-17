module ViewBuilder
  module Builders
    module ModelListBuilderColumns

      class Column
        attr_accessor :methods
        attr_accessor :generate_column_method
      end

      def show_column(methods = nil, &block)
        column = Column.new
        column.methods = methods
        column.generate_column_method = block
        self.columns << column
      end

      def show_text_column(method)
        self.show_method_column(method) do |value|
          self.safe_html_string(value)
        end
      end
      
      def show_time_column(method)
        self.show_method_column(method) do |value|
          self.time_string(value)
        end
      end

      def show_date_column(method)
        self.show_method_column(method) do |value|
          self.date_string(value)
        end
      end

      def show_currency_column(method)
        self.show_method_column(method) do |value|
          self.currency_string(value)
        end
      end

      def show_method_column(method, &block)
        self.show_column(method) do |model|
          self.content_tag(:td) do
            method_value = self.call_object_methods(model, method)
            if block
              content = block.call(method_value)
            else
              content = method_value
            end
            content.to_s
          end
        end
      end
    end
  end
end
