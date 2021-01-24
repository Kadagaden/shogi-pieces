#!/bin/bash

# https://github.com/Ka-hu/shogi-pieces
# Tools for converting shogi pieces to different formats & filenames
# Dependencies: inkscape


# make white pieces from black (0->1) for pychess (flip and rename)
pychess(){
    for file in *.svg; do inkscape --verb=EditSelectAll --verb=ObjectFlipVertically --verb=ObjectFlipHorizontally --verb=FileSave --verb=FileQuit $file; done && for file in *.svg; do mv $file ${file//0/1} ; done
}

# make black shogi pieces from white pieces (flip and rename)
w2b(){
    for file in *.svg; do inkscape --verb=EditSelectAll --verb=ObjectFlipVertically --verb=ObjectFlipHorizontally --verb=FileSave --verb=FileQuit $file; done && for file in *.svg; do mv $file ${file//White/Black} ; done
}

b2w(){
    for file in *.svg; do inkscape --verb=EditSelectAll --verb=ObjectFlipVertically --verb=ObjectFlipHorizontally --verb=FileSave --verb=FileQuit $file; done && for file in *.svg; do mv $file ${file//Black/White} ; done
}

# rename xboard pieces to gshogi pieces (XBoard default = white, gshogi default = black)
x2g() {
mv WhiteAdvisor.svg silverB.svg
mv WhiteBishop.svg bishopB.svg
mv WhiteCrownedBishop.svg bishopPB.svg
mv WhiteCrownedRook.svg rookPB.svg
mv WhiteGoldKnight.svg knightPB.svg
mv WhiteGoldLance.svg lancePB.svg
mv WhiteGoldPawn.svg pawnPB.svg
mv WhiteGoldSilver.svg silverPB.svg
mv WhiteGold.svg goldB.svg
mv WhiteKing.svg kingB.svg
mv WhiteKnight.svg knightB.svg
mv WhiteLance.svg lanceB.svg
mv WhitePawn.svg pawnB.svg
mv WhiteRook.svg rookB.svg
}

# rename gshogi pieces to xboard pieces (XBoard default = white, gshogi default = black)
g2x(){
mv silverB.svg WhiteAdvisor.svg
mv bishopB.svg WhiteBishop.svg
mv bishopPB.svg WhiteCrownedBishop.svg
mv rookPB.svg WhiteCrownedRook.svg
mv knightPB.svg WhiteGoldKnight.svg
mv lancePB.svg WhiteGoldLance.svg
mv pawnPB.svg WhiteGoldPawn.svg
mv silverPB.svg WhiteGoldSilver.svg
mv goldB.svg WhiteGold.svg
mv kingB.svg WhiteKing.svg
mv knightB.svg WhiteKnight.svg
mv lanceB.svg WhiteLance.svg
mv pawnB.svg WhitePawn.svg
mv rookB.svg WhiteRook.svg
}

# rename xboard pieces to pychess-variants pieces (white=0, black=1)
x2p(){
mv WhiteAdvisor.svg 0GI.svg
mv WhiteBishop.svg 0KA.svg
mv WhiteCrownedBishop.svg 0UM.svg
mv WhiteCrownedRook.svg 0RY.svg
mv WhiteGoldKnight.svg 0NK.svg
mv WhiteGoldLance.svg 0NY.svg
mv WhiteGoldPawn.svg 0TO.svg
mv WhiteGoldSilver.svg 0NG.svg
mv WhiteGold.svg 0KI.svg
mv WhiteKing.svg 0GY.svg
mv WhiteKnight.svg 0KE.svg
mv WhiteLance.svg 0KY.svg
mv WhitePawn.svg 0FU.svg
mv WhiteRook.svg 0HI.svg
mv BlackAdvisor.svg 1GI.svg
mv BlackBishop.svg 1KA.svg
mv BlackCrownedBishop.svg 1UM.svg
mv BlackCrownedRook.svg 1RY.svg
mv BlackGoldKnight.svg 1NK.svg
mv BlackGoldLance.svg 1NY.svg
mv BlackGoldPawn.svg 1TO.svg
mv BlackGoldSilver.svg 1NG.svg
mv BlackGold.svg 1KI.svg
mv BlackKing.svg 1OU.svg
mv BlackKnight.svg 1KE.svg
mv BlackLance.svg 1KY.svg
mv BlackPawn.svg 1FU.svg
mv BlackRook.svg 1HI.svg
}

# rename pychess-variants pieces to xboard pieces (white=0, black=1)
p2x(){
rm 0OU.svg
rm 1GY.svg
mv 0GI.svg WhiteAdvisor.svg
mv 0KA.svg WhiteBishop.svg
mv 0UM.svg WhiteCrownedBishop.svg
mv 0RY.svg WhiteCrownedRook.svg
mv 0NK.svg WhiteGoldKnight.svg
mv 0NY.svg WhiteGoldLance.svg
mv 0TO.svg WhiteGoldPawn.svg
mv 0NG.svg WhiteGoldSilver.svg
mv 0KI.svg WhiteGold.svg
mv 0GY.svg WhiteKing.svg
mv 0KE.svg WhiteKnight.svg
mv 0KY.svg WhiteLance.svg
mv 0FU.svg WhitePawn.svg
mv 0HI.svg WhiteRook.svg
mv 1GI.svg BlackAdvisor.svg
mv 1KA.svg BlackBishop.svg
mv 1UM.svg BlackCrownedBishop.svg
mv 1RY.svg BlackCrownedRook.svg
mv 1NK.svg BlackGoldKnight.svg
mv 1NY.svg BlackGoldLance.svg
mv 1TO.svg BlackGoldPawn.svg
mv 1NG.svg BlackGoldSilver.svg
mv 1KI.svg BlackGold.svg
mv 1OU.svg BlackKing.svg
mv 1KE.svg BlackKnight.svg
mv 1KY.svg BlackLance.svg
mv 1FU.svg BlackPawn.svg
mv 1HI.svg BlackRook.svg
}


svg2png(){
    w=$1
    if [[ -z $w ]]; then
        w="65"
    fi
    echo "Converting to png (width=$w)"
    for file in *.svg; do inkscape -z -w "$w" $file -e $file.png; done
}

help() {
 echo "usage: "
 echo "pychess  make white pieces from black (0->1) for pychess"
 echo "w2b      make black pieces from white pieces"
 echo "b2w      make white pieces from black pieces"
 echo "g2x      rename BLACK gshogi pieces to WHITE XBoard pieces (XBoard default = white, gshogi default = black)"
 echo "x2g      rename WHITE XBoard pieces to BLACK gshogi pieces (XBoard default = white, gshogi default = black)"
 echo "x2p      rename XBoard pieces to pychess-variants pieces"
 echo "p2x      rename pychess-variants shogi pieces to XBoard pieces"
 echo "svg2png  convert svg files to png format"
}

case $1 in
    pychess) pychess ;;
    w2b) w2b ;;
    b2w) b2w ;;
    x2g) x2g ;;
    g2x) g2x ;;
    x2p) x2p ;;
    p2x) p2x ;;
    svg2png) svg2png ;;
    "-h") help ;;
    "--help") help ;;
    "") help ;;
    *) help ;;
esac
