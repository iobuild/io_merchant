require 'rails/generators'
require "rails/generators/active_record"

module IoMerchant
  class Install < Rails::Generators::Base
    include Rails::Generators::Migration
    extend ActiveRecord::Generators::Migration

    source_root File.expand_path('../migrations', __FILE__)

    def self.next_migration_number(dir)
      Time.now.utc.strftime("%Y%m%d%H%M%S")
    end


    # Copies the migration template to db/migrate.
    def copy_files(*args)
      migration_template 'cart.rb', "db/migrate/create_io_merchant_cart_tables.rb"
    end

  end
end