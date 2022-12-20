from subprocess import Popen, PIPE
from os.path import exists

print("Running power_warning.py")

def writeCharge(percent, path):
    with open(path, "wt") as f:
        f.write(f'{percent}')

batery = "BAT1"

print("Checking battery status")

with open(f"/sys/class/power_supply/{batery}/charge_now") as f:
    charge_now = float(f.read())
with open(f"/sys/class/power_supply/{batery}/charge_full") as f:
    charge_full = float(f.read())

lastChargePath = "/home/martin/.cache/lastCharge"

percent = 100*charge_now/charge_full

if not exists(lastChargePath):
    writeCharge(percent, lastChargePath)

with open(lastChargePath, "rt") as f:
    try:
        lastPercent = float(f.read())
    except:
        with open(lastChargePath, "wt") as f2:
            f2.write("100.0")
            lastPercent = 100.0

print("Checking percentage")

if percent <= 30 and percent < lastPercent:
    print("Low power")
    p = Popen(['osd_cat','-A','center','-p','middle','-f','-*-*-bold-*-*-*-36-120-*-*-*-*-*-*','-cred','-s','5'],stdin=PIPE)
    p.communicate(input=b"Battery Low!")
    p.wait()
    p = Popen(['notify-send', 'Low Power', f'{percent:.3}%'])
else:
    print("Enough power")

writeCharge(percent, lastChargePath)
