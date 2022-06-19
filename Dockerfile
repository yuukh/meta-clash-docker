FROM byxiaopeng/clash:latest
ENV VER=2021.06.19
ENV tun=false
ENV shell=false
ENV clash_go=false
# RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
# RUN set -ex \
#         && apk update && apk upgrade \
#         && apk add ca-certificates tzdata wget bash nftables tini unzip \
#         && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
#         && echo "Asia/Shanghai" > /etc/timezone
# RUN if [ $(arch) == aarch64 ]; then     linux=linux-armv8;     wget -P /usr/bin https://github.com/Dreamacro/clash/releases/download/premium/clash-$linux-$VER.gz;     gunzip /usr/bin/clash-$linux-$VER.gz;     mv /usr/bin/clash-$linux-$VER /usr/bin/clash;     chmod +x /usr/bin/clash; fi
# RUN if [ $(arch) == x86_64 ]; then     linux=linux-amd64;     wget -P /usr/bin https://github.com/Dreamacro/clash/releases/download/premium/clash-$linux-$VER.gz;     gunzip /usr/bin/clash-$linux-$VER.gz;     mv /usr/bin/clash-$linux-$VER /usr/bin/clash;     chmod +x /usr/bin/clash; fi
# RUN wget -P /tmp https://github.com/Dreamacro/maxmind-geoip/releases/latest/download/Country.mmdb
# RUN wget https://github.com/Dreamacro/clash-dashboard/archive/refs/heads/gh-pages.zip
# RUN mkdir /etc/supervisor.d
# RUN mkdir -p /etc/nftables
# ADD /script/clash.ini /etc/supervisor.d/clash.ini
# ADD /script/shell.sh /tmp/shell.sh
# ADD /script/chnroute.nft /etc/nftables/chnroute.nft
# ADD /script/private.nft /etc/nftables/private.nft
# ADD /script/nftables-tun.conf /etc/nftables.conf
# RUN chmod +x /tmp/shell.sh
VOLUME /root/.config/clash
EXPOSE 53 7890 7891 7892 7893
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT /entrypoint.sh