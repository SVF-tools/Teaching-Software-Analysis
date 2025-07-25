; ModuleID = './test4.ll'
source_filename = "./test4.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx14.0.0"

%struct.MyStruct = type { ptr, i32, ptr }

; Function Attrs: noinline nounwind ssp uwtable(sync)
define i32 @main() #0 !dbg !9 {
entry:
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %s1 = alloca %struct.MyStruct, align 8
  %s2 = alloca %struct.MyStruct, align 8
  call void @llvm.dbg.declare(metadata ptr %a, metadata !15, metadata !DIExpression()), !dbg !16
  store i32 10, ptr %a, align 4, !dbg !16
  call void @llvm.dbg.declare(metadata ptr %b, metadata !17, metadata !DIExpression()), !dbg !18
  store i32 20, ptr %b, align 4, !dbg !18
  call void @llvm.dbg.declare(metadata ptr %s1, metadata !19, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata ptr %s2, metadata !28, metadata !DIExpression()), !dbg !29
  %ptr1 = getelementptr inbounds %struct.MyStruct, ptr %s1, i32 0, i32 0, !dbg !30
  store ptr %a, ptr %ptr1, align 8, !dbg !31
  %ptr2 = getelementptr inbounds %struct.MyStruct, ptr %s1, i32 0, i32 2, !dbg !32
  store ptr %a, ptr %ptr2, align 8, !dbg !33
  %ptr11 = getelementptr inbounds %struct.MyStruct, ptr %s2, i32 0, i32 0, !dbg !34
  store ptr %b, ptr %ptr11, align 8, !dbg !35
  %ptr22 = getelementptr inbounds %struct.MyStruct, ptr %s2, i32 0, i32 2, !dbg !36
  store ptr %a, ptr %ptr22, align 8, !dbg !37
  %ptr13 = getelementptr inbounds %struct.MyStruct, ptr %s1, i32 0, i32 0, !dbg !38
  %0 = load ptr, ptr %ptr13, align 8, !dbg !38
  %ptr24 = getelementptr inbounds %struct.MyStruct, ptr %s1, i32 0, i32 2, !dbg !39
  %1 = load ptr, ptr %ptr24, align 8, !dbg !39
  call void @MAYALIAS(ptr noundef %0, ptr noundef %1), !dbg !40
  %ptr25 = getelementptr inbounds %struct.MyStruct, ptr %s1, i32 0, i32 2, !dbg !41
  %2 = load ptr, ptr %ptr25, align 8, !dbg !41
  %ptr26 = getelementptr inbounds %struct.MyStruct, ptr %s2, i32 0, i32 2, !dbg !42
  %3 = load ptr, ptr %ptr26, align 8, !dbg !42
  call void @MAYALIAS(ptr noundef %2, ptr noundef %3), !dbg !43
  ret i32 0, !dbg !44
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @MAYALIAS(ptr noundef, ptr noundef) #2

attributes #0 = { noinline nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+sm4,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+sm4,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "Homebrew clang version 16.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk", sdk: "MacOSX14.sdk")
!1 = !DIFile(filename: "test4.c", directory: "/Users/z5489735/2023/0522/Software-Security-Analysis/Assignment-1/Tests/testcases/pta")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 8, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 1}
!8 = !{!"Homebrew clang version 16.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 10, type: !11, scopeLine: 10, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "./test4.c", directory: "/Users/z5489735/2023/0522/Software-Security-Analysis/Assignment-1/Tests/testcases/pta")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 11, type: !13)
!16 = !DILocation(line: 11, column: 9, scope: !9)
!17 = !DILocalVariable(name: "b", scope: !9, file: !10, line: 12, type: !13)
!18 = !DILocation(line: 12, column: 9, scope: !9)
!19 = !DILocalVariable(name: "s1", scope: !9, file: !10, line: 13, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "MyStruct", file: !10, line: 8, baseType: !21)
!21 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !10, line: 4, size: 192, elements: !22)
!22 = !{!23, !25, !26}
!23 = !DIDerivedType(tag: DW_TAG_member, name: "ptr1", scope: !21, file: !10, line: 5, baseType: !24, size: 64)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !21, file: !10, line: 6, baseType: !13, size: 32, offset: 64)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "ptr2", scope: !21, file: !10, line: 7, baseType: !24, size: 64, offset: 128)
!27 = !DILocation(line: 13, column: 14, scope: !9)
!28 = !DILocalVariable(name: "s2", scope: !9, file: !10, line: 13, type: !20)
!29 = !DILocation(line: 13, column: 18, scope: !9)
!30 = !DILocation(line: 15, column: 8, scope: !9)
!31 = !DILocation(line: 15, column: 13, scope: !9)
!32 = !DILocation(line: 16, column: 8, scope: !9)
!33 = !DILocation(line: 16, column: 13, scope: !9)
!34 = !DILocation(line: 17, column: 8, scope: !9)
!35 = !DILocation(line: 17, column: 13, scope: !9)
!36 = !DILocation(line: 18, column: 8, scope: !9)
!37 = !DILocation(line: 18, column: 13, scope: !9)
!38 = !DILocation(line: 20, column: 17, scope: !9)
!39 = !DILocation(line: 20, column: 26, scope: !9)
!40 = !DILocation(line: 20, column: 5, scope: !9)
!41 = !DILocation(line: 22, column: 17, scope: !9)
!42 = !DILocation(line: 22, column: 26, scope: !9)
!43 = !DILocation(line: 22, column: 5, scope: !9)
!44 = !DILocation(line: 24, column: 5, scope: !9)
