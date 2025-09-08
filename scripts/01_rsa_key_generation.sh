#!/bin/bash

# PKI Lab - Experiment 1: RSA Key Generation
# This script demonstrates RSA key pair generation and public key extraction

echo "=== PKI Lab - Experiment 1: RSA Key Generation ==="
echo

# Generate 2048-bit RSA private key
echo "1. Generating 2048-bit RSA private key..."
openssl genrsa -out rsa.pem 2048
echo "✓ Private key generated: rsa.pem"
echo

# Display the private key
echo "2. Displaying the private key:"
cat rsa.pem
echo

# Extract and display public key
echo "3. Extracting public key from private key..."
openssl rsa -in rsa.pem -pubout
echo

# Save public key to file
echo "4. Saving public key to file..."
openssl rsa -in rsa.pem -pubout -out rsa_public.pem
echo "✓ Public key saved: rsa_public.pem"
echo

# List generated files
echo "5. Files generated:"
ls -la *.pem
echo

echo "=== Experiment 1 Complete ==="
echo "Generated files: rsa.pem (private key) and rsa_public.pem (public key)"
