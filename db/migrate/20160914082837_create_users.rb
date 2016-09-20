class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.timestamps null: false
      t.string :email, null: false
      t.string :encrypted_password, limit: 128, null: false
      t.string :confirmation_token, limit: 128
      t.string :remember_token, limit: 128, null: false
    end

    add_index :users, :email
    add_index :users, :remember_token
  end
end

# class ChangeRememberTokenToNotNull < ActiveRecord::Migration
#   def change
#     b = []
#     User.all.each { |x| b << x.remember_token }

#     remove_column :users, :remember_token
#     add_column :users, :remember_token, :string, limit: 128

#     User.all.each_with_index { |x, i| x.update(remember_token: b[i]) }

#   end
# end

# class ChangeRememberTokenToNotNull < ActiveRecord::Migration
#   def change
#     b = []
#     User.all.each { |x| b << x.remember_token }

#     remove_column :users, :remember_token
#     add_column :users, :remember_token, :string, limit: 128

#     User.all.each_with_index { |x, i| x.update(remember_token: b[i]) }

#   end
# end
