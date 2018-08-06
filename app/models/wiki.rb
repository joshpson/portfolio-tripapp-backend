class Wiki < ApplicationRecord

  def self.getData(id)
    response = Faraday.get("https://www.wikidata.org/w/api.php?action=wbgetclaims&entity=#{id}&property=P18&format=json")
    response.body
  end

end
