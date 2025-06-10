'$INCLUDE:'inc\multikey\multikey.bi'

DECLARE SUB NEWLEVEL ()
DECLARE SUB RESETGAME ()

DIM SHARED bricks(15, 5)

DIM SHARED lives%: lives% = 3
DIM SHARED score%: score% = 0
DIM SHARED playing%: playing% = 0
DIM SHARED bricksremain%: bricksremain% = 1

DIM SHARED padx%: padx% = 150
DIM SHARED pady%: pady% = 180
DIM SHARED padnewx%: padnewx% = padx%

DIM SHARED ballx%: ballx% = rand * 320
DIM SHARED bally%: bally% = 75
DIM SHARED vball%: vball% = 2
DIM SHARED hball%: hball% = 2

RANDOMIZE TIMER
SCREEN 7, 0, 1, 0

MULTIKEYSTART

RESETGAME

DO UNTIL MULTIKEYPRESSED(1)
    _LIMIT(60)

    PCOPY 1, 0
    _DISPLAY
    CLS

    IF MULTIKEYPRESSED(75) THEN padnewx% = padnewx% - 5
    IF MULTIKEYPRESSED(77) THEN padnewx% = padnewx% + 5

    IF MULTIKEYPRESSED(57) AND lives% > 0 THEN playing% = 1
    IF MULTIKEYPRESSED(19) AND lives% = 0 THEN RESETGAME

    IF bricksremain% <= 0 THEN NEWLEVEL

    padx% = padx% + ((padnewx% - padx%) * 0.15)

    IF ballx% <= 1 THEN hball% = 1
    IF bally% <= 1 THEN vball% = 1
    IF ballx% >= 320 THEN hball% = 2
    IF bally% > 200 THEN
        playing% = 0
        lives% = lives% - 1
    END IF

    IF playing% = 1 AND lives% > 0 THEN
        IF hball% = 1 THEN ballx% = ballx% + 3
        IF hball% = 2 THEN ballx% = ballx% - 3
        IF vball% = 1 THEN bally% = bally% + 3
        IF vball% = 2 THEN bally% = bally% - 3
    ELSE
        ballx% = padx% + 10
        bally% = pady% - 2
    END IF

    IF (ballx% + 2) > padx% AND (ballx% - 2) < (padx% + 20) AND (bally% + 2) > pady% AND (bally% - 2) < (pady% + 5) THEN
        vball% = 2
    END IF

    FOR y = 1 TO 5
        FOR x = 1 TO 15
            IF (ballx% + 2) > ((x * 20) - 10) AND (ballx% - 2) < (((x * 20) + 18) - 10) AND (bally% + 2) > (y * 5) AND (bally% - 2) < ((y * 5) + 13) AND bricks(x, y) <> 0 THEN
                bricks(x, y) = 0
                vball% = vball% + 1
                score% = score% + 1
            END IF
            IF vball% > 2 THEN
                vball% = 1
            END IF
        NEXT
    NEXT

    IF score% < 0 THEN score% = 0
    IF lives% < 0 THEN lives% = 0
    IF lives% = 0 THEN
        LOCATE 13, 16
        PRINT "GAME OVER"
        LOCATE 14, 16
        PRINT "R = RESET"
    END IF

    LOCATE 25
    PRINT score%

    IF playing% = 0 THEN
        LOCATE 25, 20
        IF hball% = 1 THEN
            PRINT ">"
        ELSE
            PRINT "<"
        END IF
    END IF

    FOR l = 1 TO lives%
        LOCATE 25, 40 - l
        IF l <= lives% THEN PRINT "*" ELSE PRINT " "
    NEXT

    bricksremain% = 0
    FOR y = 1 TO 5
        FOR x = 1 TO 15
            IF bricks(x, y) <> 0 THEN
                LINE ((x * 20) - 10, (y * 5) + 10)-(((x * 20) + 18) - 10, (y * 5) + 13), bricks(x, y), BF
                bricksremain% = 1
            ELSE
                LINE ((x * 20) - 10, (y * 5) + 10)-(((x * 20) + 18) - 10, (y * 5) + 13), 0, BF
            END IF
        NEXT
    NEXT

    LINE (padx%, pady%)-(padx% + 20, pady% + 5), 15, BF

    CIRCLE (ballx%, bally%), 3, 15
    PAINT (ballx%, bally%), 15
LOOP

MULTIKEYSTOP

SYSTEM

SUB NEWLEVEL
    FOR y = 1 TO 5
        FOR x = 1 TO 15
            bricks(x, y) = RND * 14 + 1
        NEXT
    NEXT

    lives% = lives% + 1
    playing% = 0
    bricksremain% = 1
END SUB

SUB RESETGAME
    NEWLEVEL
    
    lives% = 3
    score% = 0
    playing% = 0
    bricksremain% = 1
END SUB
