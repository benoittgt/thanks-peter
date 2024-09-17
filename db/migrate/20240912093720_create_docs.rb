class CreateDocs < ActiveRecord::Migration[7.2]
  disable_ddl_transaction!

  def change
    create_table :docs do |t|
      t.string :status
      t.string :sender_reference
      t.timestamp :sent_at

      t.timestamps
    end

    add_index :docs, [:sender_reference, :status, :sent_at], algorithm: :concurrently
  end
end
