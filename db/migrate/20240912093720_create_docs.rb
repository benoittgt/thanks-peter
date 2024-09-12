class CreateDocs < ActiveRecord::Migration[7.2]
  def change
    create_table :docs do |t|
      t.string :status
      t.string :sender_reference
      t.timestamp :sent_at

      t.timestamps
    end
  end
end
