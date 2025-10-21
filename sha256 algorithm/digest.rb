require_relative "sha256lib.rb"

# Simple, non-animated CLI that prints a SHA-256 digest.
# Usage examples:
#   ruby digest.rb abc
#   ruby digest.rb 0x616263
#   ruby digest.rb 0b011000010110001001100011
#   ruby digest.rb file.txt

input = ARGV[0] || "abc"

begin
  t = input_type(input)
  data = if t == "file"
    File.read(input)
  else
    input
  end

  b = bytes(data, t)

  if b.is_a?(String)
    $stderr.puts "Error: input doesn't represent a whole number of bytes (binary length must be multiple of 8)."
    exit 1
  end

  str = b.pack("C*")
  puts sha256(str)
rescue => e
  $stderr.puts "digest.rb error: #{e.message}"
  exit 1
end
