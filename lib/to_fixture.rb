require "to_fixture/version"
require "active_support"
require "active_record"

module ToFixture
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
    self.class.column_names - all_timestamp_attributes.map(&:to_s) - %w(id)
  end
end

ActiveSupport.on_load(:active_record) do
  include ToFixture
end
