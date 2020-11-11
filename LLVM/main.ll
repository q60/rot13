%struct._IO_FILE      = type { i32, i8*, i8*
                             , i8*, i8*, i8*
                             , i8*, i8*, i8*
                             , i8*, i8*, i8*
                             , %struct._IO_marker*
                             , %struct._IO_FILE*
                             , i32, i32
                             , i64, i16
                             , i8, [1 x i8]
                             , i8*, i64
                             , %struct._IO_codecvt*
                             , %struct._IO_wide_data*
                             , %struct._IO_FILE*
                             , i8*, i64
                             , i32, [20 x i8]
                             }
%struct._IO_marker    = type opaque
%struct._IO_codecvt   = type opaque
%struct._IO_wide_data = type opaque

@.str   = private  constant [24 x i8] c"Enter string to encode:\00", align 1
@stdin  = external global   %struct._IO_FILE*,                       align 8
@.str.1 = private  constant [16 x i8] c"Encoded string:\00",         align 1
@stdout = external global   %struct._IO_FILE*,                       align 8

define dso_local i32 @main() nounwind {
    %1 = alloca [512 x i8], align 16
    %2 = getelementptr inbounds [512 x i8], [512 x i8]* %1, i64 0, i64 0
    %3 = call i32 @puts(i8* getelementptr ([24 x i8], [24 x i8]* @.str, i64 0, i64 0))
    %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8
    %5 = call i8* @fgets(i8* %2, i32 512, %struct._IO_FILE* %4)
    %6 = call i32 @puts(i8* getelementptr ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0))
    %7 = load i8, i8* %2, align 16
    %8 = icmp eq i8 %7, 0
    br i1 %8, label %34, label %9
9:  %10 = phi i64 [ %30, %26 ], [ 0, %0 ]
    %11 = phi i8 [ %32, %26 ], [ %7, %0 ]
    %12 = and i8 %11, -33
    %13 = add i8 %12, -65
    %14 = icmp ult i8 %13, 13
    br i1 %14, label %15, label %18
15: %16 = zext i8 %11 to i32
    %17 = add nuw nsw i32 %16, 13
    br label %26
18: %19 = add i8 %12, -77
    %20 = icmp ult i8 %19, 14
    br i1 %20, label %21, label %24
21: %22 = zext i8 %11 to i32
    %23 = add nsw i32 %22, -13
    br label %26

24: %25 = sext i8 %11 to i32
    br label %26
26: %27 = phi i32 [ %23, %21 ], [ %25, %24 ], [ %17, %15 ]
    %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
    %29 = call i32 @putc(i32 %27, %struct._IO_FILE* %28)
    %30 = add nuw i64 %10, 1
    %31 = getelementptr [512 x i8], [512 x i8]* %1, i64 0, i64 %30
    %32 = load i8, i8* %31, align 1
    %33 = icmp eq i8 %32, 0
    br i1 %33, label %34, label %9
34: ret i32 0
}
;*****************
; declare section
;*****************
declare i32  @puts(i8*                nocapture readonly) nounwind
declare i8* @fgets(i8*, i32, %struct._IO_FILE* nocapture) nounwind
declare i32  @putc(i32, %struct._IO_FILE*      nocapture) nounwind