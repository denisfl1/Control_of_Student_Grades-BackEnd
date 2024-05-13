class ApplicationController < ActionController::Base


  def encode_Token(payload)

      JWT.encode(payload,"secret")

  end


  def decode_Token


    auth_header = request.headers["Authorization"]


        if(auth_header)

          token = auth_header.split(' ').last
          token

          begin
            JWT.decode(token,"secret",true,algorithm:'HS256')

          rescue JWT::DecodeError

            nil

          end

        end

  end


      def authorized_user

        decode_Token = decode_Token()


        if(decode_Token)

          teatcher = decode_Token[0]["credential"]

          searchTeatcher = Teatcher.find_by(credential:teatcher)

        end

      end


end
