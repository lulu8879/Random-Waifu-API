require 'net/http'
require 'open-uri'

class WaifudbsController < ApplicationController

  def random_waifu
    page = rand(1..13)
    url = page == 1 ? 'http://jurnalotaku.com/?s=%5Bwaifu+wednesday%5D' : "http://jurnalotaku.com/page/#{page}/?s=%5Bwaifu+wednesday%5D"
    data = Nokogiri::HTML(open(url))

    waifus = data.css(".article-inner-wrapper").css(".cover").css("img").select { |name|
      name['alt'] if name['alt'].include?("[Waifu Wednesday]")
    }.map { |waifu| [waifu['alt'].sub("[Waifu Wednesday] ",""), waifu['src']] }

    waifu = waifus.sample
    name = waifu[0]
    img =  waifu[1]

    @waifudb = Waifudb.find_by(name: name)
    if @waifudb.blank?
      upload = Cloudinary::Uploader.upload(img.to_s,
                                           use_filename: true,
                                           folder: 'Waifu_Collections/',
                                           public_id: name.gsub(' ','-').to_s)
      @waifudb = Waifudb.new(name: name, imgwaifu: upload['url'].sub('http','https'))
      @waifudb.save
    end
    render json: @waifudb, status: :ok
  end

end
