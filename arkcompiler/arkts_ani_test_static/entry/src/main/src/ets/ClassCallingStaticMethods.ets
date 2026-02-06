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

 class OperationsBoll {
   static or(a0: boolean, a1: boolean): boolean {
     return a0 || a1;
   }
 }

 class OperationsByte {
   static sum(a0: byte, a1: byte): byte {
     return (a0 + a1).toByte();
   }
 }

 class OperationsChar {
   static sub(c0: char, c1: char): char {
     let c: Char = new Char(c'0');
     if (c0 > c1) {
       c = (c0.toInt() - c1.toInt()).toChar();
     } else {
       c = (c1.toInt() - c0.toInt()).toChar();
     }
     return c as char;
   }
 }

 class OperationsDouble {
   static sum(a0: double, a1: double): double {
     return a0 + a1 as double;
   }
 }

 class OperationsFloat {
   static sum(a0: float, a1: float): float {
     return a0 + a1 as float;
   }
 }

 class OperationsInt {
   static sum(a0: int, a1: int): int {
     return a0 + a1;
   }
 };

 class OperationsLong {
   static sum(a0: long, a1: long): long {
     return a0 + a1 as long;
   }
 };

 class PhoneRef {
   static get_button_names(): string {
     return "up";
   }

   static get_num_string(a0: int, a1: int): string {
     if (a0 == 5 && a1 == 6) {
       return "INT5"
     }
     return "NO1";
   }

   static funcA(a0: int, a1: int): string {
     if (a0 == 5 && a1 == 6) {
       return "INT5"
     }
     return "NO1";
   }
 };

 class OperationsShort {
   static sum(a0: short, a1: short): short {
     return (a0 + a1).toShort();
   }
 };

 class OperationsVoid {
     static voidMethod(a0: int, a1: int): void {
       OperationsVoid.count += a0;
       OperationsVoid.count += a1;
     }

    static getCount(): int {
      return OperationsVoid.count;
    }

    static count: int = 0;
  }

 class OperationsMeds {
   static sum(a0: short, a1: short): short {
     return (a0 + a1).toShort();
   }
 }

 class OperationsMedInt {
   static sum(a0: int, a1: int): int {
     return a0 + a1;
   }
 }

  class OperationsMedLong {
   static sum(a0: long, a1: long): long {
     return a0 + a1 as long;
   }
 }

  class OperationsMedFloat {
   static sum(a0: float, a1: float): float {
    return a0 + a1 as float;
   }
 }

  class TestDouble {
   static funcA(a0: double, a1: double): double {
    return a0 + a1 as double;
   }
 }

  class TestVoid {
   static funcA(a0: int, a1: int): void {
    TestVoid.count += a0;
    TestVoid.count += a1;
  }

  static count: int = 0;
 }

 export class FooStatic {
   constructor() {
   }

   static get_button_names(): string {
     return "up";
   }

   static get_button_names_v(a: int): string {
     return "get "+a;
   }

   static funcA(a0: boolean, a1: boolean): boolean {
     return a0 || a1;
   }
 }