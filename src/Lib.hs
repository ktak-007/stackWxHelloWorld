module Lib ( application ) where

import Graphics.UI.WX
import Graphics.UI.WXCore
import Paths_stackWxHelloWorld

helloModalDialog :: Window a -> IO ()
helloModalDialog parentWindow = do
    helloWindow <- dialog parentWindow [ text := "Hello!" ] --, visible:= True ]
    panel <- panel helloWindow []
    helloLabel <- staticText panel [text := "Hello, world!", fontWeight := WeightBold ]
    buttonClose <- button panel [ text := "Close" ] -- set helloWindow [ visible := False ] ]
    set helloWindow [ layout := column 1
                        [ fill $ container panel $
                            margin 10 $ column 10
                                [ floatTop $ row 1 [ widget helloLabel ]
                                , floatBottom $ widget buttonClose
                                ]
                        ]
                    , clientSize := sz 150 100
                    ]
    showModal helloWindow (\close -> set buttonClose [ on command := close (Just 42) ])
    return ()

application :: IO ()
application = do
    mainWindow <- frame [ text := "Hello!" ]

    -- Utility to show messages in info dialog window
    let say = infoDialog mainWindow

    -- Create file menu
    fileMenu <- menuPane [ text := "File" ]
    hello <- menuItem fileMenu [ text := "Hello!", help := "Open info dialog window", on command := helloModalDialog mainWindow ]
    menuQuit fileMenu [ on command := close mainWindow ]

    -- Create help menu
    helpMenu <- menuHelp []
    menuAbout helpMenu [ on command := say "About application" "Author: Stanislav Smirnov\nWebsite: http://ktak-007.blogspot.ru" ]

    -- Create toolbar
    tbar <- toolBar mainWindow []
    openImg <- imageFile "open32.png"
    toolMenu tbar hello "Open" openImg []

    -- Create statusbar
    status <- statusField []

    -- Create application buttons
    buttonQuit <- button mainWindow [ text := "Quit", on command := close mainWindow ]

    -- The layout of main window. It should be last command in do block
    set mainWindow [ layout := floatCentre $ widget buttonQuit
                   , clientSize := sz 400 200
                   , menuBar := [ fileMenu, helpMenu ]
                   , statusBar := [ status ]
                   ]

imageFile :: String -> IO FilePath
imageFile img = getDataFileName $ "res/images/" ++ img
