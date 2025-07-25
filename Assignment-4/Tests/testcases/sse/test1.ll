; ModuleID = 'test2.ll'
source_filename = "test2.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx14.0.0"

; Function Attrs: noinline nounwind ssp uwtable(sync)
define i32 @getValue(ptr noundef %arr, i32 noundef %idx) #0 {
entry:
  %idxprom = sext i32 %idx to i64
  %arrayidx = getelementptr inbounds i32, ptr %arr, i64 %idxprom
  %0 = load i32, ptr %arrayidx, align 4
  ret i32 %0
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define i32 @main() #0 {
entry:
  %arr = alloca [2 x i32], align 4
  %arrayidx = getelementptr inbounds [2 x i32], ptr %arr, i64 0, i64 0
  store i32 0, ptr %arrayidx, align 4
  %arrayidx1 = getelementptr inbounds [2 x i32], ptr %arr, i64 0, i64 1
  store i32 1, ptr %arrayidx1, align 4
  %arraydecay = getelementptr inbounds [2 x i32], ptr %arr, i64 0, i64 0
  %call = call i32 @getValue(ptr noundef %arraydecay, i32 noundef 1)
  %cmp = icmp eq i32 %call, 1
  call void @svf_assert(i1 noundef zeroext %cmp)
  ret i32 0
}

declare void @svf_assert(i1 noundef zeroext) #1

attributes #0 = { noinline nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+sm4,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #1 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+sm4,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"uwtable", i32 1}
!3 = !{i32 7, !"frame-pointer", i32 1}
!4 = !{!"Homebrew clang version 16.0.6"}
