#!/bin/bash

say(){
        local IFS=+
        mplayer "http://translate.google.com/translate_tts?ie=ASCII&tl=en&q=$*&client=tw-ob"
}

say $*

