#!/bin/bash

touch /copy.log

crond -L /copy.log

# watch log
echo "Watching /copy.log..."
tail -f /copy.log
