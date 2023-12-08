class Ordem < ApplicationRecord
  belongs_to :cliente
  belongs_to :equipe
  belongs_to :veiculo
  has_and_belongs_to_many :pecas
end
