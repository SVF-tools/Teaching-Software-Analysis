; ModuleID = './test1.ll'
source_filename = "./test1.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx14.0.0"

@tgetstr.initstr = internal global [25 x i8] c"select* From City ..\00\00\00\00\00", align 1, !dbg !0

; Function Attrs: noinline nounwind ssp uwtable(sync)
define ptr @tgetstr() #0 !dbg !2 {
entry:
  ret ptr @tgetstr.initstr, !dbg !22
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define i32 @main() #0 !dbg !23 {
entry:
  %call = call ptr @tgetstr(), !dbg !27
  call void @llvm.dbg.value(metadata ptr %call, metadata !28, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.value(metadata ptr %call, metadata !30, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.value(metadata ptr %call, metadata !31, metadata !DIExpression()), !dbg !29
  call void @MAYALIAS(ptr noundef %call, ptr noundef %call), !dbg !32
  call void @broadcast(ptr noundef %call), !dbg !33
  ret i32 0, !dbg !34
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @MAYALIAS(ptr noundef, ptr noundef) #2

declare void @broadcast(ptr noundef) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+sm4,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+sm4,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }

!llvm.dbg.cu = !{!8}
!llvm.module.flags = !{!15, !16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "initstr", scope: !2, file: !3, line: 7, type: !12, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "tgetstr", scope: !3, file: !3, line: 5, type: !4, scopeLine: 5, spFlags: DISPFlagDefinition, unit: !8, retainedNodes: !11)
!3 = !DIFile(filename: "./test1.c", directory: "/Users/z5489735/2023/0522/Software-Security-Analysis/Assignment-1/Tests/testcases/taint")
!4 = !DISubroutineType(types: !5)
!5 = !{!6}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = distinct !DICompileUnit(language: DW_LANG_C11, file: !9, producer: "Homebrew clang version 16.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !10, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk", sdk: "MacOSX14.sdk")
!9 = !DIFile(filename: "test1.c", directory: "/Users/z5489735/2023/0522/Software-Security-Analysis/Assignment-1/Tests/testcases/taint")
!10 = !{!0}
!11 = !{}
!12 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 200, elements: !13)
!13 = !{!14}
!14 = !DISubrange(count: 25)
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 8, !"PIC Level", i32 2}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 1}
!21 = !{!"Homebrew clang version 16.0.6"}
!22 = !DILocation(line: 8, column: 5, scope: !2)
!23 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 12, type: !24, scopeLine: 12, spFlags: DISPFlagDefinition, unit: !8, retainedNodes: !11)
!24 = !DISubroutineType(types: !25)
!25 = !{!26}
!26 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!27 = !DILocation(line: 13, column: 23, scope: !23)
!28 = !DILocalVariable(name: "injection", scope: !23, file: !3, line: 13, type: !6)
!29 = !DILocation(line: 0, scope: !23)
!30 = !DILocalVariable(name: "s", scope: !23, file: !3, line: 14, type: !6)
!31 = !DILocalVariable(name: "b", scope: !23, file: !3, line: 15, type: !6)
!32 = !DILocation(line: 16, column: 5, scope: !23)
!33 = !DILocation(line: 17, column: 5, scope: !23)
!34 = !DILocation(line: 19, column: 5, scope: !23)
