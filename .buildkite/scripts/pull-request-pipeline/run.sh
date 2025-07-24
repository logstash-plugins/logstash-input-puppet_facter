# place any commands which need to run before tests

# check if RabbitMQ port is open
netstat -tuln | grep 5672

# due ES bootstrap requirements
# Set the maximum number of memory map areas to 262144
sudo sysctl -w vm.max_map_count=262144

# Add the PPA repository
sudo add-apt-repository -y ppa:chris-lea/redis-server

# Update package lists
sudo apt-get update

# Install redis-server package
sudo apt-get install -y redis-server

# Stop redis-server service if running
sudo service redis-server stop

# Start redis-server binding to 0.0.0.0
sudo service redis-server start --bind 0.0.0.0

.ci/docker-setup.sh && .ci/docker-run.sh