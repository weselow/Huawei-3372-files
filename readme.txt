В файле /etc/dhcpcd.conf
для каждого модема запись такого вида:

interface eth1
static ip_address=192.168.2.100/24
static routers=
static domain_name_servers=
static domain_search=

(заменить "eth1" и "192.168.2.100/24")

чтобы IP был статическим, а роутинг не прописывался.



В файле /etc/3proxy/3proxy.cfg
для каждого модема запись такого вида:

proxy -n -a -p8002 -e192.168.2.100

(заменить "8002" - порт, "192.168.2.100" - IP, полученный от модема)



В файле /etc/iproute2/rt_tables
для каждого модема запись такого вида:

12      modemeth1

(заменить "12" - уникальный номер, "modemeth1" - "modem" + название интерфейса)



Новый файл /lib/dhcpcd/dhcpcd-hooks/25-modems

#/usr/bin/printenv >> /tmp/dhcpcd.log 2>&1

if [ "$reason" = "STATIC" ]; then
    /bin/date >> /tmp/dhcpcd.log 2>&1
    subnet=`echo "$new_ip_address" | grep -Po "\d+\.\d+\.\d+\."`
    echo "subnet $subnet" >> /tmp/dhcpcd.log 2>&1
    echo "interface $interface" >> /tmp/dhcpcd.log 2>&1
    if [ "$subnet" != "" ]; then
        if [ "$interface" != "" ]; then
            echo "ip route add default via ${subnet}1 table modem$interface" >> /tmp/dhcpcd.log 2>&1
            /bin/ip route add default via ${subnet}1 table modem$interface >> /tmp/dhcpcd.log 2>&1
            echo "ip rule del from $new_ip_address" >> /tmp/dhcpcd.log 2>&1
            /bin/ip rule del from $new_ip_address >> /tmp/dhcpcd.log 2>&1
            echo "ip rule add from $new_ip_address table modem$interface" >> /tmp/dhcpcd.log 2>&1
            /bin/ip rule add from $new_ip_address table modem$interface >> /tmp/dhcpcd.log 2>&1
            /etc/init.d/3proxyinit restart >> /tmp/dhcpcd.log 2>&1
        fi
    fi
fi

echo "===" >> /tmp/dhcpcd.log 2>&1

Этот скрипт создает нужное правило роутинга, когда модем появляется в системе.



curl -x 127.0.0.1:8002 -U viking01:123 ip-api.com
curl -x 127.0.0.1:8003 -U viking01:123 ip-api.com
curl -x 127.0.0.1:8004 -U viking01:123 ip-api.com
