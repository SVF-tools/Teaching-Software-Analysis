; ModuleID = './test1.ll'
source_filename = "./test1.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx14.0.0"

@global = global i32 0, align 4, !dbg !0
@p_global = global ptr null, align 8, !dbg !5

; Function Attrs: noinline nounwind ssp uwtable(sync)
define void @foo() #0 !dbg !17 {
entry:
  store ptr @global, ptr @p_global, align 8, !dbg !21
  ret void, !dbg !22
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define i32 @main() #0 !dbg !23 {
entry:
  call void @llvm.dbg.value(metadata ptr @global, metadata !26, metadata !DIExpression()), !dbg !27
  call void @foo(), !dbg !28
  %0 = load ptr, ptr @p_global, align 8, !dbg !29
  call void @MAYALIAS(ptr noundef @global, ptr noundef %0), !dbg !30
  ret i32 0, !dbg !31
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @MAYALIAS(ptr noundef, ptr noundef) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+sm4,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+sm4,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!10, !11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "global", scope: !2, file: !7, line: 3, type: !9, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "Homebrew clang version 16.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !4, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk", sdk: "MacOSX14.sdk")
!3 = !DIFile(filename: "test1.c", directory: "/Users/z5489735/2023/0522/Software-Security-Analysis/Assignment-1/Tests/testcases/pta")
!4 = !{!0, !5}
!5 = !DIGlobalVariableExpression(var: !6, expr: !DIExpression())
!6 = distinct !DIGlobalVariable(name: "p_global", scope: !2, file: !7, line: 4, type: !8, isLocal: false, isDefinition: true)
!7 = !DIFile(filename: "./test1.c", directory: "/Users/z5489735/2023/0522/Software-Security-Analysis/Assignment-1/Tests/testcases/pta")
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 8, !"PIC Level", i32 2}
!14 = !{i32 7, !"uwtable", i32 1}
!15 = !{i32 7, !"frame-pointer", i32 1}
!16 = !{!"Homebrew clang version 16.0.6"}
!17 = distinct !DISubprogram(name: "foo", scope: !7, file: !7, line: 6, type: !18, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !20)
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !{}
!21 = !DILocation(line: 7, column: 14, scope: !17)
!22 = !DILocation(line: 8, column: 1, scope: !17)
!23 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 10, type: !24, scopeLine: 10, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !20)
!24 = !DISubroutineType(types: !25)
!25 = !{!9}
!26 = !DILocalVariable(name: "p_local", scope: !23, file: !7, line: 11, type: !8)
!27 = !DILocation(line: 0, scope: !23)
!28 = !DILocation(line: 13, column: 5, scope: !23)
!29 = !DILocation(line: 14, column: 23, scope: !23)
!30 = !DILocation(line: 14, column: 5, scope: !23)
!31 = !DILocation(line: 15, column: 5, scope: !23)
