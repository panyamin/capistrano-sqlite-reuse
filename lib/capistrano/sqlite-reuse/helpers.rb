require "yaml"

module Capistrano
  module SqliteReuse
    module Helpers
      def local_database_yml(env = fetch(:rails_env))
        env = env.to_s
        @local_database_yml ||= YAML.load_file(database_yml_local_path)

        return @local_database_yml[env]
      end

      def database_location
        return local_database_yml()['database']
      end

      def adapter_type
        return fetch(:adapter_type)
      end

      def check_adapter_error
        return "Error - not '#{adapter_type}' adpater type in '#{fetch(:database_yml_local_path)}'.  May want to remove this gem."
      end

      def check_config_exist_error
        return "Error - '#{fetch(:rails_env)}' config does not exist in '#{fetch(:database_yml_local_path)}'. Please populate it."
      end
    end
  end
end
