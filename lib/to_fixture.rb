require "to_fixture/version"
require "active_support"
require "active_record"

module ToFixture
  module Base
    def to_fixture(label = nil)
      label = "#{self.class.table_name}_#{self.id}" unless label

      inspection = if defined?(@attributes) && @attributes
        columns_for_fixture.collect do |name|
          "  #{name}: #{read_attribute(name)}" if has_attribute?(name)
        end.compact.join("\n")
      else
        "not initialized"
      end

      "#{label}:\n#{inspection}"
    end

    def columns_for_fixture
      timestamp_attributes = if respond_to?(:all_timestamp_attributes_in_model, true)
                               all_timestamp_attributes_in_model
                             else
                               all_timestamp_attributes
                             end
      self.class.column_names - timestamp_attributes.map(&:to_s) - %w(id)
    end
  end

  module Relation
    def to_fixture
      map(&:to_fixture).join("\n\n")
    end
  end
end

ActiveSupport.on_load(:active_record) do
  include ToFixture::Base

  ActiveRecord::Relation.include(ToFixture::Relation)
end
