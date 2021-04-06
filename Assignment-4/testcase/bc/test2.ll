; ModuleID = 'Assignment-4/testcase/bc/test2.ll'
source_filename = "Assignment-4/testcase/src/test2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @src(i32* %s) #0 !dbg !7 {
entry:
  call void @llvm.dbg.value(metadata i32* %s, metadata !12, metadata !DIExpression()), !dbg !13
  call void @sink(), !dbg !14
  ret void, !dbg !15
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @sink() #0 !dbg !16 {
entry:
  ret void, !dbg !19
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !20 {
entry:
  %a = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %a, metadata !23, metadata !DIExpression()), !dbg !24
  store i32 1, i32* %a, align 4, !dbg !24
  br label %while.cond, !dbg !25

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i32, i32* %a, align 4, !dbg !26
  %cmp = icmp sle i32 %0, 1, !dbg !27
  br i1 %cmp, label %while.body, label %while.end, !dbg !25

while.body:                                       ; preds = %while.cond
  call void @src(i32* %a), !dbg !28
  %1 = load i32, i32* %a, align 4, !dbg !30
  %inc = add nsw i32 %1, 1, !dbg !30
  store i32 %inc, i32* %a, align 4, !dbg !30
  br label %while.cond, !dbg !25, !llvm.loop !31

while.end:                                        ; preds = %while.cond
  ret i32 0, !dbg !33
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "Assignment-4/testcase/src/test2.c", directory: "/home/SVF-tools/SVF-Teaching")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.0 "}
!7 = distinct !DISubprogram(name: "src", scope: !1, file: !1, line: 3, type: !8, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{null, !10}
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DILocalVariable(name: "s", arg: 1, scope: !7, file: !1, line: 3, type: !10)
!13 = !DILocation(line: 0, scope: !7)
!14 = !DILocation(line: 4, column: 2, scope: !7)
!15 = !DILocation(line: 5, column: 1, scope: !7)
!16 = distinct !DISubprogram(name: "sink", scope: !1, file: !1, line: 6, type: !17, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocation(line: 7, column: 1, scope: !16)
!20 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 9, type: !21, scopeLine: 9, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DISubroutineType(types: !22)
!22 = !{!11}
!23 = !DILocalVariable(name: "a", scope: !20, file: !1, line: 10, type: !11)
!24 = !DILocation(line: 10, column: 13, scope: !20)
!25 = !DILocation(line: 11, column: 9, scope: !20)
!26 = !DILocation(line: 11, column: 17, scope: !20)
!27 = !DILocation(line: 11, column: 19, scope: !20)
!28 = !DILocation(line: 12, column: 17, scope: !29)
!29 = distinct !DILexicalBlock(scope: !20, file: !1, line: 11, column: 23)
!30 = !DILocation(line: 13, column: 18, scope: !29)
!31 = distinct !{!31, !25, !32}
!32 = !DILocation(line: 14, column: 9, scope: !20)
!33 = !DILocation(line: 15, column: 9, scope: !20)
