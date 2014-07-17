class <%= class_name %>
  include Reborn::BaseMongo
<% attributes.each do |attribute| -%>
  field :<%= attribute.name %>, type: <%= attribute.type.to_s.camelize%>
<% end %>
end