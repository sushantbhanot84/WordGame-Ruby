require 'HTTParty'

module GatherData
  include HTTParty

  def get_data(symbol,word='!')
    begin
      middle_url=Config[:API_URL][symbol]
      #fetching middle url value from the Config hash
      unless word=='!'
        middle_url.sub!('{word}',word)
      end
      response=HTTParty.get(Config[:API_URL][:HOST_URL]+middle_url+Config[:API_KEY])
      if response.parsed_response=={"error"=>"word not found"}
        puts "ERROR WORD NOT FOUND OR INVALID COMMAND"
        exit
      end
      return response.parsed_response
      rescue Exception
        print "Can't Fetch Data"
        exit
      end
  end

end