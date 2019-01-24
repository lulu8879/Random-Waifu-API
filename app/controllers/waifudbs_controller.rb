require 'net/http'
require 'open-uri'

class WaifudbsController < ApplicationController

  def random_waifu
    page = rand(1..10)
    url = page == 1 ? 'http://jurnalotaku.com/?s=%5Bwaifu+wednesday%5D' : "http://jurnalotaku.com/page/#{page}/?s=%5Bwaifu+wednesday%5D"
    waifus = Nokogiri::HTML(open(url))
    names = waifus.css('.article-inner-wrapper').css('.cover').css('img').map { |name| name['alt'].sub('[Waifu Wednesday] ','') if name['alt'].include?('[Waifu Wednesday]')}
    images = waifus.css('.article-inner-wrapper').css('.cover').css('img').map { |img| img['src'] }
    names.uniq!
    names.delete_at(names.index(nil))
    index = rand(0..names.size)
    @waifudb = Waifudb.find_by(name: names[index])
    if @waifudb.blank?
      upload = Cloudinary::Uploader.upload(images[index].to_s,
                                           use_filename: true,
                                           folder: 'Waifus/',
                                           public_id: names[index].gsub(' ','-').to_s)
      @waifudb = Waifudb.new(name: names[index], imgwaifu: upload['url'])
      @waifudb.save
    end
    render json: @waifudb, status: :ok
  end

end
