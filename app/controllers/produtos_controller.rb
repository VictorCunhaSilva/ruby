class ProdutosController < ApplicationController
    def index
        @produtos_nome = Produto.order(:nome).limit 20
    end
    
    def create
        valores = params.require(:produto).permit :nome,:descricao,:preco,:quantidade
        @produto = Produto.new valores
        if @produto.save
            redirect_to root_url
        else
            render :new
        end
    end
    
    def destroy
        id = params[:id]
        Produto.destroy id
        redirect_to root_url
    end
    
    def busca
        @nome_a_buscar = params[:nome]
        @produtos = Produto.where "nome like ?", "%#{@nome_a_buscar}%"
    end
    
    def edit
        id = params[:id]
        @produto = Produto.find(id)
        render :new
    end
    
    def update
        @id = params[:id]
        @produto = Produto.find(id)
        valores = params.require(:produto).permit :nome,:descricao,:preco,:quantidade
        @produto.update valores
        redirect_to root_url
    end
end
