# TODO: Write documentation for `Fixlines`
# TODO: error targets aren't writable

VERSION = "0.1.0"
seen = {} of String => Hash(Int32,String)

ARGF.each_line { |change|
	path,num,content = change.split(':',3)
	( seen[path] ||= {} of Int32 => String )[num.to_i] = content
}

seen.each { |path,changes|
	if File.exists? path
		lines = File.read_lines path
		changes.each { |no,content| lines[no-1] = content }
		File.write(path, (lines.join "\n")+"\n")
	else
		File.write(path, (changes.map { |_,content| content }.join "\n")+"\n")
	end
}
