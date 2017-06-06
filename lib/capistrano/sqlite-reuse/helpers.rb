require "yaml"

module Capistrano
  module SqliteReuse
    module Helpers
      def local_database_yml(env = fetch(:rails_env))
        @local_database_yml ||= YAML.load_file(database_yml_local_path)

        return @local_database_yml[env]
      end

      def database_location
        return local_database_yml()['database']
      end

      def adatpter_type
        return fetch(:adapter_type)
      end

      def check_adapter_error
        puts
        puts "Error - not '#{adapter_type}' adpater type in '#{fetch(:database_yml_local_path)}'."
        puts "May want to remove this gem."
        puts
      end

      def check_config_present_error
        puts
        puts "Error - '#{fetch(:rails_env)}' config not present in '#{fetch(:database_yml_local_path)}'."
        puts "Please populate it."
        puts
      end
    end
  end
end
