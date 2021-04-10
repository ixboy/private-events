class AddVenueToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :venue, :string
  end
end
