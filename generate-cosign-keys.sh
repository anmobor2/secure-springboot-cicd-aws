#!/bin/bash
# Generate Cosign key pair for image signing
# Run this locally and store cosign.key securely in Azure DevOps variables
cosign generate-key-pair
echo "Store cosign.key in Azure DevOps variable 'cosignPrivateKey' and keep cosign.pub for verification"