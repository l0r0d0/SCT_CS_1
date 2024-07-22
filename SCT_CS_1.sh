#!/bin/bash

encrypt() {
  local shift=$1
  local plaintext=$2
  local encrypted=""

  for ((i = 0; i < ${#plaintext}; i++)); do
    char="${plaintext:$i:1}"
    if [[ "$char" =~ [A-Z] ]]; then
      ascii=$(( $(printf "%d" "'$char") + shift ))
      if ((ascii > 90)); then
        ascii=$((ascii - 26))
      fi
      encrypted+=$(printf "\\$(printf '%03o' "$ascii")")
    elif [[ "$char" =~ [a-z] ]]; then
      ascii=$(( $(printf "%d" "'$char") + shift ))
      if ((ascii > 122)); then
        ascii=$((ascii - 26))
      fi
      encrypted+=$(printf "\\$(printf '%03o' "$ascii")")
    else
      encrypted+="$char"
    fi
  done

  echo "$encrypted"
}

decrypt() {
  local shift=$1
  local ciphertext=$2
  local decrypted=""

  for ((i = 0; i < ${#ciphertext}; i++)); do
    char="${ciphertext:$i:1}"
    if [[ "$char" =~ [A-Z] ]]; then
      ascii=$(( $(printf "%d" "'$char") - shift ))
      if ((ascii < 65)); then
        ascii=$((ascii + 26))
      fi
      decrypted+=$(printf "\\$(printf '%03o' "$ascii")")
    elif [[ "$char" =~ [a-z] ]]; then
      ascii=$(( $(printf "%d" "'$char") - shift ))
      if ((ascii < 97)); then
        ascii=$((ascii + 26))
      fi
      decrypted+=$(printf "\\$(printf '%03o' "$ascii")")
    else
      decrypted+="$char"
    fi
  done

  echo "$decrypted"
}


if [[ $# -lt 3 ]]; then
  echo "Usage: $0 <encrypt or decrypt> <shift value> <text>"
  exit 1
fi

mode=$1
shift=$2
text=$3

if [[ "$mode" == "encrypt" ]]; then
  encrypt "$shift" "$text"
elif [[ "$mode" == "decrypt" ]]; then
  decrypt "$shift" "$text"
else
  echo "Invalid mode. Use 'encrypt' or 'decrypt'."
  exit 1
fi
