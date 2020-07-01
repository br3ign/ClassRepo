# Encryption script tp demonstrate ROT13

#!/usr/bin/python

import sys

message = ""

if len(sys.argv)<=1:
    print("Usage: encrypt.py <message>")
    sys.exit(0)
else:
    message = sys.argv[1]

def rot13(s):
    result = ""

    # Loop through characters
    for v in s:
        # Convert to number
        c = ord(v)

        if c >= ord('a') and c <= ord('z'):
            if c > ord('m'):
                c -= 13
            else:
                c += 13
        elif c >= ord('A') and c <= ord('Z'):
            if c > ord('M'):
                c -= 13
            else:
                c += 13

        result += chr(c)

    return result

# Test method
print(rot13(message))
