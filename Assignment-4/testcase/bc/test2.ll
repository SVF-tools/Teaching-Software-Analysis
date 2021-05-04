; ModuleID = 'test2.ll'
source_filename = "./Assignment-4/testcase/src/test2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@tgetstr.initstr = internal global [25 x i8] c"select* From City ..\00\00\00\00\00", align 16, !dbg !0
@.str = private unnamed_addr constant [6 x i8] c"hello\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @tgetstr() #0 !dbg !2 {
entry:
  ret i8* getelementptr inbounds ([25 x i8], [25 x i8]* @tgetstr.initstr, i64 0, i64 0), !dbg !19
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !20 {
entry:
  %call = call i8* @tgetstr(), !dbg !24
  call void @llvm.dbg.value(metadata i8* %call, metadata !25, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.value(metadata i8* %call, metadata !27, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.value(metadata i8* %call, metadata !28, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), metadata !29, metadata !DIExpression()), !dbg !26
  call void @broadcast(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0)), !dbg !30
  call void @NOALIAS(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i8* %call), !dbg !31
  ret i32 0, !dbg !32
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @broadcast(i8*) #2

declare dso_local void @NOALIAS(i8*, i8*) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!8}
!llvm.module.flags = !{!15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "initstr", scope: !2, file: !3, line: 8, type: !12, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "tgetstr", scope: !3, file: !3, line: 6, type: !4, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !8, retainedNodes: !10)
!3 = !DIFile(filename: "./Assignment-4/testcase/src/test2.c", directory: "/home/SVF-tools/SVF-Teaching")
!4 = !DISubroutineType(types: !5)
!5 = !{!6}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = distinct !DICompileUnit(language: DW_LANG_C99, file: !9, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !10, globals: !11, splitDebugInlining: false, nameTableKind: None)
!9 = !DIFile(filename: "Assignment-4/testcase/src/test2.c", directory: "/home/SVF-tools/SVF-Teaching")
!10 = !{}
!11 = !{!0}
!12 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 200, elements: !13)
!13 = !{!14}
!14 = !DISubrange(count: 25)
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{!"clang version 10.0.0 "}
!19 = !DILocation(line: 9, column: 5, scope: !2)
!20 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 13, type: !21, scopeLine: 13, spFlags: DISPFlagDefinition, unit: !8, retainedNodes: !10)
!21 = !DISubroutineType(types: !22)
!22 = !{!23}
!23 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!24 = !DILocation(line: 14, column: 23, scope: !20)
!25 = !DILocalVariable(name: "injection", scope: !20, file: !3, line: 14, type: !6)
!26 = !DILocation(line: 0, scope: !20)
!27 = !DILocalVariable(name: "s", scope: !20, file: !3, line: 15, type: !6)
!28 = !DILocalVariable(name: "b", scope: !20, file: !3, line: 16, type: !6)
!29 = !DILocalVariable(name: "safe_token", scope: !20, file: !3, line: 17, type: !6)
!30 = !DILocation(line: 18, column: 5, scope: !20)
!31 = !DILocation(line: 19, column: 5, scope: !20)
!32 = !DILocation(line: 20, column: 5, scope: !20)
