#!/usr/bin/env /Users/daniel/.rbenv/shims/ruby

require 'money'
require_relative 'tracker'
I18n.config.available_locales = :en, :es

current_money_combined = Tracker.how_many_mxn_in? xrp: 21.342512
current_mxn = Money.new(current_money_combined * 100, "MXN").format

puts current_mxn
puts '---'
puts "XRP = $#{Tracker.last_currency_in_mxn(:xrp)} | href=https://bitso.com/trade/market/xrp/mxn color=green"
puts "BTC = $#{Tracker.last_currency_in_mxn(:btc)} | href=https://bitso.com/trade/market/btc/mxn color=gray"
puts "ETH = $#{Tracker.last_currency_in_mxn(:eth)} | href=https://bitso.com/trade/market/eth/mxn color=gray"
