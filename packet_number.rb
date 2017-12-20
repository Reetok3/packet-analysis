require "pcap"

packets = Pcap::Capture.open_offline('/home/reetoknino/Desktop/sechack201710/pcap/20171010_00.pcap')
dportPkt = {}

packets.each do |packet|
	if packet.ip_proto == 6 then
		dportPkt[packet.tcp_dport] = dportPkt[packet.tcp_dport].to_i+1
	end
end

sort_dportPkt =  dportPkt.sort_by {|k, v| v }.reverse

sort_dportPkt.each{ |dport,pkt|
	puts "#{pkt}\t#{dport}"
}
