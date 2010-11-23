class Emprestimo < ActiveRecord::Base
	
	set_table_name :agenda_emprestimos_espacos
	
	formatted_date :data_inicio, :data_termino
	
	belongs_to	:espaco, :class_name => 'Espaco', :foreign_key => 'espaco_id'
	belongs_to	:funcionario_solicitante, :class_name => 'Pessoa', :foreign_key => 'funcionario_solicitante_id'
	belongs_to	:setor_solicitante, :class_name => 'Setor', :foreign_key => 'setor_solicitante_id'	
	
	before_save   { |emprestimo| emprestimo.data_termino = emprestimo.data_inicio } #emprestimo por 1 dia somente

	validates_presence_of :espaco_id, :descricao, :proponente, :contato, :categoria, :tipo_evento_id, :acceptance, :numero_participantes, :necessidades
	validates_presence_of :data_inicio, :horario_inicio, :horario_termino	
	validates_numericality_of	:numero_participantes
	validates_inclusion_of :numero_participantes, :in => 1..400, :message => "precisa estar entre 1 e 500 pessoas"
			
	named_scope	:ativos, 	:conditions => ["agenda_emprestimos_espacos.status <> 'encerrado'  and agenda_emprestimos_espacos.status <> 'cancelado' and agenda_emprestimos_espacos.status <> 'nao_autorizado' and agenda_emprestimos_espacos.status <> 'atendido' and getdate() < CONVERT(VARCHAR(8), data_termino, 112) + ' ' + horario_termino"], :include => ['setor_solicitante','funcionario_solicitante'],  :order => 'created_on desc'	
	named_scope :por_atender, :conditions => {:status => 'por_atender'}
	named_scope :por_setor, lambda { |setor_id| { :conditions => { :setor_solicitante_id => setor_id } } }
	named_scope :encerrados, :conditions => ["agenda_emprestimos_espacos.status = 'nao_autorizado' or agenda_emprestimos_espacos.status = 'cancelado' or agenda_emprestimos_espacos.status = 'atendido' or (getdate() > (CONVERT(VARCHAR(8), data_termino, 112) + ' ' + horario_termino))" ], :include => ['setor_solicitante','funcionario_solicitante'], :order => 'created_on desc'		
	named_scope :periodo_between, lambda { |inicio, termino| { :conditions => ['data_inicio >= ? AND data_termino <= ?', inicio.beginning_of_day, termino.end_of_day] } }
	named_scope :limit, lambda { |num| { :limit => num , :order => "created_on desc"} }
	
	def validate
		inicio, fim = FormattedDate::Conversion.to_datetime("#{data_inicio_before_type_cast} #{horario_inicio}", "#{data_termino_before_type_cast} #{horario_termino}", :format => '%d/%m/%Y %H:%M')
    errors.add_to_base('Período do empréstimo inválido (verifique data e horários de início e término)') if !inicio || !fim || inicio >= fim    
    errors.add_to_base('Justificativa deve ser preenchida em caso de não autorização do empréstimo') if self.status == 'nao_autorizado' && !self.resultado.present?           
    errors.add_to_base('Justificativa dev ser preenchida em caso de cancelamento') if (self.status == 'cancelado' || self.status == 'aguardando_cancelamento') && !self.justificativa_cancelamento.present?           
    
    if inicio && fim && (inicio <= fim) 			
			errors.add_to_base('Espaço já alocado para outro evento no período') if !Espaco.espaco_disponivel?(nil, self, self.espaco, "#{self.data_inicio.strftime('%Y%m%d')} #{self.horario_inicio}"  ,  "#{self.data_termino.strftime('%Y%m%d')} #{self.horario_termino}")
			errors.add_to_base('Solicitação sem antecedência mínima (36 horas antes do início, nas sextas-feiras, 24 horas nos demais dias)') if !antecedencia_minima?		
		end		
		if self.espaco.present? && self.numero_participantes.present?
			errors.add_to_base("Capacidade do local ultrapassada. Máximo de #{espaco.capacidade} participantes") if espaco.capacidade.present? && self.numero_participantes > espaco.capacidade
		end				
		if self.espaco.present? && inicio && fim && (inicio <= fim) 			
			errors.add_to_base('Às terças-feiras, das 8h30min às 19h, as salas de comissões e plenarinho podem ser agendados somente para reuniões de comissões e por funcionários vinculados a elas (Setor e Seção de Comissões e comissões permanentes)')  if Espaco.restricoes_comissoes?(self)
		end	
		
	end
	
	def before_create
		self.status = 'por_atender'		
	end
	
	def status_real		
		# melhorar isso aqui no futuro... existe porque há solicitações expiradas,
		# um status que deveria ser atualizado através de um temporizador
		data = "#{self.data_termino.strftime('%Y%m%d')} #{self.horario_termino}"
		return 'expirado'  if self.status == 'por_atender' && DateTime.now > data.to_datetime
		return self.status
	end
	
	def antecedencia_minima?
		#às sextas-ferias após as 12h, pode-se solicitar espaços para utilização somente 36 horas depois, devido ao final de semana
		#nos demais dias, a antecedencia mínima é de 24 horas		
		if self.new_record?			
			time = DateTime.now			
			wday = time.wday			
			add_days = 3 if wday.to_i == 6
			add_days = 1 if wday.to_i != 6			
			str = time.strftime("%Y-%m-%d %H:%M:%S")
			dia_seguinte = str.to_datetime
			dia_seguinte += 1.days								
			data_solicitada = FormattedDate::Conversion.to_datetime("#{data_inicio_before_type_cast} #{horario_inicio}:00", :format => '%d/%m/%Y %H:%M:%S')															
		  return true if  data_solicitada > dia_seguinte
		  return false	
		else
			#por enquanto, não é possível alterar a data de solicitação do espaço
			return true
		end
	end
	
end
