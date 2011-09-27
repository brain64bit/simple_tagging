class LanguagesController < ApplicationController
	def index
		 term = params[:term]
		 if !term.blank?
		   scope = Language.match_language_english_name(term)
		   
		   @lang = Array.new
		   scope.each{|language|
		     @lang << language.english_name
		   }
		 end
	end
end
