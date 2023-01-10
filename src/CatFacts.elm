module CatFacts exposing (main)

import Browser
import Html exposing (..)
-- import Html.Events exposing (onClick)
import Http 
import Json.Decode exposing (Decoder, bool, int, string, succeed)
import Json.Decode.Pipeline exposing (optional, required)



-- MAIN

main : Program () Model Msg 
main = 
  Browser.element 
    { init = \flags -> (initialModel, initialCmd)
    , update = update 
    , view = view 
    , subscriptions = \_ -> Sub.none 
    }


-- SUBSCRIPTIONS


-- MODEL
-- type alias Model = 
--   { fact : String
--   , status : Status }


-- initialModel : Model 
-- initialModel = 
--   { fact = ""
--   , status = Loading
--   }

-- initialCmd : Cmd Msg
-- initialCmd =
--   Http.get 
--     { url = factUrl 
--     , expect = Http.expectJson factDecoder
--     }

-- factDecoder : Decoder Fact 
-- factDecoder = 
--   succeed Fact 
--     |> required "fact" string 
--     |> required "length" int 



--TYPES

-- type Status 
--   = Loading 
--   | Loaded 
--   | Errored String 


-- type alias Fact =
--   { fact : String 
--   , length: Int 
--   }


-- factUrl : String
-- factUrl =
--   "https://catfact.ninja/fact"


-- HTTP


-- UPDATE
-- type Msg
--   = GetNewFact
--   | GotFact 


-- update : Msg -> Model -> ( Model, Cmd Msg )
-- update msg model =
--   case msg of
--     GetNewFact ->
--       ( { model | fact = "nothing" }, Cmd.none )

--     GotFact (Ok Fact) ->
--       ( { model | fact = "Got a Fact!"}, Cmd.none )

--     GotFact (Err _) -> 
--       ( { model | status = Errored "Server Error!"}, Cmd.none )


-- VIEW


-- view : Model -> Html Msg
-- view model =
--   div [] <| 
--     case model.status of 
--       Loading -> 
--         []
      
--       Loaded ->
--         ( {})

--       Errored errorMessage ->
--         [ text ("Error: " ++ errorMessage) ]



-- viewFact : Model -> Html Msg
-- viewFact model = 
--   div [] [ text model.fact]