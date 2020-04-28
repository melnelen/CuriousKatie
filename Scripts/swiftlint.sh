#!/bin/sh

#  swiftlint.sh
#  CuriousKatie
#
#  Created by Alexandra Ivanova on 28/04/2020.
#  Copyright © 2020 Alex Ivanova. All rights reserved.

if which swiftlint >/dev/null; then
  swiftlint
else
  echo "warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint"
fi
