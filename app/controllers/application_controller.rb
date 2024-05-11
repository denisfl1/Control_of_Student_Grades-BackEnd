class ApplicationController < ActionController::Base


  def encode_Token(payload)

      JWT.encode(payload,"secret")

  end

end
