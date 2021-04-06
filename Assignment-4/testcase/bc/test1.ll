; ModuleID = 'Assignment-4/testcase/bc/test1.ll'
source_filename = "Assignment-4/testcase/src/test1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@src.initstr = internal global [25 x i8] c"select* From City ..\00\00\00\00\00", align 16, !dbg !0

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @src() #0 !dbg !2 {
entry:
  ret i8* getelementptr inbounds ([25 x i8], [25 x i8]* @src.initstr, i64 0, i64 0), !dbg !18
}

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @sink(i8* %s) #0 !dbg !19 {
entry:
  call void @llvm.dbg.value(metadata i8* %s, metadata !22, metadata !DIExpression()), !dbg !23
  ret i8* %s, !dbg !24
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !25 {
entry:
  %call = call i8* @src(), !dbg !29
  call void @llvm.dbg.value(metadata i8* %call, metadata !30, metadata !DIExpression()), !dbg !31
  %call1 = call i8* @sink(i8* %call), !dbg !32
  call void @llvm.dbg.value(metadata i8* %call1, metadata !33, metadata !DIExpression()), !dbg !31
  call void @MAYALIAS(i8* %call1, i8* %call), !dbg !34
  ret i32 0, !dbg !35
}

declare dso_local void @MAYALIAS(i8*, i8*) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!8}
!llvm.module.flags = !{!14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "initstr", scope: !2, file: !3, line: 6, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "src", scope: !3, file: !3, line: 4, type: !4, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !8, retainedNodes: !9)
!3 = !DIFile(filename: "Assignment-4/testcase/src/test1.c", directory: "/home/SVF-tools/SVF-Teaching")
!4 = !DISubroutineType(types: !5)
!5 = !{!6}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !9, globals: !10, splitDebugInlining: false, nameTableKind: None)
!9 = !{}
!10 = !{!0}
!11 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 200, elements: !12)
!12 = !{!13}
!13 = !DISubrange(count: 25)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{!"clang version 10.0.0 "}
!18 = !DILocation(line: 7, column: 5, scope: !2)
!19 = distinct !DISubprogram(name: "sink", scope: !3, file: !3, line: 10, type: !20, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !8, retainedNodes: !9)
!20 = !DISubroutineType(types: !21)
!21 = !{!6, !6}
!22 = !DILocalVariable(name: "s", arg: 1, scope: !19, file: !3, line: 10, type: !6)
!23 = !DILocation(line: 0, scope: !19)
!24 = !DILocation(line: 11, column: 5, scope: !19)
!25 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 14, type: !26, scopeLine: 14, spFlags: DISPFlagDefinition, unit: !8, retainedNodes: !9)
!26 = !DISubroutineType(types: !27)
!27 = !{!28}
!28 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!29 = !DILocation(line: 15, column: 23, scope: !25)
!30 = !DILocalVariable(name: "injection", scope: !25, file: !3, line: 15, type: !6)
!31 = !DILocation(line: 0, scope: !25)
!32 = !DILocation(line: 16, column: 15, scope: !25)
!33 = !DILocalVariable(name: "s", scope: !25, file: !3, line: 16, type: !6)
!34 = !DILocation(line: 17, column: 5, scope: !25)
!35 = !DILocation(line: 18, column: 5, scope: !25)
