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
} from "../../../../../../hypium";

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

let dynamicRecord: Record<string, number> = {}

function setValue(key: string, value: number) {
  dynamicRecord[key] = value
}

let res_ind2: string = ""
let rec_ind2: Record<string, number> = { "1": 42 }

function get_ref_ind2(fail: boolean): Record<string, number> {
  res_ind2 += " ref"
  if (fail) throw new Error()
  return rec_ind2
}

function get_idx_ind2(fail: boolean, idx: string): string {
  res_ind2 += " idx"
  if (fail) throw new Error()
  return idx
}

function refNotNullish_indx1a(): Record<string, number> {
  let res: Record<string, number> = { "magic": 42 }
  return res
}

function refNullish_record_access_0(): Record<string, number>|null {
  let res: Record<string, number>|null = { "magic": 42 }
  return res
}

function refNullish_record_access_1(): Record<string, number>|undefined {
  let res: Record<string, number>|undefined = { "magic": 42 }
  return res
}

function refNullish_record_access_2(): Record<string, number>|null {
  let res: Record<string, number>|null = null
  return res
}

function refNullish_record_access_3(): Record<string, number>|undefined {
  let res: Record<string, number>|undefined = undefined
  return res
}

function foo(p: int): string {
  return "" + p
}

function foo1(p: int): long {
  let arr: long[] = [0, -9223372036854775808, 9223372036854775807, 99]
  return arr[p]
}


let y_record_cast_index: Record<string, string> = {
  "name": "Alice",
  "age": "30"
}

function spreadFromObject_record_cast_index(y: Record<string, string>): Record<string, string> {
  let x: Record<string, string> = { ...y }
  return x
}

function getValue_record_cast_index(key: string, defaultValue: string): string {
  let x = spreadFromObject_record_cast_index(y_record_cast_index)
  return x[key] ?? defaultValue
}

type Keys_record_field_access = 'key1' | 'key2' | 'key3'

let x_record_field_access: Record<Keys_record_field_access, number> = {
  'key1': 1,
  'key2': 2,
  'key3': 4
}

type Keys_record_field_set = 'key1' | 'key2' | 'key3'

let x_record_field_set: Record<Keys_record_field_set, number> = {
  'key1': 1,
  'key2': 2,
  'key3': 4
}

let x_record_number_index: Record<number, string> = {
  1: "hello",
  2: "buy"
}

function foo_record_number_index(n: number): string|undefined {
  return x_record_number_index[n]
}

function bar_record_number_index(n: number): string {
  let s = x_record_number_index[n]
  if (s == undefined) { return "no" }
  return s!
}

let rec_record_string_index: Record<string, number> = {
  "a": 1,
  "b": 2,
  "c": 3
}

function getValue_record_string_index(key: string): number|undefined {
  return rec_record_string_index[key]
}

function getValueOrDefault_record_string_index(key: string, defaultValue: number): number {
  return rec_record_string_index[key] ?? defaultValue
}

type Keys_record_union_type_index = 'key1' | 'key2' | 'key3'

let x_record_union_type_index: Record<Keys_record_union_type_index, number> = {
  'key1': 1,
  'key2': 2,
  'key3': 4
}


export default function ExpressionsIndexingRecordTest(): void {
  describe("ExpressionsIndexingRecordTest", () => {
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
     * @tc.number    SUB_EXPRESSIONS_INDEXING_RECORD_0100
     * @tc.name      testExpressionsIndexingRecord0001
     * @tc.desc      Record index expression - the keys of the record are dynamically generated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingRecord0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      dynamicRecord = {}
      setValue("key1", 10)
      setValue("key2", 20)
      expect(dynamicRecord["key1"]).assertEqual(10)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_RECORD_0200
     * @tc.name      testExpressionsIndexingRecord0002
     * @tc.desc      Record index expression - the keys of the record are dynamically generated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingRecord0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      dynamicRecord = {}
      setValue("key1", 10)
      setValue("key2", 20)
      expect(dynamicRecord["key2"]).assertEqual(20)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_RECORD_0300
     * @tc.name      testExpressionsIndexingRecord0003
     * @tc.desc      Record index expression - the keys of the record are dynamically generated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingRecord0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      dynamicRecord = {}
      setValue("key1", 10)
      setValue("key2", 20)
      expect(dynamicRecord["key3"]).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_RECORD_0400
     * @tc.name      testExpressionsIndexingRecord0004
     * @tc.desc      For a Record<Key, Value> indexing, the index expression must be of type Key.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingRecord0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // key is a union of literal types
      let idx: short = 0
      let r: Record<"1"|"2"|"3", Short> = {
        "1": (idx += 1) as Short,
        "2": idx++ as Short,
        "3": ++idx as Short,
      }
      expect(idx).assertEqual(3)
      expect(r["1"] == 1 && r["2"] == 1 && r["3"] == 3).assertTrue()
      r["1"] = new Short(10)
      r["2"] = new Short(20)
      r["3"] = new Short(30)
      expect(r["1"] == 10 && r["2"] == 20 && r["3"] == 30).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_RECORD_0500
     * @tc.name      testExpressionsIndexingRecord0005
     * @tc.desc      For a Record<Key, Value> indexing, the index expression must be of type Key.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingRecord0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // key is a union of literal types
      let idx: Short = 0
      let r: Record<"11"|"12"|"13", Short> = {
        "11": idx,
        "12": idx,
        "13": idx,
      }
      let i = "11"
      expect(r[i]).assertEqual(0)
      expect(r["12"]).assertEqual(0)
      expect(r["13"]).assertEqual(0)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_RECORD_0600
     * @tc.name      testExpressionsIndexingRecord0006
     * @tc.desc      For a Record<Key, Value> indexing, the index expression must be of type Key.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingRecord0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // key is a union of literal types and string, literals in indices
      let idx: int = 0
      let r: Record<"1"|"2"|"3"|string, Int> = {
        "1": new Int(idx + 1),
        "2": new Int(idx + 2),
      }
      expect(r["1"] == 1 && r["2"] == 2 && r["3"] == undefined).assertTrue()
      r["1"] = new Int(90)
      r["3"] = new Int(92)
      expect(r["1"] == 90 && r["2"] == 2 && r["3"] == 92).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_RECORD_0700
     * @tc.name      testExpressionsIndexingRecord0007
     * @tc.desc      For a Record<Key, Value> indexing, the index expression must be of type Key.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingRecord0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // key is a union of literal types and string, expression in index
      let idx: int = 0
      let r: Record<string|"1"|"2"|"3", Int> = {
        "1": new Int(idx + 1),
        "2": new Int(idx + 2),
      }
      let i1 = "1"
      let i2 = "2"
      expect(r[i1] == 1 && r[i2] == 2 && r[i1 + i2] == undefined).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_RECORD_0800
     * @tc.name      testExpressionsIndexingRecord0008
     * @tc.desc      For a Record<Key, Value> indexing, the index expression must be of type Key.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingRecord0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // key is a union of literal types and string, expression in index
      let idx: number = 0
      let r: Record<"1"|"2"|"3"|string, Number> = {
        "1": new Number(idx + 1),
        "2": new Number(idx + 2),
      }
      expect(r[foo(1)] == 1 && r[foo(2)] == 2 && r[foo(3)] == undefined).assertTrue()
      r[foo(1)] = new Number(99)
      expect(r["1"] == 99 && r["2"] == 2 && r["3"] == undefined).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_RECORD_0900
     * @tc.name      testExpressionsIndexingRecord0009
     * @tc.desc      For a Record<Key, Value> indexing, the index expression must be of type Key.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingRecord0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // key is of numeric type
      const b0: byte = 0
      const b_max: byte = 127  // Byte.MAX_VALUE
      const b_min: byte = -128 // Byte.MIN_VALUE
      let r: Record<Byte, Byte|null> = {}
      r[new Byte(b0)] = null
      r[new Byte(b_max)] = new Byte(b_max)
      r[new Byte(b_min)] = new Byte(b_min)
      expect(r[new Byte(b0)] === null && r[new Byte(b_max)] == b_max && r[new Byte(b_min)] == b_min).assertTrue()
      expect(r[new Byte(99)]).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_RECORD_1000
     * @tc.name      testExpressionsIndexingRecord0010
     * @tc.desc      For a Record<Key, Value> indexing, the index expression must be of type Key.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingRecord0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // key is of numeric type, constants
      const s0: short = 0
      const s_max: short = 32767  // Short.MAX_VALUE
      const s_min: short = -32768 // Short.MIN_VALUE
      let r: Record<Short, Short|undefined> = {}
      r[new Short(s0)] = undefined
      r[new Short(s_min)] = new Short(s_min)
      r[new Short(s_max)] = new Short(s_max)
      expect(r[new Short(s0)] === undefined && r[new Short(s_min)] == s_min && r[new Short(s_max)] == s_max).assertTrue()
      expect(r[new Short(99)]).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_RECORD_1100
     * @tc.name      testExpressionsIndexingRecord0011
     * @tc.desc      For a Record<Key, Value> indexing, the index expression must be of type Key.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingRecord0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // key is of numeric type, variables
      const v0 = 0
      const v1 = 1
      const v_max = 2147483647  // Int.MAX_VALUE
      const v_min = -2147483648 // Int.MIN_VALUE
      let r: Record<Int, Int|null|undefined> = { 1: new Int(v1) }
      r[new Int(v0)] = null
      r[new Int(v1)] = undefined
      r[new Int(v_min)] = new Int(v_min)
      r[new Int(v_max)] = new Int(v_max)
      expect(r[new Int(v0)] === null && r[new Int(v1)] === undefined && r[new Int(v_min)] == v_min && r[new Int(v_max)] == v_max).assertTrue()
      expect(r[new Int(99)]).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_RECORD_1200
     * @tc.name      testExpressionsIndexingRecord0012
     * @tc.desc      For a Record<Key, Value> indexing, the index expression must be of type Key.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingRecord0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // key is of numeric type, function call expressions
      let r: Record<Long, Long> = {}
      r[new Long(foo1(0))] = new Long()
      r[new Long(foo1(1))] = new Long(-9223372036854775808)
      r[new Long(foo1(2))] = new Long(9223372036854775807)
      expect(r[new Long(foo1(0))] == 0 && r[new Long(foo1(1))] == -9223372036854775808 && r[new Long(foo1(2))] == 9223372036854775807).assertTrue()
      expect(r[new Long(foo1(3))]).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_RECORD_1300
     * @tc.name      testExpressionsIndexingRecord0013
     * @tc.desc      For a Record<Key, Value> indexing, the index expression must be of type Key.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingRecord0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // key is of numeric type, array access expressions
      let arr: Float[] = [
        new Float(0.0), 
        new Float(1.4e-45),  // Float.MIN_VALUE
        new Float(3.4028235e38),  // Float.MAX_VALUE
        new Float(-Infinity),  // Float.NEGATIVE_INFINITY
        new Float(Infinity),   // Float.POSITIVE_INFINITY
        new Float(NaN)         // Float.NaN
      ]
      let r: Record<Float, Float|string> = { 1.0: new Float(1.0) }
      r[arr[0]] = new Float(0.0)
      r[arr[1]] = new Float(1.4e-45)
      r[arr[2]] = new Float(3.4028235e38)
      r[arr[3]] = new Float(-Infinity)
      r[arr[4]] = new Float(Infinity)
      r[arr[5]] = new Float(NaN)
      expect(r[arr[3]] == -Infinity && r[arr[4]] == Infinity).assertTrue()
      expect(isNaN(r[arr[5]] as Float) && r[99.0]).assertEqual(undefined)
      r[arr[3]] = "3"
      r[arr[4]] = "4"
      r[arr[5]] = "5"
      expect(r[arr[3]] == "3" && r[arr[4]] == "4").assertTrue()
      expect(r[arr[5]] == "5" && r[99.0]).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_RECORD_1400
     * @tc.name      testExpressionsIndexingRecord0014
     * @tc.desc      For a Record<Key, Value> indexing, the index expression must be of type Key.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingRecord0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // key is a union of numeric and string
      const b0: byte = 0
      const b_max: byte = 127
      const b_min: byte = -128
      let r: Record<Byte|string, Byte|null> = {}
      r[new Byte(b0)] = null
      r[new Byte(b_max)] = new Byte(b_max)
      r[new Byte(b_min)] = new Byte(b_min)
      r["" + b0] = null
      r["" + b_max] = new Byte(b_max)
      r["" + b_min] = new Byte(b_min)
      expect(r[new Byte(b0)] === null && r[new Byte(b_max)] == b_max && r[new Byte(b_min)] == b_min).assertTrue()
      expect(r["" + b0] === null && r["" + b_max] == b_max && r["" + b_min] == b_min).assertTrue()
      expect(r[new Byte(99)]).assertEqual(undefined)
      expect(r["99"]).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_RECORD_1500
     * @tc.name      testExpressionsIndexingRecord0015
     * @tc.desc      For a Record<Key, Value> indexing, the index expression must be of type Key.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingRecord0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // key is of numeric type, constants
      const s0: short = 0
      const s_max: short = 32767
      const s_min: short = -32768
      let r: Record<String|Short, Short|undefined> = {}
      r[new Short(s0)] = undefined
      r[new Short(s_min)] = new Short(s_min)
      r[new Short(s_max)] = new Short(s_max)
      r["" + s0] = undefined
      r["" + s_min] = new Short(s_min)
      r["" + s_max] = new Short(s_max)
      expect(r[new Short(s0)] === undefined && r[new Short(s_min)] == s_min && r[new Short(s_max)] == s_max).assertTrue()
      expect(r["" + s0] === undefined && r["" + s_min] == s_min && r["" + s_max] == s_max).assertTrue()
      expect(r[new Short(99)]).assertEqual(undefined)
      expect(r["99"]).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_RECORD_1600
     * @tc.name      testExpressionsIndexingRecord0016
     * @tc.desc      For a Record<Key, Value> indexing, the index expression must be of type Key.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingRecord0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // key is of numeric type, array access expressions
      let arr: Double[] = [
        new Double(0.0),
        new Double(5e-324),  // Double.MIN_VALUE
        new Double(1.7976931348623157e308),  // Double.MAX_VALUE
        new Double(-Infinity),  // Double.NEGATIVE_INFINITY
        new Double(Infinity),   // Double.POSITIVE_INFINITY
        new Double(NaN)         // Double.NaN
      ]
      let r: Record<Double|string, Double|string> = { 1.0: new Double(1.0) }
      
      // double -> double
      r[arr[0]] = new Double(0.0)
      r[arr[1]] = new Double(5e-324)
      r[arr[2]] = new Double(1.7976931348623157e308)
      r[arr[3]] = new Double(-Infinity)
      r[arr[4]] = new Double(Infinity)
      r[arr[5]] = new Double(NaN)
      expect(r[arr[0]] == 0.0 && r[arr[1]] == 5e-324 && r[arr[2]] == 1.7976931348623157e308).assertTrue()
      expect(r[arr[3]] == -Infinity && r[arr[4]] == Infinity).assertTrue()
      expect(isNaN(r[arr[5]] as Double) && r[99.0] === undefined).assertTrue()
      
      // double -> string
      r[arr[3]] = "3"
      r[arr[4]] = "4"
      r[arr[5]] = "5"
      expect(r[arr[0]] == 0.0 && r[arr[1]] == 5e-324 && r[arr[2]] == 1.7976931348623157e308).assertTrue()
      expect(r[arr[3]] == "3" && r[arr[4]] == "4").assertTrue()
      expect(r[arr[5]] == "5" && r[99.0]).assertEqual(undefined)
      
      // string -> double
      r["" + arr[0]] = new Double(0.0)
      r["" + arr[1]] = new Double(5e-324)
      r["" + arr[2]] = new Double(1.7976931348623157e308)
      r["" + arr[3]] = new Double(-Infinity)
      r["" + arr[4]] = new Double(Infinity)
      r["" + arr[5]] = new Double(NaN)
      expect(r["" + arr[0]] == 0.0 && r["" + arr[1]] == 5e-324 && r["" + arr[2]] == 1.7976931348623157e308).assertTrue()
      expect(r["" + arr[3]] == -Infinity && r["" + arr[4]] == Infinity).assertTrue()
      expect(isNaN(r["" + arr[5]] as Double) && r["99"] === undefined).assertTrue()
      
      // string -> string
      r["" + arr[3]] = "3"
      r["" + arr[4]] = "4"
      r["" + arr[5]] = "5"
      expect(r["" + arr[0]] == 0.0 && r["" + arr[1]] == 5e-324 && r["" + arr[2]] == 1.7976931348623157e308).assertTrue()
      expect(r["" + arr[3]] == "3" && r["" + arr[4]] == "4").assertTrue()
      expect(r["" + arr[5]] == "5" && r["99"]).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_RECORD_1700
     * @tc.name      testExpressionsIndexingRecord0017
     * @tc.desc      For a Record<Key, Value> indexing, the index expression must be of type Key.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingRecord0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // key is a union of number and string
      let r: Record<number|string, Number|undefined> = {
        0: new Number(0),
        1: new Number(1),
        2: new Number(2),
        "0": new Number(10),
        "1": new Number(11),
        "2": new Number(12),
      }
      expect(r[0] == 0 && r[1] == 1 && r[2] == 2 && r["0"] == 10 && r["1"] == 11 && r["2"] == 12 && r[3] == undefined && r["3"] == undefined).assertTrue()
      r[1] = new Number(100)
      r["1"] = new Number(101)
      expect(r[0] == 0 && r[1] == 100 && r[2] == 2 && r["0"] == 10 && r["1"] == 101 && r["2"] == 12 && r[3] == undefined && r["3"] == undefined).assertTrue()
      r["0"] = new Number(300)
      r[0] = new Number(301)
      expect(r[0] == 301 && r[1] == 100 && r[2] == 2 && r["0"] == 300 && r["1"] == 101 && r["2"] == 12 && r[3] == undefined && r["3"] == undefined).assertTrue()
      r["2"] = undefined
      expect(r[0] == 301 && r[1] == 100 && r[2] == 2 && r["0"] == 300 && r["1"] == 101 && r["2"] == undefined && r[3] == undefined && r["3"] == undefined).assertTrue()
      r[2] = undefined
      expect(r[0] == 301 && r[1] == 100 && r[2] == undefined && r["0"] == 300 && r["1"] == 101 && r["2"] == undefined && r[3] == undefined && r["3"] == undefined).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_RECORD_1800
     * @tc.name      testExpressionsIndexingRecord0018
     * @tc.desc      Indexing expression evaluation order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingRecord0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      res_ind2 = ""
      let v: number|undefined = 99
      let result: string = ""

      try {
        v = get_ref_ind2(false)[get_idx_ind2(false, "1")]
        result = " passed " + v
      } catch (e) {
        result = " failed " + v
      }
      expect(res_ind2 + result).assertEqual(" ref idx passed 42")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_RECORD_1900
     * @tc.name      testExpressionsIndexingRecord0019
     * @tc.desc      Indexing expression evaluation order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingRecord0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      res_ind2 = ""
      let v: number|undefined = 99
      let result: string = ""

      try {
        v = get_ref_ind2(false)[get_idx_ind2(false, "2")]
        result = " passed " + v
      } catch (e) {
        result = " failed " + v
      }
      expect(res_ind2 + result).assertEqual(" ref idx passed undefined")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_RECORD_2000
     * @tc.name      testExpressionsIndexingRecord0020
     * @tc.desc      Indexing expression evaluation order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingRecord0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      res_ind2 = ""
      let v: number|undefined = 99
      let result: string = ""

      try {
        v = get_ref_ind2(false)[get_idx_ind2(true, "1")]
        result = " passed " + v
      } catch (e) {
        result = " failed " + v
      }
      expect(res_ind2 + result).assertEqual(" ref idx failed 99")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_RECORD_2100
     * @tc.name      testExpressionsIndexingRecord0021
     * @tc.desc      Indexing expression evaluation order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingRecord0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      res_ind2 = ""
      let v: number|undefined = 99
      let result: string = ""

      try {
        v = get_ref_ind2(true)[get_idx_ind2(false, "1")]
        result = " passed " + v
      } catch (e) {
        result = " failed " + v
      }
      expect(res_ind2 + result).assertEqual(" ref failed 99")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_RECORD_2200
     * @tc.name      testExpressionsIndexingRecord0022
     * @tc.desc      Indexing expression evaluation order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingRecord0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      res_ind2 = ""
      let v: number|undefined = 99
      let result: string = ""

      try {
        v = get_ref_ind2(true)[get_idx_ind2(true, "1")]
        result = " passed " + v
      } catch (e) {
        result = " failed " + v
      }
      expect(res_ind2 + result).assertEqual(" ref failed 99")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_RECORD_2300
     * @tc.name      testExpressionsIndexingRecord0023
     * @tc.desc      The type of the object reference expression must be a nullish type based on
     *               an array type, or on the Record type; a compile-time error occurs otherwise.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingRecord0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(refNotNullish_indx1a()["magic"] == 42).assertTrue()
      expect(refNotNullish_indx1a()?.["magic"] == 42).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_RECORD_2400
     * @tc.name      testExpressionsIndexingRecord0024
     * @tc.desc      If no '?.' is present in an indexing expression, then the type of
     *               object reference expression must be an array type, or the Record type; a compile-time
     *               error occurs otherwise.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingRecord0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(refNullish_record_access_0()?.["magic"]).assertEqual(42)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_RECORD_2500
     * @tc.name      testExpressionsIndexingRecord0025
     * @tc.desc      If no '?.' is present in an indexing expression, then the type of
     *               object reference expression must be an array type, or the Record type; a compile-time
     *               error occurs otherwise.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingRecord0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(refNullish_record_access_1()?.["magic"]).assertEqual(42)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_RECORD_2600
     * @tc.name      testExpressionsIndexingRecord0026
     * @tc.desc      If no '?.' is present in an indexing expression, then the type of
     *               object reference expression must be an array type, or the Record type; a compile-time
     *               error occurs otherwise.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingRecord0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(refNullish_record_access_2()?.["magic"]).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_RECORD_2700
     * @tc.name      testExpressionsIndexingRecord0027
     * @tc.desc      If no '?.' is present in an indexing expression, then the type of
     *               object reference expression must be an array type, or the Record type; a compile-time
     *               error occurs otherwise.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingRecord0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(refNullish_record_access_3()?.["magic"]).assertEqual(undefined)
    })


    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_RECORD_2800
     * @tc.name      testExpressionsIndexingRecord0028
     * @tc.desc      Record index expression - spread from a record cast from Object.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingRecord0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = spreadFromObject_record_cast_index(y_record_cast_index)
      expect(x["name"]).assertEqual("Alice")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_RECORD_2900
     * @tc.name      testExpressionsIndexingRecord0029
     * @tc.desc      Record index expression - spread from a record cast from Object.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingRecord0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = spreadFromObject_record_cast_index(y_record_cast_index)
      expect(x["age"]).assertEqual("30")
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_RECORD_3000
     * @tc.name      testExpressionsIndexingRecord0030
     * @tc.desc      Record index expression - spread from a record cast from Object.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingRecord0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      x_record_field_set["key3"] = 42
      expect(x_record_field_set["key3"]).assertEqual(42)
    })


    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_RECORD_3100
     * @tc.name      testExpressionsIndexingRecord0031
     * @tc.desc      An index expression has no restriction. The result of an indexing expression
     *               is of type Value | undefined.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingRecord0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(x_record_number_index[1]).assertEqual("hello")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_RECORD_3200
     * @tc.name      testExpressionsIndexingRecord0032
     * @tc.desc      An index expression has no restriction. The result of an indexing expression
     *               is of type Value | undefined.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingRecord0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(x_record_number_index[2]).assertEqual("buy")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_RECORD_3300
     * @tc.name      testExpressionsIndexingRecord0033
     * @tc.desc      An index expression has no restriction. The result of an indexing expression
     *               is of type Value | undefined.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingRecord0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(x_record_number_index[0]).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_RECORD_3400
     * @tc.name      testExpressionsIndexingRecord0034
     * @tc.desc      An index expression has no restriction. The result of an indexing expression
     *               is of type Value | undefined.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingRecord0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(bar_record_number_index(1)).assertEqual("hello")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_RECORD_3500
     * @tc.name      testExpressionsIndexingRecord0035
     * @tc.desc      An index expression has no restriction. The result of an indexing expression
     *               is of type Value | undefined.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingRecord0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(bar_record_number_index(10)).assertEqual("no")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_RECORD_3600
     * @tc.name      testExpressionsIndexingRecord0036
     * @tc.desc      An index expression has no restriction. The result of an indexing expression
     *               is of type Value | undefined.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingRecord0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_record_number_index(2)).assertEqual("buy")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_RECORD_3700
     * @tc.name      testExpressionsIndexingRecord0037
     * @tc.desc      An index expression has no restriction. The result of an indexing expression
     *               is of type Value | undefined.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingRecord0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_record_number_index(5)).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_RECORD_3800
     * @tc.name      testExpressionsIndexingRecord0038
     * @tc.desc      An index expression has no restriction. The result of an indexing expression
     *               is of type Value | undefined.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingRecord0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = x_record_number_index[2]
      expect(s).assertEqual("buy")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_RECORD_3900
     * @tc.name      testExpressionsIndexingRecord0039
     * @tc.desc      An index expression has no restriction. The result of an indexing expression
     *               is of type Value | undefined.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingRecord0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = x_record_number_index[3]
      expect(s).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_RECORD_4000
     * @tc.name      testExpressionsIndexingRecord0040
     * @tc.desc      An index expression has no restriction. The result of an indexing expression
     *               is of type Value | undefined.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingRecord0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = bar_record_number_index(1)
      expect(s).assertEqual("hello")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_RECORD_4100
     * @tc.name      testExpressionsIndexingRecord0041
     * @tc.desc      An index expression has no restriction. The result of an indexing expression
     *               is of type Value | undefined.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingRecord0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = bar_record_number_index(8)
      expect(s).assertEqual("no")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_RECORD_4200
     * @tc.name      testExpressionsIndexingRecord0042
     * @tc.desc      An index expression has no restriction. The result of an indexing expression
     *               is of type Value | undefined.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingRecord0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = foo_record_number_index(2)
      expect(s).assertEqual("buy")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_RECORD_4300
     * @tc.name      testExpressionsIndexingRecord0043
     * @tc.desc      An index expression has no restriction. The result of an indexing expression
     *               is of type Value | undefined.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingRecord0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = foo_record_number_index(6)
      expect(s).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_RECORD_4400
     * @tc.name      testExpressionsIndexingRecord0044
     * @tc.desc      Record index expression - record string-number.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingRecord0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(rec_record_string_index["a"]).assertEqual(1)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_RECORD_4500
     * @tc.name      testExpressionsIndexingRecord0045
     * @tc.desc      Record index expression - record string-number.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingRecord0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(rec_record_string_index["b"]).assertEqual(2)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_RECORD_4600
     * @tc.name      testExpressionsIndexingRecord0046
     * @tc.desc      Record index expression - record string-number.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingRecord0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(rec_record_string_index["c"]).assertEqual(3)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_RECORD_4700
     * @tc.name      testExpressionsIndexingRecord0047
     * @tc.desc      Record index expression - record string-number.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingRecord0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(rec_record_string_index["d"]).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_RECORD_4800
     * @tc.name      testExpressionsIndexingRecord0048
     * @tc.desc      Record index expression - record string-number.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingRecord0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(getValue_record_string_index("c")).assertEqual(3)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_RECORD_4900
     * @tc.name      testExpressionsIndexingRecord0049
     * @tc.desc      Record index expression - record string-number.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingRecord0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(getValue_record_string_index("d")).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_RECORD_5000
     * @tc.name      testExpressionsIndexingRecord0050
     * @tc.desc      Record index expression - record string-number.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingRecord0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(getValueOrDefault_record_string_index("a", 0)).assertEqual(1)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_RECORD_5100
     * @tc.name      testExpressionsIndexingRecord0051
     * @tc.desc      Record index expression - record string-number.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingRecord0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(getValueOrDefault_record_string_index("b", 0)).assertEqual(2)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_RECORD_5200
     * @tc.name      testExpressionsIndexingRecord0052
     * @tc.desc      Record index expression - record string-number.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingRecord0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(getValueOrDefault_record_string_index("e", 0)).assertEqual(0)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_RECORD_5300
     * @tc.name      testExpressionsIndexingRecord0053
     * @tc.desc      Record index expression - record union type index.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingRecord0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(x_record_union_type_index["key1"]).assertEqual(1)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_RECORD_5400
     * @tc.name      testExpressionsIndexingRecord0054
     * @tc.desc      Record index expression - record union type index.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingRecord0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(x_record_union_type_index["key2"]).assertEqual(2)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_RECORD_5500
     * @tc.name      testExpressionsIndexingRecord0055
     * @tc.desc      Record index expression - record union type index.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingRecord0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(x_record_union_type_index["key3"]).assertEqual(4)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_RECORD_5600
     * @tc.name      testExpressionsIndexingRecord0056
     * @tc.desc      Record index expression - record union type index.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingRecord0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = x_record_union_type_index["key1"]
      expect(s).assertEqual(1)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_RECORD_5700
     * @tc.name      testExpressionsIndexingRecord0057
     * @tc.desc      Record index expression - record union type index.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingRecord0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = x_record_union_type_index["key3"]
      expect(s).assertEqual(4)
    })
  })
}
