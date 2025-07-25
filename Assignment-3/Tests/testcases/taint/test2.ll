; ModuleID = './test2.ll'
source_filename = "./test2.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx14.0.0"

@tgetstr.initstr = internal global [25 x i8] c"select* From City ..\00\00\00\00\00", align 1, !dbg !0
@.str = private unnamed_addr constant [6 x i8] c"hello\00", align 1, !dbg !11

; Function Attrs: noinline nounwind ssp uwtable(sync)
define ptr @tgetstr() #0 !dbg !2 {
entry:
  ret ptr @tgetstr.initstr, !dbg !27
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define i32 @main() #0 !dbg !28 {
entry:
  %call = call ptr @tgetstr(), !dbg !32
  call void @llvm.dbg.value(metadata ptr %call, metadata !33, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.value(metadata ptr %call, metadata !35, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.value(metadata ptr %call, metadata !36, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.value(metadata ptr @.str, metadata !37, metadata !DIExpression()), !dbg !34
  call void @broadcast(ptr noundef @.str), !dbg !38
  call void @NOALIAS(ptr noundef @.str, ptr noundef %call), !dbg !39
  ret i32 0, !dbg !40
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @broadcast(ptr noundef) #2

declare void @NOALIAS(ptr noundef, ptr noundef) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+sm4,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+sm4,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }

!llvm.dbg.cu = !{!8}
!llvm.module.flags = !{!20, !21, !22, !23, !24, !25}
!llvm.ident = !{!26}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "initstr", scope: !2, file: !3, line: 8, type: !17, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "tgetstr", scope: !3, file: !3, line: 6, type: !4, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !8, retainedNodes: !16)
!3 = !DIFile(filename: "./test2.c", directory: "/Users/z5489735/2023/0522/Software-Security-Analysis/Assignment-1/Tests/testcases/taint")
!4 = !DISubroutineType(types: !5)
!5 = !{!6}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = distinct !DICompileUnit(language: DW_LANG_C11, file: !9, producer: "Homebrew clang version 16.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !10, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk", sdk: "MacOSX14.sdk")
!9 = !DIFile(filename: "test2.c", directory: "/Users/z5489735/2023/0522/Software-Security-Analysis/Assignment-1/Tests/testcases/taint")
!10 = !{!0, !11}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(scope: null, file: !3, line: 17, type: !13, isLocal: true, isDefinition: true)
!13 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 48, elements: !14)
!14 = !{!15}
!15 = !DISubrange(count: 6)
!16 = !{}
!17 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 200, elements: !18)
!18 = !{!19}
!19 = !DISubrange(count: 25)
!20 = !{i32 7, !"Dwarf Version", i32 4}
!21 = !{i32 2, !"Debug Info Version", i32 3}
!22 = !{i32 1, !"wchar_size", i32 4}
!23 = !{i32 8, !"PIC Level", i32 2}
!24 = !{i32 7, !"uwtable", i32 1}
!25 = !{i32 7, !"frame-pointer", i32 1}
!26 = !{!"Homebrew clang version 16.0.6"}
!27 = !DILocation(line: 9, column: 5, scope: !2)
!28 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 13, type: !29, scopeLine: 13, spFlags: DISPFlagDefinition, unit: !8, retainedNodes: !16)
!29 = !DISubroutineType(types: !30)
!30 = !{!31}
!31 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!32 = !DILocation(line: 14, column: 23, scope: !28)
!33 = !DILocalVariable(name: "injection", scope: !28, file: !3, line: 14, type: !6)
!34 = !DILocation(line: 0, scope: !28)
!35 = !DILocalVariable(name: "s", scope: !28, file: !3, line: 15, type: !6)
!36 = !DILocalVariable(name: "b", scope: !28, file: !3, line: 16, type: !6)
!37 = !DILocalVariable(name: "safe_token", scope: !28, file: !3, line: 17, type: !6)
!38 = !DILocation(line: 18, column: 5, scope: !28)
!39 = !DILocation(line: 19, column: 5, scope: !28)
!40 = !DILocation(line: 20, column: 5, scope: !28)
