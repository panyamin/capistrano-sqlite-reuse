require "pathname"
require "yml"

module Capistrano
  module SqliteReuse
    module Paths
      def database_yml_local_path
        Pathname.new(fetch(:database_yml_local_path))
      end

      def db_path
        return Pathname.new(databse_location())
      end

      def db_linked_path
        return shared_path.join(db_path)
      end

      def db_linked_dir
        return db_linked_path.join('..')
      end

      def db_current_path
        return current_path.join(db_path)
      end
    end
  end
end
