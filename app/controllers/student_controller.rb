class StudentController < ApplicationController
  # before_action :authorize_student, only:[:getStudents]

  def createStudent

    # names = [
    #   'Aurora Silva',
    #   'Dante Rodrigues',
    #   'Valentina Oliveira',
    #   'Mateus Santos',
    #   'Isabela Pereira',
    #   'Gabriel Costa',
    #   'Helena Almeida',
    #   'Lucas Ferreira',
    #   'Sofia Cardoso',
    #   'Miguel Gonçalves',
    #   'Gabriel Oliveira',
    #   'Marina Santos',
    #   'Felipe Lima',
    #   'Isabela Pereira',
    #   'Lucas Costa',
    #   'Giovanna Rodrigues',
    #   'Matheus Fernandes',
    #   'Sofia Almeida',
    #   'Enzo Martins',
    #   'Laura Silva',
    # ]

    #   obj = {}

    #   for i in 1..5
    #     randomNote = rand(7..10)

    #     if(i == 5)

    #       i = 'Média'

    #     end

    #     if(!obj[i])
    #       obj[i] = []
    #     end

    #     obj[i] = {
    #       português:randomNote,
    #       literatura:randomNote,
    #       inglês:randomNote,
    #       matemática:randomNote,
    #       física:randomNote,
    #       química:randomNote,
    #       biologia:randomNote,
    #       geografia:randomNote,
    #       história:randomNote,
    #       sociologia:randomNote,
    #       filosofia:randomNote,
    #       artes:randomNote,
    #       educação_física:randomNote
    #       }

    #         obj['Média'] = {
    #         português:nil,
    #         literatura:nil,
    #         inglês:nil,
    #         matemática:nil,
    #         física:nil,
    #         química:nil,
    #         biologia:nil,
    #         geografia:nil,
    #         história:nil,
    #         sociologia:nil,
    #         filosofia:nil,
    #         artes:nil,
    #         educação_física:nil,
    #         }


    #   end


    # names.each{|data|

    # name = data
    # parts = name.split(' ')
    # first = parts.first
    # last = parts.last
    # random = rand(100000000000)

    # Student.create(name:first,surname:last,ra:random,notes:obj)

    # }

       obj = {}

      for i in 1..5

        if(i == 5)

          i = 'Média'

        end

        if(!obj[i])
          obj[i] = []
        end

        obj[i] = {
          português:nil,
          literatura:nil,
          inglês:nil,
          matemática:nil,
          física:nil,
          química:nil,
          biologia:nil,
          geografia:nil,
          história:nil,
          sociologia:nil,
          filosofia:nil,
          artes:nil,
          educação_física:nil
          }

          obj['Média'] = {
            português:nil,
            literatura:nil,
            inglês:nil,
            matemática:nil,
            física:nil,
            química:nil,
            biologia:nil,
            geografia:nil,
            história:nil,
            sociologia:nil,
            filosofia:nil,
            artes:nil,
            educação_física:nil,
            }


      end


    Student.create(name:params[:name],surname:params[:surname],ra:params[:ra],password:params[:password],notes:obj)

    render json: "Criado com sucesso",status:200

  end

  def editStudent

    search = Student.find_by(id:params[:id])
    name = params[:name]
    surname = params[:surname]
    ra = params[:ra]
    notes = params[:notes]

    search.update(name:name,surname:surname,notes:search.notes.merge({notes[0]=>notes[1]}),ra:ra)

    render json:"Atualizado com sucesso!",status:200


  end

  def getStudents

    students = Student.all

    render json: students , status:200

  end


  def getStudent

    searchStudent = authorized_student
    searchTeatcher = Teatcher.find_by(credential:authorized_user[:credential])
    student = Student.find_by(ra:params[:ra])
    if(searchTeatcher || searchStudent == params[:ra])


          if student

            render json: student, status:200


          else

            render json:"Estudante não encontrado",status: 404

          end

        else

          render json:"Não Autorizado!",status: 403

      end

  end


    def getStudent_to_Add_Note

      student = Student.all
      subjects = authorized_user.discipline

      if (student && subjects)

        render json: {alumn:student,discipline:subjects}, status:200


      else

        render json:"Estudante não encontrado",status: 404

      end



    end



end
