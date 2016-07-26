import Html exposing (..)
import Html.App as Html
import Html.Attributes exposing(..)
import Html.Events exposing(..)
import String
import Char
main = 
  Html.beginnerProgram {model = model, view = view, update = update}

---model
type alias Model = 
  { name : String 
  , password : String 
  , passwordAgain : String
  , age: String
  }


model : Model 
model = Model "" "" "" ""
  


       
        

--update

type Msg = Name String | Password String | PasswordAgain String | Age String

update : Msg->Model->Model
update msg model = 
  case msg of 
    Name name ->
      {model | name = name}
      
    Password password ->
      {model | password = password}
    
    PasswordAgain password ->
      {model | passwordAgain = password}
    Age age ->
      {model | age = age}
  
      
      
 ----view 
view : Model -> Html Msg
view model = 
  div[]
  [input [type' "text", placeholder "Name", onInput Name][]
  ,input [type' "password", placeholder "Password", onInput Password][]
  ,input [type' "password", placeholder "Password Again", onInput PasswordAgain][]
  ,input [type' "text", placeholder "Age", onInput Age][]
  ,viewValidation model
  ]
  
  
viewValidation : Model -> Html msg 
viewValidation model = 
  
  let 
         
    (color, message) = 
      if  String.any Char.isDigit model.password && 
          String.any Char.isUpper model.password &&
          String.any Char.isLower model.password &&
          String.length model.password > 8 
      then
        ("green", "")
      else 
        ("red", "Password should have a number, upper, lower and minimum 8 characters")
        
    match = 
      if model.password == model.passwordAgain 
      
      then 
        ""
       else 
         "Password do not match"  
         
    age = 
      if String.all Char.isDigit model.age then 
       ""
      else
       "Must be a number"
       
         
  in 
   div [] [
    button [ type' "button" ]  [  text "Submit" ] 
   , div [style [("color", color)]] [ h3[] [text message] ]
   , div [] [ h2 []  [ text match ] ]
   , h2 [] [ text age ]
   ]
