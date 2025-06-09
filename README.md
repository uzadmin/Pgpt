# PrivateGPT Web Interface

Веб-интерфейс для работы с PrivateGPT API с поддержкой RAG (Retrieval-Augmented Generation).

## 🚀 Быстрый старт

1. **Запустите PrivateGPT API** (в отдельном терминале):
   ```bash
   cd /путь/к/privategpt
   python -m private_gpt
   ```

2. **Запустите веб-интерфейс**:
   ```bash
   ./start.sh
   ```

3. **Откройте браузер**: http://localhost:8080

## 📋 Доступные скрипты

- `./start.sh` - Запуск веб-интерфейса
- `./check-privategpt.sh` - Проверка состояния PrivateGPT API
- `index.html` - HTML файл интерфейса

## 🔧 Функции

- 💬 Чат с документами (RAG)
- 📁 Загрузка файлов (PDF, DOCX, TXT, MD)
- 🔍 Поиск по документам
- 📊 Мониторинг соединения с API
- ⚙️ Настройки подключения

## 🛠️ Решение проблем

### PrivateGPT API не отвечает
```bash
# Проверьте статус
./check-privategpt.sh

# Найдите процесс на порту 8001
lsof -i :8001

# Перезапустите PrivateGPT
cd /путь/к/privategpt
python -m private_gpt
```

### CORS ошибки
```bash
# Запустите Chrome без CORS проверки
open -na "Google Chrome" --args --disable-web-security --user-data-dir=/tmp/chrome_dev_test
```

### Порт 8080 занят
```bash
# Найдите процесс
lsof -i :8080

# Завершите процесс
kill -9 [PID]

# Или измените порт в start.sh
python3 -m http.server 3000
```

## 📁 Структура проекта

```
privategpt-web/
├── index.html          # Веб-интерфейс
├── start.sh           # Скрипт запуска
├── check-privategpt.sh # Проверка API
└── README.md          # Документация
```

## 🆘 Поддержка

Если возникли проблемы:
1. Запустите `./check-privategpt.sh`
2. Проверьте логи PrivateGPT
3. Убедитесь что все порты свободны
