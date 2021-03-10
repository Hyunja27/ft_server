#기본이 되는 베이스 이미지
FROM debian:buster
#설명 라벨
LABEL maintainer="spark <spark.42seoul.kr>"

#컨테이너 내부에서 사용할 쉘의 종류 지정
# SHELL ["/bin/bash", "-"]

# #베이스 이미지를 기반으로 베이스 컨테이너 빌드
# RUN -p 80:80 -p 443:443 debian:busterdd

#기반파일들을 다운로드 및 업데이트
RUN apt update -y
RUN apt install nginx curl vim -y

#ssl 키 발급 및 연동
RUN openssl genrsa -out ft_server.localhost.key 4096; \
	openssl req -x509 -nodes -days 160 \
	-key ft_server.localhost.key \
	-out ft_server.localhost.crt \
	-subj "/C=KR/ST=SEOUL/L=A/O=42Seoul/OU=spark/CN=localhost"; \
	chmod 644 ft_server.localhost.*; \
	mv ft_server.localhost.crt /etc/ssl/certs/;	\
	mv ft_server.localhost.key /etc/ssl/private/

# #nginx 구동
# RUN service nginx start