BEGIN{
    highest_packet_id = 0;
}
{
    action = $1;
    time = $2;
    from = $3;
    to = $4;
    type = $5;
    pktsize = $6;
    flow_id = $8;
    src = $9;
    dst = $10;
    seq_no = $11;
    packet_id = $12;
    
    if (packet_id > highest_packet_id) highest_packet_id = packet_id;
    
    if (start_time[packet_id] == 0) start_teime[packet_id] = time;
    
    if (action != "d"){
        
        if (action == "r")   end_time[packet_id] = time;
    }else{
        
        end_time[packet_id] = -1;
    }
    
}
END {
    
    for (packet_id = 0; packet_id <= highest_packet_id; packet_id++)
    {
        start = start_time[packet_id];
        end = end_time[packet_id];
        packet_duration = end - start;
        
        if (start < end) printf("%f %f\n", start, packet_duration);
    }
}

