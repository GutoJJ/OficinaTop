class RemoveActiveAddAtivarCodeToMecanicos < ActiveRecord::Migration[6.0]
  def change
    remove_column :mecanicos, :active
    add_column :mecanicos, :ativarCode, :integer, default: 1
  end
end