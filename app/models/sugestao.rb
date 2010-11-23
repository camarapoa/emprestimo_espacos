class Sugestao < ActiveRecord::Base
	
	set_table_name 'agenda_sugestoes'
	
	validates_presence_of :sugestao
end	