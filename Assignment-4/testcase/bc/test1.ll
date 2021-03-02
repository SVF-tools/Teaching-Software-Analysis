; ModuleID = 'Assignment-4/testcase/src/test1.c'
source_filename = "Assignment-4/testcase/src/test1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@src.initstr = internal global [25 x i8] c"select* From City ..\00\00\00\00\00", align 16

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i8* @src() #0 {
entry:
  ret i8* getelementptr inbounds ([25 x i8], [25 x i8]* @src.initstr, i64 0, i64 0)
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i8* @sink(i8* %s) #0 {
entry:
  %s.addr = alloca i8*, align 8
  store i8* %s, i8** %s.addr, align 8
  %0 = load i8*, i8** %s.addr, align 8
  ret i8* %0
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %injection = alloca i8*, align 8
  %s = alloca i8*, align 8
  store i32 0, i32* %retval, align 4
  %call = call i8* @src()
  store i8* %call, i8** %injection, align 8
  %0 = load i8*, i8** %injection, align 8
  %call1 = call i8* @sink(i8* %0)
  store i8* %call1, i8** %s, align 8
  %1 = load i8*, i8** %s, align 8
  %2 = load i8*, i8** %injection, align 8
  call void @MAYALIAS(i8* %1, i8* %2)
  ret i32 0
}

declare dso_local void @MAYALIAS(i8*, i8*) #1

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0 "}
