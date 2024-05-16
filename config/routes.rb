Rails.application.routes.draw do

  post "/createStudent" => "student#createStudent"
  get "/getStudents" => "student#getStudents"
  get "/getStudent/:ra" => "student#getStudent"
  get "/getStudentToNote/:ra" => "student#getStudent_to_Add_Note"
  # post "/addnote" => "student#addNote"
  post "/addnote" => "teatcher#AddNote"
  post "/createTeatcher" => "teatcher#teatcherCreate"
  post "/loginTeatcher" => "teatcher#loginTeatcher"

end
