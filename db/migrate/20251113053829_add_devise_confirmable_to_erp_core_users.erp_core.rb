# This migration comes from erp_core (originally 20251113053417)
class AddDeviseConfirmableToErpCoreUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :erp_core_users, :confirmation_token, :string
    add_column :erp_core_users, :confirmed_at, :datetime
    add_column :erp_core_users, :confirmation_sent_at, :datetime
    add_column :erp_core_users, :unconfirmed_email, :string

    add_index :erp_core_users, :confirmation_token, unique: true
  end
end
