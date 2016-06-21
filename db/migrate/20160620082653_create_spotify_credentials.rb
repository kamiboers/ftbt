class CreateSpotifyCredentials < ActiveRecord::Migration
  def change
    create_table :spotify_credentials do |t|
      t.string :uid
      t.string :token
      t.string :refresh_token
      t.string :expiration_date
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
