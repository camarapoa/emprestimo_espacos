class SugestoesController < ApplicationController
	
	def index
	end
	
	def new
		@sugestao = Sugestao.new
	end
	
	def create
		@sugestao = Sugestao.new(params[:sugestao])		
    @sugestao.pessoa_id = current_user.id       
    @sugestao.setor_id = current_lotacao.setor.id
    @sugestao.ip = request.remote_ip     
    @sugestao.sistema = 'emprestimo_espaco'
    if @sugestao.save
    	#notifica_administradores(@emprestimo)
      flash[:notice] = "Mensagem  registrada com sucesso"
      redirect_to sugestoes_url
    else
     
      render :new
    end	
	end
	
	
end