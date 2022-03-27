class DoropSpeaks < ActiveRecord::Migration[6.0]
  def change
    drop_table :speaks
  end
end
