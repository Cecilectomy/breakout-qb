DECLARE FUNCTION MULTIKEY% (T%)

'====================================================
'https://qb64phoenix.com/qb64wiki/index.php/Scancodes
'====================================================
FUNCTION MULTIKEY% (T%)
    STATIC KeyPress(), FirstTime

    IF FirstTime = 0 THEN
        DIM KeyPress(127)        
        Firsttime = 1
    END IF

    IF T% <= 0 THEN
        MULTIKEY = 0
        EXIT FUNCTION
    END IF

    i = INP(&H60)
    DO
        IF (i AND 128) THEN KeyPress(i XOR 128) = 0
        IF (i AND 128) = 0 THEN KeyPress(i) = -1
        i2 = i
        i = INP(&H60)
        POKE 1050, PEEK(1052)
    LOOP UNTIL i = i2

    MULTIKEY = KeyPress(T%)
END FUNCTION
