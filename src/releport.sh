#!/bin/bash

pihole -a -t

find ./ -mtime +30 -type f -delete
