
H
Command: %s
53*	vivadotcl2 
route_design2default:defaultZ4-113
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7k325t2default:defaultZ17-347
�
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7k325t2default:defaultZ17-349
g
,Running DRC as a precondition to command %s
22*	vivadotcl2 
route_design2default:defaultZ4-22
G
Running DRC with %s threads
24*drc2
22default:defaultZ23-27
M
DRC finished with %s
79*	vivadotcl2
0 Errors2default:defaultZ4-198
\
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199
M

Starting %s Task
103*constraints2
Routing2default:defaultZ18-103
p
BMultithreading enabled for route_design using a maximum of %s CPUs97*route2
22default:defaultZ35-254
K

Starting %s Task
103*constraints2
Route2default:defaultZ18-103
g

Phase %s%s
101*constraints2
1 2default:default2#
Build RT Design2default:defaultZ18-101
9
-Phase 1 Build RT Design | Checksum: 1befb845
*common
�

%s
*constraints2q
]Time (s): cpu = 00:04:04 ; elapsed = 00:03:33 . Memory (MB): peak = 1237.340 ; gain = 199.5782default:default
m

Phase %s%s
101*constraints2
2 2default:default2)
Router Initialization2default:defaultZ18-101
f

Phase %s%s
101*constraints2
2.1 2default:default2 
Create Timer2default:defaultZ18-101
8
,Phase 2.1 Create Timer | Checksum: 1befb845
*common
�

%s
*constraints2q
]Time (s): cpu = 00:04:04 ; elapsed = 00:03:33 . Memory (MB): peak = 1237.340 ; gain = 199.5782default:default
g

Phase %s%s
101*constraints2
2.2 2default:default2!

:
.Phase 2.2 Update Timing | Checksum: 10552c3fb
*common
�

%s
*constraints2q
]Time (s): cpu = 00:04:06 ; elapsed = 00:03:34 . Memory (MB): peak = 1258.813 ; gain = 221.0512default:default
~
Estimated Timing Summary %s
57*route2J
6| WNS=5.19   | TNS=0      | WHS=-0.321 | THS=-27.6  |
2default:defaultZ35-57
@
4Phase 2 Router Initialization | Checksum: 10552c3fb
*common
�

%s
*constraints2q
]Time (s): cpu = 00:04:06 ; elapsed = 00:03:34 . Memory (MB): peak = 1258.813 ; gain = 221.0512default:default
g

Phase %s%s
101*constraints2
3 2default:default2#
Initial Routing2default:defaultZ18-101
9
-Phase 3 Initial Routing | Checksum: fa6500cf
*common
�

%s
*constraints2q
]Time (s): cpu = 00:04:07 ; elapsed = 00:03:35 . Memory (MB): peak = 1258.813 ; gain = 221.0512default:default
j

Phase %s%s
101*constraints2
4 2default:default2&
Rip-up And Reroute2default:defaultZ18-101
l

Phase %s%s
101*constraints2
4.1 2default:default2&
Global Iteration 02default:defaultZ18-101
i

Phase %s%s
101*constraints2
4.1.1 2default:default2!

<
0Phase 4.1.1 Update Timing | Checksum: 19cd8aa17
*common
�

%s
*constraints2q
]Time (s): cpu = 00:04:07 ; elapsed = 00:03:35 . Memory (MB): peak = 1258.813 ; gain = 221.0512default:default
~
Estimated Timing Summary %s
57*route2J
6| WNS=4.63   | TNS=0      | WHS=N/A    | THS=N/A    |
2default:defaultZ35-57
?
3Phase 4.1 Global Iteration 0 | Checksum: 19cd8aa17
*common
�

%s
*constraints2q
]Time (s): cpu = 00:04:07 ; elapsed = 00:03:35 . Memory (MB): peak = 1258.813 ; gain = 221.0512default:default
=
1Phase 4 Rip-up And Reroute | Checksum: 19cd8aa17
*common
�

%s
*constraints2q
]Time (s): cpu = 00:04:07 ; elapsed = 00:03:35 . Memory (MB): peak = 1258.813 ; gain = 221.0512default:default
e

Phase %s%s
101*constraints2
5 2default:default2!

g

Phase %s%s
101*constraints2
5.1 2default:default2!

:
.Phase 5.1 Update Timing | Checksum: 19cd8aa17
*common
�

%s
*constraints2q
]Time (s): cpu = 00:04:08 ; elapsed = 00:03:35 . Memory (MB): peak = 1258.813 ; gain = 221.0512default:default
~
Estimated Timing Summary %s
57*route2J
6| WNS=4.72   | TNS=0      | WHS=N/A    | THS=N/A    |
2default:defaultZ35-57
8
,Phase 5 Delay CleanUp | Checksum: 19cd8aa17
*common
�

%s
*constraints2q
]Time (s): cpu = 00:04:08 ; elapsed = 00:03:35 . Memory (MB): peak = 1258.813 ; gain = 221.0512default:default
o

Phase %s%s
101*constraints2
6 2default:default2+
Clock Skew Optimization2default:defaultZ18-101
B
6Phase 6 Clock Skew Optimization | Checksum: 19cd8aa17
*common
�

%s
*constraints2q
]Time (s): cpu = 00:04:08 ; elapsed = 00:03:35 . Memory (MB): peak = 1258.813 ; gain = 221.0512default:default
e

Phase %s%s
101*constraints2
7 2default:default2!

g

Phase %s%s
101*constraints2
7.1 2default:default2!

:
.Phase 7.1 Update Timing | Checksum: 19cd8aa17
*common
�

%s
*constraints2q
]Time (s): cpu = 00:04:08 ; elapsed = 00:03:35 . Memory (MB): peak = 1258.813 ; gain = 221.0512default:default
~
Estimated Timing Summary %s
57*route2J
6| WNS=4.72   | TNS=0      | WHS=0.081  | THS=0      |
2default:defaultZ35-57
8
,Phase 7 Post Hold Fix | Checksum: 19cd8aa17
*common
�

%s
*constraints2q
]Time (s): cpu = 00:04:08 ; elapsed = 00:03:35 . Memory (MB): peak = 1258.813 ; gain = 221.0512default:default
f

Phase %s%s
101*constraints2
8 2default:default2"
Route finalize2default:defaultZ18-101
9
-Phase 8 Route finalize | Checksum: 19cd8aa17
*common
�

%s
*constraints2q
]Time (s): cpu = 00:04:08 ; elapsed = 00:03:35 . Memory (MB): peak = 1258.813 ; gain = 221.0512default:default
m

Phase %s%s
101*constraints2
9 2default:default2)
Verifying routed nets2default:defaultZ18-101
@
4Phase 9 Verifying routed nets | Checksum: 19cd8aa17
*common
�

%s
*constraints2q
]Time (s): cpu = 00:04:08 ; elapsed = 00:03:35 . Memory (MB): peak = 1258.813 ; gain = 221.0512default:default
j

Phase %s%s
101*constraints2
10 2default:default2%
Depositing Routes2default:defaultZ18-101
=
1Phase 10 Depositing Routes | Checksum: 1589d2613
*common
�

%s
*constraints2q
]Time (s): cpu = 00:04:08 ; elapsed = 00:03:36 . Memory (MB): peak = 1258.813 ; gain = 221.0512default:default
k

Phase %s%s
101*constraints2
11 2default:default2&
Post Router Timing2default:defaultZ18-101
~
Estimated Timing Summary %s
57*route2J
6| WNS=4.72   | TNS=0      | WHS=0.081  | THS=0      |
2default:defaultZ35-57
�
�The final timing numbers are based on the router estimated timing analysis. For a complete and accurate timing signoff, please run report_timing_summary.
127*routeZ35-327
>
2Phase 11 Post Router Timing | Checksum: 1589d2613
*common
�

%s
*constraints2q
]Time (s): cpu = 00:04:08 ; elapsed = 00:03:36 . Memory (MB): peak = 1258.813 ; gain = 221.0512default:default
4
Router Completed Successfully
16*routeZ35-16
4
(Ending Route Task | Checksum: 1589d2613
*common
�

%s
*constraints2q
]Time (s): cpu = 00:00:00 ; elapsed = 00:03:36 . Memory (MB): peak = 1258.813 ; gain = 221.0512default:default
�

%s
*constraints2q
]Time (s): cpu = 00:00:00 ; elapsed = 00:03:36 . Memory (MB): peak = 1258.813 ; gain = 221.0512default:default
Q
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
512default:default2
02default:default2
02default:default2
02default:defaultZ4-41
U
%s completed successfully
29*	vivadotcl2 
route_design2default:defaultZ4-42
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
route_design: 2default:default2
00:04:112default:default2
00:03:382default:default2
1258.8132default:default2
243.9382default:defaultZ17-268
4
Writing XDEF routing.
211*designutilsZ20-211
A
#Writing XDEF routing logical nets.
209*designutilsZ20-209
A
#Writing XDEF routing special nets.
210*designutilsZ20-210
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2)
Write XDEF Complete: 2default:default2
00:00:002default:default2 
00:00:00.1582default:default2
1258.8132default:default2
0.0002default:defaultZ17-268
G
Running DRC with %s threads
24*drc2
22default:defaultZ23-27
�
#The results of DRC are in file %s.
168*coretcl2�
RC:/project/picoblaze_example/picoblaze_example.runs/impl_1/kpsm_top_drc_routed.rptRC:/project/picoblaze_example/picoblaze_example.runs/impl_1/kpsm_top_drc_routed.rpt2default:default8Z2-168
�
UpdateTimingParams:%s.
91*timing2P
< Speed grade: -2, Delay Type: min_max, Constraints type: SDC2default:defaultZ38-91
s
CMultithreading enabled for timing update using a maximum of %s CPUs155*timing2
22default:defaultZ38-191
B
,Running Vector-less Activity Propagation...
51*powerZ33-51
G
3
Finished Running Vector-less Activity Propagation
1*powerZ33-1


End Record