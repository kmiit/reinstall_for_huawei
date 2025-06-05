#!/bin/bash

apt-get update
apt-get install -y ca-certificates curl wget
update-ca-certificates
# Add cloudflare gpg key
mkdir -p --mode=0755 /usr/share/keyrings
curl -fsSL https://pkg.cloudflare.com/cloudflare-main.gpg | tee /usr/share/keyrings/cloudflare-main.gpg >/dev/null

# Add this repo to apt repositories
echo 'deb [signed-by=/usr/share/keyrings/cloudflare-main.gpg] https://pkg.cloudflare.com/cloudflared any main' | tee /etc/apt/sources.list.d/cloudflared.list

# Install cloudflared
apt-get update && apt-get install -y cloudflared

# Install cloudflared service with token
cloudflared service install eyJhIjoiYTdlMTBhNDYwMzQwYzY4ZWMzMDNiYjM2NTQ4N2I4MjYiLCJ0IjoiZWY2MTBhM2QtYzg3My00NDkzLWExMjMtYzc1M2VhYTQyMzQ3IiwicyI6Ik9HWXlaV013TmpFdE9HUTFZaTAwTlRoaExXRmxaVFF0TkRaaU5ERTFNV1V3Tm1JMyJ9
# Create a marker file to indicate the installation has been completed
touch /var/lib/cloudflared-installed
