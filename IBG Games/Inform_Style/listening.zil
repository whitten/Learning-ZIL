;"============================================================================="
;" LISTENING - Inform Style Library Extension                                  "
;"-----------------------------------------------------------------------------"
;"  V-LISTEN                                                                   "
;"  The Inform library defines the verb 'listen' and associated syntax.        "
;"  Here is a ZIL version which emulates the Inform library.                   "
;"-----------------------------------------------------------------------------"

<ROUTINE V-LISTEN () <TELL "You hear nothing unexpected." CR>>

<SYNTAX LISTEN TO OBJECT = V-LISTEN>
<SYNTAX LISTEN OBJECT = V-LISTEN>
<SYNTAX LISTEN = V-LISTEN>

;"============================================================================="