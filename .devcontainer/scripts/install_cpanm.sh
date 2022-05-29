#!/bin/bash

apt install make -y
curl -kLsS 'https://cpanmin.us' | $( which perl || /usr/bin/perl ) - --sudo App::cpanminus
cpanm --self-upgrade
