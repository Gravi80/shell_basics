#!/bin/bash

if grep -iq PATTERN FILE; then
    echo found
else
    echo not found
fi
