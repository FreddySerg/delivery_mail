class CreateDeliveries < ActiveRecord::Migration
  def change
    create_table :deliveries do |t|
      t.string  :subject
      t.text    :body
      t.string  :attachment
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
