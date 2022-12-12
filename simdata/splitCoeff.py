filePath = input("File to split: \n");
file = open(filePath, 'r');

outputFile = open("splitCoefficient.hex", 'w');

Lines = file.readlines();

for line in Lines:
    x = int(line.strip(), 16);
    outputFile.write(str(hex(x & 0x3FFFF)) + '\n' + str(hex((x >> 18) & 0x3FFFF)) + '\n');

outputFile.close();