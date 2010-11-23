class EmprestimosController < ApplicationController
	
	def index
		@emprestimos = Emprestimo.ativos.por_setor(current_lotacao.setor_id) 
		@emprestimos_passados = Emprestimo.encerrados.por_setor(current_lotacao.setor_id) 
	end	
	
	def new
		@espacos = Espaco.emprestaveis 
		@emprestimo = Emprestimo.new			
		@tipos_eventos = TipoEvento.solicitaveis_por_tipo_setor(current_lotacao.setor_id)
		
	end
	
	def create
		@emprestimo = Emprestimo.new(params[:emprestimo])
    @emprestimo.funcionario_solicitante_id = @emprestimo.updated_by = @emprestimo.created_by = current_user.id       
    @emprestimo.data_termino = @emprestimo.data_inicio
    @emprestimo.setor_solicitante_id = current_lotacao.setor.id    
    if @emprestimo.save
    	notifica_administradores(@emprestimo)
      flash[:notice] = "Empréstimo registrado com sucesso"
      redirect_to emprestimos_url
    else
      @espacos = Espaco.emprestaveis
      @tipos_eventos = TipoEvento.solicitaveis_por_tipo_setor(current_lotacao.setor_id)		
      render :new
    end	
	end	
	
	def update
    @emprestimo = Emprestimo.find(params[:id])
    @emprestimo.updated_by = current_user.id
    @emprestimo.status = 'cancelado' if params[:commit] == 'cancelar'
    @emprestimo.status = 'aguardando_cancelamento' if params[:commit] == 'solicitar_cancelamento'    
        
    if @emprestimo.update_attributes(params[:emprestimo])
    	if params[:commit] == 'cancelar'
    		notifica_cancelamento(@emprestimo)
    		flash[:notice] = "Cancelamento efetuado com sucesso!"
  		end
  		if params[:commit] == 'solicitar_cancelamento'
  			notifica_solicitacao_cancelamento(@emprestimo)
  			flash[:notice] = "Solicitação de Cancelamento enviada aos Administradores da Agenda!"
			end  	      
      redirect_to emprestimos_url
    else
       render params[:commit]
    end    
		
	end
	
	def show
		@emprestimo = Emprestimo.find(params[:id])
	end
	
	def cancelar
		@emprestimo = Emprestimo.find(params[:id])
	end
	
	def solicitar_cancelamento
		@emprestimo = Emprestimo.find(params[:id])
	end	
	
private

	def notifica_administradores(emprestimo)	
		begin
			grupo = GrupoAcesso.find_by_mascara("ADMINISTRADOR_AGENDA")
			lotacoes = grupo.lotacoes_temporarias
			emails = lotacoes.collect{|l| l.pessoa.email}
			email = EmprestimoMailer.create_envia_notificacao_administrador_agenda(emprestimo, emails)
	    email.set_content_type 'text/html'
	    EmprestimoMailer.deliver email
		rescue Exception => e			
		end
	end	
	
	def notifica_solicitacao_cancelamento(emprestimo)
		begin
			grupo = GrupoAcesso.find_by_mascara("ADMINISTRADOR_AGENDA")
			lotacoes = grupo.lotacoes_temporarias
			emails = lotacoes.collect{|l| l.pessoa.email}
			email = EmprestimoMailer.create_notificacao_solicitacao_cancelamento(emprestimo, emails)
	    email.set_content_type 'text/html'
	    EmprestimoMailer.deliver email
		rescue Exception => e			
			y e
			raise "problemas no envio da messagem ao administrador #{e}"
		end
	end
	

	
end