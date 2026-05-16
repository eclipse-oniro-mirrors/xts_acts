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
} from "../../../../../hypium";

let x_0: string = 'abc';

let shadowVar_1: string = "global";

function add_2(a: number, b: number): number { return a + b; }

function identity_3<T>(arg: T): T { return arg; }

function identity_4<T>(arg: T): T { return arg; }

function sampleFunc_5(): void {}

let shadowVar_6: string = "global";

function strictType_7(param: number): number { return param; }

let defaultVal_8: number = 5 as number;
function withDefault_8(param: number = defaultVal_8 + 1): number { return param; }

function callbackHandler_9(callback: (msg: string) => void): void { callback('Hello from callback'); }

let callback_10: string = "I am a string";

namespace MyModule_11 { export const moduleVar:string = "Module Variable"; }

let param_12: string = "global";

namespace MathUtils_13 { export function sum(a: number, b: number): number { return a + b; } }

class Myclass_15<T> {
  value: T;
  constructor(v: T) { this.value = v; }
  getValue(): T { return this.value; }
}

let count_16: number = 10;

interface Lengthwise_17 { length: number; }
function logLength_17<T extends Lengthwise_17>(obj: T): void { obj.length; }

const PI_18: number = 3.1415;

function identity_19<T>(arg: T): T { return arg; }

type UserID_20 = string | number;

enum ColorSet_21 { Red = 0, Green = 1, Blue = 2 }

enum ColorSet_23 { Red = 0, Green = 1, Blue = 2 }

type UserID_24 = string | number;

// 以下为类定义
class MyClass_0 { static staticProp = "static"; }
class MyClass_1 { instanceProp = "instance"; }
class MyClass_2 { method(): string { return "method"; } }

function testParamShadow(shadowVar: string): string { return shadowVar; }
function testNameConflict(callback: () => void): void {
  callback();
  expect(typeof callback).assertEqual("function");
}

function scopeTest(param: string): void { expect(param).assertEqual("local"); }




async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function ExpressionsNamedReferenceTest(): void {
  describe("ExpressionsNamedReferenceTest", () => {
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
     * @tc.number    SUB_EXPRESSIONS_NAMED_REFERENCE_0100
     * @tc.name      testExpressionsNamedReference0001
     * @tc.desc      Reference global variables.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNamedReference0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data2: string = x_0;
      expect(data2).assertEqual('abc');
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NAMED_REFERENCE_0200
     * @tc.name      testExpressionsNamedReference0002
     * @tc.desc      Reference local variables.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNamedReference0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data1: string = 'abc';
      let data2: string = data1;
      expect(data2).assertEqual('abc');
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NAMED_REFERENCE_0300
     * @tc.name      testExpressionsNamedReference0003
     * @tc.desc      Access static members by class name.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNamedReference0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = MyClass_0.staticProp;
      expect(x).assertEqual("static");
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NAMED_REFERENCE_0400
     * @tc.name      testExpressionsNamedReference0004
     * @tc.desc      Accessing instance members through instances.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNamedReference0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass_1();
      let x = obj.instanceProp;
      expect(x).assertEqual("instance");
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NAMED_REFERENCE_0500
     * @tc.name      testExpressionsNamedReference0005
     * @tc.desc      Accessing instance functions through instances.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNamedReference0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass_2();
      let x = obj.method();
      expect(x).assertEqual("method");
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NAMED_REFERENCE_0600
     * @tc.name      testExpressionsNamedReference0006
     * @tc.desc      Local variables have priority over global variables.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNamedReference0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let shadowVar = "local";
      expect(shadowVar).assertEqual("local");
      expect(shadowVar_1).assertEqual("global");
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NAMED_REFERENCE_0700
     * @tc.name      testExpressionsNamedReference0007
     * @tc.desc      Cross-module reference function.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNamedReference0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(add_2(1, 2)).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NAMED_REFERENCE_0800
     * @tc.name      testExpressionsNamedReference0008
     * @tc.desc      Correctly instantiating generic methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNamedReference0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result1 = identity_3<string>("hello");
      let result2 = identity_3<number>(42);
      expect(result1).assertEqual('hello');
      expect(result2).assertEqual(42);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NAMED_REFERENCE_0900
     * @tc.name      testExpressionsNamedReference0009
     * @tc.desc      Missing generic parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNamedReference0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = identity_4("hello");
      expect(result).assertEqual("hello");
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NAMED_REFERENCE_1000
     * @tc.name      testExpressionsNamedReference0010
     * @tc.desc      A function reference generates a unique object.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNamedReference0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ref1 = sampleFunc_5;
      const ref2 = sampleFunc_5;
      expect(ref1).assertEqual(ref2)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NAMED_REFERENCE_1100
     * @tc.name      testExpressionsNamedReference0011
     * @tc.desc      The function parameter name has a higher priority than the global variable name.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNamedReference0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = testParamShadow("local");
      expect(x).assertEqual("local");
      expect(shadowVar_6).assertEqual("global");
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NAMED_REFERENCE_1200
     * @tc.name      testExpressionsNamedReference0012
     * @tc.desc      The verification parameter type must match exactly the declaration.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNamedReference0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = strictType_7(10);
      expect(x).assertEqual(10);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NAMED_REFERENCE_1300
     * @tc.name      testExpressionsNamedReference0013
     * @tc.desc      To verify the initialization behavior of default parameter values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNamedReference0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = withDefault_8();
      expect(x).assertEqual(6);
      let y: number = withDefault_8(10);
      expect(y).assertEqual(10);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NAMED_REFERENCE_1400
     * @tc.name      testExpressionsNamedReference0014
     * @tc.desc      Validation parameters can be of function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNamedReference0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      callbackHandler_9((msg) => { expect(msg).assertEqual('Hello from callback'); });
      let msg = 'Hello from callback';
      expect(msg).assertEqual('Hello from callback')
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NAMED_REFERENCE_1500
     * @tc.name      testExpressionsNamedReference0015
     * @tc.desc      The function parameters and variables have the same name.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNamedReference0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      testNameConflict(() => {});
      expect(callback_10).assertEqual("I am a string");
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NAMED_REFERENCE_1600
     * @tc.name      testExpressionsNamedReference0016
     * @tc.desc      Qualified name references local module members.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNamedReference0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data1: string = MyModule_11.moduleVar;
      expect(data1).assertEqual("Module Variable");
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NAMED_REFERENCE_1700
     * @tc.name      testExpressionsNamedReference0017
     * @tc.desc      Validate that the scope of the parameters is limited to the function.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNamedReference0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      scopeTest("local");
      expect(param_12).assertEqual("global");
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NAMED_REFERENCE_1800
     * @tc.name      testExpressionsNamedReference0018
     * @tc.desc      Restricting access function by namespace.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNamedReference0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = MathUtils_13.sum(2, 3);
      expect(result).assertEqual(5);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NAMED_REFERENCE_1900
     * @tc.name      testExpressionsNamedReference0019
     * @tc.desc      Correctly instantiating generic class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNamedReference0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const stringBox = new Myclass_15<string>("hello");
      const value = stringBox.getValue();
      expect(value).assertEqual("hello");
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NAMED_REFERENCE_2000
     * @tc.name      testExpressionsNamedReference0020
     * @tc.desc      Block-level scope has higher priority than global scope.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNamedReference0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      if (true) {
        let count = 20;
        expect(count).assertEqual(20);
      }
      expect(count_16).assertEqual(10);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NAMED_REFERENCE_2100
     * @tc.name      testExpressionsNamedReference0021
     * @tc.desc      Incorrect type of generic function parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNamedReference0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Lengthwise_17 = {length: 5};
      logLength_17(obj);
      expect(obj.toString()).assertEqual('[object Object]');
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NAMED_REFERENCE_2200
     * @tc.name      testExpressionsNamedReference0022
     * @tc.desc      Cross-module reference generic functions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNamedReference0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = identity_19<string>("hello");
      expect(result).assertEqual("hello");
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NAMED_REFERENCE_2300
     * @tc.name      testExpressionsNamedReference0023
     * @tc.desc      Cross-module reference type alias.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNamedReference0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const id1: UserID_20 = "user-001";
      const id2: UserID_20 = 1001;
      expect(id1).assertEqual("user-001");
      expect(id2).assertEqual(1001);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NAMED_REFERENCE_2400
     * @tc.name      testExpressionsNamedReference0024
     * @tc.desc      Cross-module reference enum type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNamedReference0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = ColorSet_21.Green;
      expect(a).assertEqual(1);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NAMED_REFERENCE_2500
     * @tc.name      testExpressionsNamedReference0025
     * @tc.desc      Reference enumerated type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNamedReference0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: number = ColorSet_23.Green;
      expect(c).assertEqual(1);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NAMED_REFERENCE_2600
     * @tc.name      testExpressionsNamedReference0026
     * @tc.desc      Reference type alias.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNamedReference0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const id1: UserID_24 = "user-001";
      const id2: UserID_24 = 1001;
      expect(id1).assertEqual("user-001");
      expect(id2).assertEqual(1001);
    })
  });
}