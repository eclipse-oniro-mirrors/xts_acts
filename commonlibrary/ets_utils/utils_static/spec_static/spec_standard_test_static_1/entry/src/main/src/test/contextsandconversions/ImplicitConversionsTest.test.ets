/*---
 * Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';


class A {
  f: number;
  constructor(p: number) { this.f = p; }
}

class A1 {
  f: bigint;
  constructor(p: bigint) { this.f = p; }
}

class A2 {
  f: int
  constructor(p: int) { this.f = p }
}

class A3 {
  f: long
  constructor(p: long) { this.f = p }
}

class A4 {
  f: float
  constructor(p: float) { this.f = p }
}

class A5 {
  f: double
  constructor(p: double) { this.f = p }
}

class A6 { public d: byte = 0 as byte }
class A7 { public d: byte = Byte.MIN_VALUE }
class A8 { public d: byte = Byte.MAX_VALUE }
class A9 { public d: byte = -128 as byte }
class A10 { public d: byte = 127 as byte }
class A11 { public d: short = 0 }
class A12 { public d: short = Short.MIN_VALUE }
class A13 { public d: short = Short.MAX_VALUE }
class A14 { public d: short = -32768 }
class A15 { public d: short = 32767 }
class A16 { public d: int = 0 }
class A17 { public d: int = Int.MIN_VALUE }
class A18 { public d: int = Int.MAX_VALUE }
class A19 { public d: int = -2147483648 }
class A20 { public d: int = 2147483647 }
class A21 { public d: long = 0 }
class A22 { public d: long = Long.MIN_VALUE }
class A23 { public d: long = Long.MAX_VALUE }
class A24 { public d: long = -9223372036854775808 }
class A25 { public d: long = 9223372036854775807 }
class A26 { public d: float = +0.0f }
class A27 { public d: float = -0.0f }
class A28 { public d: float = 3.4028234663852886e38f }
class A29 { public d: float = 1.401298464324817e-45f }
class A30 { public d: float = -3.4028234663852886e38f }
class A31 { public d: float = -1.401298464324817e-45f }
class A32 { public d: double = 0.0 }
class A33 { public d: double = -0.0 }
class A34 { public d: double = 3.4028234663852886e38 }
class A35 { public d: double = 1.401298464324817e-45 }
class A36 { public d: double = -3.4028234663852886e38 }
class A37 { public d: double = -1.401298464324817e-45 }
class A38 { public d: string = '\u0000'; }
class A39 { public d: string = '\u0FFF'; }
class A40 { public d: string = '\uFFFF'; }
class A41 {
  private s: float = Float.NaN
  public d: double = this.s
}
class A42 {
  private s: byte = 0b0 as byte
  public d: short = this.s
}
class A43 {
  private s: byte = Byte.MIN_VALUE
  public d: short = this.s
}
class A44 {
  private s: byte = Byte.MAX_VALUE
  public d: short = this.s
}
class A45 {
  private s: byte = 0b0 as byte
  public d: int = this.s
}
class A46 {
  private s: byte = Byte.MIN_VALUE
  public d: int = this.s
}
class A47 {
  private s: byte = Byte.MAX_VALUE
  public d: int = this.s
}
class A48 {
  private s: short = 0
  public d: number = this.s
}
class A49 {
  private s: short = Short.MIN_VALUE
  public d: number = this.s
}
class A50 {
  private s: short = Short.MAX_VALUE
  public d: number = this.s
}
class A51 {
  private s: int = 0
  public d: long = this.s
}
class A52 {
  private s: int = Int.MIN_VALUE
  public d: long = this.s
}
class A53 {
  private s: int = Int.MAX_VALUE
  public d: long = this.s
}
class A54 {
  private s: int = 0
  public d: float = this.s
}
class A55 {
  private s: int = Int.MIN_VALUE
  public d: float = this.s
}
class A56 {
  private s: int = Int.MAX_VALUE
  public d: float = this.s
}
class A57 {
  private s: int = 0
  public d: double = this.s
}
class A58 {
  private s: int = Int.MIN_VALUE
  public d: double = this.s
}
class A59 {
  private s: int = Int.MAX_VALUE
  public d: double = this.s
}
class A60 {
  private s: int = 0
  public d: number = this.s
}
class A61 {
  private s: int = Int.MIN_VALUE
  public d: number = this.s
}
class A62 {
  private s: int = Int.MAX_VALUE
  public d: number = this.s
}
class A63 {
  private s: long = 0
  public d: float = this.s
}
class A64 {
  private s: long = Long.MIN_VALUE
  public d: float = this.s
}
class A65 {
  private s: long = Long.MAX_VALUE
  public d: float = this.s
}
class A66 {
  private s: long = 0
  public d: double = this.s
}
class A67 {
  private s: long = Long.MIN_VALUE
  public d: double = this.s
}
class A68 {
  private s: long = Long.MAX_VALUE
  public d: double = this.s
}
class A69 {
  private s: long = 0
  public d: number = this.s
}
class A70 {
  private s: long = Long.MIN_VALUE
  public d: number = this.s
}
class A71 {
  private s: long = Long.MAX_VALUE
  public d: number = this.s
}
class A72 {
  private s: float = +0.0f
  public d: double = this.s
}
class A73 {
  private s: float = -0.0f
  public d: double = this.s
}
class A74 {
  private s: float = 3.4028234663852886e38f
  public d: double = this.s
}
class A75 {
  private s: float = 1.401298464324817e-45f
  public d: double = this.s
}
class A76 {
  private s: float = -3.4028234663852886e38f
  public d: double = this.s
}
class A77 {
  private s: float = -1.401298464324817e-45f
  public d: double = this.s
}
class A78 {
  private s: Color = Color.Red
  public d: int = this.s
}
class A79 {
  private s: Color = Color.Green
  public d: int = this.s
}
class A80 {
  private s: Color = Color.Blue
  public d: int = this.s
}
class A81 {
  private s: byte = 0b0 as byte
  public d: long = this.s
}
class A82 {
  private s: byte = Byte.MIN_VALUE
  public d: long = this.s
}
class A83 {
  private s: byte = Byte.MAX_VALUE
  public d: long = this.s
}
class A84 {
  private s: Color1 = Color1.Red
  public d: long = this.s
}
class A85 {
  private s: Color1 = Color1.Green
  public d: long = this.s
}
class A86 {
  private s: Color1 = Color1.Blue
  public d: long = this.s
}
class A87 {
  private s: Color2 = Color2.Red
  public d: float = this.s
}
class A88 {
  private s: Color2 = Color2.Green
  public d: float = this.s
}
class A89 {
  private s: Color2 = Color2.Blue
  public d: float = this.s
}
class A90 {
  private s: Color3 = Color3.Red
  public d: double = this.s
}
class A91 {
  private s: Color3 = Color3.Green
  public d: double = this.s
}
class A92 {
  private s: Color3 = Color3.Blue
  public d: double = this.s
}
class A93 {
  private s: Color4 = Color4.Red
  public d: number = this.s
}
class A94 {
  private s: Color4 = Color4.Green
  public d: number = this.s
}
class A95 {
  private s: Color4 = Color4.Blue
  public d: number = this.s
}
class A96 {
  private s: Color5 = Color5.Red
  public d: double = this.s
}
class A97 {
  private s: Color5 = Color5.Green
  public d: double = this.s
}
class A98 {
  private s: Color5 = Color5.Blue
  public d: double = this.s
}
class A99 {
  private s: Color5 = Color5.Red
  public d: number = this.s
}
class A100 {
  private s: Color5 = Color5.Green
  public d: number = this.s
}
class A101 {
  private s: Color5 = Color5.Blue
  public d: number = this.s
}
class A102 {
  private s: byte = 0b0 as byte
  public d: float = this.s
}
class A103 {
  private s: byte = Byte.MIN_VALUE
  public d: float = this.s
}
class A104 {
  private s: byte = Byte.MAX_VALUE
  public d: float = this.s
}
class A105 {
  private s: byte = 0b0 as byte
  public d: double = this.s
}
class A106 {
  private s: byte = Byte.MIN_VALUE
  public d: double = this.s
}
class A107 {
  private s: byte = Byte.MAX_VALUE
  public d: double = this.s
}
class A108 {
  private s: byte = 0b0 as byte
  public d: number = this.s
}
class A109 {
  private s: byte = Byte.MIN_VALUE
  public d: number = this.s
}
class A110 {
  private s: byte = Byte.MAX_VALUE
  public d: number = this.s
}
class A111 {
  private s: short = 0
  public d: int = this.s
}
class A112 {
  private s: short = Short.MIN_VALUE
  public d: int = this.s
}
class A113 {
  private s: short = Short.MAX_VALUE
  public d: int = this.s
}
class A114 {
  private s: short = 0
  public d: long = this.s
}
class A115 {
  private s: short = Short.MIN_VALUE
  public d: long = this.s
}
class A116 {
  private s: short = Short.MAX_VALUE
  public d: long = this.s
}
class A117 {
  private s: short = 0
  public d: float = this.s
}
class A118 {
  private s: short = Short.MIN_VALUE
  public d: float = this.s
}
class A119 {
  private s: short = Short.MAX_VALUE
  public d: float = this.s
}
class A120 {
  private s: short = 0
  public d: double = this.s
}
class A121 {
  private s: short = Short.MIN_VALUE
  public d: double = this.s
}
class A122 {
  private s: short = Short.MAX_VALUE
  public d: double = this.s
}
class A123 {
  private static s: float = Float.NaN
  public static d: double = A123.s
}
class A124 {
  private static s: byte = 0b0 as byte
  public static d: short = A124.s
}
class A125 {
  private static s: byte = Byte.MIN_VALUE
  public static d: short = A125.s
}
class A126 {
  private static s: byte = Byte.MAX_VALUE
  public static d: short = A126.s
}
class A127 {
  private static s: byte = 0b0 as byte
  public static d: int = A127.s
}
class A128 {
  private static s: byte = Byte.MIN_VALUE
  public static d: int = A128.s
}
class A129 {
  private static s: byte = Byte.MAX_VALUE
  public static d: int = A129.s
}
class A130 {
  private static s: short = 0
  public static d: number = A130.s
}
class A131 {
  private static s: short = Short.MIN_VALUE
  public static d: number = A131.s
}
class A132 {
  private static s: short = Short.MAX_VALUE
  public static d: number = A132.s
}
class A133 {
  private static s: int = 0
  public static d: long = A133.s
}
class A134 {
  private static s: int = Int.MIN_VALUE
  public static d: long = A134.s
}
class A135 {
  private static s: int = Int.MAX_VALUE
  public static d: long = A135.s
}
class A136 {
  private static s: int = 0
  public static d: float = A136.s
}
class A137 {
  private static s: int = Int.MIN_VALUE
  public static d: float = A137.s
}
class A138 {
  private static s: int = Int.MAX_VALUE
  public static d: float = A138.s
}
class A139 {
  private static s: int = 0
  public static d: double = A139.s
}
class A140 {
  private static s: int = Int.MIN_VALUE
  public static d: double = A140.s
}
class A141 {
  private static s: int = Int.MAX_VALUE
  public static d: double = A141.s
}
class A142 {
  private static s: int = 0
  public static d: number = A142.s
}
class A143 {
  private static s: int = Int.MIN_VALUE
  public static d: number = A143.s
}
class A144 {
  private static s: int = Int.MAX_VALUE
  public static d: number = A144.s
}
class A145 {
  private static s: long = 0
  public static d: float = A145.s
}
class A146 {
  private static s: long = Long.MIN_VALUE
  public static d: float = A146.s
}
class A147 {
  private static s: long = Long.MAX_VALUE
  public static d: float = A147.s
}
class A148 {
  private static s: long = 0
  public static d: double = A148.s
}
class A149 {
  private static s: long = Long.MIN_VALUE
  public static d: double = A149.s
}
class A150 {
  private static s: long = Long.MAX_VALUE
  public static d: double = A150.s
}
class A151 {
  private static s: long = 0
  public static d: number = A151.s
}
class A152 {
  private static s: long = Long.MIN_VALUE
  public static d: number = A152.s
}
class A153 {
  private static s: long = Long.MAX_VALUE
  public static d: number = A153.s
}
class A154 {
  private static s: float = +0.0f
  public static d: double = A154.s
}
class A155 {
  private static s: float = -0.0f
  public static d: double = A155.s
}
class A156 {
  private static s: float = 3.4028234663852886e38f
  public static d: double = A156.s
}
class A157 {
  private static s: float = 1.401298464324817e-45f
  public static d: double = A157.s
}
class A158 {
  private static s: float = -3.4028234663852886e38f
  public static d: double = A158.s
}
class A159 {
  private static s: float = -1.401298464324817e-45f
  public static d: double = A159.s
}
class A160 {
  private static s: Color = Color.Red
  public static d: int = A160.s
}
class A161 {
  private static s: Color = Color.Green
  public static d: int = A161.s
}
class A162 {
  private static s: Color = Color.Blue
  public static d: int = A162.s
}
class A163 {
  private static s: byte = 0b0 as byte
  public static d: long = A163.s
}
class A164 {
  private static s: byte = Byte.MIN_VALUE
  public static d: long = A164.s
}
class A165 {
  private static s: byte = Byte.MAX_VALUE
  public static d: long = A165.s
}
class A166 {
  private static s: Color1 = Color1.Red
  public static d: long = A166.s
}
class A167 {
  private static s: Color1 = Color1.Green
  public static d: long = A167.s
}
class A168 {
  private static s: Color1 = Color1.Blue
  public static d: long = A168.s
}
class A169 {
  private static s: Color2 = Color2.Red
  public static d: float = A169.s
}
class A170 {
  private static s: Color2 = Color2.Green
  public static d: float = A170.s
}
class A171 {
  private static s: Color2 = Color2.Blue
  public static d: float = A171.s
}
class A172 {
  private static s: Color3 = Color3.Red
  public static d: double = A172.s
}
class A173 {
  private static s: Color3 = Color3.Green
  public static d: double = A173.s
}
class A174 {
  private static s: Color3 = Color3.Blue
  public static d: double = A174.s
}
class A175 {
  private static s: Color4 = Color4.Red
  public static d: number = A175.s
}
class A176 {
  private static s: Color4 = Color4.Green
  public static d: number = A176.s
}
class A177 {
  private static s: Color4 = Color4.Blue
  public static d: number = A177.s
}
class A178 {
  private static s: Color5 = Color5.Red
  public static d: double = A178.s
}
class A179 {
  private static s: Color5 = Color5.Green
  public static d: double = A179.s
}
class A180 {
  private static s: Color5 = Color5.Blue
  public static d: double = A180.s
}
class A181 {
  private static s: byte = 0b0 as byte
  public static d: float = A181.s
}
class A182 {
  private static s: byte = Byte.MIN_VALUE
  public static d: float = A182.s
}
class A183 {
  private static s: byte = Byte.MAX_VALUE
  public static d: float = A183.s
}
class A184 {
  private static s: byte = 0b0 as byte
  public static d: double = A184.s
}
class A185 {
  private static s: byte = Byte.MIN_VALUE
  public static d: double = A185.s
}
class A186 {
  private static s: byte = Byte.MAX_VALUE
  public static d: double = A186.s
}
class A187 {
  private static s: byte = 0b0 as byte
  public static d: number = A187.s
}
class A188 {
  private static s: byte = Byte.MIN_VALUE
  public static d: number = A188.s
}
class A189 {
  private static s: byte = Byte.MAX_VALUE
  public static d: number = A189.s
}
class A190 {
  private static s: short = 0
  public static d: int = A190.s
}
class A191 {
  private static s: short = Short.MIN_VALUE
  public static d: int = A191.s
}
class A192 {
  private static s: short = Short.MAX_VALUE
  public static d: int = A192.s
}
class A193 {
  private static s: short = 0
  public static d: long = A193.s
}
class A194 {
  private static s: short = Short.MIN_VALUE
  public static d: long = A194.s
}
class A195 {
  private static s: short = Short.MAX_VALUE
  public static d: long = A195.s
}
class A196 {
  private static s: short = 0
  public static d: float = A196.s
}
class A197 {
  private static s: short = Short.MIN_VALUE
  public static d: float = A197.s
}
class A198 {
  private static s: short = Short.MAX_VALUE
  public static d: float = A198.s
}
class A199 {
  private static s: short = 0
  public static d: double = A199.s
}
class A200 {
  private static s: short = Short.MIN_VALUE
  public static d: double = A200.s
}
class A201 {
  private static s: short = Short.MAX_VALUE
  public static d: double = A201.s
}
class A202 {
  meth(p: number): number {
    return p + 2.0;
  }
}
class A203 {
  fld: number;
}
let s: int = 42;
class A204 {
  fld1: int = Color7.Red;
  fld2: number = Color7.Blue + Color7.Green;
  fld3: int = s + Color7.Green - 42;
}
class A205 {
  fld1: int;
  fld2: int;
  fld3: number;
}
class A206 {
  meth(p: number): number {
    return p + 2.0;
  }
}
class A207 {
  fld: int;
  constructor(p: int) {
    this.fld = p;
  }
}
class A208 {
  fld: number;
}
class A209 {
  fld2: number = Color8.Blue + Color8.Green;
  fld3: long = s + Color8.Green - 42;
}
class A210 {
  fld1: long;
  fld2: long;
  fld3: long;
}
class A211 {
  meth(p: number): number {
    return p + 2.0;
  }
}
class A212 {
  fld: number;
  constructor(p: number) {
    this.fld = p;
  }
}
class A213 {
  fld: number;
}
class A214 {
  fld1: string = Color9.Red;
  fld2: string = Color9.Blue + Color9.Green;
  fld3: string = "Z" + Color9.Green + "X";
}
class A215 {
  fld1: string = "";
  fld2: string = "";
  fld3: string = "";
}
class A216 {
  meth(p: string): string {
    return p + "!";
  }
}
class A217 {
  fld: string = "";
  constructor(p: string) {
    this.fld = p;
  }
}
class A218 {
  fld: string = "";
}


function bytesToFloat(bytes: Uint8Array): number {
  if (bytes.length !== 4) {
    throw new Error("Byte array must be exactly 4 bytes long");
  }
  const buffer = new ArrayBuffer(4);
  const dataView = new DataView(buffer);
  for (let i = 0; i < bytes.length; i++) {
    dataView.setUint8(i, bytes[i]);
  }
  return dataView.getFloat32(0, true);
}
function byteToShort(byteValue: number): number {
  byteValue = Math.max(-128, Math.min(127, byteValue));
  return byteValue;
}
enum Status {
  Active = 10,
  Inactive = 20,
  Pending = 30
}
enum Status1 {
  Active = 3_000_001,
  Inactive = 3_000_002,
  Pending = 3_000_003
}
enum Status2: long {
  Active = 3_000_000_001,
  Inactive = 3_000_000_002,
  Pending = 3_000_000_003
}
enum Color {
  Red,
  Green,
  Blue
}

function isInt(value: number): boolean {
  return value >= -2147483648 && value <= 2147483647;
}
function isLong(value: bigint): boolean {
  return value >= BigInt("-9223372036854775808") && value <= BigInt("9223372036854775807");
}
function intToLong(intValue: number): bigint {
  if (!isInt(intValue)) {
    throw new Error("no int type");
  }
  return BigInt(intValue);
}
function longToDouble(longValue: bigint): number {
  if (!isLong(longValue)) {
    throw new Error("no long type");
  }
  return Number(longValue);
}
function longToFloat(longValue: bigint): number {
  if (!isLong(longValue)) {
    throw new Error("no long type");
  }
  return Number(longValue);
}


enum Color1 { Red=100, Green=200, Blue=300 }
enum Color2 { Red=10, Green=20, Blue=30 }
enum Color3 { Red=10001, Green=10002, Blue=10003 }
enum Color4 { Red=20001, Green=20002, Blue=20003 }
enum Color5: long { Red=3_000_000_001, Green=3_000_000_002, Blue=3_000_000_003 }
enum Color6: double { Red = 0.0, Green = 100.0, Blue = 101.0 }
enum Color7 { Red, Green = 100, Blue }
enum Color8: long { Red, Green = 0x3434343456565656, Blue }
enum Color9 { Red = "r", Green = "g", Blue = "b" }


function foo(p: number): number { return p; }
function foo1(p: bigint): bigint { return p; }
function foo3(p: byte): byte { return p }
function foo4(p: short): short { return p }
function foo5(p: int): int { return p }
function foo6(p: long): long { return p }
function foo7(p: float): float { return p }
function foo8(p: double): double { return p }
function foo9(p: int): number {
  return p + 1;
}
function foo10(p: number): number {
  return p + 1;
}
function foo11(p: string): string {
  return p + "!";
}



interface J1 { fld: double }
interface J2 { fld: double }
interface J3 { fld: double }
interface J4 { fld: number }
interface J5 { fld: number }
interface J6 { fld: number }
interface J7 { fld: float }
interface J8 { fld: float }
interface J9 { fld: float }
interface J10 { fld: char }
interface J11 { fld: char }
interface J12 { fld: char }
interface J13 { fld: int }
interface J14 { fld: int }
interface J15 { fld: int }
interface J16 { fld: long }
interface J17 { fld: long }
interface J18 { fld: long }

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function ImplicitConversionsTest() {

  describe("ImplicitConversionsTest", () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await sleep(30);
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_0100
     * @tc.name      testImplicitConversions0001
     * @tc.desc      Casting conversions byte to double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteArray: number[] = [0x40, 0x09, 0x21, 0xFB, 0x54, 0x44, 0x2D, 0x18];
      let buffer: ArrayBuffer = new ArrayBuffer(8);
      let dataView: DataView = new DataView(buffer);
      for (let i = 0; i < byteArray.length; i++) {
        dataView.setUint8(i, byteArray[i]);
      }
      let doubleValue: number = dataView.getFloat64(0, true);
      let expectedValue: number = 3.14159;
      expect(Math.abs(doubleValue - expectedValue) < 0.00001).assertEqual(false);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_0200
     * @tc.name      testImplicitConversions0002
     * @tc.desc      Casting conversions byte to float (Test Case 1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bytes1 = new Uint8Array([0x40, 0x49, 0x0F, 0xDB]);
      const result1 = bytesToFloat(bytes1);
      expect(result1).assertEqual(-40331460896358400);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_0300
     * @tc.name      testImplicitConversions0003
     * @tc.desc      Casting conversions byte to float (Test Case 2)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bytes2 = new Uint8Array([0x3F, 0x80, 0x00, 0x00]);
      const result2 = bytesToFloat(bytes2);
      expect(result2).assertEqual(4.600602988224807e-41);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_0400
     * @tc.name      testImplicitConversions0004
     * @tc.desc      Casting conversions byte to float (Test Case 3)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bytes3 = new Uint8Array([0xBF, 0x80, 0x00, 0x00]);
      const result3 = bytesToFloat(bytes3);
      expect(result3).assertEqual(4.618539608568165e-41);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_0500
     * @tc.name      testImplicitConversions0005
     * @tc.desc      Casting conversions byte to float (Test Case 4)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bytes4 = new Uint8Array([0x00, 0x00, 0x00, 0x00]);
      const result4 = bytesToFloat(bytes4);
      expect(result4).assertEqual(0.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_0600
     * @tc.name      testImplicitConversions0006
     * @tc.desc      Casting conversions byte to int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteArray: Uint8Array = new Uint8Array([0x12, 0x34, 0x56, 0x78]);
      let dataView = new DataView(byteArray.buffer);
      let intValue = dataView.getInt32(0, false);
      expect(intValue).assertEqual(0x12345678);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_0700
     * @tc.name      testImplicitConversions0007
     * @tc.desc      Casting conversions byte to short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(byteToShort(10)).assertEqual(10);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_0800
     * @tc.name      testImplicitConversions0008
     * @tc.desc      Casting conversions enum to double (Status: 10/20/30)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let activeDoubleValue: number = Status.Active;
      let inactiveDoubleValue: number = Status.Inactive;
      let pendingDoubleValue: number = Status.Pending;
      let expectedActiveValue: number = 10.0;
      let expectedInactiveValue: number = 20.0;
      let expectedPendingValue: number = 30.0;
      expect(activeDoubleValue).assertEqual(expectedActiveValue);
      expect(inactiveDoubleValue).assertEqual(expectedInactiveValue);
      expect(pendingDoubleValue).assertEqual(expectedPendingValue);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_0900
     * @tc.name      testImplicitConversions0009
     * @tc.desc      Casting conversions enum to float (Status: 3000001/3000002/3000003)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let activeFloatValue: number = Status1.Active;
      let inactiveFloatValue: number = Status1.Inactive;
      let pendingFloatValue: number = Status1.Pending;
      let expectedActiveValue: number = 3000001.0;
      let expectedInactiveValue: number = 3000002.0;
      let expectedPendingValue: number = 3000003.0;
      expect(activeFloatValue).assertEqual(expectedActiveValue);
      expect(inactiveFloatValue).assertEqual(expectedInactiveValue);
      expect(pendingFloatValue).assertEqual(expectedPendingValue);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_1000
     * @tc.name      testImplicitConversions0010
     * @tc.desc      Casting conversions enum to double (Status: 3000000001/3000000002/3000000003)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let activeDoubleValue: number = Status2.Active;
      let inactiveDoubleValue: number = Status2.Inactive;
      let pendingDoubleValue: number = Status2.Pending;
      let expectedActiveValue: number = 3000000001.0;
      let expectedInactiveValue: number = 3000000002.0;
      let expectedPendingValue: number = 3000000003.0;
      expect(activeDoubleValue).assertEqual(expectedActiveValue);
      expect(inactiveDoubleValue).assertEqual(expectedInactiveValue);
      expect(pendingDoubleValue).assertEqual(expectedPendingValue);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_1100
     * @tc.name      testImplicitConversions0011
     * @tc.desc      Casting conversions enum to float (Status: 10/20/30)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let activeFloatValue: number = Status.Active;
      let inactiveFloatValue: number = Status.Inactive;
      let pendingFloatValue: number = Status.Pending;
      let expectedActiveValue: number = 10.0;
      let expectedInactiveValue: number = 20.0;
      let expectedPendingValue: number = 30.0;
      expect(activeFloatValue).assertEqual(expectedActiveValue);
      expect(inactiveFloatValue).assertEqual(expectedInactiveValue);
      expect(pendingFloatValue).assertEqual(expectedPendingValue);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_1200
     * @tc.name      testImplicitConversions0012
     * @tc.desc      Casting conversions enum to int (Color: Red/Green/Blue)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let redIntValue: number = Color.Red;
      let greenIntValue: number = Color.Green;
      let blueIntValue: number = Color.Blue;
      let expectedRedValue: number = 0;
      let expectedGreenValue: number = 1;
      let expectedBlueValue: number = 2;
      expect(redIntValue).assertEqual(expectedRedValue);
      expect(greenIntValue).assertEqual(expectedGreenValue);
      expect(blueIntValue).assertEqual(expectedBlueValue);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_1300
     * @tc.name      testImplicitConversions0013
     * @tc.desc      Casting conversions enum to long (Color: Red/Green/Blue)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let redLongValue: bigint = BigInt(Color.Red);
      let greenLongValue: bigint = BigInt(Color.Green);
      let blueLongValue: bigint = BigInt(Color.Blue);
      let expectedRedValue: bigint = 0n;
      let expectedGreenValue: bigint = 1n;
      let expectedBlueValue: bigint = 2n;
      expect(redLongValue).assertEqual(expectedRedValue);
      expect(greenLongValue).assertEqual(expectedGreenValue);
      expect(blueLongValue).assertEqual(expectedBlueValue);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_1400
     * @tc.name      testImplicitConversions0014
     * @tc.desc      Casting conversions int to long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intValue: number = 2147483647;
      let longValue: bigint = intToLong(intValue);
      expect(isLong(longValue)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_1500
     * @tc.name      testImplicitConversions0015
     * @tc.desc      Casting conversions long to double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longValue: bigint = BigInt("9223372036854775807");
      let doubleValue: number = longToDouble(longValue);
      expect(typeof doubleValue).assertEqual("number");
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_1600
     * @tc.name      testImplicitConversions0016
     * @tc.desc      Casting conversions long to float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longValue: bigint = BigInt("9223372036854775807");
      let floatValue: number = longToFloat(longValue);
      expect(typeof floatValue).assertEqual("number");
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_1700
     * @tc.name      testImplicitConversions0017
     * @tc.desc      Casting conversions boolean to number (true/false)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boolTrue: boolean = true;
      let numTrue: number = boolTrue ? 1 : 0;
      expect(numTrue).assertEqual(1);

      let boolFalse: boolean = false;
      let numFalse: number = boolFalse ? 1 : 0;
      expect(numFalse).assertEqual(0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_1800
     * @tc.name      testImplicitConversions0018
     * @tc.desc      Assignment context, variable, widening primitive conversion, implicit (from Color to int)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: number;
      let s1: Color = Color.Red;
      d = s1;
      expect(d).assertEqual(0);
      let s2: Color = Color.Green;
      d = s2;
      expect(d).assertEqual(1);
      let s3: Color = Color.Blue;
      d = s3;
      expect(d).assertEqual(2);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_1900
     * @tc.name      testImplicitConversions0019
     * @tc.desc      Assignment context, variable, widening primitive conversion, implicit (from byte to long)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: bigint;
      let s1: number = 0;
      d = BigInt(s1);
      expect(d).assertEqual(0n);
      let s2: number = -128;
      d = BigInt(s2);
      expect(d).assertEqual(-128n);
      let s3: number = 127;
      d = BigInt(s3);
      expect(d).assertEqual(127n);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_2000
     * @tc.name      testImplicitConversions0020
     * @tc.desc      Assignment context, variable, widening primitive conversion, implicit (from Color to long)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: bigint;
      let s1: Color1 = Color1.Red;
      d = BigInt(s1);
      expect(d).assertEqual(100n);
      let s2: Color1 = Color1.Green;
      d = BigInt(s2);
      expect(d).assertEqual(200n);
      let s3: Color1 = Color1.Blue;
      d = BigInt(s3);
      expect(d).assertEqual(300n);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_2100
     * @tc.name      testImplicitConversions0021
     * @tc.desc      Assignment context, variable, widening primitive conversion, implicit (from Color to float)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: number;
      let s1: Color2 = Color2.Red;
      d = s1;
      expect(d).assertEqual(10.0);
      let s2: Color2 = Color2.Green;
      d = s2;
      expect(d).assertEqual(20.0);
      let s3: Color2 = Color2.Blue;
      d = s3;
      expect(d).assertEqual(30.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_2200
     * @tc.name      testImplicitConversions0022
     * @tc.desc      Assignment context, variable, widening primitive conversion, implicit (from Color to double)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: number;
      let s1: Color3 = Color3.Red;
      d = s1;
      expect(d).assertEqual(10001.0);
      let s2: Color3 = Color3.Green;
      d = s2;
      expect(d).assertEqual(10002.0);
      let s3: Color3 = Color3.Blue;
      d = s3;
      expect(d).assertEqual(10003.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_2300
     * @tc.name      testImplicitConversions0023
     * @tc.desc      Assignment context, variable, widening primitive conversion, implicit (from Color to number)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: number;
      let s1: Color4 = Color4.Red;
      d = s1;
      expect(d).assertEqual(20001.0);
      let s2: Color4 = Color4.Green;
      d = s2;
      expect(d).assertEqual(20002.0);
      let s3: Color4 = Color4.Blue;
      d = s3;
      expect(d).assertEqual(20003.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_2400
     * @tc.name      testImplicitConversions0024
     * @tc.desc      Assignment context, variable, widening primitive conversion, implicit (from Color to double)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: number;
      let s1: Color5 = Color5.Red;
      d = s1;
      expect(d).assertEqual(3000000001.0);
      let s2: Color5 = Color5.Green;
      d = s2;
      expect(d).assertEqual(3000000002.0);
      let s3: Color5 = Color5.Blue;
      d = s3;
      expect(d).assertEqual(3000000003.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_2500
     * @tc.name      testImplicitConversions0025
     * @tc.desc      Assignment context, variable, widening primitive conversion, implicit (from byte to float)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: number;
      let s1: number = 0;
      d = s1;
      expect(d).assertEqual(0.0);
      let s2: number = -128;
      d = s2;
      expect(d).assertEqual(-128.0);
      let s3: number = 127;
      d = s3;
      expect(d).assertEqual(127.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_2600
     * @tc.name      testImplicitConversions0026
     * @tc.desc      Assignment context, variable, widening primitive conversion, implicit (from short to long)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: bigint;
      let s1: number = 0;
      d = BigInt(s1);
      expect(d).assertEqual(0n);
      let s2: number = -32768;
      d = BigInt(s2);
      expect(d).assertEqual(-32768n);
      let s3: number = 32767;
      d = BigInt(s3);
      expect(d).assertEqual(32767n);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_2700
     * @tc.name      testImplicitConversions0027
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit (from byte to int)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: number = 0;
      expect(new A(s1).f).assertEqual(0);
      let s2: number = -128;
      expect(new A(s2).f).assertEqual(-128);
      let s3: number = 127;
      expect(new A(s3).f).assertEqual(127);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_2800
     * @tc.name      testImplicitConversions0028
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit (from short to number)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: number = 0;
      expect(new A(s1).f).assertEqual(0.0);
      let s2: number = -32768;
      expect(new A(s2).f).assertEqual(-32768.0);
      let s3: number = 32767;
      expect(new A(s3).f).assertEqual(32767.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_2900
     * @tc.name      testImplicitConversions0029
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit (from int to long)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: number = 0;
      expect(new A1(BigInt(s1)).f).assertEqual(0n);
      let s2: number = -2147483648;
      expect(new A1(BigInt(s2)).f).assertEqual(BigInt("-2147483648"));
      let s3: number = 2147483647;
      expect(new A1(BigInt(s3)).f).assertEqual(BigInt("2147483647"));
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_3000
     * @tc.name      testImplicitConversions0030
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit (from int to double)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: number = 0;
      expect(new A(s1).f).assertEqual(0.0);
      let s2: number = -2147483648;
      expect(new A(s2).f).assertEqual(-2147483648.0);
      let s3: number = 2147483647;
      expect(new A(s3).f).assertEqual(2147483647.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_3100
     * @tc.name      testImplicitConversions0031
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit (from long to float)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: bigint = 0n;
      expect(new A(Number(s1)).f).assertEqual(0.0);
      let s2: bigint = BigInt("-9223372036854775808");
      expect(new A(Number(s2)).f).assertEqual(-9223372036854776000.0);
      let s3: bigint = BigInt("9223372036854775807");
      expect(new A(Number(s3)).f).assertEqual(9223372036854776000.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_3200
     * @tc.name      testImplicitConversions0032
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit (from long to double)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: bigint = 0n;
      expect(new A(Number(s1)).f).assertEqual(0.0);
      let s2: bigint = BigInt("-9223372036854775808");
      expect(new A(Number(s2)).f).assertEqual(-9.223372036854776e+18);
      let s3: bigint = BigInt("9223372036854775807");
      expect(new A(Number(s3)).f).assertEqual(9.223372036854776e+18);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_3300
     * @tc.name      testImplicitConversions0033
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit (from float to double)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: number = +0.0;
      expect(new A(s1).f).assertEqual(0.0);
      let s2: number = -0.0;
      expect(new A(s2).f).assertEqual(-0.0);
      let s3: number = 3.4028234663852886e38;
      expect(new A(s3).f).assertEqual(3.4028234663852886e38);
      let s4: number = 1.401298464324817e-45;
      expect(new A(s4).f).assertEqual(1.401298464324817e-45);
      let s5: number = -3.4028234663852886e38;
      expect(new A(s5).f).assertEqual(-3.4028234663852886e38);
      let s6: number = -1.401298464324817e-45;
      expect(new A(s6).f).assertEqual(-1.401298464324817e-45);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_3400
     * @tc.name      testImplicitConversions0034
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit (from Color to int)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Color = Color.Red;
      expect(new A(s1).f).assertEqual(0);
      let s2: Color = Color.Green;
      expect(new A(s2).f).assertEqual(1);
      let s3: Color = Color.Blue;
      expect(new A(s3).f).assertEqual(2);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_3500
     * @tc.name      testImplicitConversions0035
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit (from byte to long)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: number = 0;
      expect(new A1(BigInt(s1)).f).assertEqual(0n);
      let s2: number = -128;
      expect(new A1(BigInt(s2)).f).assertEqual(-128n);
      let s3: number = 127;
      expect(new A1(BigInt(s3)).f).assertEqual(127n);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_3600
     * @tc.name      testImplicitConversions0036
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit (from Color to long)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Color1 = Color1.Red;
      expect(new A1(BigInt(s1)).f).assertEqual(100n);
      let s2: Color1 = Color1.Green;
      expect(new A1(BigInt(s2)).f).assertEqual(200n);
      let s3: Color1 = Color1.Blue;
      expect(new A1(BigInt(s3)).f).assertEqual(300n);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_3700
     * @tc.name      testImplicitConversions0037
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit (from Color to float)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Color2 = Color2.Red;
      expect(new A(s1).f).assertEqual(10.0);
      let s2: Color2 = Color2.Green;
      expect(new A(s2).f).assertEqual(20.0);
      let s3: Color2 = Color2.Blue;
      expect(new A(s3).f).assertEqual(30.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_3800
     * @tc.name      testImplicitConversions0038
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit (from Color to double)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Color3 = Color3.Red;
      expect(new A(s1).f).assertEqual(10001.0);
      let s2: Color3 = Color3.Green;
      expect(new A(s2).f).assertEqual(10002.0);
      let s3: Color3 = Color3.Blue;
      expect(new A(s3).f).assertEqual(10003.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_3900
     * @tc.name      testImplicitConversions0039
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit (from Color to number)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Color4 = Color4.Red;
      expect(new A(s1).f).assertEqual(20001.0);
      let s2: Color4 = Color4.Green;
      expect(new A(s2).f).assertEqual(20002.0);
      let s3: Color4 = Color4.Blue;
      expect(new A(s3).f).assertEqual(20003.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_4000
     * @tc.name      testImplicitConversions0040
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit (from Color to double)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Color5 = Color5.Red;
      expect(new A(s1).f).assertEqual(3000000001.0);
      let s2: Color5 = Color5.Green;
      expect(new A(s2).f).assertEqual(3000000002.0);
      let s3: Color5 = Color5.Blue;
      expect(new A(s3).f).assertEqual(3000000003.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_4100
     * @tc.name      testImplicitConversions0041
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit (from byte to float)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: number = 0;
      expect(new A(s1).f).assertEqual(0.0);
      let s2: number = -128;
      expect(new A(s2).f).assertEqual(-128.0);
      let s3: number = 127;
      expect(new A(s3).f).assertEqual(127.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_4200
     * @tc.name      testImplicitConversions0042
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit (from byte to double)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: number = 0;
      expect(new A(s1).f).assertEqual(0.0);
      let s2: number = -128;
      expect(new A(s2).f).assertEqual(-128.0);
      let s3: number = 127;
      expect(new A(s3).f).assertEqual(127.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_4300
     * @tc.name      testImplicitConversions0043
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit (from byte to number)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: number = 0;
      expect(new A(s1).f).assertEqual(0.0);
      let s2: number = -128;
      expect(new A(s2).f).assertEqual(-128.0);
      let s3: number = 127;
      expect(new A(s3).f).assertEqual(127.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_4400
     * @tc.name      testImplicitConversions0044
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit (from short to int)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: number = 0;
      expect(new A(s1).f).assertEqual(0);
      let s2: number = -32768;
      expect(new A(s2).f).assertEqual(-32768);
      let s3: number = 32767;
      expect(new A(s3).f).assertEqual(32767);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_4500
     * @tc.name      testImplicitConversions0045
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit (from short to long)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: number = 0;
      expect(new A1(BigInt(s1)).f).assertEqual(0n);
      let s2: number = -32768;
      expect(new A1(BigInt(s2)).f).assertEqual(-32768n);
      let s3: number = 32767;
      expect(new A1(BigInt(s3)).f).assertEqual(32767n);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_4600
     * @tc.name      testImplicitConversions0046
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit (from short to float)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: number = 0;
      expect(new A(s1).f).assertEqual(0.0);
      let s2: number = -32768;
      expect(new A(s2).f).assertEqual(-32768.0);
      let s3: number = 32767;
      expect(new A(s3).f).assertEqual(32767.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_4700
     * @tc.name      testImplicitConversions0047
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit (from short to double)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: number = 0;
      expect(new A(s1).f).assertEqual(0.0);
      let s2: number = -32768;
      expect(new A(s2).f).assertEqual(-32768.0);
      let s3: number = 32767;
      expect(new A(s3).f).assertEqual(32767.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_4800
     * @tc.name      testImplicitConversions0048
     * @tc.desc      Call context, function, widening primitive conversion, implicit (from byte to byte)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => { // 模拟 byte 类型入参和返回值
      expect(foo(0)).assertEqual(0);
      expect(foo(-128)).assertEqual(-128);
      expect(foo(127)).assertEqual(127);
      expect(foo(-128)).assertEqual(-128);
      expect(foo(127)).assertEqual(127);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_4900
     * @tc.name      testImplicitConversions0049
     * @tc.desc      Call context, function, widening primitive conversion, implicit (from short to short)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => { // 模拟 short 类型入参和返回值
      expect(foo(0)).assertEqual(0);
      expect(foo(-32768)).assertEqual(-32768);
      expect(foo(32767)).assertEqual(32767);
      expect(foo(-32768)).assertEqual(-32768);
      expect(foo(32767)).assertEqual(32767);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_5000
     * @tc.name      testImplicitConversions0050
     * @tc.desc      Call context, function, widening primitive conversion, implicit (from int to int)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo(0)).assertEqual(0);
      expect(foo(-2147483648)).assertEqual(-2147483648);
      expect(foo(2147483647)).assertEqual(2147483647);
      expect(foo(-2147483648)).assertEqual(-2147483648);
      expect(foo(2147483647)).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_5100
     * @tc.name      testImplicitConversions0051
     * @tc.desc      Call context, function, widening primitive conversion, implicit (from long to long)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo1(0n)).assertEqual(0n);
      expect(foo1(BigInt("-9223372036854775808"))).assertEqual(BigInt("-9223372036854775808"));
      expect(foo1(BigInt("9223372036854775807"))).assertEqual(BigInt("9223372036854775807"));
      expect(foo1(BigInt("-9223372036854775808"))).assertEqual(BigInt("-9223372036854775808"));
      expect(foo1(BigInt("9223372036854775807"))).assertEqual(BigInt("9223372036854775807"));
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_5200
     * @tc.name      testImplicitConversions0052
     * @tc.desc      Call context, function, widening primitive conversion, implicit (from float to float)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => { // 模拟 float 类型入参和返回值
      expect(foo(+0.0)).assertEqual(+0.0);
      expect(foo(-0.0)).assertEqual(-0.0);
      expect(foo(3.4028234663852886e38)).assertEqual(3.4028234663852886e38);
      expect(foo(1.401298464324817e-45)).assertEqual(1.401298464324817e-45);
      expect(foo(-3.4028234663852886e38)).assertEqual(-3.4028234663852886e38);
      expect(foo(-1.401298464324817e-45)).assertEqual(-1.401298464324817e-45);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_5300
     * @tc.name      testImplicitConversions0053
     * @tc.desc      Call context, function, widening primitive conversion, implicit (from double to double)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => { // 模拟 double 类型入参和返回值
      expect(foo(0.0)).assertEqual(0.0);
      expect(foo(-0.0)).assertEqual(-0.0);
      expect(foo(3.4028234663852886e38)).assertEqual(3.4028234663852886e38);
      expect(foo(1.401298464324817e-45)).assertEqual(1.401298464324817e-45);
      expect(foo(-3.4028234663852886e38)).assertEqual(-3.4028234663852886e38);
      expect(foo(-1.401298464324817e-45)).assertEqual(-1.401298464324817e-45);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_5400
     * @tc.name      testImplicitConversions0054
     * @tc.desc      Call context, function, widening primitive conversion, implicit (from char to char)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => { // 模拟 char 类型（Unicode 编码值）入参和返回值
      expect(foo(0)).assertEqual(0); // c'\u0000'
      expect(foo(4095)).assertEqual(4095); // c'\u0FFF'
      expect(foo(65535)).assertEqual(65535); // c'\uFFFF'
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_5500
     * @tc.name      testImplicitConversions0055
     * @tc.desc      Call context, function, widening primitive conversion, implicit (from float to double)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: number = NaN; // 模拟 Float.NaN
      expect(isNaN(foo(s))).assertEqual(true);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_5600
     * @tc.name      testImplicitConversions0056
     * @tc.desc      Call context, function, widening primitive conversion, implicit (from byte to short)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => { // 目标类型为 short
      let s1: number = 0;
      expect(foo(s1)).assertEqual(0);
      let s2: number = -128;
      expect(foo(s2)).assertEqual(-128);
      let s3: number = 127;
      expect(foo(s3)).assertEqual(127);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_5700
     * @tc.name      testImplicitConversions0057
     * @tc.desc      Call context, function, widening primitive conversion, implicit (from byte to int)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: number = 0;
      expect(foo(s1)).assertEqual(0);
      let s2: number = -128;
      expect(foo(s2)).assertEqual(-128);
      let s3: number = 127;
      expect(foo(s3)).assertEqual(127);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_5800
     * @tc.name      testImplicitConversions0058
     * @tc.desc      Call context, function, widening primitive conversion, implicit (from short to number)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: number = 0;
      expect(foo(s1)).assertEqual(0.0);
      let s2: number = -32768;
      expect(foo(s2)).assertEqual(-32768.0);
      let s3: number = 32767;
      expect(foo(s3)).assertEqual(32767.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_5900
     * @tc.name      testImplicitConversions0059
     * @tc.desc      Call context, function, widening primitive conversion, implicit (from int to long)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: number = 0;
      expect(foo1(BigInt(s1))).assertEqual(0n);
      let s2: number = -2147483648;
      expect(foo1(BigInt(s2))).assertEqual(BigInt("-2147483648"));
      let s3: number = 2147483647;
      expect(foo1(BigInt(s3))).assertEqual(BigInt("2147483647"));
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_6000
     * @tc.name      testImplicitConversions0060
     * @tc.desc      Call context, function, widening primitive conversion, implicit (from int to double)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: number = 0;
      expect(foo(s1)).assertEqual(0.0);
      let s2: number = -2147483648;
      expect(foo(s2)).assertEqual(-2147483648.0);
      let s3: number = 2147483647;
      expect(foo(s3)).assertEqual(2147483647.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_6100
     * @tc.name      testImplicitConversions0061
     * @tc.desc      Call context, function, widening primitive conversion, implicit (from long to double)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: bigint = 0n;
      expect(foo(Number(s1))).assertEqual(0.0);
      let s2: bigint = BigInt("-9223372036854775808");
      expect(foo(Number(s2))).assertEqual(-9.223372036854776e+18);
      let s3: bigint = BigInt("9223372036854775807");
      expect(foo(Number(s3))).assertEqual(9.223372036854776e+18);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_6200
     * @tc.name      testImplicitConversions0062
     * @tc.desc      Call context, function, widening primitive conversion, implicit (from float to double)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: number = +0.0;
      expect(foo(s1)).assertEqual(0.0);
      let s2: number = -0.0;
      expect(foo(s2)).assertEqual(-0.0);
      let s3: number = 3.4028234663852886e38;
      expect(foo(s3)).assertEqual(3.4028234663852886e38);
      let s4: number = 1.401298464324817e-45;
      expect(foo(s4)).assertEqual(1.401298464324817e-45);
      let s5: number = -3.4028234663852886e38;
      expect(foo(s5)).assertEqual(-3.4028234663852886e38);
      let s6: number = -1.401298464324817e-45;
      expect(foo(s6)).assertEqual(-1.401298464324817e-45);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_6300
     * @tc.name      testImplicitConversions0063
     * @tc.desc      Call context, function, widening primitive conversion, implicit (from Color to int)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Color = Color.Red;
      expect(foo(s1)).assertEqual(0);
      let s2: Color = Color.Green;
      expect(foo(s2)).assertEqual(1);
      let s3: Color = Color.Blue;
      expect(foo(s3)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_6400
     * @tc.name      testImplicitConversions0064
     * @tc.desc      Call context, function, widening primitive conversion, implicit (from byte to long)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: number = 0;
      expect(foo1(BigInt(s1))).assertEqual(0n);
      let s2: number = -128;
      expect(foo1(BigInt(s2))).assertEqual(-128n);
      let s3: number = 127;
      expect(foo1(BigInt(s3))).assertEqual(127n);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_6500
     * @tc.name      testImplicitConversions0065
     * @tc.desc      Call context, function, widening primitive conversion, implicit (from Color to long)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Color1 = Color1.Red;
      expect(foo1(BigInt(s1))).assertEqual(100n);
      let s2: Color1 = Color1.Green;
      expect(foo1(BigInt(s2))).assertEqual(200n);
      let s3: Color1 = Color1.Blue;
      expect(foo1(BigInt(s3))).assertEqual(300n);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_6600
     * @tc.name      testImplicitConversions0066
     * @tc.desc      Call context, function, widening primitive conversion, implicit (from Color to float)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Color2 = Color2.Red;
      expect(foo(s1)).assertEqual(10.0);
      let s2: Color2 = Color2.Green;
      expect(foo(s2)).assertEqual(20.0);
      let s3: Color2 = Color2.Blue;
      expect(foo(s3)).assertEqual(30.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_6700
     * @tc.name      testImplicitConversions0067
     * @tc.desc      Call context, function, widening primitive conversion, implicit (from Color to double)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Color3 = Color3.Red;
      expect(foo(s1)).assertEqual(10001.0);
      let s2: Color3 = Color3.Green;
      expect(foo(s2)).assertEqual(10002.0);
      let s3: Color3 = Color3.Blue;
      expect(foo(s3)).assertEqual(10003.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_6800
     * @tc.name      testImplicitConversions0068
     * @tc.desc      Call context, function, widening primitive conversion, implicit (from Color to number)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Color4 = Color4.Red;
      expect(foo(s1)).assertEqual(20001.0);
      let s2: Color4 = Color4.Green;
      expect(foo(s2)).assertEqual(20002.0);
      let s3: Color4 = Color4.Blue;
      expect(foo(s3)).assertEqual(20003.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_6900
     * @tc.name      testImplicitConversions0069
     * @tc.desc      Call context, function, widening primitive conversion, implicit (from Color to double)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Color5 = Color5.Red;
      expect(foo(s1)).assertEqual(3000000001.0);
      let s2: Color5 = Color5.Green;
      expect(foo(s2)).assertEqual(3000000002.0);
      let s3: Color5 = Color5.Blue;
      expect(foo(s3)).assertEqual(3000000003.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_7000
     * @tc.name      testImplicitConversions0070
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: byte = 0b0 as byte;
      expect(new A2(s1).f).assertEqual(0);
      let s2: byte = Byte.MIN_VALUE;
      expect(new A2(s2).f).assertEqual(-128);
      let s3: byte = Byte.MAX_VALUE;
      expect(new A2(s3).f).assertEqual(127);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_7100
     * @tc.name      testImplicitConversions0071
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: short = 0;
      expect(new A(s1).f).assertEqual(0.0);
      let s2: short = Short.MIN_VALUE;
      expect(new A(s2).f).assertEqual(-32768.0);
      let s3: short = Short.MAX_VALUE;
      expect(new A(s3).f).assertEqual(32767.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_7200
     * @tc.name      testImplicitConversions0072
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: int = 0;
      expect(new A3(s1).f).assertEqual(0);
      let s2: int = Int.MIN_VALUE;
      expect(new A3(s2).f).assertEqual(-2147483648);
      let s3: int = Int.MAX_VALUE;
      expect(new A3(s3).f).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_7300
     * @tc.name      testImplicitConversions0073
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: byte = 0b0 as byte;
      expect(new A2(s1).f).assertEqual(0);
      let s2: byte = Byte.MIN_VALUE;
      expect(new A2(s2).f).assertEqual(-128);
      let s3: byte = Byte.MAX_VALUE;
      expect(new A2(s3).f).assertEqual(127);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_7400
     * @tc.name      testImplicitConversions0074
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: short = 0;
      expect(new A(s1).f).assertEqual(0.0);
      let s2: short = Short.MIN_VALUE;
      expect(new A(s2).f).assertEqual(-32768.0);
      let s3: short = Short.MAX_VALUE;
      expect(new A(s3).f).assertEqual(32767.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_7500
     * @tc.name      testImplicitConversions0075
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: int = 0;
      expect(new A3(s1).f).assertEqual(0);
      let s2: int = Int.MIN_VALUE;
      expect(new A3(s2).f).assertEqual(-2147483648);
      let s3: int = Int.MAX_VALUE;
      expect(new A3(s3).f).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_7600
     * @tc.name      testImplicitConversions0076
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: int = 0;
      expect(new A4(s1).f).assertEqual(0.0f);
      let s2: int = Int.MIN_VALUE;
      expect(new A4(s2).f).assertEqual(-2147483600.0f);
      let s3: int = Int.MAX_VALUE;
      expect(new A4(s3).f).assertEqual(2147483600.0f);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_7700
     * @tc.name      testImplicitConversions0077
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: int = 0;
      expect(new A5(s1).f).assertEqual(0.0);
      let s2: int = Int.MIN_VALUE;
      expect(new A5(s2).f).assertEqual(-2147483648.0);
      let s3: int = Int.MAX_VALUE;
      expect(new A5(s3).f).assertEqual(2147483647.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_7800
     * @tc.name      testImplicitConversions0078
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: int = 0;
      expect(new A(s1).f).assertEqual(0.0);
      let s2: int = Int.MIN_VALUE;
      expect(new A(s2).f).assertEqual(-2147483648.0);
      let s3: int = Int.MAX_VALUE;
      expect(new A(s3).f).assertEqual(2147483647.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_7900
     * @tc.name      testImplicitConversions0079
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: long = 0;
      expect(new A4(s1).f).assertEqual(0.0f);
      let s2: long = Long.MIN_VALUE;
      expect(new A4(s2).f).assertEqual(-9223372000000000000.0f);
      let s3: long = Long.MAX_VALUE;
      expect(new A4(s3).f).assertEqual(9223372000000000000.0f);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_8000
     * @tc.name      testImplicitConversions0080
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: long = 0;
      expect(new A5(s1).f).assertEqual(0.0);
      let s2: long = Long.MIN_VALUE;
      expect(new A5(s2).f).assertEqual(-9.223372036854776e+18);
      let s3: long = Long.MAX_VALUE;
      expect(new A5(s3).f).assertEqual(9.223372036854776e+18);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_8100
     * @tc.name      testImplicitConversions0081
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: long = 0;
      expect(new A(s1).f).assertEqual(0.0);
      let s2: long = Long.MIN_VALUE;
      expect(new A(s2).f).assertEqual(-9.223372036854776e+18);
      let s3: long = Long.MAX_VALUE;
      expect(new A(s3).f).assertEqual(9.223372036854776e+18);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_8200
     * @tc.name      testImplicitConversions0082
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: float = +0.0f;
      expect(new A5(s1).f).assertEqual(0.0);
      let s2: float = -0.0f;
      expect(new A5(s2).f).assertEqual(-0.0);
      let s3: float = 3.4028234663852886e38f;
      expect(new A5(s3).f).assertEqual(3.4028234663852886e38);
      let s4: float = 1.401298464324817e-45f;
      expect(new A5(s4).f).assertEqual(1.401298464324817e-45);
      let s5: float = -3.4028234663852886e38f;
      expect(new A5(s5).f).assertEqual(-3.4028234663852886e38);
      let s6: float = -1.401298464324817e-45f;
      expect(new A5(s6).f).assertEqual(-1.401298464324817e-45);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_8300
     * @tc.name      testImplicitConversions0083
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Color = Color.Red;
      expect(new A2(s1).f).assertEqual(0);
      let s2: Color = Color.Green;
      expect(new A2(s2).f).assertEqual(1);
      let s3: Color = Color.Blue;
      expect(new A2(s3).f).assertEqual(2);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_8400
     * @tc.name      testImplicitConversions0084
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: byte = 0b0 as byte;
      expect(new A3(s1).f).assertEqual(0);
      let s2: byte = Byte.MIN_VALUE;
      expect(new A3(s2).f).assertEqual(-128);
      let s3: byte = Byte.MAX_VALUE;
      expect(new A3(s3).f).assertEqual(127);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_8500
     * @tc.name      testImplicitConversions0085
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Color1 = Color1.Red;
      expect(new A3(s1).f).assertEqual(100);
      let s2: Color1 = Color1.Green;
      expect(new A3(s2).f).assertEqual(200);
      let s3: Color1 = Color1.Blue;
      expect(new A3(s3).f).assertEqual(300);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_8600
     * @tc.name      testImplicitConversions0086
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Color2 = Color2.Red;
      expect(new A4(s1).f).assertEqual(10.0f);
      let s2: Color2 = Color2.Green;
      expect(new A4(s2).f).assertEqual(20.0f);
      let s3: Color2 = Color2.Blue;
      expect(new A4(s3).f).assertEqual(30.0f);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_8700
     * @tc.name      testImplicitConversions0087
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Color3 = Color3.Red;
      expect(new A5(s1).f).assertEqual(10001.0);
      let s2: Color3 = Color3.Green;
      expect(new A5(s2).f).assertEqual(10002.0);
      let s3: Color3 = Color3.Blue;
      expect(new A5(s3).f).assertEqual(10003.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_8800
     * @tc.name      testImplicitConversions0088
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Color5 = Color5.Red;
      expect(new A5(s1).f).assertEqual(3000000001.0);
      let s2: Color5 = Color5.Green;
      expect(new A5(s2).f).assertEqual(3000000002.0);
      let s3: Color5 = Color5.Blue;
      expect(new A5(s3).f).assertEqual(3000000003.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_8900
     * @tc.name      testImplicitConversions0089
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: byte = 0b0 as byte;
      expect(new A4(s1).f).assertEqual(0.0f);
      let s2: byte = Byte.MIN_VALUE;
      expect(new A4(s2).f).assertEqual(-128.0f);
      let s3: byte = Byte.MAX_VALUE;
      expect(new A4(s3).f).assertEqual(127.0f);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_9000
     * @tc.name      testImplicitConversions0090
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: byte = 0b0 as byte;
      expect(new A5(s1).f).assertEqual(0.0);
      let s2: byte = Byte.MIN_VALUE;
      expect(new A5(s2).f).assertEqual(-128.0);
      let s3: byte = Byte.MAX_VALUE;
      expect(new A5(s3).f).assertEqual(127.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_9100
     * @tc.name      testImplicitConversions0091
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: byte = 0b0 as byte;
      expect(new A(s1).f).assertEqual(0.0);
      let s2: byte = Byte.MIN_VALUE;
      expect(new A(s2).f).assertEqual(-128.0);
      let s3: byte = Byte.MAX_VALUE;
      expect(new A(s3).f).assertEqual(127.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_9200
     * @tc.name      testImplicitConversions0092
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: short = 0;
      expect(new A2(s1).f).assertEqual(0);
      let s2: short = Short.MIN_VALUE;
      expect(new A2(s2).f).assertEqual(-32768);
      let s3: short = Short.MAX_VALUE;
      expect(new A2(s3).f).assertEqual(32767);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_9300
     * @tc.name      testImplicitConversions0093
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: short = 0;
      expect(new A3(s1).f).assertEqual(0);
      let s2: short = Short.MIN_VALUE;
      expect(new A3(s2).f).assertEqual(-32768);
      let s3: short = Short.MAX_VALUE;
      expect(new A3(s3).f).assertEqual(32767);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_9400
     * @tc.name      testImplicitConversions0094
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: short = 0;
      expect(new A4(s1).f).assertEqual(0.0f);
      let s2: short = Short.MIN_VALUE;
      expect(new A4(s2).f).assertEqual(-32_768.0f);
      let s3: short = Short.MAX_VALUE;
      expect(new A4(s3).f).assertEqual(32_767.0f);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_9500
     * @tc.name      testImplicitConversions0095
     * @tc.desc      Call context, constructor, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: short = 0;
      expect(new A5(s1).f).assertEqual(0.0);
      let s2: short = Short.MIN_VALUE;
      expect(new A5(s2).f).assertEqual(-32768.0);
      let s3: short = Short.MAX_VALUE;
      expect(new A5(s3).f).assertEqual(32767.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_9600
     * @tc.name      testImplicitConversions0096
     * @tc.desc      Call context, function, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo3(0 as byte)).assertEqual(0);
      expect(foo3(Byte.MIN_VALUE)).assertEqual(-128);
      expect(foo3(Byte.MAX_VALUE)).assertEqual(127);
      expect(foo3(-128 as byte)).assertEqual(-128);
      expect(foo3(127 as byte)).assertEqual(127);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_9700
     * @tc.name      testImplicitConversions0097
     * @tc.desc      Call context, function, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo4(0)).assertEqual(0);
      expect(foo4(Short.MIN_VALUE)).assertEqual(-32768);
      expect(foo4(Short.MAX_VALUE)).assertEqual(32767);
      expect(foo4(-32768)).assertEqual(-32768);
      expect(foo4(32767)).assertEqual(32767);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_9800
     * @tc.name      testImplicitConversions0098
     * @tc.desc      Call context, function, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo5(0)).assertEqual(0);
      expect(foo5(Int.MIN_VALUE)).assertEqual(-2147483648);
      expect(foo5(Int.MAX_VALUE)).assertEqual(2147483647);
      expect(foo5(-2147483648)).assertEqual(-2147483648);
      expect(foo5(2147483647)).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_9900
     * @tc.name      testImplicitConversions0099
     * @tc.desc      Call context, function, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo6(0)).assertEqual(0);
      expect(foo6(Long.MIN_VALUE)).assertEqual(-9223372036854775808);
      expect(foo6(Long.MAX_VALUE)).assertEqual(9223372036854775807);
      expect(foo6(-9223372036854775808)).assertEqual(-9223372036854775808);
      expect(foo6(9223372036854775807)).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_10000
     * @tc.name      testImplicitConversions0100
     * @tc.desc      Call context, function, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo7(+0.0f)).assertEqual(+0.0f);
      expect(foo7(-0.0f)).assertEqual(-0.0f);
      expect(foo7(3.4028234663852886e38f)).assertEqual(3.4028234663852886e38f);
      expect(foo7(1.401298464324817e-45f)).assertEqual(1.401298464324817e-45f);
      expect(foo7(-3.4028234663852886e38f)).assertEqual(-3.4028234663852886e38f);
      expect(foo7(-1.401298464324817e-45f)).assertEqual(-1.401298464324817e-45f);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_10100
     * @tc.name      testImplicitConversions0101
     * @tc.desc      Call context, function, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0101", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: short = 0;
      expect(foo7(s1)).assertEqual(0.0f);
      let s2: short = Short.MIN_VALUE;
      expect(foo7(s2)).assertEqual(-32_768.0f);
      let s3: short = Short.MAX_VALUE;
      expect(foo7(s3)).assertEqual(32_767.0f);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_10200
     * @tc.name      testImplicitConversions0102
     * @tc.desc      Call context, function, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0102", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: short = 0;
      expect(foo8(s1)).assertEqual(0.0);
      let s2: short = Short.MIN_VALUE;
      expect(foo8(s2)).assertEqual(-32768.0);
      let s3: short = Short.MAX_VALUE;
      expect(foo8(s3)).assertEqual(32767.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_10300
     * @tc.name      testImplicitConversions0103
     * @tc.desc      Call context, function, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0103", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: short = 0;
      expect(foo(s1)).assertEqual(0.0);
      let s2: short = Short.MIN_VALUE;
      expect(foo(s2)).assertEqual(-32768.0);
      let s3: short = Short.MAX_VALUE;
      expect(foo(s3)).assertEqual(32767.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_10400
     * @tc.name      testImplicitConversions0104
     * @tc.desc      Call context, function, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0104", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: int = 0;
      expect(foo7(s1)).assertEqual(0.0f);
      let s2: int = Int.MIN_VALUE;
      expect(foo7(s2)).assertEqual(-2147483600.0f);
      let s3: int = Int.MAX_VALUE;
      expect(foo7(s3)).assertEqual(2147483600.0f);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_10500
     * @tc.name      testImplicitConversions0105
     * @tc.desc      Call context, function, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0105", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: int = 0;
      expect(foo8(s1)).assertEqual(0.0);
      let s2: int = Int.MIN_VALUE;
      expect(foo8(s2)).assertEqual(-2147483648.0);
      let s3: int = Int.MAX_VALUE;
      expect(foo8(s3)).assertEqual(2147483647.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_10600
     * @tc.name      testImplicitConversions0106
     * @tc.desc      Call context, function, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0106", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: int = 0;
      expect(foo(s1)).assertEqual(0.0);
      let s2: int = Int.MIN_VALUE;
      expect(foo(s2)).assertEqual(-2147483648.0);
      let s3: int = Int.MAX_VALUE;
      expect(foo(s3)).assertEqual(2147483647.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_10700
     * @tc.name      testImplicitConversions0107
     * @tc.desc      Call context, function, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0107", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: long = 0;
      expect(foo7(s1)).assertEqual(0.0f);
      let s2: long = Long.MIN_VALUE;
      expect(foo7(s2)).assertEqual(-9223372000000000000.0f);
      let s3: long = Long.MAX_VALUE;
      expect(foo7(s3)).assertEqual(9223372000000000000.0f);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_10800
     * @tc.name      testImplicitConversions0108
     * @tc.desc      Call context, function, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0108", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: long = 0;
      expect(foo8(s1)).assertEqual(0.0);
      let s2: long = Long.MIN_VALUE;
      expect(foo8(s2)).assertEqual(-9.223372036854776e+18);
      let s3: long = Long.MAX_VALUE;
      expect(foo8(s3)).assertEqual(9.223372036854776e+18);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_10900
     * @tc.name      testImplicitConversions0109
     * @tc.desc      Call context, function, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0109", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: long = 0;
      expect(foo(s1)).assertEqual(0.0);
      let s2: long = Long.MIN_VALUE;
      expect(foo(s2)).assertEqual(-9.223372036854776e+18);
      let s3: long = Long.MAX_VALUE;
      expect(foo(s3)).assertEqual(9.223372036854776e+18);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_11000
     * @tc.name      testImplicitConversions0110
     * @tc.desc      Composite context, interface field, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0110", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Color5 = Color5.Red;
      let s2: Color5 = Color5.Green;
      let s3: Color5 = Color5.Blue;
      let d1: J1 = { fld: s1 };
      expect(d1.fld).assertEqual(3000000001.0);
      let d2: J2 = { fld: s2 };
      expect(d2.fld).assertEqual(3000000002.0);
      let d3: J3 = { fld: s3 };
      expect(d3.fld).assertEqual(3000000003.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_11100
     * @tc.name      testImplicitConversions0111
     * @tc.desc      Composite context, interface field, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0111", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Color5 = Color5.Red;
      let s2: Color5 = Color5.Green;
      let s3: Color5 = Color5.Blue;
      let d1: J4 = { fld: s1 };
      expect(d1.fld).assertEqual(3000000001.0);
      let d2: J5 = { fld: s2 };
      expect(d2.fld).assertEqual(3000000002.0);
      let d3: J6 = { fld: s3 };
      expect(d3.fld).assertEqual(3000000003.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_11200
     * @tc.name      testImplicitConversions0112
     * @tc.desc      Composite context, interface field, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0112", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: byte = 0b0 as byte;
      let s2: byte = Byte.MIN_VALUE;
      let s3: byte = Byte.MAX_VALUE;
      let d1: J7 = { fld: s1 };
      expect(d1.fld).assertEqual(0.0f);
      let d2: J8 = { fld: s2 };
      expect(d2.fld).assertEqual(-128.0f);
      let d3: J9 = { fld: s3 };
      expect(d3.fld).assertEqual(127.0f);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_11300
     * @tc.name      testImplicitConversions0113
     * @tc.desc      Composite context, interface field, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0113", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: byte = 0b0 as byte;
      let s2: byte = Byte.MIN_VALUE;
      let s3: byte = Byte.MAX_VALUE;
      let d1: J1 = { fld: s1 };
      expect(d1.fld).assertEqual(0.0);
      let d2: J2 = { fld: s2 };
      expect(d2.fld).assertEqual(-128.0);
      let d3: J3 = { fld: s3 };
      expect(d3.fld).assertEqual(127.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_11400
     * @tc.name      testImplicitConversions0114
     * @tc.desc      Composite context, interface field, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0114", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: byte = 0b0 as byte;
      let s2: byte = Byte.MIN_VALUE;
      let s3: byte = Byte.MAX_VALUE;
      let d1: J4 = { fld: s1 };
      expect(d1.fld).assertEqual(0.0);
      let d2: J5 = { fld: s2 };
      expect(d2.fld).assertEqual(-128.0);
      let d3: J6 = { fld: s3 };
      expect(d3.fld).assertEqual(127.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_11500
     * @tc.name      testImplicitConversions0115
     * @tc.desc      Composite context, interface field, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0115", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: byte = 0b0 as byte;
      let s2: byte = Byte.MIN_VALUE;
      let s3: byte = Byte.MAX_VALUE;
      let d1: J10 = { fld: Byte.toChar(s1) };
      expect(d1.fld).assertEqual(c'\u0000');
      let d2: J11 = { fld: Byte.toChar(s2) };
      expect(d2.fld).assertEqual(c'\uFF80');
      let d3: J12 = { fld: Byte.toChar(s3) };
      expect(d3.fld).assertEqual(c'\u007F');
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_11600
     * @tc.name      testImplicitConversions0116
     * @tc.desc      Composite context, interface field, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0116", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: short = 0;
      let s2: short = Short.MIN_VALUE;
      let s3: short = Short.MAX_VALUE;
      let d1: J13 = { fld: s1 };
      expect(d1.fld).assertEqual(0);
      let d2: J14 = { fld: s2 };
      expect(d2.fld).assertEqual(-32768);
      let d3: J15 = { fld: s3 };
      expect(d3.fld).assertEqual(32767);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_11700
     * @tc.name      testImplicitConversions0117
     * @tc.desc      Composite context, interface field, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0117", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: short = 0;
      let s2: short = Short.MIN_VALUE;
      let s3: short = Short.MAX_VALUE;
      let d1: J16 = { fld: s1 };
      expect(d1.fld).assertEqual(0);
      let d2: J17 = { fld: s2 };
      expect(d2.fld).assertEqual(-32768);
      let d3: J18 = { fld: s3 };
      expect(d3.fld).assertEqual(32767);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_11800
     * @tc.name      testImplicitConversions0118
     * @tc.desc      Composite context, interface field, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0118", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: short = 0;
      let s2: short = Short.MIN_VALUE;
      let s3: short = Short.MAX_VALUE;
      let d1: J7 = { fld: s1 };
      expect(d1.fld).assertEqual(0.0f);
      let d2: J8 = { fld: s2 };
      expect(d2.fld).assertEqual(-32_768.0f);
      let d3: J9 = { fld: s3 };
      expect(d3.fld).assertEqual(32_767.0f);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_11900
     * @tc.name      testImplicitConversions0119
     * @tc.desc      Composite context, interface field, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0119", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: short = 0;
      let s2: short = Short.MIN_VALUE;
      let s3: short = Short.MAX_VALUE;
      let d1: J1 = { fld: s1 };
      expect(d1.fld).assertEqual(0.0);
      let d2: J2 = { fld: s2 };
      expect(d2.fld).assertEqual(-32768.0);
      let d3: J3 = { fld: s3 };
      expect(d3.fld).assertEqual(32767.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_12000
     * @tc.name      testImplicitConversions0120
     * @tc.desc      Declaration context, constant declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0120", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: byte = 0 as byte;
      expect(d1).assertEqual(0);
      const d2: byte = Byte.MIN_VALUE;
      expect(d2).assertEqual(-128);
      const d3: byte = Byte.MAX_VALUE;
      expect(d3).assertEqual(127);
      const d4: byte = -128 as byte;
      expect(d4).assertEqual(-128);
      const d5: byte = 127 as byte;
      expect(d5).assertEqual(127);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_12100
     * @tc.name      testImplicitConversions0121
     * @tc.desc      Declaration context, constant declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0121", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: short = 0;
      expect(d1).assertEqual(0);
      const d2: short = Short.MIN_VALUE;
      expect(d2).assertEqual(-32768);
      const d3: short = Short.MAX_VALUE;
      expect(d3).assertEqual(32767);
      const d4: short = -32768;
      expect(d4).assertEqual(-32768);
      const d5: short = 32767;
      expect(d5).assertEqual(32767);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_12200
     * @tc.name      testImplicitConversions0122
     * @tc.desc      Declaration context, constant declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0122", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: int = 0;
      expect(d1).assertEqual(0);
      const d2: int = Int.MIN_VALUE;
      expect(d2).assertEqual(-2147483648);
      const d3: int = Int.MAX_VALUE;
      expect(d3).assertEqual(2147483647);
      const d4: int = -2147483648;
      expect(d4).assertEqual(-2147483648);
      const d5: int = 2147483647;
      expect(d5).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_12300
     * @tc.name      testImplicitConversions0123
     * @tc.desc      Declaration context, constant declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0123", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: long = 0;
      expect(d1).assertEqual(0);
      const d2: long = Long.MIN_VALUE;
      expect(d2).assertEqual(-9223372036854775808);
      const d3: long = Long.MAX_VALUE;
      expect(d3).assertEqual(9223372036854775807);
      const d4: long = -9223372036854775808;
      expect(d4).assertEqual(-9223372036854775808);
      const d5: long = 9223372036854775807;
      expect(d5).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_12400
     * @tc.name      testImplicitConversions0124
     * @tc.desc      Declaration context, constant declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0124", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: float = +0.0f;
      expect(d1).assertEqual(+0.0f);
      const d2: float = -0.0f;
      expect(d2).assertEqual(-0.0f);
      const d3: float = 3.4028234663852886e38f;
      expect(d3).assertEqual(3.4028234663852886e38f);
      const d4: float = 1.401298464324817e-45f;
      expect(d4).assertEqual(1.401298464324817e-45f);
      const d5: float = -3.4028234663852886e38f;
      expect(d5).assertEqual(-3.4028234663852886e38f);
      const d6: float = -1.401298464324817e-45f;
      expect(d6).assertEqual(-1.401298464324817e-45f);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_12500
     * @tc.name      testImplicitConversions0125
     * @tc.desc      Declaration context, constant declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0125", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: double = 0.0;
      expect(d1).assertEqual(0.0);
      const d2: double = -0.0;
      expect(d2).assertEqual(-0.0);
      const d3: double = 3.4028234663852886e38;
      expect(d3).assertEqual(3.4028234663852886e38);
      const d4: double = 1.401298464324817e-45;
      expect(d4).assertEqual(1.401298464324817e-45);
      const d5: double = -3.4028234663852886e38;
      expect(d5).assertEqual(-3.4028234663852886e38);
      const d6: double = -1.401298464324817e-45;
      expect(d6).assertEqual(-1.401298464324817e-45);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_12600
     * @tc.name      testImplicitConversions0126
     * @tc.desc      Declaration context, constant declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0126", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: string = '\u0000';
      expect(d1.charCodeAt(0)).assertEqual(0);
      const d2: string = '\u0FFF';
      expect(d2.charCodeAt(0)).assertEqual(4095);
      const d3: string = '\uFFFF';
      expect(d3.charCodeAt(0)).assertEqual(65535);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_12700
     * @tc.name      testImplicitConversions0127
     * @tc.desc      Declaration context, constant declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0127", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: short = 0 as byte;
      expect(d1).assertEqual(0);
      const d2: short = Byte.MIN_VALUE;
      expect(d2).assertEqual(-128);
      const d3: short = Byte.MAX_VALUE;
      expect(d3).assertEqual(127);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_12800
     * @tc.name      testImplicitConversions0128
     * @tc.desc      Declaration context, constant declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0128", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: int = 0 as byte;
      expect(d1).assertEqual(0);
      const d2: int = Byte.MIN_VALUE;
      expect(d2).assertEqual(-128);
      const d3: int = Byte.MAX_VALUE;
      expect(d3).assertEqual(127);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_12900
     * @tc.name      testImplicitConversions0129
     * @tc.desc      Declaration context, constant declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0129", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: long = 0 as byte;
      expect(d1).assertEqual(0);
      const d2: long = Byte.MIN_VALUE;
      expect(d2).assertEqual(-128);
      const d3: long = Byte.MAX_VALUE;
      expect(d3).assertEqual(127);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_13000
     * @tc.name      testImplicitConversions0130
     * @tc.desc      Declaration context, constant declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0130", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: float = 0 as byte;
      expect(d1).assertEqual(0.0f);
      const d2: float = Byte.MIN_VALUE;
      expect(d2).assertEqual(-128.0f);
      const d3: float = Byte.MAX_VALUE;
      expect(d3).assertEqual(127.0f);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_13100
     * @tc.name      testImplicitConversions0131
     * @tc.desc      Declaration context, constant declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0131", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: double = 0 as byte;
      expect(d1).assertEqual(0.0);
      const d2: double = Byte.MIN_VALUE;
      expect(d2).assertEqual(-128.0);
      const d3: double = Byte.MAX_VALUE;
      expect(d3).assertEqual(127.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_13200
     * @tc.name      testImplicitConversions0132
     * @tc.desc      Declaration context, constant declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0132", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: number = 0 as byte;
      expect(d1).assertEqual(0.0);
      const d2: number = Byte.MIN_VALUE;
      expect(d2).assertEqual(-128.0);
      const d3: number = Byte.MAX_VALUE;
      expect(d3).assertEqual(127.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_13300
     * @tc.name      testImplicitConversions0133
     * @tc.desc      Declaration context, constant declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0133", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: int = 0 as short;
      expect(d1).assertEqual(0);
      const d2: int = Short.MIN_VALUE;
      expect(d2).assertEqual(-32768);
      const d3: int = Short.MAX_VALUE;
      expect(d3).assertEqual(32767);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_13400
     * @tc.name      testImplicitConversions0134
     * @tc.desc      Declaration context, constant declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0134", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: long = 0 as short;
      expect(d1).assertEqual(0);
      const d2: long = Short.MIN_VALUE;
      expect(d2).assertEqual(-32768);
      const d3: long = Short.MAX_VALUE;
      expect(d3).assertEqual(32767);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_13500
     * @tc.name      testImplicitConversions0135
     * @tc.desc      Declaration context, constant declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0135", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: float = 0 as short;
      expect(d1).assertEqual(0.0f);
      const d2: float = Short.MIN_VALUE;
      expect(d2).assertEqual(-32_768.0f);
      const d3: float = Short.MAX_VALUE;
      expect(d3).assertEqual(32_767.0f);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_13600
     * @tc.name      testImplicitConversions0136
     * @tc.desc      Declaration context, constant declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0136", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: double = 0 as short;
      expect(d1).assertEqual(0.0);
      const d2: double = Short.MIN_VALUE;
      expect(d2).assertEqual(-32768.0);
      const d3: double = Short.MAX_VALUE;
      expect(d3).assertEqual(32767.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_13700
     * @tc.name      testImplicitConversions0137
     * @tc.desc      Declaration context, constant declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0137", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: number = 0 as short;
      expect(d1).assertEqual(0.0);
      const d2: number = Short.MIN_VALUE;
      expect(d2).assertEqual(-32768.0);
      const d3: number = Short.MAX_VALUE;
      expect(d3).assertEqual(32767.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_13800
     * @tc.name      testImplicitConversions0138
     * @tc.desc      Declaration context, constant declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0138", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: long = 0 as int;
      expect(d1).assertEqual(0);
      const d2: long = Int.MIN_VALUE;
      expect(d2).assertEqual(-2147483648);
      const d3: long = Int.MAX_VALUE;
      expect(d3).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_13900
     * @tc.name      testImplicitConversions0139
     * @tc.desc      Declaration context, constant declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0139", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: float = 0 as int;
      expect(d1).assertEqual(0.0f);
      const d2: float = Int.MIN_VALUE;
      expect(d2).assertEqual(-2147483600.0f);
      const d3: float = Int.MAX_VALUE;
      expect(d3).assertEqual(2147483600.0f);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_14000
     * @tc.name      testImplicitConversions0140
     * @tc.desc      Declaration context, constant declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0140", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: double = 0 as int;
      expect(d1).assertEqual(0.0);
      const d2: double = Int.MIN_VALUE;
      expect(d2).assertEqual(-2147483648.0);
      const d3: double = Int.MAX_VALUE;
      expect(d3).assertEqual(2147483647.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_14100
     * @tc.name      testImplicitConversions0141
     * @tc.desc      Declaration context, constant declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0141", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: number = 0 as int;
      expect(d1).assertEqual(0.0);
      const d2: number = Int.MIN_VALUE;
      expect(d2).assertEqual(-2147483648.0);
      const d3: number = Int.MAX_VALUE;
      expect(d3).assertEqual(2147483647.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_14200
     * @tc.name      testImplicitConversions0142
     * @tc.desc      Declaration context, constant declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0142", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: float = 0 as long;
      expect(d1).assertEqual(0.0f);
      const d2: float = Long.MIN_VALUE;
      expect(d2).assertEqual(-9223372000000000000.0f);
      const d3: float = Long.MAX_VALUE;
      expect(d3).assertEqual(9223372000000000000.0f);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_14300
     * @tc.name      testImplicitConversions0143
     * @tc.desc      Declaration context, constant declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0143", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: double = 0 as long;
      expect(d1).assertEqual(0.0);
      const d2: double = Long.MIN_VALUE;
      expect(d2).assertEqual(-9.223372036854776e+18);
      const d3: double = Long.MAX_VALUE;
      expect(d3).assertEqual(9.223372036854776e+18);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_14400
     * @tc.name      testImplicitConversions0144
     * @tc.desc      Declaration context, constant declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0144", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: number = 0 as long;
      expect(d1).assertEqual(0.0);
      const d2: number = Long.MIN_VALUE;
      expect(d2).assertEqual(-9.223372036854776e+18);
      const d3: number = Long.MAX_VALUE;
      expect(d3).assertEqual(9.223372036854776e+18);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_14500
     * @tc.name      testImplicitConversions0145
     * @tc.desc      Declaration context, constant declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0145", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: double = +0.0f;
      expect(d1).assertEqual(0.0);
      const d2: double = -0.0f;
      expect(d2).assertEqual(-0.0);
      const d3: double = 3.4028234663852886e38f;
      expect(d3).assertEqual(3.4028234663852886e38);
      const d4: double = 1.401298464324817e-45f;
      expect(d4).assertEqual(1.401298464324817e-45);
      const d5: double = -3.4028234663852886e38f;
      expect(d5).assertEqual(-3.4028234663852886e38);
      const d6: double = -1.401298464324817e-45f;
      expect(d6).assertEqual(-1.401298464324817e-45);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_14600
     * @tc.name      testImplicitConversions0146
     * @tc.desc      Declaration context, constant declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0146", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: int = Color.Red;
      expect(d1).assertEqual(0);
      const d2: int = Color.Green;
      expect(d2).assertEqual(1);
      const d3: int = Color.Blue;
      expect(d3).assertEqual(2);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_14700
     * @tc.name      testImplicitConversions0147
     * @tc.desc      Declaration context, constant declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0147", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: long = Color1.Red;
      expect(d1).assertEqual(100);
      const d2: long = Color1.Green;
      expect(d2).assertEqual(200);
      const d3: long = Color1.Blue;
      expect(d3).assertEqual(300);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_14800
     * @tc.name      testImplicitConversions0148
     * @tc.desc      Declaration context, constant declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0148", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: float = Color2.Red;
      expect(d1).assertEqual(10.0f);
      const d2: float = Color2.Green;
      expect(d2).assertEqual(20.0f);
      const d3: float = Color2.Blue;
      expect(d3).assertEqual(30.0f);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_14900
     * @tc.name      testImplicitConversions0149
     * @tc.desc      Declaration context, constant declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0149", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: double = Color3.Red;
      expect(d1).assertEqual(10001.0);
      const d2: double = Color3.Green;
      expect(d2).assertEqual(10002.0);
      const d3: double = Color3.Blue;
      expect(d3).assertEqual(10003.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_15000
     * @tc.name      testImplicitConversions0150
     * @tc.desc      Declaration context, constant declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: number = Color4.Red;
      expect(d1).assertEqual(20001.0);
      const d2: number = Color4.Green;
      expect(d2).assertEqual(20002.0);
      const d3: number = Color4.Blue;
      expect(d3).assertEqual(20003.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_15100
     * @tc.name      testImplicitConversions0151
     * @tc.desc      Declaration context, instance field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0151", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: A6 = new A6();
      expect(a1.d).assertEqual(0);
      let a2: A7 = new A7();
      expect(a2.d).assertEqual(-128);
      let a3: A8 = new A8();
      expect(a3.d).assertEqual(127);
      let a4: A9 = new A9();
      expect(a4.d).assertEqual(-128);
      let a5: A10 = new A10();
      expect(a5.d).assertEqual(127);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_15200
     * @tc.name      testImplicitConversions0152
     * @tc.desc      Declaration context, instance field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0152", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: A11 = new A11();
      expect(a1.d).assertEqual(0);
      let a2: A12 = new A12();
      expect(a2.d).assertEqual(-32768);
      let a3: A13 = new A13();
      expect(a3.d).assertEqual(32767);
      let a4: A14 = new A14();
      expect(a4.d).assertEqual(-32768);
      let a5: A15 = new A15();
      expect(a5.d).assertEqual(32767);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_15300
     * @tc.name      testImplicitConversions0153
     * @tc.desc      Declaration context, instance field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0153", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: A16 = new A16();
      expect(a1.d).assertEqual(0);
      let a2: A17 = new A17();
      expect(a2.d).assertEqual(-2147483648);
      let a3: A18 = new A18();
      expect(a3.d).assertEqual(2147483647);
      let a4: A19 = new A19();
      expect(a4.d).assertEqual(-2147483648);
      let a5: A20 = new A20();
      expect(a5.d).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_15400
     * @tc.name      testImplicitConversions0154
     * @tc.desc      Declaration context, instance field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0154", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: A21 = new A21();
      expect(a1.d).assertEqual(0);
      let a2: A22 = new A22();
      expect(a2.d).assertEqual(-9223372036854775808);
      let a3: A23 = new A23();
      expect(a3.d).assertEqual(9223372036854775807);
      let a4: A24 = new A24();
      expect(a4.d).assertEqual(-9223372036854775808);
      let a5: A25 = new A25();
      expect(a5.d).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_15500
     * @tc.name      testImplicitConversions0155
     * @tc.desc      Declaration context, instance field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0155", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: A26 = new A26();
      expect(a1.d).assertEqual(+0.0f);
      let a2: A27 = new A27();
      expect(a2.d).assertEqual(-0.0f);
      let a3: A28 = new A28();
      expect(a3.d).assertEqual(3.4028234663852886e38f);
      let a4: A29 = new A29();
      expect(a4.d).assertEqual(1.401298464324817e-45f);
      let a5: A30 = new A30();
      expect(a5.d).assertEqual(-3.4028234663852886e38f);
      let a6: A31 = new A31();
      expect(a6.d).assertEqual(-1.401298464324817e-45f);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_15600
     * @tc.name      testImplicitConversions0156
     * @tc.desc      Declaration context, instance field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0156", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: A32 = new A32();
      expect(a1.d).assertEqual(0.0);
      let a2: A33 = new A33();
      expect(a2.d).assertEqual(-0.0);
      let a3: A34 = new A34();
      expect(a3.d).assertEqual(3.4028234663852886e38);
      let a4: A35 = new A35();
      expect(a4.d).assertEqual(1.401298464324817e-45);
      let a5: A36 = new A36();
      expect(a5.d).assertEqual(-3.4028234663852886e38);
      let a6: A37 = new A37();
      expect(a6.d).assertEqual(-1.401298464324817e-45);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_15700
     * @tc.name      testImplicitConversions0157
     * @tc.desc      Declaration context, instance field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0157", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: A38 = new A38();
      expect(a1.d.charCodeAt(0)).assertEqual(0);  // 使用 charCodeAt 获取 Unicode 数值
      let a2: A39 = new A39();
      expect(a2.d.charCodeAt(0)).assertEqual(4095); // Unicode 值 0x0FFF
      let a3: A40 = new A40();
      expect(a3.d.charCodeAt(0)).assertEqual(65535); // Unicode 值 0xFFFF
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_15800
     * @tc.name      testImplicitConversions0158
     * @tc.desc      Declaration context, instance field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0158", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A41 = new A41();
      expect(Double.isNaN(a.d)).assertTrue();
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_15900
     * @tc.name      testImplicitConversions0159
     * @tc.desc      Declaration context, instance field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0159", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: A42 = new A42();
      expect(a1.d).assertEqual(0);
      let a2: A43 = new A43();
      expect(a2.d).assertEqual(-128);
      let a3: A44 = new A44();
      expect(a3.d).assertEqual(127);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_16000
     * @tc.name      testImplicitConversions0160
     * @tc.desc      Declaration context, instance field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0160", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: A45 = new A45();
      expect(a1.d).assertEqual(0);
      let a2: A46 = new A46();
      expect(a2.d).assertEqual(-128);
      let a3: A47 = new A47();
      expect(a3.d).assertEqual(127);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_16100
     * @tc.name      testImplicitConversions0161
     * @tc.desc      Declaration context, instance field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0161", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: A48 = new A48();
      expect(a1.d).assertEqual(0.0);
      let a2: A49 = new A49();
      expect(a2.d).assertEqual(-32768.0);
      let a3: A50 = new A50();
      expect(a3.d).assertEqual(32767.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_16200
     * @tc.name      testImplicitConversions0162
     * @tc.desc      Declaration context, instance field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0162", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: A51 = new A51();
      expect(a1.d).assertEqual(0);
      let a2: A52 = new A52();
      expect(a2.d).assertEqual(-2147483648);
      let a3: A53 = new A53();
      expect(a3.d).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_16300
     * @tc.name      testImplicitConversions0163
     * @tc.desc      Declaration context, instance field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0163", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: A54 = new A54();
      expect(a1.d).assertEqual(0.0f);
      let a2: A55 = new A55();
      expect(a2.d).assertEqual(-2147483600.0f);
      let a3: A56 = new A56();
      expect(a3.d).assertEqual(2147483600.0f);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_16400
     * @tc.name      testImplicitConversions0164
     * @tc.desc      Declaration context, instance field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0164", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: A57 = new A57();
      expect(a1.d).assertEqual(0.0);
      let a2: A58 = new A58();
      expect(a2.d).assertEqual(-2147483648.0);
      let a3: A59 = new A59();
      expect(a3.d).assertEqual(2147483647.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_16500
     * @tc.name      testImplicitConversions0165
     * @tc.desc      Declaration context, instance field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0165", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: A60 = new A60();
      expect(a1.d).assertEqual(0.0);
      let a2: A61 = new A61();
      expect(a2.d).assertEqual(-2147483648.0);
      let a3: A62 = new A62();
      expect(a3.d).assertEqual(2147483647.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_16600
     * @tc.name      testImplicitConversions0166
     * @tc.desc      Declaration context, instance field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0166", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: A63 = new A63();
      expect(a1.d).assertEqual(0.0f);
      let a2: A64 = new A64();
      expect(a2.d).assertEqual(-9223372000000000000.0f);
      let a3: A65 = new A65();
      expect(a3.d).assertEqual(9223372000000000000.0f);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_16700
     * @tc.name      testImplicitConversions0167
     * @tc.desc      Declaration context, instance field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0167", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: A66 = new A66();
      expect(a1.d).assertEqual(0.0);
      let a2: A67 = new A67();
      expect(a2.d).assertEqual(-9.223372036854776e+18);
      let a3: A68 = new A68();
      expect(a3.d).assertEqual(9.223372036854776e+18);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_16800
     * @tc.name      testImplicitConversions0168
     * @tc.desc      Declaration context, instance field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0168", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: A69 = new A69();
      expect(a1.d).assertEqual(0.0);
      let a2: A70 = new A70();
      expect(a2.d).assertEqual(-9.223372036854776e+18);
      let a3: A71 = new A71();
      expect(a3.d).assertEqual(9.223372036854776e+18);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_16900
     * @tc.name      testImplicitConversions0169
     * @tc.desc      Declaration context, instance field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0169", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: A72 = new A72();
      expect(a1.d).assertEqual(0.0);
      let a2: A73 = new A73();
      expect(a2.d).assertEqual(-0.0);
      let a3: A74 = new A74();
      expect(a3.d).assertEqual(3.4028234663852886e38);
      let a4: A75 = new A75();
      expect(a4.d).assertEqual(1.401298464324817e-45);
      let a5: A76 = new A76();
      expect(a5.d).assertEqual(-3.4028234663852886e38);
      let a6: A77 = new A77();
      expect(a6.d).assertEqual(-1.401298464324817e-45);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_17000
     * @tc.name      testImplicitConversions0170
     * @tc.desc      Declaration context, instance field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0170", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: A78 = new A78();
      expect(a1.d).assertEqual(0);
      let a2: A79 = new A79();
      expect(a2.d).assertEqual(1);
      let a3: A80 = new A80();
      expect(a3.d).assertEqual(2);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_17100
     * @tc.name      testImplicitConversions0171
     * @tc.desc      Declaration context, instance field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0171", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: A81 = new A81();
      expect(a1.d).assertEqual(0);
      let a2: A82 = new A82();
      expect(a2.d).assertEqual(-128);
      let a3: A83 = new A83();
      expect(a3.d).assertEqual(127);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_17200
     * @tc.name      testImplicitConversions0172
     * @tc.desc      Declaration context, instance field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0172", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: A84 = new A84();
      expect(a1.d).assertEqual(100);
      let a2: A85 = new A85();
      expect(a2.d).assertEqual(200);
      let a3: A86 = new A86();
      expect(a3.d).assertEqual(300);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_17300
     * @tc.name      testImplicitConversions0173
     * @tc.desc      Declaration context, instance field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0173", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: A87 = new A87();
      expect(a1.d).assertEqual(10.0f);
      let a2: A88 = new A88();
      expect(a2.d).assertEqual(20.0f);
      let a3: A89 = new A89();
      expect(a3.d).assertEqual(30.0f);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_17400
     * @tc.name      testImplicitConversions0174
     * @tc.desc      Declaration context, instance field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0174", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: A90 = new A90();
      expect(a1.d).assertEqual(10001.0);
      let a2: A91 = new A91();
      expect(a2.d).assertEqual(10002.0);
      let a3: A92 = new A92();
      expect(a3.d).assertEqual(10003.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_17500
     * @tc.name      testImplicitConversions0175
     * @tc.desc      Declaration context, instance field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0175", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: A93 = new A93();
      expect(a1.d).assertEqual(20001.0);
      let a2: A94 = new A94();
      expect(a2.d).assertEqual(20002.0);
      let a3: A95 = new A95();
      expect(a3.d).assertEqual(20003.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_17600
     * @tc.name      testImplicitConversions0176
     * @tc.desc      Declaration context, instance field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0176", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: A96 = new A96();
      expect(a1.d).assertEqual(3000000001.0);
      let a2: A97 = new A97();
      expect(a2.d).assertEqual(3000000002.0);
      let a3: A98 = new A98();
      expect(a3.d).assertEqual(3000000003.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_17700
     * @tc.name      testImplicitConversions0177
     * @tc.desc      Declaration context, instance field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0177", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: A99 = new A99();
      expect(a1.d).assertEqual(3000000001.0);
      let a2: A100 = new A100();
      expect(a2.d).assertEqual(3000000002.0);
      let a3: A101 = new A101();
      expect(a3.d).assertEqual(3000000003.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_17800
     * @tc.name      testImplicitConversions0178
     * @tc.desc      Declaration context, instance field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0178", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: A102 = new A102();
      expect(a1.d).assertEqual(0.0f);
      let a2: A103 = new A103();
      expect(a2.d).assertEqual(-128.0f);
      let a3: A104 = new A104();
      expect(a3.d).assertEqual(127.0f);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_17900
     * @tc.name      testImplicitConversions0179
     * @tc.desc      Declaration context, instance field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0179", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: A105 = new A105();
      expect(a1.d).assertEqual(0.0);
      let a2: A106 = new A106();
      expect(a2.d).assertEqual(-128.0);
      let a3: A107 = new A107();
      expect(a3.d).assertEqual(127.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_18000
     * @tc.name      testImplicitConversions0180
     * @tc.desc      Declaration context, instance field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0180", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: A108 = new A108();
      expect(a1.d).assertEqual(0.0);
      let a2: A109 = new A109();
      expect(a2.d).assertEqual(-128.0);
      let a3: A110 = new A110();
      expect(a3.d).assertEqual(127.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_18100
     * @tc.name      testImplicitConversions0181
     * @tc.desc      Declaration context, instance field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0181", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: A111 = new A111();
      expect(a1.d).assertEqual(0);
      let a2: A112 = new A112();
      expect(a2.d).assertEqual(-32768);
      let a3: A113 = new A113();
      expect(a3.d).assertEqual(32767);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_18200
     * @tc.name      testImplicitConversions0182
     * @tc.desc      Declaration context, instance field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0182", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: A114 = new A114();
      expect(a1.d).assertEqual(0);
      let a2: A115 = new A115();
      expect(a2.d).assertEqual(-32768);
      let a3: A116 = new A116();
      expect(a3.d).assertEqual(32767);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_18300
     * @tc.name      testImplicitConversions0183
     * @tc.desc      Declaration context, instance field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0183", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: A117 = new A117();
      expect(a1.d).assertEqual(0.0f);
      let a2: A118 = new A118();
      expect(a2.d).assertEqual(-32_768.0f);
      let a3: A119 = new A119();
      expect(a3.d).assertEqual(32_767.0f);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_18400
     * @tc.name      testImplicitConversions0184
     * @tc.desc      Declaration context, instance field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0184", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: A120 = new A120();
      expect(a1.d).assertEqual(0.0);
      let a2: A121 = new A121();
      expect(a2.d).assertEqual(-32768.0);
      let a3: A122 = new A122();
      expect(a3.d).assertEqual(32767.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_18500
     * @tc.name      testImplicitConversions0185
     * @tc.desc      Declaration context, instance field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0185", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Double.isNaN(A123.d)).assertTrue();
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_18600
     * @tc.name      testImplicitConversions0186
     * @tc.desc      Declaration context, static field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0186", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A124.d).assertEqual(0);
      expect(A125.d).assertEqual(-128);
      expect(A126.d).assertEqual(127);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_18700
     * @tc.name      testImplicitConversions0187
     * @tc.desc      Declaration context, static field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0187", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A127.d).assertEqual(0);
      expect(A128.d).assertEqual(-128);
      expect(A129.d).assertEqual(127);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_18800
     * @tc.name      testImplicitConversions0188
     * @tc.desc      Declaration context, static field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0188", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A130.d).assertEqual(0.0);
      expect(A131.d).assertEqual(-32768.0);
      expect(A132.d).assertEqual(32767.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_18900
     * @tc.name      testImplicitConversions0189
     * @tc.desc      Declaration context, static field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0189", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A133.d).assertEqual(0);
      expect(A134.d).assertEqual(-2147483648);
      expect(A135.d).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_19000
     * @tc.name      testImplicitConversions0190
     * @tc.desc      Declaration context, static field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0190", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A136.d).assertEqual(0.0f);
      expect(A137.d).assertEqual(-2147483600.0f);
      expect(A138.d).assertEqual(2147483600.0f);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_19100
     * @tc.name      testImplicitConversions0191
     * @tc.desc      Declaration context, static field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0191", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A139.d).assertEqual(0.0);
      expect(A140.d).assertEqual(-2147483648.0);
      expect(A141.d).assertEqual(2147483647.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_19200
     * @tc.name      testImplicitConversions0192
     * @tc.desc      Declaration context, static field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0192", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A142.d).assertEqual(0.0);
      expect(A143.d).assertEqual(-2147483648.0);
      expect(A144.d).assertEqual(2147483647.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_19300
     * @tc.name      testImplicitConversions0193
     * @tc.desc      Declaration context, static field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0193", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A145.d).assertEqual(0.0f);
      expect(A146.d).assertEqual(-9223372000000000000.0f);
      expect(A147.d).assertEqual(9223372000000000000.0f);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_19400
     * @tc.name      testImplicitConversions0194
     * @tc.desc      Declaration context, static field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0194", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A148.d).assertEqual(0.0);
      expect(A149.d).assertEqual(-9.223372036854776e+18);
      expect(A150.d).assertEqual(9.223372036854776e+18);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_19500
     * @tc.name      testImplicitConversions0195
     * @tc.desc      Declaration context, static field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0195", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A151.d).assertEqual(0.0);
      expect(A152.d).assertEqual(-9.223372036854776e+18);
      expect(A153.d).assertEqual(9.223372036854776e+18);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_19600
     * @tc.name      testImplicitConversions0196
     * @tc.desc      Declaration context, static field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0196", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A154.d).assertEqual(0.0);
      expect(A155.d).assertEqual(-0.0);
      expect(A156.d).assertEqual(3.4028234663852886e38);
      expect(A157.d).assertEqual(1.401298464324817e-45);
      expect(A158.d).assertEqual(-3.4028234663852886e38);
      expect(A159.d).assertEqual(-1.401298464324817e-45);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_19700
     * @tc.name      testImplicitConversions0197
     * @tc.desc      Declaration context, static field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0197", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A160.d).assertEqual(0);
      expect(A161.d).assertEqual(1);
      expect(A162.d).assertEqual(2);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_19800
     * @tc.name      testImplicitConversions0198
     * @tc.desc      Declaration context, static field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0198", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A163.d).assertEqual(0);
      expect(A164.d).assertEqual(-128);
      expect(A165.d).assertEqual(127);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_19900
     * @tc.name      testImplicitConversions0199
     * @tc.desc      Declaration context, static field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0199", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A166.d).assertEqual(100);
      expect(A167.d).assertEqual(200);
      expect(A168.d).assertEqual(300);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_20000
     * @tc.name      testImplicitConversions0200
     * @tc.desc      Declaration context, static field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A169.d).assertEqual(10.0f);
      expect(A170.d).assertEqual(20.0f);
      expect(A171.d).assertEqual(30.0f);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_20100
     * @tc.name      testImplicitConversions0201
     * @tc.desc      Declaration context, static field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0201", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A172.d).assertEqual(10001.0);
      expect(A173.d).assertEqual(10002.0);
      expect(A174.d).assertEqual(10003.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_20200
     * @tc.name      testImplicitConversions0202
     * @tc.desc      Declaration context, static field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0202", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A175.d).assertEqual(20001.0);
      expect(A176.d).assertEqual(20002.0);
      expect(A177.d).assertEqual(20003.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_20300
     * @tc.name      testImplicitConversions0203
     * @tc.desc      Declaration context, static field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0203", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A178.d).assertEqual(3000000001.0);
      expect(A179.d).assertEqual(3000000002.0);
      expect(A180.d).assertEqual(3000000003.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_20400
     * @tc.name      testImplicitConversions0204
     * @tc.desc      Declaration context, static field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0204", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A181.d).assertEqual(0.0f);
      expect(A182.d).assertEqual(-128.0f);
      expect(A183.d).assertEqual(127.0f);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_20500
     * @tc.name      testImplicitConversions0205
     * @tc.desc      Declaration context, static field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0205", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A184.d).assertEqual(0.0);
      expect(A185.d).assertEqual(-128.0);
      expect(A186.d).assertEqual(127.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_20600
     * @tc.name      testImplicitConversions0206
     * @tc.desc      Declaration context, static field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0206", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A187.d).assertEqual(0.0);
      expect(A188.d).assertEqual(-128.0);
      expect(A189.d).assertEqual(127.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_20700
     * @tc.name      testImplicitConversions0207
     * @tc.desc      Declaration context, static field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0207", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A190.d).assertEqual(0);
      expect(A191.d).assertEqual(-32768);
      expect(A192.d).assertEqual(32767);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_20800
     * @tc.name      testImplicitConversions0208
     * @tc.desc      Declaration context, static field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0208", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A193.d).assertEqual(0);
      expect(A194.d).assertEqual(-32768);
      expect(A195.d).assertEqual(32767);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_20900
     * @tc.name      testImplicitConversions0209
     * @tc.desc      Declaration context, static field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0209", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A196.d).assertEqual(0.0f);
      expect(A197.d).assertEqual(-32_768.0f);
      expect(A198.d).assertEqual(32_767.0f);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_21000
     * @tc.name      testImplicitConversions0210
     * @tc.desc      Declaration context, static field declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0210", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A199.d).assertEqual(0.0);
      expect(A200.d).assertEqual(-32768.0);
      expect(A201.d).assertEqual(32767.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_21100
     * @tc.name      testImplicitConversions0211
     * @tc.desc      Declaration context, variable declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0211", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: byte = 0 as byte;
      expect(d1).assertEqual(0);
      let d2: byte = Byte.MIN_VALUE;
      expect(d2).assertEqual(-128);
      let d3: byte = Byte.MAX_VALUE;
      expect(d3).assertEqual(127);
      let d4: byte = -128 as byte;
      expect(d4).assertEqual(-128);
      let d5: byte = 127 as byte;
      expect(d5).assertEqual(127);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_21200
     * @tc.name      testImplicitConversions0212
     * @tc.desc      Declaration context, variable declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0212", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: short = 0;
      expect(d1).assertEqual(0);
      let d2: short = Short.MIN_VALUE;
      expect(d2).assertEqual(-32768);
      let d3: short = Short.MAX_VALUE;
      expect(d3).assertEqual(32767);
      let d4: short = -32768;
      expect(d4).assertEqual(-32768);
      let d5: short = 32767;
      expect(d5).assertEqual(32767);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_21300
     * @tc.name      testImplicitConversions0213
     * @tc.desc      Declaration context, variable declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0213", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: int = 0;
      expect(d1).assertEqual(0);
      let d2: int = Int.MIN_VALUE;
      expect(d2).assertEqual(-2147483648);
      let d3: int = Int.MAX_VALUE;
      expect(d3).assertEqual(2147483647);
      let d4: int = -2147483648;
      expect(d4).assertEqual(-2147483648);
      let d5: int = 2147483647;
      expect(d5).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_21400
     * @tc.name      testImplicitConversions0214
     * @tc.desc      Declaration context, variable declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0214", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: long = 0;
      expect(d1).assertEqual(0);
      let d2: long = Long.MIN_VALUE;
      expect(d2).assertEqual(-9223372036854775808);
      let d3: long = Long.MAX_VALUE;
      expect(d3).assertEqual(9223372036854775807);
      let d4: long = -9223372036854775808;
      expect(d4).assertEqual(-9223372036854775808);
      let d5: long = 9223372036854775807;
      expect(d5).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_21500
     * @tc.name      testImplicitConversions0215
     * @tc.desc      Declaration context, variable declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0215", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: float = +0.0f;
      expect(d1).assertEqual(+0.0f);
      let d2: float = -0.0f;
      expect(d2).assertEqual(-0.0f);
      let d3: float = 3.4028234663852886e38f;
      expect(d3).assertEqual(3.4028234663852886e38f);
      let d4: float = 1.401298464324817e-45f;
      expect(d4).assertEqual(1.401298464324817e-45f);
      let d5: float = -3.4028234663852886e38f;
      expect(d5).assertEqual(-3.4028234663852886e38f);
      let d6: float = -1.401298464324817e-45f;
      expect(d6).assertEqual(-1.401298464324817e-45f);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_21600
     * @tc.name      testImplicitConversions0216
     * @tc.desc      Declaration context, variable declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0216", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: double = 0.0;
      expect(d1).assertEqual(0.0);
      let d2: double = -0.0;
      expect(d2).assertEqual(-0.0);
      let d3: double = 3.4028234663852886e38;
      expect(d3).assertEqual(3.4028234663852886e38);
      let d4: double = 1.401298464324817e-45;
      expect(d4).assertEqual(1.401298464324817e-45);
      let d5: double = -3.4028234663852886e38;
      expect(d5).assertEqual(-3.4028234663852886e38);
      let d6: double = -1.401298464324817e-45;
      expect(d6).assertEqual(-1.401298464324817e-45);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_21700
     * @tc.name      testImplicitConversions0217
     * @tc.desc      Declaration context, variable declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0217", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: string = '\u0000';
      expect(d1.charCodeAt(0)).assertEqual(0);
      let d2: string = '\u0FFF';
      expect(d2.charCodeAt(0)).assertEqual(4095);
      let d3: string = '\uFFFF';
      expect(d3.charCodeAt(0)).assertEqual(65535);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_21800
     * @tc.name      testImplicitConversions0218
     * @tc.desc      Declaration context, variable declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0218", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: float = Float.NaN;
      let d: double = s;
      expect(Double.isNaN(d)).assertTrue();
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_21900
     * @tc.name      testImplicitConversions0219
     * @tc.desc      Declaration context, variable declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0219", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: byte = 0b0 as byte;
      let d1: short = s1;
      expect(d1).assertEqual(0);
      let s2: byte = Byte.MIN_VALUE;
      let d2: short = s2;
      expect(d2).assertEqual(-128);
      let s3: byte = Byte.MAX_VALUE;
      let d3: short = s3;
      expect(d3).assertEqual(127);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_22000
     * @tc.name      testImplicitConversions0220
     * @tc.desc      Declaration context, variable declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0220", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: byte = 0b0 as byte;
      let d1: int = s1;
      expect(d1).assertEqual(0);
      let s2: byte = Byte.MIN_VALUE;
      let d2: int = s2;
      expect(d2).assertEqual(-128);
      let s3: byte = Byte.MAX_VALUE;
      let d3: int = s3;
      expect(d3).assertEqual(127);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_22100
     * @tc.name      testImplicitConversions0221
     * @tc.desc      Declaration context, variable declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0221", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: short = 0;
      let d1: number = s1;
      expect(d1).assertEqual(0.0);
      let s2: short = Short.MIN_VALUE;
      let d2: number = s2;
      expect(d2).assertEqual(-32768.0);
      let s3: short = Short.MAX_VALUE;
      let d3: number = s3;
      expect(d3).assertEqual(32767.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_22200
     * @tc.name      testImplicitConversions0222
     * @tc.desc      Declaration context, variable declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0222", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: int = 0;
      let d1: long = s1;
      expect(d1).assertEqual(0);
      let s2: int = Int.MIN_VALUE;
      let d2: long = s2;
      expect(d2).assertEqual(-2147483648);
      let s3: int = Int.MAX_VALUE;
      let d3: long = s3;
      expect(d3).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_22300
     * @tc.name      testImplicitConversions0223
     * @tc.desc      Declaration context, variable declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0223", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: int = 0;
      let d1: float = s1;
      expect(d1).assertEqual(0.0f);
      let s2: int = Int.MIN_VALUE;
      let d2: float = s2;
      expect(d2).assertEqual(-2147483600.0f);
      let s3: int = Int.MAX_VALUE;
      let d3: float = s3;
      expect(d3).assertEqual(2147483600.0f);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_22400
     * @tc.name      testImplicitConversions0224
     * @tc.desc      Declaration context, variable declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0224", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: int = 0;
      let d1: double = s1;
      expect(d1).assertEqual(0.0);
      let s2: int = Int.MIN_VALUE;
      let d2: double = s2;
      expect(d2).assertEqual(-2147483648.0);
      let s3: int = Int.MAX_VALUE;
      let d3: double = s3;
      expect(d3).assertEqual(2147483647.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_22500
     * @tc.name      testImplicitConversions0225
     * @tc.desc      Declaration context, variable declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0225", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: int = 0;
      let d1: number = s1;
      expect(d1).assertEqual(0.0);
      let s2: int = Int.MIN_VALUE;
      let d2: number = s2;
      expect(d2).assertEqual(-2147483648.0);
      let s3: int = Int.MAX_VALUE;
      let d3: number = s3;
      expect(d3).assertEqual(2147483647.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_22600
     * @tc.name      testImplicitConversions0226
     * @tc.desc      Declaration context, variable declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0226", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: long = 0;
      let d1: float = s1;
      expect(d1).assertEqual(0.0f);
      let s2: long = Long.MIN_VALUE;
      let d2: float = s2;
      expect(d2).assertEqual(-9223372000000000000.0f);
      let s3: long = Long.MAX_VALUE;
      let d3: float = s3;
      expect(d3).assertEqual(9223372000000000000.0f);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_22700
     * @tc.name      testImplicitConversions0227
     * @tc.desc      Declaration context, variable declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0227", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: long = 0;
      let d1: double = s1;
      expect(d1).assertEqual(0.0);
      let s2: long = Long.MIN_VALUE;
      let d2: double = s2;
      expect(d2).assertEqual(-9.223372036854776e+18);
      let s3: long = Long.MAX_VALUE;
      let d3: double = s3;
      expect(d3).assertEqual(9.223372036854776e+18);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_22800
     * @tc.name      testImplicitConversions0228
     * @tc.desc      Declaration context, variable declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0228", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: long = 0;
      let d1: number = s1;
      expect(d1).assertEqual(0.0);
      let s2: long = Long.MIN_VALUE;
      let d2: number = s2;
      expect(d2).assertEqual(-9.223372036854776e+18);
      let s3: long = Long.MAX_VALUE;
      let d3: number = s3;
      expect(d3).assertEqual(9.223372036854776e+18);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_22900
     * @tc.name      testImplicitConversions0229
     * @tc.desc      Declaration context, variable declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0229", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: float = +0.0f;
      let d1: double = s1;
      expect(d1).assertEqual(0.0);
      let s2: float = -0.0f;
      let d2: double = s2;
      expect(d2).assertEqual(-0.0);
      let s3: float = 3.4028234663852886e38f;
      let d3: double = s3;
      expect(d3).assertEqual(3.4028234663852886e38);
      let s4: float = 1.401298464324817e-45f;
      let d4: double = s4;
      expect(d4).assertEqual(1.401298464324817e-45);
      let s5: float = -3.4028234663852886e38f;
      let d5: double = s5;
      expect(d5).assertEqual(-3.4028234663852886e38);
      let s6: float = -1.401298464324817e-45f;
      let d6: double = s6;
      expect(d6).assertEqual(-1.401298464324817e-45);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_23000
     * @tc.name      testImplicitConversions0230
     * @tc.desc      Declaration context, variable declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0230", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Color = Color.Red;
      let d1: int = s1;
      expect(d1).assertEqual(0);
      let s2: Color = Color.Green;
      let d2: int = s2;
      expect(d2).assertEqual(1);
      let s3: Color = Color.Blue;
      let d3: int = s3;
      expect(d3).assertEqual(2);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_23100
     * @tc.name      testImplicitConversions0231
     * @tc.desc      Declaration context, variable declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0231", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: byte = 0b0 as byte;
      let d1: long = s1;
      expect(d1).assertEqual(0);
      let s2: byte = Byte.MIN_VALUE;
      let d2: long = s2;
      expect(d2).assertEqual(-128);
      let s3: byte = Byte.MAX_VALUE;
      let d3: long = s3;
      expect(d3).assertEqual(127);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_23200
     * @tc.name      testImplicitConversions0232
     * @tc.desc      Declaration context, variable declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0232", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Color1 = Color1.Red;
      let d1: long = s1;
      expect(d1).assertEqual(100);
      let s2: Color1 = Color1.Green;
      let d2: long = s2;
      expect(d2).assertEqual(200);
      let s3: Color1 = Color1.Blue;
      let d3: long = s3;
      expect(d3).assertEqual(300);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_23300
     * @tc.name      testImplicitConversions0233
     * @tc.desc      Declaration context, variable declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0233", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Color2 = Color2.Red;
      let d1: float = s1;
      expect(d1).assertEqual(10.0f);
      let s2: Color2 = Color2.Green;
      let d2: float = s2;
      expect(d2).assertEqual(20.0f);
      let s3: Color2 = Color2.Blue;
      let d3: float = s3;
      expect(d3).assertEqual(30.0f);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_23400
     * @tc.name      testImplicitConversions0234
     * @tc.desc      Declaration context, variable declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0234", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Color3 = Color3.Red;
      let d1: double = s1;
      expect(d1).assertEqual(10001.0);
      let s2: Color3 = Color3.Green;
      let d2: double = s2;
      expect(d2).assertEqual(10002.0);
      let s3: Color3 = Color3.Blue;
      let d3: double = s3;
      expect(d3).assertEqual(10003.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_23500
     * @tc.name      testImplicitConversions0235
     * @tc.desc      Declaration context, variable declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0235", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Color4 = Color4.Red;
      let d1: number = s1;
      expect(d1).assertEqual(20001.0);
      let s2: Color4 = Color4.Green;
      let d2: number = s2;
      expect(d2).assertEqual(20002.0);
      let s3: Color4 = Color4.Blue;
      let d3: number = s3;
      expect(d3).assertEqual(20003.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_23600
     * @tc.name      testImplicitConversions0236
     * @tc.desc      Declaration context, variable declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0236", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Color5 = Color5.Red;
      let d1: double = s1;
      expect(d1).assertEqual(3000000001.0);
      let s2: Color5 = Color5.Green;
      let d2: double = s2;
      expect(d2).assertEqual(3000000002.0);
      let s3: Color5 = Color5.Blue;
      let d3: double = s3;
      expect(d3).assertEqual(3000000003.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_23700
     * @tc.name      testImplicitConversions0237
     * @tc.desc      Declaration context, variable declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0237", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Color5 = Color5.Red;
      let d1: number = s1;
      expect(d1).assertEqual(3000000001.0);
      let s2: Color5 = Color5.Green;
      let d2: number = s2;
      expect(d2).assertEqual(3000000002.0);
      let s3: Color5 = Color5.Blue;
      let d3: number = s3;
      expect(d3).assertEqual(3000000003.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_23800
     * @tc.name      testImplicitConversions0238
     * @tc.desc      Declaration context, variable declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0238", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: byte = 0b0 as byte;
      let d1: float = s1;
      expect(d1).assertEqual(0.0f);
      let s2: byte = Byte.MIN_VALUE;
      let d2: float = s2;
      expect(d2).assertEqual(-128.0f);
      let s3: byte = Byte.MAX_VALUE;
      let d3: float = s3;
      expect(d3).assertEqual(127.0f);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_23900
     * @tc.name      testImplicitConversions0239
     * @tc.desc      Declaration context, variable declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0239", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: byte = 0b0 as byte;
      let d1: double = s1;
      expect(d1).assertEqual(0.0);
      let s2: byte = Byte.MIN_VALUE;
      let d2: double = s2;
      expect(d2).assertEqual(-128.0);
      let s3: byte = Byte.MAX_VALUE;
      let d3: double = s3;
      expect(d3).assertEqual(127.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_24000
     * @tc.name      testImplicitConversions0240
     * @tc.desc      Declaration context, variable declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0240", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: byte = 0b0 as byte;
      let d1: number = s1;
      expect(d1).assertEqual(0.0);
      let s2: byte = Byte.MIN_VALUE;
      let d2: number = s2;
      expect(d2).assertEqual(-128.0);
      let s3: byte = Byte.MAX_VALUE;
      let d3: number = s3;
      expect(d3).assertEqual(127.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_24100
     * @tc.name      testImplicitConversions0241
     * @tc.desc      Declaration context, variable declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0241", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: short = 0;
      let d1: int = s1;
      expect(d1).assertEqual(0);
      let s2: short = Short.MIN_VALUE;
      let d2: int = s2;
      expect(d2).assertEqual(-32768);
      let s3: short = Short.MAX_VALUE;
      let d3: int = s3;
      expect(d3).assertEqual(32767);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_24200
     * @tc.name      testImplicitConversions0242
     * @tc.desc      Declaration context, variable declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0242", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: short = 0;
      let d1: long = s1;
      expect(d1).assertEqual(0);
      let s2: short = Short.MIN_VALUE;
      let d2: long = s2;
      expect(d2).assertEqual(-32768);
      let s3: short = Short.MAX_VALUE;
      let d3: long = s3;
      expect(d3).assertEqual(32767);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_24300
     * @tc.name      testImplicitConversions0243
     * @tc.desc      Declaration context, variable declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0243", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: short = 0;
      let d1: float = s1;
      expect(d1).assertEqual(0.0f);
      let s2: short = Short.MIN_VALUE;
      let d2: float = s2;
      expect(d2).assertEqual(-32_768.0f);
      let s3: short = Short.MAX_VALUE;
      let d3: float = s3;
      expect(d3).assertEqual(32_767.0f);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_24400
     * @tc.name      testImplicitConversions0244
     * @tc.desc      Declaration context, variable declaration, widening primitive conversion, implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0244", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: short = 0;
      let d1: double = s1;
      expect(d1).assertEqual(0.0);
      let s2: short = Short.MIN_VALUE;
      let d2: double = s2;
      expect(d2).assertEqual(-32768.0);
      let s3: short = Short.MAX_VALUE;
      let d3: double = s3;
      expect(d3).assertEqual(32767.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_24500
     * @tc.name      testImplicitConversions0245
     * @tc.desc      A value of the numeric enumeration type is converted to one of the following: - Numeric type equal to or larger than the enumeration base type - Union type considering the value type of the enumeration base type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0245", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: number = 42;
      let v1: number = Color6.Red;
      expect(v1).assertEqual(0.0);
      let v2: number = Color6.Green + Color6.Blue;
      expect(v2).assertEqual(201.0);
      let v3: number = s + Color6.Blue + 33;
      expect(v3).assertEqual(176.0);
      const c1: number = Color6.Red;
      expect(c1).assertEqual(0.0);
      const c2: number = Color6.Green + Color6.Blue;
      expect(c2).assertEqual(201.0);
      const c3: number = s + Color6.Blue + 34;
      expect(c3).assertEqual(177.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_24600
     * @tc.name      testImplicitConversions0246
     * @tc.desc      A value of the numeric enumeration type is converted to one of the following: - Numeric type equal to or larger than the enumeration base type - Union type considering the value type of the enumeration base type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0246", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: int = 42;
      let v: number;
      v = Color6.Red;
      expect(v).assertEqual(0.0);
      v = Color6.Green + Color6.Blue;
      expect(v).assertEqual(201.0);
      v = s + Color6.Blue + 12;
      expect(v).assertEqual(155.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_24700
     * @tc.name      testImplicitConversions0247
     * @tc.desc      A value of the numeric enumeration type is converted to one of the following: - Numeric type equal to or larger than the enumeration base type - Union type considering the value type of the enumeration base type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0247", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: number = 42.0;
      let a: A202 = new A202();
      expect(a.meth(Color6.Red)).assertEqual(2.0);
      expect(a.meth(Color6.Green + Color6.Blue)).assertEqual(203.0);
      expect(a.meth(s + Color6.Blue)).assertEqual(145.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_24800
     * @tc.name      testImplicitConversions0248
     * @tc.desc      A value of the numeric enumeration type is converted to one of the following: - Numeric type equal to or larger than the enumeration base type - Union type considering the value type of the enumeration base type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0248", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: number = 42;
      let a: A203 = { fld: Color6.Red };
      expect(a.fld).assertEqual(0.0);
      a = { fld: Color6.Blue + Color6.Green };
      expect(a.fld).assertEqual(201.0);
      a = { fld: s + Color6.Blue + 1 };
      expect(a.fld).assertEqual(144.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_24900
     * @tc.name      testImplicitConversions0249
     * @tc.desc      A value of the numeric enumeration type is converted to one of the following: - Numeric type equal to or larger than the enumeration base type - Union type considering the value type of the enumeration base type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0249", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: number = 42.0;
      let v: number[] = [ Color6.Red ];
      expect(v[0]).assertEqual(0.0);
      v = [ Color6.Green + Color6.Blue, Color6.Blue + s ];
      expect(v[0]).assertEqual(201.0);
      expect(v[1]).assertEqual(143.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_25000
     * @tc.name      testImplicitConversions0250
     * @tc.desc      A value of the numeric enumeration type is converted to one of the following: - Numeric type equal to or larger than the enumeration base type - Union type considering the value type of the enumeration base type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0250", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: double = 42.2;
      let union1: string | number;
      let union2: int | object;
      let union3: Array<string> | Any | BigInt;
      union1 = Color6.Blue;
      expect(union1).assertEqual(101.0);
      expect(union1 instanceof number).assertTrue();
      union2 = Color6.Red + Color6.Green;
      expect(union2).assertEqual(100.0);
      expect(union2 instanceof number).assertTrue();
      union3 = Color6.Red + Color6.Blue + s;
      expect(union3).assertEqual(143.2);
      expect(union3 instanceof number).assertTrue();
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_25100
     * @tc.name      testImplicitConversions0251
     * @tc.desc      A value of the numeric enumeration type is converted to one of the following: - Numeric type equal to or larger than the enumeration base type - Union type considering the value type of the enumeration base type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0251", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: number = 42;
      let v1: number = Color7.Red;
      expect(v1).assertEqual(0);
      let v2: number = Color7.Green + Color7.Blue;
      expect(v2).assertEqual(201);
      let v3: number = s + Color7.Blue + 33;
      expect(v3).assertEqual(176);
      const c1: number = Color7.Red;
      expect(c1).assertEqual(0);
      const c2: number = Color7.Green + Color7.Blue;
      expect(c2).assertEqual(201);
      const c3: number = s + Color7.Blue + 34;
      expect(c3).assertEqual(177);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_25200
     * @tc.name      testImplicitConversions0252
     * @tc.desc      A value of the numeric enumeration type is converted to one of the following: - Numeric type equal to or larger than the enumeration base type - Union type considering the value type of the enumeration base type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0252", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: int = 42;
      let v: number;
      v = Color7.Red;
      expect(v).assertEqual(0);
      v = Color7.Green + Color7.Blue;
      expect(v).assertEqual(201);
      v = s + Color7.Blue + 12;
      expect(v).assertEqual(155);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_25300
     * @tc.name      testImplicitConversions0253
     * @tc.desc      A value of the numeric enumeration type is converted to one of the following: - Numeric type equal to or larger than the enumeration base type - Union type considering the value type of the enumeration base type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0253", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: int = 42;
      let union1: string | int;
      let union2: float | object;
      let union3: Array<string> | Any | double;
      union1 = Color7.Blue;
      expect(union1).assertEqual(101);
      expect(union1 instanceof int).assertTrue();
      union2 = Color7.Red + Color7.Green;
      expect(union2).assertEqual(100);
      expect(union2 instanceof int).assertTrue();
      union3 = Color7.Red + Color7.Blue + s;
      expect(union3).assertEqual(143);
      expect(union3 instanceof int).assertTrue();
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_25400
     * @tc.name      testImplicitConversions0254
     * @tc.desc      A value of the numeric enumeration type is converted to one of the following: - Numeric type equal to or larger than the enumeration base type - Union type considering the value type of the enumeration base type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0254", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: int = 42;
      let a: A204 = new A204();
      expect(a.fld1).assertEqual(0);
      expect(a.fld2).assertEqual(201);
      expect(a.fld3).assertEqual(100);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_25500
     * @tc.name      testImplicitConversions0255
     * @tc.desc      A value of the numeric enumeration type is converted to one of the following: - Numeric type equal to or larger than the enumeration base type - Union type considering the value type of the enumeration base type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0255", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: int = 42;
      let a: A205 = new A205();
      a.fld1 = Color7.Red;
      a.fld2 = Color7.Blue + Color7.Green;
      a.fld3 = s + Color7.Green + 1;
      expect(a.fld1).assertEqual(0);
      expect(a.fld2).assertEqual(201);
      expect(a.fld3).assertEqual(143);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_25600
     * @tc.name      testImplicitConversions0256
     * @tc.desc      A value of the numeric enumeration type is converted to one of the following: - Numeric type equal to or larger than the enumeration base type - Union type considering the value type of the enumeration base type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0256", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: int = 42;
      expect(foo9(Color7.Red)).assertEqual(1);
      expect(foo9(Color7.Green + Color7.Blue)).assertEqual(202);
      expect(foo9(s + Color7.Blue + 2)).assertEqual(146);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_25700
     * @tc.name      testImplicitConversions0257
     * @tc.desc      A value of the numeric enumeration type is converted to one of the following: - Numeric type equal to or larger than the enumeration base type - Union type considering the value type of the enumeration base type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0257", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: number = 42.0;
      let a: A206 = new A206();
      expect(a.meth(Color7.Red)).assertEqual(2.0);
      expect(a.meth(Color7.Green + Color7.Blue)).assertEqual(203.0);
      expect(a.meth(s + Color7.Blue)).assertEqual(145.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_25800
     * @tc.name      testImplicitConversions0258
     * @tc.desc      A value of the numeric enumeration type is converted to one of the following: - Numeric type equal to or larger than the enumeration base type - Union type considering the value type of the enumeration base type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0258", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: int = 42;
      expect(new A207(Color7.Red).fld).assertEqual(0);
      expect(new A207(Color7.Green + Color7.Blue).fld).assertEqual(201);
      expect(new A207(s + Color7.Blue + 10).fld).assertEqual(153);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_25900
     * @tc.name      testImplicitConversions0259
     * @tc.desc      A value of the numeric enumeration type is converted to one of the following: - Numeric type equal to or larger than the enumeration base type - Union type considering the value type of the enumeration base type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0259", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: int = 42;
      expect(((p: number): number => { return p })(Color7.Red)).assertEqual(0.0);
      expect(((p: int): int => { return p })(Color7.Green + Color7.Blue)).assertEqual(201);
      expect(((p: int): number => { return p })(s + Color7.Blue + 5)).assertEqual(148.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_26000
     * @tc.name      testImplicitConversions0260
     * @tc.desc      A value of the numeric enumeration type is converted to one of the following: - Numeric type equal to or larger than the enumeration base type - Union type considering the value type of the enumeration base type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0260", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: number = 42;
      let a: A208 = { fld: Color7.Red };
      expect(a.fld).assertEqual(0);
      a = { fld: Color7.Blue + Color7.Green };
      expect(a.fld).assertEqual(201);
      a = { fld: s + Color7.Blue + 1 };
      expect(a.fld).assertEqual(144);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_26100
     * @tc.name      testImplicitConversions0261
     * @tc.desc      A value of the numeric enumeration type is converted to one of the following: - Numeric type equal to or larger than the enumeration base type - Union type considering the value type of the enumeration base type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0261", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: number = 42.0;
      let v: number[] = [ Color7.Red ];
      expect(v[0]).assertEqual(0.0);
      v = [ Color7.Green + Color7.Blue, Color7.Blue + s ];
      expect(v[0]).assertEqual(201.0);
      expect(v[1]).assertEqual(143.0);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_26200
     * @tc.name      testImplicitConversions0262
     * @tc.desc      A value of the numeric enumeration type is converted to one of the following: - Numeric type equal to or larger than the enumeration base type - Union type considering the value type of the enumeration base type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0262", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: number = 42;
      let v1: number = Color8.Red;
      expect(v1).assertEqual(0.0);
      let v2: number = Color8.Green + Color8.Blue;
      expect(v2).assertEqual(7523377976305298605);
      let v3: number = s + Color8.Blue + 1;
      expect(v3).assertEqual(3761688988152649369);
      const c1: number = Color8.Red;
      expect(c1).assertEqual(0.0);
      const c2: number = Color8.Green + Color8.Blue;
      expect(c2).assertEqual(7523377976305298605);
      const c3: number = s + Color8.Blue + 1;
      expect(c3).assertEqual(3761688988152649369);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_26300
     * @tc.name      testImplicitConversions0263
     * @tc.desc      A value of the numeric enumeration type is converted to one of the following: - Numeric type equal to or larger than the enumeration base type - Union type considering the value type of the enumeration base type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0263", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: int = 42;
      let v: number;
      v = Color8.Red;
      expect(v).assertEqual(0.0);
      v = Color8.Green + Color8.Blue;
      expect(v).assertEqual(7523377976305298605);
      v = s + Color8.Blue + 1;
      expect(v).assertEqual(3761688988152649369);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_26400
     * @tc.name      testImplicitConversions0264
     * @tc.desc      A value of the numeric enumeration type is converted to one of the following: - Numeric type equal to or larger than the enumeration base type - Union type considering the value type of the enumeration base type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0264", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: long = 42;
      let union1: string | number;
      let union2: long | object;
      let union3: Array<string> | Any | byte;
      union1 = Color8.Blue;
      expect(union1).assertEqual(3761688988152649303);
      expect(union1 instanceof number).assertTrue();
      union2 = Color8.Red + Color8.Green;
      expect(union2).assertEqual(3761688988152649302);
      expect(union2 instanceof long).assertTrue();
      union3 = Color8.Red + Color8.Blue + s;
      expect(union3).assertEqual(3761688988152649345);
      expect(union3 instanceof long).assertTrue();
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_26500
     * @tc.name      testImplicitConversions0265
     * @tc.desc      A value of the numeric enumeration type is converted to one of the following: - Numeric type equal to or larger than the enumeration base type - Union type considering the value type of the enumeration base type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0265", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: int = 42;
      let a: A209 = new A209();
      expect(a.fld2).assertEqual(7523377976305298605);
      expect(a.fld3).assertEqual(3761688988152649302);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_26600
     * @tc.name      testImplicitConversions0266
     * @tc.desc      A value of the numeric enumeration type is converted to one of the following: - Numeric type equal to or larger than the enumeration base type - Union type considering the value type of the enumeration base type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0266", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: int = 42;
      let a: A210 = new A210();
      a.fld1 = Color8.Red;
      a.fld2 = Color8.Blue + Color8.Green;
      a.fld3 = s + Color8.Green + 1;
      expect(a.fld1).assertEqual(0.0);
      expect(a.fld2).assertEqual(7523377976305298605);
      expect(a.fld3).assertEqual(3761688988152649345);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_26700
     * @tc.name      testImplicitConversions0267
     * @tc.desc      Numeric enumeration conversion to long/number (enum2long_4)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0267", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: number = 42;
      expect(foo10(Color8.Red)).assertEqual(1.0);
      expect(foo10(Color8.Green + Color8.Blue)).assertEqual(7523377976305298606);
      expect(foo10(s + Color8.Blue + 2)).assertEqual(3761688988152649370);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_26800
     * @tc.name      testImplicitConversions0268
     * @tc.desc      Numeric enumeration conversion to number (enum2long_5)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0268", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: number = 42.0;
      let a: A211 = new A211();
      expect(a.meth(Color8.Red)).assertEqual(2.0);
      expect(a.meth(Color8.Green + Color8.Blue)).assertEqual(7523377976305298000);
      expect(a.meth(s + Color8.Blue)).assertEqual(3761688988152649370);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_26900
     * @tc.name      testImplicitConversions0269
     * @tc.desc      Numeric enumeration conversion to long in constructor (enum2long_6)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0269", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: number = 42;
      expect(new A212(Color8.Red).fld).assertEqual(0.0);
      expect(new A212(Color8.Green + Color8.Blue).fld).assertEqual(7523377976305298605);
      expect(new A212(s + Color8.Blue + 10).fld).assertEqual(3761688988152649355);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_27000
     * @tc.name      testImplicitConversions0270
     * @tc.desc      Numeric enumeration conversion in lambda (enum2long_7)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0270", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: number = 42;
      expect(((p: number): number => { return p })(Color8.Red)).assertEqual(0.0);
      expect(((p: number): number => { return p })(Color8.Green + Color8.Blue)).assertEqual(7523377976305298605);
      expect(((p: number): number => { return p })(s + Color8.Blue + 5)).assertEqual(3761688988152649350);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_27100
     * @tc.name      testImplicitConversions0271
     * @tc.desc      Numeric enumeration conversion in composite object (enum2long_8)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0271", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: number = 42;
      let a: A213 = { fld: Color8.Red };
      expect(a.fld).assertEqual(0.0);
      a = { fld: Color8.Blue + Color8.Green };
      expect(a.fld).assertEqual(7523377976305298605);
      a = { fld: s + Color8.Blue + 1 };
      expect(a.fld).assertEqual(3761688988152649369);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_27200
     * @tc.name      testImplicitConversions0272
     * @tc.desc      Numeric enumeration conversion in composite array (enum2long_9)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0272", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: number = 42.0;
      let v: number[] = [Color8.Red];
      expect(v[0]).assertEqual(0.0);
      v = [Color8.Green + Color8.Blue, Color8.Blue + s];
      expect(v[0]).assertEqual(7523377976305298605);
      expect(v[1]).assertEqual(3761688988152649368);
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_27300
     * @tc.name      testImplicitConversions0273
     * @tc.desc      String enumeration conversion in variable/constant declaration (enum2str_0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0273", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "Z";
      let v1: string = Color9.Red;
      expect(v1).assertEqual("r");
      let v2: string = Color9.Green + Color9.Blue;
      expect(v2).assertEqual("gb");
      let v3: string = s + Color9.Blue + "X";
      expect(v3).assertEqual("ZbX");
      const c1: string = Color9.Red;
      expect(c1).assertEqual("r");
      const c2: string = Color9.Green + Color9.Blue;
      expect(c2).assertEqual("gb");
      const c3: string = s + Color9.Blue + "X";
      expect(c3).assertEqual("ZbX");
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_27400
     * @tc.name      testImplicitConversions0274
     * @tc.desc      String enumeration conversion in variable assignment (enum2str_1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0274", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "Z";
      let v: string;
      v = Color9.Red;
      expect(v).assertEqual("r");
      v = Color9.Green + Color9.Blue;
      expect(v).assertEqual("gb");
      v = s + Color9.Blue + "X";
      expect(v).assertEqual("ZbX");
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_27500
     * @tc.name      testImplicitConversions0275
     * @tc.desc      String enumeration conversion in field declaration (enum2str_2)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0275", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A214 = new A214();
      expect(a.fld1).assertEqual("r");
      expect(a.fld2).assertEqual("bg");
      expect(a.fld3).assertEqual("ZgX");
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_27600
     * @tc.name      testImplicitConversions0276
     * @tc.desc      String enumeration conversion in field assignment (enum2str_3)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0276", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "Z";
      let a: A215 = new A215();
      a.fld1 = Color9.Red;
      expect(a.fld1).assertEqual("r");
      a.fld2 = Color9.Blue + Color9.Green;
      expect(a.fld2).assertEqual("bg");
      a.fld3 = s + Color9.Green + "X";
      expect(a.fld3).assertEqual("ZgX");
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_27700
     * @tc.name      testImplicitConversions0277
     * @tc.desc      String enumeration conversion in function call (enum2str_4)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0277", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "Z";
      expect(foo11(Color9.Red)).assertEqual("r!");
      expect(foo11(Color9.Green + Color9.Blue)).assertEqual("gb!");
      expect(foo11(s + Color9.Blue + "X")).assertEqual("ZbX!");
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_27800
     * @tc.name      testImplicitConversions0278
     * @tc.desc      String enumeration conversion in method call (enum2str_5)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0278", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "Z";
      let a: A216 = new A216();
      expect(a.meth(Color9.Red)).assertEqual("r!");
      expect(a.meth(Color9.Green + Color9.Blue)).assertEqual("gb!");
      expect(a.meth(s + Color9.Blue + "X")).assertEqual("ZbX!");
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_27900
     * @tc.name      testImplicitConversions0279
     * @tc.desc      String enumeration conversion in constructor call (enum2str_6)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0279", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "Z";
      expect(new A217(Color9.Red).fld).assertEqual("r");
      expect(new A217(Color9.Green + Color9.Blue).fld).assertEqual("gb");
      expect(new A217(s + Color9.Blue + "X").fld).assertEqual("ZbX");
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_28000
     * @tc.name      testImplicitConversions0280
     * @tc.desc      String enumeration conversion in lambda call (enum2str_7)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0280", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "Z";
      expect(((p: string): string => { return p + "!" })(Color9.Red)).assertEqual("r!");
      expect(((p: string): string => { return p + "!" })(Color9.Green + Color9.Blue)).assertEqual("gb!");
      expect(((p: string): string => { return p + "!" })(s + Color9.Blue + "X")).assertEqual("ZbX!");
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_28100
     * @tc.name      testImplicitConversions0281
     * @tc.desc      String enumeration conversion in composite object (enum2str_8)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0281", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "Z";
      let a: A218 = { fld: Color9.Red };
      expect(a.fld).assertEqual("r");
      a = { fld: Color9.Blue + Color9.Green };
      expect(a.fld).assertEqual("bg");
      a = { fld: s + Color9.Blue + "!" };
      expect(a.fld).assertEqual("Zb!");
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_28200
     * @tc.name      testImplicitConversions0282
     * @tc.desc      String enumeration conversion in composite array (enum2str_9)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0282", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "Z";
      let v: string;
      v = Color9.Red;
      expect(v).assertEqual("r");
      v = Color9.Green + Color9.Blue;
      expect(v).assertEqual("gb");
      v = s + Color9.Blue + "X"
      expect(v).assertEqual("ZbX");
    });

    /**
     * @tc.number    SUB_IMPLICIT_CONVERSIONS_28300
     * @tc.name      testImplicitConversions0283
     * @tc.desc      String enumeration conversion to union type (enum2str_10)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitConversions0283", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "Z";
      let union1: string | number;
      let union2: float | object
      let union3: Array<int> | Any | BigInt
      union1 = Color9.Red;
      expect(union1).assertEqual("r");
      expect(union1 instanceof string).assertEqual(true);
      union2 = Color9.Red + Color9.Blue;
      expect(union2).assertEqual("rb");
      expect(union2 instanceof string).assertEqual(true);
      union3 = Color9.Red + Color9.Blue + s;
      expect(union3).assertEqual("rbZ");
      expect(union3 instanceof string).assertEqual(true);
    });

  })
}