;"============================================================================="
;" HEIDI Main File"
;"============================================================================="
;" Game Release Details"

<CONSTANT GAME-TITLE "Heidi">
<CONSTANT GAME-DESCRIPTION
"A simple Inform example by Roger Firth and Sonja Kesserich.|
This version written in ZIL by Shin for the ZILF compiler by Jesse McGrew.">

<CONSTANT RELEASEID 1> <VERSION ZIP>

;"============================================================================="
;" ZILF Library and Extensions"

<INSERT-FILE "parser">

<INSERT-FILE "../Inform_Style/taking">
<INSERT-FILE "../Inform_Style/listening">
<INSERT-FILE "../Inform_Style/entering">

;"============================================================================="
;" Generic Initialisation"

<ROUTINE GO ()
    <CRLF> <CRLF> <INIT> <V-VERSION>
    <MOVE PLAYER ,HERE>
    <CRLF> <V-LOOK> <MAIN-LOOP>
>

;"============================================================================="
;" Game Specific Initialisation"

<ROUTINE INIT ()
    <SETG HERE BEFORE-COTTAGE>
    <PUTP PLAYER ,P?CAPACITY 5>
    <QUEUE I-FINISH-IF-GAME-WON -1>
>

;"============================================================================="
;" Rooms, Objects and their Behaviour"
;"-----------------------------------------------------------------------------"
;"  In front of a cottage"

<ROOM BEFORE-COTTAGE (IN ROOMS)(DESC "In front of a cottage")
    (LDESC "You stand outside a cottage. The forest stretches east.")
    (EAST TO FOREST)
    (IN SORRY "It's such a lovely day -- much too nice to go inside.")
    (ACTION BEFORE-COTTAGE-F)
    (FLAGS LIGHTBIT)
>

<ROUTINE BEFORE-COTTAGE-F (RARG)
    <COND (<=? .RARG ,M-BEG>
        <COND (<AND <VERB? WALK> <0? <GETPT ,HERE ,PRSO>>>
            <TELL "The only path lies to the east." CR>)>)>
>

<OBJECT COTTAGE (LOC BEFORE-COTTAGE)(DESC "tiny cottage")
    (TEXT "It's small and simple, but you're very happy here.")
    (SYNONYM COTTAGE HOME HOUSE HUT)(ADJECTIVE TINY)
    (ACTION COTTAGE-F)
    (FLAGS NDESCBIT)
>

<ROUTINE COTTAGE-F ()
    <COND (<VERB? ENTER>
        <DO-WALK ,P?IN>)>
>

;"-----------------------------------------------------------------------------"
;"  Deep in the forest"

<ROOM FOREST (IN ROOMS)(DESC "Deep in the forest")
    (LDESC "Through the dense foliage, you glimpse a building to the west.
A track heads to the northeast.")
    (WEST TO BEFORE-COTTAGE)(NE TO CLEARING)
    (FLAGS LIGHTBIT)
>

<OBJECT BIRD (LOC FOREST)(DESC "baby bird")
    (TEXT "Too young to fly, the nestling tweets helplessly.")
    (SYNONYM BIRD NESTLING)(ADJECTIVE BABY)
    (ACTION BIRD-F)
    (FLAGS TAKEBIT)
>

<ROUTINE BIRD-F ()
    <COND (<VERB? LISTEN>
        <TELL "It sounds scared and in need of assistance." CR>)>
>

;"-----------------------------------------------------------------------------"
;"   A forest clearing"

<ROOM CLEARING (IN ROOMS)(DESC "A forest clearing")
    (LDESC "A tall sycamore stands in the middle of this clearing.
The path winds southwest through the trees.")
    (SW TO FOREST)(UP TO TOP-OF-TREE)
    (ACTION CLEARING-F)
    (FLAGS LIGHTBIT)
>

<ROUTINE CLEARING-F (RARG)
    <COND (<=? .RARG ,M-BEG>
        <COND (<AND <VERB? CLIMB> <0? ,PRSO>>
            <TELL "[the tall sycamore tree]" CR>
            <TREE-F>)>)>
>

<OBJECT NEST (LOC CLEARING)(DESC "bird's nest")
    (TEXT "The nest is carefully woven of twigs and moss.")
    (SYNONYM NEST TWIGS MOSS)(ADJECTIVE BIRD\'S)
    (FLAGS CONTBIT OPENBIT TAKEBIT)
>

<OBJECT TREE (LOC CLEARING)(DESC "tall sycamore tree")
    (TEXT "Standing proud in the middle of the clearing,
the stout tree looks easy to climb.")
    (SYNONYM TREE SYCAMORE)(ADJECTIVE TALL STOUT PROUD SYCAMORE)
    (ACTION TREE-F)
    (FLAGS NDESCBIT)
>

<ROUTINE TREE-F ()
    <COND (<VERB? CLIMB>
        <DO-WALK ,P?UP>
        <RTRUE>)>
>

;"-----------------------------------------------------------------------------"
;"   At the top of the tree"

<ROOM TOP-OF-TREE (IN ROOMS)(DESC "At the top of the tree")
    (LDESC "You cling precariously to the trunk.")
    (DOWN TO CLEARING)
    (ACTION TOP-OF-TREE-F)
    (FLAGS LIGHTBIT)
>

<ROUTINE TOP-OF-TREE-F (RARG)
    <COND (<=? .RARG ,M-BEG>
        <COND (<VERB? DROP>
            <MOVE ,PRSO CLEARING>
            <TELL "Dropped... to the ground far below." CR>)>)>
>

<OBJECT BRANCH (LOC TOP-OF-TREE)(DESC "wide firm bough")
    (TEXT "It's flat enough to support a small object.")
    (SYNONYM BOUGH BRANCH)(ADJECTIVE WIDE FIRM FLAT)
    (FLAGS CONTBIT OPENBIT SURFACEBIT)
>

;"============================================================================="
;" Interrupt Routines"

<ROUTINE I-FINISH-IF-GAME-WON ()
    <COND (<=? <LOC BRANCH> ,HERE>
        <COND (<AND <IN? BIRD NEST> <IN? NEST BRANCH>>
            <CRLF> <JIGS-UP "You win!">)>)>
>

;"============================================================================="
;" Verbs and Syntax"

;"============================================================================="