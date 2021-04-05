; ModuleID = 'no_alias.ll'
source_filename = "Assignment-3/testcase/src/no_alias.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@global_obj_f = common dso_local global i32 0, align 4
@global_ptr_f = dso_local global i32* @global_obj_f, align 8

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
entry:
  %a = alloca i32, align 4
  store i32 5, i32* %a, align 4
  %0 = load i32*, i32** @global_ptr_f, align 8
  %1 = bitcast i32* %0 to i8*
  %2 = bitcast i32* %a to i8*
  call void @NOALIAS(i8* %1, i8* %2)
  ret i32 0
}

declare dso_local void @NOALIAS(i8*, i8*) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0 "}
