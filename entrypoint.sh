#!/bin/bash
/wait/wait-for-it.sh database:3306
catalina.sh run
