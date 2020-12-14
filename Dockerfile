
FROM python:3

WORKDIR /app

COPY . /app

RUN pip install -r requirements.txt

RUN wget https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh -P /scripts

RUN chmod +x /scripts/wait-for-it.sh

ENTRYPOINT ["/scripts/wait-for-it.sh", "db:5432", "--"]

EXPOSE 80

CMD ["python", "app.py"]