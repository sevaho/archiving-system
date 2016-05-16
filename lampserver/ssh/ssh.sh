#!/bin/bash

ssh-keygen -t rsa
ssh-copy-id vagrant@192.168.56.15
ssh-copy-id vagrant@192.168.56.13
