# This script is created by NSG2 beta1
# <http://wushoupong.googlepages.com/nsg>

#===================================
#     Simulation parameters setup
#===================================
set val(stop)   5                         ;# time of simulation end

#===================================
#        Initialization        
#===================================
#Create a ns simulator
set ns [new Simulator]

#Open the NS trace file
set tracefile [open out.tr w]
$ns trace-all $tracefile

#Open the NAM trace file
set namfile [open out.nam w]
$ns namtrace-all $namfile

#===================================
#        Nodes Definition        
#===================================
#Create 15 nodes
set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]
set n5 [$ns node]
set n6 [$ns node]
set n7 [$ns node]
set n8 [$ns node]
set n9 [$ns node]
set n10 [$ns node]
set n11 [$ns node]
set n12 [$ns node]
set n13 [$ns node]
set n14 [$ns node]

#===================================
#        Links Definition        
#===================================
#Createlinks between nodes
$ns duplex-link $n0 $n1 5.0Mb 20ms DropTail
$ns queue-limit $n0 $n1 10
$ns duplex-link $n1 $n2 5.0Mb 20ms DropTail
$ns queue-limit $n1 $n2 10
$ns duplex-link $n6 $n5 5.0Mb 20ms DropTail
$ns queue-limit $n6 $n5 10
$ns duplex-link $n7 $n6 5.0Mb 20ms DropTail
$ns queue-limit $n7 $n6 10
$ns duplex-link $n8 $n10 5.0Mb 20ms DropTail
$ns queue-limit $n8 $n10 10
$ns duplex-link $n0 $n11 8.0Mb 30ms DropTail
$ns queue-limit $n0 $n11 10
$ns duplex-link $n11 $n10 8.0Mb 30ms DropTail
$ns queue-limit $n11 $n10 10
$ns duplex-link $n11 $n13 8.0Mb 30ms DropTail
$ns queue-limit $n11 $n13 10
$ns duplex-link $n14 $n7 8.0Mb 30ms DropTail
$ns queue-limit $n14 $n7 10
$ns duplex-link $n4 $n3 6.0Mb 40ms DropTail
$ns queue-limit $n4 $n3 10
$ns duplex-link $n14 $n4 6.0Mb 40ms DropTail
$ns queue-limit $n14 $n4 10
$ns duplex-link $n4 $n5 6.0Mb 40ms DropTail
$ns queue-limit $n4 $n5 10
$ns duplex-link $n12 $n3 6.0Mb 40ms DropTail
$ns queue-limit $n12 $n3 10
$ns duplex-link $n2 $n3 7.0Mb 30ms DropTail
$ns queue-limit $n2 $n3 10
$ns duplex-link $n12 $n2 7.0Mb 30ms DropTail
$ns queue-limit $n12 $n2 10
$ns duplex-link $n1 $n12 7.0Mb 30ms DropTail
$ns queue-limit $n1 $n12 10
$ns duplex-link $n12 $n13 7.0Mb 30ms DropTail
$ns queue-limit $n12 $n13 10
$ns duplex-link $n13 $n14 7.0Mb 30ms DropTail
$ns queue-limit $n13 $n14 10
$ns duplex-link $n9 $n8 10.0Mb 35ms DropTail
$ns queue-limit $n9 $n8 10
$ns duplex-link $n9 $n10 10.0Mb 35ms DropTail
$ns queue-limit $n9 $n10 10
$ns duplex-link $n10 $n14 10.0Mb 35ms DropTail
$ns queue-limit $n10 $n14 10
$ns duplex-link $n8 $n7 10.0Mb 35ms DropTail
$ns queue-limit $n8 $n7 10

#Give node position (for NAM)
$ns duplex-link-op $n0 $n1 orient left-down
$ns duplex-link-op $n1 $n2 orient left-down
$ns duplex-link-op $n6 $n5 orient right-down
$ns duplex-link-op $n7 $n6 orient left-down
$ns duplex-link-op $n8 $n10 orient left

$ns duplex-link-op $n0 $n11 orient right
$ns duplex-link-op $n11 $n10 orient right
$ns duplex-link-op $n11 $n13 orient left-down
$ns duplex-link-op $n14 $n7 orient right
$ns duplex-link-op $n4 $n3 orient left

$ns duplex-link-op $n14 $n4 orient left-down
$ns duplex-link-op $n4 $n5 orient right
$ns duplex-link-op $n12 $n3 orient right-down
$ns duplex-link-op $n2 $n3 orient right-down
$ns duplex-link-op $n12 $n2 orient left-down
$ns duplex-link-op $n1 $n12 orient right
$ns duplex-link-op $n12 $n13 orient right
$ns duplex-link-op $n13 $n14 orient right
$ns duplex-link-op $n9 $n8 orient left-down
$ns duplex-link-op $n9 $n10 orient left-down
$ns duplex-link-op $n10 $n14 orient left-down
$ns duplex-link-op $n8 $n7 orient right-down

#===================================
#        Agents Definition        
#===================================
#Setup a UDP connection
set udp0 [new Agent/UDP]
$ns attach-agent $n1 $udp0
set null16 [new Agent/Null]
$ns attach-agent $n0 $null16
$ns connect $udp0 $null16
$udp0 set packetSize_ 3000

#Setup a UDP connection
set udp1 [new Agent/UDP]
$ns attach-agent $n1 $udp1
set null14 [new Agent/Null]
$ns attach-agent $n13 $null14
$ns connect $udp1 $null14
$udp1 set packetSize_ 3000

#Setup a UDP connection
set udp2 [new Agent/UDP]
$ns attach-agent $n1 $udp2
set null15 [new Agent/Null]
$ns attach-agent $n3 $null15
$ns connect $udp2 $null15
$udp2 set packetSize_ 3000

#Setup a UDP connection
set udp3 [new Agent/UDP]
$ns attach-agent $n11 $udp3
set null20 [new Agent/Null]
$ns attach-agent $n9 $null20
$ns connect $udp3 $null20
$udp3 set packetSize_ 3000

#Setup a UDP connection
set udp4 [new Agent/UDP]
$ns attach-agent $n9 $udp4
set null34 [new Agent/Null]
$ns attach-agent $n6 $null34
$ns connect $udp4 $null34
$udp4 set packetSize_ 3000

#Setup a UDP connection
set udp5 [new Agent/UDP]
$ns attach-agent $n3 $udp5
set null18 [new Agent/Null]
$ns attach-agent $n6 $null18
$ns connect $udp5 $null18
$udp5 set packetSize_ 3000

#Setup a UDP connection
set udp6 [new Agent/UDP]
$ns attach-agent $n5 $udp6
set null24 [new Agent/Null]
$ns attach-agent $n8 $null24
$ns connect $udp6 $null24
$udp6 set packetSize_ 3000

#Setup a UDP connection
set udp7 [new Agent/UDP]
$ns attach-agent $n6 $udp7
set null22 [new Agent/Null]
$ns attach-agent $n14 $null22
$ns connect $udp7 $null22
$udp7 set packetSize_ 3000

#Setup a UDP connection
set udp8 [new Agent/UDP]
$ns attach-agent $n13 $udp8
set null31 [new Agent/Null]
$ns attach-agent $n4 $null31
$ns connect $udp8 $null31
$udp8 set packetSize_ 3000

#Setup a UDP connection
set udp9 [new Agent/UDP]
$ns attach-agent $n14 $udp9
set null21 [new Agent/Null]
$ns attach-agent $n8 $null21
$ns connect $udp9 $null21
$udp9 set packetSize_ 3000

#Setup a UDP connection
set udp10 [new Agent/UDP]
$ns attach-agent $n7 $udp10
set null25 [new Agent/Null]
$ns attach-agent $n10 $null25
$ns connect $udp10 $null25
$udp10 set packetSize_ 3000

#Setup a UDP connection
set udp11 [new Agent/UDP]
$ns attach-agent $n2 $udp11
set null17 [new Agent/Null]
$ns attach-agent $n5 $null17
$ns connect $udp11 $null17
$udp11 set packetSize_ 3000

#Setup a UDP connection
set udp12 [new Agent/UDP]
$ns attach-agent $n12 $udp12
set null26 [new Agent/Null]
$ns attach-agent $n8 $null26
$ns connect $udp12 $null26
$udp12 set packetSize_ 3000

#Setup a UDP connection
set udp13 [new Agent/UDP]
$ns attach-agent $n0 $udp13
set null19 [new Agent/Null]
$ns attach-agent $n3 $null19
$ns connect $udp13 $null19
$udp13 set packetSize_ 3000

#Setup a UDP connection
set udp28 [new Agent/UDP]
$ns attach-agent $n12 $udp28
set null27 [new Agent/Null]
$ns attach-agent $n6 $null27
$ns connect $udp28 $null27
$udp28 set packetSize_ 3000

#Setup a UDP connection
set udp29 [new Agent/UDP]
$ns attach-agent $n5 $udp29
set null30 [new Agent/Null]
$ns attach-agent $n9 $null30
$ns connect $udp29 $null30
$udp29 set packetSize_ 3000

#Setup a UDP connection
set udp32 [new Agent/UDP]
$ns attach-agent $n0 $udp32
set null33 [new Agent/Null]
$ns attach-agent $n8 $null33
$ns connect $udp32 $null33
$udp32 set packetSize_ 3000


#===================================
#        Applications Definition        
#===================================
#Setup a CBR Application over UDP connection
set cbr0 [new Application/Traffic/CBR]
$cbr0 attach-agent $udp1
$cbr0 set packetSize_ 3000
$cbr0 set rate_ 5.0Mb
$cbr0 set random_ null
$ns at 0.0 "$cbr0 start"
$ns at 3.0 "$cbr0 stop"

#Setup a CBR Application over UDP connection
set cbr1 [new Application/Traffic/CBR]
$cbr1 attach-agent $udp2
$cbr1 set packetSize_ 3000
$cbr1 set rate_ 5.0Mb
$cbr1 set random_ null
$ns at 0.0 "$cbr1 start"
$ns at 3.0 "$cbr1 stop"

#Setup a CBR Application over UDP connection
set cbr2 [new Application/Traffic/CBR]
$cbr2 attach-agent $udp0
$cbr2 set packetSize_ 3000
$cbr2 set rate_ 6.0Mb
$cbr2 set random_ null
$ns at 0.0 "$cbr2 start"
$ns at 3.0 "$cbr2 stop"

#Setup a CBR Application over UDP connection
set cbr3 [new Application/Traffic/CBR]
$cbr3 attach-agent $udp11
$cbr3 set packetSize_ 3000
$cbr3 set rate_ 6.0Mb
$cbr3 set random_ null
$ns at 0.5 "$cbr3 start"
$ns at 3.5 "$cbr3 stop"

#Setup a CBR Application over UDP connection
set cbr4 [new Application/Traffic/CBR]
$cbr4 attach-agent $udp5
$cbr4 set packetSize_ 3000
$cbr4 set rate_ 7.0Mb
$cbr4 set random_ null
$ns at 1.0 "$cbr4 start"
$ns at 4.0 "$cbr4 stop"

#Setup a CBR Application over UDP connection
set cbr5 [new Application/Traffic/CBR]
$cbr5 attach-agent $udp13
$cbr5 set packetSize_ 3000
$cbr5 set rate_ 5.0Mb
$cbr5 set random_ null
$ns at 0.5 "$cbr5 start"
$ns at 4.0 "$cbr5 stop"

#Setup a CBR Application over UDP connection
set cbr6 [new Application/Traffic/CBR]
$cbr6 attach-agent $udp32
$cbr6 set packetSize_ 3000
$cbr6 set rate_ 5.0Mb
$cbr6 set random_ null
$ns at 0.5 "$cbr6 start"
$ns at 4.0 "$cbr6 stop"

#Setup a CBR Application over UDP connection
set cbr7 [new Application/Traffic/CBR]
$cbr7 attach-agent $udp3
$cbr7 set packetSize_ 3000
$cbr7 set rate_ 7.0Mb
$cbr7 set random_ 
$ns at 1.0 "$cbr7 start"
$ns at 4.0 "$cbr7 stop"

#Setup a CBR Application over UDP connection
set cbr8 [new Application/Traffic/CBR]
$cbr8 attach-agent $udp9
$cbr8 set packetSize_ 3000
$cbr8 set rate_ 6.0Mb
$cbr8 set random_ null
$ns at 2.5 "$cbr8 start"
$ns at 4.5 "$cbr8 stop"

#Setup a CBR Application over UDP connection
set cbr9 [new Application/Traffic/CBR]
$cbr9 attach-agent $udp12
$cbr9 set packetSize_ 3000
$cbr9 set rate_ 6.0Mb
$cbr9 set random_ null
$ns at 1.5 "$cbr9 start"
$ns at 4.5 "$cbr9 stop"

#Setup a CBR Application over UDP connection
set cbr10 [new Application/Traffic/CBR]
$cbr10 attach-agent $udp28
$cbr10 set packetSize_ 3000
$cbr10 set rate_ 6.0Mb
$cbr10 set random_ null
$ns at 0.5 "$cbr10 start"
$ns at 3.0 "$cbr10 stop"

#Setup a CBR Application over UDP connection
set cbr11 [new Application/Traffic/CBR]
$cbr11 attach-agent $udp8
$cbr11 set packetSize_ 3000
$cbr11 set rate_ 6.0Mb
$cbr11 set random_ null
$ns at 1.0 "$cbr11 start"
$ns at 4.5 "$cbr11 stop"

#Setup a CBR Application over UDP connection
set cbr12 [new Application/Traffic/CBR]
$cbr12 attach-agent $udp7
$cbr12 set packetSize_ 3000
$cbr12 set rate_ 6.0Mb
$cbr12 set random_ null
$ns at 2.5 "$cbr12 start"
$ns at 4.5 "$cbr12 stop"

#Setup a CBR Application over UDP connection
set cbr13 [new Application/Traffic/CBR]
$cbr13 attach-agent $udp29
$cbr13 set packetSize_ 3000
$cbr13 set rate_ 6.0Mb
$cbr13 set random_ null
$ns at 3.0 "$cbr13 start"
$ns at 4.5 "$cbr13 stop"

#Setup a CBR Application over UDP connection
set cbr14 [new Application/Traffic/CBR]
$cbr14 attach-agent $udp6
$cbr14 set packetSize_ 3000
$cbr14 set rate_ 7.0Mb
$cbr14 set random_ null
$ns at 1.0 "$cbr14 start"
$ns at 4.5 "$cbr14 stop"

#Setup a CBR Application over UDP connection
set cbr15 [new Application/Traffic/CBR]
$cbr15 attach-agent $udp10
$cbr15 set packetSize_ 3000
$cbr15 set rate_ 7.0Mb
$cbr15 set random_ null
$ns at 2.5 "$cbr15 start"
$ns at 4.5 "$cbr15 stop"

#Setup a CBR Application over UDP connection
set cbr16 [new Application/Traffic/CBR]
$cbr16 attach-agent $udp4
$cbr16 set packetSize_ 3000
$cbr16 set rate_ 7.0Mb
$cbr16 set random_ null
$ns at 3.0 "$cbr16 start"
$ns at 4.5 "$cbr16 stop"


#===================================
#        Termination        
#===================================
#Define a 'finish' procedure
proc finish {} {
    global ns tracefile namfile
    $ns flush-trace
    close $tracefile
    close $namfile
    exec nam out.nam &
    exit 0
}
$ns at $val(stop) "$ns nam-end-wireless $val(stop)"
$ns at $val(stop) "finish"
$ns at $val(stop) "puts \"done\" ; $ns halt"
$ns run
