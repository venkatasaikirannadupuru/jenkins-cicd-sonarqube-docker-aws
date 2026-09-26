FROM python:3.12-alpine

WORKDIR /app

COPY app/index.html .

EXPOSE 80

CMD ["python", "-m", "http.server", "80"]