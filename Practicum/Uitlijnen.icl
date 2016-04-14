module Uitlijnen

import StdEnv, StdIO

//  Een aantal synomiem types:
::	UitlijnMode     :== Char
::  Tekst           :== String
::  Woord           :== String
::  Regel           :== String
::  TekstBreedte    :== Int
::  LetterBreedte   :== Int
::  Spatie			:== String   // De witruimte tussen twee woorden. Lengte > 0, en alle tekens zijn ' '.

//  UitlijnMode geeft de mogelijkheden weer van het algoritme.
Links				= 'l'
Centreren			= 'c'
Rechts				= 'r'
Uitlijnen			= 'u'

/*  uitlijnen is de functie die je zelf moet schrijven. 
    Argumenten:
        UitlijnMode:   hoe moet de uitvoer uitgelijnd worden (links, gecentreerd, rechts, of uitgelijnd)
        LetterBreedte: breedte van een letterteken (alle lettertekens zijn even breed)
        TekstBreedte:  breedte van het uitvoervenster
        Tekst:         de brontekst die uitgelijnd dient te worden.
    Uitvoer:
        [Regel]:       de lijst van regels die onder elkaar getekend worden. 
                       De lengte van alle regels moet gelijk zijn.
*/

uitlijnen :: UitlijnMode LetterBreedte TekstBreedte Tekst -> [Regel]
uitlijnen ...


/*  Vanaf hier volgt het voorgegeven deel van het programma dat een venster op je scherm
    tevoorschijn tovert. Dit deel hoef je niet te snappen. We nodigen je wel van harte uit
    om eens naar dit stuk functioneel programma te kijken als je nieuwsgierig bent hoe dat
    werkt.
    Uit gewoonte is de rest van dit programma in het Engels geschreven. 
*/

//  The data types used in the program:
::  FontInfo
 =  {   font    :: !Font
    ,   width   :: !Int
    ,   height  :: !Int
    }
::  State
 =  {   fontInfo:: !FontInfo
    ,   mode    :: !UitlijnMode
    ,   window  :: !Id
    }

/*  The text to be outlined. You can change this value to test your program. This example contains sufficient
    problems. ;-)
*/
text =: "In dit kleine verhaaltje komen korte woorden voor, zoals 'a', 'b', 'c' en 'd' maar ook " +++
        "exorbitant lange woorden zoals 'hottentottententententoonstellingexhibitieruimte'. "     +++
        "Je algoritme moet natuurlijk ook regels met zulke lange woorden aankunnen. "

Start :: *World -> *World
Start world
# (fontInfo,world)  = accScreenPicture (getFontInfo 8) world
# (windowId,world)  = openId world
# initialState      = {fontInfo=fontInfo,mode=Links,window=windowId}
= startIO SDI initialState initialiseGUI [ProcessClose closeProcess] world
where
//  initialiseGUI creates the window and menu of this interactive process.
    initialiseGUI :: (PSt State) -> PSt State
    initialiseGUI pst=:{ls=state}
    # (error,pst)	= openWindow undef wdef pst
    | error<>NoError= abort "Could not open the window."
    # (error,pst)	= openMenu   undef mdef pst
    | error<>NoError= abort "Could not open the menu."
    | otherwise		= pst
    where
    //  mdef defines the menu of the application.
        mdef        = Menu 
		                "&File"                                         // The menu title
		                (                                               // The menu elements
		                    SubMenu "Font&Size"
		                (   RadioMenu        [  (toString fsize,Nothing,Nothing,noLS (setFontSize fsize))
		                                     \\ fsize<-[8,10..30]
		                                     ]  0 []
		                )   []
		                :+: SubMenu "Mode"
		                (   RadioMenu        [  (toString mode,Nothing,Nothing,noLS (setMode mode))
		                                     \\ mode<-[Links,Centreren,Rechts,Uitlijnen]
		                                     ]  0 []
		                )   []
		                :+: MenuSeparator    []
		                :+: MenuItem "E&xit" [MenuShortKey 'q',MenuFunction (noLS closeProcess)]
		                )   []                                          // The menu has no attributes
        where
        //  setFontSize sets the new size of the current font and redraws everything.
            setFontSize :: Int (PSt State) -> PSt State
            setFontSize fsize pst=:{ls=state,io}
            # (maybe_info,io)   = accWindowPicture window (getFontInfo fsize) io
            | isNothing maybe_info
                = abort ("Could not retrieve font information of size "+++toString fsize)
            | otherwise
                # info		= fromJust maybe_info
                # state		= {state & fontInfo=fromJust maybe_info}
                # io		= appWindowPicture window (setPenFont info.font) io
                # io		= setWindowLook window True (False,look state) io
                = {pst & ls=state,io=io}
            where
                window      = state.window
        
        //  setMode sets the new UitlijnMode and redraws everything.
            setMode :: UitlijnMode (PSt State) -> PSt State
            setMode mode pst=:{ls=state,io}
            # state			= {state & mode=mode}
            # io			= setWindowLook window True (False,look state) io
            = {pst & ls=state,io=io}
            where
                window      = state.window

    
    //  wdef defines the window that displays the text.
        wdef		= Window
		                "Uitlijnen"                                     // The window title
		                NilLS                                           // The window contains no controls
		                [                                               // Window attributes:
		                    WindowClose    (noLS closeProcess)          // Closing the window terminates the program
		                ,   WindowLook     False (look state)           // The visible content of the window
		                ,   WindowId       state.window                 // The identification value of the window
		                ,   WindowInit     (noLS (appPIO (appWindowPicture state.window (setPenFont state.fontInfo.font))))
		                                                                // Set a non-proportional font
		                ,   WindowViewSize {w=300,h=300}
		                ]

//  getFontInfo retrieves the font metrics and non-proportional font.
    getFontInfo :: Int *Picture -> (FontInfo,*Picture)
    getFontInfo fsize picture
    # ((ok,font),picture)   = openFont {NonProportionalFontDef & fSize=fsize} picture
    | not ok
        = abort "Could not retrieve NonProportionalFontDef from screen picture"
    | otherwise
        # (metrics,picture) = getFontMetrics font picture
        = ({font=font,width=metrics.fMaxWidth,height=fontLineHeight metrics},picture)

//  look draws the visible content of the window.
    look :: State SelectState UpdateState *Picture -> *Picture
    look {fontInfo,mode} _ {oldFrame,newFrame} picture
    # picture		= unfill newFrame picture
    # picture		= setPenColour Red picture
    # picture		= drawAt {zero & x=framewidth/charwidth*charwidth} {zero & vy=frameheight} picture
    # picture		= setPenColour Black picture
    = seq [  drawAt {x=i*charwidth,y=y} line.[i]
          \\ line<-linedtext & y<-[lineheight,2*lineheight..], i<-[0..size line-1]
          ]  picture
    where
        linedtext   = uitlijnen mode charwidth framewidth text
        framesize   = rectangleSize newFrame
        framewidth  = framesize.w
        frameheight = framesize.h
        lineheight  = fontInfo.height
        charwidth   = fontInfo.width
