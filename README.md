# PoE-Auto-Deposit

## Description
Simple auto hotkey script to deposit all items from inventory into their designated stash tabs <br>
Set up by default for 1440p resolution, you will need to change some minor variables to get going.

---

## User Config Breakdown
x1 & y1 - centered coordinates of the top-left-most inventory slot<br>
x2 & y2 - centered coordinates of the bottom-right-most inventory slot<br><br>
If your currency/map/div/splinter/essence tabs are not numbered 1,2,3,4,5 respectively, please be sure to change the values depending on your order.<br><br>
baseSpeedMS and jitterMaxMS are speed values. Each action will occur with a delay of the base + some random number between 0 and jitterMax, in milliseconds. A lower value will operate faster (with a potentially higher risk of failure) while a higher value will operate slower (with a lower likelihood of being caught by an apm spike detection)

---

## How to use:
Adjust the variables in the user config section mentioned above, open your stash to the left-most tab and press ctrl+space to activate. There will be a brief pause, then your items will be stashed. 

---

### Need help with finding your x/y coords?
Check out Autohotkey's Window Spy [here](https://amourspirit.github.io/AutoHotkey-Snippit/WindowSpy.html)

---

If you set your speed values sub 10ms, it, you can get it silly fast. I don't recommend this in case GGG is looking out for high apm spikes, but live your best life.<br>
![Holy Stash](https://media.giphy.com/media/fqW0SLXiXBjI5s1ioy/giphy.gif)

