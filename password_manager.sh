#!/bin/bash

PASSWORD_FILE="passwords2.txt"

add_password() {
	echo
	read -p "サービス名を入力してください: " service
	read -p "ユーザー名を入力してください: " username
	read -p "パスワードを入力してください: " password
	
    echo "$service_name:$username:$password" >> "$PASSWORD_FILE"
    echo "パスワードの追加は成功しました。"
}

get_password() {
    echo
    read -p "サービス名を入力してください：" service_name

    password_info=$(grep "^$service_name:" "$PASSWORD_FILE")

    if [ -n "$password_info" ]; then
        echo "$password_info" | awk -F: '{print "サービス名:" $1 "\nユーザー名:" $2 "\nパスワード:" $3}'
    else
        echo "そのサービスは登録されていません。"
    fi
}

while true; do
    echo "パスワードマネージャーへようこそ！"
    echo "次の選択肢から入力してください(Add Password/Get Password/Exit)："
    read choice

    case "$choice" in
        "Add Password")
            add_password
            ;;
        "Get Password")
            get_password
            ;;
        "Exit")
            echo "Thank you!"
            exit 0
            ;;
        *)
            echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
            ;;
    esac
done
