# frozen_string_literal: true

require 'rails/generators'

module TrailblazerGen
  class OperationGenerator < Rails::Generators::NamedBase
    source_root File.expand_path('templates', __dir__)

    argument :operations,
             type: :array,
             default: %w[create],
             banner: 'create update destroy'

    class_option :'single-contract', type: :boolean, default: true

    def create_operation_files
      @module_name = name

      trailblazer_path = 'app/concepts/'
      module_path = "#{trailblazer_path}#{@module_name.underscore}/"
      operation_path = "#{module_path}operation/"

      operations.each do |operation|
        @single_contract = options[:'single-contract']
        @operation = operation.camelize

        operation_file = "#{operation_path}#{operation.underscore}.rb"
        template 'operation_template.rb', operation_file

        contract_file = if @single_contract
                          "#{module_path}/contract.rb"
                        else
                          "#{module_path}contract/#{operation.underscore}.rb"
                        end
        template 'contract_template.rb', contract_file
      end
    end
  end
end
