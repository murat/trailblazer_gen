# frozen_string_literal: true

module <%= @module_name.camelize %><% unless @single_contract %>::Contract<% end %>
  class <% if @single_contract %>Contract<% else %><%= @operation %><% end %> < Reform::Form
    # fields
    property :field_1

    # validations
    validates :field_1, presence: true
  end
end
