; ModuleID = './test2.ll'
source_filename = "./test2.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx14.0.0"

; Function Attrs: noinline nounwind ssp uwtable(sync)
define void @foo(ptr noundef %m, ptr noundef %n) #0 !dbg !9 {
entry:
  call void @llvm.dbg.value(metadata ptr %m, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.value(metadata ptr %n, metadata !18, metadata !DIExpression()), !dbg !17
  call void @MAYALIAS(ptr noundef %m, ptr noundef %n), !dbg !19
  ret void, !dbg !20
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @MAYALIAS(ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind ssp uwtable(sync)
define i32 @main() #0 !dbg !21 {
entry:
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  call void @llvm.dbg.declare(metadata ptr %a, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata ptr %b, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = load i32, ptr %a, align 4, !dbg !28
  %tobool = icmp ne i32 %0, 0, !dbg !28
  br i1 %tobool, label %if.then, label %if.else, !dbg !30

if.then:                                          ; preds = %entry
  call void @llvm.dbg.value(metadata ptr %a, metadata !31, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.value(metadata ptr %b, metadata !33, metadata !DIExpression()), !dbg !32
  call void @foo(ptr noundef %a, ptr noundef %b), !dbg !34
  br label %if.end, !dbg !36

if.else:                                          ; preds = %entry
  call void @llvm.dbg.value(metadata ptr %b, metadata !31, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.value(metadata ptr %a, metadata !33, metadata !DIExpression()), !dbg !32
  call void @foo(ptr noundef %b, ptr noundef %a), !dbg !37
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret i32 0, !dbg !39
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+sm4,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+sm4,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "Homebrew clang version 16.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk", sdk: "MacOSX14.sdk")
!1 = !DIFile(filename: "test2.c", directory: "/Users/z5489735/2023/0522/Software-Security-Analysis/Assignment-1/Tests/testcases/pta")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 8, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 1}
!8 = !{!"Homebrew clang version 16.0.6"}
!9 = distinct !DISubprogram(name: "foo", scope: !10, file: !10, line: 4, type: !11, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!10 = !DIFile(filename: "./test2.c", directory: "/Users/z5489735/2023/0522/Software-Security-Analysis/Assignment-1/Tests/testcases/pta")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !{}
!16 = !DILocalVariable(name: "m", arg: 1, scope: !9, file: !10, line: 4, type: !13)
!17 = !DILocation(line: 0, scope: !9)
!18 = !DILocalVariable(name: "n", arg: 2, scope: !9, file: !10, line: 4, type: !13)
!19 = !DILocation(line: 6, column: 5, scope: !9)
!20 = !DILocation(line: 7, column: 1, scope: !9)
!21 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 9, type: !22, scopeLine: 10, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!22 = !DISubroutineType(types: !23)
!23 = !{!14}
!24 = !DILocalVariable(name: "a", scope: !21, file: !10, line: 12, type: !14)
!25 = !DILocation(line: 12, column: 9, scope: !21)
!26 = !DILocalVariable(name: "b", scope: !21, file: !10, line: 12, type: !14)
!27 = !DILocation(line: 12, column: 11, scope: !21)
!28 = !DILocation(line: 13, column: 9, scope: !29)
!29 = distinct !DILexicalBlock(scope: !21, file: !10, line: 13, column: 9)
!30 = !DILocation(line: 13, column: 9, scope: !21)
!31 = !DILocalVariable(name: "p", scope: !21, file: !10, line: 11, type: !13)
!32 = !DILocation(line: 0, scope: !21)
!33 = !DILocalVariable(name: "q", scope: !21, file: !10, line: 11, type: !13)
!34 = !DILocation(line: 16, column: 9, scope: !35)
!35 = distinct !DILexicalBlock(scope: !29, file: !10, line: 13, column: 12)
!36 = !DILocation(line: 17, column: 5, scope: !35)
!37 = !DILocation(line: 21, column: 9, scope: !38)
!38 = distinct !DILexicalBlock(scope: !29, file: !10, line: 18, column: 10)
!39 = !DILocation(line: 23, column: 5, scope: !21)
