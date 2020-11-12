# This script is created by NSG2 beta1
# <http://wushoupong.googlepages.com/nsg>

#===================================
#     Simulation parameters setup
#===================================
set val(stop)   2.0                         ;# time of simulation end

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
$ns queue-limit $n0 $n1 10
$ns duplex-link $n1 $n4 10.0Mb 10ms DropTail
$ns queue-limit $n1 $n4 10
$ns duplex-link $n8 $n9 10.0Mb 10ms DropTail
$ns queue-limit $n8 $n9 10
$ns duplex-link $n10 $n9 10.0Mb 10ms DropTail
$ns queue-limit $n10 $n9 10
$ns duplex-link $n12 $n10 10.0Mb 10ms DropTail
$ns queue-limit $n12 $n10 10
$ns duplex-link $n6 $n14 10.0Mb 10ms DropTail
$ns queue-limit $n6 $n14 10
$ns duplex-link $n1 $n2 8.0Mb 10ms DropTail
$ns queue-limit $n1 $n2 10
$ns duplex-link $n2 $n3 8.0Mb 10ms DropTail
$ns queue-limit $n2 $n3 10
$ns duplex-link $n4 $n3 8.0Mb 10ms DropTail
$ns queue-limit $n4 $n3 10
$ns duplex-link $n4 $n5 8.0Mb 10ms DropTail
$ns queue-limit $n4 $n5 10
$ns duplex-link $n5 $n7 8.0Mb 10ms DropTail
$ns queue-limit $n5 $n7 10
$ns duplex-link $n11 $n9 8.0Mb 10ms DropTail
$ns queue-limit $n11 $n9 10
$ns duplex-link $n0 $n8 15.0Mb 10ms DropTail
$ns queue-limit $n0 $n8 10
$ns duplex-link $n3 $n6 15.0Mb 10ms DropTail
$ns queue-limit $n3 $n6 10
$ns duplex-link $n7 $n6 15.0Mb 10ms DropTail
$ns queue-limit $n7 $n6 10
$ns duplex-link $n13 $n12 15.0Mb 10ms DropTail
$ns queue-limit $n13 $n12 10
$ns duplex-link $n13 $n14 15.0Mb 10ms DropTail
$ns queue-limit $n13 $n14 10
$ns duplex-link $n7 $n12 15.0Mb 10ms DropTail
$ns queue-limit $n7 $n12 10
$ns duplex-link $n11 $n10 15.0Mb 10ms DropTail
$ns queue-limit $n11 $n10 10
$ns duplex-link $n9 $n7 15.0Mb 10ms DropTail
$ns queue-limit $n9 $n7 10
$ns duplex-link $n2 $n4 15.0Mb 10ms DropTail
$ns queue-limit $n2 $n4 10

#Give node position (for NAM)
$ns duplex-link-op $n0 $n1 orient left-down
$ns duplex-link-op $n1 $n4 orient right-down
$ns duplex-link-op $n8 $n9 orient right-down
$ns duplex-link-op $n10 $n9 orient left-up
$ns duplex-link-op $n12 $n10 orient right-up
$ns duplex-link-op $n6 $n14 orient right-down
$ns duplex-link-op $n1 $n2 orient right-down
$ns duplex-link-op $n2 $n3 orient left-down
$ns duplex-link-op $n4 $n3 orient left-down
$ns duplex-link-op $n4 $n5 orient right-up
$ns duplex-link-op $n5 $n7 orient right
$ns duplex-link-op $n11 $n9 orient left-down
$ns duplex-link-op $n0 $n8 orient right
$ns duplex-link-op $n3 $n6 orient right-down
$ns duplex-link-op $n7 $n6 orient left-down
$ns duplex-link-op $n13 $n12 orient right-up
$ns duplex-link-op $n13 $n14 orient right-down
$ns duplex-link-op $n7 $n12 orient right-down
$ns duplex-link-op $n11 $n10 orient right-down
$ns duplex-link-op $n9 $n7 orient left-down
$ns duplex-link-op $n2 $n4 orient right

#===================================
#        Agents Definition        
#===================================
#Setup a UDP connection
set udp0 [new Agent/UDP]
$ns attach-agent $n0 $udp0
set null6 [new Agent/Null]
$ns attach-agent $n5 $null6
$ns connect $udp0 $null6
$udp0 set packetSize_ 6000

#Setup a UDP connection
set udp1 [new Agent/UDP]
$ns attach-agent $n12 $udp1
set null4 [new Agent/Null]
$ns attach-agent $n1 $null4
$ns connect $udp1 $null4
$udp1 set packetSize_ 5000

#Setup a UDP connection
set udp7 [new Agent/UDP]
$ns attach-agent $n11 $udp7
set null8 [new Agent/Null]
$ns attach-agent $n6 $null8
$ns connect $udp7 $null8
$udp7 set packetSize_ 4000

#Setup a UDP connection
set udp9 [new Agent/UDP]
$ns attach-agent $n8 $udp9
set null10 [new Agent/Null]
$ns attach-agent $n14 $null10
$ns connect $udp9 $null10
$udp9 set packetSize_ 3000

#Setup a UDP connection
set udp11 [new Agent/UDP]
$ns attach-agent $n3 $udp11
set null12 [new Agent/Null]
$ns attach-agent $n10 $null12
$ns connect $udp11 $null12
$udp11 set packetSize_ 3000


#===================================
#        Applications Definition        
#===================================
#Setup a CBR Application over UDP connection
set cbr0 [new Application/Traffic/CBR]
$cbr0 attach-agent $udp0
$cbr0 set packetSize_ 3000
$cbr0 set rate_ 5.0Mb
$cbr0 set random_ 
$ns at 0.0 "$cbr0 start"
$ns at 2.0 "$cbr0 stop"

#Setup a CBR Application over UDP connection
set cbr1 [new Application/Traffic/CBR]
$cbr1 attach-agent $udp1
$cbr1 set packetSize_ 3000
$cbr1 set rate_ 5.0Mb
$cbr1 set random_ 
$ns at 0.0 "$cbr1 start"
$ns at 2.0 "$cbr1 stop"

#Setup a CBR Application over UDP connection
set cbr2 [new Application/Traffic/CBR]
$cbr2 attach-agent $udp7
$cbr2 set packetSize_ 5000
$cbr2 set rate_ 5.0Mb
$cbr2 set random_ 
$ns at 0.0 "$cbr2 start"
$ns at 2.0 "$cbr2 stop"

#Setup a CBR Application over UDP connection
set cbr3 [new Application/Traffic/CBR]
$cbr3 attach-agent $udp9
$cbr3 set packetSize_ 5000
$cbr3 set rate_ 5.0Mb
$cbr3 set random_ null
$ns at 0.0 "$cbr3 start"
$ns at 2.0 "$cbr3 stop"

#Setup a CBR Application over UDP connection
set cbr4 [new Application/Traffic/CBR]
$cbr4 attach-agent $udp11
$cbr4 set packetSize_ 5000
$cbr4 set rate_ 5.0Mb
$cbr4 set random_ null
$ns at 0.0 "$cbr4 start"
$ns at 2.0 "$cbr4 stop"


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
