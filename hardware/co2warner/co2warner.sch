EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_Microchip_ATmega:ATmega88P-20PU U1
U 1 1 5FE1B3D0
P 2100 3300
F 0 "U1" H 1456 3346 50  0000 R CNN
F 1 "ATmega88P-20PU" H 1456 3255 50  0000 R CNN
F 2 "Package_DIP:DIP-28_W7.62mm" H 2100 3300 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-8025-8-bit-AVR-Microcontroller-ATmega48P-88P-168P_Datasheet.pdf" H 2100 3300 50  0001 C CNN
	1    2100 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:Battery_Cell BT1
U 1 1 5FE201AF
P 7550 1650
F 0 "BT1" H 7668 1746 50  0000 L CNN
F 1 "3" H 7668 1655 50  0000 L CNN
F 2 "" V 7550 1710 50  0001 C CNN
F 3 "~" V 7550 1710 50  0001 C CNN
	1    7550 1650
	1    0    0    -1  
$EndComp
$Comp
L Sensor:DHT11 U2
U 1 1 5FE20D16
P 4950 2400
F 0 "U2" V 4569 2400 50  0000 C CNN
F 1 "DHT11" V 4660 2400 50  0000 C CNN
F 2 "Sensor:Aosong_DHT11_5.5x12.0_P2.54mm" H 4950 2000 50  0001 C CNN
F 3 "http://akizukidenshi.com/download/ds/aosong/DHT11.pdf" H 5100 2650 50  0001 C CNN
	1    4950 2400
	0    1    1    0   
$EndComp
Wire Wire Line
	2700 3400 4050 3400
Wire Wire Line
	5300 3400 5300 4550
$Comp
L Connector:AVR-ISP-6 J1
U 1 1 5FE1DF26
P 3400 5550
F 0 "J1" V 3025 5600 50  0000 C CNN
F 1 "AVR-ISP-6" V 2934 5600 50  0000 C CNN
F 2 "" V 3150 5600 50  0001 C CNN
F 3 " ~" H 2125 5000 50  0001 C CNN
	1    3400 5550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5300 4550 6050 4550
$Comp
L Sensor_Gas:CCS811 U3
U 1 1 5FE210A8
P 6450 4650
F 0 "U3" H 6450 5331 50  0000 C CNN
F 1 "CCS811" H 6450 5240 50  0000 C CNN
F 2 "Package_LGA:AMS_LGA-10-1EP_2.7x4mm_P0.6mm" H 6450 4050 50  0001 C CNN
F 3 "http://ams.com/eng/Products/Environmental-Sensors/Air-Quality-Sensors/CCS811" H 6450 4450 50  0001 C CNN
	1    6450 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 3500 3800 3500
Wire Wire Line
	5200 3500 5200 4650
Wire Wire Line
	5200 4650 6050 4650
Wire Wire Line
	2700 3300 4650 3300
Wire Wire Line
	4650 3300 4650 4850
Wire Wire Line
	4650 4850 6050 4850
Wire Wire Line
	6050 4350 5550 4350
Wire Wire Line
	5550 4350 5550 5250
Wire Wire Line
	6050 4450 5400 4450
Wire Wire Line
	5400 4450 5400 3200
Wire Wire Line
	5400 3200 2700 3200
Wire Wire Line
	6850 4450 6950 4450
Wire Wire Line
	6950 4450 6950 4550
Wire Wire Line
	6950 4550 6850 4550
Wire Wire Line
	6850 4750 6950 4750
NoConn ~ 6950 4750
$Comp
L pspice:INDUCTOR L1
U 1 1 5FE36E25
P 8550 1050
F 0 "L1" H 8550 1265 50  0000 C CNN
F 1 "100u" H 8550 1174 50  0000 C CNN
F 2 "" H 8550 1050 50  0001 C CNN
F 3 "~" H 8550 1050 50  0001 C CNN
	1    8550 1050
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D1
U 1 1 5FE38521
P 9250 1050
F 0 "D1" H 9250 834 50  0000 C CNN
F 1 "D_Schottky" H 9250 925 50  0000 C CNN
F 2 "" H 9250 1050 50  0001 C CNN
F 3 "~" H 9250 1050 50  0001 C CNN
	1    9250 1050
	-1   0    0    1   
$EndComp
$Comp
L Device:CP C1
U 1 1 5FE393E2
P 8050 1600
F 0 "C1" H 8168 1646 50  0000 L CNN
F 1 "47u" H 8168 1555 50  0000 L CNN
F 2 "" H 8088 1450 50  0001 C CNN
F 3 "~" H 8050 1600 50  0001 C CNN
	1    8050 1600
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C2
U 1 1 5FE39CD5
P 10150 1600
F 0 "C2" H 10268 1646 50  0000 L CNN
F 1 "22u" H 10268 1555 50  0000 L CNN
F 2 "" H 10188 1450 50  0001 C CNN
F 3 "~" H 10150 1600 50  0001 C CNN
	1    10150 1600
	1    0    0    -1  
$EndComp
$Comp
L rollman054:HT7733A U4
U 1 1 5FE3B433
P 9400 1600
F 0 "U4" H 9400 1915 50  0000 C CNN
F 1 "HT7733A" H 9400 1824 50  0000 C CNN
F 2 "" H 9400 1600 50  0001 C CNN
F 3 "" H 9400 1600 50  0001 C CNN
	1    9400 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 1450 7550 1050
Wire Wire Line
	7550 1050 8050 1050
Wire Wire Line
	8050 1450 8050 1050
Connection ~ 8050 1050
Wire Wire Line
	8050 1050 8300 1050
Wire Wire Line
	7550 1750 7550 2000
Wire Wire Line
	7550 2000 8050 2000
Wire Wire Line
	8050 2000 8050 1750
Wire Wire Line
	8050 2000 9400 2000
Wire Wire Line
	9400 2000 9400 1900
Connection ~ 8050 2000
Wire Wire Line
	9400 2000 9800 2000
Wire Wire Line
	10150 2000 10150 1750
Connection ~ 9400 2000
Wire Wire Line
	8800 1050 8950 1050
Wire Wire Line
	9400 1050 9900 1050
Wire Wire Line
	10150 1050 10150 1450
Connection ~ 10150 1050
Wire Wire Line
	10150 2000 10550 2000
Connection ~ 10150 2000
Wire Wire Line
	8950 1050 8950 1600
Wire Wire Line
	8950 1600 9000 1600
Connection ~ 8950 1050
Wire Wire Line
	8950 1050 9100 1050
Wire Wire Line
	9800 1600 9900 1600
Wire Wire Line
	9900 1600 9900 1050
Connection ~ 9900 1050
Wire Wire Line
	9900 1050 10150 1050
Wire Wire Line
	10550 1050 10550 950 
Wire Wire Line
	10550 2000 10550 2100
$Comp
L power:VCC #PWR013
U 1 1 5FE4452B
P 10550 950
F 0 "#PWR013" H 10550 800 50  0001 C CNN
F 1 "VCC" H 10567 1123 50  0000 C CNN
F 2 "" H 10550 950 50  0001 C CNN
F 3 "" H 10550 950 50  0001 C CNN
	1    10550 950 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR014
U 1 1 5FE44CFA
P 10550 2100
F 0 "#PWR014" H 10550 1850 50  0001 C CNN
F 1 "GND" H 10555 1927 50  0000 C CNN
F 2 "" H 10550 2100 50  0001 C CNN
F 3 "" H 10550 2100 50  0001 C CNN
	1    10550 2100
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG01
U 1 1 5FE45476
P 9800 2000
F 0 "#FLG01" H 9800 2075 50  0001 C CNN
F 1 "PWR_FLAG" H 9800 2173 50  0000 C CNN
F 2 "" H 9800 2000 50  0001 C CNN
F 3 "~" H 9800 2000 50  0001 C CNN
	1    9800 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 3400 4050 2350
Connection ~ 4050 3400
Wire Wire Line
	4050 3400 5300 3400
Wire Wire Line
	3800 3500 3800 2350
Connection ~ 3800 3500
Wire Wire Line
	3800 3500 5200 3500
$Comp
L Device:R R1
U 1 1 5FE47F94
P 3800 2200
F 0 "R1" H 3870 2246 50  0000 L CNN
F 1 "10k" H 3870 2155 50  0000 L CNN
F 2 "" V 3730 2200 50  0001 C CNN
F 3 "~" H 3800 2200 50  0001 C CNN
	1    3800 2200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5FE4830A
P 4050 2200
F 0 "R2" H 4120 2246 50  0000 L CNN
F 1 "10k" H 4120 2155 50  0000 L CNN
F 2 "" V 3980 2200 50  0001 C CNN
F 3 "~" H 4050 2200 50  0001 C CNN
	1    4050 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 2050 3800 1550
Wire Wire Line
	4050 2050 4050 1550
$Comp
L power:VCC #PWR04
U 1 1 5FE4A034
P 3800 1550
F 0 "#PWR04" H 3800 1400 50  0001 C CNN
F 1 "VCC" H 3817 1723 50  0000 C CNN
F 2 "" H 3800 1550 50  0001 C CNN
F 3 "" H 3800 1550 50  0001 C CNN
	1    3800 1550
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR05
U 1 1 5FE4AF19
P 4050 1550
F 0 "#PWR05" H 4050 1400 50  0001 C CNN
F 1 "VCC" H 4067 1723 50  0000 C CNN
F 2 "" H 4050 1550 50  0001 C CNN
F 3 "" H 4050 1550 50  0001 C CNN
	1    4050 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 2700 4950 3000
Wire Wire Line
	4950 3000 4300 3000
Wire Wire Line
	4300 3000 4300 2350
Connection ~ 4300 3000
Wire Wire Line
	4300 3000 2700 3000
$Comp
L Device:R R3
U 1 1 5FE4D3F7
P 4300 2200
F 0 "R3" H 4370 2246 50  0000 L CNN
F 1 "10k" H 4370 2155 50  0000 L CNN
F 2 "" V 4230 2200 50  0001 C CNN
F 3 "~" H 4300 2200 50  0001 C CNN
	1    4300 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 2050 4300 1550
$Comp
L power:VCC #PWR07
U 1 1 5FE4E690
P 4300 1550
F 0 "#PWR07" H 4300 1400 50  0001 C CNN
F 1 "VCC" H 4317 1723 50  0000 C CNN
F 2 "" H 4300 1550 50  0001 C CNN
F 3 "" H 4300 1550 50  0001 C CNN
	1    4300 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 2400 4550 2400
Wire Wire Line
	4550 2400 4550 2550
Wire Wire Line
	5250 2400 5400 2400
$Comp
L power:GND #PWR08
U 1 1 5FE5409F
P 4550 2550
F 0 "#PWR08" H 4550 2300 50  0001 C CNN
F 1 "GND" H 4555 2377 50  0000 C CNN
F 2 "" H 4550 2550 50  0001 C CNN
F 3 "" H 4550 2550 50  0001 C CNN
	1    4550 2550
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR09
U 1 1 5FE55320
P 5400 2300
F 0 "#PWR09" H 5400 2150 50  0001 C CNN
F 1 "VCC" H 5417 2473 50  0000 C CNN
F 2 "" H 5400 2300 50  0001 C CNN
F 3 "" H 5400 2300 50  0001 C CNN
	1    5400 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 2300 5400 2400
Wire Wire Line
	6450 4150 6450 3900
$Comp
L power:VCC #PWR011
U 1 1 5FE5796C
P 6450 3900
F 0 "#PWR011" H 6450 3750 50  0001 C CNN
F 1 "VCC" H 6467 4073 50  0000 C CNN
F 2 "" H 6450 3900 50  0001 C CNN
F 3 "" H 6450 3900 50  0001 C CNN
	1    6450 3900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR012
U 1 1 5FE58311
P 6450 5350
F 0 "#PWR012" H 6450 5100 50  0001 C CNN
F 1 "GND" H 6455 5177 50  0000 C CNN
F 2 "" H 6450 5350 50  0001 C CNN
F 3 "" H 6450 5350 50  0001 C CNN
	1    6450 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 5150 6450 5350
$Comp
L power:GND #PWR010
U 1 1 5FE59F11
P 5550 5250
F 0 "#PWR010" H 5550 5000 50  0001 C CNN
F 1 "GND" H 5555 5077 50  0000 C CNN
F 2 "" H 5550 5250 50  0001 C CNN
F 3 "" H 5550 5250 50  0001 C CNN
	1    5550 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 5150 3200 2500
Wire Wire Line
	3200 2500 2700 2500
Wire Wire Line
	3300 5150 3300 2400
Wire Wire Line
	3300 2400 2700 2400
Wire Wire Line
	3400 5150 3400 2600
Wire Wire Line
	3400 2600 2700 2600
Wire Wire Line
	3500 5150 3500 3600
Wire Wire Line
	3500 3600 2700 3600
Wire Wire Line
	3800 5650 4050 5650
Wire Wire Line
	4050 5650 4050 5800
Wire Wire Line
	2900 5650 2750 5650
Wire Wire Line
	2750 5650 2750 5450
Wire Wire Line
	2100 4800 2100 4950
Wire Wire Line
	2100 1800 2100 1650
$Comp
L power:VCC #PWR01
U 1 1 5FE676C7
P 2100 1650
F 0 "#PWR01" H 2100 1500 50  0001 C CNN
F 1 "VCC" H 2117 1823 50  0000 C CNN
F 2 "" H 2100 1650 50  0001 C CNN
F 3 "" H 2100 1650 50  0001 C CNN
	1    2100 1650
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR03
U 1 1 5FE67E24
P 2750 5450
F 0 "#PWR03" H 2750 5300 50  0001 C CNN
F 1 "VCC" H 2767 5623 50  0000 C CNN
F 2 "" H 2750 5450 50  0001 C CNN
F 3 "" H 2750 5450 50  0001 C CNN
	1    2750 5450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 5FE68904
P 2100 4950
F 0 "#PWR02" H 2100 4700 50  0001 C CNN
F 1 "GND" H 2105 4777 50  0000 C CNN
F 2 "" H 2100 4950 50  0001 C CNN
F 3 "" H 2100 4950 50  0001 C CNN
	1    2100 4950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 5FE69392
P 4050 5800
F 0 "#PWR06" H 4050 5550 50  0001 C CNN
F 1 "GND" H 4055 5627 50  0000 C CNN
F 2 "" H 4050 5800 50  0001 C CNN
F 3 "" H 4050 5800 50  0001 C CNN
	1    4050 5800
	1    0    0    -1  
$EndComp
NoConn ~ 1500 2100
NoConn ~ 2700 2100
NoConn ~ 2700 2200
NoConn ~ 2700 2300
NoConn ~ 2700 2700
NoConn ~ 2700 2800
NoConn ~ 2700 3100
NoConn ~ 2700 3800
NoConn ~ 2700 3900
NoConn ~ 2700 4000
NoConn ~ 2700 4100
NoConn ~ 2700 4200
NoConn ~ 2700 4300
NoConn ~ 2700 4400
NoConn ~ 2700 4500
NoConn ~ 2200 1800
Connection ~ 9800 2000
Wire Wire Line
	9800 2000 10150 2000
NoConn ~ 6050 4950
Wire Wire Line
	10150 1050 10550 1050
$EndSCHEMATC
