; ModuleID = '../testcase/src/CI-local.c'
source_filename = "../testcase/src/CI-local.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.16.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @foo(i32* %m, i32* %n) #0 {
entry:
  %m.addr = alloca i32*, align 8
  %n.addr = alloca i32*, align 8
  store i32* %m, i32** %m.addr, align 8
  store i32* %n, i32** %n.addr, align 8
  %0 = load i32*, i32** %m.addr, align 8
  %1 = bitcast i32* %0 to i8*
  %2 = load i32*, i32** %n.addr, align 8
  %3 = bitcast i32* %2 to i8*
  call void @MAYALIAS(i8* %1, i8* %3)
  ret void
}

declare void @MAYALIAS(i8*, i8*) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %p = alloca i32*, align 8
  %q = alloca i32*, align 8
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  %0 = load i32, i32* %a, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32* %a, i32** %p, align 8
  store i32* %b, i32** %q, align 8
  %1 = load i32*, i32** %p, align 8
  %2 = load i32*, i32** %q, align 8
  call void @foo(i32* %1, i32* %2)
  br label %if.end

if.else:                                          ; preds = %entry
  store i32* %b, i32** %p, align 8
  store i32* %a, i32** %q, align 8
  %3 = load i32*, i32** %p, align 8
  %4 = load i32*, i32** %q, align 8
  call void @foo(i32* %3, i32* %4)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret i32 0
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"clang version 10.0.0 "}
