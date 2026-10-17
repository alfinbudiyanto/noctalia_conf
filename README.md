### specific to test when charging or discharging

- Run the Script Manually with Injected Variables

You can execute your charging script (on-charge.sh) directly inside your terminal by prefixing the command with your fake state variables.

1. Simulate: Battery is "Charging" while the system hits "power-saver"

Open your terminal and run this command (adjust the path to your actual script file):
```
NOCTALIA_BATTERY_STATE="charging" NOCTALIA_POWER_PROFILE="power-saver" NOCTALIA_POWER_PROFILE_PREVIOUS="balanced" NOCTALIA_POWER_PROFILE_ORIGIN="external" bash ~/.config/noctalia/hooks/on-charge.sh
```

2. Simulate: Battery is "Discharging" (Unplugged) while hitting "power-saver"

If you want to see how your script behaves when the charger is disconnected:
```
NOCTALIA_BATTERY_STATE="discharging" NOCTALIA_POWER_PROFILE="power-saver"
```