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
    ]

    names.each{|data|

    name = data
    parts = name.split(' ')
    first = parts.first
    last = parts.last
    random = rand(* 1000000000)

    Student.create(name:first,surname:last,ra:random)

    }

    render json: "Criado com sucesso",status:200
  end



  def getStudents

    students = Student.all

    render json: students, status:200

  end

end
