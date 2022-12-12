import sys
if(len(sys.argv) != 2):
    sys.exit(-1);

file = open(sys.argv[1], 'r');

outputFile = open("split.hex", 'w');

Lines = file.readlines();

for line in Lines:
    x = int(line.strip(), 16);
    outputFile.write(str(hex(x & 0x3FFFF)) + '\n' + str(hex((x >> 18) & 0x3FFFF)) + '\n');

outputFile.close();