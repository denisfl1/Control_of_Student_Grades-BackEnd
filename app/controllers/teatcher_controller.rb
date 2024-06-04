class TeatcherController < ApplicationController
  before_action :authorize, only:[:AddNote]

  def teatcherCreate

    newTeatcher = Teatcher.create(teatcherParams)


      if(newTeatcher.valid?)

         token = encode_Token({teatcher:newTeatcher})

         render json:{message:"Criado com sucesso",token:token},status:200


      else

        render json:"Dados Inválidos", status:404

      end




  end


      def login

        @teatcher = Teatcher.find_by(credential:params[:credential])
        @student = Student.find_by(ra:params[:credential])


        if(@teatcher && @teatcher.authenticate(teatcherParams[:password]))

          token = encode_Token({id:@teatcher.id,teatcherName:@teatcher.teatcherName,
          credential:@teatcher.credential})


          render json:{teatcher:@teatcher,token:token},status:200

        elsif(@student && @student.authenticate(params[:password]))

          fullname = "#{@student.name} #{@student.surname}"

          token = encode_Token({id:@student.id,name:fullname,
          ra:@student.ra})

          render json:{student:@student,token:token},status:200

        else

          render json:"Credenciais ou senha inválidos",status:404


        end



      end


      def AddNote

        teatcher = Teatcher.find_by(credential:authorized_user.credential)
        student = Student.find_by(ra:params[:ra])

          return render json: "Estudante não encontrado!",status:404 unless(student)
          return render json: "Professor não encontrado!",status:404 unless(teatcher)


            if(teatcher && student)
              note = params[:convert]
              two_months = params[:two_months]
              discipline = teatcher.discipline
              type  = note.class == Integer || note.class == Float

             return render json:"O valor declarado não é um número!",status:403 unless(note == nil || type)

              if(two_months == "Média")

                return render json:"Você não pode alterar a média!",status:403

              end

              if(type && note > 10)

                return render json:"#{note} é um valor inválido!",status:403

              end

              notes_key = student.notes

              notes_key[two_months][discipline] = note

              student.update(notes:notes_key)

              render json: "Adicionado com sucesso!",status:200

            end


      end


  private

   def teatcherParams

    params.permit(:teatcherName,:credential,:discipline,:password)

   end


end
