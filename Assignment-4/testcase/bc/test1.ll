; ModuleID = 'test1.ll'
source_filename = "Assignment-4/testcase/src/test1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@tgetstr.initstr = internal global [25 x i8] c"select* From City ..\00\00\00\00\00", align 16, !dbg !0

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @tgetstr() #0 !dbg !2 {
entry:
  ret i8* getelementptr inbounds ([25 x i8], [25 x i8]* @tgetstr.initstr, i64 0, i64 0), !dbg !18
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !19 {
entry:
  %call = call i8* @tgetstr(), !dbg !23
  call void @llvm.dbg.value(metadata i8* %call, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.value(metadata i8* %call, metadata !26, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.value(metadata i8* %call, metadata !27, metadata !DIExpression()), !dbg !25
  call void @MAYALIAS(i8* %call, i8* %call), !dbg !28
  call void @broadcast(i8* %call), !dbg !29
  ret i32 0, !dbg !30
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @MAYALIAS(i8*, i8*) #2

declare dso_local void @broadcast(i8*) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!8}
!llvm.module.flags = !{!14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "initstr", scope: !2, file: !3, line: 7, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "tgetstr", scope: !3, file: !3, line: 5, type: !4, scopeLine: 5, spFlags: DISPFlagDefinition, unit: !8, retainedNodes: !9)
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
!18 = !DILocation(line: 8, column: 5, scope: !2)
!19 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 12, type: !20, scopeLine: 12, spFlags: DISPFlagDefinition, unit: !8, retainedNodes: !9)
!20 = !DISubroutineType(types: !21)
!21 = !{!22}
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DILocation(line: 13, column: 23, scope: !19)
!24 = !DILocalVariable(name: "injection", scope: !19, file: !3, line: 13, type: !6)
!25 = !DILocation(line: 0, scope: !19)
!26 = !DILocalVariable(name: "s", scope: !19, file: !3, line: 14, type: !6)
!27 = !DILocalVariable(name: "b", scope: !19, file: !3, line: 15, type: !6)
!28 = !DILocation(line: 16, column: 5, scope: !19)
!29 = !DILocation(line: 17, column: 5, scope: !19)
!30 = !DILocation(line: 19, column: 5, scope: !19)
