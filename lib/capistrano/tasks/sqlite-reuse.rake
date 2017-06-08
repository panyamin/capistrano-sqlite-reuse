include Capistrano::SqliteReuse::Paths
include Capistrano::SqliteReuse::Helpers

namespace :load do task :defaults do
    set(:database_yml_local_path, File.join("config", "database.yml"))
    set(:adapter_type, 'sqlite')
  end
end

namespace :sqlite_reuse do
  task :check_config do
    if (false == File.exist?(database_yml_local_path))
      abort("Can't find file '#{database_yml_local_path}'.")
    end

    if (false == local_database_yml.nil?)
      if (true == local_database_yml['adapter'].include?(adapter_type))
        next
      else
        abort("#{check_adapter_error}")
      end
    else
      abort("#{check_config_exist_error}")
    end
  end

  desc 'Check if db exists and move to shared.'
  task :check_db => [:check_config] do
    on release_roles :all do
      db_linked_exists  = test("[ -f #{db_linked_path} ]")
      db_current_exists = test("[ -f #{db_current_path} ]")

      if ((false == db_current_exists) && (false == db_linked_exists))
        next
      else
        if (false == db_linked_exists)
          if (false == test("[ -d #{db_linked_dir} ]"))
            execute(:mkdir, db_linked_dir)
          end

          execute(:cp, db_current_path, db_linked_path)
        end

        append(:linked_files, db_path)
      end
    end
  end
end

before("deploy:check:linked_files", "sqlite_reuse:check_db")
