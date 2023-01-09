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


init : Model 
init = 
  { fact = "No Facts Yet"}


--TYPES


-- UPDATE
type Msg
  = None


update : Msg -> Model -> ( Model )
update msg model =
  case msg of
    None ->
      { model | fact = "nothing" }


-- VIEW


view : Model -> Html Msg
view model =
  div [] [ text model.fact]