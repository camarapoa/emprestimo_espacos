# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091229174037) do

  create_table "acessos", :force => true do |t|
    t.integer "pessoa_id", :null => false
    t.integer "count",     :null => false
  end

  create_table "acoes", :force => true do |t|
    t.string "nome",       :limit => 50, :null => false
    t.string "controller", :limit => 50
    t.string "titulo",     :limit => 50
  end

  create_table "acoes_sistemas", :id => false, :force => true do |t|
    t.integer "acao_id",    :null => false
    t.integer "sistema_id", :null => false
  end

  create_table "afastamentos", :force => true do |t|
    t.string "nome",      :limit => 200
    t.string "codigo",    :limit => 100
    t.string "tipo",      :limit => 100
    t.text   "descricao"
  end

  create_table "afastamentos_funcionarios", :force => true do |t|
    t.integer  "funcionario_id", :null => false
    t.integer  "afastamento_id", :null => false
    t.datetime "data_inicio",    :null => false
    t.datetime "data_termino"
    t.text     "observacao"
    t.datetime "created_on"
    t.integer  "created_by"
    t.integer  "efetividade_id"
  end

  create_table "agenda_emprestimos_espacos", :force => true do |t|
    t.string   "nome"
    t.integer  "espaco_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "agenda_emprestimos_recursos", :force => true do |t|
    t.integer  "recurso_evento_id",                   :null => false
    t.datetime "data_inicio",                         :null => false
    t.string   "horario_inicio",       :limit => 100, :null => false
    t.datetime "data_termino",                        :null => false
    t.string   "horario_termino",      :limit => 100, :null => false
    t.datetime "created_on",                          :null => false
    t.integer  "created_by",                          :null => false
    t.integer  "quantidade"
    t.text     "justificativa"
    t.datetime "updated_on"
    t.integer  "updated_by"
    t.string   "status",               :limit => 100
    t.integer  "solicitante_id"
    t.text     "mensagem_finalizacao"
  end

  create_table "agenda_emprestimos_recursos_mensagens", :force => true do |t|
    t.text     "mensagem",      :null => false
    t.integer  "created_by",    :null => false
    t.datetime "created_at",    :null => false
    t.integer  "emprestimo_id", :null => false
  end

  create_table "agenda_eventos", :force => true do |t|
    t.integer  "tipo_evento_id",                 :null => false
    t.integer  "local_id"
    t.integer  "processo_id"
    t.string   "titulo",          :limit => 510, :null => false
    t.text     "descricao"
    t.datetime "data_inicio",                    :null => false
    t.string   "horario_inicio",  :limit => 20,  :null => false
    t.datetime "data_termino"
    t.string   "horario_termino", :limit => 20
    t.string   "proponente",      :limit => 200, :null => false
    t.string   "coordenador",     :limit => 200
    t.text     "contato",                        :null => false
    t.string   "documento",       :limit => 100
    t.text     "observacao"
    t.string   "status",          :limit => 100, :null => false
    t.datetime "created_at"
    t.integer  "created_by",                     :null => false
    t.datetime "updated_at"
    t.integer  "updated_by"
    t.string   "categoria",       :limit => 100
    t.datetime "deleted_at"
    t.text     "outro_local"
  end

  create_table "agenda_eventos_assets", :force => true do |t|
    t.integer  "evento_id"
    t.string   "data_file_name",    :limit => 510
    t.string   "data_content_type", :limit => 100
    t.integer  "data_file_size"
    t.datetime "data_updated_at"
  end

  create_table "agenda_eventos_servicos", :force => true do |t|
    t.integer  "servico_id",                        :null => false
    t.integer  "evento_id",                         :null => false
    t.integer  "quantidade"
    t.text     "observacao"
    t.string   "status_notificacao", :limit => 100
    t.datetime "created_at"
    t.integer  "created_by"
    t.datetime "updated_at"
    t.integer  "updated_by"
  end

  create_table "agenda_locais", :force => true do |t|
    t.string  "nome",        :limit => 100, :null => false
    t.string  "complemento", :limit => 100
    t.text    "endereco"
    t.integer "setor_id"
  end

  create_table "agenda_logs_eventos", :force => true do |t|
    t.integer  "evento_id"
    t.text     "changes",                   :null => false
    t.datetime "updated_at"
    t.string   "updated_by", :limit => 100, :null => false
  end

  create_table "agenda_recursos_alocados", :force => true do |t|
    t.integer  "evento_id",                         :null => false
    t.integer  "recurso_evento_id",                 :null => false
    t.integer  "quantidade"
    t.text     "observacao"
    t.string   "status_notificacao", :limit => 100
    t.datetime "created_at"
    t.integer  "created_by"
    t.datetime "updated_at"
    t.integer  "updated_by"
  end

  create_table "agenda_recursos_eventos", :force => true do |t|
    t.integer "setor_responsavel_id",                :null => false
    t.string  "nome",                 :limit => 100, :null => false
    t.string  "tipo",                 :limit => 100, :null => false
    t.text    "emails"
    t.integer "quantidade"
  end

  create_table "agenda_tipo_eventos", :force => true do |t|
    t.string "nome", :limit => 1000, :null => false
  end

  create_table "agenda_tipos_eventos", :force => true do |t|
    t.string "nome",      :limit => 200, :null => false
    t.string "categoria", :limit => 100
  end

  create_table "agenda_tipos_eventos_ciencias", :force => true do |t|
    t.integer "tipo_evento_id", :null => false
    t.integer "setor_id",       :null => false
  end

  create_table "agenda_tipos_eventos_servicos", :force => true do |t|
    t.integer "tipo_evento_id", :null => false
    t.integer "servico_id",     :null => false
  end

  create_table "agendas", :force => true do |t|
    t.integer  "tipo_evento_id",                    :null => false
    t.string   "descricao_evento",  :limit => 2000, :null => false
    t.datetime "data_inicio",                       :null => false
    t.datetime "data_termino",                      :null => false
    t.string   "horario_inicio",    :limit => 10,   :null => false
    t.string   "horario_termino",   :limit => 10,   :null => false
    t.integer  "local_id",                          :null => false
    t.string   "local_complemento", :limit => 1000
    t.string   "proponente",        :limit => 100
    t.string   "orador",            :limit => 100
    t.string   "doc_autorizacao",   :limit => 100
    t.boolean  "dominio",                           :null => false
  end

  create_table "anuncios", :force => true do |t|
    t.string   "titulo",    :limit => 510,                  :null => false
    t.text     "descricao"
    t.datetime "data",                                      :null => false
    t.string   "ativo",     :limit => 2,   :default => "1"
  end

  create_table "assinantes", :force => true do |t|
    t.integer  "created_by"
    t.integer  "updated_by"
    t.string   "nome",          :limit => 200,                    :null => false
    t.string   "uf",            :limit => 100
    t.string   "email",         :limit => 200
    t.string   "celular",       :limit => 100
    t.string   "instituicao",   :limit => 300
    t.string   "cidade",        :limit => 140
    t.boolean  "jornalista",                   :default => false
    t.boolean  "ativo",                        :default => true
    t.boolean  "assinante_sms",                :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "atendimentos", :force => true do |t|
    t.integer  "atendente_id"
    t.integer  "solicitacao_id"
    t.datetime "data_termino"
    t.integer  "avaliacao"
    t.string   "comentarios_avaliacao", :limit => 1000
    t.string   "forma_atendimento",     :limit => 100
    t.string   "solucao",               :limit => 8000
    t.integer  "resp_cad",                              :null => false
    t.datetime "created_on",                            :null => false
    t.integer  "resp_alt",                              :null => false
    t.datetime "updated_on",                            :null => false
  end

  create_table "atos", :force => true do |t|
    t.integer  "tipo_ato_id"
    t.integer  "cargo_id"
    t.integer  "mandato_id"
    t.datetime "data"
    t.datetime "data_inicio"
    t.datetime "data_termino"
    t.string   "processo",         :limit => 100
    t.string   "tipo_afastamento", :limit => 100
    t.integer  "resp_cad"
    t.datetime "created_on"
    t.integer  "resp_alt"
    t.datetime "updated_on"
  end

  create_table "atos_pessoas_primarias", :force => true do |t|
    t.integer "ato_id"
    t.integer "pessoa_id"
  end

  create_table "atos_pessoas_secundarias", :force => true do |t|
    t.integer "ato_id"
    t.integer "pessoa_id"
  end

  create_table "avisos", :force => true do |t|
    t.text     "texto",                                          :null => false
    t.datetime "data",                                           :null => false
    t.integer  "setor_id",                                       :null => false
    t.integer  "pessoa_id",                                      :null => false
    t.string   "status",     :limit => 100, :default => "ativo", :null => false
    t.datetime "created_at",                                     :null => false
    t.integer  "updated_by"
    t.datetime "updated_at"
  end

  create_table "bases_legais", :force => true do |t|
    t.text     "descricao"
    t.integer  "resp_cad"
    t.datetime "created_on"
    t.integer  "resp_alt"
    t.datetime "updated_on"
  end

  create_table "bens_origem_2008", :force => true do |t|
    t.string   "nm_tipobem",   :limit => 200
    t.string   "nm_loc",       :limit => 100
    t.integer  "cd_controle",                 :null => false
    t.integer  "cd_bem"
    t.integer  "cd_tipobem"
    t.integer  "cd_mrcbem"
    t.string   "nr_serbem",    :limit => 100
    t.integer  "cd_propbem"
    t.integer  "cd_grprede"
    t.string   "nm_rede",      :limit => 100
    t.string   "ds_pavbem",    :limit => 100
    t.string   "nr_caborede",  :limit => 20
    t.string   "ds_tipohub",   :limit => 100
    t.string   "nm_localhub",  :limit => 100
    t.integer  "nr_sala"
    t.datetime "cd_cadbem"
    t.string   "ds_obsbem",    :limit => 510
    t.string   "cd_compuserv", :limit => 100
  end

  create_table "cargos", :force => true do |t|
    t.string  "nome",              :limit => 100
    t.string  "categoria",         :limit => 100
    t.integer "quantidade"
    t.string  "codigo",            :limit => 100
    t.string  "nivel",             :limit => 100
    t.integer "pessoalservico_id"
    t.string  "opcional",          :limit => 2
    t.string  "chefe_reparticao",  :limit => 2
    t.string  "chefe_area",        :limit => 2,   :default => "0", :null => false
  end

  create_table "cargosfuncionarios", :force => true do |t|
    t.integer  "pessoa_id"
    t.integer  "cargo_id"
    t.integer  "setor_id"
    t.datetime "data_inicio"
    t.datetime "data_termino"
    t.text     "observacoes"
  end

  create_table "categorias_formularios", :force => true do |t|
    t.string "nome",      :limit => 100, :null => false
    t.text   "descricao"
  end

  create_table "ccsfuncionarios", :force => true do |t|
    t.integer  "pessoa_id",    :null => false
    t.integer  "cargo_id",     :null => false
    t.datetime "data_inicio"
    t.datetime "data_termino"
    t.integer  "setor_id"
    t.text     "observacao"
  end

  create_table "ceps", :force => true do |t|
    t.string   "cep",           :limit => 10
    t.string   "tipologia",     :limit => 20
    t.string   "logradouro",    :limit => 60
    t.string   "bairro_inicio", :limit => 70
    t.string   "bairro_fim",    :limit => 70
    t.string   "cidade",        :limit => 100
    t.string   "uf",            :limit => 2
    t.datetime "created_at"
    t.integer  "created_by"
    t.datetime "updated_at"
    t.integer  "updated_by"
  end

  create_table "chamados", :force => true do |t|
    t.integer  "empresa_id",                              :null => false
    t.datetime "data_abertura"
    t.text     "problema"
    t.datetime "data_saida_equipamento"
    t.datetime "data_retorno_equipamento"
    t.string   "status",                   :limit => 100
    t.datetime "data_encerramento"
    t.text     "solucao"
    t.text     "observacao"
    t.string   "numero_chamado_empresa",   :limit => 100
    t.integer  "solicitacao_id",                          :null => false
    t.integer  "resp_cad"
    t.string   "numero_patrimonio",        :limit => 100
  end

  create_table "codigos", :id => false, :force => true do |t|
    t.integer "ultimo_codigo_movimentacao"
  end

  create_table "constatacoes", :force => true do |t|
    t.text     "texto",                     :null => false
    t.datetime "created_at"
    t.string   "created_by", :limit => 200
    t.string   "ip",         :limit => 100, :null => false
  end

  create_table "contatos_sms", :id => false, :force => true do |t|
    t.integer "telefone_id",  :null => false
    t.integer "grupo_sms_id", :null => false
  end

  create_table "contratos_estagios", :force => true do |t|
    t.string   "numero_contrato",       :limit => 100
    t.string   "remunerado",            :limit => 6
    t.integer  "estagiario_id"
    t.integer  "setor_id"
    t.datetime "inicio"
    t.datetime "fim"
    t.integer  "supervisor_id"
    t.string   "renovado",              :limit => 2
    t.string   "finalizado",            :limit => 2
    t.string   "status",                :limit => 100
    t.integer  "duracao_contrato"
    t.string   "turno",                 :limit => 60
    t.integer  "convenio_id"
    t.integer  "instituicao_ensino_id"
    t.integer  "curso_id"
    t.integer  "created_by"
    t.datetime "created_at"
    t.integer  "updated_by"
    t.datetime "updated_at"
    t.text     "observacao"
  end

  create_table "convenios", :force => true do |t|
    t.string   "nome",         :limit => 200
    t.string   "sigla",        :limit => 40
    t.string   "nome_contato", :limit => 100
    t.string   "telefone",     :limit => 100
    t.string   "observacoes",  :limit => 1000
    t.integer  "created_by"
    t.datetime "created_at"
    t.integer  "updated_by"
    t.datetime "updated_at"
  end

  create_table "cursos", :force => true do |t|
    t.string "nome",      :limit => 510, :null => false
    t.text   "descricao"
    t.string "status",    :limit => 40,  :null => false
  end

  create_table "cursos_ensino", :force => true do |t|
    t.string   "nome",                  :limit => 80
    t.string   "nivel",                 :limit => 100
    t.string   "descricao",             :limit => 1000
    t.integer  "duracao"
    t.integer  "instituicao_ensino_id"
    t.integer  "created_by"
    t.datetime "created_at"
    t.integer  "updated_by"
    t.datetime "updated_at"
  end

  create_table "dacmpacedencias", :force => true do |t|
    t.integer  "pessoa_id",       :null => false
    t.integer  "orgaoexterno_id", :null => false
    t.datetime "data_inicio",     :null => false
    t.datetime "data_fim"
    t.text     "observacoes"
  end

  create_table "demandas_ouvidoria", :force => true do |t|
    t.string   "nome",            :limit => 200
    t.string   "telefone",        :limit => 100
    t.string   "email",           :limit => 100
    t.string   "endereco",        :limit => 400
    t.text     "demanda",                                            :null => false
    t.datetime "created_on",                                         :null => false
    t.integer  "destinatario_id"
    t.string   "status",          :limit => 50,  :default => "nova", :null => false
  end

  create_table "demandas_ouvidoria_atendimentos", :force => true do |t|
    t.integer  "demandas_ouvidoria_id", :null => false
    t.text     "texto",                 :null => false
    t.datetime "created_on"
  end

  create_table "disponibilidades", :force => true do |t|
    t.integer "reparticao_id"
    t.integer "interessado_id"
    t.integer "disponibilizado_id"
    t.text    "justificativa"
    t.string  "created_on",         :limit => 100
  end

  create_table "documentos", :force => true do |t|
    t.string  "type"
    t.string  "filename"
    t.integer "size"
    t.string  "content_type"
    t.integer "documentable_id"
    t.string  "documentable_type"
  end

  create_table "dpf_contratos", :force => true do |t|
    t.integer  "processo_id",                                                   :null => false
    t.integer  "empresa_id",                                                    :null => false
    t.string   "ano",             :limit => 4,                                  :null => false
    t.string   "numero",          :limit => 40,                                 :null => false
    t.string   "categoria",       :limit => 40
    t.string   "situacao",        :limit => 40
    t.text     "objeto"
    t.string   "empresa",         :limit => 140
    t.decimal  "valor",                          :precision => 18, :scale => 2
    t.datetime "data_publicacao"
    t.datetime "data_assinatura"
    t.string   "nota_empenho",    :limit => 400
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "inicio"
    t.datetime "termino"
    t.text     "observacao"
  end

  create_table "dpf_documentos", :force => true do |t|
    t.integer  "contrato_id",                     :null => false
    t.string   "descricao",        :limit => 200
    t.string   "doc_content_type", :limit => 510
    t.string   "doc_file_name",    :limit => 510
    t.string   "doc_file_size",    :limit => 510
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dpf_empresas", :force => true do |t|
    t.string "nome", :limit => 100, :null => false
  end

  create_table "dpf_eventos", :force => true do |t|
    t.integer  "contrato_id",                   :null => false
    t.text     "descricao"
    t.string   "numero",         :limit => 40
    t.string   "numero_empenho", :limit => 600
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "efetividades", :force => true do |t|
    t.integer  "funcionario_id",                        :null => false
    t.integer  "setor_id",                              :null => false
    t.integer  "mes"
    t.integer  "ano"
    t.string   "status",                 :limit => 1
    t.datetime "created_on"
    t.integer  "created_by"
    t.string   "finalizada",             :limit => 1
    t.string   "observacao",             :limit => 510
    t.datetime "updated_on"
    t.integer  "efetividade_enviada_id"
    t.integer  "cumprimento"
    t.integer  "pontualidade"
    t.integer  "assiduidade"
    t.integer  "afastamento"
    t.integer  "punicao"
  end

  create_table "efetividades_enviadas", :force => true do |t|
    t.integer  "setor_id",   :null => false
    t.integer  "created_by", :null => false
    t.datetime "created_on", :null => false
    t.integer  "mes",        :null => false
    t.integer  "ano",        :null => false
  end

  create_table "empresas", :force => true do |t|
    t.string "nome", :limit => 100, :null => false
  end

  create_table "emprestimos_recursos", :force => true do |t|
    t.integer  "recurso_evento_id",                :null => false
    t.datetime "data_inicio",                      :null => false
    t.string   "horario_inicio",    :limit => 100, :null => false
    t.datetime "data_termino",                     :null => false
    t.string   "horario_termino",   :limit => 100, :null => false
    t.datetime "created_on",                       :null => false
    t.integer  "created_by",                       :null => false
  end

  create_table "enderecos", :force => true do |t|
    t.string   "cidade",     :limit => 100, :null => false
    t.string   "logradouro", :limit => 100
    t.string   "bairro",     :limit => 50
    t.string   "cep",        :limit => 50
    t.string   "uf",         :limit => 2
    t.integer  "resp_cad",                  :null => false
    t.datetime "created_on",                :null => false
    t.integer  "resp_alt",                  :null => false
    t.datetime "updated_on",                :null => false
  end

  create_table "equipamentos", :force => true do |t|
    t.integer  "setor_id"
    t.string   "descricao",      :limit => 1000
    t.string   "nro_serie",      :limit => 100
    t.integer  "nro_patrimonio"
    t.string   "nome_rede",      :limit => 100
    t.string   "nro_cabo",       :limit => 20
    t.string   "tipo_hub",       :limit => 40
    t.string   "nome_localhub",  :limit => 30
    t.datetime "baixa"
    t.string   "motivo_baixa",   :limit => 1000
    t.integer  "resp_cad"
    t.string   "created_on",     :limit => 100,  :null => false
    t.integer  "resp_alt"
    t.string   "updated_on",     :limit => 100,  :null => false
    t.integer  "modelo_id"
    t.integer  "fabricante_id"
    t.integer  "tipo_id"
    t.string   "proprietario",   :limit => 50
    t.string   "ip",             :limit => 50
    t.string   "observacao",     :limit => 2000
  end

  create_table "eventos", :force => true do |t|
    t.integer  "tipo_evento_id",                 :null => false
    t.integer  "local_id",                       :null => false
    t.integer  "processo_id"
    t.string   "titulo",          :limit => 510, :null => false
    t.text     "descricao"
    t.datetime "data_inicio",                    :null => false
    t.string   "horario_inicio",  :limit => 20,  :null => false
    t.datetime "data_termino"
    t.string   "horario_termino", :limit => 20
    t.string   "proponente",      :limit => 200, :null => false
    t.string   "coordenador",     :limit => 200
    t.text     "contato",                        :null => false
    t.string   "documento",       :limit => 100
    t.text     "palavras_chave"
    t.text     "observacao"
    t.string   "status",          :limit => 100, :null => false
    t.datetime "created_at"
    t.integer  "created_by",                     :null => false
    t.datetime "updated_at"
    t.integer  "updated_by"
    t.string   "categoria",       :limit => 100
  end

  create_table "eventos_comentarios", :force => true do |t|
    t.text     "texto",      :null => false
    t.integer  "nota"
    t.datetime "created_on", :null => false
    t.integer  "created_by", :null => false
  end

  create_table "eventos_servicos", :force => true do |t|
    t.integer  "servico_id",                        :null => false
    t.integer  "evento_id",                         :null => false
    t.integer  "quantidade"
    t.text     "observacao"
    t.string   "status_notificacao", :limit => 100
    t.datetime "created_at"
    t.integer  "created_by"
    t.datetime "updated_at"
    t.integer  "updaed_by"
  end

  create_table "eventosinscricoes", :force => true do |t|
    t.integer "pessoa_id"
    t.integer "turma_id"
    t.string  "data",      :limit => 100
    t.string  "ip",        :limit => 100
  end

  create_table "fabricantes_equipamento", :force => true do |t|
    t.string "nome", :limit => 500, :null => false
  end

  create_table "fgsfuncionarios", :force => true do |t|
    t.integer  "pessoa_id",                   :null => false
    t.integer  "funcao_id",                   :null => false
    t.string   "descricao",    :limit => 510
    t.datetime "data_inicio"
    t.datetime "data_termino"
    t.integer  "setor_id"
  end

  create_table "formularios", :force => true do |t|
    t.string  "nome",           :limit => 500, :null => false
    t.string  "modelo",         :limit => 100
    t.string  "type",           :limit => 100
    t.string  "filename",       :limit => 500
    t.integer "size"
    t.string  "content_type",   :limit => 100
    t.text    "palavras_chave"
    t.text    "descricao"
  end

  create_table "formularios_categorizados", :force => true do |t|
    t.integer "formulario_id", :null => false
    t.integer "categoria_id",  :null => false
  end

  create_table "formularios_sugestoes", :force => true do |t|
    t.text     "sugestao",                  :null => false
    t.string   "ip",         :limit => 100
    t.datetime "created_on"
  end

  create_table "funcoes", :force => true do |t|
    t.integer "nivel",                                             :null => false
    t.string  "nome",             :limit => 1000,                  :null => false
    t.text    "descricao"
    t.text    "atribuicoes"
    t.string  "tipo",             :limit => 200
    t.string  "chefe_reparticao", :limit => 2,                     :null => false
    t.string  "codigo",           :limit => 30
    t.string  "categoria",        :limit => 100
    t.integer "quantidade"
    t.string  "opcional",         :limit => 2
    t.string  "chefia_area",      :limit => 2,    :default => "0", :null => false
    t.string  "chefe_area",       :limit => 2,    :default => "0", :null => false
  end

  create_table "gits", :force => true do |t|
    t.integer "pessoa_id",                    :null => false
    t.integer "created_by",                   :null => false
    t.integer "mes",                          :null => false
    t.integer "ano",                          :null => false
    t.integer "cumprimento",  :default => 65
    t.integer "assiduidade",  :default => 10
    t.integer "pontualidade", :default => 10
    t.integer "afastamento",  :default => 10
    t.integer "punicao",      :default => 5
  end

  create_table "grupoacessos", :force => true do |t|
    t.string  "nome",       :limit => 50,  :null => false
    t.integer "resp_cad"
    t.string  "created_on", :limit => 50
    t.integer "resp_alt"
    t.string  "updated_on", :limit => 50
    t.string  "mascara",    :limit => 100
  end

  create_table "grupoacessos_lotacoestemporarias", :id => false, :force => true do |t|
    t.integer "lotacoestemporaria_id", :null => false
    t.integer "grupoacesso_id",        :null => false
  end

  create_table "grupoacessos_sistemas", :id => false, :force => true do |t|
    t.integer "grupoacesso_id", :null => false
    t.integer "sistema_id",     :null => false
  end

  create_table "grupos_sms", :force => true do |t|
    t.string   "nome",       :limit => 100, :null => false
    t.integer  "pessoa_id",                 :null => false
    t.datetime "created_at",                :null => false
  end

  create_table "imprensa_activities", :force => true do |t|
    t.integer  "noticia_id"
    t.integer  "funcionario_id"
    t.string   "titulo",         :limit => 200
    t.string   "descricao"
    t.datetime "created_at"
  end

  create_table "imprensa_categorias_noticias", :id => false, :force => true do |t|
    t.integer "categoria_id"
    t.integer "noticia_id"
  end

  create_table "imprensa_imagens", :force => true do |t|
    t.string   "descricao"
    t.string   "iptc_title"
    t.string   "iptc_province"
    t.string   "iptc_editor"
    t.string   "iptc_by_line_title"
    t.string   "iptc_source"
    t.string   "iptc_copyright_notice"
    t.string   "iptc_country_primary_location_name"
    t.string   "iptc_object_name"
    t.string   "iptc_sub_location"
    t.string   "iptc_caption"
    t.string   "iptc_supplemental_category"
    t.string   "iptc_author"
    t.string   "iptc_credit"
    t.string   "iptc_date_created"
    t.string   "iptc_city"
    t.string   "iptc_abstract"
    t.string   "iptc_category"
    t.string   "iptc_by_line"
    t.string   "iptc_headline"
    t.string   "iptc_state"
    t.string   "iptc_caption_writer"
    t.string   "iptc_author_position"
    t.string   "iptc_special_instructions"
    t.string   "iptc_original_transmission_reference"
    t.string   "iptc_keywords"
    t.string   "exif_artist"
    t.integer  "exif_color_space"
    t.string   "exif_components_configuration"
    t.string   "exif_compressed_bits_per_pixel"
    t.integer  "exif_compression"
    t.integer  "exif_contrast"
    t.string   "exif_copyright"
    t.integer  "exif_custom_rendered"
    t.datetime "exif_date_time"
    t.datetime "exif_date_time_digitized"
    t.datetime "exif_date_time_original"
    t.string   "exif_digital_zoom_ratio"
    t.string   "exif_exif_image_length"
    t.string   "exif_exif_image_width"
    t.string   "exif_exif_offset"
    t.string   "exif_exif_version"
    t.string   "exif_exposure_bias_value"
    t.string   "exif_exposure_mode"
    t.string   "exif_exposure_program"
    t.string   "exif_exposure_time"
    t.string   "exif_file_source"
    t.string   "exif_flash"
    t.string   "exif_flash_pix_version"
    t.string   "exif_f_number"
    t.string   "exif_focal_length"
    t.string   "exif_focal_length_in35mm_film"
    t.string   "exif_gain_control"
    t.string   "exif_gps_info"
    t.string   "exif_interoperability_index"
    t.string   "exif_interoperability_offset"
    t.string   "exif_interoperability_version"
    t.string   "exif_iso_speed_ratings"
    t.string   "exif_jpeg_interchange_format"
    t.string   "exif_jpeg_interchange_format_length"
    t.string   "exif_light_source"
    t.string   "exif_make"
    t.string   "exif_maker_note"
    t.string   "exif_max_aperture_value"
    t.string   "exif_metering_mode"
    t.string   "exif_model"
    t.string   "exif_orientation"
    t.string   "exif_resolution_unit"
    t.string   "exif_saturation"
    t.string   "exif_scene_capture_type"
    t.string   "exif_scene_type"
    t.string   "exif_sensing_method"
    t.string   "exif_sharpness"
    t.string   "exif_software"
    t.string   "exif_subject_distance_range"
    t.string   "exif_sub_sec_time"
    t.string   "exif_sub_sec_time_digitized"
    t.string   "exif_sub_sec_time_original"
    t.string   "exif_user_comment"
    t.string   "exif_white_balance"
    t.string   "exif_x_resolution"
    t.string   "exif_y_cb_cr_positioning"
    t.string   "exif_y_resolution"
    t.string   "imagem_file_name"
    t.string   "imagem_content_type"
    t.integer  "imagem_file_size"
    t.datetime "imagem_updated_at"
    t.integer  "resp_cad"
    t.datetime "created_at"
    t.integer  "resp_alt"
    t.datetime "updated_at"
  end

  create_table "imprensa_imagens_noticias", :id => false, :force => true do |t|
    t.integer "imagem_id"
    t.integer "noticia_id"
  end

  create_table "imprensa_noticias", :force => true do |t|
    t.integer  "newsletter_id"
    t.integer  "autor_id"
    t.string   "imagem_id",     :limit => 20
    t.string   "status",        :limit => 200
    t.string   "cartola",       :limit => 200
    t.string   "titulo",        :limit => 400
    t.string   "linha_apoio",   :limit => 800
    t.text     "texto"
    t.datetime "publicacao"
    t.boolean  "manchete"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "resp_cad"
    t.integer  "resp_alt"
    t.string   "layout",        :limit => 50
  end

  create_table "imprensa_noticias_associadas", :id => false, :force => true do |t|
    t.integer "noticia_id"
    t.integer "noticia_associada_id"
  end

  create_table "impressoes_realizadas", :force => true do |t|
    t.integer  "equipamento_id", :null => false
    t.datetime "created_on",     :null => false
    t.integer  "nro_impressoes", :null => false
  end

  create_table "inscricoes_forum_entidades", :force => true do |t|
    t.string   "tipo_instituicao", :limit => 100, :null => false
    t.string   "nome",             :limit => 600, :null => false
    t.string   "email",            :limit => 600, :null => false
    t.text     "endereco",                        :null => false
    t.string   "telefone",         :limit => 100, :null => false
    t.string   "responsavel",      :limit => 600, :null => false
    t.string   "ip",               :limit => 100, :null => false
    t.datetime "created_on",                      :null => false
  end

  create_table "inscritos", :force => true do |t|
    t.string   "nome",                 :limit => 200
    t.string   "rg",                   :limit => 100
    t.string   "cpf",                  :limit => 100
    t.text     "endereco"
    t.string   "instituicao",          :limit => 200
    t.string   "telefone",             :limit => 100
    t.string   "email",                :limit => 100
    t.string   "certificado_online",   :limit => 6
    t.string   "certificado_impresso", :limit => 6
    t.string   "ip",                   :limit => 100
    t.string   "presente",             :limit => 2,   :default => "0"
    t.datetime "created_at"
    t.string   "numero",               :limit => 40
    t.string   "complemento",          :limit => 200
    t.string   "bairro",               :limit => 140
    t.string   "cidade",               :limit => 160
    t.string   "uf",                   :limit => 4
    t.string   "evento",               :limit => 100
  end

  create_table "instituicao_ensinos", :force => true do |t|
    t.string   "nome",        :limit => 120
    t.string   "sigla",       :limit => 100
    t.string   "observacoes", :limit => 1000
    t.integer  "created_by"
    t.datetime "created_at"
    t.integer  "updated_by"
    t.datetime "updated_at"
  end

  create_table "legislativo_anuncios", :force => true do |t|
    t.string   "tipo",               :limit => 1020, :null => false
    t.text     "observacoes"
    t.string   "discussao",          :limit => 1020
    t.string   "encaminhamento",     :limit => 1020
    t.string   "prioritario",        :limit => 12,   :null => false
    t.datetime "created_at"
    t.integer  "created_by"
    t.datetime "update_at"
    t.integer  "update_by"
    t.integer  "projeto_id"
    t.integer  "sessao_plenaria_id",                 :null => false
  end

  create_table "legislativo_comissoes", :force => true do |t|
    t.string   "nome",       :limit => 510, :null => false
    t.string   "sigla",      :limit => 100
    t.string   "tipo",       :limit => 20,  :null => false
    t.datetime "created_at"
    t.integer  "created_by"
    t.datetime "update_at"
    t.integer  "update_by"
  end

  create_table "legislativo_documentosefetividades", :force => true do |t|
    t.string   "doc_content_type"
    t.string   "doc_file_name"
    t.string   "doc_file_size"
    t.datetime "mes_ano"
    t.datetime "created_at"
    t.integer  "created_by"
  end

  create_table "legislativo_historicos_legislaturas", :force => true do |t|
    t.text     "descricao",      :null => false
    t.datetime "created_at"
    t.integer  "created_by"
    t.datetime "update_at"
    t.integer  "update_by"
    t.integer  "legislatura_id", :null => false
  end

  create_table "legislativo_integrantes_comissoes", :force => true do |t|
    t.integer  "ano",                        :null => false
    t.string   "cargo",       :limit => 100
    t.datetime "created_at"
    t.integer  "created_by"
    t.datetime "update_at"
    t.integer  "update_by"
    t.integer  "mandato_id",                 :null => false
    t.integer  "comissao_id",                :null => false
  end

  create_table "legislativo_integrantes_comissoes_representativas", :force => true do |t|
    t.string   "tipo",           :limit => 20, :null => false
    t.integer  "ano",                          :null => false
    t.datetime "created_at"
    t.integer  "created_by"
    t.datetime "update_at"
    t.integer  "update_by"
    t.integer  "mandato_id",                   :null => false
    t.integer  "legislatura_id",               :null => false
  end

  create_table "legislativo_legislaturas", :force => true do |t|
    t.datetime "data_inicio",                   :null => false
    t.datetime "data_termino",                  :null => false
    t.string   "numero",         :limit => 100, :null => false
    t.integer  "nro_vereadores"
    t.integer  "created_by"
    t.datetime "created_at"
    t.integer  "update_by"
    t.datetime "update_at"
  end

  create_table "legislativo_licencas", :force => true do |t|
    t.string   "tipo",                      :limit => 200, :null => false
    t.datetime "data_inicio_licenca",                      :null => false
    t.datetime "data_termino_licenca"
    t.datetime "data_inicio_substituicao",                 :null => false
    t.datetime "data_termino_substituicao"
    t.text     "observacoes"
    t.string   "nro_memorando",             :limit => 100
    t.text     "log_emails"
    t.datetime "created_at"
    t.integer  "created_by"
    t.datetime "update_at"
    t.integer  "update_by"
    t.integer  "vereador_licenciado_id",                   :null => false
    t.integer  "vereador_substituto_id",                   :null => false
    t.integer  "comissao_id",                              :null => false
  end

  create_table "legislativo_liderancas", :force => true do |t|
    t.integer  "ano",                                    :null => false
    t.string   "cargo",                    :limit => 40
    t.datetime "created_at"
    t.integer  "created_by"
    t.datetime "update_at"
    t.integer  "update_by"
    t.integer  "vinculacao_partidaria_id",               :null => false
  end

  create_table "legislativo_mandatos", :force => true do |t|
    t.datetime "data_inicio",                   :null => false
    t.datetime "data_termino",                  :null => false
    t.string   "tipo",           :limit => 100
    t.string   "status",         :limit => 40
    t.datetime "created_at"
    t.integer  "created_by"
    t.datetime "update_at"
    t.integer  "update_by"
    t.integer  "pessoa_id",                     :null => false
    t.integer  "legislatura_id",                :null => false
  end

  create_table "legislativo_mesas_diretoras", :force => true do |t|
    t.string   "cargo",      :limit => 100, :null => false
    t.integer  "ano",                       :null => false
    t.datetime "created_at"
    t.integer  "created_by"
    t.datetime "update_at"
    t.integer  "update_by"
    t.string   "status",     :limit => 100
    t.integer  "mandato_id",                :null => false
  end

  create_table "legislativo_notasdocumentos", :force => true do |t|
    t.string   "doc_content_type"
    t.string   "doc_file_name"
    t.string   "doc_file_size"
    t.datetime "created_at"
    t.integer  "created_by"
    t.datetime "update_at"
    t.integer  "update_by"
    t.integer  "sessao_plenaria_id", :null => false
  end

  create_table "legislativo_representacoes_externas", :force => true do |t|
    t.integer  "nro_ordem",                                 :null => false
    t.datetime "data_inicio_representacao",                 :null => false
    t.datetime "data_termino_representacao",                :null => false
    t.string   "evento",                     :limit => 510, :null => false
    t.string   "local",                      :limit => 510, :null => false
    t.datetime "data_inicio_evento",                        :null => false
    t.datetime "data_termino_evento",                       :null => false
    t.string   "doc_comunicacao",            :limit => 510, :null => false
    t.text     "observacoes"
    t.string   "horario_evento",             :limit => 100
    t.text     "log_emails"
    t.datetime "created_at"
    t.integer  "created_by"
    t.datetime "update_at"
    t.integer  "update_by"
    t.integer  "mandato_id",                                :null => false
  end

  create_table "legislativo_sessoes_plenarias", :force => true do |t|
    t.string   "numero",         :limit => 100, :null => false
    t.string   "horario",        :limit => 200
    t.datetime "data",                          :null => false
    t.integer  "created_by"
    t.datetime "created_at"
    t.integer  "update_by"
    t.datetime "update_at"
    t.string   "tipo",           :limit => 200, :null => false
    t.integer  "legislatura_id",                :null => false
  end

  create_table "legislativo_vinculacoes_partidarias", :force => true do |t|
    t.datetime "data_inicio",                :null => false
    t.datetime "data_termino"
    t.string   "papel",        :limit => 40
    t.datetime "created_at"
    t.integer  "created_by"
    t.datetime "update_at"
    t.integer  "update_by"
    t.integer  "mandato_id",                 :null => false
    t.integer  "partido_id",                 :null => false
  end

  create_table "legislaturas", :force => true do |t|
    t.string   "legislatura",        :limit => 30
    t.string   "sessao_legislativa", :limit => 30
    t.datetime "data_inicio"
    t.datetime "data_termino"
    t.integer  "resp_cad"
    t.datetime "created_on"
    t.integer  "resp_alt"
    t.datetime "updated_on"
  end

  create_table "licitacoes", :force => true do |t|
    t.string   "numero",                     :limit => 100
    t.text     "objeto"
    t.string   "modalidade",                 :limit => 200
    t.datetime "data_abertura"
    t.datetime "data_publicacao"
    t.datetime "data_inicio_recebimento"
    t.datetime "data_limite_recebimento"
    t.datetime "data_inicio_sessao_disputa"
    t.string   "local",                      :limit => 200
    t.integer  "processo_id"
    t.string   "link",                       :limit => 400
    t.string   "criterio_julgamento",        :limit => 200
    t.string   "condicoes_pagamento",        :limit => 200
    t.string   "dotacao_orcamentaria",       :limit => 200
    t.string   "prazo_validade_proposta",    :limit => 200
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "created_in",                 :limit => 100
    t.string   "updated_in",                 :limit => 100
  end

  create_table "licitacoes_documentos", :force => true do |t|
    t.integer  "licitacao_id"
    t.string   "documento_file_name",    :limit => 400
    t.string   "documento_content_type", :limit => 100
    t.integer  "documento_file_size"
    t.datetime "updated_at"
  end

  create_table "lotacoes", :force => true do |t|
    t.datetime "data_inicio"
    t.datetime "data_termino"
    t.integer  "funcao_id"
    t.integer  "pessoa_id",                    :null => false
    t.integer  "setor_id",                     :null => false
    t.integer  "cargo_id"
    t.string   "observacao",   :limit => 6000
    t.integer  "created_by"
    t.datetime "created_at"
    t.integer  "updated_by"
    t.datetime "updated_at"
  end

  create_table "lotacoes_equipamentos", :force => true do |t|
    t.integer  "equipamento_id",                 :null => false
    t.string   "setor_id",       :limit => 20,   :null => false
    t.datetime "data_entrada",                   :null => false
    t.datetime "data_saida"
    t.integer  "resp_cad"
    t.datetime "created_at",                     :null => false
    t.string   "observacao",     :limit => 5000
  end

  create_table "lotacoestemporarias", :force => true do |t|
    t.integer  "pessoa_id",  :null => false
    t.integer  "setor_id",   :null => false
    t.datetime "inicio",     :null => false
    t.datetime "fim"
    t.integer  "resp_cad"
    t.datetime "created_on"
    t.integer  "resp_alt"
    t.datetime "updated_on"
  end

  create_table "mandatos", :force => true do |t|
    t.integer  "pessoa_id"
    t.integer  "legislatura_id"
    t.string   "ata",            :limit => 30
    t.string   "cargo",          :limit => 200
    t.integer  "resp_cad"
    t.datetime "created_on"
    t.integer  "resp_alt"
    t.datetime "updated_on"
  end

  create_table "mensagens", :force => true do |t|
    t.integer  "autor_id",       :null => false
    t.integer  "solicitacao_id", :null => false
    t.text     "descricao"
    t.integer  "resp_cad",       :null => false
    t.datetime "created_on",     :null => false
    t.integer  "resp_alt",       :null => false
    t.datetime "updated_on",     :null => false
  end

  create_table "mensagens_sms", :force => true do |t|
    t.integer  "remetente_id",                :null => false
    t.string   "texto",                       :null => false
    t.datetime "created_at",                  :null => false
    t.string   "de",           :limit => 100
  end

  create_table "mensagens_sms_enviadas", :force => true do |t|
    t.integer  "mensagem_sms_id",                 :null => false
    t.integer  "telefone_id",                     :null => false
    t.string   "status",          :limit => 3000
    t.datetime "created_at",                      :null => false
  end

  create_table "modelos_equipamento", :force => true do |t|
    t.string "nome", :limit => 1000, :null => false
  end

  create_table "movimentacoesinternas", :force => true do |t|
    t.integer "reparticao_id",                             :null => false
    t.integer "interessado_id",                            :null => false
    t.integer "destino_id",                                :null => false
    t.integer "funcionario_movimentado_id",                :null => false
    t.string  "created_on",                 :limit => 100
    t.text    "justificativa",                             :null => false
  end

  create_table "newsletter_assinaturas", :force => true do |t|
    t.integer "assinante_id"
    t.integer "categoria_id"
  end

  create_table "newsletter_categorias", :force => true do |t|
    t.integer  "created_by"
    t.integer  "updated_by"
    t.string   "nome",       :limit => 200
    t.string   "descricao",  :limit => 200
    t.string   "ativa",      :limit => 1,   :default => "1"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status",     :limit => 100
  end

  create_table "newsletter_categorias_noticias", :id => false, :force => true do |t|
    t.integer "categoria_id"
    t.integer "noticia_id"
  end

  create_table "newsletter_envios", :force => true do |t|
    t.integer  "assinante_id",  :null => false
    t.integer  "newsletter_id", :null => false
    t.boolean  "enviado"
    t.integer  "created_by"
    t.datetime "created_at"
  end

  create_table "newsletter_envios_noticias", :id => false, :force => true do |t|
    t.integer "envio_id"
    t.integer "noticia_id"
  end

  create_table "newsletter_newsletters", :force => true do |t|
    t.integer  "created_by"
    t.datetime "created_at"
  end

  create_table "novosites", :force => true do |t|
    t.text     "sugestao",   :null => false
    t.datetime "created_on"
    t.text     "contato"
  end

  create_table "orgaosexternos", :force => true do |t|
    t.string "nome",     :limit => 510, :null => false
    t.string "telefone", :limit => 510
  end

  create_table "paracmpacedencias", :force => true do |t|
    t.integer  "pessoa_id",       :null => false
    t.integer  "orgaoexterno_id", :null => false
    t.datetime "data_inicio",     :null => false
    t.datetime "data_fim"
    t.text     "observacoes"
  end

  create_table "partidos", :force => true do |t|
    t.string "nome",   :limit => 200
    t.string "sigla",  :limit => 20
    t.string "frente", :limit => 100
  end

  create_table "pesquisaorganizacional", :force => true do |t|
    t.integer "pessoa_id",                                                 :null => false
    t.string  "created_on",               :limit => 50,                    :null => false
    t.string  "data_termino",             :limit => 50
    t.integer "carga_horaria"
    t.text    "sugestoes"
    t.text    "comentario_carga_horaria"
    t.string  "funcionario_unico",        :limit => 100, :default => "NN", :null => false
    t.integer "setor_id"
  end

  create_table "pessoalservicos", :force => true do |t|
    t.string "nome", :limit => 510, :null => false
  end

  create_table "pessoas", :force => true do |t|
    t.string   "nome",                  :limit => 510,                      :null => false
    t.string   "nome_parlamentar",      :limit => 200
    t.string   "email",                 :limit => 200
    t.string   "status",                :limit => 20,  :default => "ativo"
    t.integer  "endereco_id"
    t.integer  "setor_id"
    t.integer  "cargo_id"
    t.string   "matricula",             :limit => 510
    t.string   "usuario",               :limit => 100
    t.text     "senha"
    t.text     "senha_salt"
    t.text     "senha_hash"
    t.text     "foto"
    t.string   "rg",                    :limit => 20
    t.string   "cpf",                   :limit => 100
    t.string   "carteira_orgao_classe", :limit => 100
    t.string   "habilitacao",           :limit => 100
    t.string   "type",                  :limit => 100
    t.string   "tipo_funcionario",      :limit => 510
    t.string   "orgao_origem_ad",       :limit => 510
    t.string   "escolaridade",          :limit => 510
    t.string   "nivel_instrucao",       :limit => 510
    t.integer  "funcao_id"
    t.string   "nivel_estagio",         :limit => 100
    t.string   "curso_estagiario",      :limit => 100
    t.string   "telefone",              :limit => 100
    t.string   "celular",               :limit => 100
    t.string   "website",               :limit => 200
    t.text     "observacoes"
    t.datetime "created_at"
    t.datetime "data_nascimento"
    t.string   "mae",                   :limit => 200
    t.string   "pai",                   :limit => 200
    t.string   "naturalidade",          :limit => 160
    t.string   "grupo_sanguineo",       :limit => 6
    t.string   "ddd",                   :limit => 30
    t.string   "sexo",                  :limit => 2
    t.string   "endereco",              :limit => 300
    t.string   "numero",                :limit => 40
    t.string   "complemento",           :limit => 200
    t.string   "bairro",                :limit => 140
    t.string   "cidade",                :limit => 160
    t.string   "uf",                    :limit => 4
    t.integer  "created_by"
    t.datetime "updated_at"
    t.integer  "updated_by"
    t.string   "cep",                   :limit => 100
    t.string   "indicacao",             :limit => 50
    t.text     "observacao"
    t.string   "fax",                   :limit => 100
  end

  create_table "presidentescomissoes", :force => true do |t|
    t.integer  "comissao_id", :null => false
    t.integer  "vereador_id", :null => false
    t.datetime "data_inicio", :null => false
  end

  create_table "processoeletronicodocumentos", :force => true do |t|
    t.integer "processo_id",                 :null => false
    t.string  "tipo",        :limit => 50,   :null => false
    t.integer "pai_id"
    t.string  "created_on",  :limit => 100,  :null => false
    t.string  "nome",        :limit => 100,  :null => false
    t.integer "ordem"
    t.integer "resp_cad"
    t.string  "titulo",      :limit => 100
    t.integer "relator"
    t.string  "resultado",   :limit => 1000
  end

  create_table "processos", :force => true do |t|
    t.string   "numero",             :limit => 15,  :null => false
    t.string   "ano",                :limit => 5,   :null => false
    t.string   "tipo_sigla",         :limit => 10
    t.string   "tipo_descricao",     :limit => 70
    t.string   "categoria",          :limit => 20
    t.integer  "sessao_legislativa"
    t.integer  "materia"
    t.text     "ementa"
    t.string   "situacao",           :limit => 100
    t.string   "situacao_plenaria",  :limit => 100
    t.string   "setor",              :limit => 100
    t.datetime "data_abertura"
    t.datetime "data_tramitacao"
    t.text     "autores"
  end

  create_table "qualidades", :force => true do |t|
    t.text     "conhecimento_acoes"
    t.text     "forma_informacao"
    t.text     "periodicidade"
    t.text     "meio_novidade"
    t.text     "expectativa"
    t.text     "novidades"
    t.integer  "pessoa_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status",             :limit => 100
  end

  create_table "ramais", :force => true do |t|
    t.integer "setor_id",                   :null => false
    t.string  "numero",     :limit => 40,   :null => false
    t.string  "tipo",       :limit => 40
    t.string  "observacao", :limit => 1000
  end

  create_table "registro_necessidades", :force => true do |t|
    t.integer  "pessoa_id",   :null => false
    t.integer  "setor_id",    :null => false
    t.text     "necessidade", :null => false
    t.datetime "created_on",  :null => false
    t.datetime "updated_on"
  end

  create_table "relotacoes", :force => true do |t|
    t.integer "interessado_id",                       :null => false
    t.integer "reparticao_id",                        :null => false
    t.integer "reparticao_atual_id",                  :null => false
    t.integer "unidade_atual_id",                     :null => false
    t.integer "reparticao_destino_id",                :null => false
    t.integer "unidade_destino_id",                   :null => false
    t.integer "relotado_id",                          :null => false
    t.string  "created_on",            :limit => 100
    t.text    "justificativa",                        :null => false
  end

  create_table "relotacoespermutas", :force => true do |t|
    t.integer "interessado_id",                       :null => false
    t.integer "reparticao_atual_id",                  :null => false
    t.integer "unidade_atual_id",                     :null => false
    t.integer "reparticao_destino_id",                :null => false
    t.integer "unidade_destino_id",                   :null => false
    t.integer "permutado_id",                         :null => false
    t.text    "justificativa",                        :null => false
    t.string  "created_on",            :limit => 100
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :limit => 510
    t.text     "data"
    t.datetime "updated_at"
  end

  create_table "sessoes_plenarias", :force => true do |t|
    t.datetime "data"
    t.integer  "numero"
    t.string   "tipo",       :limit => 100
    t.integer  "resp_cad"
    t.datetime "created_on"
    t.integer  "resp_alt"
    t.datetime "updated_on"
  end

  create_table "setor_performance", :force => true do |t|
    t.integer "setor_id"
    t.string  "querem_podem",       :limit => 100, :default => "0"
    t.string  "querem_naopodem",    :limit => 100, :default => "0"
    t.string  "naoquerem_podem",    :limit => 100, :default => "0"
    t.string  "naoquerem_naopodem", :limit => 100, :default => "0"
    t.text    "justificativa"
  end

  create_table "setor_recursos_humanos", :force => true do |t|
    t.string  "tipo",       :limit => 100
    t.integer "quantidade"
    t.integer "cargo_id"
    t.integer "funcao_id"
    t.string  "curso",      :limit => 200
    t.text    "atividades"
    t.integer "setor_id"
  end

  create_table "setor_recursos_tecnologicos", :force => true do |t|
    t.integer "setor_id"
    t.string  "suficiente",    :limit => 2, :default => "0"
    t.text    "justificativa",              :default => "N"
  end

  create_table "setor_visao_futuro", :force => true do |t|
    t.string  "potencializacao_capacitacao",    :limit => 2
    t.string  "potencializacao_informatizacao", :limit => 2
    t.string  "potencializacao_qualidade",      :limit => 2
    t.text    "potencializacao_sugestao"
    t.string  "crescimento",                    :limit => 40
    t.text    "crescimento_outro"
    t.string  "futuro_informatizado",           :limit => 2
    t.string  "futuro_continuidade",            :limit => 2
    t.text    "futuro_outra"
    t.integer "querem_podem",                                 :default => 0
    t.integer "querem_naopodem",                              :default => 0
    t.integer "naoquerem_podem",                              :default => 0
    t.integer "naoquerem_naopodem",                           :default => 0
    t.integer "setor_id"
  end

  create_table "setoratribuicoes", :force => true do |t|
    t.text    "descricao",                                                   :null => false
    t.text    "observacao"
    t.integer "setor_id",                                                    :null => false
    t.string  "tipo",                  :limit => 60,  :default => "NFORMAL", :null => false
    t.string  "frequencia_desempenho", :limit => 100
    t.string  "absorcao_mensal",       :limit => 100, :default => "0"
    t.integer "relevancia",                           :default => 0
  end

  create_table "setoratribuicoes_back", :force => true do |t|
    t.text    "descricao",                                                   :null => false
    t.text    "observacao"
    t.integer "setor_id",                                                    :null => false
    t.string  "tipo",                  :limit => 60,  :default => "NFORMAL", :null => false
    t.string  "frequencia_desempenho", :limit => 100
    t.string  "absorcao_mensal",       :limit => 100, :default => "0"
    t.integer "relevancia",                           :default => 0
  end

  create_table "setores", :force => true do |t|
    t.string   "nome",                :limit => 50,  :null => false
    t.string   "status",              :limit => 30,  :null => false
    t.integer  "setor_id"
    t.integer  "cod_almox",                          :null => false
    t.string   "email",               :limit => 100
    t.string   "tipo_setor",          :limit => 30,  :null => false
    t.string   "predio",              :limit => 10
    t.string   "pavimento",           :limit => 10
    t.string   "nro_sala",            :limit => 10
    t.string   "reparticao",          :limit => 1,   :null => false
    t.string   "sigla",               :limit => 30
    t.string   "formal",              :limit => 2
    t.integer  "parent_id"
    t.text     "observacoes"
    t.text     "atribuicao"
    t.text     "servicos_externos"
    t.text     "conteudo_externo"
    t.string   "presta_servico",      :limit => 3
    t.text     "conteudo_interno"
    t.string   "website",             :limit => 600
    t.text     "imagem_file_name"
    t.text     "imagem_content_type"
    t.integer  "imagem_file_size"
    t.datetime "updated_at"
    t.integer  "updated_by"
  end

  create_table "setornormas", :force => true do |t|
    t.integer "setor_id"
    t.integer "desatualizacao"
    t.integer "ineficacia"
    t.integer "consolidacao"
    t.text    "outras"
    t.string  "satisfatoria",   :limit => 2
  end

  create_table "sisprotwebs", :force => true do |t|
    t.text     "sugestao",   :null => false
    t.datetime "created_on"
    t.text     "contato"
  end

  create_table "sistemas", :force => true do |t|
    t.string  "controller", :limit => 100
    t.string  "created_on", :limit => 100,                      :null => false
    t.text    "descricao"
    t.string  "host",       :limit => 100
    t.string  "image_name", :limit => 100
    t.string  "mascara",    :limit => 50
    t.string  "modulo",     :limit => 100
    t.string  "nome",       :limit => 100,                      :null => false
    t.string  "porta",      :limit => 100
    t.integer "resp_cad",                                       :null => false
    t.integer "resp_alt",                                       :null => false
    t.string  "status",     :limit => 100, :default => "ativo", :null => false
    t.string  "updated_on", :limit => 100,                      :null => false
    t.string  "url",        :limit => 400
  end

  create_table "solicitacaolotacoes", :force => true do |t|
    t.integer "quantidade",                    :null => false
    t.integer "cargo_id",                      :null => false
    t.string  "created_on",     :limit => 100, :null => false
    t.integer "interessado_id",                :null => false
    t.integer "destino_id",                    :null => false
    t.integer "reparticao_id",                 :null => false
    t.text    "justificativa",                 :null => false
  end

  create_table "solicitacoes", :force => true do |t|
    t.integer  "funcionario_id",               :null => false
    t.integer  "setor_id",                     :null => false
    t.integer  "equipamento_id"
    t.integer  "nro_patrimonio"
    t.text     "descricao"
    t.string   "tipo_problema",  :limit => 40
    t.string   "status",         :limit => 40
    t.integer  "resp_cad",                     :null => false
    t.datetime "created_on",                   :null => false
    t.integer  "resp_alt",                     :null => false
    t.datetime "updated_on",                   :null => false
  end

  create_table "sugestoes", :force => true do |t|
    t.text     "descricao",  :null => false
    t.integer  "resp_cad",   :null => false
    t.datetime "created_on", :null => false
  end

  create_table "sysdiagrams", :id => false, :force => true do |t|
    t.string  "name",         :limit => 256, :null => false
    t.integer "principal_id",                :null => false
    t.integer "diagram_id",                  :null => false
    t.integer "version"
    t.binary  "definition"
  end

  create_table "telefones", :force => true do |t|
    t.integer "codigo_area",               :null => false
    t.string  "numero",      :limit => 50, :null => false
    t.string  "tipo",        :limit => 50, :null => false
    t.string  "padrao",      :limit => 1,  :null => false
    t.integer "pessoa_id",                 :null => false
  end

  create_table "tipos_atos", :force => true do |t|
    t.integer  "base_legal_id"
    t.string   "verbo",         :limit => 100
    t.integer  "resp_cad"
    t.datetime "created_on"
    t.integer  "resp_alt"
    t.datetime "updated_on"
  end

  create_table "tipos_equipamento", :force => true do |t|
    t.string "nome", :limit => 500, :null => false
  end

  create_table "torpedo_grupos_assinantes_sms", :force => true do |t|
    t.integer "grupo_sms_id", :null => false
    t.integer "assinante_id", :null => false
  end

  create_table "torpedo_grupos_sms", :force => true do |t|
    t.string   "nome",       :limit => 510
    t.text     "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "torpedo_torpedos", :force => true do |t|
    t.text     "mensagem",      :null => false
    t.text     "destinatarios", :null => false
    t.datetime "created_at",    :null => false
    t.integer  "created_by",    :null => false
  end

  create_table "torpedos", :force => true do |t|
    t.integer  "created_by",    :null => false
    t.text     "mensagem",      :null => false
    t.text     "destinatarios", :null => false
    t.datetime "created_at"
  end

  create_table "torpedos_enviados", :force => true do |t|
    t.integer  "torpedo_id", :null => false
    t.datetime "created_at"
  end

  create_table "turmas", :force => true do |t|
    t.datetime "data_inicio",                    :null => false
    t.datetime "data_termino",                   :null => false
    t.string   "horario_inicio",  :limit => 100, :null => false
    t.string   "horario_termino", :limit => 100, :null => false
    t.integer  "numero_vagas",                   :null => false
    t.string   "status",          :limit => 100, :null => false
    t.integer  "evento_id",                      :null => false
    t.text     "local"
  end

  create_table "veiculos", :force => true do |t|
    t.string   "status",      :limit => 20
    t.string   "marca",       :limit => 200, :null => false
    t.string   "modelo",      :limit => 200, :null => false
    t.string   "placa",       :limit => 20
    t.integer  "ano"
    t.text     "observacoes"
    t.integer  "resp_cad",                   :null => false
    t.datetime "created_on",                 :null => false
    t.integer  "resp_alt",                   :null => false
    t.datetime "updated_on",                 :null => false
  end

  create_table "vereadores_partidos", :force => true do |t|
    t.integer  "pessoa_id"
    t.integer  "partido_id"
    t.datetime "data_inicio"
    t.datetime "data_termino"
    t.string   "lider",        :limit => 2, :default => "0", :null => false
  end

  create_table "vereadoresbancadas", :force => true do |t|
    t.integer  "bancada_id",  :null => false
    t.integer  "gabinete_id", :null => false
    t.datetime "data_inicio"
  end

  create_table "votacoes", :force => true do |t|
    t.integer "sessao_plenaria_id"
    t.integer "processo_id"
    t.string  "tipo",               :limit => 100
    t.string  "resultado",          :limit => 100
    t.string  "descricao",          :limit => 2000
  end

  create_table "votos", :force => true do |t|
    t.integer  "votacao_id"
    t.integer  "vereador_id"
    t.string   "voto",        :limit => 100
    t.integer  "resp_cad"
    t.datetime "created_on"
    t.integer  "resp_alt"
    t.datetime "updated_on"
  end

end
