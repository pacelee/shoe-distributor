class Tablez < ActiveRecord::Migration[5.0]
  def change
    create_table(:shoes) do |t|
      t.column(:brand, :string)
    end

    create_table(:stores) do |t|
      t.column(:name, :string)
      t.column(:location, :string)
    end
  end
end
