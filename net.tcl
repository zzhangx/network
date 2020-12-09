# This script is created by NSG2 beta1
# <http://wushoupong.googlepages.com/nsg>

#===================================
#     Simulation parameters setup
#===================================
set val(stop)   4.0                         ;# time of simulation end

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
$ns duplex-link $n0 $n1 10.0Mb 10ms DropTail
$ns queue-limit $n0 $n1 50
$ns duplex-link $n1 $n2 10.0Mb 10ms DropTail
$ns queue-limit $n1 $n2 50
$ns duplex-link $n6 $n5 10.0Mb 10ms DropTail
$ns queue-limit $n6 $n5 50
$ns duplex-link $n7 $n6 10.0Mb 10ms DropTail
$ns queue-limit $n7 $n6 50
$ns duplex-link $n14 $n7 10.0Mb 10ms DropTail
$ns queue-limit $n14 $n7 50
$ns duplex-link $n11 $n10 10.0Mb 10ms DropTail
$ns queue-limit $n11 $n10 50
$ns duplex-link $n2 $n3 10.0Mb 20ms DropTail
$ns queue-limit $n2 $n3 30
$ns duplex-link $n3 $n4 10.0Mb 20ms DropTail
$ns queue-limit $n3 $n4 30
$ns duplex-link $n5 $n4 10.0Mb 20ms DropTail
$ns queue-limit $n5 $n4 30
$ns duplex-link $n9 $n10 10.0Mb 20ms DropTail
$ns queue-limit $n9 $n10 30
$ns duplex-link $n9 $n8 10.0Mb 20ms DropTail
$ns queue-limit $n9 $n8 30
$ns duplex-link $n2 $n12 10.0Mb 20ms DropTail
$ns queue-limit $n2 $n12 30
$ns duplex-link $n0 $n11 10.0Mb 30ms DropTail
$ns queue-limit $n0 $n11 30
$ns duplex-link $n10 $n8 10.0Mb 30ms DropTail
$ns queue-limit $n10 $n8 30
$ns duplex-link $n10 $n14 10.0Mb 30ms DropTail
$ns queue-limit $n10 $n14 30
$ns duplex-link $n14 $n4 10.0Mb 30ms DropTail
$ns queue-limit $n14 $n4 30
$ns duplex-link $n1 $n12 10.0Mb 40ms DropTail
$ns queue-limit $n1 $n12 30
$ns duplex-link $n12 $n3 10.0Mb 40ms DropTail
$ns queue-limit $n12 $n3 30
$ns duplex-link $n12 $n13 10.0Mb 40ms DropTail
$ns queue-limit $n12 $n13 30
$ns duplex-link $n13 $n14 10.0Mb 40ms DropTail
$ns queue-limit $n13 $n14 30
$ns duplex-link $n8 $n7 10.0Mb 40ms DropTail
$ns queue-limit $n8 $n7 30
$ns duplex-link $n11 $n13 10.0Mb 50ms DropTail
$ns queue-limit $n11 $n13 30

#Give node position (for NAM)
$ns duplex-link-op $n0 $n1 orient left-down
$ns duplex-link-op $n1 $n2 orient left-down
$ns duplex-link-op $n6 $n5 orient right-down
$ns duplex-link-op $n7 $n6 orient left-down
$ns duplex-link-op $n14 $n7 orient right-down
$ns duplex-link-op $n11 $n10 orient right-down
$ns duplex-link-op $n2 $n3 orient right-down
$ns duplex-link-op $n3 $n4 orient right-down
$ns duplex-link-op $n5 $n4 orient left

$ns duplex-link-op $n9 $n10 orient left-down
$ns duplex-link-op $n9 $n8 orient left-down
$ns duplex-link-op $n2 $n12 orient right-up
$ns duplex-link-op $n0 $n11 orient right-down
$ns duplex-link-op $n10 $n8 orient right
$ns duplex-link-op $n10 $n14 orient right-down
$ns duplex-link-op $n14 $n4 orient left-down
$ns duplex-link-op $n1 $n12 orient right-down
$ns duplex-link-op $n12 $n3 orient left-down
$ns duplex-link-op $n12 $n13 orient right-up
$ns duplex-link-op $n13 $n14 orient right-down
$ns duplex-link-op $n8 $n7 orient right-down
$ns duplex-link-op $n11 $n13 orient left-down

#===================================
#        Agents Definition        
#===================================
#Setup a UDP connection
set udp7 [new Agent/UDP]
$ns attach-agent $n1 $udp7
set null5 [new Agent/Null]
$ns attach-agent $n3 $null5
$ns connect $udp7 $null5
$udp7 set packetSize_ 2000

#Setup a UDP connection
set udp9 [new Agent/UDP]
$ns attach-agent $n1 $udp9
set null12 [new Agent/Null]
$ns attach-agent $n14 $null12
$ns connect $udp9 $null12
$udp9 set packetSize_ 2000

#Setup a UDP connection
set udp10 [new Agent/UDP]
$ns attach-agent $n1 $udp10
set null13 [new Agent/Null]
$ns attach-agent $n10 $null13
$ns connect $udp10 $null13
$udp10 set packetSize_ 2000

#Setup a UDP connection
set udp14 [new Agent/UDP]
$ns attach-agent $n11 $udp14
set null19 [new Agent/Null]
$ns attach-agent $n9 $null19
$ns connect $udp14 $null19
$udp14 set packetSize_ 2000

#Setup a UDP connection
set udp15 [new Agent/UDP]
$ns attach-agent $n13 $udp15
set null20 [new Agent/Null]
$ns attach-agent $n8 $null20
$ns connect $udp15 $null20
$udp15 set packetSize_ 2000

#Setup a UDP connection
set udp16 [new Agent/UDP]
$ns attach-agent $n4 $udp16
set null18 [new Agent/Null]
$ns attach-agent $n6 $null18
$ns connect $udp16 $null18
$udp16 set packetSize_ 2000

#Setup a UDP connection
set udp17 [new Agent/UDP]
$ns attach-agent $n7 $udp17
set null21 [new Agent/Null]
$ns attach-agent $n9 $null21
$ns connect $udp17 $null21
$udp17 set packetSize_ 2000

#Setup a UDP connection
set udp22 [new Agent/UDP]
$ns attach-agent $n2 $udp22
set null25 [new Agent/Null]
$ns attach-agent $n4 $null25
$ns connect $udp22 $null25
$udp22 set packetSize_ 2000

#Setup a UDP connection
set udp23 [new Agent/UDP]
$ns attach-agent $n12 $udp23
set null27 [new Agent/Null]
$ns attach-agent $n7 $null27
$ns connect $udp23 $null27
$udp23 set packetSize_ 2000

#Setup a UDP connection
set udp24 [new Agent/UDP]
$ns attach-agent $n0 $udp24
set null26 [new Agent/Null]
$ns attach-agent $n9 $null26
$ns connect $udp24 $null26
$udp24 set packetSize_ 2000

#Setup a UDP connection
set udp28 [new Agent/UDP]
$ns attach-agent $n3 $udp28
set null11 [new Agent/Null]
$ns attach-agent $n5 $null11
$ns connect $udp28 $null11
$udp28 set packetSize_ 2000

#Setup a UDP connection
set udp29 [new Agent/UDP]
$ns attach-agent $n14 $udp29
set null30 [new Agent/Null]
$ns attach-agent $n8 $null30
$ns connect $udp29 $null30
$udp29 set packetSize_ 2000


#===================================
#        Applications Definition        
#===================================
#Setup a CBR Application over UDP connection
set cbr11 [new Application/Traffic/CBR]
$cbr11 attach-agent $udp7
$cbr11 set packetSize_ 1500
$cbr11 set rate_ 5.0Mb
$cbr11 set random_ null
$ns at 1.0 "$cbr11 start"
$ns at 3.0 "$cbr11 stop"

#Setup a CBR Application over UDP connection
set cbr13 [new Application/Traffic/CBR]
$cbr13 attach-agent $udp9
$cbr13 set packetSize_ 1500
$cbr13 set rate_ 5.0Mb
$cbr13 set random_ 
$ns at 2.0 "$cbr13 start"
$ns at 3.0 "$cbr13 stop"

#Setup a CBR Application over UDP connection
set cbr15 [new Application/Traffic/CBR]
$cbr15 attach-agent $udp10
$cbr15 set packetSize_ 1500
$cbr15 set rate_ 5.0Mb
$cbr15 set random_ null
$ns at 1.0 "$cbr15 start"
$ns at 3.0 "$cbr15 stop"

#Setup a CBR Application over UDP connection
set cbr18 [new Application/Traffic/CBR]
$cbr18 attach-agent $udp16
$cbr18 set packetSize_ 2000
$cbr18 set rate_ 5.0Mb
$cbr18 set random_ null
$ns at 1.0 "$cbr18 start"
$ns at 3.0 "$cbr18 stop"

#Setup a CBR Application over UDP connection
set cbr19 [new Application/Traffic/CBR]
$cbr19 attach-agent $udp17
$cbr19 set packetSize_ 2000
$cbr19 set rate_ 5.0Mb
$cbr19 set random_ null
$ns at 1.0 "$cbr19 start"
$ns at 3.0 "$cbr19 stop"

#Setup a CBR Application over UDP connection
set cbr20 [new Application/Traffic/CBR]
$cbr20 attach-agent $udp14
$cbr20 set packetSize_ 2000
$cbr20 set rate_ 5.0Mb
$cbr20 set random_ null
$ns at 1.0 "$cbr20 start"
$ns at 3.0 "$cbr20 stop"

#Setup a CBR Application over UDP connection
set cbr21 [new Application/Traffic/CBR]
$cbr21 attach-agent $udp15
$cbr21 set packetSize_ 2000
$cbr21 set rate_ 5.0Mb
$cbr21 set random_ null
$ns at 1.0 "$cbr21 start"
$ns at 3.0 "$cbr21 stop"

#Setup a CBR Application over UDP connection
set cbr22 [new Application/Traffic/CBR]
$cbr22 attach-agent $udp24
$cbr22 set packetSize_ 2000
$cbr22 set rate_ 5.0Mb
$cbr22 set random_ null
$ns at 1.0 "$cbr22 start"
$ns at 3.0 "$cbr22 stop"

#Setup a CBR Application over UDP connection
set cbr23 [new Application/Traffic/CBR]
$cbr23 attach-agent $udp23
$cbr23 set packetSize_ 2000
$cbr23 set rate_ 5.0Mb
$cbr23 set random_ null
$ns at 1.0 "$cbr23 start"
$ns at 3.0 "$cbr23 stop"

#Setup a CBR Application over UDP connection
set cbr24 [new Application/Traffic/CBR]
$cbr24 attach-agent $udp22
$cbr24 set packetSize_ 2000
$cbr24 set rate_ 5.0Mb
$cbr24 set random_ null
$ns at 1.0 "$cbr24 start"
$ns at 3.0 "$cbr24 stop"

#Setup a CBR Application over UDP connection
set cbr26 [new Application/Traffic/CBR]
$cbr26 attach-agent $udp28
$cbr26 set packetSize_ 2000
$cbr26 set rate_ 5.0Mb
$cbr26 set random_ null
$ns at 1.0 "$cbr26 start"
$ns at 2.0 "$cbr26 stop"

#Setup a CBR Application over UDP connection
set cbr27 [new Application/Traffic/CBR]
$cbr27 attach-agent $udp29
$cbr27 set packetSize_ 1500
$cbr27 set rate_ 5.0Mb
$cbr27 set random_ null
$ns at 2.0 "$cbr27 start"
$ns at 3.0 "$cbr27 stop"


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
