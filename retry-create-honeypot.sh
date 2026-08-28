#!/bin/bash
# Script de retry para criar instancia Always Free (VM.Standard.A1.Flex) na Oracle Cloud
# Tenta a cada 60 segundos ate a Oracle libertar capacidade

COMPARTMENT_ID="ocid1.tenancy.oc1..aaaaaaaazswzbr7ae6odzweoz6pnncszqnbzyyifhh6yr74kfzjmpyxchvhq"
SUBNET_ID="ocid1.subnet.oc1.eu-madrid-1.aaaaaaaaaehnswp4zik2l255tipm3doonzcbiqg7xbf3dez2jv5l6vreewzq"
IMAGE_ID="ocid1.image.oc1.eu-madrid-1.aaaaaaaa42dahzqce2rb5lpwjpsguyq57he3ogr222jlgsgccb4kxohfozuq"
AD="ZdLh:EU-MADRID-1-AD-1"
SSH_KEY_FILE="/home/helder/.ssh/tpot_honeypot.pub"

ATTEMPT=1

while true; do
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] Tentativa $ATTEMPT..."

  RESULT=$(oci compute instance launch \
    --availability-domain "$AD" \
    --compartment-id "$COMPARTMENT_ID" \
    --shape "VM.Standard.A1.Flex" \
    --shape-config '{"ocpus": 4, "memoryInGBs": 24}' \
    --display-name "tpot-honeypot" \
    --image-id "$IMAGE_ID" \
    --subnet-id "$SUBNET_ID" \
    --assign-public-ip true \
    --ssh-authorized-keys-file "$SSH_KEY_FILE" \
    2>&1)

  if echo "$RESULT" | grep -q '"lifecycle-state"'; then
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] SUCESSO! Instancia criada."
    echo "$RESULT"
    break
  elif echo "$RESULT" | grep -qi "out of capacity\|toomanyrequests\|too many requests"; then
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Sem capacidade ou rate limit, a tentar de novo em 60s..."
  else
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Erro inesperado:"
    echo "$RESULT"
    echo "A continuar a tentar mesmo assim em 60s..."
  fi

  ATTEMPT=$((ATTEMPT+1))
  sleep 60
done
