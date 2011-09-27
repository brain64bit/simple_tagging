class PopulateLanguages < ActiveRecord::Migration
  def self.up
  	 f = File.open("#{Rails.root}/db/data/FacebookLocales.xml")
    doc = Nokogiri::XML(f)
    f.close
    
    languages_country_code = doc.xpath("//representation/text()").to_a
    languages_name = doc.xpath("//englishName/text()").to_a
    
    if languages_country_code.size.eql?(languages_name.size)
      languages_country_code.each_with_index{|locale, index|
        country_code = locale.to_s.slice(3,2).downcase
        english_name = languages_name[index].to_s
        puts "inserting : #{country_code} - #{english_name} into Languages table..."
        Language.create(:country_code => country_code, :english_name => english_name)
      }
    else
      puts "count of languages code and name doesn't match"
    end
  end

  def self.down
  end
end
