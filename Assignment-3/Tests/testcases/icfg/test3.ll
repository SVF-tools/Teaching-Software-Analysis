; ModuleID = './test4.ll'
source_filename = "./test4.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx14.0.0"

; Function Attrs: noinline nounwind ssp uwtable(sync)
define i32 @foo(i32 noundef %s) #0 !dbg !9 {
entry:
  call void @llvm.dbg.value(metadata i32 %s, metadata !15, metadata !DIExpression()), !dbg !16
  ret i32 %s, !dbg !17
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind ssp uwtable(sync)
define i32 @bar(i32 noundef %s) #0 !dbg !18 {
entry:
  call void @llvm.dbg.value(metadata i32 %s, metadata !19, metadata !DIExpression()), !dbg !20
  %add = add nsw i32 %s, 1, !dbg !21
  call void @llvm.dbg.value(metadata i32 %add, metadata !19, metadata !DIExpression()), !dbg !20
  %call = call i32 @foo(i32 noundef %add), !dbg !22
  call void @llvm.dbg.value(metadata i32 %call, metadata !23, metadata !DIExpression()), !dbg !20
  ret i32 %call, !dbg !24
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define i32 @main() #0 !dbg !25 {
entry:
  %call = call i32 @source(), !dbg !28
  call void @llvm.dbg.value(metadata i32 %call, metadata !29, metadata !DIExpression()), !dbg !30
  %call1 = call i32 @bar(i32 noundef %call), !dbg !31
  call void @llvm.dbg.value(metadata i32 %call1, metadata !32, metadata !DIExpression()), !dbg !30
  call void @sink(i32 noundef %call1), !dbg !33
  ret i32 0, !dbg !34
}

declare i32 @source(...) #2

declare void @sink(i32 noundef) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+sm4,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+sm4,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "Homebrew clang version 16.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk", sdk: "MacOSX14.sdk")
!1 = !DIFile(filename: "test4.c", directory: "/Users/z5489735/2023/0522/Software-Security-Analysis/Assignment-1/Tests/testcases/icfg")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 8, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 1}
!8 = !{!"Homebrew clang version 16.0.6"}
!9 = distinct !DISubprogram(name: "foo", scope: !10, file: !10, line: 3, type: !11, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "./test4.c", directory: "/Users/z5489735/2023/0522/Software-Security-Analysis/Assignment-1/Tests/testcases/icfg")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "s", arg: 1, scope: !9, file: !10, line: 3, type: !13)
!16 = !DILocation(line: 0, scope: !9)
!17 = !DILocation(line: 4, column: 5, scope: !9)
!18 = distinct !DISubprogram(name: "bar", scope: !10, file: !10, line: 6, type: !11, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!19 = !DILocalVariable(name: "s", arg: 1, scope: !18, file: !10, line: 6, type: !13)
!20 = !DILocation(line: 0, scope: !18)
!21 = !DILocation(line: 7, column: 11, scope: !18)
!22 = !DILocation(line: 8, column: 13, scope: !18)
!23 = !DILocalVariable(name: "f", scope: !18, file: !10, line: 8, type: !13)
!24 = !DILocation(line: 9, column: 5, scope: !18)
!25 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 12, type: !26, scopeLine: 12, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!26 = !DISubroutineType(types: !27)
!27 = !{!13}
!28 = !DILocation(line: 13, column: 13, scope: !25)
!29 = !DILocalVariable(name: "a", scope: !25, file: !10, line: 13, type: !13)
!30 = !DILocation(line: 0, scope: !25)
!31 = !DILocation(line: 14, column: 13, scope: !25)
!32 = !DILocalVariable(name: "q", scope: !25, file: !10, line: 14, type: !13)
!33 = !DILocation(line: 15, column: 5, scope: !25)
!34 = !DILocation(line: 16, column: 1, scope: !25)
