class Encryptor
	def cipher(rotation)
  		characters = (' '..'z').to_a
  		rotated_characters = characters.rotate(rotation)
  		Hash[characters.zip(rotated_characters)]
	end

	def encrypt_letter(letter, rotation)
  		cipher_for_rotation = cipher(rotation)
  		cipher_for_rotation[letter]
	end

	def encrypt(string, rotation)
		letters = string.split("")
		
		results = letters.collect {|letter| encrypt_letter(letter, rotation)}

		results.join
	end

	def decipher(rotation)
		rotation *= -1
  		characters = (' '..'z').to_a
  		rotated_characters = characters.rotate(rotation)
  		Hash[characters.zip(rotated_characters)]
	end

	def decrypt_letter(letter, rotation)
	  	decipher_for_rotation = decipher(rotation)
		decipher_for_rotation[letter]
	end	

	def decrypt(string,rotation)
		letters = string.split("")
		
		results = letters.collect {|letter| decrypt_letter(letter, rotation)}

		results.join
	end	

	def encrypt_file(filename, rotation)
		input = File.open( filename, "r")
		open_file_to_encrypt = input.read
		encrypted_text = encrypt(open_file_to_encrypt, rotation)
		encrypted_file = filename +".encrypted"
		output = File.new(encrypted_file, "w")
		output.write(encrypted_text)
		output.close
	end

	def decrypt_file(filename, rotation)
		input = File.open( filename, "r")
		open_file_to_decrypt = input.read
		decrypted_text = decrypt(open_file_to_decrypt, rotation)
		decrypted_file = filename.gsub("encrypted", "decrypted")
		output = File.new(decrypted_file, "w")
		output.write(decrypted_text)
		output.close
	end
end