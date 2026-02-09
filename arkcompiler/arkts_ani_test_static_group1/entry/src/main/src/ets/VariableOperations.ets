/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

export class Foo {
  constructor() {
  }

  static sl: long = 1;
  static sf: float = 3.14f;
}

export namespace anyns {
  export let i: int = 3;
  export let l: long = 3;
  export let longValue: long = 3;
  export let intValue: int = 3;
  export let aDoubleValueB: double = 3.0;
  export let aDouble: double = 3.0;
  export let aNameValueB: string = "Dam";
  export let aBoolValueB: boolean = false;
  export let aBool: boolean = false;
  export let aChar: char = c'A';
  export let aByte: byte = 2;
  export let shortValue: short = 3;
  export let floatValue: float = 3;
  export let stringValue: String = "test";
  export let aCharValueB: char = c'A';
  export let aByteValueB: byte = 2;
  export let shortValueB: short = 3;
  export let floatValueB: float = 3;
  export let testValueBool: boolean = true;
  export let testValueByte: byte = 30;
  export let testValueChar: char = c'M';
  export let testValueDouble: double = 3.14;
  export let testValueFloat: float = 3.14f;
  export let testValueInt: int = 30;
  export let testValueLong: long = 30;
  export let testValueRef: String = "HongKong";
  export let testValueShort: short = 30;

  export let result: boolean;
  class ABOOL {
      static val1: byte = 1;
      static val2: byte = 2;
      public static add(): boolean {
          result = (ABOOL.val1 + ABOOL.val2) > aByte;
          return result;
      }
  }

  namespace secondbool {
      export let aValue: boolean = true;
  }

  export let sumByte: byte;
  class ABYTE {
      static val1: byte = 5;
      static val2: byte = 1;
      public static add(): byte {
          sumByte = (ABYTE.val1 + ABYTE.val2).toByte();
          return sumByte;
      }
  }

  namespace secondbyte {
      export let aValue: byte = 20;
  }

  export let sumChar: char;
  class ACHAR {
      static val1: char = c'C';
      static val2: char = Int.toChar(2);
      public static add(): char {
          sumChar = (ACHAR.val1.toInt() + ACHAR.val2.toInt()).toChar();
          return sumChar;
      }
  }

  namespace secondchar {
      export let aValue: char = c'W';
  }

  export let sumDouble: double;
  class ADOUBLE {
      static val1: double = 1.5;
      static val2: double = 2.5;
      public static add(): double {
          sumDouble = ADOUBLE.val1 + ADOUBLE.val2;
          return sumDouble;
      }
  }

  namespace seconddouble {
      export let aValue: double = 5.0;
  }

  export let sumFloat: float;
  class AFLOAT {
    static val1: float = 1.5f;
    static val2: float = 2.5f;
    public static add(): float {
      sumFloat = AFLOAT.val1 + AFLOAT.val2;
      return sumFloat;
    }
  }

  namespace secondfloat {
    export let aValue: float = 5.0f;
  }

  export let sumInt: int;
  class AINT {
    static val1: int = 1;
    static val2: int = 2;
    public static add(): int {
      sumInt = AINT.val1 + AINT.val2;
      return sumInt;
    }
  }

  namespace secondint {
    export let aValue: int = 10;
  }

  export let sumLong: long;
  class ALONG {
    static val1: long = 1;
    static val2: long = 2;
    public static add(): long {
      sumLong = ALONG.val1 + ALONG.val2;
      return sumLong;
    }
  }

  namespace secondlong {
    export let aValue: long = 10;
  }

  export let sumRef: String;
  class AREF {
    static val1: String = "hello";
    static val2: String = "world";
    public static add(): String {
      sumRef = AREF.val1 + AREF.val2;
      return sumRef;
    }
  }

  namespace secondref {
    export let aValue: String = "Chian";
  }

  export let sumShort: short;
  class ASHORT {
        static val1: short = 1;
        static val2: short = 2;
        public static add(): short {
            sumShort = (ASHORT.val1 + ASHORT.val2).toShort();
            return sumShort;
        }
    }

    namespace secondshort {
        export let aValue: short = 10;
    }
}