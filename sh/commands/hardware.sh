if [[ "${TJM_OS}" == 'darwin' ]]; then
	alias batteryinfo='ioreg -w0 -l | grep -i IOBatteryInfo'
fi
