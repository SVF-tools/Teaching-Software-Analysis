; ModuleID = './test3.ll'
source_filename = "./test3.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx14.0.0"

@.str = private unnamed_addr constant [6 x i8] c"hello\00", align 1, !dbg !0

; Function Attrs: noinline nounwind ssp uwtable(sync)
define ptr @foo(ptr noundef %token) #0 !dbg !17 {
entry:
  call void @llvm.dbg.value(metadata ptr %token, metadata !22, metadata !DIExpression()), !dbg !23
  ret ptr %token, !dbg !24
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind ssp uwtable(sync)
define i32 @main() #0 !dbg !25 {
entry:
  call void @llvm.dbg.value(metadata i8 1, metadata !29, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.value(metadata i8 0, metadata !32, metadata !DIExpression()), !dbg !31
  %call = call ptr @getchar(), !dbg !33
  call void @llvm.dbg.value(metadata ptr %call, metadata !34, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.value(metadata ptr @.str, metadata !35, metadata !DIExpression()), !dbg !31
  br label %while.cond, !dbg !36

while.cond:                                       ; preds = %if.end, %entry
  %tobool = trunc i8 1 to i1, !dbg !37
  br i1 %tobool, label %while.body, label %while.end, !dbg !36

while.body:                                       ; preds = %while.cond
  %tobool1 = trunc i8 0 to i1, !dbg !38
  br i1 %tobool1, label %if.then, label %if.else, !dbg !41

if.then:                                          ; preds = %while.body
  %call2 = call ptr @foo(ptr noundef %call), !dbg !42
  call void @llvm.dbg.value(metadata ptr %call2, metadata !44, metadata !DIExpression()), !dbg !45
  br label %if.end, !dbg !46

if.else:                                          ; preds = %while.body
  %call3 = call ptr @foo(ptr noundef @.str), !dbg !47
  call void @llvm.dbg.value(metadata ptr %call3, metadata !49, metadata !DIExpression()), !dbg !50
  call void @broadcast(ptr noundef %call3), !dbg !51
  call void @NOALIAS(ptr noundef %call, ptr noundef %call3), !dbg !52
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %while.cond, !dbg !36, !llvm.loop !53

while.end:                                        ; preds = %while.cond
  ret i32 0, !dbg !56
}

declare ptr @getchar(...) #2

declare void @broadcast(ptr noundef) #2

declare void @NOALIAS(ptr noundef, ptr noundef) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+sm4,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+sm4,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }

!llvm.dbg.cu = !{!7}
!llvm.module.flags = !{!10, !11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 10, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "./test3.c", directory: "/Users/z5489735/2023/0522/Software-Security-Analysis/Assignment-1/Tests/testcases/taint")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 48, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 6)
!7 = distinct !DICompileUnit(language: DW_LANG_C11, file: !8, producer: "Homebrew clang version 16.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !9, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk", sdk: "MacOSX14.sdk")
!8 = !DIFile(filename: "test3.c", directory: "/Users/z5489735/2023/0522/Software-Security-Analysis/Assignment-1/Tests/testcases/taint")
!9 = !{!0}
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 8, !"PIC Level", i32 2}
!14 = !{i32 7, !"uwtable", i32 1}
!15 = !{i32 7, !"frame-pointer", i32 1}
!16 = !{!"Homebrew clang version 16.0.6"}
!17 = distinct !DISubprogram(name: "foo", scope: !2, file: !2, line: 4, type: !18, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !21)
!18 = !DISubroutineType(types: !19)
!19 = !{!20, !20}
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!21 = !{}
!22 = !DILocalVariable(name: "token", arg: 1, scope: !17, file: !2, line: 4, type: !20)
!23 = !DILocation(line: 0, scope: !17)
!24 = !DILocation(line: 4, column: 29, scope: !17)
!25 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 6, type: !26, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !21)
!26 = !DISubroutineType(types: !27)
!27 = !{!28}
!28 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!29 = !DILocalVariable(name: "loopCondition", scope: !25, file: !2, line: 7, type: !30)
!30 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!31 = !DILocation(line: 0, scope: !25)
!32 = !DILocalVariable(name: "BranchCondition", scope: !25, file: !2, line: 8, type: !30)
!33 = !DILocation(line: 9, column: 25, scope: !25)
!34 = !DILocalVariable(name: "secretToken", scope: !25, file: !2, line: 9, type: !20)
!35 = !DILocalVariable(name: "publicToken", scope: !25, file: !2, line: 10, type: !20)
!36 = !DILocation(line: 11, column: 5, scope: !25)
!37 = !DILocation(line: 11, column: 11, scope: !25)
!38 = !DILocation(line: 12, column: 12, scope: !39)
!39 = distinct !DILexicalBlock(scope: !40, file: !2, line: 12, column: 12)
!40 = distinct !DILexicalBlock(scope: !25, file: !2, line: 11, column: 25)
!41 = !DILocation(line: 12, column: 12, scope: !40)
!42 = !DILocation(line: 13, column: 22, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !2, line: 12, column: 28)
!44 = !DILocalVariable(name: "b", scope: !43, file: !2, line: 13, type: !20)
!45 = !DILocation(line: 0, scope: !43)
!46 = !DILocation(line: 14, column: 9, scope: !43)
!47 = !DILocation(line: 16, column: 23, scope: !48)
!48 = distinct !DILexicalBlock(scope: !39, file: !2, line: 15, column: 13)
!49 = !DILocalVariable(name: "a", scope: !48, file: !2, line: 16, type: !20)
!50 = !DILocation(line: 0, scope: !48)
!51 = !DILocation(line: 17, column: 13, scope: !48)
!52 = !DILocation(line: 18, column: 13, scope: !48)
!53 = distinct !{!53, !36, !54, !55}
!54 = !DILocation(line: 20, column: 5, scope: !25)
!55 = !{!"llvm.loop.mustprogress"}
!56 = !DILocation(line: 21, column: 1, scope: !25)
