class RemovePubsFromMicroposts < ActiveRecord::Migration[5.0]
  def change
    remove_reference :microposts, :pubs, foreign_key: true
  end
end