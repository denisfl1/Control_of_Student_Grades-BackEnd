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


  private

   def teatcherParams

    params.permit(:teatcherName,:credential,:discipline,:password)

   end


end
