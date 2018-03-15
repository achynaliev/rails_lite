require 'json'
require 'byebug'

class Session
  # find the cookie for this app
  # deserialize the cookie into a hash
  def initialize(req)
    cookie = req.cookies['_rails_lite_app']
    if cookie
      @ivar = JSON.parse(cookie)
    else
      @ivar = {}
    end
  end

  def [](key)
    @ivar[key]
  end

  def []=(key, val)
    @ivar[key] = val
  end

  # serialize the hash into json and save in a cookie
  # add to the responses cookies
  def store_session(res)
    cookie = { path: '/', value: @data.to_json }
    res.set_cookie("_rails_lite_app", cookie)
  end
end
