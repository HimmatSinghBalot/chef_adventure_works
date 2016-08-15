include_recipe "#{cookbook_name}::enable_windows_features"

include_recipe "#{cookbook_name}::install_sql_server"

include_recipe "#{cookbook_name}::restore_sql_database"

include_recipe "#{cookbook_name}::configure_iis"
