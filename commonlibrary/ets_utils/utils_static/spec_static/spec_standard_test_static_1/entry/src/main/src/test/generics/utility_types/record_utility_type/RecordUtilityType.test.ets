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
  expect,
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  TestType,
  Size,
  Level
} from "../../../../../../hypium"

type R1_0 = Record<string, Error>
function foo_0(p: R1_0): R1_0 {
    p["Null Pointer Error"] = new Error("NPE")
    return p
}

type R1_1<T> = Record<T, Error>
function foo_1(p: R1_1<string>): R1_1<string> {
    p["Null Pointer Error"] = new Error("NPE")
    return p
}

class A_0 {
    f1: Record<string, boolean> = {}
    f2: Record<number, boolean> = {}
}

let a_0 = 2, b_0 = 1;
function foo_2<T>(p: T): T {
    if (a_0 > b_0) {
        return p
    }
    throw new Error()
}

class A_1<T> {
    f: T
    constructor(p: T) {
        this.f = p
    }
    put(p: T) {
        this.f = p
    }
}
class B_0<T> extends A_1<T> {
    constructor(p: T) {
        super(p)
    }
    meth(): T {
        return this.f
    }
}

let a_1 = 2, b_1 = 1;
function to_obj_0(p: Object): Object {
    if (a_1 > b_1) {
        return p
    }
    return new Error()
}
function to_rec_0(p: Object|null): Record<number, number> {
    return p as Record<number, number>
}

class A_2<T extends Object> {
    private f: Record<number, T> = {}
    get(i: number): T|undefined { return this.f[i] }
    set(i: number, p: T) { this.f[i] = p }
}

class A_3<T extends Numeric> {
    private f: Record<T, string> = {}
    get(i: T): string|undefined { return this.f[i] }
    set(i: T, p: string) { this.f[i] = p }
}

type TT_0 = [number, number, string, boolean, Object]
enum Color_0 { Red, Green, Blue }
enum Commands_0 { Open = "fopen", Close = "fclose" }
type CC_0 = Color_0 | Commands_0
async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function RecordUtilityTypeTest() {
  describe("RecordUtilityTypeTest", () => {
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
     * @tc.number    SUB_RECORD_UTILITY_TYPE_0100
     * @tc.name      testRecordUtilityType0001
     * @tc.desc      Type Record<K, V> constructs a container that maps keys (of type K) to values
     *               (of type V).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRecordUtilityType0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: R1_0 = {}
      r = foo_0(r)
      expect(r["Null Pointer Error"] instanceof Error).assertTrue()
      expect(r["NPE"] == undefined).assertTrue()
    })

    /**
     * @tc.number    SUB_RECORD_UTILITY_TYPE_0200
     * @tc.name      testRecordUtilityType0002
     * @tc.desc      Type Record<K, V> constructs a container that maps keys (of type K) to values
     *               (of type V).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRecordUtilityType0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: R1_1<string> = {}
      r = foo_1(r)
      expect(r["Null Pointer Error"] instanceof Error).assertTrue()
      expect(r["NPE"] == undefined).assertTrue()
    })

    /**
     * @tc.number    SUB_RECORD_UTILITY_TYPE_0400
     * @tc.name      testRecordUtilityType0004
     * @tc.desc      Type Record<K, V> constructs a container that maps keys (of type K) to values
     *               (of type V).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRecordUtilityType0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new Array<Record<string, number>>()
      r.push({ "A": 1 })
      r.push({ "B": 2 })
      let v = r.pop()
      expect(v!["B"] == 2 && v!["A"] == undefined).assertTrue()
      v = r.pop()
      expect(v!["A"] == 1 && v!["B"] == undefined).assertTrue()
    })

    /**
     * @tc.number    SUB_RECORD_UTILITY_TYPE_0500
     * @tc.name      testRecordUtilityType0005
     * @tc.desc      Type Record<K, V> constructs a container that maps keys (of type K) to values
     *               (of type V).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRecordUtilityType0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: [Record<number, string>, Record<string, (p: number) => string>] = [
        { 1: "1", 2: "2", 3: "3" },
        { "A": (p: number): string => "A" + p, "B": (p: number): string => "B" + p }
      ]
      expect(r[0][1] == "1").assertTrue()
      expect(r[0][2] == "2").assertTrue()
      expect(r[0][3] == "3").assertTrue()
      expect(r[0][4] == undefined).assertTrue()
      expect(r[1]["A"]!(42) == "A42").assertTrue()
      expect(r[1]["B"]!(33) == "B33").assertTrue()
      expect(r[1]["C"] == undefined).assertTrue()
    })

    /**
     * @tc.number    SUB_RECORD_UTILITY_TYPE_0600
     * @tc.name      testRecordUtilityType0006
     * @tc.desc      Type Record<K, V> constructs a container that maps keys (of type K) to values
     *               (of type V).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRecordUtilityType0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A_0
      a.f1["1"] = true
      a.f1["0"] = false
      a.f2[1] = false
      a.f2[0] = true
      expect(a.f1["1"]! && !(a.f1["0"]!) && !(a.f2[1]!) && a.f2[0]!).assertTrue()
      expect(a.f1[""] == undefined && a.f2[42] == undefined).assertTrue()
    })

    /**
     * @tc.number    SUB_RECORD_UTILITY_TYPE_0700
     * @tc.name      testRecordUtilityType0007
     * @tc.desc      Type Record<K, V> constructs a container that maps keys (of type K) to values
     *               (of type V).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRecordUtilityType0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Record<"a"|"b"|"c", number> = {
        "a": 1,
        "b": 2,
        "c": 3,
      }
      let q = foo_2<Record<"a"|"b"|"c", number>>(r)
      expect(q["a"] == 1 && q["b"] == 2 && q["c"] == 3).assertTrue()
    })

    /**
     * @tc.number    SUB_RECORD_UTILITY_TYPE_0800
     * @tc.name      testRecordUtilityType0008
     * @tc.desc      Type Record<K, V> constructs a container that maps keys (of type K) to values
     *               (of type V).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRecordUtilityType0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B_0<Record<Numeric, string>> = new B_0<Record<Numeric, string>>({
        12345.0: "1 2 3 4 5",
        67890.0: "6 7 8 9 0",
      });
      expect(b.meth()[new Short(12345)] == "1 2 3 4 5").assertTrue()
      expect(b.meth()[67890] == "6 7 8 9 0").assertTrue()
      expect(b.meth()[11111] == undefined).assertTrue()
      b.put({ 1.0: "A", 2.0: "B" })
      expect(b.meth()[1] == "A").assertTrue()
      expect(b.meth()[2] == "B").assertTrue()
    })

    /**
     * @tc.number    SUB_RECORD_UTILITY_TYPE_0900
     * @tc.name      testRecordUtilityType0009
     * @tc.desc      Type Record<K, V> constructs a container that maps keys (of type K) to values
     *               (of type V).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRecordUtilityType0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Record<number, number> = {
        1: 101,
        2: 202,
        3: 303,
      }
      let obj: Object|null = to_obj_0(r)
      let q = to_rec_0(obj)
      expect(q[1] == 101 && q[2] == 202 && q[3] == 303).assertTrue()
    })

    /**
     * @tc.number    SUB_RECORD_UTILITY_TYPE_1000
     * @tc.name      testRecordUtilityType0010
     * @tc.desc      Type Record<K, V> constructs a container that maps keys (of type K) to values
     *               (of type V).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRecordUtilityType0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Record<string|number, bigint> = {
        "A": 1n,
        "B": 2n,
        1: 100n,
        2: 200n,
      }
      expect(r["A"] == 1n && r["B"] == 2n).assertTrue()
      expect(r[1] == 100n && r[2] == 200n).assertTrue()
      r["C"] = 3n
      r[3] = 300n
      expect(r["C"] == 3n && r[3] == 300n).assertTrue()
      expect(r["D"] == undefined && r[4] == undefined).assertTrue()
    })

    /**
     * @tc.number    SUB_RECORD_UTILITY_TYPE_1100
     * @tc.name      testRecordUtilityType0011
     * @tc.desc      Type Record<K, V> constructs a container that maps keys (of type K) to values
     *               (of type V).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRecordUtilityType0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Record<string|number, double|char|boolean|string|bigint> = {
        "1": 42.0
      }
      r[6] = 6.01
      r["7"] = c'\u0007'
      r[8] = true
      r[9] = "abc"
      r[0] = 111111111111111111111111111111111111111111111111111111111111111111111111111111111111n
      expect(r[0] == 111111111111111111111111111111111111111111111111111111111111111111111111111111111111n).assertTrue()
      expect(r[9] == "abc").assertTrue()
      expect(r[8] == true).assertTrue()
      expect(r["7"] == c'\u0007').assertTrue()
      expect(r[6] == 6.01).assertTrue()
      expect(r["1"] == 42.0).assertTrue()
    })

    /**
     * @tc.number    SUB_RECORD_UTILITY_TYPE_1200
     * @tc.name      testRecordUtilityType0012
     * @tc.desc      Type Record<K, V> constructs a container that maps keys (of type K) to values
     *               (of type V).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRecordUtilityType0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_2<Record<string, number>> = new A_2<Record<string, number>>;
      a.set(1, { "A": 100 })
      a.set(2, { "B": 200 })
      expect(a.get(1)!["A"] == 100).assertTrue()
      expect(a.get(2)!["B"] == 200).assertTrue()
      expect(a.get(3) == undefined).assertTrue()
    })

    /**
     * @tc.number    SUB_RECORD_UTILITY_TYPE_1300
     * @tc.name      testRecordUtilityType0013
     * @tc.desc      Type Record<K, V> constructs a container that maps keys (of type K) to values
     *               (of type V).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRecordUtilityType0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_3<Int> = new A_3<Int>;
      a.set(42, "42")
      a.set(33, "33")
      expect(a.get(42) == "42").assertTrue()
      expect(a.get(33) == "33").assertTrue()
      expect(a.get(34) == undefined).assertTrue()
      a.set(42, "0")
      expect(a.get(42) == "0").assertTrue()
    })

    /**
     * @tc.number    SUB_RECORD_UTILITY_TYPE_1400
     * @tc.name      testRecordUtilityType0014
     * @tc.desc      Type Record<K, V> constructs a container that maps keys (of type K) to values
     *               (of type V).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRecordUtilityType0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ti: TT_0 = [ 6, 7, "abc", true, 42]
      let r: Record<Int, TT_0> = {0: ti}
      expect(r[0]?.[4]).assertEqual(42)
    })

    /**
     * @tc.number    SUB_RECORD_UTILITY_TYPE_1500
     * @tc.name      testRecordUtilityType0015
     * @tc.desc      Type Record<K, V> constructs a container that maps keys (of type K) to values
     *               (of type V).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRecordUtilityType0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Record<Int, FixedArray<string>> = {0: ['a', 'b', 'c']}
      expect(r[0]?.length).assertEqual(3)
    })

    /**
     * @tc.number    SUB_RECORD_UTILITY_TYPE_1600
     * @tc.name      testRecordUtilityType0016
     * @tc.desc      Type Record<K, V> constructs a container that maps keys (of type K) to values
     *               (of type V).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRecordUtilityType0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Record<string, int>|null = {
        'a': 1,
        'b': 2,
      } as Record<string, int>
      expect(r!['a']).assertEqual(1)
      expect(r!['b']).assertEqual(2)
    })

    /**
     * @tc.number    SUB_RECORD_UTILITY_TYPE_1700
     * @tc.name      testRecordUtilityType0017
     * @tc.desc      Type Record<K, V> constructs a container that maps keys (of type K) to values
     *               (of type V).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRecordUtilityType0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Record<string, int>|undefined = {
        'a': 1,
        'b': 2,
      } as Record<string, int>
      expect(r!['a']).assertEqual(1)
      expect(r!['b']).assertEqual(2)
    })

    /**
     * @tc.number    SUB_RECORD_UTILITY_TYPE_1800
     * @tc.name      testRecordUtilityType0018
     * @tc.desc      Type Record<K, V> constructs a container that maps keys (of type K) to values
     *               (of type V).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRecordUtilityType0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Record<string, int|null>|null = {
        'a': 1,
        'b': null,
      } as Record<string, int|null>
      expect(r!['a']).assertEqual(1)
      expect(r!['b']).assertEqual(null)
    })

    /**
     * @tc.number    SUB_RECORD_UTILITY_TYPE_1900
     * @tc.name      testRecordUtilityType0019
     * @tc.desc      Type Record<K, V> constructs a container that maps keys (of type K) to values
     *               (of type V).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRecordUtilityType0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Record<string, int|undefined>|undefined = {
        'a': 1,
        'b': undefined,
      } as Record<string, int|undefined>
      expect(r!['a']).assertEqual(1)
      expect(r!['b']).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_RECORD_UTILITY_TYPE_2000
     * @tc.name      testRecordUtilityType0020
     * @tc.desc      Type Record<K, V> constructs a container that maps keys (of type K) to values
     *               (of type V).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRecordUtilityType0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Record<string, Record<string, int|null>|null>|null = {
        'a': null,
        'b': { 'bb1': null, 'bb2': 42 } as Record<string, int|null>,
      } as Record<string, Record<string, int|null>|null>
      expect(r!['a']).assertEqual(null)
      expect(r!['b']!['bb1']).assertEqual(null)
      expect(r!['b']!['bb2']).assertEqual(42)
    })

    /**
     * @tc.number    SUB_RECORD_UTILITY_TYPE_2100
     * @tc.name      testRecordUtilityType0021
     * @tc.desc      Type Record<K, V> constructs a container that maps keys (of type K) to values
     *               (of type V).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRecordUtilityType0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Record<string, Record<string, int|undefined>|undefined>|undefined = {
        'a': undefined,
        'b': { 'bb1': undefined, 'bb2': 42 } as Record<string, int|undefined>,
      } as Record<string, Record<string, int|undefined>|undefined>
      expect(r!['a']).assertEqual(undefined)
      expect(r!['b']!['bb1']).assertEqual(undefined)
      expect(r!['b']!['bb2']).assertEqual(42)
    })

    /**
     * @tc.number    SUB_RECORD_UTILITY_TYPE_2200
     * @tc.name      testRecordUtilityType0022
     * @tc.desc      Type K is restricted to numeric types, type string, string literal types, enum
     *               types, and union types constructed from these types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRecordUtilityType0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 内联原全局变量声明和初始化
      let key1: byte = 0, val1: byte = 0
      let key2: byte = 0, val2: byte = 55
      let key3: byte = Byte.MIN_VALUE, val3: byte = Byte.MIN_VALUE
      let key4: byte = Byte.MIN_VALUE, val4: byte = Byte.MAX_VALUE
      let key5: byte = Byte.MAX_VALUE, val5: byte = Byte.MAX_VALUE
      let key6: byte = Byte.MAX_VALUE, val6: byte = Byte.MIN_VALUE

      let r: Record<byte, byte> = {}
      r[key1] = val1
      expect(r[key1] == val1).assertTrue()
      r[key2] = val2
      expect(r[key2] == val2).assertTrue()
      r[key3] = val3
      expect(r[key3] == val3).assertTrue()
      r[key4] = val4
      expect(r[key4] == val4).assertTrue()
      r[key5] = val5
      expect(r[key5] == val5).assertTrue()
      r[key6] = val6
      expect(r[key6] == val6).assertTrue()
    })

    /**
     * @tc.number    SUB_RECORD_UTILITY_TYPE_2300
     * @tc.name      testRecordUtilityType0023
     * @tc.desc      Type K is restricted to numeric types, type string, string literal types, enum
     *               types, and union types constructed from these types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRecordUtilityType0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let key1: short = 0, val1: short = 0
      let key2: short = 0, val2: short = 55
      let key3: short = Short.MIN_VALUE, val3: short = Short.MIN_VALUE
      let key4: short = Short.MIN_VALUE, val4: short = Short.MAX_VALUE
      let key5: short = Short.MAX_VALUE, val5: short = Short.MAX_VALUE
      let key6: short = Short.MAX_VALUE, val6: short = Short.MIN_VALUE

      let r: Record<short, short> = {}
      r[key1] = val1
      expect(r[key1] == val1).assertTrue()
      r[key2] = val2
      expect(r[key2] == val2).assertTrue()
      r[key3] = val3
      expect(r[key3] == val3).assertTrue()
      r[key4] = val4
      expect(r[key4] == val4).assertTrue()
      r[key5] = val5
      expect(r[key5] == val5).assertTrue()
      r[key6] = val6
      expect(r[key6] == val6).assertTrue()
    })

    /**
     * @tc.number    SUB_RECORD_UTILITY_TYPE_2400
     * @tc.name      testRecordUtilityType0024
     * @tc.desc      Type K is restricted to numeric types, type string, string literal types, enum
     *               types, and union types constructed from these types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRecordUtilityType0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let key1: int = 0, val1: int = 0
      let key2: int = 0, val2: int = 55
      let key3: int = Int.MIN_VALUE, val3: int = Int.MIN_VALUE
      let key4: int = Int.MIN_VALUE, val4: int = Int.MAX_VALUE
      let key5: int = Int.MAX_VALUE, val5: int = Int.MAX_VALUE
      let key6: int = Int.MAX_VALUE, val6: int = Int.MIN_VALUE

      let r: Record<int, int> = {}
      r[key1] = val1
      expect(r[key1] == val1).assertTrue()
      r[key2] = val2
      expect(r[key2] == val2).assertTrue()
      r[key3] = val3
      expect(r[key3] == val3).assertTrue()
      r[key4] = val4
      expect(r[key4] == val4).assertTrue()
      r[key5] = val5
      expect(r[key5] == val5).assertTrue()
      r[key6] = val6
      expect(r[key6] == val6).assertTrue()
    })

    /**
     * @tc.number    SUB_RECORD_UTILITY_TYPE_2500
     * @tc.name      testRecordUtilityType0025
     * @tc.desc      Type K is restricted to numeric types, type string, string literal types, enum
     *               types, and union types constructed from these types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRecordUtilityType0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let key1: long = 0, val1: long = 0
      let key2: long = 0, val2: long = 55
      let key3: long = Long.MIN_VALUE, val3: long = Long.MIN_VALUE
      let key4: long = Long.MIN_VALUE, val4: long = Long.MAX_VALUE
      let key5: long = Long.MAX_VALUE, val5: long = Long.MAX_VALUE
      let key6: long = Long.MAX_VALUE, val6: long = Long.MIN_VALUE

      let r: Record<long, long> = {}
      r[key1] = val1
      expect(r[key1] == val1).assertTrue()
      r[key2] = val2
      expect(r[key2] == val2).assertTrue()
      r[key3] = val3
      expect(r[key3] == val3).assertTrue()
      r[key4] = val4
      expect(r[key4] == val4).assertTrue()
      r[key5] = val5
      expect(r[key5] == val5).assertTrue()
      r[key6] = val6
      expect(r[key6] == val6).assertTrue()
    })

    /**
     * @tc.number    SUB_RECORD_UTILITY_TYPE_2600
     * @tc.name      testRecordUtilityType0026
     * @tc.desc      Type K is restricted to numeric types, type string, string literal types, enum
     *               types, and union types constructed from these types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRecordUtilityType0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let key1: float = 0.0f, val1: float = 0.0f
      let key2: float = 0.0f, val2: float = 55.0f
      let key3: float = Float.MIN_VALUE, val3: float = Float.MIN_VALUE
      let key4: float = Float.MIN_VALUE, val4: float = Float.MAX_VALUE
      let key5: float = Float.MAX_VALUE, val5: float = Float.MAX_VALUE
      let key6: float = Float.MAX_VALUE, val6: float = Float.MIN_VALUE
      let key7: float = Float.NEGATIVE_INFINITY, val7: float = Float.NEGATIVE_INFINITY
      let key8: float = Float.NEGATIVE_INFINITY, val8: float = Float.POSITIVE_INFINITY
      let key9: float = Float.POSITIVE_INFINITY, val9: float = Float.POSITIVE_INFINITY
      let key10: float = Float.POSITIVE_INFINITY, val10: float = Float.NEGATIVE_INFINITY
      let key11: float = Float.NaN, val11: float = 42.0f
      let key12: float = Float.NaN, val12: float = 84.0f

      let r: Record<float, float> = {}
      r[key1] = val1
      expect(r[key1] == val1).assertTrue()
      r[key2] = val2
      expect(r[key2] == val2).assertTrue()
      r[key3] = val3
      expect(r[key3] == val3).assertTrue()
      r[key4] = val4
      expect(r[key4] == val4).assertTrue()
      r[key5] = val5
      expect(r[key5] == val5).assertTrue()
      r[key6] = val6
      expect(r[key6] == val6).assertTrue()
      r[key7] = val7
      expect(r[key7] == val7).assertTrue()
      r[key8] = val8
      expect(r[key8] == val8).assertTrue()
      r[key9] = val9
      expect(r[key9] == val9).assertTrue()
      r[key10] = val10
      expect(r[key10] == val10).assertTrue()
      r[key11] = val11
      expect(r[key11] == val11).assertTrue()
      r[key12] = val12
      expect(r[key12] == val12).assertTrue()
    })

    /**
     * @tc.number    SUB_RECORD_UTILITY_TYPE_2700
     * @tc.name      testRecordUtilityType0027
     * @tc.desc      Type K is restricted to numeric types, type string, string literal types, enum
     *               types, and union types constructed from these types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRecordUtilityType0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let key1: double = 0.0, val1: double = 0.0
      let key2: double = 0.0, val2: double = 55.0
      let key3: double = Double.MIN_VALUE, val3: double = Double.MIN_VALUE
      let key4: double = Double.MIN_VALUE, val4: double = Double.MAX_VALUE
      let key5: double = Double.MAX_VALUE, val5: double = Double.MAX_VALUE
      let key6: double = Double.MAX_VALUE, val6: double = Double.MIN_VALUE
      let key7: double = Double.NEGATIVE_INFINITY, val7: double = Double.NEGATIVE_INFINITY
      let key8: double = Double.NEGATIVE_INFINITY, val8: double = Double.POSITIVE_INFINITY
      let key9: double = Double.POSITIVE_INFINITY, val9: double = Double.POSITIVE_INFINITY
      let key10: double = Double.POSITIVE_INFINITY, val10: double = Double.NEGATIVE_INFINITY
      let key11: double = Double.NaN, val11: double = 42.0
      let key12: double = Double.NaN, val12: double = 84.0

      let r: Record<double, double> = {}
      r[key1] = val1
      expect(r[key1] == val1).assertTrue()
      r[key2] = val2
      expect(r[key2] == val2).assertTrue()
      r[key3] = val3
      expect(r[key3] == val3).assertTrue()
      r[key4] = val4
      expect(r[key4] == val4).assertTrue()
      r[key5] = val5
      expect(r[key5] == val5).assertTrue()
      r[key6] = val6
      expect(r[key6] == val6).assertTrue()
      r[key7] = val7
      expect(r[key7] == val7).assertTrue()
      r[key8] = val8
      expect(r[key8] == val8).assertTrue()
      r[key9] = val9
      expect(r[key9] == val9).assertTrue()
      r[key10] = val10
      expect(r[key10] == val10).assertTrue()
      r[key11] = val11
      expect(r[key11] == val11).assertTrue()
      r[key12] = val12
      expect(r[key12] == val12).assertTrue()
    })

    /**
     * @tc.number    SUB_RECORD_UTILITY_TYPE_2800
     * @tc.name      testRecordUtilityType0028
     * @tc.desc      Type K is restricted to numeric types, type string, string literal types, enum
     *               types, and union types constructed from these types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRecordUtilityType0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let key1: string = "a", val1: string = ""
      let key2: string = "a", val2: string = "\u0000"
      let key3: string = "\u0000", val3: string = ""
      let key4: string = "\u0000", val4: string = "a"
      let key5: string = " ", val5: string = " "
      let key6: string = " ", val6: string = "  "

      let r: Record<string, string> = {}
      r[key1] = val1
      expect(r[key1] == val1).assertTrue()
      r[key2] = val2
      expect(r[key2] == val2).assertTrue()
      r[key3] = val3
      expect(r[key3] == val3).assertTrue()
      r[key4] = val4
      expect(r[key4] == val4).assertTrue()
      r[key5] = val5
      expect(r[key5] == val5).assertTrue()
      r[key6] = val6
      expect(r[key6] == val6).assertTrue()
    })

    /**
     * @tc.number    SUB_RECORD_UTILITY_TYPE_2900
     * @tc.name      testRecordUtilityType0029
     * @tc.desc      Type K is restricted to numeric types, type string, string literal types, enum
     *               types, and union types constructed from these types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRecordUtilityType0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let key1: byte|string = 0, val1: byte|string = 0
      let key2: byte|string = 0, val2: byte|string = 55
      let key3: byte|string = Byte.MIN_VALUE, val3: byte|string = Byte.MIN_VALUE
      let key4: byte|string = Byte.MIN_VALUE, val4: byte|string = Byte.MAX_VALUE
      let key5: byte|string = Byte.MAX_VALUE, val5: byte|string = Byte.MAX_VALUE
      let key6: byte|string = Byte.MAX_VALUE, val6: byte|string = Byte.MIN_VALUE
      let key7: byte|string = "a", val7: byte|string = ""
      let key8: byte|string = "a", val8: byte|string = "\u0000"
      let key9: byte|string = "\u0000", val9: byte|string = ""
      let key10: byte|string = "\u0000", val10: byte|string = "a"
      let key11: byte|string = " ", val11: byte|string = " "
      let key12: byte|string = " ", val12: byte|string = "  "

      let r: Record<byte|string, byte|string> = {}
      r[key1] = val1
      expect(r[key1] == val1).assertTrue()
      r[key2] = val2
      expect(r[key2] == val2).assertTrue()
      r[key3] = val3
      expect(r[key3] == val3).assertTrue()
      r[key4] = val4
      expect(r[key4] == val4).assertTrue()
      r[key5] = val5
      expect(r[key5] == val5).assertTrue()
      r[key6] = val6
      expect(r[key6] == val6).assertTrue()
      r[key7] = val7
      expect(r[key7] == val7).assertTrue()
      r[key8] = val8
      expect(r[key8] == val8).assertTrue()
      r[key9] = val9
      expect(r[key9] == val9).assertTrue()
      r[key10] = val10
      expect(r[key10] == val10).assertTrue()
      r[key11] = val11
      expect(r[key11] == val11).assertTrue()
      r[key12] = val12
      expect(r[key12] == val12).assertTrue()
    })

    /**
     * @tc.number    SUB_RECORD_UTILITY_TYPE_3000
     * @tc.name      testRecordUtilityType0030
     * @tc.desc      Type K is restricted to numeric types, type string, string literal types, enum
     *               types, and union types constructed from these types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRecordUtilityType0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let key1: short|string = 0, val1: short|string = 0
      let key2: short|string = 0, val2: short|string = 55
      let key3: short|string = Short.MIN_VALUE, val3: short|string = Short.MIN_VALUE
      let key4: short|string = Short.MIN_VALUE, val4: short|string = Short.MAX_VALUE
      let key5: short|string = Short.MAX_VALUE, val5: short|string = Short.MAX_VALUE
      let key6: short|string = Short.MAX_VALUE, val6: short|string = Short.MIN_VALUE
      let key7: short|string = "a", val7: short|string = ""
      let key8: short|string = "a", val8: short|string = "\u0000"
      let key9: short|string = "\u0000", val9: short|string = ""
      let key10: short|string = "\u0000", val10: short|string = "a"
      let key11: short|string = " ", val11: short|string = " "
      let key12: short|string = " ", val12: short|string = "  "

      let r: Record<short|string, short|string> = {}
      r[key1] = val1
      expect(r[key1] == val1).assertTrue()
      r[key2] = val2
      expect(r[key2] == val2).assertTrue()
      r[key3] = val3
      expect(r[key3] == val3).assertTrue()
      r[key4] = val4
      expect(r[key4] == val4).assertTrue()
      r[key5] = val5
      expect(r[key5] == val5).assertTrue()
      r[key6] = val6
      expect(r[key6] == val6).assertTrue()
      r[key7] = val7
      expect(r[key7] == val7).assertTrue()
      r[key8] = val8
      expect(r[key8] == val8).assertTrue()
      r[key9] = val9
      expect(r[key9] == val9).assertTrue()
      r[key10] = val10
      expect(r[key10] == val10).assertTrue()
      r[key11] = val11
      expect(r[key11] == val11).assertTrue()
      r[key12] = val12
      expect(r[key12] == val12).assertTrue()
    })

    /**
     * @tc.number    SUB_RECORD_UTILITY_TYPE_3100
     * @tc.name      testRecordUtilityType0031
     * @tc.desc      Type K is restricted to numeric types, type string, string literal types, enum
     *               types, and union types constructed from these types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRecordUtilityType0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let key1: int|string = 0, val1: int|string = 0
      let key2: int|string = 0, val2: int|string = 55
      let key3: int|string = Int.MIN_VALUE, val3: int|string = Int.MIN_VALUE
      let key4: int|string = Int.MIN_VALUE, val4: int|string = Int.MAX_VALUE
      let key5: int|string = Int.MAX_VALUE, val5: int|string = Int.MAX_VALUE
      let key6: int|string = Int.MAX_VALUE, val6: int|string = Int.MIN_VALUE
      let key7: int|string = "a", val7: int|string = ""
      let key8: int|string = "a", val8: int|string = "\u0000"
      let key9: int|string = "\u0000", val9: int|string = ""
      let key10: int|string = "\u0000", val10: int|string = "a"
      let key11: int|string = " ", val11: int|string = " "
      let key12: int|string = " ", val12: int|string = "  "

      let r: Record<int|string, int|string> = {}
      r[key1] = val1
      expect(r[key1] == val1).assertTrue()
      r[key2] = val2
      expect(r[key2] == val2).assertTrue()
      r[key3] = val3
      expect(r[key3] == val3).assertTrue()
      r[key4] = val4
      expect(r[key4] == val4).assertTrue()
      r[key5] = val5
      expect(r[key5] == val5).assertTrue()
      r[key6] = val6
      expect(r[key6] == val6).assertTrue()
      r[key7] = val7
      expect(r[key7] == val7).assertTrue()
      r[key8] = val8
      expect(r[key8] == val8).assertTrue()
      r[key9] = val9
      expect(r[key9] == val9).assertTrue()
      r[key10] = val10
      expect(r[key10] == val10).assertTrue()
      r[key11] = val11
      expect(r[key11] == val11).assertTrue()
      r[key12] = val12
      expect(r[key12] == val12).assertTrue()
    })

    /**
     * @tc.number    SUB_RECORD_UTILITY_TYPE_3200
     * @tc.name      testRecordUtilityType0032
     * @tc.desc      Type K is restricted to numeric types, type string, string literal types, enum
     *               types, and union types constructed from these types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRecordUtilityType0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let key1: long|string = 0, val1: long|string = 0
      let key2: long|string = 0, val2: long|string = 55
      let key3: long|string = Long.MIN_VALUE, val3: long|string = Long.MIN_VALUE
      let key4: long|string = Long.MIN_VALUE, val4: long|string = Long.MAX_VALUE
      let key5: long|string = Long.MAX_VALUE, val5: long|string = Long.MAX_VALUE
      let key6: long|string = Long.MAX_VALUE, val6: long|string = Long.MIN_VALUE
      let key7: long|string = "a", val7: long|string = ""
      let key8: long|string = "a", val8: long|string = "\u0000"
      let key9: long|string = "\u0000", val9: long|string = ""
      let key10: long|string = "\u0000", val10: long|string = "a"
      let key11: long|string = " ", val11: long|string = " "
      let key12: long|string = " ", val12: long|string = "  "

      let r: Record<long|string, long|string> = {}
      r[key1] = val1
      expect(r[key1] == val1).assertTrue()
      r[key2] = val2
      expect(r[key2] == val2).assertTrue()
      r[key3] = val3
      expect(r[key3] == val3).assertTrue()
      r[key4] = val4
      expect(r[key4] == val4).assertTrue()
      r[key5] = val5
      expect(r[key5] == val5).assertTrue()
      r[key6] = val6
      expect(r[key6] == val6).assertTrue()
      r[key7] = val7
      expect(r[key7] == val7).assertTrue()
      r[key8] = val8
      expect(r[key8] == val8).assertTrue()
      r[key9] = val9
      expect(r[key9] == val9).assertTrue()
      r[key10] = val10
      expect(r[key10] == val10).assertTrue()
      r[key11] = val11
      expect(r[key11] == val11).assertTrue()
      r[key12] = val12
      expect(r[key12] == val12).assertTrue()
    })

    /**
     * @tc.number    SUB_RECORD_UTILITY_TYPE_3300
     * @tc.name      testRecordUtilityType0033
     * @tc.desc      Type K is restricted to numeric types, type string, string literal types, enum
     *               types, and union types constructed from these types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRecordUtilityType0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let key1: float|string = 0.0f, val1: float|string = 0.0f
      let key2: float|string = 0.0f, val2: float|string = 55.0f
      let key3: float|string = Float.MIN_VALUE, val3: float|string = Float.MIN_VALUE
      let key4: float|string = Float.MIN_VALUE, val4: float|string = Float.MAX_VALUE
      let key5: float|string = Float.MAX_VALUE, val5: float|string = Float.MAX_VALUE
      let key6: float|string = Float.MAX_VALUE, val6: float|string = Float.MIN_VALUE
      let key7: float|string = Float.NEGATIVE_INFINITY, val7: float|string = Float.NEGATIVE_INFINITY
      let key8: float|string = Float.NEGATIVE_INFINITY, val8: float|string = Float.POSITIVE_INFINITY
      let key9: float|string = Float.POSITIVE_INFINITY, val9: float|string = Float.POSITIVE_INFINITY
      let key10: float|string = Float.POSITIVE_INFINITY, val10: float|string = Float.NEGATIVE_INFINITY
      let key11: float|string = Float.NaN, val11: float|string = 42.0f
      let key12: float|string = Float.NaN, val12: float|string = 84.0f
      let key13: float|string = "a", val13: float|string = ""
      let key14: float|string = "a", val14: float|string = "\u0000"
      let key15: float|string = "\u0000", val15: float|string = ""
      let key16: float|string = "\u0000", val16: float|string = "a"
      let key17: float|string = " ", val17: float|string = " "
      let key18: float|string = " ", val18: float|string = "  "

      let r: Record<float|string, float|string> = {}
      r[key1] = val1
      expect(r[key1] == val1).assertTrue()
      r[key2] = val2
      expect(r[key2] == val2).assertTrue()
      r[key3] = val3
      expect(r[key3] == val3).assertTrue()
      r[key4] = val4
      expect(r[key4] == val4).assertTrue()
      r[key5] = val5
      expect(r[key5] == val5).assertTrue()
      r[key6] = val6
      expect(r[key6] == val6).assertTrue()
      r[key7] = val7
      expect(r[key7] == val7).assertTrue()
      r[key8] = val8
      expect(r[key8] == val8).assertTrue()
      r[key9] = val9
      expect(r[key9] == val9).assertTrue()
      r[key10] = val10
      expect(r[key10] == val10).assertTrue()
      r[key11] = val11
      expect(r[key11] == val11).assertTrue()
      r[key12] = val12
      expect(r[key12] == val12).assertTrue()
      r[key13] = val13
      expect(r[key13] == val13).assertTrue()
      r[key14] = val14
      expect(r[key14] == val14).assertTrue()
      r[key15] = val15
      expect(r[key15] == val15).assertTrue()
      r[key16] = val16
      expect(r[key16] == val16).assertTrue()
      r[key17] = val17
      expect(r[key17] == val17).assertTrue()
      r[key18] = val18
      expect(r[key18] == val18).assertTrue()
    })

    /**
     * @tc.number    SUB_RECORD_UTILITY_TYPE_3400
     * @tc.name      testRecordUtilityType0034
     * @tc.desc      Type K is restricted to numeric types, type string, string literal types, enum
     *               types, and union types constructed from these types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRecordUtilityType0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let key1: double|string = 0.0, val1: double|string = 0.0
      let key2: double|string = 0.0, val2: double|string = 55.0
      let key3: double|string = Double.MIN_VALUE, val3: double|string = Double.MIN_VALUE
      let key4: double|string = Double.MIN_VALUE, val4: double|string = Double.MAX_VALUE
      let key5: double|string = Double.MAX_VALUE, val5: double|string = Double.MAX_VALUE
      let key6: double|string = Double.MAX_VALUE, val6: double|string = Double.MIN_VALUE
      let key7: double|string = Double.NEGATIVE_INFINITY, val7: double|string = Double.NEGATIVE_INFINITY
      let key8: double|string = Double.NEGATIVE_INFINITY, val8: double|string = Double.POSITIVE_INFINITY
      let key9: double|string = Double.POSITIVE_INFINITY, val9: double|string = Double.POSITIVE_INFINITY
      let key10: double|string = Double.POSITIVE_INFINITY, val10: double|string = Double.NEGATIVE_INFINITY
      let key11: double|string = Double.NaN, val11: double|string = 42.0
      let key12: double|string = Double.NaN, val12: double|string = 84.0
      let key13: double|string = "a", val13: double|string = ""
      let key14: double|string = "a", val14: double|string = "\u0000"
      let key15: double|string = "\u0000", val15: double|string = ""
      let key16: double|string = "\u0000", val16: double|string = "a"
      let key17: double|string = " ", val17: double|string = " "
      let key18: double|string = " ", val18: double|string = "  "

      let r: Record<double|string, double|string> = {}
      r[key1] = val1
      expect(r[key1] == val1).assertTrue()
      r[key2] = val2
      expect(r[key2] == val2).assertTrue()
      r[key3] = val3
      expect(r[key3] == val3).assertTrue()
      r[key4] = val4
      expect(r[key4] == val4).assertTrue()
      r[key5] = val5
      expect(r[key5] == val5).assertTrue()
      r[key6] = val6
      expect(r[key6] == val6).assertTrue()
      r[key7] = val7
      expect(r[key7] == val7).assertTrue()
      r[key8] = val8
      expect(r[key8] == val8).assertTrue()
      r[key9] = val9
      expect(r[key9] == val9).assertTrue()
      r[key10] = val10
      expect(r[key10] == val10).assertTrue()
      r[key11] = val11
      expect(r[key11] == val11).assertTrue()
      r[key12] = val12
      expect(r[key12] == val12).assertTrue()
      r[key13] = val13
      expect(r[key13] == val13).assertTrue()
      r[key14] = val14
      expect(r[key14] == val14).assertTrue()
      r[key15] = val15
      expect(r[key15] == val15).assertTrue()
      r[key16] = val16
      expect(r[key16] == val16).assertTrue()
      r[key17] = val17
      expect(r[key17] == val17).assertTrue()
      r[key18] = val18
      expect(r[key18] == val18).assertTrue()
    })

    /**
     * @tc.number    SUB_RECORD_UTILITY_TYPE_3500
     * @tc.name      testRecordUtilityType0035
     * @tc.desc      Type K is restricted to numeric types, type string, string literal types, enum
     *               types, and union types constructed from these types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRecordUtilityType0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let key1: Color_0 = Color_0.Red, val1: Color_0 = Color_0.Red
      let key2: Color_0 = Color_0.Green, val2: Color_0 = Color_0.Green
      let key3: Color_0 = Color_0.Blue, val3: Color_0 = Color_0.Blue

      let r: Record<Color_0, Color_0> = {}
      r[key1] = val1
      expect(r[key1] == val1).assertTrue()
      r[key2] = val2
      expect(r[key2] == val2).assertTrue()
      r[key3] = val3
      expect(r[key3] == val3).assertTrue()
    })

    /**
     * @tc.number    SUB_RECORD_UTILITY_TYPE_3600
     * @tc.name      testRecordUtilityType0036
     * @tc.desc      Type K is restricted to numeric types, type string, string literal types, enum
     *               types, and union types constructed from these types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRecordUtilityType0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let key1: Commands_0 = Commands_0.Open, val1: Commands_0 = Commands_0.Open
      let key2: Commands_0 = Commands_0.Close, val2: Commands_0 = Commands_0.Close

      let r: Record<Commands_0, Commands_0> = {}
      r[key1] = val1
      expect(r[key1] == val1).assertTrue()
      r[key2] = val2
      expect(r[key2] == val2).assertTrue()
    })

    /**
     * @tc.number    SUB_RECORD_UTILITY_TYPE_3700
     * @tc.name      testRecordUtilityType0037
     * @tc.desc      Type K is restricted to numeric types, type string, string literal types, enum
     *               types, and union types constructed from these types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRecordUtilityType0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let key1: CC_0 = Commands_0.Open, val1: CC_0 = Commands_0.Open
      let key2: CC_0 = Commands_0.Close, val2: CC_0 = Commands_0.Close
      let key3: CC_0 = Color_0.Red, val3: CC_0 = Color_0.Red
      let key4: CC_0 = Color_0.Green, val4: CC_0 = Color_0.Green
      let key5: CC_0 = Color_0.Blue, val5: CC_0 = Color_0.Blue

      let r: Record<CC_0, CC_0> = {}
      r[key1] = val1
      expect(r[key1] == val1).assertTrue()
      r[key2] = val2
      expect(r[key2] == val2).assertTrue()
      r[key3] = val3
      expect(r[key3] == val3).assertTrue()
      r[key4] = val4
      expect(r[key4] == val4).assertTrue()
      r[key5] = val5
      expect(r[key5] == val5).assertTrue()
    })

    /**
     * @tc.number    SUB_RECORD_UTILITY_TYPE_3800
     * @tc.name      testRecordUtilityType0038
     * @tc.desc      Type K is restricted to numeric types, type string, string literal types, enum
     *               types, and union types constructed from these types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRecordUtilityType0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Record<"a"|"b"|"c", "a"|"b"|"c"> = {
        "a": "a",
        "b": "b",
        "c": "c",
      }
      expect(r["a"] == "a").assertTrue()
      expect(r["b"] == "b").assertTrue()
      expect(r["c"] == "c").assertTrue()
      r["a"] = "b"
      expect(r["a"] == "b").assertTrue()
      r["b"] = "c"
      expect(r["b"] == "c").assertTrue()
      r["c"] = "a"
      expect(r["c"] == "a").assertTrue()
    })

    /**
     * @tc.number    SUB_RECORD_UTILITY_TYPE_3900
     * @tc.name      testRecordUtilityType0039
     * @tc.desc      Type K is restricted to numeric types, type string, string literal types, enum
     *               types, and union types constructed from these types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRecordUtilityType0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Record<""|" "|"  ", ""|" "|"  "> = {
        "": "",
        " ": " ",
        "  ": "  ",
      }
      expect(r[""] == "").assertTrue()
      expect(r[" "] == " ").assertTrue()
      expect(r["  "] == "  ").assertTrue()
      r[""] = " "
      expect(r[""] == " ").assertTrue()
      r[" "] = "  "
      expect(r[" "] == "  ").assertTrue()
      r["  "] = ""
      expect(r["  "] == "").assertTrue()
    })
  });
}