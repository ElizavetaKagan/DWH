# Домашнее задание №1
Выполнил: Каган Елизавета (тг: @eakagan)

Ссылки:
- https://github.com/mgcrp/hse_dwh_course_2023/tree/master/week02/sem/demo2_automated_replication [преимущественно]
- https://habr.com/ru/articles/578744/
- материалы https://karpov.courses/docker
- https://www.youtube.com/watch?v=dTI4DeDgDvI
- https://www.youtube.com/watch?v=2vwwwA4AEyk

### Как запускала и что получается

* master: user = postgres, password = past1901
* replicator: user = replicator, password = rep_pas

** проверяю, что никакие контейнеры не запущены, папки data и data-slave не существуют


1. Запускаю master

```
docker-compose up -d  postgres_master
```

Проверю, что в Docker Desktop отображается контейнер postgres_master. 

** не уверена, как фото будут отображаться, поэтому на всякий случай ссылка на диск, где они лежат https://drive.google.com/drive/folders/10fWRzcqD0aamTqq7nNNWq93HOQ63jSpH?usp=sharing, нумерация совпадает

![Рис. 1](https://drive.google.com/file/d/1bkB8p2F3jO-erkXD3rWri7gCXkqfi6Xa/view?usp=drive_link)

Так как инициализация БД уже прописана в .yaml файле, проверяю структуру БД.\
** в демонстрации использую DBeaver, так как там удобно строить диаграмму и потому что количество доступных подключений через VS code к этому моменту уже исчерпала

![Рис. 2](https://drive.google.com/drive/u/0/folders/10fWRzcqD0aamTqq7nNNWq93HOQ63jSpH)


2. 
```
docker exec -it postgres_master sh /etc/postgresql/init-script/init.sh
```
Делаю рестарт мастера.
```
docker-compose restart postgres_master
```

3. Запускаю slave
```
docker-compose up -d  postgres_slave
```

Снова проверю в Docker Desktop, что оба контейнера отображаются.

![Рис. 3](https://drive.google.com/drive/u/0/folders/10fWRzcqD0aamTqq7nNNWq93HOQ63jSpH)

Снова проверяю структуру БД.

![Рис. 4](https://drive.google.com/drive/u/0/folders/10fWRzcqD0aamTqq7nNNWq93HOQ63jSpH)

4. Проверяю, что репликация работает.\
Для этого добавляю несколько записей в таблицу categories (рис. 5) и проверяю, что они отображаются для реплики (рис. 6).

![Рис. 5](https://drive.google.com/drive/u/0/folders/10fWRzcqD0aamTqq7nNNWq93HOQ63jSpH)

![Рис. 6](https://drive.google.com/drive/u/0/folders/10fWRzcqD0aamTqq7nNNWq93HOQ63jSpH)

** указанные выше действия собраны в docker-init.sh