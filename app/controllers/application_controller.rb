class ApplicationController < ActionController::Base


  def encode_Token(payload)

      JWT.encode(payload,"secret")

  end


  def decode_Token


    auth_header = request.headers["Authorization"]

        if(auth_header)

          token = auth_header.split(' ').last

          begin
            JWT.decode(token,"secret",true,algorithm:'HS256')

          rescue JWT::DecodeError

            nil

          end

        end

  end


      def authorized_user

        decoded_Token = decode_Token()

        if(decoded_Token)

          teatcher = decode_Token[0]["credential"]

          searchTeatcher = Teatcher.find_by(credential:teatcher)

        end

      end


      def authorize

       return render json:"Você não está autenticado",status:401 unless authorized_user

      end


end
