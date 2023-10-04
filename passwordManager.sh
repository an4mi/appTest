#!/bin/bash

password_file="passwords.txt"

echo "パスワードマネージャーへようこそ！"

echo
read -p "サービス名を入力してください: " service
read -p "ユーザー名を入力してください: " username
read -p "パスワードを入力してください: " password

echo "Thank you!"

echo "$service:$username:$password" >> "$password_file"
