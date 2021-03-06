; RUN: llc -mtriple=aarch64-none-linux-gnu -verify-machineinstrs < %s | FileCheck %s

%struct = type { i32, i128, i8 }

@var = global %struct zeroinitializer

define i64 @check_size() {
; CHECK: check_size:
  %starti = ptrtoint %struct* @var to i64

  %endp = getelementptr %struct* @var, i64 1
  %endi = ptrtoint %struct* %endp to i64

  %diff = sub i64 %endi, %starti
  ret i64 %diff
; CHECK: movz x0, #48
}

define i64 @check_field() {
; CHECK: check_field:
  %starti = ptrtoint %struct* @var to i64

  %endp = getelementptr %struct* @var, i64 0, i32 1
  %endi = ptrtoint i128* %endp to i64

  %diff = sub i64 %endi, %starti
  ret i64 %diff
; CHECK: movz x0, #16
}