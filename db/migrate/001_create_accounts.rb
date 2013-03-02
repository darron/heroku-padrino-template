migration 1, :create_accounts do
  up do
    create_table :accounts do
      column :id, Integer, :serial => true
      column :name, String, :length => 255
      column :surname, String, :length => 255
      column :email, String, :length => 255
      column :crypted_password, String, :length => 255
      column :role, String, :length => 255
    end
  end

  down do
    drop_table :accounts
  end
end
