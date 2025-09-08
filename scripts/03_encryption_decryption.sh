#!/bin/bash

# PKI Lab - Experiment 3: File Encryption/Decryption Demo
# This script demonstrates asymmetric encryption and decryption using RSA key pairs

echo "=== PKI Lab - Experiment 3: File Encryption/Decryption Demo ==="
echo

# Check if required key files exist
if [[ ! -f "rsa.pem" || ! -f "rsa_public.pem" ]]; then
    echo "Error: RSA key files not found. Please run 01_rsa_key_generation.sh first."
    exit 1
fi

# Create test message file
echo "1. Creating test message file..."
cat > msg.txt << EOF
Hello World - This is a secret message!
EOF

echo "✓ Test message created: msg.txt"
echo "   Content: $(cat msg.txt)"
echo

# Encrypt the message using RSA public key
echo "2. Encrypting message using RSA public key..."
openssl pkeyutl -encrypt -inkey rsa_public.pem -pubin -in msg.txt -out msg.enc

echo "✓ Message encrypted: msg.enc"
echo

# Display encrypted file information
echo "3. Encrypted file information:"
ls -la msg.enc
echo

# Show encrypted binary data (first few lines)
echo "4. Encrypted binary data (hex dump, first 10 lines):"
xxd msg.enc | head -10
echo

# Decrypt the message using RSA private key
echo "5. Decrypting message using RSA private key..."
openssl pkeyutl -decrypt -inkey rsa.pem -in msg.enc -out decrypted.txt

echo "✓ Message decrypted: decrypted.txt"
echo

# Verify decryption worked by displaying content
echo "6. Verifying decryption success:"
echo "   Original message: $(cat msg.txt)"
echo "   Decrypted message: $(cat decrypted.txt)"
echo

# Compare files to ensure they match
if cmp -s msg.txt decrypted.txt; then
    echo "✓ SUCCESS: Decrypted message matches original!"
else
    echo "✗ ERROR: Decrypted message does not match original!"
fi
echo

# Show file sizes for analysis
echo "7. File size comparison:"
echo "   Original file: $(wc -c < msg.txt) bytes"
echo "   Encrypted file: $(wc -c < msg.enc) bytes"
echo "   Decrypted file: $(wc -c < decrypted.txt) bytes"
echo

# Clean up option
echo "8. Files created in this experiment:"
ls -la msg.txt msg.enc decrypted.txt
echo

echo "=== Experiment 3 Complete ==="
echo "Demonstrated successful RSA encryption and decryption process"
echo
echo "Note: Encrypted file size ($(wc -c < msg.enc) bytes) matches RSA key size,"
echo "      showing proper PKCS#1 padding implementation"
