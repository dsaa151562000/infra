require 'open-uri'

class RestaurantsController < ApplicationController

  def top

  end

  def list
    if params[:next] == "true"
      query = session[:query]
      query["offset_page"] = query["offset_page"].to_i + 1
    elsif params[:prev] == "true"
      query = session[:query]
      query["offset_page"] = query["offset_page"].to_i - 1
    else
      query = params[:query]
      query["offset_page"] = 1
    end

    session[:query] = query
    url = build_url(query)
    url = URI.escape(url)
    res = open(url)

    if res.status[0] == "200"
      json = JSON.parse(res.read, { symbolize_names: true })
      @offset_page = query["offset_page"]
      @rests = json[:rest]
    end

  end


  def detail
    id = params[:id]
    url = build_url({ id: id })
    URI.parse URI.encode
    res = open(url)

    if res.status[0] == "200"
      json = JSON.parse(res.read, { symbolize_names: true })
      @rest = json[:rest]
    end
  end


  private

    def build_url(query)
      url = 'http://api.gnavi.co.jp/RestSearchAPI/20150630/'


      query[:keyid] = "8702b77b4df3f0b9ee6c1dc30695c381"
      query[:format] = 'json'


      url = url + '?' + 'keyid=' + query[:keyid] + '&format='+ query[:format]+'&name='+ query[:name]
     #binding.pry

    end

  def build_url02(query)
    url = 'http://api.gnavi.co.jp/RestSearchAPI/20150630/'


    query[:keyid] = "8702b77b4df3f0b9ee6c1dc30695c381"
    query[:format] = 'json'


    url = url + '?' + 'keyid=' + query[:keyid] + '&format='+ query[:format]+'&name='+ query[:name]+'&id='+ query[:id]
    #binding.pry

  end
end


