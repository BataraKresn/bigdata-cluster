from cryptography.fernet import Fernet

# Generate a Fernet key
fernet_key = Fernet.generate_key()

# Convert the key to a string for storage
fernet_key_string = fernet_key.decode()

print("Generated Fernet Key:", fernet_key_string)
