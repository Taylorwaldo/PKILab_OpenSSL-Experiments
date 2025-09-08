#!/bin/bash

# PKI Lab - Experiment 2: Self-Signed Certificate Creation
# This script creates a self-signed X.509 certificate and analyzes its structure

echo "=== PKI Lab - Experiment 2: Self-Signed Certificate Creation ==="
echo

# Create self-signed certificate with predefined values
echo "1. Creating self-signed certificate..."
echo "   Using predefined organizational information for automation"

# Create certificate with non-interactive mode
openssl req -x509 -newkey rsa:2048 -keyout private_key.pem -out selfsigned.pem -days 365 -nodes -subj "/C=US/ST=California/L=San Francisco/O=TestLab/OU=Security/CN=testsite.local/emailAddress=test@example.com"

echo "✓ Self-signed certificate created: selfsigned.pem"
echo "✓ Private key created: private_key.pem"
echo

# List generated files
echo "2. Files generated:"
ls -la *.pem
echo

# View certificate details
echo "3. Certificate details:"
openssl x509 -in selfsigned.pem -text -noout
echo

# View basic certificate information
echo "4. Basic certificate information:"
openssl x509 -in selfsigned.pem -subject -issuer -dates -noout
echo

# Verify certificate (will show self-signed warning)
echo "5. Certificate verification (expect self-signed warning):"
openssl verify selfsigned.pem
echo

echo "=== Experiment 2 Complete ==="
echo "Generated files: selfsigned.pem (certificate) and private_key.pem (private key)"
echo "Note: Self-signed certificates show verification warnings - this is expected behavior"
