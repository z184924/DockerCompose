nohup docker-compose -f docker-compose.yml up >docker-nohup.out 2>&1 &
nohup docker-compose -f redis-exporter.yml up >redis-exporter-nohup.out 2>&1 &
