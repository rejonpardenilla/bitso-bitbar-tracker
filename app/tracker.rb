require 'rest-client'
require 'json'
require 'singleton'

class Tracker
  include Singleton

  def self.last_currency_in_mxn(currency)
    currency ||= :btc
    raise "'#{currency.to_s}' is not a valid currency" unless   currency == :xrp ||
                                                                currency == :btc ||
                                                                currency == :ltc ||
                                                                currency == :eth

    response = RestClient.get("https://api.bitso.com/v3/ticker/?book=#{currency.to_s}_mxn", { accept: :json })
    json_response = JSON.parse(response.body)
    json_response['payload']['last']
  end

  def self.how_many_mxn_in?(wallet = {})
    wallet[:xrp] ||= 0
    wallet[:btc] ||= 0
    wallet[:ltc] ||= 0
    wallet[:eth] ||= 0

    currencies = [:xrp, :btc, :ltc, :eth]
    total_money = 0
    currencies.each do |currency|
      total_money = (self.last_currency_in_mxn(currency).to_f * wallet[currency]) + total_money
    end
    return total_money
  end
end