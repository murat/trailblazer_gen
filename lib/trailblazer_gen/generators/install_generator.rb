# frozen_string_literal: true

require 'rails/generators'

module TrailblazerGen
  class InstallGenerator < Rails::Generators::Base
    def create_trailblazer_directory
      trailblazer_path = 'app/concepts/'

      create_file "#{trailblazer_path}/.keep"
    end
  end
end
