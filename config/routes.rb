Rails.application.routes.draw do

  post "/createStudent" => "student#createStudent"
  get "/getStudents" => "student#getStudents"
  get "/getStudent/:id" => "student#getStudent"
  # post "/addnote" => "student#addNote"
  post "/addnote" => "teatcher#AddNote"
  post "/createTeatcher" => "teatcher#teatcherCreate"
  post "/loginTeatcher" => "teatcher#loginTeatcher"

end
