module CatFacts exposing (main)

import Browser
import Html exposing (..)
-- import Html.Events exposing (onClick)


-- MAIN

main : Program () Model Msg 
main = 
  Browser.element 
    { init = \flags -> (initialModel, initialCmd)
    , update = update 
    , view = view 
    , subscriptions = \_ -> Sub.none 
    }


-- MODEL
type alias Model = 
  { fact : String
  , status : Status }


initialModel : Model 
initialModel = 
  { fact = ""
  , status = Loading
  }

initialCmd : Cmd Msg
initialCmd =
  Cmd.none


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


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    GetNewFact ->
      ( { model | fact = "nothing" }, Cmd.none )


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