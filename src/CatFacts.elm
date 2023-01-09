module CatFacts exposing (main)

import Browser
import Html exposing (..)
-- import Html.Events exposing (onClick)


-- MAIN

main : Program () Model Msg 
main = 
  Browser.sandbox 
    { init = init
    , update = update 
    , view = view 
    }


-- MODEL
type alias Model = 
  { fact : String }


initialModel : Model 
initialModel = 
  { fact = ""
  , status = Loading
  }


--TYPES

type Status 
  = Loading 
  | Loaded 
  | Errored String 


factUrl : String
factUrl =
  "https://catfact.ninja/fact"


-- UPDATE
type Msg
  = GetNewFact


update : Msg -> Model -> ( Model )
update msg model =
  case msg of
    GetNewFact ->
      { model | fact = "nothing" }


-- VIEW


view : Model -> Html Msg
view model =
  div [] <| 
    case model.status of 
      Loading -> 
        []
      
      Loaded ->
        []

      Errored errorMessage ->
        [ text ("Error: " ++ errorMessage) ]



viewFact : Model -> Html Msg
viewFact model = 
  div [] [ text model.fact]