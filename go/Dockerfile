# Используем официальный образ Golang
FROM golang:latest

# Создаем рабочую директорию внутри образа
WORKDIR /app

# Копируем исходный код в рабочую директорию
COPY script.go .

# Устанавливаем стороннюю библиотеку gonum
RUN go get -u gonum.org/v1/gonum/...

# Собираем и запускаем приложение
CMD ["go", "run", "script.go"]
