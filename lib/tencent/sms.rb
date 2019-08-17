require "tencent/sms/version"
require 'digest'
require 'rest-client'
require 'json'

module Tencent
  module Sms
    class << self
      attr_accessor :appid, :appkey

      def config
        yield self if block_given?
      end

      def sendsms(message)
        random = random_number
        time = Time.now.to_i
        body = {
          :ext => "",
          :extend => "",
          :params => message[:params],
          :sig => sig(random, time, message[:mobile]),
          :sign => message[:sign],
          :tel => {
            :mobile => message[:mobile],
            :nationcode => message[:nationcode]
          },
          :time => time,
          :tpl_id => message[:tpl_id]
        }
        url = "https://yun.tim.qq.com/v5/tlssmssvr/sendsms?sdkappid=#{appid}&random=#{random}"

        RestClient.post(url, body.to_json)
      end

      def sig(random, time, mobile)
        Digest::SHA256.hexdigest "appkey=#{appkey}&random=#{random}&time=#{time}&mobile=#{mobile}"
      end

      def random_number
        rand(10_000...99_999)
      end
    end
  end
end
