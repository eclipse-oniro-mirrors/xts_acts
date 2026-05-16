/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import { util } from '@kit.ArkTS';
import Stack from '@ohos.util.Stack';

function sleep(count: int): Promise<void> {
  return new Promise<void>((resolve: (value: PromiseLike<void>) => void, reject: (value: Error) => void) => {
    setTimeout(() => {
      resolve(Promise.resolve())
    }, count)
  })
}

interface _KeyObj { key: string }

class TestClass {
  name: string = "";
  age: number = 0;
}

interface TestObj1 {
  a: number;
  b: string;
  c: number[];
}

class SpecialArray {
  abc: number = 0;
  aaa: number = 0;
  length: number = 0;
}

type MixedTuple1 = [number, string, boolean, null, undefined, number];

class CustomObject {
  customKey: string = "";
  a: number = 0;
}

class FunctionObject1 {
  a: number = 0;
  b: () => void = () => {};
}

class BufferObject {
  buffer: ArrayBuffer = new ArrayBuffer(0);
}

class MapObject1 {
  map: Map<string, string> = new Map<string, string>();
}

class SetObject1 {
  set: Set<number> = new Set<number>();
}

class PromiseObject1 {
  promise: Promise<string> = new Promise<string>(() => {});
}

class RegExpObject1 {
  regex: RegExp = new RegExp("abc", "gi");
}

class UndefinedObject {
  a?: number = undefined;
  b: number = 0;
}

class NullObject {
  a: number | null = null;
  b: number = 0;
}

class NaNObject {
  a: number = NaN;
  b: number = 0;
}

class InfinityObject {
  a: number = Infinity;
  b: number = 0;
}

class TestObj2 {
  a: number = 0;
  b: string = "";
  c: number[] = [];
}

type MixedTuple2 = [number, string, boolean, null, undefined, number];

class FunctionObject2 {
  a: number = 0;
  b: () => void = () => {};
}

class MapObject2 {
  map: Map<string, string> = new Map<string, string>();
}

class SetObject2 {
  set: Set<number> = new Set<number>();
}

class PromiseObject2 {
  promise: Promise<string> = new Promise<string>(() => {});
}

class RegExpObject2 {
  regex: RegExp = new RegExp("abc", "gi");
}

export default function Stack01Test(): void {
  describe('Stack01Test', () => {
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_0100
     * @tc.name      testStack01Chapter0001
     * @tc.desc      Create a new Stack instance without any parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0001';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      expect(stack != null).assertTrue();
      expect(stack.isEmpty()).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_0200
     * @tc.name      testStack01Chapter0002
     * @tc.desc      Create a new Stack instance with multiple generic types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0002';
      console.log(TAG + ' start');
      let stack = new Stack<number | string | Object>();
      expect(stack != null).assertTrue();
      expect(stack.isEmpty()).assertTrue();
      stack.push(123);
      stack.push("test");
      let kv: _KeyObj = {key: "value"};
      stack.push(kv);
      expect(stack.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_0300
     * @tc.name      testStack01Chapter0003
     * @tc.desc      Create multiple Stack instances and verify they are independent
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0003';
      console.log(TAG + ' start');
      let stack1 = new Stack<number>();
      let stack2 = new Stack<string>();
      stack1.push(1);
      stack2.push("a");
      expect(stack1.length).assertEqual(1);
      expect(stack2.length).assertEqual(1);
      expect(stack1.peek()).assertEqual(1);
      expect(stack2.peek()).assertEqual("a");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_0400
     * @tc.name      testStack01Chapter0004
     * @tc.desc      Verify Stack instance type is correct
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0004';
      console.log(TAG + ' start');
      let stack = new Stack<boolean>();
      expect(stack instanceof Stack).assertTrue();
      expect(typeof stack.push).assertEqual("function");
      expect(typeof stack.pop).assertEqual("function");
      expect(typeof stack.peek).assertEqual("function");
      expect(typeof stack.isEmpty).assertEqual("function");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_0500
     * @tc.name      testStack01Chapter0005
     * @tc.desc      Push a number to the Stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0005';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      let result = stack.push(123);
      expect(result).assertEqual(123);
      expect(stack.length).assertEqual(1);
      expect(stack.peek()).assertEqual(123);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_0600
     * @tc.name      testStack01Chapter0006
     * @tc.desc      Push a string to the Stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0006';
      console.log(TAG + ' start');
      let stack = new Stack<string>();
      let result = stack.push("test");
      expect(result).assertEqual("test");
      expect(stack.length).assertEqual(1);
      expect(stack.peek()).assertEqual("test");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_0700
     * @tc.name      testStack01Chapter0007
     * @tc.desc      Push a boolean to the Stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0007';
      console.log(TAG + ' start');
      let stack = new Stack<boolean>();
      let result = stack.push(true);
      expect(result).assertTrue();
      expect(stack.length).assertEqual(1);
      expect(stack.peek()).assertTrue();
      stack.push(false);
      expect(stack.length).assertEqual(2);
      expect(stack.peek()).assertFalse();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_0800
     * @tc.name      testStack01Chapter0008
     * @tc.desc      Push number 0 to the Stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0008';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      let result = stack.push(0);
      expect(result).assertEqual(0);
      expect(stack.length).assertEqual(1);
      expect(stack.peek()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_0900
     * @tc.name      testStack01Chapter0009
     * @tc.desc      Push NaN to the Stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0009';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      let result = stack.push(NaN);
      expect(isNaN(result)).assertTrue();
      expect(stack.length).assertEqual(1);
      expect(isNaN(stack.peek() as number)).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_1000
     * @tc.name      testStack01Chapter0010
     * @tc.desc      Push -0 to the Stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0010';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      let result = stack.push(-0);
      expect(result).assertEqual(0);
      expect(stack.length).assertEqual(1);
      expect(stack.peek()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_1100
     * @tc.name      testStack01Chapter0011
     * @tc.desc      Push Infinity to the Stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0011';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      let result = stack.push(Infinity);
      expect(result).assertEqual(Infinity);
      expect(stack.length).assertEqual(1);
      expect(stack.peek()).assertEqual(Infinity);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_1200
     * @tc.name      testStack01Chapter0012
     * @tc.desc      Push -Infinity to the Stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0012';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      let result = stack.push(-Infinity);
      expect(result).assertEqual(-Infinity);
      expect(stack.length).assertEqual(1);
      expect(stack.peek()).assertEqual(-Infinity);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_1300
     * @tc.name      testStack01Chapter0013
     * @tc.desc      Push Number.MAX_VALUE to the Stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0013';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      let result = stack.push(Number.MAX_VALUE);
      expect(result).assertEqual(1.7976931348623157e+308);
      expect(stack.length).assertEqual(1);
      expect(stack.peek()).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_1400
     * @tc.name      testStack01Chapter0014
     * @tc.desc      Push Number.MIN_VALUE to the Stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0014';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      let result = stack.push(Number.MIN_VALUE);
      expect(result).assertEqual(5e-324);
      expect(stack.length).assertEqual(1);
      expect(stack.peek()).assertEqual(Number.MIN_VALUE);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_1500
     * @tc.name      testStack01Chapter0015
     * @tc.desc      Push Number.EPSILON to the Stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0015';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      let result = stack.push(Number.EPSILON);
      expect(result).assertEqual(2.220446049250313e-16);
      expect(stack.length).assertEqual(1);
      expect(stack.peek()).assertEqual(Number.EPSILON);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_1600
     * @tc.name      testStack01Chapter0016
     * @tc.desc      Push Number.MAX_SAFE_INTEGER to the Stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0016';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      let result = stack.push(Number.MAX_SAFE_INTEGER);
      expect(result).assertEqual(9007199254740991);
      expect(stack.length).assertEqual(1);
      expect(stack.peek()).assertEqual(Number.MAX_SAFE_INTEGER);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_1700
     * @tc.name      testStack01Chapter0017
     * @tc.desc      Push bigint value to the Stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0017';
      console.log(TAG + ' start');
      let stack = new Stack<bigint>();
      let result = stack.push(BigInt(9007199254740991));
      expect(result).assertEqual(BigInt(9007199254740991));
      expect(stack.length).assertEqual(1);
      expect(stack.peek()).assertEqual(BigInt(9007199254740991));
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_1800
     * @tc.name      testStack01Chapter0018
     * @tc.desc      Push double value to the Stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0018';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      let result = stack.push(123.456);
      expect(result).assertEqual(123.456);
      expect(stack.length).assertEqual(1);
      expect(stack.peek()).assertEqual(123.456);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_1900
     * @tc.name      testStack01Chapter0019
     * @tc.desc      Push hex value to the Stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0019';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      let result = stack.push(0x0102);
      expect(result).assertEqual(258);
      expect(stack.length).assertEqual(1);
      expect(stack.peek()).assertEqual(258);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_2000
     * @tc.name      testStack01Chapter0020
     * @tc.desc      Push scientific notation value to the Stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0020';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      let result = stack.push(1e3);
      expect(result).assertEqual(1000);
      expect(stack.length).assertEqual(1);
      expect(stack.peek()).assertEqual(1000);
      stack.push(2.5e-2);
      expect(stack.peek()).assertEqual(0.025);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_2100
     * @tc.name      testStack01Chapter0021
     * @tc.desc      Push empty string to the Stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0021';
      console.log(TAG + ' start');
      let stack = new Stack<string>();
      let result = stack.push("");
      expect(result).assertEqual("");
      expect(stack.length).assertEqual(1);
      expect(stack.peek()).assertEqual("");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_2200
     * @tc.name      testStack01Chapter0022
     * @tc.desc      Push string with special characters to the Stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0022';
      console.log(TAG + ' start');
      let stack = new Stack<string>();
      let specialChars = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
      let result = stack.push(specialChars);
      expect(result).assertEqual(specialChars);
      expect(stack.length).assertEqual(1);
      expect(stack.peek()).assertEqual(specialChars);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_2300
     * @tc.name      testStack01Chapter0023
     * @tc.desc      Push string with ASCII characters to the Stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0023';
      console.log(TAG + ' start');
      let stack = new Stack<string>();
      let asciiChars = "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
      let result = stack.push(asciiChars);
      expect(result).assertEqual(asciiChars);
      expect(stack.length).assertEqual(1);
      expect(stack.peek()).assertEqual(asciiChars);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_2400
     * @tc.name      testStack01Chapter0024
     * @tc.desc      Push string with repeated special characters to the Stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0024';
      console.log(TAG + ' start');
      let stack = new Stack<string>();
      let repeatedChars = " !!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~";
      let result = stack.push(repeatedChars);
      expect(result).assertEqual(repeatedChars);
      expect(stack.length).assertEqual(1);
      expect(stack.peek()).assertEqual(repeatedChars);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_2500
     * @tc.name      testStack01Chapter0025
     * @tc.desc      Push string with escape characters to the Stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0025';
      console.log(TAG + ' start');
      let stack = new Stack<string>();
      let escapeStr = "\a\b\f\n\r\t\v\\\'\"\?";
      let result = stack.push(escapeStr);
      expect(result).assertEqual(escapeStr);
      expect(stack.length).assertEqual(1);
      expect(stack.peek()).assertEqual(escapeStr);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_2600
     * @tc.name      testStack01Chapter0026
     * @tc.desc      Push string with emoji to the Stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0026';
      console.log(TAG + ' start');
      let stack = new Stack<string>();
      let emojiStr = "👆👿👀💯🎅😼🔧💇🤼‍♂️🛢🀄🏴";
      let result = stack.push(emojiStr);
      expect(result).assertEqual(emojiStr);
      expect(stack.length).assertEqual(1);
      expect(stack.peek()).assertEqual(emojiStr);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_2700
     * @tc.name      testStack01Chapter0027
     * @tc.desc      Push array to the Stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0027';
      console.log(TAG + ' start');
      let stack = new Stack<number[]>();
      let arr: number[] = [72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63];
      let result = stack.push(arr);
      expect(result).assertEqual(arr);
      expect(stack.length).assertEqual(1);
      expect(stack.peek()).assertEqual(arr);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_2800
     * @tc.name      testStack01Chapter0028
     * @tc.desc      Push null to the Stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0028';
      console.log(TAG + ' start');
      let stack = new Stack<number | null>();
      let result = stack.push(null);
      expect(result).assertNull();
      expect(stack.length).assertEqual(1);
      expect(stack.peek()).assertNull();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_2900
     * @tc.name      testStack01Chapter0029
     * @tc.desc      Push undefined to the Stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0029';
      console.log(TAG + ' start');
      let stack = new Stack<number | undefined>();
      let result = stack.push(undefined);
      expect(result).assertUndefined();
      expect(stack.length).assertEqual(1);
      expect(stack.peek()).assertUndefined();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_3000
     * @tc.name      testStack01Chapter0030
     * @tc.desc      Push multiple items of different types to the Stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0030';
      console.log(TAG + ' start');
      let stack = new Stack<number | string | TestClass>();
      let result1 = stack.push("a");
      let result2 = stack.push(1);
      let c: TestClass = {name: "Dylan", age: 13};
      let result3 = stack.push(c);
      expect(result1).assertEqual("a");
      expect(result2).assertEqual(1);
      expect(result3).assertEqual(c);
      expect(stack.length).assertEqual(3);
      expect(stack.peek()).assertEqual(c);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_3100
     * @tc.name      testStack01Chapter0031
     * @tc.desc      Push object to the Stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0031';
      console.log(TAG + ' start');
      let stack = new Stack<TestObj1>();
      let obj: TestObj1 = {a: 1, b: "test", c: [1, 2, 3]};
      let result = stack.push(obj);
      expect(result).assertEqual(obj);
      expect(stack.length).assertEqual(1);
      expect(stack.peek()).assertEqual(obj);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_3200
     * @tc.name      testStack01Chapter0032
     * @tc.desc      Push TypedArray to the Stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0032';
      console.log(TAG + ' start');
      let stack = new Stack<Uint8Array>();
      let typedArray = new Uint8Array([72, 101, 108, 108, 111]);
      let result = stack.push(typedArray);
      expect(result).assertEqual(typedArray);
      expect(stack.length).assertEqual(1);
      expect(stack.peek()).assertEqual(typedArray);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_3300
     * @tc.name      testStack01Chapter0033
     * @tc.desc      Push multiple items and verify LIFO order
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0033';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(1);
      stack.push(2);
      stack.push(3);
      expect(stack.length).assertEqual(3);
      expect(stack.peek()).assertEqual(3);
      expect(stack.pop()).assertEqual(3);
      expect(stack.pop()).assertEqual(2);
      expect(stack.pop()).assertEqual(1);
      expect(stack.isEmpty()).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_3400
     * @tc.name      testStack01Chapter0034
     * @tc.desc      Test push method normal functionality
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0034';
      console.log(TAG + ' start');
      let stack = new Stack<number>();

      let result = stack.push(100);
      expect(result).assertEqual(100);
      expect(stack.length).assertEqual(1);
      expect(stack.peek()).assertEqual(100);

      stack.push(200);
      stack.push(300);
      expect(stack.length).assertEqual(3);
      expect(stack.peek()).assertEqual(300);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_3500
     * @tc.name      testStack01Chapter0035
     * @tc.desc      Push large number of items to test performance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0035';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      const count = 10000;
      for (let i = 0; i < count; i++) {
        stack.push(i);
      }
      expect(stack.length).assertEqual(count);
      expect(stack.peek()).assertEqual(count - 1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_3600
     * @tc.name      testStack01Chapter0036
     * @tc.desc      Push string with invalid Unicode encoding to the Stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0036';
      console.log(TAG + ' start');
      let stack = new Stack<string>();
      let invalidUnicode = "\udc04\ud83d\udff4";
      let result = stack.push(invalidUnicode);
      expect(result).assertEqual(invalidUnicode);
      expect(stack.length).assertEqual(1);
      expect(stack.peek()).assertEqual(invalidUnicode);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_3700
     * @tc.name      testStack01Chapter0037
     * @tc.desc      Push string keywords to the Stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0037';
      console.log(TAG + ' start');
      let stack = new Stack<string>();
      stack.push("0");
      stack.push("NaN");
      stack.push("");
      expect(stack.length).assertEqual(3);
      expect(stack.pop()).assertEqual("");
      expect(stack.pop()).assertEqual("NaN");
      expect(stack.pop()).assertEqual("0");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_3800
     * @tc.name      testStack01Chapter0038
     * @tc.desc      Push float value to the Stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0038';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      let result = stack.push(0xcafebabe);
      expect(result).assertEqual(0xcafebabe);
      expect(stack.length).assertEqual(1);
      expect(stack.peek()).assertEqual(0xcafebabe);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_3900
     * @tc.name      testStack01Chapter0039
     * @tc.desc      Push 32-bit hex value to the Stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0039';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      let result = stack.push(0x01020304);
      expect(result).assertEqual(0x01020304);
      expect(stack.length).assertEqual(1);
      expect(stack.peek()).assertEqual(0x01020304);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_4000
     * @tc.name      testStack01Chapter0040
     * @tc.desc      Push octal value to the Stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0040';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      let result = stack.push(0o3);
      expect(result).assertEqual(3);
      expect(stack.length).assertEqual(1);
      expect(stack.peek()).assertEqual(3);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_4100
     * @tc.name      testStack01Chapter0041
     * @tc.desc      Push exponential operator result to the Stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0041';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      let result = stack.push(2 ** 3);
      expect(result).assertEqual(8);
      expect(stack.length).assertEqual(1);
      expect(stack.peek()).assertEqual(8);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_4200
     * @tc.name      testStack01Chapter0042
     * @tc.desc      Push long value to the Stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0042';
      console.log(TAG + ' start');
      let stack = new Stack<bigint>();
      let minLong = BigInt("-9223372036854775808");
      let maxLong = BigInt("9223372036854775807");
      stack.push(minLong);
      stack.push(maxLong);
      expect(stack.pop()).assertEqual(maxLong);
      expect(stack.pop()).assertEqual(minLong);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_4300
     * @tc.name      testStack01Chapter0043
     * @tc.desc      Push char value to the Stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0043';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(0);
      stack.push(65535);
      expect(stack.pop()).assertEqual(65535);
      expect(stack.pop()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_4400
     * @tc.name      testStack01Chapter0044
     * @tc.desc      Push array with zero elements to the Stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0044';
      console.log(TAG + ' start');
      let stack = new Stack<number[]>();
      let arr: number[] = [72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63];
      let result = stack.push(arr);
      expect(result).assertEqual(arr);
      expect(stack.length).assertEqual(1);
      expect(stack.peek()).assertEqual(arr);
      expect(stack.peek().length).assertEqual(19);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_4500
     * @tc.name      testStack01Chapter0045
      * @tc.desc      Push array with negative numbers to the Stack
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 2
      */
    it("testStack01Chapter0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0045';
      console.log(TAG + ' start');
      let stack = new Stack<number[]>();
      let arr: number[] = [72, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63];
      let result = stack.push(arr);
      expect(result).assertEqual(arr);
      expect(stack.length).assertEqual(1);
      expect(stack.peek()).assertEqual(arr);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_4600
     * @tc.name      testStack01Chapter0046
     * @tc.desc      Push object with string key properties to the Stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0046';
      console.log(TAG + ' start');

      let stack = new Stack<SpecialArray>();
      let arr = new SpecialArray();
      arr.abc = 111;
      arr.aaa = 222;
      arr.length = 2;
      let result = stack.push(arr);
      expect(result).assertEqual(arr);
      expect(stack.length).assertEqual(1);
      expect(stack.peek()).assertEqual(arr);
      expect(stack.peek().abc).assertEqual(111);
      expect(stack.peek().aaa).assertEqual(222);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_4700
     * @tc.name      testStack01Chapter0047
     * @tc.desc      Push array with NaN and Infinity to the Stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0047';
      console.log(TAG + ' start');
      let stack = new Stack<number[]>();
      let arr: number[] = [72, 101, NaN, Infinity, 108, 111];
      let result = stack.push(arr);
      expect(result).assertEqual(arr);
      expect(stack.length).assertEqual(1);
      expect(stack.peek()).assertEqual(arr);
      expect(isNaN(stack.peek()[2])).assertTrue();
      expect(stack.peek()[3]).assertEqual(Infinity);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_4800
     * @tc.name      testStack01Chapter0048
     * @tc.desc      Push array with mixed types to the Stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0048';
      console.log(TAG + ' start');

      let stack = new Stack<MixedTuple1>();
      let arr: MixedTuple1 = [72, "abc", true, null, undefined, 108];
      let result = stack.push(arr);
      expect(result).assertEqual(arr);
      expect(stack.length).assertEqual(1);
      expect(stack.peek()).assertEqual(arr);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_4900
     * @tc.name      testStack01Chapter0049
     * @tc.desc      Push empty array to the Stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0049';
      console.log(TAG + ' start');
      let stack = new Stack<number[]>();
      let arr: number[] = [];
      let result = stack.push(arr);
      expect(result).assertEqual(arr);
      expect(stack.length).assertEqual(1);
      expect(stack.peek()).assertEqual(arr);
      expect(stack.peek().length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_5000
     * @tc.name      testStack01Chapter0050
     * @tc.desc      Push array with overflow values to the Stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0050';
      console.log(TAG + ' start');
      let stack = new Stack<number[]>();
      let arr: number[] = [256, 65536, 32768];
      let result = stack.push(arr);
      expect(result).assertEqual(arr);
      expect(stack.length).assertEqual(1);
      expect(stack.peek()).assertEqual(arr);
      expect(stack.peek()[0]).assertEqual(256);
      expect(stack.peek()[1]).assertEqual(65536);
      expect(stack.peek()[2]).assertEqual(32768);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_5100
     * @tc.name      testStack01Chapter0051
     * @tc.desc      Push object with custom key to the Stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0051';
      console.log(TAG + ' start');

      let stack = new Stack<CustomObject>();
      let obj = new CustomObject();
      obj.customKey = "value";
      obj.a = 1;
      let result = stack.push(obj);
      expect(result).assertEqual(obj);
      expect(stack.length).assertEqual(1);
      expect(stack.peek()).assertEqual(obj);
      expect(stack.peek().a).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_5200
     * @tc.name      testStack01Chapter0052
      * @tc.desc      Push object with function property to the Stack
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 2
      */
    it("testStack01Chapter0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0052';
      console.log(TAG + ' start');

      let stack = new Stack<FunctionObject1>();
      let obj = new FunctionObject1();
      obj.a = 1;
      let result = stack.push(obj);
      expect(result).assertEqual(obj);
      expect(stack.length).assertEqual(1);
      expect(stack.peek()).assertEqual(obj);
      expect(stack.peek().a).assertEqual(1);
      expect(typeof stack.peek().b).assertEqual("function");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_5300
     * @tc.name      testStack01Chapter0053
     * @tc.desc      Push object with ArrayBuffer property to the Stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0053';
      console.log(TAG + ' start');

      let stack = new Stack<BufferObject>();
      let obj = new BufferObject();
      obj.buffer = new ArrayBuffer(16);
      let result = stack.push(obj);
      expect(result).assertEqual(obj);
      expect(stack.length).assertEqual(1);
      expect(stack.peek()).assertEqual(obj);
      expect(stack.peek().buffer.byteLength).assertEqual(16);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_5400
     * @tc.name      testStack01Chapter0054
      * @tc.desc      Push object with Map property to the Stack
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 2
      */
    it("testStack01Chapter0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0054';
      console.log(TAG + ' start');
      let stack = new Stack<MapObject1>();
      let obj = new MapObject1();
      obj.map.set('key1', 'value1');
      let result = stack.push(obj);
      expect(result).assertEqual(obj);
      expect(stack.length).assertEqual(1);
      expect(stack.peek()).assertEqual(obj);
      expect(stack.peek().map.size).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_5500
     * @tc.name      testStack01Chapter0055
      * @tc.desc      Push object with Set property to the Stack
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 2
      */
    it("testStack01Chapter0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0055';
      console.log(TAG + ' start');
      let stack = new Stack<SetObject1>();
      let obj = new SetObject1();
      obj.set.add(1);
      obj.set.add(2);
      obj.set.add(3);
      let result = stack.push(obj);
      expect(result).assertEqual(obj);
      expect(stack.length).assertEqual(1);
      expect(stack.peek()).assertEqual(obj);
      expect(stack.peek().set.size).assertEqual(3);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_5600
     * @tc.name      testStack01Chapter0056
      * @tc.desc      Push object with Promise property to the Stack
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 2
      */
    it("testStack01Chapter0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0056';
      console.log(TAG + ' start');
      let stack = new Stack<PromiseObject1>();
      let obj = new PromiseObject1();
      let result = stack.push(obj);
      expect(result).assertEqual(obj);
      expect(stack.length).assertEqual(1);
      expect(stack.peek()).assertEqual(obj);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_5700
     * @tc.name      testStack01Chapter0057
      * @tc.desc      Push object with RegExp property to the Stack
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 2
      */
    it("testStack01Chapter0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0057';
      console.log(TAG + ' start');
      let stack = new Stack<RegExpObject1>();
      let obj = new RegExpObject1();
      let result = stack.push(obj);
      expect(result).assertEqual(obj);
      expect(stack.length).assertEqual(1);
      expect(stack.peek()).assertEqual(obj);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_5800
     * @tc.name      testStack01Chapter0058
     * @tc.desc      Push object with undefined property to the Stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0058';
      console.log(TAG + ' start');
      let stack = new Stack<UndefinedObject>();
      let obj = new UndefinedObject();
      obj.b = 1;
      let result = stack.push(obj);
      expect(result).assertEqual(obj);
      expect(stack.length).assertEqual(1);
      expect(stack.peek()).assertEqual(obj);
      expect(stack.peek().b).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_5900
     * @tc.name      testStack01Chapter0059
     * @tc.desc      Push object with null property to the Stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0059';
      console.log(TAG + ' start');
      let stack = new Stack<NullObject>();
      let obj = new NullObject();
      obj.b = 1;
      let result = stack.push(obj);
      expect(result).assertEqual(obj);
      expect(stack.length).assertEqual(1);
      expect(stack.peek()).assertEqual(obj);
      expect(stack.peek().b).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_6000
     * @tc.name      testStack01Chapter0060
     * @tc.desc      Push object with NaN property to the Stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0060';
      console.log(TAG + ' start');
      let stack = new Stack<NaNObject>();
      let obj = new NaNObject();
      obj.b = 1;
      let result = stack.push(obj);
      expect(result).assertEqual(obj);
      expect(stack.length).assertEqual(1);
      expect(stack.peek()).assertEqual(obj);
      expect(isNaN(stack.peek().a)).assertTrue();
      expect(stack.peek().b).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_6100
     * @tc.name      testStack01Chapter0061
     * @tc.desc      Push object with Infinity property to the Stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0061';
      console.log(TAG + ' start');
      let stack = new Stack<InfinityObject>();
      let obj = new InfinityObject();
      obj.b = 1;
      let result = stack.push(obj);
      expect(result).assertEqual(obj);
      expect(stack.length).assertEqual(1);
      expect(stack.peek()).assertEqual(obj);
      expect(stack.peek().b).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_6200
     * @tc.name      testStack01Chapter0062
     * @tc.desc      Pop from empty stack should return undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0062';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      let errorCaught: boolean = false;
      try {
        stack.pop();
      } catch (err) {
        errorCaught = true;
        expect(err !== undefined).assertTrue();
      }
      expect(errorCaught).assertTrue();
      expect(stack.length).assertEqual(0);
      expect(stack.isEmpty()).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_6300
     * @tc.name      testStack01Chapter0063
     * @tc.desc      Pop number from stack and verify LIFO order
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0063';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(1);
      stack.push(2);
      stack.push(3);
      expect(stack.pop()).assertEqual(3);
      expect(stack.pop()).assertEqual(2);
      expect(stack.pop()).assertEqual(1);
      expect(stack.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_6400
     * @tc.name      testStack01Chapter0064
     * @tc.desc      Pop string from stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0064';
      console.log(TAG + ' start');
      let stack = new Stack<string>();
      stack.push("hello");
      stack.push("world");
      expect(stack.pop()).assertEqual("world");
      expect(stack.pop()).assertEqual("hello");
      let errorCaught: boolean = false;
      try {
        stack.pop();
      } catch (err) {
        errorCaught = true;
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_6500
     * @tc.name      testStack01Chapter0065
     * @tc.desc      Pop boolean from stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0065';
      console.log(TAG + ' start');
      let stack = new Stack<boolean>();
      stack.push(true);
      stack.push(false);
      stack.push(true);
      expect(stack.pop()).assertTrue();
      expect(stack.pop()).assertFalse();
      expect(stack.pop()).assertTrue();
      expect(stack.isEmpty()).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_6600
     * @tc.name      testStack01Chapter0066
     * @tc.desc      Pop number 0 from stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0066';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(0);
      expect(stack.pop()).assertEqual(0);
      let errorCaught: boolean = false;
      try {
        stack.pop();
      } catch (err) {
        errorCaught = true;
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_6700
     * @tc.name      testStack01Chapter0067
     * @tc.desc      Pop NaN from stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0067';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(NaN);
      let result = stack.pop();
      expect(isNaN(result as number)).assertTrue();
      expect(stack.isEmpty()).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_6800
     * @tc.name      testStack01Chapter0068
     * @tc.desc      Pop Infinity from stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0068';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(Infinity);
      stack.push(-Infinity);
      expect(stack.pop()).assertEqual(-Infinity);
      expect(stack.pop()).assertEqual(Infinity);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_6900
     * @tc.name      testStack01Chapter0069
     * @tc.desc      Pop Number.MAX_VALUE from stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0069';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(Number.MAX_VALUE);
      expect(stack.pop()).assertEqual(1.7976931348623157e+308);
      expect(stack.isEmpty()).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_7000
     * @tc.name      testStack01Chapter0070
     * @tc.desc      Pop Number.MIN_VALUE from stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0070';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(Number.MIN_VALUE);
      expect(stack.pop()).assertEqual(5e-324);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_7100
     * @tc.name      testStack01Chapter0071
     * @tc.desc      Pop Number.MAX_SAFE_INTEGER from stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0071';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(Number.MAX_SAFE_INTEGER);
      expect(stack.pop()).assertEqual(9007199254740991);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_7200
     * @tc.name      testStack01Chapter0072
     * @tc.desc      Pop bigint from stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0072';
      console.log(TAG + ' start');
      let stack = new Stack<bigint>();
      stack.push(BigInt("9223372036854775807"));
      stack.push(BigInt("-9223372036854775808"));
      expect(stack.pop()).assertEqual(BigInt("-9223372036854775808"));
      expect(stack.pop()).assertEqual(BigInt("9223372036854775807"));
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_7300
     * @tc.name      testStack01Chapter0073
     * @tc.desc      Pop double value from stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0073';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(123.456);
      stack.push(0.0001);
      expect(stack.pop()).assertEqual(0.0001);
      expect(stack.pop()).assertEqual(123.456);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_7400
     * @tc.name      testStack01Chapter0074
     * @tc.desc      Pop hex value from stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0074';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(0x0102);
      expect(stack.pop()).assertEqual(258);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_7500
     * @tc.name      testStack01Chapter0075
     * @tc.desc      Pop scientific notation value from stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0075';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(1e3);
      stack.push(2.5e-2);
      expect(stack.pop()).assertEqual(0.025);
      expect(stack.pop()).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_7600
     * @tc.name      testStack01Chapter0076
     * @tc.desc      Pop empty string from stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0076';
      console.log(TAG + ' start');
      let stack = new Stack<string>();
      stack.push("");
      stack.push("test");
      expect(stack.pop()).assertEqual("test");
      expect(stack.pop()).assertEqual("");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_7700
     * @tc.name      testStack01Chapter0077
     * @tc.desc      Pop string with special characters from stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0077';
      console.log(TAG + ' start');
      let stack = new Stack<string>();
      let specialChars = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
      stack.push(specialChars);
      expect(stack.pop()).assertEqual(specialChars);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_7800
     * @tc.name      testStack01Chapter0078
     * @tc.desc      Pop string with emoji from stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0078';
      console.log(TAG + ' start');
      let stack = new Stack<string>();
      let emojiStr = "👆👿👀💯🎅😼🔧💇🤼‍♂️🛢🀄🏴";
      stack.push(emojiStr);
      expect(stack.pop()).assertEqual(emojiStr);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_7900
     * @tc.name      testStack01Chapter0079
     * @tc.desc      Pop array from stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0079';
      console.log(TAG + ' start');
      let stack = new Stack<number[]>();
      let arr: number[] = [72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63];
      stack.push(arr);
      let result = stack.pop();
      expect(result).assertEqual(arr);
      expect(stack.isEmpty()).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_8000
     * @tc.name      testStack01Chapter0080
     * @tc.desc      Pop null from stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0080';
      console.log(TAG + ' start');
      let stack = new Stack<number | null>();
      stack.push(null);
      stack.push(1);
      expect(stack.pop()).assertEqual(1);
      expect(stack.pop()).assertNull();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_8100
     * @tc.name      testStack01Chapter0081
     * @tc.desc      Pop undefined from stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0081';
      console.log(TAG + ' start');
      let stack = new Stack<number | undefined>();
      stack.push(undefined);
      stack.push(2);
      expect(stack.pop()).assertEqual(2);
      expect(stack.pop()).assertUndefined();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_8200
     * @tc.name      testStack01Chapter0082
     * @tc.desc      Pop object from stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0082';
      console.log(TAG + ' start');
      let stack = new Stack<TestObj2>();
      let obj = new TestObj2();
      obj.a = 1;
      obj.b = "test";
      obj.c = [1, 2, 3];
      stack.push(obj);
      let result = stack.pop();
      expect(result).assertEqual(obj);
      expect(result.a).assertEqual(1);
      expect(result.b).assertEqual("test");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_8300
     * @tc.name      testStack01Chapter0083
     * @tc.desc      Pop TypedArray from stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0083';
      console.log(TAG + ' start');
      let stack = new Stack<Uint8Array>();
      let typedArray = new Uint8Array([72, 101, 108, 108, 111]);
      stack.push(typedArray);
      expect(stack.pop()).assertEqual(typedArray);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_8400
     * @tc.name      testStack01Chapter0084
     * @tc.desc      Pop array with negative numbers from stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0084';
      console.log(TAG + ' start');
      let stack = new Stack<number[]>();
      let arr: number[] = [72, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63];
      stack.push(arr);
      expect(stack.pop()).assertEqual(arr);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_8500
     * @tc.name      testStack01Chapter0085
     * @tc.desc      Pop array with NaN and Infinity from stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0085';
      console.log(TAG + ' start');
      let stack = new Stack<number[]>();
      let arr: number[] = [72, 101, NaN, Infinity, 108, 111];
      stack.push(arr);
      let result = stack.pop();
      expect(result).assertEqual(arr);
      expect(isNaN(result[2])).assertTrue();
      expect(result[3]).assertEqual(Infinity);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_8600
     * @tc.name      testStack01Chapter0086
     * @tc.desc      Pop empty array from stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0086';
      console.log(TAG + ' start');
      let stack = new Stack<number[]>();
      let arr: number[] = [];
      stack.push(arr);
      let result = stack.pop();
      expect(result).assertEqual(arr);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_8700
     * @tc.name      testStack01Chapter0087
     * @tc.desc      Pop mixed type tuple from stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0087';
      console.log(TAG + ' start');
      let stack = new Stack<MixedTuple2>();
      let arr: MixedTuple2 = [72, "abc", true, null, undefined, 108];
      stack.push(arr);
      expect(stack.pop()).assertEqual(arr);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_8800
     * @tc.name      testStack01Chapter0088
     * @tc.desc      Pop object with function property from stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0088';
      console.log(TAG + ' start');
      let stack = new Stack<FunctionObject2>();
      let obj = new FunctionObject2();
      obj.a = 1;
      stack.push(obj);
      let result = stack.pop();
      expect(result).assertEqual(obj);
      expect(result.a).assertEqual(1);
      expect(typeof result.b).assertEqual("function");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_8900
     * @tc.name      testStack01Chapter0089
     * @tc.desc      Pop object with Map property from stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0089';
      console.log(TAG + ' start');
      let stack = new Stack<MapObject2>();
      let obj = new MapObject2();
      obj.map.set('key1', 'value1');
      stack.push(obj);
      let result = stack.pop();
      expect(result).assertEqual(obj);
      expect(result.map.size).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_9000
     * @tc.name      testStack01Chapter0090
     * @tc.desc      Pop object with Set property from stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0090';
      console.log(TAG + ' start');
      let stack = new Stack<SetObject2>();
      let obj = new SetObject2();
      obj.set.add(1);
      obj.set.add(2);
      obj.set.add(3);
      stack.push(obj);
      let result = stack.pop();
      expect(result).assertEqual(obj);
      expect(result.set.size).assertEqual(3);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_9100
     * @tc.name      testStack01Chapter0091
     * @tc.desc      Pop object with Promise property from stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0091';
      console.log(TAG + ' start');
      let stack = new Stack<PromiseObject2>();
      let obj = new PromiseObject2();
      stack.push(obj);
      let result = stack.pop();
      expect(result).assertEqual(obj);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTONE_9200
     * @tc.name      testStack01Chapter0092
     * @tc.desc      Pop object with RegExp property from stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack01Chapter0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack01Chapter0092';
      console.log(TAG + ' start');
      let stack = new Stack<RegExpObject2>();
      let obj = new RegExpObject2();
      stack.push(obj);
      let result = stack.pop();
      expect(result).assertEqual(obj);
    });

  })
}