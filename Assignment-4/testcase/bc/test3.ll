; ModuleID = 'test3.ll'
source_filename = "./Assignment-4/testcase/src/test3.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"hello\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @foo(i8* %token) #0 !dbg !7 {
entry:
  call void @llvm.dbg.value(metadata i8* %token, metadata !13, metadata !DIExpression()), !dbg !14
  ret i8* %token, !dbg !15
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !16 {
entry:
  call void @llvm.dbg.value(metadata i8 1, metadata !20, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.value(metadata i8 0, metadata !23, metadata !DIExpression()), !dbg !22
  %call = call i8* (...) @getchar(), !dbg !24
  call void @llvm.dbg.value(metadata i8* %call, metadata !25, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), metadata !26, metadata !DIExpression()), !dbg !22
  br label %while.cond, !dbg !27

while.cond:                                       ; preds = %if.end, %entry
  %tobool = trunc i8 1 to i1, !dbg !28
  br i1 %tobool, label %while.body, label %while.end, !dbg !27

while.body:                                       ; preds = %while.cond
  %tobool1 = trunc i8 0 to i1, !dbg !29
  br i1 %tobool1, label %if.then, label %if.else, !dbg !32

if.then:                                          ; preds = %while.body
  %call2 = call i8* @foo(i8* %call), !dbg !33
  call void @llvm.dbg.value(metadata i8* %call2, metadata !35, metadata !DIExpression()), !dbg !36
  br label %if.end, !dbg !37

if.else:                                          ; preds = %while.body
  %call3 = call i8* @foo(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0)), !dbg !38
  call void @llvm.dbg.value(metadata i8* %call3, metadata !40, metadata !DIExpression()), !dbg !41
  call void (i8*, ...) bitcast (void (...)* @broadcast to void (i8*, ...)*)(i8* %call3), !dbg !42
  call void @NOALIAS(i8* %call, i8* %call3), !dbg !43
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %while.cond, !dbg !27, !llvm.loop !44

while.end:                                        ; preds = %while.cond
  ret i32 0, !dbg !46
}

declare dso_local i8* @getchar(...) #2

declare dso_local void @broadcast(...) #2

declare dso_local void @NOALIAS(i8*, i8*) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "Assignment-4/testcase/src/test3.c", directory: "/home/SVF-tools/SVF-Teaching")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.0 "}
!7 = distinct !DISubprogram(name: "foo", scope: !8, file: !8, line: 4, type: !9, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./Assignment-4/testcase/src/test3.c", directory: "/home/SVF-tools/SVF-Teaching")
!9 = !DISubroutineType(types: !10)
!10 = !{!11, !11}
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!13 = !DILocalVariable(name: "token", arg: 1, scope: !7, file: !8, line: 4, type: !11)
!14 = !DILocation(line: 0, scope: !7)
!15 = !DILocation(line: 4, column: 29, scope: !7)
!16 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 6, type: !17, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DISubroutineType(types: !18)
!18 = !{!19}
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocalVariable(name: "loopCondition", scope: !16, file: !8, line: 7, type: !21)
!21 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!22 = !DILocation(line: 0, scope: !16)
!23 = !DILocalVariable(name: "BranchCondition", scope: !16, file: !8, line: 8, type: !21)
!24 = !DILocation(line: 9, column: 25, scope: !16)
!25 = !DILocalVariable(name: "secretToken", scope: !16, file: !8, line: 9, type: !11)
!26 = !DILocalVariable(name: "publicToken", scope: !16, file: !8, line: 10, type: !11)
!27 = !DILocation(line: 11, column: 5, scope: !16)
!28 = !DILocation(line: 11, column: 11, scope: !16)
!29 = !DILocation(line: 12, column: 12, scope: !30)
!30 = distinct !DILexicalBlock(scope: !31, file: !8, line: 12, column: 12)
!31 = distinct !DILexicalBlock(scope: !16, file: !8, line: 11, column: 25)
!32 = !DILocation(line: 12, column: 12, scope: !31)
!33 = !DILocation(line: 13, column: 22, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !8, line: 12, column: 28)
!35 = !DILocalVariable(name: "b", scope: !34, file: !8, line: 13, type: !11)
!36 = !DILocation(line: 0, scope: !34)
!37 = !DILocation(line: 14, column: 9, scope: !34)
!38 = !DILocation(line: 16, column: 23, scope: !39)
!39 = distinct !DILexicalBlock(scope: !30, file: !8, line: 15, column: 13)
!40 = !DILocalVariable(name: "a", scope: !39, file: !8, line: 16, type: !11)
!41 = !DILocation(line: 0, scope: !39)
!42 = !DILocation(line: 17, column: 13, scope: !39)
!43 = !DILocation(line: 18, column: 13, scope: !39)
!44 = distinct !{!44, !27, !45}
!45 = !DILocation(line: 20, column: 5, scope: !16)
!46 = !DILocation(line: 21, column: 1, scope: !16)

