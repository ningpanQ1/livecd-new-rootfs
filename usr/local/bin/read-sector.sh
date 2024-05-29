declare -i count
declare -i data
for data in `df | awk '/^\/dev\/sda/ {print $2}'`
do
	count=$((count+data/1024))
done;
echo $count > /tmp/sector_size
