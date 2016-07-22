import Html exposing (..)
import Html.App as Html
import Html.Attributes exposing(..)
import Html.Events exposing(onInput, onClick)

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
  
viewValidation : Model -> Html msg 
viewValidation model = 
  let 
    (color, message) = 
      if model.password == model.passwordAgain then 
         ("green", "correct password")
       else 
         ("red", "passwords dont match")
         
  in 
    div[style [("color", color)]] [text message]
       
        

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
  ,input [type' "text", placeholder "Password", onInput Password][]
  ,input [type' "text", placeholder "Password Again", onInput PasswordAgain][]
  ,viewValidation model
  ]
