require "pcap"

packets = Pcap::Capture.open_offline('/home/reetoknino/Desktop/sechack201710/pcap/20171010_00.pcap')
dportPkt = {}
dportIP = {}

packets.each do |packet|
	if packet.ip_proto == 6 then

		dportPkt[packet.tcp_dport.to_s+"_"+packet.ip_src.to_s] = dportPkt[packet.tcp_dport.to_s+"_"+packet.ip_src.to_s].to_i+1

		if dportPkt[packet.tcp_dport.to_s+"_"+packet.ip_src.to_s] == 1
			dportIP[packet.tcp_dport.to_s] = dportIP[packet.tcp_dport.to_s].to_i+1
		end
	end
end

sort_dportIP =  dportIP.sort_by {|k, v| v }.reverse

sort_dportIP.each{ |dport,ip|
	puts "#{ip}\t#{dport}"
}
