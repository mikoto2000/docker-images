#!/usr/bin/env awk
#
# codelist.awk
#
# target_line で指定した行周辺を出力する。
#
# awk 変数:
#     target_line : 基準行番号。この行周辺を出力する(必須)
#     print_range : 出力範囲。target_line プラスマイナスこの値の行を出力する(デフォルト: 5)
#
# usage:
#     # ./test.c の 8 行目周辺のコードを出力する
#     awk -v target_line=8 -f test.awk ./test.c
BEGIN {
    if (print_range == 0) {
        print_range = 6
    } else {
        print_range = print_range + 1
    }
    start = target_line - print_range
    end = target_line + print_range
    digit = length(end)
    format = "%" digit "d %s\n"
    target_line_format = "\033[1;39m%" digit "d %s\033[0;39m\n"
}
{
    if (NR == target_line) {
        printf target_line_format, NR, $0
    } else if (start < NR && NR < end) {
        printf format, NR, $0
    }
}
