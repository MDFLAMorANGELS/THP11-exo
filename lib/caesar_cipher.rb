def caesar_cipher(string, key)
    # Vérifier si l'input est une string
    unless string.is_a?(String)
      raise ArgumentError, "Le premier paramètre doit être une chaîne de caractères."
    end
  
    # Vérifier si la clé est un entier
    unless key.is_a?(Integer)
      raise ArgumentError, "Le deuxième paramètre doit être un nombre entier."
    end
  
    # Vérifier si la clé est dans la plage de -25 à 25
    unless key.between?(-25, 25)
      raise ArgumentError, "La clé de chiffrement doit être un nombre entre -25 et 25."
    end
  
    # Convertir la chaîne de caractères en tableau de caractères
    chars = string.split("")
  
    # Parcourir chaque caractère et appliquer le décalage de la clé
    ciphered_string = chars.map do |char|
      # Vérifier si le caractère est une lettre
      if char.match?(/[a-zA-Z]/)
        ascii_offset = char.match?(/[a-z]/) ? 97 : 65 # Offset ASCII pour les minuscules (97) ou les majuscules (65)
        shifted_char = ((char.ord - ascii_offset + key) % 26 + 26) % 26 + ascii_offset # Appliquer le décalage en bouclant de z à a
        shifted_char.chr # Convertir le code ASCII en caractère
      else
        char # Garder les autres caractères tels quels
      end
    end
  
    # Rejoindre les caractères pour former la chaîne de caractères modifiée
    ciphered_string.join("")
  end

  puts caesar_cipher("Bonjours a tous", 20)