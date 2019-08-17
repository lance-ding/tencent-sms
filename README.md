# Tencent::Sms

腾讯云短信服务(非官方)

## 安装

添加此行到 Gemfile:

```ruby
gem 'tencent-sms'
```

执行:

    $ bundle

或使用`gem`安装:

    $ gem install tencent-sms

## 使用

配置:
```ruby
Tencent::Sms.config do |c|
  c.appid = "1400244376"
  c.appkey = "7712805d222a6d4c21de054158ecc29d"
end
```

发送短信:
```ruby
message = {
  :params => %w(参数-1 参数-2),
  :mobile => "手机号码",
  :nationcode => "国家（或地区）码",
  :tpl_id => "短信模板ID",
  :sign => "短信签名"
}

result = Tencent::Sms.sendsms(message)
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).