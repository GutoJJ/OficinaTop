class OrdensController < ApplicationController

     def index
       @ordem = Ordem.all
     end
  
    def show
      @ordem = Ordem.find(params[:id])
    end
  
    def new
      @ordem = Ordem.new
    end
  
    def edit
      @ordem = Ordem.find(params[:id])
    end
  
    def create
      @ordem = Ordem.new(ordem_params)
      if @ordem.save
        redirect_to show_ordem_path(@ordem)
      else
        render :new
      end
    end
  
    def update
      @ordem = Ordem.find(params[:id])
      if @ordem.update(ordem_params)
        redirect_to show_ordem_path(@ordem)
      else
        render :edit
      end
    end
  
    def destroy
      @ordem = Ordem.find(params[:id])
      @ordem.destroy
      redirect_to ordens_path
    end
  
    private
  
    def ordem_params
      params.require(:ordem).permit(:descricao, :data_comeco, :data_termino, :previsao, :valor, :cliente_id, :equipe_id, :veiculo_id, peca_ids: [])
    end
  end