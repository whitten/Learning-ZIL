;"============================================================================="
;" TELL Main File"
;"============================================================================="
;" Game Release Details"

<CONSTANT GAME-TITLE "William Tell">
<CONSTANT GAME-DESCRIPTION
"A simple Inform example by Roger Firth and Sonja Kesserich.|
This version written in ZIL by Shin for the ZILF compiler by Jesse McGrew.">

<CONSTANT RELEASEID 1> <VERSION XZIP>

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

<CONSTANT MAX-SCORE 3>

<ROUTINE INIT ()
    <SETG HERE STREET>
    <SETG MODE ,VERBOSE>
    <MOVE BOW PLAYER>
    <MOVE QUIVER PLAYER>
    <FSET QUIVER WORNBIT>
    <PUTP PLAYER ,P?ACTION TELL-PLAYER-F>
    <INTRO>
>

<ROUTINE TELL-PLAYER-F ()
    <COND
        (<N=? PLAYER ,PRSO>
            <RFALSE>)
        (<VERB? EXAMINE>
            <TELL "You wear the traditional clothing of a Swiss mountaineer." CR>
            <RTRUE>)
    >
    <PLAYER-F>
>

<OBJECT BOW (DESC "bow")
    (TEXT "Your trusty yew bow, strung with flax.")
    (SYNONYM BOW)
    (FLAGS WEARBIT)
>

<OBJECT QUIVER (DESC "quiver")
    (TEXT "Made of goatskin, it usually hangs over your left shoulder.")
    (SYNONYM QUIVER)
    (FLAGS CONTBIT OPENBIT WEARBIT)
>

<ROUTINE INTRO ()
    <TELL
"The place: Altdorf, in the Swiss canton of Uri. The year is 1307,
at which time Switzerland is under rule by the Emperor Albert of
Habsburg. His local governor -- the vogt -- is the bullying
Hermann Gessler, who has placed his hat atop a wooden pole in
the centre of the town square; everybody who passes through the
square must bow to this hated symbol of imperial might."
CR CR
"You have come from your cottage high in the mountains,
accompanied by your younger son, to purchase provisions. You are
a proud and independent man, a hunter and guide, renowned both
for your skill as an archer and, perhaps unwisely (for his soldiers
are everywhere), for failing to hide your dislike of the vogt."
CR CR
"It's market-day: the town is packed with people from the
surrounding villages and settlements."
CR CR
    >
>

;"============================================================================="
;" Templates"

<USE "TEMPLATE">

;"-----------------------------------------------------------------------------"
;"  Lighted Room"

<OBJECT-TEMPLATE
    LIGHTED-ROOM =
        ROOM
            (FLAGS LIGHTBIT)
>

;"-----------------------------------------------------------------------------"
;"  Prop"

<OBJECT-TEMPLATE
    PROP =
        OBJECT
            (FLAGS NDESCBIT)
            (ACTION PROP-F)
>

<ROUTINE PROP-F ()
    <COND (<NOT ,PRSI>
        <COND (<VERB? EXAMINE>
            <RFALSE>)
        (ELSE
            <TELL "You don't need to worry about " T ,PRSO "." CR>)>)>
>

;"-----------------------------------------------------------------------------"
;"  Furniture"

<OBJECT-TEMPLATE
    FURNITURE =
        OBJECT
            (FLAGS CONTBIT OPENBIT SURFACEBIT)
            (ACTION FURNITURE-F)
>

<ROUTINE FURNITURE-F ()
    <COND (<NOT ,PRSI>
        <COND (<OR <VERB? TAKE> <VERB? PULL> <VERB? PUSH>>
            <TELL "The " D ,PRSO " is too heavy for that." CR>)>)>
>

;"-----------------------------------------------------------------------------"
;"  Tell's Arrows"

<OBJECT-TEMPLATE
    ARROW =
        OBJECT
            (DESC "arrow")
            (LDESC "Just like all your other arrows -- sharp and true.")
            (FLAGS VOWELBIT)
>

<ARROW ARROW-1 (LOC QUIVER)>
<ARROW ARROW-2 (LOC QUIVER)>
<ARROW ARROW-3 (LOC QUIVER)>

;"============================================================================="
;" Rooms, Objects and their Behaviour"

;"-----------------------------------------------------------------------------"
;"  A street in Altdorf"

<LIGHTED-ROOM STREET (IN ROOMS)(DESC "A street in Altdorf")
    (NORTH TO BELOW-SQUARE)
    (SOUTH SORRY "The crowd, pressing north towards the square,
makes that impossible.")
    (ACTION STREET-F)
    (GLOBAL ASSORTED-STALLS PRODUCE MERCHANTS)
>

<ROUTINE STREET-F (RARG)
    <COND (<=? .RARG ,M-LOOK>
        <TELL "The narrow street runs north towards the town square.
Local folk are pouring into the town through the gate to the
south, shouting greetings, offering produce for sale,
exchanging news, enquiring with exaggerated disbelief about
the prices of the goods displayed by merchants whose stalls
make progress even more difficult." CR>
        <COND (<NOT <FSET? STREET TOUCHBIT>>
            <TELL CR "\"Stay close to me, son,\" you say,
\"or you'll get lost among all these people.\"" CR>)>)>
>

<PROP SOUTH-GATE (LOC STREET)(DESC "south gate")
    (TEXT "The large wooden gate in the town walls is wide open.")
    (SYNONYM GATE)(ADJECTIVE SOUTH SOUTHERN WOODEN)
>

<PROP ASSORTED-STALLS (LOC LOCAL-GLOBALS)(DESC "assorted stalls")
    (TEXT "Food, clothing, mountain gear; the usual stuff.")
    (SYNONYM STALLS)(ADJECTIVE ASSORTED)
    (FLAGS PLURALBIT)
>

<PROP PRODUCE (LOC LOCAL-GLOBALS)(DESC "produce")
    (TEXT "Nothing special catches your eye.")
    (SYNONYM PRODUCE GOODS FOOD CLOTHING GEAR STUFF)(ADJECTIVE MOUNTAIN USUAL)
    (FLAGS PLURALBIT)
>

<PROP MERCHANTS (LOC LOCAL-GLOBALS)(DESC "merchants")
    (TEXT "A few crooks, but mostly decent traders touting their wares
with raucous overstatement.")
    (SYNONYM MERCHANTS MERCHANT TRADERS TRADER)
    (FLAGS PLURALBIT PERSONBIT)
>

<PROP LOCAL-PEOPLE (LOC GLOBAL-OBJECTS)(DESC "local people")
    (TEXT "Mountain folk, just like yourself.")
    (SYNONYM PEOPLE FOLK CROWD)(ADJECTIVE LOCAL)
    (FLAGS PLURALBIT PERSONBIT)
>

;"-----------------------------------------------------------------------------"
;"  Further along the street"

<LIGHTED-ROOM BELOW-SQUARE (IN ROOMS)(DESC "Further along the street")
    (GLOBAL ASSORTED-STALLS PRODUCE MERCHANTS)
>

;"============================================================================="
;" Interrupt Routines"

;"============================================================================="
;" Verbs and Syntax"

;"============================================================================="