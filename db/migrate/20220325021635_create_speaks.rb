class CreateSpeaks < ActiveRecord::Migration[6.0]
  def change
    create_table :speaks do |t|

      t.timestamps
    end
  end
end
