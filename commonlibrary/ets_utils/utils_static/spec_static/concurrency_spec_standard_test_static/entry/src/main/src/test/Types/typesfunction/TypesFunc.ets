'use static'
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

export function PrimitiveTypesTest001(): void {
  let caseName: string = "PrimitiveTypesTest001";
  // 1. 核心逻辑
  if (!(Double.MIN_VALUE === Number.MIN_VALUE)) {
    console.info(`${caseName} Task execution failed： Double.MIN_VALUE === Number.MIN_VALUE`);
    throw new Error("Test failed: Double.MIN_VALUE === Number.MIN_VALUE");
  }
  if (!(Double.MAX_VALUE === Number.MAX_VALUE)) {
    console.info(`${caseName} Task execution failed： Double.MAX_VALUE === Number.MAX_VALUE`);
    throw new Error("Test failed: Double.MAX_VALUE === Number.MAX_VALUE");
  }
  if (!(Double.NEGATIVE_INFINITY === Number.NEGATIVE_INFINITY)) {
    console.info(`${caseName} Task execution failed： Double.NEGATIVE_INFINITY === Number.NEGATIVE_INFINITY`);
    throw new Error("Test failed: Double.NEGATIVE_INFINITY === Number.NEGATIVE_INFINITY");
  }
  if (!(Double.POSITIVE_INFINITY === Number.POSITIVE_INFINITY)) {
    console.info(`${caseName} Task execution failed： Double.POSITIVE_INFINITY === Number.POSITIVE_INFINITY`);
    throw new Error("Test failed: Double.POSITIVE_INFINITY === Number.POSITIVE_INFINITY");
  }

  let byte_90: byte = 90
  let double_0_90: double = byte_90
  const double_1_90 = byte_90.toDouble()
  if (!(double_0_90 instanceof double)) {
    console.info(`${caseName} Task execution failed： double_0_90 instanceof double`);
    throw new Error("Test failed: double_0_90 instanceof double");
  }
  if (!(double_1_90 instanceof double)) {
    console.info(`${caseName} Task execution failed： double_1_90 instanceof double`);
    throw new Error("Test failed: double_1_90 instanceof double");
  }
  if (!(double_0_90 === 0O1_32)) {
    console.info(`${caseName} Task execution failed： double_0_90 === 0O1_32`);
    throw new Error("Test failed: double_0_90 === 0O1_32");
  }
  if (!(double_1_90 === 0O1_32)) {
    console.info(`${caseName} Task execution failed： double_1_90 === 0O1_32`);
    throw new Error("Test failed: double_1_90 === 0O1_32");
  }

  let byte_n91: byte = -9_1
  let double_0_n91: double = byte_n91
  const double_1_n91 = byte_n91.toDouble()
  if (!(double_0_n91 instanceof double)) {
    console.info(`${caseName} Task execution failed： double_0_n91 instanceof double`);
    throw new Error("Test failed: double_0_n91 instanceof double");
  }
  if (!(double_1_n91 instanceof double)) {
    console.info(`${caseName} Task execution failed： double_1_n91 instanceof double`);
    throw new Error("Test failed: double_1_n91 instanceof double");
  }
  if (!(double_0_n91 === -0O1_33)) {
    console.info(`${caseName} Task execution failed： double_0_n91 === -0O1_33`);
    throw new Error("Test failed: double_0_n91 === -0O1_33");
  }
  if (!(double_1_n91 === -0O1_33)) {
    console.info(`${caseName} Task execution failed： double_1_n91 === -0O1_33`);
    throw new Error("Test failed: double_1_n91 === -0O1_33");
  }

  let float_0_90: float = byte_90
  let float_1_90 = byte_90.toFloat();
  if (!(float_0_90 instanceof float)) {
    console.info(`${caseName} Task execution failed： float_0_90 instanceof float`);
    throw new Error("Test failed: float_0_90 instanceof float");
  }
  if (!(float_1_90 instanceof float)) {
    console.info(`${caseName} Task execution failed： float_1_90 instanceof float`);
    throw new Error("Test failed: float_1_90 instanceof float");
  }
  if (!(float_0_90 === 0O1_32f)) {
    console.info(`${caseName} Task execution failed： float_0_90 === 0O1_32f`);
    throw new Error("Test failed: float_0_90 === 0O1_32f");
  }
  if (!(float_1_90 === 0O1_32f)) {
    console.info(`${caseName} Task execution failed： float_1_90 === 0O1_32f`);
    throw new Error("Test failed: float_1_90 === 0O1_32f");
  }
}

export function PrimitiveTypesTest002(): void {
  let caseName: string = "PrimitiveTypesTest002";
  // 1. 核心逻辑
  let byte_0_90: byte = 90
  let int_0_90: int = byte_0_90
  if (!(int_0_90 instanceof int)) {
    console.info(`${caseName} Task execution failed： int_0_90 instanceof int`);
    throw new Error("Test failed: int_0_90 instanceof int");
  }
  if (!(int_0_90 === 0O1_32)) {
    console.info(`${caseName} Task execution failed： int_0_90 === 0O1_32`);
    throw new Error("Test failed: int_0_90 === 0O1_32");
  }

  let long_0_90: long = byte_0_90
  if (!(long_0_90 instanceof long)) {
    console.info(`${caseName} Task execution failed： long_0_90 instanceof long`);
    throw new Error("Test failed: long_0_90 instanceof long");
  }
  if (!(long_0_90 === 0O1_32)) {
    console.info(`${caseName} Task execution failed： long_0_90 === 0O1_32`);
    throw new Error("Test failed: long_0_90 === 0O1_32");
  }

  let short_0_90: short = byte_0_90
  if (!(short_0_90 instanceof short)) {
    console.info(`${caseName} Task execution failed： short_0_90 instanceof short`);
    throw new Error("Test failed: short_0_90 instanceof short");
  }
  if (!(short_0_90 === 0O1_32)) {
    console.info(`${caseName} Task execution failed： short_0_90 === 0O1_32`);
    throw new Error("Test failed: short_0_90 === 0O1_32");
  }

  let int_0: int = 8122025
  let double_0: double = int_0
  if (!(double_0 instanceof double)) {
    console.info(`${caseName} Task execution failed： double_0 instanceof double`);
    throw new Error("Test failed: double_0 instanceof double");
  }
  if (!(double_0 === 8122025)) {
    console.info(`${caseName} Task execution failed： double_0 === 8122025`);
    throw new Error("Test failed: double_0 === 8122025");
  }

  let float_0: float = 8122025
  if (!(float_0 instanceof float)) {
    console.info(`${caseName} Task execution failed： float_0 instanceof float`);
    throw new Error("Test failed: float_0 instanceof float");
  }
  if (!(float_0 === 8122025)) {
    console.info(`${caseName} Task execution failed： float_0 === 8122025`);
    throw new Error("Test failed: float_0 === 8122025");
  }

  let long_0: long = int_0
  if (!(long_0 instanceof long)) {
    console.info(`${caseName} Task execution failed： long_0 instanceof long`);
    throw new Error("Test failed: long_0 instanceof long");
  }
  if (!(long_0 === 8122025)) {
    console.info(`${caseName} Task execution failed： long_0 === 8122025`);
    throw new Error("Test failed: long_0 === 8122025");
  }

  let double_1: double = long_0
  if (!(double_1 instanceof double)) {
    console.info(`${caseName} Task execution failed： double_1 instanceof double`);
    throw new Error("Test failed: double_1 instanceof double");
  }
  if (!(double_1 === 8122025)) {
    console.info(`${caseName} Task execution failed： double_1 === 8122025`);
    throw new Error("Test failed: double_1 === 8122025");
  }

  let float_1: float = long_0
  if (!(float_1 instanceof float)) {
    console.info(`${caseName} Task execution failed： float_1 instanceof float`);
    throw new Error("Test failed: float_1 instanceof float");
  }
  if (!(float_1 === 8122025)) {
    console.info(`${caseName} Task execution failed： float_1 === 8122025`);
    throw new Error("Test failed: float_1 === 8122025");
  }

  let short_1: short = 2025
  let double_2: double = short_1
  if (!(double_2 instanceof double)) {
    console.info(`${caseName} Task execution failed： double_2 instanceof double`);
    throw new Error("Test failed: double_2 instanceof double");
  }
  if (!(double_2 === 2025)) {
    console.info(`${caseName} Task execution failed： double_2 === 2025`);
    throw new Error("Test failed: double_2 === 2025");
  }

  let float_2: float = short_1
  if (!(float_2 instanceof float)) {
    console.info(`${caseName} Task execution failed： float_2 instanceof float`);
    throw new Error("Test failed: float_2 instanceof float");
  }
  if (!(float_2 === 2025)) {
    console.info(`${caseName} Task execution failed： float_2 === 2025`);
    throw new Error("Test failed: float_2 === 2025");
  }

  let int_1: int = short_1
  if (!(int_1 instanceof int)) {
    console.info(`${caseName} Task execution failed： int_1 instanceof int`);
    throw new Error("Test failed: int_1 instanceof int");
  }
  if (!(int_1 === 2025)) {
    console.info(`${caseName} Task execution failed： int_1 === 2025`);
    throw new Error("Test failed: int_1 === 2025");
  }

  let long_1: long = short_1
  if (!(int_1 instanceof int)) {
    console.info(`${caseName} Task execution failed： int_1 instanceof int`);
    throw new Error("Test failed: int_1 instanceof int");
  }
  if (!(int_1 === 2025)) {
    console.info(`${caseName} Task execution failed： int_1 === 2025`);
    throw new Error("Test failed: int_1 === 2025");
  }
}

export function PrimitiveTypesTest003(): void {
  let caseName: string = "PrimitiveTypesTest003";
  // 1. 核心逻辑
  let byte_1: byte = 1;
  let bigint_1: bigint = 1n;
  if (!((BigInt(byte_1) + bigint_1) instanceof BigInt)) {
    console.info(`${caseName} Task execution failed： (BigInt(byte_1) + bigint_1) instanceof BigInt`);
    throw new Error("Test failed: (BigInt(byte_1) + bigint_1) instanceof BigInt");
  }

  let short_10: short = 10;
  short_10 += byte_1
  if (!(short_10 === 11)) {
    console.info(`${caseName} Task execution failed： short_10 === 11`);
    throw new Error("Test failed: short_10 === 11");
  }
  let int_10: int = 10;
  int_10 -= byte_1;
  if (!(int_10 === 9)) {
    console.info(`${caseName} Task execution failed： int_10 === 9`);
    throw new Error("Test failed: int_10 === 9");
  }
  let float_16: float = 16.0f;
  float_16 /= byte_1
  if (!(float_16 === 16)) {
    console.info(`${caseName} Task execution failed： float_16 === 16`);
    throw new Error("Test failed: float_16 === 16");
  }
  let double_16: double = 16.0;
  double_16 %= byte_1
  if (!(double_16 === 0)) {
    console.info(`${caseName} Task execution failed： double_16 === 0`);
    throw new Error("Test failed: double_16 === 0");
  }
  let long_10: long = 10;
  long_10 *= byte_1
  if (!(long_10 === 10)) {
    console.info(`${caseName} Task execution failed： long_10 === 10`);
    throw new Error("Test failed: long_10 === 10");
  }

  let byte_7: byte = 7;
  {
    let long_10: long = 10;
    long_10 &= byte_7;
    if (!(long_10 === 2)) {
      console.info(`${caseName} Task execution failed： long_10 === 2`);
      throw new Error("Test failed: long_10 === 2");
    }
  }
  {
    let long_10: long = 10;
    long_10 |= byte_7;
    if (!(long_10 === 15)) {
      console.info(`${caseName} Task execution failed： long_10 === 15`);
      throw new Error("Test failed: long_10 === 15");
    }
  }
  {
    let long_10: long = 10;
    long_10 ^= byte_7;
    if (!(long_10 === 13)) {
      console.info(`${caseName} Task execution failed： long_10 === 13`);
      throw new Error("Test failed: long_10 === 13");
    }
  }
  {
    let long_10: long = 10;
    long_10 <<= byte_7;
    if (!(long_10 === 1280)) {
      console.info(`${caseName} Task execution failed： long_10 === 1280`);
      throw new Error("Test failed: long_10 === 1280");
    }
  }
  {
    let long_10: long = 10;
    long_10 >>= byte_7;
    if (!(long_10 === 0)) {
      console.info(`${caseName} Task execution failed： long_10 === 0`);
      throw new Error("Test failed: long_10 === 0");
    }
  }
  {
    let long_10: long = 10;
    long_10 >>>= byte_7;
    if (!(long_10 === 0)) {
      console.info(`${caseName} Task execution failed： long_10 === 0`);
      throw new Error("Test failed: long_10 === 0");
    }
  }
}

export function PrimitiveTypesTest004(): void {
  let caseName: string = "PrimitiveTypesTest004";
  // 1. 核心逻辑
  let boolean_true: boolean = true;
  let res = boolean_true ? 3 : 5;
  if (!(res === 3)) {
    console.info(`${caseName} Task execution failed： res === 3`);
    throw new Error("Test failed: res === 3");
  }
  let boolean_false: boolean = false;
  res = boolean_false ? 3 : 5;
  if (!(res === 5)) {
    console.info(`${caseName} Task execution failed： res === 5`);
    throw new Error("Test failed: res === 5");
  }
}

export function PrimitiveTypesTest005(): void {
  let caseName: string = "PrimitiveTypesTest005";
  // 1. 核心逻辑
  let byte_any: Any = 1 as byte;
  let short_any: Any = 1 as short;
  let int_any: Any = 1 as int;
  let long_any: Any = 1 as long;
  let float_any: Any = 1.0f;
  let double_any: Any = 1.0 as double;
  let char_any: Any = c'a';
  let string_any: Any = "abc";
  let boolean_any: Any = true;
  let undefined_any = undefined;
  let null_any: Any = null;
  if (!(byte_any === 1)) {
    console.info(`${caseName} Task execution failed： byte_any === 1`);
    throw new Error("Test failed: byte_any === 1");
  }
  if (!(short_any === 1)) {
    console.info(`${caseName} Task execution failed： short_any === 1`);
    throw new Error("Test failed: short_any === 1");
  }
  if (!(int_any === 1)) {
    console.info(`${caseName} Task execution failed： int_any === 1`);
    throw new Error("Test failed: int_any === 1");
  }
  if (!(long_any === 1)) {
    console.info(`${caseName} Task execution failed： long_any === 1`);
    throw new Error("Test failed: long_any === 1");
  }
  if (!(float_any === 1.0f)) {
    console.info(`${caseName} Task execution failed： float_any === 1.0f`);
    throw new Error("Test failed: float_any === 1.0f");
  }
  if (!(double_any === 1.0)) {
    console.info(`${caseName} Task execution failed： double_any === 1.0`);
    throw new Error("Test failed: double_any === 1.0");
  }
  if (!(char_any === c'a')) {
    console.info(`${caseName} Task execution failed： char_any === c'a'`);
    throw new Error("Test failed: char_any === c'a'");
  }
  if (!(string_any === "abc")) {
    console.info(`${caseName} Task execution failed： string_any === "abc"`);
    throw new Error("Test failed: string_any === \"abc\"");
  }
  if (!(boolean_any === true)) {
    console.info(`${caseName} Task execution failed： boolean_any === true`);
    throw new Error("Test failed: boolean_any === true");
  }
  if (!(undefined_any === undefined)) {
    console.info(`${caseName} Task execution failed： undefined_any === undefined`);
    throw new Error("Test failed: undefined_any === undefined");
  }
  if (!(null_any === null)) {
    console.info(`${caseName} Task execution failed： null_any === null`);
    throw new Error("Test failed: null_any === null");
  }
}

export function PrimitiveTypesTest006(): void {
  let caseName: string = "PrimitiveTypesTest006";
  // 1. 核心逻辑
  let a: A = new A();
  let b: B = new B();
  let a_1 = a;
  if (!(a instanceof A)) {
    console.info(`${caseName} Task execution failed： a instanceof A`);
    throw new Error("Test failed: a instanceof A");
  }
  if (!(b instanceof B)) {
    console.info(`${caseName} Task execution failed： b instanceof B`);
    throw new Error("Test failed: b instanceof B");
  }
  if (!(a_1 == a)) {
    console.info(`${caseName} Task execution failed： a_1 == a`);
    throw new Error("Test failed: a_1 == a");
  }
  if (!(a_1 != b)) {
    console.info(`${caseName} Task execution failed： a_1 != b`);
    throw new Error("Test failed: a_1 != b");
  }
  if (!(a_1 !== b)) {
    console.info(`${caseName} Task execution failed： a_1 !== b`);
    throw new Error("Test failed: a_1 !== b");
  }
}

export function PrimitiveTypesTest007(): void {
  let caseName: string = "PrimitiveTypesTest007";
  // 1. 核心逻辑
  let a: Object = new A();
  let b: string = 'test';
  let c: string = a + b;
  if (!(c === '[object Object]test')) {
    console.info(`${caseName} Task execution failed： c === '[object Object]test'`);
    throw new Error("Test failed: c === '[object Object]test'");
  }
}

export function PrimitiveTypesTest008(): void {
  let caseName: string = "PrimitiveTypesTest008";
  // 1. 核心逻辑
  let a1: AGeneric<void> = new AGeneric<void>(undefined);
  let a2: AGeneric<undefined> = new AGeneric<undefined>(undefined);
  if (!(a1.f === undefined)) {
    console.info(`${caseName} Task execution failed： a1.f === undefined`);
    throw new Error("Test failed: a1.f === undefined");
  }
  if (!(a2.f === undefined)) {
    console.info(`${caseName} Task execution failed： a2.f === undefined`);
    throw new Error("Test failed: a2.f === undefined");
  }
  if (!(a2.m() === undefined)) {
    console.info(`${caseName} Task execution failed： a2.m() === undefined`);
    throw new Error("Test failed: a2.m() === undefined");
  }
}

export function PrimitiveTypesTest009(): void {
  let caseName: string = "PrimitiveTypesTest009";
  // 1. 核心逻辑
  let num: int | undefined = undefined;
  switch (num) {
    case undefined:
      if (!(num === undefined)) {
        console.info(`${caseName} Task execution failed： num === undefined`);
        throw new Error("Test failed: num === undefined");
      }
      break;
    default:
      if (!(false === true)) {
        console.info(`${caseName} Task execution failed： false === true`);
        throw new Error("Test failed: false === true");
      }
      break;
  }
}

export function PrimitiveTypesTest010(): void {
  let caseName: string = "PrimitiveTypesTest010";
  // 1. 核心逻辑
  if (!(foo_undefined() === undefined)) {
    console.info(`${caseName} Task execution failed： foo_undefined() === undefined`);
    throw new Error("Test failed: foo_undefined() === undefined");
  }
}

export function PrimitiveTypesTest011(): void {
  let caseName: string = "PrimitiveTypesTest011";
  // 1. 核心逻辑
  let a: string|Number|undefined|null = undefined;
  if (!(a == undefined)) {
    console.info(`${caseName} Task execution failed： a == undefined`);
    throw new Error("Test failed: a == undefined");
  }
}

export function PrimitiveTypesTest012(): void {
  let caseName: string = "PrimitiveTypesTest012";
  // 1. 核心逻辑
  let a: Object | null = null;
  if (!(a == null)) {
    console.info(`${caseName} Task execution failed： a == null`);
    throw new Error("Test failed: a == null");
  }
  if (!(a instanceof null)) {
    console.info(`${caseName} Task execution failed： a instanceof null`);
    throw new Error("Test failed: a instanceof null");
  }
}

export function PrimitiveTypesTest013(): void {
  let caseName: string = "PrimitiveTypesTest013";
  // 1. 核心逻辑
  let a: string = "TEST";
  let b: string = "arkts";
  let c: string = a + b;
  if (!(a.length === 4)) {
    console.info(`${caseName} Task execution failed： a.length === 4`);
    throw new Error("Test failed: a.length === 4");
  }
  if (!(a.length instanceof int)) {
    console.info(`${caseName} Task execution failed： a.length instanceof int`);
    throw new Error("Test failed: a.length instanceof int");
  }
  if (!(c === "TESTarkts")) {
    console.info(`${caseName} Task execution failed： c === "TESTarkts"`);
    throw new Error("Test failed: c === \"TESTarkts\"");
  }
}

export function PrimitiveTypesTest014(): void {
  let caseName: string = "PrimitiveTypesTest014";
  // 1. 核心逻辑
  const prim1: byte = new Byte(0)
  let b: bigint
  if (!((b = new BigInt(prim1)) instanceof BigInt && b == 0n)) {
    console.info(`${caseName} Task execution failed： (b = new BigInt(prim1)) instanceof BigInt && b == 0n`);
    throw new Error("Test failed: (b = new BigInt(prim1)) instanceof BigInt && b == 0n");
  }
}

export function PrimitiveTypesTest015(): void {
  let caseName: string = "PrimitiveTypesTest015";
  // 1. 核心逻辑
  let arr_bigint: bigint[] = [new BigInt(1), new BigInt(2), new BigInt(3)]
  if (!(arr_bigint[0] === 1n)) {
    console.info(`${caseName} Task execution failed： arr_bigint[0] === 1n`);
    throw new Error("Test failed: arr_bigint[0] === 1n");
  }
  if (!(arr_bigint[1] === 2n)) {
    console.info(`${caseName} Task execution failed： arr_bigint[1] === 2n`);
    throw new Error("Test failed: arr_bigint[1] === 2n");
  }
  if (!(arr_bigint[2] === 3n)) {
    console.info(`${caseName} Task execution failed： arr_bigint[2] === 3n`);
    throw new Error("Test failed: arr_bigint[2] === 3n");
  }
}

export function PrimitiveTypesTest016(): void {
  let caseName: string = "PrimitiveTypesTest016";
  // 1. 核心逻辑
  let u: never|bigint|Byte|boolean
  u = (0).toByte()
  u = new BigInt(u as Byte)
  if (!(u as bigint === 0n)) {
    console.info(`${caseName} Task execution failed： u as bigint === 0n`);
    throw new Error("Test failed: u as bigint === 0n");
  }
  u = (0x7F).toByte()
  u = new BigInt(u as Byte)
  if (!(u as bigint === 127n)) {
    console.info(`${caseName} Task execution failed： u as bigint === 127n`);
    throw new Error("Test failed: u as bigint === 127n");
  }
  u = (0x80).toByte()
  u = new BigInt(u as Byte)
  if (!(u as bigint === -128n)) {
    console.info(`${caseName} Task execution failed： u as bigint === -128n`);
    throw new Error("Test failed: u as bigint === -128n");
  }
}

export function PrimitiveTypesTest017(): void {
  let caseName: string = "PrimitiveTypesTest017";
  // 1. 核心逻辑
  let s0: "string literal" = "string literal"
  let s1 = s0 + s0
  if (!(s1 instanceof string)) {
    console.info(`${caseName} Task execution failed： s1 instanceof string`);
    throw new Error("Test failed: s1 instanceof string");
  }
  if (!(s1 === "string literalstring literal")) {
    console.info(`${caseName} Task execution failed： s1 === "string literalstring literal"`);
    throw new Error("Test failed: s1 === \"string literalstring literal\"");
  }
}

export function PrimitiveTypesTest018(): void {
  let caseName: string = "PrimitiveTypesTest018";
  // 1. 核心逻辑
  let num: number;
  if (!(num === 0)) {
    console.info(`${caseName} Task execution failed： num === 0`);
    throw new Error("Test failed: num === 0");
  }
  let boo_l: boolean;
  if (!(boo_l === false)) {
    console.info(`${caseName} Task execution failed： boo_l === false`);
    throw new Error("Test failed: boo_l === false");
  }
  let nul_l: null = null;
  if (!(nul_l === null)) {
    console.info(`${caseName} Task execution failed： nul_l === null`);
    throw new Error("Test failed: nul_l === null");
  }
  let undef: undefined;
  if (!(undef === undefined)) {
    console.info(`${caseName} Task execution failed： undef === undefined`);
    throw new Error("Test failed: undef === undefined");
  }
}

export function PrimitiveTypesTest019(): void {
  let caseName: string = "PrimitiveTypesTest019";
  // 1. 核心逻辑
  let s: "some str" = "some str";
  let und: undefined = undefined;
  let obj: A_literal = new A_literal(s, und);
  if (!(obj.str === "some str")) {
    console.info(`${caseName} Task execution failed： obj.str === "some str"`);
    throw new Error("Test failed: obj.str === \"some str\"");
  }
  if (!(obj.undef === undefined)) {
    console.info(`${caseName} Task execution failed： obj.undef === undefined`);
    throw new Error("Test failed: obj.undef === undefined");
  }
}

export function PrimitiveTypesTest020(): void {
  let caseName: string = "PrimitiveTypesTest020";
  // 1. 核心逻辑
  let u1: U = "some str";
  if (!(u1 === "some str")) {
    console.info(`${caseName} Task execution failed： u1 === "some str"`);
    throw new Error("Test failed: u1 === \"some str\"");
  }
  u1 = undefined;
  if (!(u1 === undefined)) {
    console.info(`${caseName} Task execution failed： u1 === undefined`);
    throw new Error("Test failed: u1 === undefined");
  }
  u1 = 2025;
  if (!(u1 === 2025)) {
    console.info(`${caseName} Task execution failed： u1 === 2025`);
    throw new Error("Test failed: u1 === 2025");
  }
}

export function PrimitiveTypesTest021(): void {
  let caseName: string = "PrimitiveTypesTest021";
  // 1. 核心逻辑
  let mat: Matrix = [
    [1, 2, 3],
    [4, 5, 6]
  ];
  if (!(mat.length === 2)) {
    console.info(`${caseName} Task execution failed： mat.length === 2`);
    throw new Error("Test failed: mat.length === 2");
  }
  if (!(mat[0].length === 3)) {
    console.info(`${caseName} Task execution failed： mat[0].length === 3`);
    throw new Error("Test failed: mat[0].length === 3");
  }
  if (!(mat[1][2] === 6)) {
    console.info(`${caseName} Task execution failed： mat[1][2] === 6`);
    throw new Error("Test failed: mat[1][2] === 6");
  }
  if (!(mat[0][1] instanceof int)) {
    console.info(`${caseName} Task execution failed： mat[0][1] instanceof int`);
    throw new Error("Test failed: mat[0][1] instanceof int");
  }
}

export function PrimitiveTypesTest022(): void {
  let caseName: string = "PrimitiveTypesTest022";
  // 1. 核心逻辑
  let arr: Array<string> = ['a', 'b', 'c'];
  let arr2: string[] = [];
  arr2 = arr;
  if (!(arr2.length === 3)) {
    console.info(`${caseName} Task execution failed： arr2.length === 3`);
    throw new Error("Test failed: arr2.length === 3");
  }
  if (!(arr2[0] === 'a')) {
    console.info(`${caseName} Task execution failed： arr2[0] === 'a'`);
    throw new Error("Test failed: arr2[0] === 'a'");
  }
}

export function PrimitiveTypesTest023(): void {
  let caseName: string = "PrimitiveTypesTest023";
  // 1. 核心逻辑
  let c: Color = Color.Green;
  if (!(c === 1)) {
    console.info(`${caseName} Task execution failed： c === 1`);
    throw new Error("Test failed: c === 1");
  }
}

export function PrimitiveTypesTest024(): void {
  let caseName: string = "PrimitiveTypesTest024";
  // 1. 核心逻辑
  let s: Status = Status.Active;
  if (!(s === Status.Active)) {
    console.info(`${caseName} Task execution failed： s === Status.Active`);
    throw new Error("Test failed: s === Status.Active");
  }
}

export function PrimitiveTypesTest025(): void {
  let caseName: string = "PrimitiveTypesTest025";
  // 1. 核心逻辑
  let tuple: [string, number] = ["hello", 10];
  if (!(tuple[0] === "hello")) {
    console.info(`${caseName} Task execution failed： tuple[0] === "hello"`);
    throw new Error("Test failed: tuple[0] === \"hello\"");
  }
  if (!(tuple[1] === 10)) {
    console.info(`${caseName} Task execution failed： tuple[1] === 10`);
    throw new Error("Test failed: tuple[1] === 10");
  }
}

export function PrimitiveTypesTest026(): void {
  let caseName: string = "PrimitiveTypesTest026";
  // 1. 核心逻辑
  let char_a: char = c'a';
  let char_b: char = c'b';
  let char_chinese: char = c'中';
  let char_unicode: char = c'\uFFFF';

  if (!(char_a === c'a')) {
    console.info(`${caseName} Task execution failed： char_a === c'a'`);
    throw new Error("Test failed: char_a === c'a'");
  }
  if (!(char_b === c'b')) {
    console.info(`${caseName} Task execution failed： char_b === c'b'`);
    throw new Error("Test failed: char_b === c'b'");
  }
  if (!(char_chinese === c'中')) {
    console.info(`${caseName} Task execution failed： char_chinese === c'中'`);
    throw new Error("Test failed: char_chinese === c'中'");
  }
  if (!(char_unicode === c'\uFFFF')) {
    console.info(`${caseName} Task execution failed： char_unicode === c'\\uFFFF'`);
    throw new Error("Test failed: char_unicode === c'\\uFFFF'");
  }

  if (!(char_a == char_a)) {
    console.info(`${caseName} Task execution failed： char_a == char_a`);
    throw new Error("Test failed: char_a == char_a");
  }
  if (!(char_a === char_a)) {
    console.info(`${caseName} Task execution failed： char_a === char_a`);
    throw new Error("Test failed: char_a === char_a");
  }
  if (!(char_a != char_b)) {
    console.info(`${caseName} Task execution failed： char_a != char_b`);
    throw new Error("Test failed: char_a != char_b");
  }
  if (!(char_a !== char_b)) {
    console.info(`${caseName} Task execution failed： char_a !== char_b`);
    throw new Error("Test failed: char_a !== char_b");
  }
}

export function PrimitiveTypesTest027(): void {
  let caseName: string = "PrimitiveTypesTest027";
  // 1. 核心逻辑
  let arr: number[] = [1, 2, 3];
  if (!(arr.length === 3)) {
    console.info(`${caseName} Task execution failed： arr.length === 3`);
    throw new Error("Test failed: arr.length === 3");
  }
  if (!(arr[0] === 1)) {
    console.info(`${caseName} Task execution failed： arr[0] === 1`);
    throw new Error("Test failed: arr[0] === 1");
  }

  let arr2 = arr;
  arr2[0] = 99;
  if (!(arr[0] === 99)) {
    console.info(`${caseName} Task execution failed： arr[0] === 99`);
    throw new Error("Test failed: arr[0] === 99");
  }

  let readonlyArr: readonly number[] = [10, 20, 30];
  if (!(readonlyArr.length === 3)) {
    console.info(`${caseName} Task execution failed： readonlyArr.length === 3`);
    throw new Error("Test failed: readonlyArr.length === 3");
  }
  if (!(readonlyArr[0] === 10)) {
    console.info(`${caseName} Task execution failed： readonlyArr[0] === 10`);
    throw new Error("Test failed: readonlyArr[0] === 10");
  }
}

export function PrimitiveTypesTest028(): void {
  let caseName: string = "PrimitiveTypesTest028";
  // 1. 核心逻辑
  let v: Mixed = 42;
  if (!(v === 42)) {
    console.info(`${caseName} Task execution failed： v === 42`);
    throw new Error("Test failed: v === 42");
  }

  v = "hello";
  if (!(v === "hello")) {
    console.info(`${caseName} Task execution failed： v === "hello"`);
    throw new Error("Test failed: v === \"hello\"");
  }

  v = true;
  if (!(v === true)) {
    console.info(`${caseName} Task execution failed： v === true`);
    throw new Error("Test failed: v === true");
  }

  let d: Direction = "left";
  if (!(d === "left")) {
    console.info(`${caseName} Task execution failed： d === "left"`);
    throw new Error("Test failed: d === \"left\"");
  }
}

export function PrimitiveTypesTest029(): void {
  let caseName: string = "PrimitiveTypesTest029";
  // 1. 核心逻辑
  let add: BinaryOp = (x, y) => x + y;
  if (!(add(1, 2) === 3)) {
    console.info(`${caseName} Task execution failed： add(1, 2) === 3`);
    throw new Error("Test failed: add(1, 2) === 3");
  }

  let optionalFunc: OptionalFunc = () => {};
  if (!(typeof optionalFunc === "function")) {
    console.info(`${caseName} Task execution failed： typeof optionalFunc === "function"`);
    throw new Error("Test failed: typeof optionalFunc === \"function\"");
  }
}

export function PrimitiveTypesTest031(): void {
  let caseName: string = "PrimitiveTypesTest031";
  // 1. 核心逻辑
  let readonlyTuple: readonly [number, string] = [1, "a"];
  if (!(readonlyTuple[0] === 1)) {
    console.info(`${caseName} Task execution failed： readonlyTuple[0] === 1`);
    throw new Error("Test failed: readonlyTuple[0] === 1");
  }
  if (!(readonlyTuple[1] === "a")) {
    console.info(`${caseName} Task execution failed： readonlyTuple[1] === "a"`);
    throw new Error("Test failed: readonlyTuple[1] === \"a\"");
  }
}

export function PrimitiveTypesTest032(): void {
  let caseName: string = "PrimitiveTypesTest032";
  // 1. 核心逻辑
  let c: Color = Color.Green;
  if (!(c.toString() === "1")) {
    console.info(`${caseName} Task execution failed： c.toString() === "1"`);
    throw new Error("Test failed: c.toString() === \"1\"");
  }

  let s: Status = Status.Active;
  if (!(s === Status.Active)) {
    console.info(`${caseName} Task execution failed： s === Status.Active`);
    throw new Error("Test failed: s === Status.Active");
  }
}

export function PrimitiveTypesTest033(): void {
  let caseName: string = "PrimitiveTypesTest033";
  // 1. 核心逻辑
  let a: Animal = new Cat("Whiskers");
  if (a instanceof Cat) {
    if (!(a.meow() === "meow")) {
      console.info(`${caseName} Task execution failed： a.meow() === "meow"`);
      throw new Error("Test failed: a.meow() === \"meow\"");
    }
  }

  a = new Dog("Rex");
  let d: Dog = a as Dog;
  if (!(d.bark() === "bark")) {
    console.info(`${caseName} Task execution failed： d.bark() === "bark"`);
    throw new Error("Test failed: d.bark() === \"bark\"");
  }
}

export function PrimitiveTypesTest034(): void {
  let caseName: string = "PrimitiveTypesTest034";
  // 1. 核心逻辑
  let code: BMW_ModelCode = "325";
  if (!(code === "325")) {
    console.info(`${caseName} Task execution failed： code === "325"`);
    throw new Error("Test failed: code === \"325\"");
  }

  code = "530";
  if (!(code === "530")) {
    console.info(`${caseName} Task execution failed： code === "530"`);
    throw new Error("Test failed: code === \"530\"");
  }
}

export function PrimitiveTypesTest035(): void {
  let caseName: string = "PrimitiveTypesTest035";
  // 1. 核心逻辑
  let num: number;
  if (!(num === 0)) {
    console.info(`${caseName} Task execution failed： num === 0`);
    throw new Error("Test failed: num === 0");
  }

  let byte_default: byte;
  if (!(byte_default === 0)) {
    console.info(`${caseName} Task execution failed： byte_default === 0`);
    throw new Error("Test failed: byte_default === 0");
  }

  let short_default: short;
  if (!(short_default === 0)) {
    console.info(`${caseName} Task execution failed： short_default === 0`);
    throw new Error("Test failed: short_default === 0");
  }

  let int_default: int;
  if (!(int_default === 0)) {
    console.info(`${caseName} Task execution failed： int_default === 0`);
    throw new Error("Test failed: int_default === 0");
  }

  let long_default: long;
  if (!(long_default === 0)) {
    console.info(`${caseName} Task execution failed： long_default === 0`);
    throw new Error("Test failed: long_default === 0");
  }

  let float_default: float;
  if (!(float_default === 0.0)) {
    console.info(`${caseName} Task execution failed： float_default === 0.0`);
    throw new Error("Test failed: float_default === 0.0");
  }

  let double_default: double;
  if (!(double_default === 0.0)) {
    console.info(`${caseName} Task execution failed： double_default === 0.0`);
    throw new Error("Test failed: double_default === 0.0");
  }

  let boolean_default: boolean;
  if (!(boolean_default === false)) {
    console.info(`${caseName} Task execution failed： boolean_default === false`);
    throw new Error("Test failed: boolean_default === false");
  }

  let char_default: char;
  if (!(char_default === c'\u0000')) {
    console.info(`${caseName} Task execution failed： char_default === c'\\u0000'`);
    throw new Error("Test failed: char_default === c'\\u0000'");
  }
}

export function PrimitiveTypesTest036(): void {
  let caseName: string = "PrimitiveTypesTest036";
  // 1. 核心逻辑
  let testObj = new TestClassDefault();
  if (!(testObj.num === 0)) {
    console.info(`${caseName} Task execution failed： testObj.num === 0`);
    throw new Error("Test failed: testObj.num === 0");
  }
  if (!(testObj.bool === false)) {
    console.info(`${caseName} Task execution failed： testObj.bool === false`);
    throw new Error("Test failed: testObj.bool === false");
  }
  if (!(testObj.str === undefined)) {
    console.info(`${caseName} Task execution failed： testObj.str === undefined`);
    throw new Error("Test failed: testObj.str === undefined");
  }
}

export function PrimitiveTypesTest037(): void {
  let caseName: string = "PrimitiveTypesTest037";
  // 1. 核心逻辑
  let bigint_1: bigint = 1n;
  let bigint_2: bigint = 2n;
  let bigint_sum: bigint = bigint_1 + bigint_2;
  if (!(bigint_sum === 3n)) {
    console.info(`${caseName} Task execution failed： bigint_sum === 3n`);
    throw new Error("Test failed: bigint_sum === 3n");
  }

  let bigint_from_byte: bigint = new BigInt(127);
  if (!(bigint_from_byte === 127n)) {
    console.info(`${caseName} Task execution failed： bigint_from_byte === 127n`);
    throw new Error("Test failed: bigint_from_byte === 127n");
  }
}

export function PrimitiveTypesTest038(): void {
  let caseName: string = "PrimitiveTypesTest038";
  // 1. 核心逻辑
  let arr: number[] = [0, 1, 2, 3, 4];
  arr.length = 3;
  if (!(arr.length === 3)) {
    console.info(`${caseName} Task execution failed： arr.length === 3`);
    throw new Error("Test failed: arr.length === 3");
  }
  if (!(arr[0] === 0)) {
    console.info(`${caseName} Task execution failed： arr[0] === 0`);
    throw new Error("Test failed: arr[0] === 0");
  }
  if (!(arr[1] === 1)) {
    console.info(`${caseName} Task execution failed： arr[1] === 1`);
    throw new Error("Test failed: arr[1] === 1");
  }
  if (!(arr[2] === 2)) {
    console.info(`${caseName} Task execution failed： arr[2] === 2`);
    throw new Error("Test failed: arr[2] === 2");
  }
}

export function PrimitiveTypesTest039(): void {
  let caseName: string = "PrimitiveTypesTest039";
  // 1. 核心逻辑
  let t: T = 42;
  if (!(t === 42)) {
    console.info(`${caseName} Task execution failed： t === 42`);
    throw new Error("Test failed: t === 42");
  }

  t = "hello";
  if (!(t === "hello")) {
    console.info(`${caseName} Task execution failed： t === "hello"`);
    throw new Error("Test failed: t === \"hello\"");
  }

  t = true;
  if (!(t === true)) {
    console.info(`${caseName} Task execution failed： t === true`);
    throw new Error("Test failed: t === true");
  }
}

export function PrimitiveTypesTest040(): void {
  let caseName: string = "PrimitiveTypesTest040";
  // 1. 核心逻辑
  let k: Keys = "field";
  if (!(k === "field")) {
    console.info(`${caseName} Task execution failed： k === "field"`);
    throw new Error("Test failed: k === \"field\"");
  }

  k = "method";
  if (!(k === "method")) {
    console.info(`${caseName} Task execution failed： k === "method"`);
    throw new Error("Test failed: k === \"method\"");
  }
}

export function PrimitiveTypesTest041(): void {
  let caseName: string = "PrimitiveTypesTest041";
  // 1. 核心逻辑
  let byte_min: byte = -128;
  let byte_max: byte = 127;
  if (!(byte_min === -128)) {
    console.info(`${caseName} Task execution failed： byte_min === -128`);
    throw new Error("Test failed: byte_min === -128");
  }
  if (!(byte_max === 127)) {
    console.info(`${caseName} Task execution failed： byte_max === 127`);
    throw new Error("Test failed: byte_max === 127");
  }

  let short_min: short = -32768;
  let short_max: short = 32767;
  if (!(short_min === -32768)) {
    console.info(`${caseName} Task execution failed： short_min === -32768`);
    throw new Error("Test failed: short_min === -32768");
  }
  if (!(short_max === 32767)) {
    console.info(`${caseName} Task execution failed： short_max === 32767`);
    throw new Error("Test failed: short_max === 32767");
  }

  let int_min: int = -2147483648;
  let int_max: int = 2147483647;
  if (!(int_min === -2147483648)) {
    console.info(`${caseName} Task execution failed： int_min === -2147483648`);
    throw new Error("Test failed: int_min === -2147483648");
  }
  if (!(int_max === 2147483647)) {
    console.info(`${caseName} Task execution failed： int_max === 2147483647`);
    throw new Error("Test failed: int_max === 2147483647");
  }

  let long_min: long = -9223372036854775808;
  let long_max: long = 9223372036854775807;
  if (!(long_min === -9223372036854775808)) {
    console.info(`${caseName} Task execution failed： long_min === -9223372036854775808`);
    throw new Error("Test failed: long_min === -9223372036854775808");
  }
  if (!(long_max === 9223372036854775807)) {
    console.info(`${caseName} Task execution failed： long_max === 9223372036854775807`);
    throw new Error("Test failed: long_max === 9223372036854775807");
  }
}

export function PrimitiveTypesTest042(): void {
  let caseName: string = "PrimitiveTypesTest042";
  // 1. 核心逻辑
  let nan_value: double = 0.0 / 0.0;
  if (!(isNaN(nan_value))) {
    console.info(`${caseName} Task execution failed： isNaN(nan_value)`);
    throw new Error("Test failed: isNaN(nan_value)");
  }

  let infinity_value: double = 1.0 / 0.0;
  if (!(isFinite(infinity_value) === false)) {
    console.info(`${caseName} Task execution failed： isFinite(infinity_value) === false`);
    throw new Error("Test failed: isFinite(infinity_value) === false");
  }

  let negative_infinity_value: double = -1.0 / 0.0;
  if (!(isFinite(negative_infinity_value) === false)) {
    console.info(`${caseName} Task execution failed： isFinite(negative_infinity_value) === false`);
    throw new Error("Test failed: isFinite(negative_infinity_value) === false");
  }
}

export function PrimitiveTypesTest043(): void {
  let caseName: string = "PrimitiveTypesTest043";
  // 1. 核心逻辑
  let a: boolean = true;
  let b: boolean = false;

  if (!(a && b === false)) {
    console.info(`${caseName} Task execution failed： a && b === false`);
    throw new Error("Test failed: a && b === false");
  }
  if (!(a || b === true)) {
    console.info(`${caseName} Task execution failed： a || b === true`);
    throw new Error("Test failed: a || b === true");
  }
  if (!(!a === false)) {
    console.info(`${caseName} Task execution failed： !a === false`);
    throw new Error("Test failed: !a === false");
  }
  if (!(!b === true)) {
    console.info(`${caseName} Task execution failed： !b === true`);
    throw new Error("Test failed: !b === true");
  }
  if (!(a && true === true)) {
    console.info(`${caseName} Task execution failed： a && true === true`);
    throw new Error("Test failed: a && true === true");
  }
  if (!(b || true === true)) {
    console.info(`${caseName} Task execution failed： b || true === true`);
    throw new Error("Test failed: b || true === true");
  }
}

export function PrimitiveTypesTest044(): void {
  let caseName: string = "PrimitiveTypesTest044";
  // 1. 核心逻辑
  let arr: number[] = [1, 2, 3];
  arr.push(4);
  if (!(arr.length === 4)) {
    console.info(`${caseName} Task execution failed： arr.length === 4`);
    throw new Error("Test failed: arr.length === 4");
  }
  if (!(arr[3] === 4)) {
    console.info(`${caseName} Task execution failed： arr[3] === 4`);
    throw new Error("Test failed: arr[3] === 4");
  }

  let popped = arr.pop();
  if (!(popped === 4)) {
    console.info(`${caseName} Task execution failed： popped === 4`);
    throw new Error("Test failed: popped === 4");
  }
  if (!(arr.length === 3)) {
    console.info(`${caseName} Task execution failed： arr.length === 3`);
    throw new Error("Test failed: arr.length === 3");
  }
}

export function PrimitiveTypesTest045(): void {
  let caseName: string = "PrimitiveTypesTest045";
  // 1. 核心逻辑
  let tuple: [number, string, boolean] = [1, "hello", true];
  if (!(tuple[0] === 1)) {
    console.info(`${caseName} Task execution failed： tuple[0] === 1`);
    throw new Error("Test failed: tuple[0] === 1");
  }
  if (!(tuple[1] === "hello")) {
    console.info(`${caseName} Task execution failed： tuple[1] === "hello"`);
    throw new Error("Test failed: tuple[1] === \"hello\"");
  }
  if (!(tuple[2] === true)) {
    console.info(`${caseName} Task execution failed： tuple[2] === true`);
    throw new Error("Test failed: tuple[2] === true");
  }

  let nestedTuple: [number, [string, boolean]] = [1, ["a", true]];
  if (!(nestedTuple[0] === 1)) {
    console.info(`${caseName} Task execution failed： nestedTuple[0] === 1`);
    throw new Error("Test failed: nestedTuple[0] === 1");
  }
  if (!(nestedTuple[1][0] === "a")) {
    console.info(`${caseName} Task execution failed： nestedTuple[1][0] === "a"`);
    throw new Error("Test failed: nestedTuple[1][0] === \"a\"");
  }
  if (!(nestedTuple[1][1] === true)) {
    console.info(`${caseName} Task execution failed： nestedTuple[1][1] === true`);
    throw new Error("Test failed: nestedTuple[1][1] === true");
  }
}

export function PrimitiveTypesTest046(): void {
  let caseName: string = "PrimitiveTypesTest046";
  // 1. 核心逻辑
  let message: string = "";
  let h: Handler = (m: string) => {
    message = m;
  };

  h("test message");
  if (!(message === "test message")) {
    console.info(`${caseName} Task execution failed： message === "test message"`);
    throw new Error("Test failed: message === \"test message\"");
  }
}

export function PrimitiveTypesTest047(): void {
  let caseName: string = "PrimitiveTypesTest047";
  // 1. 核心逻辑
  let animal: Animal = new Cat("Whiskers");
  if (!(animal.name === "Whiskers")) {
    console.info(`${caseName} Task execution failed： animal.name === "Whiskers"`);
    throw new Error("Test failed: animal.name === \"Whiskers\"");
  }
  animal = new Dog("Rex");
  if (!(animal.name === "Rex")) {
    console.info(`${caseName} Task execution failed： animal.name === "Rex"`);
    throw new Error("Test failed: animal.name === \"Rex\"");
  }
}

export function PrimitiveTypesTest048(): void {
  let caseName: string = "PrimitiveTypesTest048";
  // 1. 核心逻辑
  let num: number = 123;
  let str: string = num.toString();
  if (!(str === "123")) {
    console.info(`${caseName} Task execution failed： str === "123"`);
    throw new Error("Test failed: str === \"123\"");
  }

  let parsedNum: number = parseInt("456");
  if (!(parsedNum === 456)) {
    console.info(`${caseName} Task execution failed： parsedNum === 456`);
    throw new Error("Test failed: parsedNum === 456");
  }

  let floatToInt: int = Math.floor(3.7).toInt();
  if (!(floatToInt === 3)) {
    console.info(`${caseName} Task execution failed： floatToInt === 3`);
    throw new Error("Test failed: floatToInt === 3");
  }
}

export function PrimitiveTypesTest049(): void {
  let caseName: string = "PrimitiveTypesTest049";
  // 1. 核心逻辑
  let str: string = "Hello, World!";
  if (!(str.length === 13)) {
    console.info(`${caseName} Task execution failed： str.length === 13`);
    throw new Error("Test failed: str.length === 13");
  }
  if (!(str.charAt(0) === c'H')) {
    console.info(`${caseName} Task execution failed： str.charAt(0) === c'H'`);
    throw new Error("Test failed: str.charAt(0) === c'H'");
  }
  if (!(str.substring(0, 5) === "Hello")) {
    console.info(`${caseName} Task execution failed： str.substring(0, 5) === "Hello"`);
    throw new Error("Test failed: str.substring(0, 5) === \"Hello\"");
  }
  if (!(str.includes("World") === true)) {
    console.info(`${caseName} Task execution failed： str.includes("World") === true`);
    throw new Error("Test failed: str.includes(\"World\") === true");
  }
  if (!(str.split(", ")[0] === "Hello")) {
    console.info(`${caseName} Task execution failed： str.split(", ")[0] === "Hello"`);
    throw new Error("Test failed: str.split(\", \")[0] === \"Hello\"");
  }
  if (!(str.split(", ")[1] === "World!")) {
    console.info(`${caseName} Task execution failed： str.split(", ")[1] === "World!"`);
    throw new Error("Test failed: str.split(\", \")[1] === \"World!\"");
  }
}

export function PrimitiveTypesTest050(): void {
  let caseName: string = "PrimitiveTypesTest050";
  // 1. 核心逻辑
  let arr: number[] = [1, 2, 3];
  let obj: Object = arr;
  if (!(typeof obj === "object")) {
    console.info(`${caseName} Task execution failed： typeof obj === "object"`);
    throw new Error("Test failed: typeof obj === \"object\"");
  }

  let tuple: [number, string] = [1, "a"];
  let tupleObj: Object = tuple;
  if (!(typeof tupleObj === "object")) {
    console.info(`${caseName} Task execution failed： typeof tupleObj === "object"`);
    throw new Error("Test failed: typeof tupleObj === \"object\"");
  }
}

export class A {}
export class B {}

export enum Color {
  Red,
  Green,
  Blue
}

export enum Status {
  Active = "ACTIVE",
  Inactive = "INACTIVE"
}

export class AGeneric<T> {
  f: T
  m(): T { return this.f }
  constructor(f: T) {this.f = f}
}

export function foo_undefined(...args: undefined[] ): undefined {
  return undefined;
}

export class A_literal {
  str: "some str"
  undef: undefined

  constructor() {
    this.str = "some str"
    this.undef = undefined
  }

  constructor(str: "some str", undef: undefined) {
    this.str = str
    this.undef = undef
  }

}

export type U = "some str" | undefined | number;
export type Matrix = int[][]

// Additional types for tests
export type Mixed = number | string | boolean;
export type Direction = "left" | "right" | "up" | "down";
export type BinaryOp = (x: number, y: number) => number;
export type OptionalFunc = (x?: number, y?: string) => void;
export type BMW_ModelCode = "325" | "530" | "735";
export type T = (number | string) | boolean;

export class Cat {
  name: string;
  constructor(name: string) { this.name = name; }
  meow() { return "meow"; }
}

export class Dog {
  name: string;
  constructor(name: string) { this.name = name; }
  bark() { return "bark"; }
}

export type Animal = Cat | Dog;

export class TestClass {
  field: number;
  method() {}
}

export class TestClassDefault {
  num: number;
  bool: boolean;
  str: string | undefined;
}

export type Handler = (msg: string) => void;
export type Keys = keyof TestClass;
