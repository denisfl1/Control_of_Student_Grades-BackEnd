Rails.application.routes.draw do

  post "/createStudent" => "student#createStudent"
  get "/getStudent" => "student#getStudents"
  post "/addnote" => "student#addNote"

end
