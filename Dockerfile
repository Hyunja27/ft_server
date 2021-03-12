# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: spark <spark@student.42seoul.kr>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/11 13:33:41 by spark             #+#    #+#              #
#    Updated: 2021/03/12 17:50:55 by spark            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#기본이 되는 베이스 이미지
FROM debian:buster

#설명 라벨
LABEL maintainer="spark <spark.42seoul.kr>"

#기반파일들을 다운로드 및 업데이트
RUN apt update -y
RUN apt install nginx curl php-fpm mariadb-server php-mysql php-mbstring openssl vim -y

#srcs 파일들을 복사하여 가져옴
COPY ./srcs/phpMyAdmin-5.0.2-all-languages.tar.gz ./
COPY ./srcs/* ./

#쉘 스크립트
CMD bash init_bash.sh
