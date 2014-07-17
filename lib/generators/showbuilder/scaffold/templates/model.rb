class <%= class_name %>
  include <%= Rails.application.class.parent_name %>::BaseMongo
<% attributes.each do |attribute| -%>
  field :<%= attribute.name %>, type: <%= attribute.type.to_s.camelize%>
<% end %>
end