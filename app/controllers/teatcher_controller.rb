class TeatcherController < ApplicationController

  def teatcherCreate

    newTeatcher = Teatcher.create(teatcherParams)


      if(newTeatcher.valid?)

         token = encode_Token({teatcher:newTeatcher})

         render json:{message:"Criado com sucesso",token:token},status:200


      else

        render json:"Dados inválidos", status:404

      end




  end


      def loginTeatcher

        @teatcher = Teatcher.find_by(credential:params[:credential])


        if(@teatcher && @teatcher.authenticate(teatcherParams[:password]))

          token = encode_Token({id:@teatcher.id,teatcherName:@teatcher.teatcherName,
          credential:@teatcher.credential})


          render json:{teatcher:@teatcher,token:token},status:200


        else

          render json:"Credenciais ou Senha inváidos",status:404


        end



      end


      def AddNote





      end


  private

   def teatcherParams

    params.permit(:teatcherName,:credential,:discipline,:password)

   end


end
