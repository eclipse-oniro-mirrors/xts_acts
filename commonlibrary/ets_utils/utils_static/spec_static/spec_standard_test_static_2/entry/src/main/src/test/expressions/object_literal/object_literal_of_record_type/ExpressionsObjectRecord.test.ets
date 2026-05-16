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

function foo_re_2(p: string): string {
    return p + p
}

enum Color_re_10 { Red, Green, Blue }
type Keys_re_10 = "A" | "B"
type Values_re_10 = Color_re_10 | string

type R_re_11 = Record<string, string>
function foo_re_11(p: R_re_11): R_re_11 {
    if (p["A"] == "B") {
        return { "exitCode": "0" }
    } else {
        return { "exitCode": "1" }
    }
}

class Test_re_18 {
    me: int;
    constructor(e: int) {
        this.me = e;
    }
}

enum Queen_re_19 { Dont, Stop, Me, Now }

let r_re_22: Record<"Please"|"Read"|"Beware"|"Of"|"Pity", string> = {
    "Please": "Book",
    "Read": "Written by",
    "Beware": "Stefan",
    "Of": "Zweig",
    "Pity": "in 1939"
}

enum DoubleEnum_re_25: double {a = 1.0, b = 2.0, c = 3.141592653589}



export default function ExpressionsObjectRecordTestSuite(): void {
  describe("ExpressionsObjectRecordTestSuite", () => {
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
     * @tc.number    SUB_EXPRESSIONS_OBJECT_RECORD_0100
     * @tc.name      testExpressionsObjectRecord0001
     * @tc.desc      A special form of an object literal is used to initialize the value of such type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectRecord0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Record<number, string> = {}
      let b: Record<number, string> = {}
      expect(a instanceof Record).assertTrue()
      expect(b instanceof Record).assertTrue()
      expect(a != b).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_RECORD_0200
     * @tc.name      testExpressionsObjectRecord0002
     * @tc.desc      A special form of an object literal is used to initialize the value of such type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectRecord0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Record<number, string> = {
        0: "Zero",
        1: "One",
        3.14159: "PI",
      }
      expect(a[0]).assertEqual("Zero")
      expect(a[1]).assertEqual("One")
      expect(a[3.14159]).assertEqual("PI")
      expect(a[42]).assertEqual(undefined)
      a = {}
      expect(a[0]).assertEqual(undefined)
      expect(a[1]).assertEqual(undefined)
      expect(a[3.14159]).assertEqual(undefined)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_RECORD_0300
     * @tc.name      testExpressionsObjectRecord0003
     * @tc.desc      A special form of an object literal is used to initialize the value of such type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectRecord0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Record<number, string> = {
        0: foo_re_2("Zero"),
        1: foo_re_2("One"),
        3.14159: "P" + foo_re_2("I"),
      }
      expect(a[0]).assertEqual("ZeroZero")
      expect(a[1]).assertEqual("OneOne")
      expect(a[3.14159]).assertEqual("PII")
      expect(a[42]).assertEqual(undefined)
      a = {}
      expect(a[0]).assertEqual(undefined)
      expect(a[1]).assertEqual(undefined)
      expect(a[3.14159]).assertEqual(undefined)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_RECORD_0400
     * @tc.name      testExpressionsObjectRecord0004
     * @tc.desc      A special form of an object literal is used to initialize the value of such type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectRecord0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Record<string, number> = {
        "Zero": 0b0,
        "One": 1.0,
        "Two": 2e00,
        "Minus PI": -3.14159,
      }
      expect(a["Zero"]).assertEqual(0)
      expect(a["One"]).assertEqual(1)
      expect(a["Two"]).assertEqual(2)
      expect(a["Minus PI"]).assertEqual(-3.14159)
      expect(a["PI"]).assertEqual(undefined)
      a = {}
      expect(a["Zero"]).assertEqual(undefined)
      expect(a["One"]).assertEqual(undefined)
      expect(a["Two"]).assertEqual(undefined)
      expect(a["Minus PI"]).assertEqual(undefined)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_RECORD_0500
     * @tc.name      testExpressionsObjectRecord0005
     * @tc.desc      A special form of an object literal is used to initialize the value of such type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectRecord0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Record<"Zero" | "One" | "Two", number> = {
        "Zero": 0b0,
        "One": 1.0,
        "Two": 2e00,
      }
      expect(a["Zero"]).assertEqual(0)
      expect(a["One"]).assertEqual(1)
      expect(a["Two"]).assertEqual(2)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_RECORD_0600
     * @tc.name      testExpressionsObjectRecord0006
     * @tc.desc      A special form of an object literal is used to initialize the value of such type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectRecord0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Record<string | "Zero" | "One" | "Two", number> = {
        "": 0x00,
        " ": 0x01,
        "One": 1.0,
        "Two": 2e00,
        "PI constant value": 3.14159,
      }
      expect(a["Zero"]).assertEqual(undefined)
      expect(a["One"]).assertEqual(1)
      expect(a["Two"]).assertEqual(2)
      expect(a[""]).assertEqual(0)
      expect(a[" "]).assertEqual(1)
      expect(a["PI constant value"]).assertEqual(3.14159)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_RECORD_0700
     * @tc.name      testExpressionsObjectRecord0007
     * @tc.desc      A special form of an object literal is used to initialize the value of such type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectRecord0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Record<"a" | "b" | "c", Record<number, boolean>> = {
        "c": { 1: false,
               42: true,
        },
        "b": {},
        "a": { 1: true,
               42: false,
        },
      }
      expect(a["a"][1]!).assertTrue()
      expect(!(a["a"][42]!)).assertTrue()
      expect(a["b"][123]).assertEqual(undefined)
      expect(!(a["c"][1]!)).assertTrue()
      expect(a["c"][42]!).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_RECORD_0800
     * @tc.name      testExpressionsObjectRecord0008
     * @tc.desc      A special form of an object literal is used to initialize the value of such type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectRecord0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Record<string, Record<number, boolean>> = {
        "c": { 1: false,
               42: true,
        },
        "b": {},
      }
      expect(a["b"]![123]).assertEqual(undefined)
      expect(!(a["c"]![1]!)).assertTrue()
      expect(a["c"]![42]!).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_RECORD_0900
     * @tc.name      testExpressionsObjectRecord0009
     * @tc.desc      A special form of an object literal is used to initialize the value of such type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectRecord0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Record<Short, Error> = {
        1: new Error,
        22: new Error,
        333: new Error,
      }
      expect(a[1] instanceof Error && a[22] instanceof Error && a[333] instanceof Error).assertTrue()
      expect(a[1] != a[22] && a[1] != a[333]).assertTrue()
      expect(a[2]).assertEqual(undefined)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_RECORD_1000
     * @tc.name      testExpressionsObjectRecord0010
     * @tc.desc      A special form of an object literal is used to initialize the value of such type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectRecord0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Record<Byte, Double | Boolean | null> = {
        0: 3.14159,
        50: false,
        100: null,
        127: 127.0,
      }
      expect(a[0]).assertEqual(3.14159)
      expect(a[50]).assertEqual(false)
      expect(a[100]).assertEqual(null)
      expect(a[127]).assertEqual(127.0)
      expect(a[1]).assertEqual(undefined)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_RECORD_1100
     * @tc.name      testExpressionsObjectRecord0011
     * @tc.desc      A special form of an object literal is used to initialize the value of such type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectRecord0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Record<Keys_re_10, Values_re_10> = {
        "A" : Color_re_10.Blue,
        "B": "green"
      }
      expect(a["A"]).assertEqual(Color_re_10.Blue)
      expect(a["B"]).assertEqual("green")
      a["A"] = Color_re_10.Red
      expect(a["A"]).assertEqual(Color_re_10.Red)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_RECORD_1200
     * @tc.name      testExpressionsObjectRecord0012
     * @tc.desc      A special form of an object literal is used to initialize the value of such type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectRecord0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_re_11({ "A": "B" })["exitCode"]).assertEqual("0")
      expect(foo_re_11({ "A": "C" })["exitCode"]).assertEqual("1")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_RECORD_1300
     * @tc.name      testExpressionsObjectRecord0013
     * @tc.desc      A special form of an object literal is used to initialize the value of such type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectRecord0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Record<string, string[]> = {
        "\u0000": [""],
        "\u0001": ["", "1"],
        "\u0002": ["", "1", "2"],
        "wrong key": [] as string[]
      }
      expect(r["\u0000"]![0]).assertEqual("")
      expect(r["\u0001"]![0]).assertEqual("")
      expect(r["\u0001"]![1]).assertEqual("1")
      expect(r["\u0002"]![0]).assertEqual("")
      expect(r["\u0002"]![1]).assertEqual("1")
      expect(r["\u0002"]![2]).assertEqual("2")
      expect(r["wrong key"]!.length).assertEqual(0)
      expect(r["bad key"]).assertEqual(undefined)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_RECORD_1400
     * @tc.name      testExpressionsObjectRecord0014
     * @tc.desc      A special form of an object literal is used to initialize the value of such type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectRecord0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Record<"Q"|"W"|"E", [number, bigint]> = {
        "Q": [1e0, 1n],
        "W": [1e10, 111111111n],
        "E": [1e20, 111111111111111111n]
      }
      expect(r["Q"][0]).assertEqual(1)
      expect(r["Q"][1]).assertEqual(1n)
      expect(r["W"][0]).assertEqual(1e10)
      expect(r["W"][1]).assertEqual(111111111n)
      expect(r["E"][0]).assertEqual(1e20)
      expect(r["E"][1]).assertEqual(111111111111111111n)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_RECORD_1500
     * @tc.name      testExpressionsObjectRecord0015
     * @tc.desc      A special form of an object literal is used to initialize the value of such type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectRecord0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Record<"add" | "mul", (p: number) => number> = {
        "add": (p: number): number => p + p,
        "mul": (p: number): number => p * p
      }
      expect(r["add"](42)).assertEqual(84)
      expect(r["mul"](12)).assertEqual(144)
      r["add"] = (p: number): number => p + p + p
      expect(r["add"](3)).assertEqual(9)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_RECORD_1600
     * @tc.name      testExpressionsObjectRecord0016
     * @tc.desc      A special form of an object literal is used to initialize the value of such type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectRecord0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Record<string, (p: number) => number> = {
        "add": (p: number): number => p + p,
        "mul": (p: number): number => p * p
      }
      expect(r["add"]!(42)).assertEqual(84)
      expect(r["mul"]!(12)).assertEqual(144)
      expect(r["div"]).assertEqual(undefined)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_RECORD_1700
     * @tc.name      testExpressionsObjectRecord0017
     * @tc.desc      A special form of an object literal is used to initialize the value of such type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectRecord0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Record<number, string|double|null|undefined> = {
        1: "1",
        2: 2.5,
        3: null,
        4: undefined,
      }
      expect(r[1]).assertEqual("1")
      expect(r[2]).assertEqual(2.5)
      expect(r[3]).assertEqual(null)
      expect(r[4]).assertEqual(undefined)
      expect(r[5]).assertEqual(undefined)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_RECORD_1800
     * @tc.name      testExpressionsObjectRecord0018
     * @tc.desc      A special form of an object literal is used to initialize the value of such type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectRecord0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Record<"1"|"2"|"3"|"4", Char|Boolean|Long|Error> = {
        "1": c'1',
        "2": false,
        "3": Long.MAX_VALUE,
        "4": new Error()
      }
      expect(r["1"]).assertEqual(c'1')
      expect(r["2"]).assertEqual(false)
      expect(r["3"]).assertEqual(Long.MAX_VALUE)
      expect(r["4"] instanceof Error).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_RECORD_1900
     * @tc.name      testExpressionsObjectRecord0019
     * @tc.desc      A special form of an object literal is used to initialize the value of such type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectRecord0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Record<"hw"|"HW"|"hW", Test_re_18> = {
        "hw": new Test_re_18(100),
        "HW": new Test_re_18(150),
        "hW": new Test_re_18(225)
      }
      expect(r["hw"].me).assertEqual(100)
      expect(r["HW"].me).assertEqual(150)
      expect(r["hW"].me).assertEqual(225)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_RECORD_2000
     * @tc.name      testExpressionsObjectRecord0020
     * @tc.desc      A special form of an object literal is used to initialize the value of such type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectRecord0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Record<"Dont"|"Stop"|"Me"|"Now", Queen_re_19> = {
        "Dont": Queen_re_19.Now,
        "Stop": Queen_re_19.Me,
        "Me": Queen_re_19.Stop,
        "Now": Queen_re_19.Dont
      }
      expect(r["Dont"]).assertEqual(Queen_re_19.Now)
      expect(r["Stop"]).assertEqual(Queen_re_19.Me)
      expect(r["Me"]).assertEqual(Queen_re_19.Stop)
      expect(r["Now"]).assertEqual(Queen_re_19.Dont)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_RECORD_2100
     * @tc.name      testExpressionsObjectRecord0021
     * @tc.desc      A special form of an object literal is used to initialize the value of such type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectRecord0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Record<"concat"|"remove", (f: string, s: string) => string> = {
        "concat": (f: string, s: string): string => f + s,
        "remove": (f: string, s: string): string => f.replace(s, '')
      }
      expect(r["concat"]("Hello, ", "world!")).assertEqual("Hello, world!")
      expect(r["remove"]("What are you doing?", " doing")).assertEqual("What are you?")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_RECORD_2200
     * @tc.name      testExpressionsObjectRecord0022
     * @tc.desc      A special form of an object literal is used to initialize the value of such type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectRecord0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Record<"Nor"|"Shall"|"Death"|"Brag", Record<"Thou"|"Wanderst"|"In"|"His"|"Shade", int>> = {
        "Nor": {
          "Thou": 1,
          "Wanderst": 2,
          "In": 3,
          "His": 4,
          "Shade": 5,
        },
        "Shall": {
          "Thou": 10,
          "Wanderst": 20,
          "In": 30,
          "His": 40,
          "Shade": 50,
        },
        "Death": {
          "Thou": 100,
          "Wanderst": 200,
          "In": 300,
          "His": 400,
          "Shade": 500,
        },
        "Brag": {
          "Thou": 1000,
          "Wanderst": 2000,
          "In": 3000,
          "His": 4000,
          "Shade": 5000,
        }
      }
      expect(r["Nor"]["Thou"]).assertEqual(1)
      expect(r["Nor"]["Wanderst"]).assertEqual(2)
      expect(r["Nor"]["In"]).assertEqual(3)
      expect(r["Nor"]["His"]).assertEqual(4)
      expect(r["Nor"]["Shade"]).assertEqual(5)
      expect(r["Shall"]["Thou"]).assertEqual(10)
      expect(r["Shall"]["Wanderst"]).assertEqual(20)
      expect(r["Shall"]["In"]).assertEqual(30)
      expect(r["Shall"]["His"]).assertEqual(40)
      expect(r["Shall"]["Shade"]).assertEqual(50)
      expect(r["Death"]["Thou"]).assertEqual(100)
      expect(r["Death"]["Wanderst"]).assertEqual(200)
      expect(r["Death"]["In"]).assertEqual(300)
      expect(r["Death"]["His"]).assertEqual(400)
      expect(r["Death"]["Shade"]).assertEqual(500)
      expect(r["Brag"]["Thou"]).assertEqual(1000)
      expect(r["Brag"]["Wanderst"]).assertEqual(2000)
      expect(r["Brag"]["In"]).assertEqual(3000)
      expect(r["Brag"]["His"]).assertEqual(4000)
      expect(r["Brag"]["Shade"]).assertEqual(5000)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_OBJECT_RECORD_2300
     * @tc.name      testExpressionsObjectRecord0023
     * @tc.desc      A special form of an object literal is used to initialize the value of such type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsObjectRecord0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(r_re_22["Please"]).assertEqual("Book")
      expect(r_re_22["Read"]).assertEqual("Written by")
      expect(r_re_22["Beware"]).assertEqual("Stefan")
      expect(r_re_22["Of"]).assertEqual("Zweig")
      expect(r_re_22["Pity"]).assertEqual("in 1939")
    });
  });
}
