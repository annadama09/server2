FROM prestashop/base:5.6-apache

ENV PS_VERSION 1.7.0.0

ADD https://www.prestashop.com/download/old/prestashop_1.7.0.0.zip /tmp/prestashop.zip

RUN mkdir -p /tmp/data-ps \
	&& unzip -q /tmp/prestashop.zip -d /tmp/data-ps/ \
	&& bash /tmp/ps-extractor.sh /tmp/data-ps \
&& rm /tmp/prestashop.zip
