; V1.0.0 
; The MIT License
; Copyright © 2020 Logan McGhee
; Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
; The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
; THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

;; =============
;; USER CONFIG
;; =============
currencyTab := 1
mapTab := 2
divTab := 3
splinterTab := 4
essenceTab := 5
dumpTab := 0
chaosRecipeTab := 0
newOrbs := 1

baseSpeedMS := 50
jitterMaxMS := 50
;; =============
;; END CONFIG
;; =============

#SingleInstance, force
CoordMode, Pixel, Screen
CoordMode, Mouse, Screen

stash := { "Divine Vessel": splinterTab, "Rarity: Normal`r`nMortal": splinterTab, "Offering to the Goddess": splinterTab, "Scarab": splinterTab, "Essence of": essenceTab, "Remnant of": essenceTab, "Splinter": splinterTab,   "Rarity: Divination Card": divTab, "Rarity: Normal`r`nSacrifice at": splinterTab, "Map`r`n--------`r`nMap Tier": mapTab, "Currency`r`nScroll Fragment":currencyTab,"Currency`r`nScroll of Wisdom":currencyTab,"Currency`r`nPortal Scroll":currencyTab,"Currency`r`nBlacksmith's Whetstone":currencyTab,"Currency`r`nArmourer's Scrap":currencyTab,"Currency`r`nGlassblower's Bauble":currencyTab,"Currency`r`nGemcutter's Prism":currencyTab,"Currency`r`nCartographer's Chisel":currencyTab,"Currency`r`nOrb of Transmutation":currencyTab,"Currency`r`nTransmutation Shard":currencyTab,"Currency`r`nOrb of Alteration":currencyTab,"Currency`r`nAlteration Shard":currencyTab,"Currency`r`nOrb of Annulment":currencyTab,"Currency`r`nAnnulment Shard":currencyTab,"Currency`r`nOrb of Chance":currencyTab,"Currency`r`nOrb of Augmentation":currencyTab,"Currency`r`nExalted Orb":currencyTab,"Currency`r`nExalted Shard":currencyTab,"Currency`r`nRegal Orb":currencyTab,"Currency`r`nRegal Shard":currencyTab,"Currency`r`nOrb of Alchemy":currencyTab,"Currency`r`nAlchemy Shard":currencyTab,"Currency`r`nChaos Orb":currencyTab,"Currency`r`nChaos Shard":currencyTab,"Currency`r`nBlessed Orb":currencyTab,"Currency`r`nDivine Orb":currencyTab,"Currency`r`nJeweller's Orb":currencyTab,"Currency`r`nOrb of Fusing":currencyTab,"Currency`r`nChromatic Orb":currencyTab,"Currency`r`nOrb of Scouring":currencyTab,"Currency`r`nOrb of Regret":currencyTab,"Currency`r`nVaal Orb":currencyTab,"Currency`r`nOrb of Horizons":currencyTab,"Currency`r`nPerandus Coin":currencyTab,"Currency`r`nSilver Coin":currencyTab,"Currency`r`nSimple Sextant":currencyTab,"Currency`r`nPrime Sextant":currencyTab,"Currency`r`nAwakened Sextant":currencyTab,"Currency`r`nHorizon Shard":currencyTab,"Currency`r`nOrb of Binding":currencyTab,"Currency`r`nEngineer's Orb":currencyTab,"Currency`r`nAncient Orb":currencyTab,"Currency`r`nAncient Shard":currencyTab,"Currency`r`nBinding Shard":currencyTab,"Currency`r`nEngineer's Shard":currencyTabl, "--------`r`nUnidentified":chaosRecipeTab, "Delirium Orb":newOrbs}

startingTab := 1
currentTab := 1

; 1080p settings
x1 := 1289
y1 := 607

x2 := 1871
y2 := 821

; 1440p settings
; x1 := 1731
; y1 := 820

; x2 := 2503
; y2 := 1099

xSize := (x2-x1)/11
ySize := (y2-y1)/4
i := 0
j := 0


^Space::
    Sleep, 500
    currentTab := GoToTab(1, 50) ; Go left 50 times in case the stash isn't on the leftmost tab.
    Loop, 5 {
        Loop, 12 {
            MouseMove, (x1 + (j * xSize)), (y1 + (i * ySize)), 0
            Random, sleeperOffset, 0, jitterMaxMS
            Sleep, baseSpeedMS + sleeperOffset
            send, ^c
            Sleep, baseSpeedMS + sleeperOffset
            copiedText = %Clipboard%
            clipboard := ""
            For k, v in stash {
                found := InStr(copiedText, k)
                if(found){
                    if(!v){
                        Break
                    }
                    ; MsgBox, %v% %k%
                    currentTab := GoToTab(v, currentTab)
                    Send, {Ctrl Down}{Click}{Ctrl up}
                    Sleep, baseSpeedMS + sleeperOffset
                    Break
                }
            }
            


            j++
        }
        j = 0
        i++
    }
    i = 0
    
    ; 
    ; MsgBox, %copiedText%
    ; currentTab := GoToTab(4,currentTab)
    Loop, 60 {

    }

    return

GoToTab(target,current)
{
    if(target == current){
        return current
    } else if (target < current){
        send, {Left}
        return GoToTab(target, current-1)
    } else {
        send, {Right}
        return GoToTab(target,current+1)
    }
}
