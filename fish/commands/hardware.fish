if [ $TJMOS = 'darwin' ]
	alias batteryinfo='ioreg -w0 -l | grep -i IOBatteryInfo'
end
