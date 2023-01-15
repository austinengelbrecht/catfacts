module CatFacts exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes as Attr exposing (class, classList, id, name, src, title, type_)
import Html.Events exposing (onClick)
import Http 
import Json.Decode exposing (Decoder, bool, int, string, succeed)
import Json.Decode.Pipeline exposing (optional, required)



-- MAIN

subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none


main : Program () Model Msg 
main = 
  Browser.element 
    { init = \flags -> (initialModel, initialCmd)
    , update = update 
    , view = view 
    , subscriptions = subscriptions
    }


-- MODEL

type alias Model =
  { fact : String 
  , status : Status}


initialModel : Model 
initialModel =
  { fact = ""
  , status = Loading 
  }


initialCmd : Cmd Msg 
initialCmd = 
  getNewFact 


--TYPES

type Status 
  = Loading
  | Success Fact 
  | Errored 


type alias Fact =
  { fact : String 
  , length: Int 
  }


factUrl : String
factUrl =
  "https://catfact.ninja/fact"


-- HTTP

getNewFact : Cmd Msg
getNewFact = 
  Http.get
    { url = factUrl
    , expect = Http.expectJson GotFact factDecoder 
    }


factDecoder : Decoder Fact
factDecoder =
  succeed Fact 
    |> required "fact" string 
    |> required "length" int 


-- UPDATE
type Msg
  = GetNewFact
  | GotFact (Result Http.Error (Fact)) 


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    GetNewFact ->
      ( { model |  status = Loading }, getNewFact )

    GotFact (Ok newFact) ->
      ( { model | status = Success newFact }, Cmd.none )

    GotFact (Err _) ->
      ( { model | status = Errored }, Cmd.none )


-- VIEW

view : Model -> Html Msg
view model =
  div [ Attr.class "ext"]
    [ div [] <|
      case model.status of 
        Loading ->
          [ viewLoading ]
        
        Success newFact ->
          [ viewFact newFact ]

        Errored  ->
          [ viewError ] 
    
    , button [ onClick GetNewFact 
             , class "getfact-button"
             ] 
                [ text "Get a Fact"]
    ]


viewFact : Fact -> Html Msg 
viewFact newFact =
  p [] [ text newFact.fact] 


viewError : Html Msg
viewError  =
  p [] [ text "Sorry, I'm not really sure what happened, but I couldn't get a fact."]


viewLoading : Html Msg
viewLoading =
  p [] [ text "Getting a new fact..." ]