class CreateKeymailTokens < ActiveRecord::Migration
  def change
    create_table :keymail_tokens do |t|
      t.string :email
      t.string :url_key
      t.datetime :expires_at

      t.timestamps
    end
  end
end
