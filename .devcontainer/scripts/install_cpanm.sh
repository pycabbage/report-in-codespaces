#!/bin/bash

curl -kLsS 'https://cpanmin.us' | $( which perl || /usr/bin/perl ) - --sudo App::cpanminus

cpanm --self-upgrade
