nohup docker-compose -f docker-compose.yml up 2>&1>docker-nohup.out &
nohup docker-compose -f redis-exporter.yml up 2>&1>redis-exporter-nohup.out &
