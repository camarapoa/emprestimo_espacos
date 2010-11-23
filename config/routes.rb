ActionController::Routing::Routes.draw do |map|
	
	
	map.root :controller => 'emprestimos'
	map.connect '/emprestimos/termo_compromisso', :controller => 'emprestimos', :action => 'termo_compromisso'  													  
	map.resources :emprestimos, :has_many => [:mensagens],
  													  :member => { :cancelar => :put, :atender => :put, :finalizar => :put, :solicitar_cancelamento => :put }
  													  
	map.resources :sugestoes
	
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
