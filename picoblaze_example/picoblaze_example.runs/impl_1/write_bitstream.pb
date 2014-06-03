
c
Command: %s
1870*	planAhead27
#open_checkpoint kpsm_top_routed.dcp2default:defaultZ12-2866
]
-Analyzing %s Unisim elements for replacement
17*netlist2
492default:defaultZ29-17
a
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28
o
Netlist was created with %s %s291*project2
Vivado2default:default2
2014.12default:defaultZ1-479

Loading clock regions from %s
13*device2f
RE:/Xilinx/Vivado/2014.1/data\parts/xilinx/kintex7/kintex7/xc7k325t/ClockRegion.xml2default:defaultZ21-13
ž
Loading clock buffers from %s
11*device2g
SE:/Xilinx/Vivado/2014.1/data\parts/xilinx/kintex7/kintex7/xc7k325t/ClockBuffers.xml2default:defaultZ21-11
š
&Loading clock placement rules from %s
318*place2Z
FE:/Xilinx/Vivado/2014.1/data/parts/xilinx/kintex7/ClockPlacerRules.xml2default:defaultZ30-318
˜
)Loading package pin functions from %s...
17*device2V
BE:/Xilinx/Vivado/2014.1/data\parts/xilinx/kintex7/PinFunctions.xml2default:defaultZ21-17
š
Loading package from %s
16*device2i
UE:/Xilinx/Vivado/2014.1/data\parts/xilinx/kintex7/kintex7/xc7k325t/ffg900/Package.xml2default:defaultZ21-16

Loading io standards from %s
15*device2W
CE:/Xilinx/Vivado/2014.1/data\./parts/xilinx/kintex7/IOStandards.xml2default:defaultZ21-15
™
+Loading device configuration modes from %s
14*device2U
AE:/Xilinx/Vivado/2014.1/data\parts/xilinx/kintex7/ConfigModes.xml2default:defaultZ21-14
·
Parsing XDC File [%s]
179*designutils2€
lC:/project/picoblaze_example/picoblaze_example.runs/impl_1/.Xil/Vivado-6292-admini-PC/dcp/kpsm_top_early.xdc2default:defaultZ20-179
Ê
%Done setting XDC timing constraints.
35*timing2n
XC:/project/picoblaze_example/picoblaze_example.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc2default:default2
562default:default8@Z38-35
½
Deriving generated clocks
2*timing2n
XC:/project/picoblaze_example/picoblaze_example.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc2default:default2
562default:default8@Z38-2
ú
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2 
get_clocks: 2default:default2
00:00:272default:default2
00:00:362default:default2
936.9532default:default2
454.1372default:defaultZ17-268
À
Finished Parsing XDC File [%s]
178*designutils2€
lC:/project/picoblaze_example/picoblaze_example.runs/impl_1/.Xil/Vivado-6292-admini-PC/dcp/kpsm_top_early.xdc2default:defaultZ20-178
°
Parsing XDC File [%s]
179*designutils2z
fC:/project/picoblaze_example/picoblaze_example.runs/impl_1/.Xil/Vivado-6292-admini-PC/dcp/kpsm_top.xdc2default:defaultZ20-179
¹
Finished Parsing XDC File [%s]
178*designutils2z
fC:/project/picoblaze_example/picoblaze_example.runs/impl_1/.Xil/Vivado-6292-admini-PC/dcp/kpsm_top.xdc2default:defaultZ20-178
6
Reading XDEF placement.
206*designutilsZ20-206
4
Reading XDEF routing.
207*designutilsZ20-207
€
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2$
Read XDEF File: 2default:default2
00:00:002default:default2 
00:00:00.1082default:default2
937.7342default:default2
0.7662default:defaultZ17-268
3
Restoring placement.
754*designutilsZ20-754
Ù
ORestored %s out of %s XDEF sites from archive | CPU: %s secs | Memory: %s MB |
403*designutils2
502default:default2
502default:default2
0.0000002default:default2
0.0000002default:defaultZ20-403
C
Pushed %s inverter(s).
98*opt2
02default:defaultZ31-138
Ò
!Unisim Transformation Summary:
%s111*project2•
€  A total of 45 instances were transformed.
  LUT6_2 => LUT6_2 (LUT5, LUT6): 39 instances
  RAM32M => RAM32M (RAMD32, RAMD32, RAMD32, RAMD32, RAMD32, RAMD32, RAMS32, RAMS32): 4 instances
  RAM64M => RAM64M (RAMD64E, RAMD64E, RAMD64E, RAMD64E): 2 instances
2default:defaultZ1-111
Y
$Checkpoint was created with build %s293*project2
8818342default:defaultZ1-484
ÿ
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2%
open_checkpoint: 2default:default2
00:00:382default:default2
00:00:492default:default2
937.7702default:default2
765.5202default:defaultZ17-268
›
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7k325t2default:defaultZ17-347
‹
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7k325t2default:defaultZ17-349
o
,Running DRC as a precondition to command %s
1349*	planAhead2#
write_bitstream2default:defaultZ12-1349
G
Running DRC with %s threads
24*drc2
22default:defaultZ23-27
]
DRC finished with %s
1905*	planAhead2(
0 Errors, 1 Warnings2default:defaultZ12-3199
`
BPlease refer to the DRC report (report_drc) for more information.
1906*	planAheadZ12-3200
6
Loading data files...
1271*designutilsZ12-1165
5
Loading site data...
1273*designutilsZ12-1167
6
Loading route data...
1272*designutilsZ12-1166
6
Processing options...
1362*designutilsZ12-1514
3
Creating bitmap...
1249*designutilsZ12-1141
.
Creating bitstream...
7*	bitstreamZ40-7
V
Writing bitstream %s...
11*	bitstream2"
./kpsm_top.bit2default:defaultZ40-11
=
Bitgen Completed Successfully.
1606*	planAheadZ12-1842
Œ
òWebTalk data collection is mandatory for users of free Webpack licenses. To see the specific WebTalk data collected for your design, open the usage_statistics_webtalk.html or usage_statistics_webtalk.xml file in the implementation directory.
120*projectZ1-120
s
ZWebTalk report has not been sent to Xilinx. Please check your network and proxy settings.
185*commonZ17-185
Q
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83
€
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2%
write_bitstream: 2default:default2
00:02:032default:default2
00:03:392default:default2
1311.0862default:default2
373.3162default:defaultZ17-268


End Record