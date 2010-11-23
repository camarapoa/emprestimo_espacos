class LogEvento < ActiveRecord::Base  

  set_table_name :agenda_logs_eventos
  
  #serialize :changes
  
  belongs_to :evento

  named_scope :recentes, lambda { { :conditions => ['updated_at > ?', 1.week.ago], :order => 'evento_id, updated_at DESC' } }
end