require 'mechanize'
require 'logger'

WEB_USER_AGENT = 'Mozilla/5.0 (Linux; Android 4.2.1; en-us; Nexus 4 Build/JOP40D) AppleWebKit/535.19 (KHTML, ' \
  'like Gecko) Chrome/18.0.1025.166 Mobile Safari/535.19'.freeze

module Tinyletter
  class Newsletter
    BASE_ENDPOINT = 'http://tinyletter.com/'.freeze

    def initialize(username, params = {})
      @username = username
      @with_archive = params[:with_archive] || false
      initialize_http_client
    end

    def metadata
      return @metadata unless @metadata.nil?

      begin
        page = get(BASE_ENDPOINT + @username)
        @metadata = extract_metadata(page)
      rescue Mechanize::ResponseCodeError => e
        { error: e }
      end
    end

    private

    def extract_metadata(page)
      archive = page.at('#view-messages-link')

      metadata = { title: page.at('h1.title').text.strip,
                   by: page.at('.byline').text.strip.gsub(/^by /, ''),
                   description: page.at('.description').text.strip,
                   archive_url: archive ? archive['href'] : nil
      }

      if archive && @with_archive
        metadata[:archive] = extract_archive_metadata(archive)
      end

      metadata
    end

    def extract_archive_metadata(archive)
      get(archive['href']).search('.message-item').map do |item|
        extract_archive_item_metadata(item)
      end
    end

    def extract_archive_item_metadata(item)
      date = Date.parse(item.at('.message-date').text.strip).to_s
      {
        date: date,
        title: item.at('.message-link').text.strip,
        url: item.at('.message-link')['href'],
        description: item.at('.message-snippet').text.strip
      }
    end

    def get(url, params: [], referer: nil)
      @http.get(url, params, referer, @headers)
    end

    def initialize_http_client
      @http = Mechanize.new do |mechanize|
        mechanize.user_agent = WEB_USER_AGENT
        mechanize.agent.http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        mechanize.log = Logger.new(STDOUT) if Tinyletter.debug
      end

      @headers = {}
    end

    def log(msg)
      puts msg if Tinyletter.log
    end
  end
end
