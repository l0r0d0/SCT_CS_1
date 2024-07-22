# Caesar Cipher Bash Script Explanation

This Bash script implements a Caesar Cipher for encrypting and decrypting text. The Caesar Cipher is a simple substitution cipher where each letter in the plaintext is shifted a certain number of places down or up the alphabet.

## Script Breakdown

### Functions

#### `encrypt()`

- **Purpose**: Encrypts the given plaintext by shifting each letter by a specified amount.
- **Parameters**:
  - `shift`: The number of positions each letter in the plaintext will be shifted.
  - `plaintext`: The text to be encrypted.
- **Process**:
  1. Iterate over each character in the plaintext.
  2. Check if the character is an uppercase letter (`[A-Z]`).
     - Calculate the new ASCII value by adding the shift value.
     - Wrap around if the new ASCII value exceeds 'Z'.
  3. Check if the character is a lowercase letter (`[a-z]`).
     - Calculate the new ASCII value by adding the shift value.
     - Wrap around if the new ASCII value exceeds 'z'.
  4. Leave non-alphabet characters unchanged.
  5. Concatenate the encrypted characters to form the final encrypted string.

#### `decrypt()`

- **Purpose**: Decrypts the given ciphertext by reversing the shift applied during encryption.
- **Parameters**:
  - `shift`: The number of positions each letter in the ciphertext will be shifted back.
  - `ciphertext`: The text to be decrypted.
- **Process**:
  1. Iterate over each character in the ciphertext.
  2. Check if the character is an uppercase letter (`[A-Z]`).
     - Calculate the new ASCII value by subtracting the shift value.
     - Wrap around if the new ASCII value is less than 'A'.
  3. Check if the character is a lowercase letter (`[a-z]`).
     - Calculate the new ASCII value by subtracting the shift value.
     - Wrap around if the new ASCII value is less than 'a'.
  4. Leave non-alphabet characters unchanged.
  5. Concatenate the decrypted characters to form the final decrypted string.

### Main Script Execution

1. **Usage Check**: Ensure at least three arguments are provided: mode (encrypt or decrypt), shift value, and text.
2. **Mode Selection**: Determine whether to encrypt or decrypt based on the first argument.
   - Call the `encrypt()` function if the mode is "encrypt".
   - Call the `decrypt()` function if the mode is "decrypt".
3. **Invalid Mode Handling**: Print an error message if an invalid mode is provided.

### Example Usage

```sh
# To encrypt the text "HelloWorld" with a shift of 3
./script.sh encrypt 3 "HelloWorld"

# To decrypt the text "KhoorZruog" with a shift of 3
./script.sh decrypt 3 "KhoorZruog"
