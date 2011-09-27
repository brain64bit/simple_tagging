module ApplicationHelper

  def language_autocomplete_js(field_id)
    source = languages_index_url
    
    parameter = {
      :autocomplete_url => source,
      :defaultText => '',
      :unique => true
    }
    
    javascript_tag "$(document).ready(function(){
      $(\"\##{field_id}\").tagsInput(#{parameter.to_json}); 
    });"
  end
end
