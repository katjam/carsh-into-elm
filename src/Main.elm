module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)



-- Model


type alias Model =
    { value : Int
    }


init : () -> ( Model, Cmd Msg )
init _ =
    ( { value = 0
      }
    , Cmd.none
    )



-- Update


type Msg
    = AddOne


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        AddOne ->
            ( { model | value = model.value + 1 }
            , Cmd.none
            )



-- View


viewDocument : Model -> Browser.Document Msg
viewDocument model =
    { title = "Crash into Elm", body = [ view model ] }


view : Model -> Html Msg
view model =
    div [ style "padding" "50px" ]
        [ h1 [] [ text "My Buttons" ]
        , div []
            [ Html.button
                [ Html.Events.onClick AddOne
                ]
                [ text "Add one!" ]
            , hr [] []
            , div [] [ text ("Value is " ++ String.fromInt model.value) ]
            ]
        ]



-- Program


type alias Flags =
    ()


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


main : Program Flags Model Msg
main =
    Browser.document
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = viewDocument
        }
