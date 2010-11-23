ActiveSupport::Inflector.inflections do |inflect|
  inflect.plural     /al$/,  'ais'
  inflect.plural     /ao$/,  'oes'
  inflect.plural     /ão$/,  'ões'
  inflect.plural     /em$/,  'ens'
  inflect.plural     /r$/,   'res'
  inflect.plural     /el$/,  'eis'
  inflect.singular   /ais$/, 'al'
  inflect.singular   /oes$/, 'ao'
  inflect.singular   /ens$/, 'em'
  inflect.singular   /eis$/, 'el'
  inflect.singular   /res$/, 'r'
end  