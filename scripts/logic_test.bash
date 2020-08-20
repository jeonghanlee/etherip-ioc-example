#!/usr/bin/env bash
#
#  Copyright (c) 2020    Jeong Han Lee
#
#  The program is free software: you can redistribute
#  it and/or modify it under the terms of the GNU General Public License
#  as published by the Free Software Foundation, either version 2 of the
#  License, or any newer version.
#
#  This program is distributed in the hope that it will be useful, but WITHOUT
#  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
#  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
#  more details.
#
#  You should have received a copy of the GNU General Public License along with
#  this program. If not, see https://www.gnu.org/licenses/gpl-2.0.txt
#
# Author  : Jeong Han Lee
# email   : jeonghan.lee@gmail.com
# Date    : 
# version : 0.0.1


function cagett
{
    caget "$1" 2> /dev/null
}

#IF _Analog_IF8[0] <= 250 THEN
#    MMT_DIPB1_FM1_Flow := 0.0;
#ELSE
#    MMT_DIPB1_FM1_Flow := _Analog_IF8[0]*0.000400 + 0.000000;
#END_IF;

#IF _Analog_IF8[1] <= 250 THEN
#    MMT_DIPB1_FM2_Flow := 0.0;
#ELSE
#    MMT_DIPB1_FM2_Flow := _Analog_IF8[1]*0.000400 + 0.000000;
#END_IF;

PAUSE=5

function test1
{
    caput LBNL:ABPLC:_Analog_IF8_0-SP 250  2> /dev/null
    caput LBNL:ABPLC:_Analog_IF8_1-SP 100000  2> /dev/null

    sleep "$PAUSE"

    printf "\n>>> FM1 Flow should be -0-\n"
    cagett "LBNL:ABPLC:MMT_DIPB1_FM1_Flow-RB"
    printf "\n>>> FM2 Flow should be -40-\n"
    cagett "LBNL:ABPLC:MMT_DIPB1_FM2_Flow-RB"
    printf "\n"

    caput LBNL:ABPLC:_Analog_IF8_0-SP 100000  2> /dev/null
    caput LBNL:ABPLC:_Analog_IF8_1-SP 250  2> /dev/null

    sleep "$PAUSE"

    printf "\n>>> FM1 Flow should be -40-\n"
    cagett "LBNL:ABPLC:MMT_DIPB1_FM1_Flow-RB"
    printf "\n>>> FM2 Flow should be -0-\n"
    cagett "LBNL:ABPLC:MMT_DIPB1_FM2_Flow-RB"
    printf "\n"
}



#sleep 5000

while true; do

	printf ">>>  "
	date '+%Y-%m-%d %H:%M:%S' 
	echo "------------------------------------------"
        test1
    echo "------------------------------------------"
done  
