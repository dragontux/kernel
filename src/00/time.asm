#IF CLOCK

#define secsPerHour 60 * 60
#define secsPerDay secsPerHour * 24

; Sets the clock to HLDE, in ticks
setClock:
    push af
        ld a, h
        out ($41), a
        ld a, l
        out ($42), a
        ld a, d
        out ($43), a
        ld a, e
        out ($44), a
        ld a, 1
        out ($40), a
        ld a, 3
        out ($40), a
    pop af
    ret
    
; Time in HLDE
getTimeInTicks:
    push af
        in a, ($45)
        ld h, a
        in a, ($46)
        ld l, a
        in a, ($47)
        ld d, a
        in a, ($48)
        ld e, a
    pop af
    ret
    
; Converts HLDE (ticks) to:
; H: Day
; L: Month
; IX: Year
; B: Hour
; C: Minute
; D: Second
; A: Day of Week
; Epoch is January 1st, 1997 (Wednesday)
; Based on Linux's time.c
; Reference: https://github.com/torvalds/linux/blob/master/kernel/time/timeconv.c
convertTimeFromTicks:
    ; TODO
    ret
    
; H: Day
; L: Month
; IX: Year
; B: Hour
; C: Minute
; D: Second
; A: Day of Week
; Output: HLDE: Ticks
convertTimeToTicks:
    ; TODO
    ret
    
; H: Day
; L: Month
; D: Year
; B: Hours
; C: Minutes
; E: Seconds
; A: Day of Week
getTime:
    call getTimeInTicks
    call convertTime
    ret

#undefine ticks
#undefine days
#undefine hour
#undefine minute
#undefine second
#undefine dayOfWeek
    
#ENDIF
