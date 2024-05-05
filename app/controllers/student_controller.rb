class StudentController < ApplicationController


  def createStudent

    names = [
      'Aurora Silva',
      'Dante Rodrigues',
      'Valentina Oliveira',
      'Mateus Santos',
      'Isabela Pereira',
      'Gabriel Costa',
      'Helena Almeida',
      'Lucas Ferreira',
      'Sofia Cardoso',
      'Miguel Gonçalves',
      'Gabriel Oliveira',
      'Marina Santos',
      'Felipe Lima',
      'Isabela Pereira',
      'Lucas Costa',
      'Giovanna Rodrigues',
      'Matheus Fernandes',
      'Sofia Almeida',
      'Enzo Martins',
      'Laura Silva',
    ]

      obj = {}

      for i in 1..5
        randomNote = rand(7..10)

        if(i == 5)

          i = 'Média'

        end

        if(!obj[i])
          obj[i] = []
        end

        obj[i] = {
          português:randomNote,
          literatura:randomNote,
          inglês:randomNote,
          matemática:randomNote,
          física:randomNote,
          química:randomNote,
          biologia:randomNote,
          geografia:randomNote,
          história:randomNote,
          sociologia:randomNote,
          filosofia:randomNote,
          artes:randomNote,
          educação_física:randomNote
          }

          obj['Média'] = {
            português:0,
            literatura:0,
            inglês:0,
            matemática:0,
            física:0,
            química:0,
            biologia:0,
            geografia:0,
            história:0,
            sociologia:0,
            filosofia:0,
            artes:0,
            educação_física:0
            }


      end


    names.each{|data|

    name = data
    parts = name.split(' ')
    first = parts.first
    last = parts.last
    random = rand(100000000000)

    Student.create(name:first,surname:last,ra:random,notes:obj)

    }

    # Student.create(name:params[:first],surname:params[:last],ra:params[:ra],notes:params[:subjects])

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

    render json: students, status:200

  end


  def addNote

    student = Student.find_by(ra:params[:ra])
    datas = params[:data]


      if student

        student.update(notes: student.notes.merge({datas[0] => datas[1]}))

      end

      render json:"Atualizado com sucesso",status:200

  end


end
