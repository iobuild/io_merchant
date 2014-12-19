require 'rails/generators'
require "rails/generators/active_record"

module MerchantSidekick
  class Install < Rails::Generators::Base
    include Rails::Generators::Migration
    extend ActiveRecord::Generators::Migration

    source_root File.expand_path('../migrations', __FILE__)

    # Copies the migration template to db/migrate.
    def copy_files(*args)
      migration_template 'billing.rb', 'db/migrate/create_carts.rb'
    end

  end
end