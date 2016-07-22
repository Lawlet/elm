import Html exposing(Html, Attribute, div, input, text)
import Html.App as Html 
import Html.Attributes exposing(..)
import Html.Events exposing(onInput)
import String

main = 
    Html.beginnerProgram {model = model, view = view, update = update}
    

---model

type alias Model =
  { content : String
  
  }
  
model : Model 

model = 
  { content = ""}
  
  
---update

type Msg = Change String

update : Msg->Model->Model

update msg model = 
  case msg of 
    Change newContent ->
      {model | content = newContent}
      
---view

view : Model -> Html Msg
view model = 
  div[] 
  [ input [ placeholder "Texto al reves ", onInput Change] []
  , div[] [text (String.reverse model.content)]
  
  ]
    
