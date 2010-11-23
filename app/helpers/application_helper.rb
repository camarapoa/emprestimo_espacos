# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
	
	# Retorna um array com hora:minuto no intervalo de
  # <begin_time> à <end_time> em incrementos de <min_interval>
  # Exemplo: time_intervals '15:45', '19:30', 20
  def time_intervals(begin_time, end_time, min_interval = 30)
    curr_time = Time.parse(begin_time)
    finish_time  = Time.parse(end_time)
    
    finish_time += 1.day if finish_time.hour < curr_time.hour
    
    intervals = []
    while curr_time <= finish_time
      intervals << curr_time.strftime('%H:%M')
      curr_time += min_interval.minutes
    end
    intervals
  end
  
  # Retorna um HTML com as mensagens de flash em suas respectivas divs e ids.
  # O <tt>id</tt> é a chave do hash do parâmetro <tt>flash</tt>.
  def flash_messages(flash)
    flash.inject('') { |contents, (k, v)| contents + content_tag(:div, v, :class => "flash #{k}") }
  end  
	
  def class_by_status(status)
		return "icon icon-error" if status.strip == "por_atender"
		return "icon icon-error" if status.strip == "aguardando_autorizacao_superior"		
		return "icon icon-cancel" if status.strip == "cancelado"
		return "icon icon-cancel" if status.strip == "aguardando_cancelamento"
		return "icon icon-user" if status.strip == "em_atendimento"
		return "icon icon-user" if status.strip == "atendido"
		return "icon icon-tick" if status.strip == "autorizado_por_superior"
		return "icon icon-tick" if status.strip == "encerrado"
		return "icon icon-tick" if status.strip == "negado"
		return "icon icon-cancel" if status.strip == "nao_autorizado"
		return "icon icon-cancel" if status.strip == "expirado"
	end
	
	def auditoria_atualizacao(object)		
		"<div class='auditoria'><i>última atualização às #{object.updated_on.strftime('%H:%M:%S do dia %d/%m/%Y')}, por #{Pessoa.find(object.updated_by).nome}</i></div>"
	end
	
end
