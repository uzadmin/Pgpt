#!/bin/bash

echo "🚀 Запуск PrivateGPT Web Interface..."

# Проверяем доступность API
echo "🔍 Проверка PrivateGPT API..."
if curl -s --connect-timeout 5 http://localhost:8001/v1/health > /dev/null; then
    echo "✅ PrivateGPT API работает"
else
    echo "⚠️  PrivateGPT API не доступен на localhost:8001"
    echo "📝 Запустите PrivateGPT в другом терминале:"
    echo "   cd /путь/к/privategpt"
    echo "   python -m private_gpt"
    echo ""
    echo "🌐 Запускаю веб-интерфейс anyway..."
fi

# Запуск веб-сервера
echo "🌐 Запуск веб-сервера на порту 8080..."
python3 -m http.server 8080 &
SERVER_PID=$!

# Ожидание запуска сервера
sleep 2

# Открытие в браузере
echo "🚀 Открытие в браузере..."
if command -v open > /dev/null; then
    open http://localhost:8080
else
    echo "Откройте браузер и перейдите по адресу: http://localhost:8080"
fi

echo ""
echo "✅ Интерфейс запущен!"
echo "📱 URL: http://localhost:8080"
echo "🛑 Для остановки нажмите Ctrl+C"
echo ""

# Ожидание завершения
trap "echo '🛑 Остановка сервера...'; kill $SERVER_PID 2>/dev/null; exit" INT
wait $SERVER_PID
