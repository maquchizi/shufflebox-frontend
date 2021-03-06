module App.View exposing (view)

import Html exposing (Html, div)
import Html.Attributes exposing (class)
import Models exposing (Model)
import Routing.Route exposing (Route(..))
import App.Messages exposing (Msg(..))
import App.BrownBag.View as BrownBag
import App.SecretSanta.View as SecretSanta
import App.Hangouts.View as Hangouts
import App.Common.SideNav exposing (sideNav)
import App.Common.Nav exposing (navBar)


view : Model -> Html Msg
view model =
    div [ class "section is-paddingless" ]
        [ div [ class "container ctnr" ]
            [ div [ class "columns app-content" ]
                [ sideNav
                , div [ class "content column is-two-thirds is-paddingless" ]
                    [ navBar
                    , div [ class "current-view" ] [ currentView model ]
                    ]
                ]
            ]
        ]


currentView : Model -> Html Msg
currentView model =
    case model.route of
        BrownBagsRoute ->
            Html.map BrownBagMsg (BrownBag.view model.brownbag)

        HangoutsRoute ->
            Html.map HangoutsMsg (Hangouts.view model.hangoutModel)

        SecretSantaRoute ->
            SecretSanta.view

        _ ->
            -- Default to showing brownBags for any other message.
            Html.map BrownBagMsg (BrownBag.view model.brownbag)
