; ModuleID = 'test4.ll'
source_filename = "Assignment-4/testcase/src/test4.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"/0 \00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"hello\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @getchar() #0 !dbg !7 {
entry:
  ret i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), !dbg !12
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !13 {
entry:
  call void @llvm.dbg.value(metadata i8 1, metadata !17, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.value(metadata i8 1, metadata !20, metadata !DIExpression()), !dbg !19
  %call = call i8* @getchar(), !dbg !21
  call void @llvm.dbg.value(metadata i8* %call, metadata !22, metadata !DIExpression()), !dbg !19
  br label %while.cond, !dbg !23

while.cond:                                       ; preds = %if.end, %entry
  %tobool = trunc i8 1 to i1, !dbg !24
  br i1 %tobool, label %while.body, label %while.end, !dbg !23

while.body:                                       ; preds = %while.cond
  %tobool1 = trunc i8 1 to i1, !dbg !25
  br i1 %tobool1, label %if.then, label %if.else, !dbg !28

if.then:                                          ; preds = %while.body
  call void @llvm.dbg.value(metadata i8* %call, metadata !29, metadata !DIExpression()), !dbg !31
  call void (i8*, ...) bitcast (void (...)* @broadcast to void (i8*, ...)*)(i8* %call), !dbg !32
  call void @MAYALIAS(i8* %call, i8* %call), !dbg !33
  br label %if.end, !dbg !34

if.else:                                          ; preds = %while.body
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), metadata !35, metadata !DIExpression()), !dbg !37
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %while.cond, !dbg !23, !llvm.loop !38

while.end:                                        ; preds = %while.cond
  ret i32 0, !dbg !40
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @broadcast(...) #2

declare dso_local void @MAYALIAS(i8*, i8*) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "Assignment-4/testcase/src/test4.c", directory: "/home/SVF-tools/SVF-Teaching")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.0 "}
!7 = distinct !DISubprogram(name: "getchar", scope: !1, file: !1, line: 4, type: !8, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!12 = !DILocation(line: 4, column: 21, scope: !7)
!13 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 6, type: !14, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DISubroutineType(types: !15)
!15 = !{!16}
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocalVariable(name: "loopCondition", scope: !13, file: !1, line: 7, type: !18)
!18 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!19 = !DILocation(line: 0, scope: !13)
!20 = !DILocalVariable(name: "BranchCondition", scope: !13, file: !1, line: 8, type: !18)
!21 = !DILocation(line: 9, column: 25, scope: !13)
!22 = !DILocalVariable(name: "secretToken", scope: !13, file: !1, line: 9, type: !10)
!23 = !DILocation(line: 10, column: 5, scope: !13)
!24 = !DILocation(line: 10, column: 11, scope: !13)
!25 = !DILocation(line: 11, column: 12, scope: !26)
!26 = distinct !DILexicalBlock(scope: !27, file: !1, line: 11, column: 12)
!27 = distinct !DILexicalBlock(scope: !13, file: !1, line: 10, column: 25)
!28 = !DILocation(line: 11, column: 12, scope: !27)
!29 = !DILocalVariable(name: "a", scope: !30, file: !1, line: 12, type: !10)
!30 = distinct !DILexicalBlock(scope: !26, file: !1, line: 11, column: 28)
!31 = !DILocation(line: 0, scope: !30)
!32 = !DILocation(line: 13, column: 13, scope: !30)
!33 = !DILocation(line: 14, column: 13, scope: !30)
!34 = !DILocation(line: 15, column: 9, scope: !30)
!35 = !DILocalVariable(name: "b", scope: !36, file: !1, line: 17, type: !10)
!36 = distinct !DILexicalBlock(scope: !26, file: !1, line: 16, column: 13)
!37 = !DILocation(line: 0, scope: !36)
!38 = distinct !{!38, !23, !39}
!39 = !DILocation(line: 19, column: 5, scope: !13)
!40 = !DILocation(line: 20, column: 1, scope: !13)
