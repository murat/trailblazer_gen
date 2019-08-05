# frozen_string_literal: true

module <%= @module_name.camelize %>::Operation
  class <%= @operation %> < Trailblazer::Operation
    step Model(<%= @module_name.camelize %>, <% if @operation == 'Create' %>:new<% else %>:find<% end %>)
    step Contract::Build(constant: <%= @module_name.camelize %><% if @single_contract %>::Contract<% else %>::Contract::<%= @operation %><% end %>)
    step Contract::Validate()
    step Contract::Persist()
  end
end
