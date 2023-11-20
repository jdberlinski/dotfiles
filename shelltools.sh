#!/bin/bash

marco() {
  export MARCO=$(pwd)
}

polo() {
  cd "$MARCO"
}

unnest() {
  find . -mindepth 2 -type f -exec mv -t . -i '{}' +
}
