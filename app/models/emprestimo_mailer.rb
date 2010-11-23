class EmprestimoMailer < ActionMailer::Base
	
  ActionMailer::Base.delivery_method       = :smtp
  ActionMailer::Base.raise_delivery_errors = true
  ActionMailer::Base.default_charset       = "UTF-8"

  ActionMailer::Base.smtp_settings = {
#    :address => "10.150.150.165",
 #   :port    => 25,
  #  :domain  => "procempa.com.br"    
    
        
    :address => "cmpa-s03",
    :port    => 25,
    :domain  => "mail.camarapoa.rs.gov.br"    
  }  
  
  def envia_notificacao_administrador_agenda(emprestimo, emails)  	
  	@recipients = emails
    @from = "agenda@camarapoa.rs.gov.br"
    @subject = "Empréstimo de Espaço"
    @body["emprestimo"] = emprestimo    
	end
	
  def notificacao_solicitacao_cancelamento(emprestimo, emails)  	
  	@recipients = emails
    @from = "agenda@camarapoa.rs.gov.br"
    @subject = "SOLICITAÇÃO DE CANCELAMENTO"
    @body["emprestimo"] = emprestimo    
	end	
	
	def notifica_cancelamento(emprestimo, emails)  	
  	@recipients = emails
    @from = "agenda@camarapoa.rs.gov.br"
    @subject = "CANCELAMENTO por usuário"
    @body["emprestimo"] = emprestimo    
	end	

end