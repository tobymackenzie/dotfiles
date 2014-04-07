function battery
	ioreg -w0 -l | grep -i IOBatteryInfo
end
