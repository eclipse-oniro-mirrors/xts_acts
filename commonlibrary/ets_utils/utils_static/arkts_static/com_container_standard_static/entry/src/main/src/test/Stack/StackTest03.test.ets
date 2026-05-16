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

interface ContextType03 {
  multiplier: number;
  results: number[];
}

interface TestObject03 {
  id: number;
  name: string;
}

interface InnerObject03 {
  e: number;
}

interface MiddleObject03 {
  c: number;
  d: InnerObject03;
}

interface NestedObject03 {
  a: number;
  b: MiddleObject03;
}

interface ResultContainer03 {
  values: number[];
}

interface CallbackResult03 {
  value: string;
  index: number;
  stackSize: number;
}

interface UserData03 {
  id: number;
  name: string;
  active: boolean;
}

interface ContextObject03 {
  multiplier: number;
  results: number[];
}

interface ExternalData03 {
  values: number[];
}

interface ProcessorData03 {
  processedData: number[];
  multiplier: number;
}

interface TypedArrayContainer03 {
  name: string;
  arrayLength: number;
}

interface MixedArray03 {
  data: number[];
}

export default function Stack03Test(): void {
  describe('Stack03Test', () => {
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTTHREE_0100
     * @tc.name      testStack03Chapter0001
     * @tc.desc      Test forEach method with empty stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack03Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack03Chapter0001';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      let callCount = 0;

      stack.forEach((value, index): void => {
        callCount++;
      });

      expect(callCount).assertEqual(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTTHREE_0200
     * @tc.name      testStack03Chapter0002
     * @tc.desc      Test forEach method with basic number elements (document example)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack03Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack03Chapter0002';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(2);
      stack.push(4);
      stack.push(5);
      stack.push(4);
      let results: string[] = [];

      stack.forEach((value, index): void => {
        results.push(`value:${value} index:${index}`);
      });

      expect(results.length).assertEqual(4);
      expect(results[0]).assertEqual('value:2 index:0');
      expect(results[1]).assertEqual('value:4 index:1');
      expect(results[2]).assertEqual('value:5 index:2');
      expect(results[3]).assertEqual('value:4 index:3');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTTHREE_0300
     * @tc.name      testStack03Chapter0003
     * @tc.desc      Test forEach method with thisArg parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack03Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack03Chapter0003';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(1);
      stack.push(2);
      stack.push(3);

      let context: ContextType03 = { multiplier: 2, results: [] };

      stack.forEach((value, index): void => {
        context.results.push(value * context.multiplier);
      });

      expect(context.results.length).assertEqual(3);
      expect(context.results[0]).assertEqual(2);
      expect(context.results[1]).assertEqual(4);
      expect(context.results[2]).assertEqual(6);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTTHREE_0400
     * @tc.name      testStack03Chapter0004
     * @tc.desc      Test forEach method without index parameter in callback
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack03Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack03Chapter0004';
      console.log(TAG + ' start');
      let stack = new Stack<string>();
      stack.push("a");
      stack.push("b");
      stack.push("c");
      let values: string[] = [];

      stack.forEach((value): void => {
        values.push(value);
      });

      expect(values.length).assertEqual(3);
      expect(values[0]).assertEqual("a");
      expect(values[1]).assertEqual("b");
      expect(values[2]).assertEqual("c");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTTHREE_0500
     * @tc.name      testStack03Chapter0005
     * @tc.desc      Test forEach method with stack parameter in callback
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack03Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack03Chapter0005';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(10);
      stack.push(20);
      stack.push(30);
      let stackReferences: Stack<number>[] = [];

      stack.forEach((value, index): void => {
        stackReferences.push(stack);
      });

      expect(stackReferences.length).assertEqual(3);
      expect(stackReferences[0]).assertEqual(stack);
      expect(stackReferences[1]).assertEqual(stack);
      expect(stackReferences[2]).assertEqual(stack);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTTHREE_0600
     * @tc.name      testStack03Chapter0006
     * @tc.desc      Test forEach method with NaN values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack03Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack03Chapter0006';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(NaN);
      stack.push(1);
      stack.push(NaN);
      let nanCount = 0;

      stack.forEach((value): void => {
        if (isNaN(value)) {
          nanCount++;
        }
      });

      expect(nanCount).assertEqual(2);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTTHREE_0700
     * @tc.name      testStack03Chapter0007
     * @tc.desc      Test forEach method with Infinity values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack03Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack03Chapter0007';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(Infinity);
      stack.push(-Infinity);
      stack.push(0);
      let infinityCount = 0;
      let negativeInfinityCount = 0;

      stack.forEach((value): void => {
        if (value === Infinity) {
          infinityCount++;
        } else if (value === -Infinity) {
          negativeInfinityCount++;
        }
      });

      expect(infinityCount).assertEqual(1);
      expect(negativeInfinityCount).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTTHREE_0800
     * @tc.name      testStack03Chapter0008
     * @tc.desc      Test forEach method with zero values (0 and -0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack03Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack03Chapter0008';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(0);
      stack.push(-0);
      stack.push(1);
      let zeroCount = 0;

      stack.forEach((value): void => {
        if (value === 0) {
          zeroCount++;
        }
      });

      expect(zeroCount).assertEqual(2);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTTHREE_0900
     * @tc.name      testStack03Chapter0009
     * @tc.desc      Test forEach method with null values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack03Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack03Chapter0009';
      console.log(TAG + ' start');
      let stack = new Stack<number | null>();
      stack.push(null);
      stack.push(1);
      stack.push(null);
      let nullCount = 0;

      stack.forEach((value): void => {
        if (value === null) {
          nullCount++;
        }
      });

      expect(nullCount).assertEqual(2);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTTHREE_1000
     * @tc.name      testStack03Chapter0010
     * @tc.desc      Test forEach method with undefined values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack03Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack03Chapter0010';
      console.log(TAG + ' start');
      let stack = new Stack<number | undefined>();
      stack.push(undefined);
      stack.push(1);
      stack.push(undefined);
      let undefinedCount = 0;

      stack.forEach((value): void => {
        if (value === undefined) {
          undefinedCount++;
        }
      });

      expect(undefinedCount).assertEqual(2);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTTHREE_1100
     * @tc.name      testStack03Chapter0011
     * @tc.desc      Test forEach method with boolean values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack03Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack03Chapter0011';
      console.log(TAG + ' start');
      let stack = new Stack<boolean>();
      stack.push(true);
      stack.push(false);
      stack.push(true);
      let trueCount = 0;
      let falseCount = 0;

      stack.forEach((value): void => {
        if (value === true) {
          trueCount++;
        } else {
          falseCount++;
        }
      });

      expect(trueCount).assertEqual(2);
      expect(falseCount).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTTHREE_1200
     * @tc.name      testStack03Chapter0012
     * @tc.desc      Test forEach method with string values including special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack03Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack03Chapter0012';
      console.log(TAG + ' start');
      let stack = new Stack<string>();
      stack.push("!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~");
      stack.push("test");
      stack.push("normal");
      let specialCharFound = false;

      stack.forEach((value): void => {
        if (value.includes("!")) {
          specialCharFound = true;
        }
      });

      expect(specialCharFound).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTTHREE_1300
     * @tc.name      testStack03Chapter0013
     * @tc.desc      Test forEach method with ASCII characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack03Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack03Chapter0013';
      console.log(TAG + ' start');
      let stack = new Stack<string>();
      let asciiStr = "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
      stack.push(asciiStr);
      stack.push("test");
      let asciiFound = false;

      stack.forEach((value): void => {
        if (value.length > 50) {
          asciiFound = true;
        }
      });

      expect(asciiFound).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTTHREE_1400
     * @tc.name      testStack03Chapter0014
     * @tc.desc      Test forEach method with escape sequence characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack03Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack03Chapter0014';
      console.log(TAG + ' start');
      let stack = new Stack<string>();
      stack.push("\n\t\r\\\"\'");
      stack.push("normal");
      let escapeFound = false;

      stack.forEach((value): void => {
        if (value.includes("\n")) {
          escapeFound = true;
        }
      });

      expect(escapeFound).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTTHREE_1500
     * @tc.name      testStack03Chapter0015
     * @tc.desc      Test forEach method with emoji characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack03Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack03Chapter0015';
      console.log(TAG + ' start');
      let stack = new Stack<string>();
      stack.push("👆");
      stack.push("👿");
      stack.push("👀");
      let emojiCount = 0;

      stack.forEach((value): void => {
        if (value.length === 2) {
          emojiCount++;
        }
      });

      expect(emojiCount).assertEqual(3);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTTHREE_1600
     * @tc.name      testStack03Chapter0016
     * @tc.desc      Test forEach method with Unicode escape sequences
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack03Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack03Chapter0016';
      console.log(TAG + ' start');
      let stack = new Stack<string>();
      stack.push("\ud83d\udc46");
      stack.push("\ud83d\udc7f");
      stack.push("test");
      let unicodeFound = false;

      stack.forEach((value): void => {
        if (value.includes("\ud83d")) {
          unicodeFound = true;
        }
      });

      expect(unicodeFound).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTTHREE_1700
     * @tc.name      testStack03Chapter0017
     * @tc.desc      Test forEach method with Number.MAX_VALUE and Number.MIN_VALUE
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack03Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack03Chapter0017';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(Number.MAX_VALUE);
      stack.push(Number.MIN_VALUE);
      stack.push(1);
      let maxValueFound = false;
      let minValueFound = false;

      stack.forEach((value): void => {
        if (value === Number.MAX_VALUE) {
          maxValueFound = true;
        }
        if (value === Number.MIN_VALUE) {
          minValueFound = true;
        }
      });

      expect(maxValueFound).assertTrue();
      expect(minValueFound).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTTHREE_1800
     * @tc.name      testStack03Chapter0018
     * @tc.desc      Test forEach method with Number.EPSILON
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack03Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack03Chapter0018';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(Number.EPSILON);
      stack.push(1);
      stack.push(2);
      let epsilonFound = false;

      stack.forEach((value): void => {
        if (value === Number.EPSILON) {
          epsilonFound = true;
        }
      });

      expect(epsilonFound).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTTHREE_1900
     * @tc.name      testStack03Chapter0019
     * @tc.desc      Test forEach method with byte range values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack03Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack03Chapter0019';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(-128);
      stack.push(0);
      stack.push(127);
      let byteValues: number[] = [];

      stack.forEach((value): void => {
        byteValues.push(value);
      });

      expect(byteValues.length).assertEqual(3);
      expect(byteValues[0]).assertEqual(-128);
      expect(byteValues[1]).assertEqual(0);
      expect(byteValues[2]).assertEqual(127);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTTHREE_2000
     * @tc.name      testStack03Chapter0020
     * @tc.desc      Test forEach method with short range values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack03Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack03Chapter0020';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(-32768);
      stack.push(0);
      stack.push(32767);
      let shortValues: number[] = [];

      stack.forEach((value): void => {
        shortValues.push(value);
      });

      expect(shortValues.length).assertEqual(3);
      expect(shortValues[0]).assertEqual(-32768);
      expect(shortValues[1]).assertEqual(0);
      expect(shortValues[2]).assertEqual(32767);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTTHREE_2100
     * @tc.name      testStack03Chapter0021
     * @tc.desc      Test forEach method with int range values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack03Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack03Chapter0021';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(-2147483648);
      stack.push(0);
      stack.push(2147483647);
      let intValues: number[] = [];

      stack.forEach((value): void => {
        intValues.push(value);
      });

      expect(intValues.length).assertEqual(3);
      expect(intValues[0]).assertEqual(-2147483648);
      expect(intValues[1]).assertEqual(0);
      expect(intValues[2]).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTTHREE_2200
     * @tc.name      testStack03Chapter0022
     * @tc.desc      Test forEach method with long range values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack03Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack03Chapter0022';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(-9223372036854775808);
      stack.push(0);
      stack.push(9223372036854775807);
      let longValues: number[] = [];

      stack.forEach((value): void => {
        longValues.push(value);
      });

      expect(longValues.length).assertEqual(3);
      expect(longValues[0]).assertEqual(-9223372036854775808);
      expect(longValues[1]).assertEqual(0);
      expect(longValues[2]).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTTHREE_2300
     * @tc.name      testStack03Chapter0023
     * @tc.desc      Test forEach method with float range values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack03Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack03Chapter0023';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(1.40129846432481707e-45);
      stack.push(3.40282346638528860e+38);
      stack.push(0);
      let floatValues: number[] = [];

      stack.forEach((value): void => {
        floatValues.push(value);
      });

      expect(floatValues.length).assertEqual(3);
      expect(floatValues[1]).assertEqual(3.40282346638528860e+38);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTTHREE_2400
     * @tc.name      testStack03Chapter0024
     * @tc.desc      Test forEach method with double range values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack03Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack03Chapter0024';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(4.94065645841246544e-324);
      stack.push(1.79769313486231570e+308);
      stack.push(0);
      let doubleValues: number[] = [];

      stack.forEach((value): void => {
        doubleValues.push(value);
      });

      expect(doubleValues.length).assertEqual(3);
      expect(doubleValues[1]).assertEqual(1.79769313486231570e+308);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTTHREE_2500
     * @tc.name      testStack03Chapter0025
     * @tc.desc      Test forEach method with bigint values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack03Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack03Chapter0025';
      console.log(TAG + ' start');
      let stack = new Stack<bigint>();
      stack.push(9007199254740991n);
      stack.push(12345678901234567890n);
      stack.push(0n);
      let bigintValues: bigint[] = [];

      stack.forEach((value): void => {
        bigintValues.push(value);
      });

      expect(bigintValues.length).assertEqual(3);
      expect(bigintValues[0]).assertEqual(9007199254740991n);
      expect(bigintValues[1]).assertEqual(12345678901234567890n);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTTHREE_2600
     * @tc.name      testStack03Chapter0026
     * @tc.desc      Test forEach method with hexadecimal values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack03Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack03Chapter0026';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(0x0102);
      stack.push(0x01020304);
      stack.push(0x3);
      let hexValues: number[] = [];

      stack.forEach((value): void => {
        hexValues.push(value);
      });

      expect(hexValues.length).assertEqual(3);
      expect(hexValues[0]).assertEqual(258);
      expect(hexValues[1]).assertEqual(16909060);
      expect(hexValues[2]).assertEqual(3);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTTHREE_2700
     * @tc.name      testStack03Chapter0027
     * @tc.desc      Test forEach method with exponent values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack03Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack03Chapter0027';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(2 ** 3);
      stack.push(1e3);
      stack.push(2.5e-2);
      let exponentValues: number[] = [];

      stack.forEach((value): void => {
        exponentValues.push(value);
      });

      expect(exponentValues.length).assertEqual(3);
      expect(exponentValues[0]).assertEqual(8);
      expect(exponentValues[1]).assertEqual(1000);
      expect(exponentValues[2]).assertEqual(0.025);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTTHREE_2800
     * @tc.name      testStack03Chapter0028
     * @tc.desc      Test forEach method with array elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack03Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack03Chapter0028';
      console.log(TAG + ' start');
      let stack = new Stack<number[]>();
      let arr1: number[] = [1, 2, 3];
      let arr2: number[] = [4, 5, 6];
      stack.push(arr1);
      stack.push(arr2);
      let arrayLengths: number[] = [];

      stack.forEach((value): void => {
        arrayLengths.push(value.length);
      });

      expect(arrayLengths.length).assertEqual(2);
      expect(arrayLengths[0]).assertEqual(3);
      expect(arrayLengths[1]).assertEqual(3);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTTHREE_2900
     * @tc.name      testStack03Chapter0029
     * @tc.desc      Test forEach method with TypedArray elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack03Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack03Chapter0029';
      console.log(TAG + ' start');
      let stack = new Stack<Uint8Array>();
      let array1 = new Uint8Array([72, 101, 108, 108, 111]);
      let array2 = new Uint8Array([87, 111, 114, 108, 100]);
      stack.push(array1);
      stack.push(array2);
      let arraySizes: number[] = [];

      stack.forEach((value): void => {
        arraySizes.push(value.length);
      });

      expect(arraySizes.length).assertEqual(2);
      expect(arraySizes[0]).assertEqual(5);
      expect(arraySizes[1]).assertEqual(5);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTTHREE_3000
     * @tc.name      testStack03Chapter0030
     * @tc.desc      Test forEach method with Map objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack03Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack03Chapter0030';
      console.log(TAG + ' start');
      let stack = new Stack<Map<string, number>>();
      let map1 = new Map<string, number>([["a", 1], ["b", 2]]);
      let map2 = new Map<string, number>([["c", 3], ["d", 4]]);
      stack.push(map1);
      stack.push(map2);
      let mapSizes: number[] = [];

      stack.forEach((value): void => {
        mapSizes.push(value.size);
      });

      expect(mapSizes.length).assertEqual(2);
      expect(mapSizes[0]).assertEqual(2);
      expect(mapSizes[1]).assertEqual(2);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTTHREE_3100
     * @tc.name      testStack03Chapter0031
     * @tc.desc      Test forEach method with Set objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack03Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack03Chapter0031';
      console.log(TAG + ' start');
      let stack = new Stack<Set<number>>();
      let set1 = new Set<number>([1, 2, 3]);
      let set2 = new Set<number>([4, 5, 6]);
      stack.push(set1);
      stack.push(set2);
      let setSizes: number[] = [];

      stack.forEach((value): void => {
        setSizes.push(value.size);
      });

      expect(setSizes.length).assertEqual(2);
      expect(setSizes[0]).assertEqual(3);
      expect(setSizes[1]).assertEqual(3);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTTHREE_3200
     * @tc.name      testStack03Chapter0032
     * @tc.desc      Test forEach method with object elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack03Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack03Chapter0032';
      console.log(TAG + ' start');
      let stack = new Stack<TestObject03>();
      let obj1: TestObject03 = {id: 1, name: "first"};
      let obj2: TestObject03 = {id: 2, name: "second"};
      stack.push(obj1);
      stack.push(obj2);
      let ids: number[] = [];

      stack.forEach((value): void => {
        ids.push(value.id);
      });

      expect(ids.length).assertEqual(2);
      expect(ids[0]).assertEqual(1);
      expect(ids[1]).assertEqual(2);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTTHREE_3300
     * @tc.name      testStack03Chapter0033
     * @tc.desc      Test forEach method with nested object elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack03Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack03Chapter0033';
      console.log(TAG + ' start');
      let stack = new Stack<NestedObject03>();
      let inner1: InnerObject03 = {e: 3};
      let middle1: MiddleObject03 = {c: 2, d: inner1};
      let obj1: NestedObject03 = {a: 1, b: middle1};
      let inner2: InnerObject03 = {e: 30};
      let middle2: MiddleObject03 = {c: 20, d: inner2};
      let obj2: NestedObject03 = {a: 10, b: middle2};
      stack.push(obj1);
      stack.push(obj2);
      let aValues: number[] = [];

      stack.forEach((value): void => {
        aValues.push(value.a);
      });

      expect(aValues.length).assertEqual(2);
      expect(aValues[0]).assertEqual(1);
      expect(aValues[1]).assertEqual(10);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTTHREE_3400
     * @tc.name      testStack03Chapter0034
     * @tc.desc      Test forEach method with large stack (1000 elements)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack03Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack03Chapter0034';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      const size = 1000;
      for (let i = 0; i < size; i++) {
        stack.push(i);
      }
      let sum = 0;
      let count = 0;

      stack.forEach((value): void => {
        sum += value;
        count++;
      });

      expect(count).assertEqual(size);
      expect(sum).assertEqual(499500);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTTHREE_3500
     * @tc.name      testStack03Chapter0035
     * @tc.desc      Test forEach method accesses stack size in callback
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack03Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack03Chapter0035';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(1);
      stack.push(2);
      stack.push(3);
      let recordedSizes: number[] = [];

      stack.forEach((value, index): void => {
        recordedSizes.push(stack.length);
      });

      expect(recordedSizes.length).assertEqual(3);
      expect(recordedSizes[0]).assertEqual(3);
      expect(recordedSizes[1]).assertEqual(3);
      expect(recordedSizes[2]).assertEqual(3);
      expect(stack.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTTHREE_3600
     * @tc.name      testStack03Chapter0036
     * @tc.desc      Test forEach method accesses stack values in callback
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack03Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack03Chapter0036';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(10);
      stack.push(20);
      stack.push(30);
      let recordedValues: number[] = [];

      stack.forEach((value, index): void => {
        recordedValues.push(value);
      });

      expect(recordedValues.length).assertEqual(3);
      expect(recordedValues[0]).assertEqual(10);
      expect(recordedValues[1]).assertEqual(20);
      expect(recordedValues[2]).assertEqual(30);
      expect(stack.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTTHREE_3700
     * @tc.name      testStack03Chapter0037
     * @tc.desc      Test forEach method callback throws error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack03Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack03Chapter0037';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(1);
      stack.push(2);
      stack.push(3);
      let errorCaught = false;
      let iterationCount = 0;

      try {
        stack.forEach((value): void => {
          iterationCount++;
          if (value === 2) {
            throw new Error("Test error");
          }
        });
      } catch (e) {
        errorCaught = true;
      }

      expect(errorCaught).assertTrue();
      expect(iterationCount).assertEqual(2);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTTHREE_3800
     * @tc.name      testStack03Chapter0038
     * @tc.desc      Test forEach method with callback returning value (not void)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack03Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack03Chapter0038';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(1);
      stack.push(2);
      stack.push(3);
      let sum = 0;

      stack.forEach((value): void => {
        sum += value;
      });

      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTTHREE_3900
     * @tc.name      testStack03Chapter0039
     * @tc.desc      Test forEach method callback throws error on first element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack03Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack03Chapter0039';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(1);
      stack.push(2);
      stack.push(3);
      let iterationCount = 0;
      let errorCaught = false;

      try {
        stack.forEach((value): void => {
          iterationCount++;
          if (iterationCount === 1) {
            throw new Error("Callback error on first element");
          }
        });
      } catch (e) {
        errorCaught = true;
      }

      expect(errorCaught).assertTrue();
      expect(iterationCount).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTTHREE_4000
     * @tc.name      testStack03Chapter0040
     * @tc.desc      Test forEach method callback throws error on second element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack03Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack03Chapter0040';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(1);
      stack.push(2);
      stack.push(3);
      let iterationCount = 0;
      let errorCaught = false;

      try {
        stack.forEach((value): void => {
          iterationCount++;
          if (iterationCount === 2) {
            throw new Error("Callback error on second element");
          }
        });
      } catch (e) {
        errorCaught = true;
      }

      expect(errorCaught).assertTrue();
      expect(iterationCount).assertEqual(2);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTTHREE_4100
     * @tc.name      testStack03Chapter0041
     * @tc.desc      Test forEach method callback throws error on last element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack03Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack03Chapter0041';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(1);
      stack.push(2);
      stack.push(3);
      let iterationCount = 0;
      let errorCaught = false;

      try {
        stack.forEach((value): void => {
          iterationCount++;
          if (iterationCount === 3) {
            throw new Error("Callback error on last element");
          }
        });
      } catch (e) {
        errorCaught = true;
      }

      expect(errorCaught).assertTrue();
      expect(iterationCount).assertEqual(3);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTTHREE_4200
     * @tc.name      testStack03Chapter0042
     * @tc.desc      Test forEach method with callback that modifies external array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack03Chapter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack03Chapter0042';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(10);
      stack.push(20);
      stack.push(30);
      let container: ResultContainer03 = { values: [] };

      stack.forEach((value): void => {
        container.values.push(value * 2);
      });

      expect(container.values.length).assertEqual(3);
      expect(container.values[0]).assertEqual(20);
      expect(container.values[1]).assertEqual(40);
      expect(container.values[2]).assertEqual(60);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTTHREE_4300
     * @tc.name      testStack03Chapter0043
     * @tc.desc      Test forEach method with callback using all parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack03Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack03Chapter0043';
      console.log(TAG + ' start');
      let stack = new Stack<string>();
      stack.push("apple");
      stack.push("banana");
      stack.push("cherry");
      let results: CallbackResult03[] = [];

      stack.forEach((value, index): void => {
        let result: CallbackResult03 = {
          value: value,
          index: index,
          stackSize: stack.length
        };
        results.push(result);
      });

      expect(results.length).assertEqual(3);
      expect(results[0].value).assertEqual("apple");
      expect(results[0].index).assertEqual(0);
      expect(results[0].stackSize).assertEqual(3);
      expect(results[1].value).assertEqual("banana");
      expect(results[1].index).assertEqual(1);
      expect(results[1].stackSize).assertEqual(3);
      expect(results[2].value).assertEqual("cherry");
      expect(results[2].index).assertEqual(2);
      expect(results[2].stackSize).assertEqual(3);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTTHREE_4400
     * @tc.name      testStack03Chapter0044
     * @tc.desc      Test forEach method with empty callback
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack03Chapter0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack03Chapter0044';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(100);
      stack.push(200);
      stack.push(300);
      let executionCount = 0;

      stack.forEach((): void => {
        executionCount++;
      });

      expect(executionCount).assertEqual(3);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTTHREE_4500
     * @tc.name      testStack03Chapter0045
     * @tc.desc      Test forEach method with callback that returns early
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack03Chapter0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack03Chapter0045';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(5);
      stack.push(10);
      stack.push(15);
      stack.push(20);
      let sum = 0;

      stack.forEach((value): void => {
        if (value > 15) {
          return;
        }
        sum += value;
      });

      expect(sum).assertEqual(30);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTTHREE_4600
     * @tc.name      testStack03Chapter0046
     * @tc.desc      Test forEach method with complex object stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack03Chapter0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack03Chapter0046';
      console.log(TAG + ' start');
      let stack = new Stack<UserData03>();
      let user1: UserData03 = { id: 1, name: "Alice", active: true };
      let user2: UserData03 = { id: 2, name: "Bob", active: false };
      let user3: UserData03 = { id: 3, name: "Charlie", active: true };
      stack.push(user1);
      stack.push(user2);
      stack.push(user3);
      let activeCount = 0;
      let names: string[] = [];

      stack.forEach((user): void => {
        if (user.active) {
          activeCount++;
        }
        names.push(user.name);
      });

      expect(activeCount).assertEqual(2);
      expect(names.length).assertEqual(3);
      expect(names[0]).assertEqual("Alice");
      expect(names[1]).assertEqual("Bob");
      expect(names[2]).assertEqual("Charlie");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTTHREE_4700
     * @tc.name      testStack03Chapter0047
     * @tc.desc      Test forEach method with thisArg parameter object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack03Chapter0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack03Chapter0047';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(1);
      stack.push(2);
      stack.push(3);

      let context: ContextObject03 = {
        multiplier: 3,
        results: []
      };

      stack.forEach((value): void => {
        context.results.push(value * context.multiplier);
      });

      expect(context.results.length).assertEqual(3);
      expect(context.results[0]).assertEqual(3);
      expect(context.results[1]).assertEqual(6);
      expect(context.results[2]).assertEqual(9);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTTHREE_4800
     * @tc.name      testStack03Chapter0048
     * @tc.desc      Test forEach method with stack containing only one element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack03Chapter0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack03Chapter0048';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(999);
      let called = false;

      stack.forEach((value): void => {
        called = true;
        expect(value).assertEqual(999);
      });

      expect(called).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTTHREE_4900
     * @tc.name      testStack03Chapter0049
     * @tc.desc      Test forEach method order of iteration (should be from top to bottom)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack03Chapter0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack03Chapter0049';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(1);
      stack.push(2);
      stack.push(3);
      let iterationOrder: number[] = [];

      stack.forEach((value): void => {
        iterationOrder.push(value);
      });

      expect(iterationOrder.length).assertEqual(3);
      expect(iterationOrder[0]).assertEqual(1);
      expect(iterationOrder[1]).assertEqual(2);
      expect(iterationOrder[2]).assertEqual(3);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTTHREE_5000
     * @tc.name      testStack03Chapter0050
     * @tc.desc      Test forEach method with extremely large stack (performance test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack03Chapter0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack03Chapter0050';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      const size = 10000;
      for (let i = 0; i < size; i++) {
        stack.push(i);
      }
      let count = 0;
      let sum = 0;

      stack.forEach((value): void => {
        count++;
        sum += value;
      });

      expect(count).assertEqual(size);
      expect(sum).assertEqual(49995000);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTTHREE_5100
     * @tc.name      testStack03Chapter0051
     * @tc.desc      Test nested forEach calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack03Chapter0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack03Chapter0051';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(1);
      stack.push(2);
      stack.push(3);
      let outerResults: number[] = [];
      let innerResults: number[] = [];

      stack.forEach((value): void => {
        outerResults.push(value);
        stack.forEach((innerValue): void => {
          innerResults.push(innerValue * 10);
        });
      });

      expect(outerResults.length).assertEqual(3);
      expect(outerResults[0]).assertEqual(1);
      expect(outerResults[1]).assertEqual(2);
      expect(outerResults[2]).assertEqual(3);
      expect(innerResults.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTTHREE_5200
     * @tc.name      testStack03Chapter0052
     * @tc.desc      Test forEach with callback that modifies external array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack03Chapter0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack03Chapter0052';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(1);
      stack.push(2);
      stack.push(3);
      let externalData: ExternalData03 = { values: [100, 200, 300] };

      stack.forEach((value): void => {
        externalData.values.push(value * 1000);
      });

      expect(externalData.values.length).assertEqual(6);
      expect(externalData.values[3]).assertEqual(1000);
      expect(externalData.values[4]).assertEqual(2000);
      expect(externalData.values[5]).assertEqual(3000);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTTHREE_5300
     * @tc.name      testStack03Chapter0053
     * @tc.desc      Test forEach with class instance processing
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack03Chapter0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack03Chapter0053';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(10);
      stack.push(20);
      stack.push(30);

      let processor: ProcessorData03 = {
        processedData: [],
        multiplier: 3
      };

      stack.forEach((value): void => {
        processor.processedData.push(value * processor.multiplier);
      });

      expect(processor.processedData.length).assertEqual(3);
      expect(processor.processedData[0]).assertEqual(30);
      expect(processor.processedData[1]).assertEqual(60);
      expect(processor.processedData[2]).assertEqual(90);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTTHREE_5400
     * @tc.name      testStack03Chapter0054
     * @tc.desc      Test forEach with Float32Array containing special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack03Chapter0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack03Chapter0054';
      console.log(TAG + ' start');
      let stack = new Stack<Float32Array>();
      let floatArray = new Float32Array([Infinity, -Infinity, NaN, 0, 1.5]);
      stack.push(floatArray);
      let specialValueCount = 0;
      let normalValueCount = 0;

      stack.forEach((value): void => {
        for (let i = 0; i < value.length; i++) {
          let element = value[i];
          if (isNaN(element) || element === Infinity || element === -Infinity) {
            specialValueCount++;
          } else {
            normalValueCount++;
          }
        }
      });

      expect(specialValueCount).assertEqual(3);
      expect(normalValueCount).assertEqual(2);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTTHREE_5500
     * @tc.name      testStack03Chapter0055
     * @tc.desc      Test forEach with Float64Array containing special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack03Chapter0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack03Chapter0055';
      console.log(TAG + ' start');
      let stack = new Stack<Float64Array>();
      let doubleArray = new Float64Array([Number.MAX_VALUE, Number.MIN_VALUE, NaN, Infinity, -Infinity]);
      stack.push(doubleArray);
      let maxMinFound = false;
      let nanFound = false;
      let infinityFound = false;
      let negativeInfinityFound = false;

      stack.forEach((value): void => {
        for (let i = 0; i < value.length; i++) {
          let element = value[i];
          if (element === Number.MAX_VALUE || element === Number.MIN_VALUE) {
            maxMinFound = true;
          } else if (isNaN(element)) {
            nanFound = true;
          } else if (element === Infinity) {
            infinityFound = true;
          } else if (element === -Infinity) {
            negativeInfinityFound = true;
          }
        }
      });

      expect(maxMinFound).assertTrue();
      expect(nanFound).assertTrue();
      expect(infinityFound).assertTrue();
      expect(negativeInfinityFound).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTTHREE_5600
     * @tc.name      testStack03Chapter0056
     * @tc.desc      Test forEach with treeString type (large nested JSON string)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack03Chapter0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack03Chapter0056';
      console.log(TAG + ' start');

      const createTreeString = ((size: number): string => {
        let ans = '[';
        while (ans.length < size) {
          ans += '{"a":1},';
        }
        ans += '{"a":1}]';
        return ans;
      });

      let stack = new Stack<string>();
      let treeString = createTreeString(500);
      stack.push(treeString);
      stack.push("normal string");
      stack.push("another string");
      let treeStringFound = false;
      let totalLength = 0;

      stack.forEach((value): void => {
        totalLength += value.length;
        if (value.length > 100) {
          treeStringFound = true;
        }
      });

      expect(treeStringFound).assertTrue();
      expect(totalLength > 500).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTTHREE_5700
     * @tc.name      testStack03Chapter0057
     * @tc.desc      Test forEach with sliceString type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack03Chapter0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack03Chapter0057';
      console.log(TAG + ' start');
      let stack = new Stack<string>();
      let originalStr = "{k1:value1,k2:value2,k3:value3}";
      let slicedStr = originalStr.substring(0, originalStr.length - 2);
      stack.push(originalStr);
      stack.push(slicedStr);
      stack.push("test");
      let originalFound = false;
      let slicedFound = false;

      stack.forEach((value): void => {
        if (value === originalStr) {
          originalFound = true;
        }
        if (value === slicedStr) {
          slicedFound = true;
        }
      });

      expect(originalFound).assertTrue();
      expect(slicedFound).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTTHREE_5800
     * @tc.name      testStack03Chapter0058
     * @tc.desc      Test forEach with TypedArray boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack03Chapter0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack03Chapter0058';
      console.log(TAG + ' start');
      let stack = new Stack<Int8Array>();
      let int8Array = new Int8Array([-128, 0, 127]);
      stack.push(int8Array);
      let boundaryValues: number[] = [];

      stack.forEach((value): void => {
        for (let i = 0; i < value.length; i++) {
          boundaryValues.push(value[i]);
        }
      });

      expect(boundaryValues.length).assertEqual(3);
      expect(boundaryValues[0]).assertEqual(-128);
      expect(boundaryValues[1]).assertEqual(0);
      expect(boundaryValues[2]).assertEqual(127);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTTHREE_5900
     * @tc.name      testStack03Chapter0059
     * @tc.desc      Test forEach with Uint8Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack03Chapter0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack03Chapter0059';
      console.log(TAG + ' start');
      let stack = new Stack<Uint8Array>();
      let uint8Array = new Uint8Array([0, 127, 255]);
      stack.push(uint8Array);
      let values: number[] = [];

      stack.forEach((value): void => {
        for (let i = 0; i < value.length; i++) {
          values.push(value[i]);
        }
      });

      expect(values.length).assertEqual(3);
      expect(values[0]).assertEqual(0);
      expect(values[1]).assertEqual(127);
      expect(values[2]).assertEqual(255);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTTHREE_6000
     * @tc.name      testStack03Chapter0060
     * @tc.desc      Test forEach with Uint8ClampedArray clamping behavior
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack03Chapter0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack03Chapter0060';
      console.log(TAG + ' start');
      let stack = new Stack<Uint8ClampedArray>();
      let clampedArray = new Uint8ClampedArray([-1, 0, 255, 256]);
      stack.push(clampedArray);
      let clampedValues: number[] = [];

      stack.forEach((value): void => {
        for (let i = 0; i < value.length; i++) {
          clampedValues.push(value[i]);
        }
      });

      expect(clampedValues.length).assertEqual(4);
      expect(clampedValues[0]).assertEqual(0);
      expect(clampedValues[1]).assertEqual(0);
      expect(clampedValues[2]).assertEqual(255);
      expect(clampedValues[3]).assertEqual(255);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTTHREE_6100
     * @tc.name      testStack03Chapter0061
     * @tc.desc      Test forEach with all TypedArray types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack03Chapter0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack03Chapter0061';
      console.log(TAG + ' start');
      let stack = new Stack<TypedArrayContainer03>();

      let containers: TypedArrayContainer03[] = [
        { name: "Int8Array", arrayLength: 3 },
        { name: "Uint8Array", arrayLength: 3 },
        { name: "Int16Array", arrayLength: 3 },
        { name: "Uint16Array", arrayLength: 3 },
        { name: "Int32Array", arrayLength: 3 },
        { name: "Uint32Array", arrayLength: 3 }
      ];

      for (let container of containers) {
        stack.push(container);
      }

      let processedNames: string[] = [];
      let totalLength = 0;

      stack.forEach((value): void => {
        processedNames.push(value.name);
        totalLength += value.arrayLength;
      });

      expect(processedNames.length).assertEqual(6);
      expect(totalLength).assertEqual(18);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STACK_TESTTHREE_6200
     * @tc.name      testStack03Chapter0062
     * @tc.desc      Test forEach with array containing NaN/Infinity elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack03Chapter0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack03Chapter0062';
      console.log(TAG + ' start');
      let stack = new Stack<MixedArray03>();
      let array1: MixedArray03 = { data: [72, 101, NaN, Infinity, 108, 111] };
      let array2: MixedArray03 = { data: [1, 2, 3] };
      stack.push(array1);
      stack.push(array2);
      let nanInfinityCount = 0;
      let normalCount = 0;

      stack.forEach((value): void => {
        for (let i = 0; i < value.data.length; i++) {
          let element = value.data[i];
          if (isNaN(element) || element === Infinity || element === -Infinity) {
            nanInfinityCount++;
          } else {
            normalCount++;
          }
        }
      });

      expect(nanInfinityCount).assertEqual(2);
      expect(normalCount).assertEqual(7);
    });



  })
}