
# f = File.open("file_replacement.bin", "r+");
# data = f.read()
# data_hex = data.unpack("C*")

# p data_hex

# p data_hex.pack("C*").unpack("H*").first

# f.close()

# replace_data = Array.new(4){|i| i+20}
# p replace_data

# f = File.open("file_replacement.bin", "r+");
# f.seek(4, IO::SEEK_SET)
# f.write(replace_data.pack("C*"))
# f.rewind
# f.close


def content_replace(file = nil, content = nil, offset = 0, content_size = 0)

	ret = -1
	write_size = -1 

	if(file and content)
		f = File.open(file, "r+");
		if(f)
			f.seek(offset, IO::SEEK_SET)
			write_size = f.write(content)
			p write_size
			ret = write_size
			f.close()
		end
	end

	return ret

end

system("hexdump file_replacement.bin")

replace_data = Array.new(4){|i| i+30}
p replace_data

content_replace("file_replacement.bin", replace_data.pack("C*"), 4, 4)

system("hexdump file_replacement.bin")