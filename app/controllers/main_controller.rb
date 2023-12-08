class MainController < ApplicationController
  def home
    @ordem = Ordem.all
  end
end
