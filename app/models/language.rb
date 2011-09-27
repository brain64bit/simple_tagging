class Language < ActiveRecord::Base
  has_and_belongs_to_many :users
  
  #scope
  default_scope :order => "languages.english_name asc"
  scope :match_language_english_name, lambda{ |name| {:conditions => ["upper(languages.english_name) LIKE ?", "%#{name.upcase}%"]} }
end
