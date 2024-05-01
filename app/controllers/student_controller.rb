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
    subjects = {
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

    Student.create(name:first,surname:last,ra:random,notes:subjects)

    }

    render json: "Criado com sucesso",status:200
  end



  def getStudents

    students = Student.all

    render json: students, status:200

  end


  def addNote

    student = Student.find_by(ra:params[:ra])
    datas = params[:data]


      if student

        student.update(notes: student.notes.merge({ datas[0] => datas[1] }))

      end

      render json:"Atualizado com sucesso",status:200

  end


end
