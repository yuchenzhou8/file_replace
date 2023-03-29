require_relative "crc_lib"

p "crc: #{FileIOCRC.file_calculateCRC("./files/file_recover_origin.bin",FileIOCRC::CRC_READ_ALL)}"

fd = File.open("./files/file_recover.bin", "w+")

(1..20).each{|n| 
	if (n % 2) == 0 
		fd.write("D" * 200)
	else
		fd.write("\0" * 200)
	end
}

p "File size: #{fd.size}\n"

fd.close()


#system("hexdump -v ./files/file_recover.bin")


fd = File.open("./files/file_recover.bin", "r+")
(1...20).each{ |n|
	if(n % 2) == 1
		fd.seek(200 * (n - 1), IO::SEEK_SET)
		write_size = fd.write("C" * 200)
		p write_size
	end
}

p "File size: #{fd.size}\n"

fd.close()
p "crc: #{FileIOCRC.file_calculateCRC("./files/file_recover.bin",FileIOCRC::CRC_READ_ALL)}"


# system("hexdump -v ./files/file_recover.bin")