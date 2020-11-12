# This script is created by NSG2 beta1
# <http://wushoupong.googlepages.com/nsg>

#===================================
#     Simulation parameters setup
#===================================
set val(stop)   10.0                         ;# time of simulation end

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
$ns duplex-link $n0 $n1 8.0Mb 10ms DropTail
$ns queue-limit $n0 $n1 10
$ns duplex-link $n1 $n2 8.0Mb 10ms DropTail
$ns queue-limit $n1 $n2 10
$ns duplex-link $n2 $n3 10.0Mb 10ms DropTail
$ns queue-limit $n2 $n3 10
$ns duplex-link $n3 $n4 15.0Mb 10ms DropTail
$ns queue-limit $n3 $n4 10
$ns duplex-link $n2 $n4 12.0Mb 10ms DropTail
$ns queue-limit $n2 $n4 10
$ns duplex-link $n1 $n4 8.0Mb 10ms DropTail
$ns queue-limit $n1 $n4 10
$ns duplex-link $n8 $n0 5.0Mb 10ms DropTail
$ns queue-limit $n8 $n0 20
$ns duplex-link $n8 $n9 8.0Mb 10ms DropTail
$ns queue-limit $n8 $n9 10
$ns duplex-link $n9 $n10 8.0Mb 10ms DropTail
$ns queue-limit $n9 $n10 10
$ns duplex-link $n9 $n11 10.0Mb 10ms DropTail
$ns queue-limit $n9 $n11 20
$ns duplex-link $n11 $n10 10.0Mb 10ms DropTail
$ns queue-limit $n11 $n10 10
$ns duplex-link $n12 $n10 12.0Mb 10ms DropTail
$ns queue-limit $n12 $n10 10
$ns duplex-link $n12 $n13 12.0Mb 10ms DropTail
$ns queue-limit $n12 $n13 10
$ns duplex-link $n13 $n14 8.0Mb 10ms DropTail
$ns queue-limit $n13 $n14 10
$ns duplex-link $n14 $n6 15.0Mb 10ms DropTail
$ns queue-limit $n14 $n6 10
$ns duplex-link $n7 $n6 10.0Mb 10ms DropTail
$ns queue-limit $n7 $n6 10
$ns duplex-link $n4 $n5 10.0Mb 10ms DropTail
$ns queue-limit $n4 $n5 10
$ns duplex-link $n5 $n7 8.0Mb 10ms DropTail
$ns queue-limit $n5 $n7 10
$ns duplex-link $n3 $n6 10.0Mb 10ms DropTail
$ns queue-limit $n3 $n6 10
$ns duplex-link $n7 $n12 10.0Mb 10ms DropTail
$ns queue-limit $n7 $n12 10
$ns duplex-link $n9 $n7 15.0Mb 10ms DropTail
$ns queue-limit $n9 $n7 10

#Give node position (for NAM)
$ns duplex-link-op $n0 $n1 orient left-down
$ns duplex-link-op $n1 $n2 orient left-down
$ns duplex-link-op $n2 $n3 orient right-down
$ns duplex-link-op $n3 $n4 orient right-up
$ns duplex-link-op $n2 $n4 orient right-up
$ns duplex-link-op $n1 $n4 orient right-down
$ns duplex-link-op $n8 $n0 orient left-up
$ns duplex-link-op $n8 $n9 orient right-down
$ns duplex-link-op $n9 $n10 orient right-down
$ns duplex-link-op $n9 $n11 orient right-up
$ns duplex-link-op $n11 $n10 orient left-down
$ns duplex-link-op $n12 $n10 orient left-up
$ns duplex-link-op $n12 $n13 orient left-down
$ns duplex-link-op $n13 $n14 orient right-down
$ns duplex-link-op $n14 $n6 orient left-up
$ns duplex-link-op $n7 $n6 orient left-down
$ns duplex-link-op $n4 $n5 orient right-up
$ns duplex-link-op $n5 $n7 orient right-down
$ns duplex-link-op $n3 $n6 orient right-down
$ns duplex-link-op $n7 $n12 orient right-down
$ns duplex-link-op $n9 $n7 orient left-down

#===================================
#        Agents Definition        
#===================================
#Setup a UDP connection
set udp1 [new Agent/UDP]
$ns attach-agent $n0 $udp1
set null3 [new Agent/Null]
$ns attach-agent $n3 $null3
$ns connect $udp1 $null3
$udp1 set packetSize_ 3000

#Setup a UDP connection
set udp2 [new Agent/UDP]
$ns attach-agent $n14 $udp2
set null4 [new Agent/Null]
$ns attach-agent $n11 $null4
$ns connect $udp2 $null4
$udp2 set packetSize_ 3000


#===================================
#        Applications Definition        
#===================================

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
