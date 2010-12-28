class CreatePredictions < ActiveRecord::Migration
  def self.up
    create_table :predictions do |t|
      t.string :description
    end
  end

  def self.down
    drop_table :predictions
  end
end
