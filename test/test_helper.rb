$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'to_fixture'

require 'minitest/autorun'

ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: ":memory:")
ActiveRecord::Base.logger = Logger.new(nil)
ActiveRecord::Migration.verbose = false

ActiveRecord::Schema.define do
  create_table :users, force: true do |t|
    t.string :name
    t.string :email

    t.timestamps null: false
  end
end

class User < ActiveRecord::Base
end
