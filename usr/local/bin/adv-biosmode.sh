#!/bin/sh

[ -d /sys/firmware/efi ] && echo UEFI || echo BIOS
