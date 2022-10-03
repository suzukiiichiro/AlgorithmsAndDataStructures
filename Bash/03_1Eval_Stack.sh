#!/bin/bash

#####
# stack (push/pop)
#
# スタックはデータ構造の一つです。
# スタックの仕組みは、ものを縦に積み上げる事を考えるとイメージしやすいです。
# 積み上げられた山からものを取り出す場合、上から順番に取り出す事になります。
# スタックにデータを追加する場合、データは一番最後に追加されます。
# スタックにデータを追加する操作をpushと呼びます。
# スタックからデータを取り出す場合、最も新しく追加されたデータから取り出されます。
# スタックからデータを取り出す操作をpopと呼びます。
# このような、後から入れたものを先に出す「後入れ先出し」の仕組みを
# 「Last In First Out 」を略してLIFOと呼びます。
# 
#####
##
#######################################
# 03_1Stack.shを、少しだけオブジェクティブに
# aRray[0].getValue() で値を取得できるように改変した
# 配列にIDと値を入れるだけのbashスクリプト
#######################################
##
# グローバル変数
declare -i nElems=0;
#
# <>display()  
# 配列を表示
function display(){
  for((i=0;i<nElems;i++)){
    echo -n "aRray[$i]  \
    ID: " $( aRray[$i].getID ) " \
    Value:" $( aRray[$i].getValue ) ; 
    echo "";
  }
}
##
# <>setValue() 
# セッター
function setValue() {
  #今後挿入や置き換えに備えてnElemsとは別の変数を用意しておく
  local Elem="$1";      
  local value="$2";
	eval "aRray[$Elem].getValue()      { echo "$value"; }"
}
##
# <>setID()
# セッター
function setID(){
  #今後挿入や置き換えに備えてnElemsとは別の変数を用意しておく
  local Elem="$1";      
  local ID="$2";
	eval "aRray[$Elem].getID()         { echo "$ID"; }"
}
##
# <> insert
# 配列の要素に値を代入
function insert(){
  local ID=$1;          #100からの連番
  local value=$2;       #配列に代入される要素の値
  setID     "$nElems"    "$ID";      #IDをセット
  setValue  "$nElems"    "$value";   #Valueをセット
  ((nElems++));
}
##
# <> set Array
# 配列を作成
function setArray(){
  local N=$1;           #すべての要素数
  local ID=100;         #100からの連番
  local value;          #配列に代入される要素の値
  for((i=0;i<N;i++)){
    value=$( echo $RANDOM );
    insert $((ID++)) $value;
  }
}
##
#
function stackPeek(){
  echo "$1 : $((nElems-1)):$(aRray[$((nElems-1))].getValue)";
}
##
#
function stackPush(){
  local value=$( echo $RANDOM );
  local ID=$(aRray[$((nElems-1))].getID)
  insert $((ID++)) $value;
  stackPeek "push";
}
##
#
function stackPop(){
  if(($nElems!=0));then
    stackPeek "pop";
    ((nElems--));
  else
    echo "Stack is empty";
  fi 
}
##
#
function stack(){
  display;
  stackPop;
  stackPush;
  stackPush;
  display;
  stackPop;
  stackPop;
  stackPop;
  stackPop;
  display;
  stackPop;
  stackPop;
  stackPop;
  display; 
  stackPop;
  stackPop;
  stackPop;
  display; 
  stackPop;
  stackPop;# Empty
}
##
#
# メインルーチン
function execStack(){
  local N=$1; #配列をセット
  setArray "$N";
  stack;
}
##
# 実行
execStack 10;
exit;
