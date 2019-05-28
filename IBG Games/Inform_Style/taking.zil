;"============================================================================="
;" TAKING - Inform Style Library Extension                                     "
;"-----------------------------------------------------------------------------"
;"  TAKE-CAPACITY-CHECK                                                        "
;"  Inform measures capacity non-recursively. If you can only carry 10 things, "
;"  you might get around it by picking up a backpack that holds 10 more things."
;"  Then you could put another backpack inside that one to carry even more,    "
;"  and so on.                                                                 "
;"  ZILF (by default) measures it recursively - you can only carry a certain   "
;"  total weight, no matter how it's distributed. The backpack is just another "
;"  thing you have to carry.                                                   "
;"  Neither system is especially realistic, but Inform's is probably more fun  "
;"  for the player (largely because it's more lenient).                        "
;"-----------------------------------------------------------------------------"

<BIND ((REDEFINE T))
    <ROUTINE TAKE-CAPACITY-CHECK
        (O "OPT" SILENT "AUX" (CAP <GETP PLAYER ,P?CAPACITY>) CWT NWT)
        <COND (<L? .CAP 0> <RTRUE>)>
        <SET CWT <CONTENTS-WEIGHT PLAYER>>
        <SET NWT <GETP .O ,P?SIZE>>
        <COND (<G? <+ .CWT .NWT> .CAP>
            <COND
                (.SILENT)
                (<SHORT-REPORT?>
                    <TELL "You're carrying too much." CR>)
                (ELSE
                    <TELL "You're carrying too much to pick up " T .O "." CR>)>
            <RFALSE>)>
        <RTRUE>
    >
>

;"============================================================================="