#!/system/bin/sh

now_date=`date +%Y-%m-%d_%H-%M-%S`

if [ ! -d /data/log/tcp_logs ]; then
    mkdir -p /data/log/tcp_logs/
    chmod 0766 /data/log/tcp_logs
    chown system:system /data/log/tcp_logs
fi

if [ ! -f /data/log/tcp_logs/capture_$now_date.pcap ]; then
    touch /data/log/tcp_logs/capture_$now_date.pcap
    chmod 0666 /data/log/tcp_logs/capture_$now_date.pcap
fi

if [ -f /system/xbin/tcpdump ]; then
    echo 'use system/xbin/tcpdump to capture log.'
    /system/xbin/tcpdump -i any -p -s 0 -C 100 -w /data/log/tcp_logs/capture_$now_date.pcap
else
    echo 'can not to capture log.'
    exit 0
fi

