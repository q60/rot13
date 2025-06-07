// 
// IL (Intermediate Language) 
// This class represents ROT-13 implementation
// with retranslated "high-C#" abstractions
// 
// MSIL is a language like LLVM (I mean), which
// describes all application's logic independently
// of required .NET language/architecture/(not OS)
// 
// Sources on .NET languages are going through
// C#/F#/vb.net/... compilation process and transforms to IL
// sources and metadata packages.
// After all they are JIT-compiling... and packing into
// binary, (Windows -> PE, Linux -> ELF, macOS -> FAT/Universal)
//
// (more about - see Cor20 header table inside Portable Executables)
//
.class private sealed auto ansi
  ConsoleApp1.Program
    extends [System.Runtime]System.Object
{
  .custom instance void [Microsoft.VisualBasic.Core]Microsoft.VisualBasic.CompilerServices.StandardModuleAttribute::.ctor()
    = (01 00 00 00 )

  .class nested assembly sealed auto ansi serializable
    _Closure$__
      extends [System.Runtime]System.Object
  {
    .custom instance void [System.Runtime]System.Runtime.CompilerServices.CompilerGeneratedAttribute::.ctor()
      = (01 00 00 00 )

    .field public static initonly class ConsoleApp1.Program/_Closure$__ $I

    .field public static class [System.Runtime]System.Func`2<char, char> '$I0-0'

    .method public specialname rtspecialname instance void
      .ctor() cil managed
    {
      .maxstack 8

      IL_0000: ldarg.0      // this
      IL_0001: call         instance void [System.Runtime]System.Object::.ctor()
      IL_0006: ret

    } // end of method _Closure$__::.ctor

    .method private static specialname rtspecialname void
      .cctor() cil managed
    {
      .maxstack 8

      IL_0000: newobj       instance void ConsoleApp1.Program/_Closure$__::.ctor()
      IL_0005: stsfld       class ConsoleApp1.Program/_Closure$__ ConsoleApp1.Program/_Closure$__::$I
      IL_000a: ret

    } // end of method _Closure$__::.cctor

    .method assembly specialname instance char
      '_Lambda$__0-0'(
        char c
      ) cil managed
    {
      .maxstack 2
      .locals init (
        [0] char V_0,
        [1] bool V_1,
        [2] bool V_2
      )

      // [8 81 - 8 92]
      IL_0000: nop

      // [9 45 - 9 80]
      IL_0001: ldc.i4.s     97 // 0x61
      IL_0003: ldarg.1      // c
      IL_0004: bgt.s        IL_0010
      IL_0006: ldarg.1      // c
      IL_0007: ldc.i4.s     122 // 0x7a
      IL_0009: cgt
      IL_000b: ldc.i4.0
      IL_000c: ceq
      IL_000e: br.s         IL_0011
      IL_0010: ldc.i4.0
      IL_0011: stloc.1      // V_1

      IL_0012: ldloc.1      // V_1
      IL_0013: brfalse.s    IL_002c

      // [10 49 - 10 106]
      IL_0015: ldarg.1      // c
      IL_0016: ldc.i4.s     97 // 0x61
      IL_0018: sub.ovf
      IL_0019: ldc.i4.s     13 // 0x0d
      IL_001b: add.ovf
      IL_001c: ldc.i4.s     26 // 0x1a
      IL_001e: rem
      IL_001f: ldc.i4.s     97 // 0x61
      IL_0021: add.ovf
      IL_0022: call         char [Microsoft.VisualBasic.Core]Microsoft.VisualBasic.Strings::ChrW(int32)
      IL_0027: starg.s      c

      // [13 45 - 13 51]
      IL_0029: nop
      IL_002a: br.s         IL_0055

      // [11 45 - 11 84]
      IL_002c: ldc.i4.s     65 // 0x41
      IL_002e: ldarg.1      // c
      IL_002f: bgt.s        IL_003b
      IL_0031: ldarg.1      // c
      IL_0032: ldc.i4.s     90 // 0x5a
      IL_0034: cgt
      IL_0036: ldc.i4.0
      IL_0037: ceq
      IL_0039: br.s         IL_003c
      IL_003b: ldc.i4.0
      IL_003c: stloc.2      // V_2

      IL_003d: ldloc.2      // V_2
      IL_003e: brfalse.s    IL_0055

      // [12 49 - 12 106]
      IL_0040: ldarg.1      // c
      IL_0041: ldc.i4.s     65 // 0x41
      IL_0043: sub.ovf
      IL_0044: ldc.i4.s     13 // 0x0d
      IL_0046: add.ovf
      IL_0047: ldc.i4.s     26 // 0x1a
      IL_0049: rem
      IL_004a: ldc.i4.s     65 // 0x41
      IL_004c: add.ovf
      IL_004d: call         char [Microsoft.VisualBasic.Core]Microsoft.VisualBasic.Strings::ChrW(int32)
      IL_0052: starg.s      c

      // [13 45 - 13 51]
      IL_0054: nop

      // [14 45 - 14 53]
      IL_0055: ldarg.1      // c
      IL_0056: stloc.0      // V_0
      IL_0057: br.s         IL_0059

      // [15 41 - 15 53]
      IL_0059: ldloc.0      // V_0
      IL_005a: ret

    }
  }

  .method public static void
    Main(
      string[] args
    ) cil managed
  {
    .entrypoint
    .custom instance void [System.Runtime]System.STAThreadAttribute::.ctor()
      = (01 00 00 00 )
    .maxstack 4

    // [4 5 - 4 31]
    IL_0000: nop

    // [5 9 - 5 50]
    IL_0001: ldstr        "Enter string to encode: "
    IL_0006: call         void [System.Console]System.Console::Write(string)
    IL_000b: nop

    // [6 9 - 17 39]
    IL_000c: ldstr        "Encoded string: {0}\r\n"
    IL_0011: call         string [System.Console]System.Console::ReadLine()
    IL_0016: callvirt     instance char[] [System.Runtime]System.String::ToCharArray()
    IL_001b: ldsfld       class [System.Runtime]System.Func`2<char, char> ConsoleApp1.Program/_Closure$__::'$I0-0'
    IL_0020: brfalse.s    IL_0029
    IL_0022: ldsfld       class [System.Runtime]System.Func`2<char, char> ConsoleApp1.Program/_Closure$__::'$I0-0'
    IL_0027: br.s         IL_003f
    IL_0029: ldsfld       class ConsoleApp1.Program/_Closure$__ ConsoleApp1.Program/_Closure$__::$I
    IL_002e: ldftn        instance char ConsoleApp1.Program/_Closure$__::'_Lambda$__0-0'(char)
    IL_0034: newobj       instance void class [System.Runtime]System.Func`2<char, char>::.ctor(object, native int)
    IL_0039: dup
    IL_003a: stsfld       class [System.Runtime]System.Func`2<char, char> ConsoleApp1.Program/_Closure$__::'$I0-0'
    IL_003f: call         class [System.Runtime]System.Collections.Generic.IEnumerable`1<!!1/*char*/> [System.Linq]System.Linq.Enumerable::Select<char, char>(class [System.Runtime]System.Collections.Generic.IEnumerable`1<!!0/*char*/>, class [System.Runtime]System.Func`2<!!0/*char*/, !!1/*char*/>)
    IL_0044: call         !!0 [] [System.Linq]System.Linq.Enumerable::ToArray<char>(class [System.Runtime]System.Collections.Generic.IEnumerable`1<!!0/*char*/>)
    IL_0049: newobj       instance void [System.Runtime]System.String::.ctor(char[])
    IL_004e: call         string [System.Runtime]System.String::Format(string, object)
    IL_0053: call         void [System.Console]System.Console::Write(string)
    IL_0058: nop

    // [18 5 - 18 12]
    IL_0059: ret

  }
}