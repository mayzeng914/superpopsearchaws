class SearchesController < ApplicationController
  require "instagram"

  before_action :set_client

   def index
    @current_user = current_user

    # todo: capture search term from form
    @media_item = @client.tag_recent_media(@tags[0].name)
    
  end

  def set_client
    Instagram.configure do |config|
        config.client_id = '3bc0d5915ec24cea94a5dfa4586d60c3'
        config.client_secret = 'fd6f7b58d558424ca6519eb2400a4f3a'
        # For secured endpoints only
        #config.client_ips = '<Comma separated list of IPs>'
    end

      # todo: use access_token for Instagram connection
      @client = Instagram.client(:access_token => '3172303.3bc0d59.22110f07a75d450cbc0743667f6f33e6')
      @search_term = params['search_term'] || 'cat'
      @tags = @client.tag_search(@search_term)
  end

end
