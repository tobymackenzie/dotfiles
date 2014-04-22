if [ $TJM_OS = 'darwin' ]
	alias batteryinfo='ioreg -w0 -l | grep -i IOBatteryInfo'
end
