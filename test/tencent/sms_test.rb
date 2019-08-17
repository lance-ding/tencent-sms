require "test_helper"

class Tencent::SmsTest < Minitest::Test
  def test_sig
    rand = 66666
    time = 1566011076
    mobile = '150000000000'
    sig_result = '92f462533a40fcf728d4ff5932bb8046ee02bc39eda10dd0aa394c47f25d3d03'

    assert_equal sig_result, Tencent::Sms.sig(rand, time, mobile), "签名信息不正确"
  end
end
