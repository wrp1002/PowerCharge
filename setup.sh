#!/bin/bash
THEOS=${THEOS:-$HOME/theos}
SDK=$THEOS/sdks/iPhoneOS15.5.sdk
PROJECT_DIR=$(pwd)

cat > .clangd << EOF
CompileFlags:
  Add:
    - -x
    - objective-c
    - -fobjc-arc
    - -isysroot
    - $SDK
    - -I$THEOS/include
    - -I$THEOS/vendor/include
    - -I$SDK/usr/include
    - -I$PROJECT_DIR
    - -target
    - arm64-apple-ios16.0
EOF

echo "Generated .clangd using THEOS=$THEOS"