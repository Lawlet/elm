import Html exposing (..)
import Html.App as Html
import Html.Attributes exposing(..)
import Html.Events exposing(onInput, onClick)
import String
import Char
main = 
  Html.beginnerProgram {model = model, view = view, update = update}

---model
type alias Model = 
  { name : String 
  , password : String 
  , passwordAgain : String
  }


model : Model 
model = Model "" "" ""
  


       
        

--update

type Msg = Name String | Password String | PasswordAgain String

update : Msg->Model->Model
update msg model = 
  case msg of 
    Name name ->
      {model | name = name}
      
    Password password ->
      {model | password = password}
    
    PasswordAgain password ->
      {model | passwordAgain = password}
  
      
      
 ----view 
view : Model -> Html Msg
view model = 
  div[]
  [input [type' "text", placeholder "Name", onInput Name][]
  ,input [type' "password", placeholder "Password", onInput Password][]
  ,input [type' "password", placeholder "Password Again", onInput PasswordAgain][]
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
        ("black", "")
      else 
        ("black", "Password should have a number, upper, lower and minimum 8 characters")
        
    match = 
      if model.password == model.passwordAgain 
      
      then 
        ""
       else 
         "Password do not match"   
  in 
   div [] [
   div [style [("color", color)]] [ (text message)]
   , (text match) 
   ]
