Rails.application.routes.draw do

  get "/getStudents" => "student#getStudents"
  get "/getStudent/:ra" => "student#getStudent"
  get "/getStudentToNote" => "student#getStudent_to_Add_Note"
  post "/createStudent" => "student#createStudent"
  post "/generateStudents" => "student#GenerateStudents"
  post "/addnote" => "teatcher#AddNote"
  post "/createTeatcher" => "teatcher#teatcherCreate"
  post "/login" => "teatcher#login"

end
