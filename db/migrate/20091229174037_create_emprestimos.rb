class CreateEmprestimos < ActiveRecord::Migration
  
	def self.up
    create_table :agenda_emprestimos_espacos do |t|
    	t.string			:nome
    	t.references	:espaco
      t.timestamps
    end
  end

  def self.down
    drop_table :agenda_emprestimos_espacos
  end  
  
end
