;"============================================================================="
;" TEMPLATE Main File"
;"============================================================================="
;" Game Release Details"

<CONSTANT GAME-TITLE "Template">
<CONSTANT GAME-DESCRIPTION
"A ZILF game template by Alex Proudfoot.">

<CONSTANT RELEASEID 1> <VERSION ZIP>

;"============================================================================="
;" ZILF Library and Extensions"

<INSERT-FILE "parser">

;"============================================================================="
;" Generic Initialisation"

<ROUTINE GO ()
    <SETG HERE DARKNESS>
    <CRLF> <CRLF> <INIT> <V-VERSION>
    <MOVE PLAYER ,HERE>
    <CRLF> <V-LOOK> <MAIN-LOOP>
>

<ROOM DARKNESS (IN ROOMS) (DESC "Darkness")
    (LDESC "It is pitch black. You can't see a thing.")
>

;"============================================================================="
;" Game Specific Initialisation"

<ROUTINE INIT () <RETURN>>

;"============================================================================="
;" Rooms, Objects and their Behaviour"

;"============================================================================="
;" Interrupt Routines"

;"============================================================================="
;" Verbs and Syntax"

;"============================================================================="