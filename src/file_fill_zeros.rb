fd = File.open("./files/file_zeros.bin", "w+")

fd.write("\0" * 200 * 5)

fd.close()

system("hexdump ./files/file_zeros.bin")