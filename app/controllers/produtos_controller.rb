class ProdutosController < ApplicationController
    def index
        @produtos_nome = Produto.order(:nome).limit 20
        @produtos_preco = Produto.order(:preco).limit 3
    end
    
    def create
        valores = params.require(:produto).permit :nome,:descricao,:preco,:quantidade
        produto = Produto.create valores
        redirect_to root_url
    end
    
    def destroy
        id = params[:id]
        Produto.destroy id
        redirect_to root_url
    end
    
    def edit
        id = params[:id]
        @produto = Produto.find(id)
        render :new
    end
    
    def update
        id = params[:id]
        @produto = Produto.find(id)
        valores = params.require(:produto).permit :nome,:descricao,:preco,:quantidade
        @produto.update valores
        redirect_to root_url
    end
end
