/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

type tst = number | object
type AsyncCallback<T = void> = (data: T | undefined) => void;
type U1 = ((x: int) => int) | ((x: string, y: int) => int) | ((x: int) => string)

let f1: U1 = (x) => {return x + 1};
let f2: U1 = (x) => {return x.length};
let f3: U1 = (x) => { {return "aaa"}};
let f4: U1 = (x) => {return 33};
let f5: U1 = (x, y) => {return x.length + y};

class AsyncCallbackWrapper<T = void> {
  constructor(myfunc: AsyncCallback<T>) {}
}

function foo1(a: readonly [int, string] | [int, string] | never) {
  return a[0]
}

function foo2(a: readonly number[] | number[] | never): number {
  return a[1]
}

function foo3(a: ReadonlyArray<string> | string[] | never): string {
  return a[0]
}

function testMultipleNever(a: number[] | readonly number[] | never | never | never): number {
  return a[0]
}

// ===== Classes and Types for test cases =====

// For UnionTest007
class C {
  v1: int = 0
  v2: string = ''
}
type U007 = C | Record<string, string>;

// For UnionTest008
class B {
  b: int
}
class D extends B {
  d: string | undefined
}

// For UnionTest009
class C3 {
  z: object = "1.2.string"
}
class D3 {
  z: number
}
class Z3 {
  foo(): object { return 1.1};
}

// For UnionTest010
type UT = Record<number, number> | Record<string, number>;

// For UnionTest011
interface Padding {
  top?: Length;
  right?: Length;
  bottom?: Length;
  left?: Length;
}

type Length = string | number | Resource;

interface Resource {
  bundleName: string;
  moduleName: string;
  id: number;
  type?: number;
}

interface LocalizedPadding {
  top?: LengthMetrics;
  end?: LengthMetrics;
  bottom?: LengthMetrics;
  start?: LengthMetrics;
}

class LengthMetrics {
  constructor(value: number, unit?: LengthUnit){}
  static px(value: number){}
  static vp(value: number){}
  static fp(value: number){}
  static percent(value: number){}
  static lpx(value: number){}
  static resource(value: Resource){}
  public unit: LengthUnit = LengthUnit.PX;
  public value: number = 1;
}

enum LengthUnit {
  PX = 0,
  VP = 1,
  FP = 2,
  PERCENT = 3,
  LPX = 4
}

let a_LM: LengthMetrics = new LengthMetrics(1, LengthUnit.PX);

// For UnionTest012
type RecordData1 = undefined | Record<string, RecordData1> | number | (() => void);

// For UnionTest013
type RecordData2 = Record<string, RecordData2> | ((n2: number, n3: number) => number);

// For UnionTest014
type RecordData3 = Record<string, RecordData3> | ((n2: number, n3: number) => number) | number;

// For UnionTest015
type RecordData4 = Record<string, RecordData4> | ((n2: number, n3: number) => number) | number;

// For UnionTest016
type RecordData5 = undefined | Record<string, RecordData5> | Array<RecordData5> | Object;
type RecordType = Record<string, RecordData5>;
class Test {}
let status: string = "";
function padding(value: Padding | Length | LocalizedPadding) {
  if (value instanceof number) {
    status = "Length";
  }
  if (value instanceof Padding) {
    status = "Padding";
  }
  if (value instanceof LocalizedPadding) {
    status = "LocalizedPadding";
  }
}
export default function UnionTest() {
  describe('UnionTest', (): void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll((): void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (): Promise<void> => {
      await sleep(30);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach((): void => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll((): void => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number SUB_UNION_0100
     * @tc.name UnionTest001
     * @tc.desc 
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('UnionTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let flag = true;
      let cb = (p1: tst, p2: tst, idx: int, obj: Array<tst>): tst => { return new Object(); }
      let init: tst = 5.5
      let arr = new Array<tst>(1,2,3)
      arr.reduce(cb, init)
      expect(flag).assertTrue()
    });

    /**
     * @tc.number SUB_UNION_0200
     * @tc.name UnionTest002
     * @tc.desc 
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('UnionTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let flag = true;
      new AsyncCallbackWrapper((data) => {})
      expect(flag).assertTrue();
    });

    /**
     * @tc.number SUB_UNION_0400
     * @tc.name UnionTest004
     * @tc.desc Test union type operations with arrays
     * @tc.level LEVEL1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     */
    it('UnionTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(foo1([1, "2"])).assertEqual(1);
      expect(foo2([1, 2] as number[])).assertEqual(2);
      expect(foo3(["hello", "world"])).assertEqual("hello");
      let readonlyArr1: readonly number[] = [1, 2, 3];
      let mutableArr: number[] = [4, 5, 6];
      expect(foo2(readonlyArr1)).assertEqual(2);
      expect(foo2(mutableArr)).assertEqual(5);
      expect(testMultipleNever(mutableArr)).assertEqual(4);
    });

    /**
     * @tc.number SUB_UNION_0700
     * @tc.name UnionTest007
     * @tc.desc Test class literal assignment between class and Record
     * @tc.level LEVEL1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     */
    it('UnionTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let b: U007 = {v1: 0, v2: 'qqq'};
      let c: U007 = {'v2': 'zzz', 'v3': 'sss'};
      
      expect(b instanceof C).assertTrue();
      expect(c instanceof Record).assertTrue();
    });

    /**
     * @tc.number SUB_UNION_0800
     * @tc.name UnionTest008
     * @tc.desc Test class literal assignment between base-derived class
     * @tc.level LEVEL1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     */
    it('UnionTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let x: B | D = {b: 3, d: 'aa'};
      let y: B | D = {b: 4};
      
      expect(x instanceof D).assertTrue();
      expect(y instanceof B).assertTrue();
    });

    /**
     * @tc.number SUB_UNION_0900
     * @tc.name UnionTest009
     * @tc.desc Test class literal assignment with same name field
     * @tc.level LEVEL1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     */
    it('UnionTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let x: C3 | D3 = {z: new Z3().foo()};
      expect(x instanceof C3).assertTrue();
    });

    /**
     * @tc.number SUB_UNION_1000
     * @tc.name UnionTest010
     * @tc.desc Test object literal assign to Record union
     * @tc.level LEVEL1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     */
    it('UnionTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: UT = { "1": 2 };
      let b: UT = { 1: 1 };
      let c: Record<number, number> | Record<string, number> = {"2": 2.1};
      let d: Record<number, number> | Record<string, number> = {2.1: 2.1};
      
      expect(a["1"]).assertEqual(2);
      expect(b[1]).assertEqual(1);
      expect(c["2"]).assertEqual(2.1);
      expect(d[2.1]).assertEqual(2.1);
    });

    /**
     * @tc.number SUB_UNION_1100
     * @tc.name UnionTest011
     * @tc.desc Test padding function with union types
     * @tc.level LEVEL1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     */
    it('UnionTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      padding(1);
      expect(status).assertEqual("Length");
      padding({top: 1});
      expect(status).assertEqual("Padding");
      padding({top: a_LM});
      expect(status).assertEqual("LocalizedPadding");
    });

    /**
     * @tc.number SUB_UNION_1200
     * @tc.name UnionTest012
     * @tc.desc Test Record with recursive lambda
     * @tc.level LEVEL1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     */
    it('UnionTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let callTrace: string = '';
      let want: RecordData1 = {
        "recursive_lambda1": () => {
          callTrace += "recursive_lambda1";
          let want_in: RecordData1 = {
            "recursive_lambda1_1": () => {callTrace += " -> recursive_lambda1_1"}
          };
          ((want_in as Record<string, RecordData1>)["recursive_lambda1_1"] as (() => void))();
        },
        "recursive_lambda2": () => {let want_in: RecordData1 = {"int": 1}},
      };
      
      ((want as Record<string, RecordData1>)["recursive_lambda1"] as (() => void))();
      expect(callTrace).assertEqual("recursive_lambda1 -> recursive_lambda1_1");
    });

    /**
     * @tc.number SUB_UNION_1300
     * @tc.name UnionTest013
     * @tc.desc Test Record with lambda function
     * @tc.level LEVEL1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     */
    it('UnionTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let want: RecordData2 = {
        "lambdakey": (a: number, b: number) : number => {
          return a + b;
        }
      };
      
      const add = (want as Record<string, RecordData2>)["lambdakey"] as (n2: number, n3: number) => number;
      expect(add(5, 6)).assertEqual(11);
    });

    /**
     * @tc.number SUB_UNION_1400
     * @tc.name UnionTest014
     * @tc.desc Test Record with lambda and number
     * @tc.level LEVEL1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     */
    it('UnionTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let want: RecordData3 = {
        "numberkey": 123,
        "lambdakey": (a: number, b: number) : number => {
          return a + b;
        }
      };
      
      const add = (want as Record<string, RecordData3>)["lambdakey"] as (n2: number, n3: number) => number;
      expect(add(5, 6)).assertEqual(11);
    });

    /**
     * @tc.number SUB_UNION_1500
     * @tc.name UnionTest015
     * @tc.desc Test Record with nested lambda and number
     * @tc.level LEVEL1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     */
    it('UnionTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let want: RecordData4 = {
        "numberkey": 123,
        "lambdakey": (a: number, b: number) : number => {
          let want_inner: RecordData4 = {
            "numberkey": 1234
          };
          return a + b;
        }
      };
      
      const add = (want as Record<string, RecordData4>)["lambdakey"] as (n2: number, n3: number) => number;
      expect(add(5, 6)).assertEqual(11);
    });

    /**
     * @tc.number SUB_UNION_1600
     * @tc.name UnionTest016
     * @tc.desc Test complex Record with nested structures
     * @tc.level LEVEL1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     */
    it('UnionTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let want: RecordType = {
        "keyRecord": {
          "subKeyStr": 11
        },
        "keyString": "string***&&&",
        "keyBool": true,
        "keyInt": 11,
        "keyDouble": 3.1415,
        "keyObj": new Test(),
        "arrString": ["1s", "2s", "3s"],
        "arrBool": [true, false, true, true],
        "arrInt": [1, 2, 3],
        "arrDouble": [1.1, 1.2, 1.3],
        "arrObj": [
          new Test(),
          {
            "keyString": "string***&&&",
            "keyBool": true,
            "keyInt": 11,
            "keyDouble": 3.1415,
            "keyObj": new Test()
          },
          {
            "arrString": ["1s", "2s", "3s"],
            "arrBool": [true, false, true, true],
            "arrInt": [1, 2, 3],
            "arrDouble": [1.1, 1.2, 1.3],
          },
        ],
      };
      
      expect(want["keyString"]).assertEqual("string***&&&");
      expect(want["keyInt"]).assertEqual(11);
      expect(want["keyDouble"]).assertEqual(3.1415);
    });
  });
}
