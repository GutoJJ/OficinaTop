class AddDetailsToMecanicos < ActiveRecord::Migration[7.1]
  def change
    add_column :mecanicos, :nome, :string
    add_column :mecanicos, :telefone, :string
    add_column :mecanicos, :especialidade, :string
    add_column :mecanicos, :endereco, :string
  end
end
