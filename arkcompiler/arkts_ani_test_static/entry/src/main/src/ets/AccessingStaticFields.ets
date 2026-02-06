class TestBoolean {
  static boolean_value: boolean = true;
  static string_value: String = "true";
  static special1: int = 0;
  static special3: String = "";
  static special4: null = null;
  static special5: undefined  = undefined ;
  static special6: boolean = !'s';
  static special7: boolean = !0;
  static special8: boolean = true;
  static special9: boolean = false;
}

class TestChar {
  static char_value: char = c'c';
  static string_value: String = "c";
  static special1: string = "";
  static special2: null = null;
  static special3: undefined  = undefined ;
  static special4: char = c'\n';
  static special5: char = c'\r';
  static special6: char = c'\t';
  static special7: char = c'\b';
  static special8: char = c'\0';
  static charMin: char = 0;
  static charMax: char = 65535;
}

class TestByte {
  static byte_value: byte = 126;
  static string_value: String = "true";
  static age: byte = 0;
  static special1: string = "";
  static special2: null = null;
  static special3: undefined  = undefined ;
  static special4: string = "\n";
  static special5: string = "\r";
  static special6: string = "\t";
  static special7: string = "\b";
  static special8: string = "\a";
  static special9: string = "\f";
  static special10: string = "\v";
  static special11: string = "\0";
  static byteMin: byte = -128;
  static byteMax: byte = 127;
}

class TestShort {
  static short_value: short = 3;
  static string_value: String = "testString";
  static special2: string = "";
  static special3: null = null;
  static special4: undefined  = undefined ;
  static special5: int = 0;
  static shortMin: short = -32768;
  static shortMax: short = 32767;
}

class TestInt {
  static int_value: int = 3;
  static string_value: String = "1024";
  static specia1: int = 0;
  static specia3: string = "";
  static specia4: null = null;
  static specia5: undefined  = undefined ;
  static min: int = -2147483648;
  static max: int = 2147483647;
}

class TestLong {
  static long_value: long = 24;
  static string_value: String = "24";
  static specia1: int = 0;
  static specia3: string = "";
  static specia4: null = null;
  static specia5: undefined  = undefined ;
  static min: long = -9223372036854775808;
  static max: long = 9223372036854775807;
}

class TestFloat {
  static float_value: float = 18.0f;
  static string_value: String = "18.0";
  static specia1: int = 0;
  static specia3: string = "";
  static specia4: null = null;
  static specia5: undefined  = undefined ;
  static floatMin: float = -3.40282346638528860e+38f;
  static minpositive: float =  1.17549435e-38f;
  static floatMax: float = 3.40282346638528860e+38f;
}

class TestDouble {
  static double_value: double = 18.0;
  static string_value: String = "18.0";
  static special1: int = 0;
  static special2: string = "";
  static special3: null = null;
  static special4: undefined  = undefined ;
  static doubleMin: double = -1.7976931348623157e+308;
  static minpositive: double = 2.2250738585072014e-308;
  static doubleMax: double = 1.7976931348623157e+308;
}

class TestRef {
  static int_value: int = 0;
  static string_value: String = "testString";
}

class GetBoolStatic {
  static name: String = "Bob";
  static single: boolean = false;
  static specia1: int = 0;
  static specia3: String = "";
  static specia4: null = null;
  static specia5: undefined  = undefined ;
  static specia6: boolean = !'s';
  static specia7: boolean = !0;
  static specia8: boolean = true;
  static specia9: boolean = false;
}

class GetCharStatic {
  static name: char = c'b';
  static age: int = 20;
  static specia2: string = "";
  static specia3: null = null;
  static specia4: undefined  = undefined ;
  static specia5: char = c'\n';
  static specia6: char = c'\r';
  static specia7: char = c'\t';
  static specia8: char = c'\b';
  static specia9: char = c'\a';
  static specia10: char = c'\f';
  static specia11: char = c'\v';
  static specia12: char = c'\0';
  static charMin: char = 0;
  static charMax: char = 65535;
}

class GetbyteStatic {
  static name: string = "Bob";
  static age: byte = 0;
  static specia2: string = "";
  static specia3: null = null;
  static specia4: undefined  = undefined ;
  static specia5: string = '\n';
  static specia6: string = '\r';
  static specia7: string = '\t';
  static specia8: string = '\b';
  static specia9: string = '\a';
  static specia10: string = '\f';
  static specia11: string = '\v';
  static specia12: string = '\0';
  static byteMin: byte = -128;
  static byteMax: byte = 127;
}

class GetShortStatic {
  static name: String = "Bob";
  static age: short = +20;
  static specia1: int = 0;
  static specia3: string = "";
  static specia4: null = null;
  static specia5: undefined  = undefined ;
  static min: short = -32768;
  static max: short = +32767;
}

class GetIntStatic {
  static name: String = "Bob";
  static age: int = 20;
  static specia1: int = 0;
  static specia3: string = "";
  static specia4: null = null;
  static specia5: undefined  = undefined ;
  static min: int = -2147483648;
  static max: int = 2147483647;
}

class GetLongStatic {
  static name: String = "Bob";
  static age: long = 20;
  static specia1: int = 0;
  static specia3: string = "";
  static specia4: null = null;
  static specia5: undefined  = undefined ;
  static min: long = -9223372036854775808;
  static max: long = 9223372036854775807;
}

class GetFloatStatic {
  static name: String = "Bob";
  static age: float = 20.0f;
  static specia1: int = 0;
  static specia3: string = "";
  static specia4: null = null;
  static specia5: undefined  = undefined ;
  static floatMin: float = -3.40282346638528860e+38f;
  static minpositive: float =  1.17549435e-38f;
  static floatMax: float = 3.40282346638528860e+38f;
}

class Woman {
  static name: String = "Bob";
  static age: double = 20.0;
  static specia1: int = 0;
  static specia3: string = "";
  static specia4: null = null;
  static specia5: undefined  = undefined ;
  static doubleMin: double = -1.7976931348623157e+308;
  static minpositive: double = 2.2250738585072014e-308;
  static doubleMax: double = 1.7976931348623157e+308;
}

class ArrayClass {
  public static array: boolean[] = [true, true, true, true, true];

  public static ChangeStaticArray() {
    ArrayClass.array[2] = false;
    ArrayClass.array[4] = false;
  }

  public static CheckStaticArray(): boolean {
    return (
      ArrayClass.array[0] == true &&
        ArrayClass.array[1] == true &&
        ArrayClass.array[2] == false &&
        ArrayClass.array[3] == false &&
        ArrayClass.array[4] == false
    )
  }
}

class BoolStatic {
  static bool_value: boolean = false;
  static string_value: String = "";
}

class CharStatic {
  static char_value: char = c'a';
  static string_value: String = "";
}

class ByteStatic {
  static byte_value: byte = 0;
  static string_value: String = "";
}

class ShortStatic {
  static short_value: short = 0;
  static string_value: String = "";
}

class Packstatic {
  static int_value: int = 0;
  static string_value: String = "";
}

class PackageStatic {
  static long_value: long = 0;
  static string_value: String = "";
}

class FloatStatic {
  static float_value: float = 0.0f;
  static string_value: String = "";
}

class DoubleStatic {
  static double_value: double = 0.0;
  static string_value: String = "";
}

class BoxStatic {
  static int_value: int = 0;
  static string_value: String = "";
}

class TestSetChar {
  static char_value: char = c'a';
  static string_value: string = "";
}

class TestSetShort {
  static short_value: short = 3;
  static string_value: string = "";
}

class TestSetInt {
  static int_value: int = 3;
  static string_value: string = "";
}

class TestSetLong {
  static long_value: long = 24;
  static string_value: string = "";
}

class TestSetFloat {
  static float_value: float = 18.0f;
  static string_value: string = "";
}

class TestSetDouble {
  static double_value: double = 18.0;
  static string_value: string = "";
}

class TestSetRef {
  static int_value: int = 0;
  static string_value: String = "";
}