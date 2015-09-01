class AddConfirmableToDevise < ActiveRecord::Migration
 def up
    add_column :hosts, :confirmation_token, :string
    add_column :hosts, :confirmed_at, :datetime
    add_column :hosts, :confirmation_sent_at, :datetime
    # add_column :hosts, :unconfirmed_email, :string # Only if using reconfirmable
    add_index :hosts, :confirmation_token, unique: true
    # User.reset_column_information # Need for some types of updates, but not for update_all.
    # To avoid a short time window between running the migration and updating all existing
    # hosts as confirmed, do the following
    execute("UPDATE hosts SET confirmed_at = date('now')")
    # All existing user accounts should be able to log in after this.
    # Remind: Rails using SQLite as default. And SQLite has no such function :NOW.
    # Use :date('now') instead of :NOW when using SQLite.
    # => execute("UPDATE hosts SET confirmed_at = date('now')")
    # Or => User.all.update_all confirmed_at: Time.now
  end

  def down
    remove_columns :hosts, :confirmation_token, :confirmed_at, :confirmation_sent_at
    # remove_columns :hosts, :unconfirmed_email # Only if using reconfirmable
  end
end
