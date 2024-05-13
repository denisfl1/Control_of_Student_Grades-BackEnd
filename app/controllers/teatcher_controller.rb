class TeatcherController < ApplicationController

  def teatcherCreate

    newTeatcher = Teatcher.create(teatcherParams)


      if(newTeatcher.valid?)

         token = encode_Token({teatcher:newTeatcher})

         render json:{message:"Criado com sucesso",token:token},status:200


      else

        render json:"Dados Inválidos", status:404

      end




  end


      def loginTeatcher

        @teatcher = Teatcher.find_by(credential:params[:credential])


        if(@teatcher && @teatcher.authenticate(teatcherParams[:password]))

          token = encode_Token({id:@teatcher.id,teatcherName:@teatcher.teatcherName,
          credential:@teatcher.credential})


          render json:{teatcher:@teatcher,token:token},status:200


        else

          render json:"Credenciais ou Senha inválidos",status:404


        end



      end


      def AddNote

        teatcher = Teatcher.find_by(credential:authorized_user.credential)
        student = Student.find_by(ra:params[:ra])

          return render json: "Estudante não encontrado!",status:404 unless(student)
          return render json: "Professor não encontrado!",status:404 unless(teatcher)


            if(teatcher && student)
              note = params[:note]
              two_months = params[:two_months]
              discipline = teatcher.discipline

              notes_key = student.notes

              notes_key[two_months][discipline] = note

              student.update(notes:notes_key)

              render json: "Adicionado com Sucesso!",status:200

            end


      end


  private

   def teatcherParams

    params.permit(:teatcherName,:credential,:discipline,:password)

   end


end
