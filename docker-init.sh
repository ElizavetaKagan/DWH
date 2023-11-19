# Предположим, что ничего не было запущено 
# (убедиться, что нет папок data и data-slave)

# Запускаем master
docker-compose up -d postgres_master

echo "Starting postgres_master node"
sleep 120

echo "Prepare replica config"
docker exec -it postgres_master sh /etc/postgresql/init-script/init.sh

echo "Restart master node"
docker-compose restart postgres_master
sleep 120

# Запускаем replica
echo "Starting slave node"
docker-compose up -d postgres_slave
sleep 120

echo "Done"
