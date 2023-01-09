#!/bin/sh
IOSPATH=../ios/Runner/Assets.xcassets/AppIcon.appiconset/
ANDROID=../android/app/src/main/res/

sips --resampleWidth 20 BigIcon.png --out "${IOSPATH}Icon-20.png"
sips --resampleWidth 40 BigIcon.png --out "${IOSPATH}Icon-20@2x.png"
sips --resampleWidth 40 BigIcon.png --out "${IOSPATH}Icon-20@2x-1.png"
sips --resampleWidth 60 BigIcon.png --out "${IOSPATH}Icon-20@3x.png"

sips --resampleWidth 29 BigIcon.png --out "${IOSPATH}Icon-29.png"
sips --resampleWidth 29 BigIcon.png --out "${IOSPATH}Icon-29-2.png"
sips --resampleWidth 58 BigIcon.png --out "${IOSPATH}Icon-29@2x.png"
sips --resampleWidth 58 BigIcon.png --out "${IOSPATH}Icon-29@2x-1.png"
sips --resampleWidth 87 BigIcon.png --out "${IOSPATH}Icon-29@3x.png"

sips --resampleWidth 30 BigIcon.png --out "${IOSPATH}Icon-30.png"

sips --resampleWidth 40 BigIcon.png --out "${IOSPATH}Icon-40.png"
sips --resampleWidth 80 BigIcon.png --out "${IOSPATH}Icon-40@2x.png"
sips --resampleWidth 80 BigIcon.png --out "${IOSPATH}Icon-40@2x-1.png"
sips --resampleWidth 120 BigIcon.png --out "${IOSPATH}Icon-40@3x.png"

sips --resampleWidth 120 BigIcon.png --out "${IOSPATH}Icon-60@2x.png"
sips --resampleWidth 180 BigIcon.png --out "${IOSPATH}Icon-60@3x.png"

sips --resampleWidth 76 BigIcon.png --out "${IOSPATH}Icon-76.png"
sips --resampleWidth 152 BigIcon.png --out "${IOSPATH}Icon-76@2x.png"
sips --resampleWidth 167 BigIcon.png --out "${IOSPATH}Icon-83-5@2x.png"
