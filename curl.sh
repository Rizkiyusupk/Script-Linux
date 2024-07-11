#!/bin/bash
nama=(chatgpt gemini.google web.whatsapp)
waktu=$(date +%Y-m%-D%_%H:%M:%S)
for i in "${nama[@]}"
do
curl -v https://$nama.com
done

