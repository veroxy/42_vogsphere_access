#!/bin/bash

### We set script as executable

chmod +x user_part.sh && chmod +x root_part.sh &&

### We launch it

./user_part.sh && sudo ./root_part.sh &&

echo 'Setup finished, welcome in the freedom !'
