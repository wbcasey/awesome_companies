class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :name, null: false, index: { unique: true }
      t.string :subdomain, null: false, index: { unique: true }
      t.references :owner, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
