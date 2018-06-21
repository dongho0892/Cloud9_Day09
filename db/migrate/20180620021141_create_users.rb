class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|

      t.string :u_id        # user_name으로 바꿔서 진행할 것!!
      t.string :u_password
      t.string :ip_address
      t.timestamps
    end
  end
end
