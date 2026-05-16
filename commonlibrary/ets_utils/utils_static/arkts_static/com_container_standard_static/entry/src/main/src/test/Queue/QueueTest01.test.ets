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
import { Queue } from '@kit.ArkTS';

interface Custom_0006 {
  id: number;
  name: string;
}

interface BusinessError_0008 {
  code: number;
  message: string;
}

interface TestObject_0029 {
  a: number;
  b: string;
  c: number[];
}

interface NestedObjectGrandChild_0030 {
  e: number;
}

interface NestedObjectChild_0030 {
  c: number;
  d: NestedObjectGrandChild_0030;
}

interface NestedObject_0030 {
  a: number;
  b: NestedObjectChild_0030;
}

interface TestObject_0031 {
  a: undefined;
  b: number;
}

interface TestObject_0032 {
  a: null;
  b: number;
}

interface TestObject_0033 {
  a: number;
  b: number;
}

interface TestObject_0034 {
  a: number;
  b: number;
}

interface TestObject_0052 {
  a: number;
  b: () => void;
}

interface TestObject_0055 {
  name: string;
  buffer: Uint8Array;
}

interface SelfRefObject_0059 {
  value: number;
  self?: SelfRefObject_0059;
}

interface TestObject_0063 {
  id: number;
  name: string;
}

interface BusinessError_0068 {
  code: number;
  message: string;
}

interface BusinessError_0069 {
  code: number;
  message: string;
}

interface Person_0074 {
  name: string;
  age: number;
}

function sleep(count: int): Promise<void> {
  return new Promise<void>((resolve: (value: void) => void, reject: (reason: Error) => void) => {
    setTimeout(() => {
      resolve(undefined as void)
    }, count)
  })
}

export default function Queue01Test(): void {
  describe('Queue01Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_0100
     * @tc.name testQueue01Chapter0001
     * @tc.desc Test Queue constructor with number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testQueue01Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0001';
      console.log(TAG + ' start');
      let queue: Queue<number> = new Queue<number>();
      expect(queue.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_0200
     * @tc.name testQueue01Chapter0002
     * @tc.desc Test Queue constructor with string type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testQueue01Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0002';
      console.log(TAG + ' start');
      let queue: Queue<string> = new Queue<string>();
      expect(queue.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_0300
     * @tc.name testQueue01Chapter0003
     * @tc.desc Test Queue constructor with object type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testQueue01Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0003';
      console.log(TAG + ' start');
      let queue: Queue<Record<string, string>> = new Queue<Record<string, string>>();
      expect(queue.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_0400
     * @tc.name testQueue01Chapter0004
     * @tc.desc Test Queue constructor with union type number or string or object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testQueue01Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0004';
      console.log(TAG + ' start');
      let queue: Queue<number | string | Record<string, string>> =
        new Queue<number | string | Record<string, string>>();
      expect(queue.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_0500
     * @tc.name testQueue01Chapter0005
     * @tc.desc Test Queue constructor with boolean type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testQueue01Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0005';
      console.log(TAG + ' start');
      let queue: Queue<boolean> = new Queue<boolean>();
      expect(queue.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_0600
     * @tc.name testQueue01Chapter0006
     * @tc.desc Test Queue constructor with custom interface type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testQueue01Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0006';
      console.log(TAG + ' start');

      let queue: Queue<Custom_0006> = new Queue<Custom_0006>();
      expect(queue.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_0700
     * @tc.name testQueue01Chapter0007
     * @tc.desc Test Queue constructor with array type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testQueue01Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0007';
      console.log(TAG + ' start');
      let queue: Queue<number[]> = new Queue<number[]>();
      expect(queue.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_0800
     * @tc.name testQueue01Chapter0008
     * @tc.desc Test Queue constructor cannot be directly invoked
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("testQueue01Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0008';
      console.log(TAG + ' start');

      let queueObj: Queue<number> = new Queue<number>();
      queueObj.add(1);
      let popFn: () => number = queueObj.pop;
      let result: number = popFn();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_0900
     * @tc.name      testQueue01Chapter0009
     * @tc.desc      Add NaN to number queue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0009';
      console.log(TAG + ' start');
      const queue: Queue<number> = new Queue<number>();
      queue.add(NaN);
      expect(queue.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_1000
     * @tc.name      testQueue01Chapter0010
     * @tc.desc      Add Infinity to number queue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0010';
      console.log(TAG + ' start');
      const queue: Queue<number> = new Queue<number>();
      queue.add(Infinity);
      expect(queue.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_1100
     * @tc.name      testQueue01Chapter0011
     * @tc.desc      Add negative Infinity to number queue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0011';
      console.log(TAG + ' start');
      const queue: Queue<number> = new Queue<number>();
      queue.add(-Infinity);
      expect(queue.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_1200
     * @tc.name      testQueue01Chapter0012
     * @tc.desc      Add Number.MAX_VALUE to queue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0012';
      console.log(TAG + ' start');
      const queue: Queue<number> = new Queue<number>();
      queue.add(Number.MAX_VALUE);
      expect(queue.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_1300
     * @tc.name      testQueue01Chapter0013
     * @tc.desc      Add Number.MIN_VALUE to queue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0013';
      console.log(TAG + ' start');
      const queue: Queue<number> = new Queue<number>();
      queue.add(Number.MIN_VALUE);
      expect(queue.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_1400
     * @tc.name      testQueue01Chapter0014
     * @tc.desc      Add Number.EPSILON to queue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0014';
      console.log(TAG + ' start');
      const queue: Queue<number> = new Queue<number>();
      queue.add(Number.EPSILON);
      expect(queue.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_1500
     * @tc.name      testQueue01Chapter0015
     * @tc.desc      Add Number.MAX_SAFE_INTEGER to queue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0015';
      console.log(TAG + ' start');
      const queue: Queue<number> = new Queue<number>();
      queue.add(Number.MAX_SAFE_INTEGER);
      expect(queue.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_1600
     * @tc.name      testQueue01Chapter0016
     * @tc.desc      Add normal string element to queue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0016';
      console.log(TAG + ' start');
      const queue: Queue<string> = new Queue<string>();
      queue.add("test");
      expect(queue.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_1700
     * @tc.name      testQueue01Chapter0017
     * @tc.desc      Add empty string to queue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0017';
      console.log(TAG + ' start');
      const queue: Queue<string> = new Queue<string>();
      queue.add("");
      expect(queue.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_1800
     * @tc.name      testQueue01Chapter0018
     * @tc.desc      Add string with special characters to queue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0018';
      console.log(TAG + ' start');
      const queue: Queue<string> = new Queue<string>();
      queue.add("!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~");
      expect(queue.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_1900
     * @tc.name      testQueue01Chapter0019
     * @tc.desc      Add ASCII string to queue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0019';
      console.log(TAG + ' start');
      const queue: Queue<string> = new Queue<string>();
      const asciiStr: string =
        "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
      queue.add(asciiStr);
      expect(queue.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_2000
     * @tc.name      testQueue01Chapter0020
     * @tc.desc      Add string with escape characters to queue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0020';
      console.log(TAG + ' start');
      const queue: Queue<string> = new Queue<string>();
      queue.add("\\a\\b\\f\\n\\r\\t\\v\\\\\\'\\\"\\?\\0\\123\\x41");
      expect(queue.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_2100
     * @tc.name      testQueue01Chapter0021
     * @tc.desc      Add string with emoji to queue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0021';
      console.log(TAG + ' start');
      const queue: Queue<string> = new Queue<string>();
      queue.add("👆👿👀💯🎅😼🔧💇🤼‍♂️🛢🀄🏴");
      expect(queue.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_2200
     * @tc.name      testQueue01Chapter0022
     * @tc.desc      Add boolean true to queue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0022';
      console.log(TAG + ' start');
      const queue: Queue<boolean> = new Queue<boolean>();
      queue.add(true);
      expect(queue.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_2300
     * @tc.name      testQueue01Chapter0023
     * @tc.desc      Add boolean false to queue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0023';
      console.log(TAG + ' start');
      const queue: Queue<boolean> = new Queue<boolean>();
      queue.add(false);
      expect(queue.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_2400
     * @tc.name      testQueue01Chapter0024
     * @tc.desc      Add normal array to queue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0024';
      console.log(TAG + ' start');
      const queue: Queue<Array<number>> = new Queue<Array<number>>();
      const arr: Array<number> = [72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 47, 50, 51, 63];
      queue.add(arr);
      expect(queue.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_2500
     * @tc.name      testQueue01Chapter0025
     * @tc.desc      Add array with multiple zeros to queue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0025';
      console.log(TAG + ' start');
      const queue: Queue<Array<number>> = new Queue<Array<number>>();
      const arr: Array<number> = [72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 47, 50, 51, 63];
      queue.add(arr);
      expect(queue.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_2600
     * @tc.name      testQueue01Chapter0026
     * @tc.desc      Add empty array to queue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0026';
      console.log(TAG + ' start');
      const queue: Queue<Array<number>> = new Queue<Array<number>>();
      const arr: Array<number> = [];
      queue.add(arr);
      expect(queue.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_2700
     * @tc.name      testQueue01Chapter0027
     * @tc.desc      Add array with NaN and Infinity to queue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0027';
      console.log(TAG + ' start');
      const queue: Queue<Array<number>> = new Queue<Array<number>>();
      const arr: Array<number> = [72, 101, NaN, Infinity, 108, 111];
      queue.add(arr);
      expect(queue.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_2800
     * @tc.name      testQueue01Chapter0028
     * @tc.desc      Add array with mixed types to generic queue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0028';
      console.log(TAG + ' start');
      const queue: Queue<Array<number | string | boolean | null | undefined>> =
        new Queue<Array<number | string | boolean | null | undefined>>();
      const arr: Array<number | string | boolean | null | undefined> = [72, "abc", true, null, undefined, 108];
      queue.add(arr);
      expect(queue.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_2900
     * @tc.name      testQueue01Chapter0029
     * @tc.desc      Add normal object to queue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0029';
      console.log(TAG + ' start');

      const queue: Queue<TestObject_0029> = new Queue<TestObject_0029>();
      const obj: TestObject_0029 = { a: 1, b: "test", c: [1, 2, 3] };
      queue.add(obj);
      expect(queue.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_3000
     * @tc.name      testQueue01Chapter0030
     * @tc.desc      Add nested object to queue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0030';
      console.log(TAG + ' start');

      const queue: Queue<NestedObject_0030> = new Queue<NestedObject_0030>();
      const obj: NestedObject_0030 = { a: 1, b: { c: 2, d: { e: 3 } } };
      queue.add(obj);
      expect(queue.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_3100
     * @tc.name      testQueue01Chapter0031
     * @tc.desc      Add object with undefined property to queue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0031';
      console.log(TAG + ' start');

      const queue: Queue<TestObject_0031> = new Queue<TestObject_0031>();
      const obj: TestObject_0031 = { a: undefined, b: 1 };
      queue.add(obj);
      expect(queue.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_3200
     * @tc.name      testQueue01Chapter0032
     * @tc.desc      Add object with null property to queue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0032';
      console.log(TAG + ' start');

      const queue: Queue<TestObject_0032> = new Queue<TestObject_0032>();
      const obj: TestObject_0032 = { a: null, b: 1 };
      queue.add(obj);
      expect(queue.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_3300
     * @tc.name      testQueue01Chapter0033
     * @tc.desc      Add object with NaN property to queue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0033';
      console.log(TAG + ' start');

      const queue: Queue<TestObject_0033> = new Queue<TestObject_0033>();
      const obj: TestObject_0033 = { a: NaN, b: 1 };
      queue.add(obj);
      expect(queue.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_3400
     * @tc.name      testQueue01Chapter0034
     * @tc.desc      Add object with Infinity property to queue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0034';
      console.log(TAG + ' start');

      const queue: Queue<TestObject_0034> = new Queue<TestObject_0034>();
      const obj: TestObject_0034 = { a: Infinity, b: 1 };
      queue.add(obj);
      expect(queue.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_3500
     * @tc.name      testQueue01Chapter0035
     * @tc.desc      Add TypedArray (Uint8Array) to queue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0035';
      console.log(TAG + ' start');
      const queue: Queue<Uint8Array> = new Queue<Uint8Array>();
      const typedArray: Uint8Array = new Uint8Array([72, 101, 108, 108, 111]);
      queue.add(typedArray);
      expect(queue.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_3600
     * @tc.name      testQueue01Chapter0036
     * @tc.desc      Add Int8Array with boundary values to queue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0036';
      console.log(TAG + ' start');
      const queue: Queue<Int8Array> = new Queue<Int8Array>();
      const typedArray: Int8Array = new Int8Array([-128, 127]);
      queue.add(typedArray);
      expect(queue.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_3700
     * @tc.name      testQueue01Chapter0037
     * @tc.desc      Add Uint8Array with boundary values to queue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0037';
      console.log(TAG + ' start');
      const queue: Queue<Uint8Array> = new Queue<Uint8Array>();
      const typedArray: Uint8Array = new Uint8Array([0, 255]);
      queue.add(typedArray);
      expect(queue.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_3800
     * @tc.name      testQueue01Chapter0038
     * @tc.desc      Add Float32Array with boundary values to queue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0038';
      console.log(TAG + ' start');
      const queue: Queue<Float32Array> = new Queue<Float32Array>();
      const typedArray: Float32Array = new Float32Array([-3.4028234663852886e38, 3.4028234663852886e38]);
      queue.add(typedArray);
      expect(queue.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_3900
     * @tc.name      testQueue01Chapter0039
     * @tc.desc      Add Float64Array with boundary values to queue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0039';
      console.log(TAG + ' start');
      const queue: Queue<Float64Array> = new Queue<Float64Array>();
      const typedArray: Float64Array = new Float64Array([-1.7976931348623157e308, 1.7976931348623157e308]);
      queue.add(typedArray);
      expect(queue.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_4000
     * @tc.name      testQueue01Chapter0040
     * @tc.desc      Add Map object to queue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0040';
      console.log(TAG + ' start');
      const queue: Queue<Map<string, string>> = new Queue<Map<string, string>>();
      const map: Map<string, string> = new Map<string, string>();
      map.set("key1", "value1");
      map.set("key2", "value2");
      queue.add(map);
      expect(queue.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_4100
     * @tc.name      testQueue01Chapter0041
     * @tc.desc      Add Set object to queue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0041';
      console.log(TAG + ' start');
      const queue: Queue<Set<number>> = new Queue<Set<number>>();
      const set: Set<number> = new Set<number>([1, 2, 3, 2, 1]);
      queue.add(set);
      expect(queue.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_4200
     * @tc.name      testQueue01Chapter0042
     * @tc.desc      Add regular expression object to queue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0042';
      console.log(TAG + ' start');
      const queue: Queue<RegExp> = new Queue<RegExp>();
      const regex: RegExp = new RegExp("abc", "gi");
      queue.add(regex);
      expect(queue.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_4300
     * @tc.name      testQueue01Chapter0043
     * @tc.desc      Add multiple elements to queue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0043';
      console.log(TAG + ' start');
      const queue: Queue<number | string | boolean> = new Queue<number | string | boolean>();
      queue.add(1);
      queue.add("test");
      queue.add(true);
      expect(queue.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_4400
     * @tc.name      testQueue01Chapter0044
     * @tc.desc      Add large string to queue and check memory
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0044';
      console.log(TAG + ' start');
      const queue: Queue<string> = new Queue<string>();
      const largeString: string = "a".repeat(1000000);
      queue.add(largeString);
      expect(queue.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_4500
     * @tc.name      testQueue01Chapter0045
     * @tc.desc      Add tree string to queue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0045';
      console.log(TAG + ' start');
      const queue: Queue<string> = new Queue<string>();
      let initTreeString: (size: number) => string = (size: number): string => {
        let ans: string = '[';
        while (ans.length < size) {
          ans += '{"a":1},';
        }
        ans += '{"a":1}]';
        return ans;
      };
      const treeString: string = initTreeString(1000);
      queue.add(treeString);
      expect(queue.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_4600
     * @tc.name      testQueue01Chapter0046
     * @tc.desc      Add slice string to queue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0046';
      console.log(TAG + ' start');
      const queue: Queue<string> = new Queue<string>();
      const originalStr: string = "{k1:value1,k2:value2}";
      const sliceStr: string = originalStr.substring(0, originalStr.length - 2);
      queue.add(sliceStr);
      expect(queue.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_4700
     * @tc.name      testQueue01Chapter0047
     * @tc.desc      Add ArrayBuffer to queue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0047';
      console.log(TAG + ' start');
      const queue: Queue<ArrayBuffer> = new Queue<ArrayBuffer>();
      const buffer: ArrayBuffer = new ArrayBuffer(16);
      queue.add(buffer);
      expect(queue.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_4800
     * @tc.name      testQueue01Chapter0048
     * @tc.desc      Add DataView to queue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0048';
      console.log(TAG + ' start');
      const queue: Queue<DataView> = new Queue<DataView>();
      const buffer: ArrayBuffer = new ArrayBuffer(16);
      const dataView: DataView = new DataView(buffer);
      queue.add(dataView);
      expect(queue.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_4900
     * @tc.name      testQueue01Chapter0049
     * @tc.desc      Add BigInt to queue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0049';
      console.log(TAG + ' start');
      const queue: Queue<bigint> = new Queue<bigint>();
      const bigIntValue: bigint = BigInt("9007199254740991");
      queue.add(bigIntValue);
      expect(queue.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_5000
     * @tc.name      testQueue01Chapter0050
     * @tc.desc      Add BigInt64Array to queue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0050';
      console.log(TAG + ' start');
      const queue: Queue<BigInt64Array> = new Queue<BigInt64Array>();
      const bigIntArray: BigInt64Array =
        new BigInt64Array([BigInt("-9223372036854775808"), BigInt("9223372036854775807")]);
      queue.add(bigIntArray);
      expect(queue.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_5100
     * @tc.name      testQueue01Chapter0051
     * @tc.desc      Add BigUint64Array to queue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0051';
      console.log(TAG + ' start');
      const queue: Queue<BigUint64Array> = new Queue<BigUint64Array>();
      const bigUintArray: BigUint64Array = new BigUint64Array([BigInt("0"), BigInt("18446744073709551615")]);
      queue.add(bigUintArray);
      expect(queue.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_5200
     * @tc.name      testQueue01Chapter0052
     * @tc.desc      Add object with function property to queue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0052';
      console.log(TAG + ' start');

      const queue: Queue<TestObject_0052> = new Queue<TestObject_0052>();
      const obj: TestObject_0052 = {
        a: 1,
        b: (): void => {
          console.log("function");
        }
      };
      queue.add(obj);
      expect(queue.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_5300
     * @tc.name      testQueue01Chapter0053
     * @tc.desc      Add object with Symbol key to queue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0053';
      console.log(TAG + ' start');
      const queue: Queue<Record<string, string | number>> = new Queue<Record<string, string | number>>();
      const obj: Record<string, string | number> = {
        "a": 1
      };
      queue.add(obj);
      expect(queue.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_5400
     * @tc.name      testQueue01Chapter0054
     * @tc.desc      Add Promise object to queue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0054';
      console.log(TAG + ' start');
      const queue: Queue<Promise<string>> = new Queue<Promise<string>>();
      const promise: Promise<string> = new Promise<string>((resolve) => {
        setTimeout(() => resolve('done'), 100);
      });
      queue.add(promise);
      expect(queue.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_5500
     * @tc.name      testQueue01Chapter0055
     * @tc.desc      Add object with TypedArray property to queue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0055';
      console.log(TAG + ' start');

      const queue: Queue<TestObject_0055> = new Queue<TestObject_0055>();
      const obj: TestObject_0055 = {
        name: "test",
        buffer: new Uint8Array([72, 101, 108, 108, 111])
      };
      queue.add(obj);
      expect(queue.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_5600
     * @tc.name      testQueue01Chapter0056
     * @tc.desc      Add undefined value to queue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0056';
      console.log(TAG + ' start');
      const queue: Queue<undefined> = new Queue<undefined>();
      queue.add(undefined);
      expect(queue.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_5700
     * @tc.name      testQueue01Chapter0057
     * @tc.desc      Add null value to queue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0057';
      console.log(TAG + ' start');
      const queue: Queue<null> = new Queue<null>();
      queue.add(null);
      expect(queue.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_5800
     * @tc.name      testQueue01Chapter0058
     * @tc.desc      Add array-like object to queue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0058';
      console.log(TAG + ' start');
      const queue: Queue<Record<string, number>> = new Queue<Record<string, number>>();
      const arrLike: Record<string, number> = {};
      arrLike["0"] = 1;
      arrLike["1"] = 2;
      arrLike["2"] = 3;
      arrLike["abc"] = 111;
      queue.add(arrLike);
      expect(queue.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_5900
     * @tc.name      testQueue01Chapter0059
     * @tc.desc      Add self-referencing object to queue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0059';
      console.log(TAG + ' start');

      const queue: Queue<SelfRefObject_0059> = new Queue<SelfRefObject_0059>();
      const obj: SelfRefObject_0059 = { value: 1 };
      obj.self = obj;
      queue.add(obj);
      expect(queue.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_6000
     * @tc.name      testQueue01Chapter0060
     * @tc.desc      pop method returns first element and removes it from queue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0060';
      console.log(TAG + ' start');
      let queue: Queue<number> = new Queue<number>();
      queue.add(2);
      queue.add(4);
      queue.add(5);
      queue.add(2);
      queue.add(4);
      let result: number = queue.pop();
      expect(result).assertEqual(2);
      expect(queue.length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_6100
     * @tc.name      testQueue01Chapter0061
     * @tc.desc      pop method works correctly with single element queue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0061';
      console.log(TAG + ' start');
      let queue: Queue<string> = new Queue<string>();
      queue.add("single");
      let result: string = queue.pop();
      expect(result).assertEqual("single");
      expect(queue.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_6200
     * @tc.name      testQueue01Chapter0062
     * @tc.desc      pop method works with multiple consecutive calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0062';
      console.log(TAG + ' start');
      let queue: Queue<number> = new Queue<number>();
      queue.add(10);
      queue.add(20);
      queue.add(30);
      let firstPop: number = queue.pop();
      let secondPop: number = queue.pop();
      let thirdPop: number = queue.pop();
      expect(firstPop).assertEqual(10);
      expect(secondPop).assertEqual(20);
      expect(thirdPop).assertEqual(30);
      expect(queue.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_6300
     * @tc.name      testQueue01Chapter0063
     * @tc.desc      pop method with object type elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0063';
      console.log(TAG + ' start');

      let queue: Queue<TestObject_0063> = new Queue<TestObject_0063>();
      let obj1: TestObject_0063 = { id: 1, name: "first" };
      let obj2: TestObject_0063 = { id: 2, name: "second" };
      queue.add(obj1);
      queue.add(obj2);
      let result: TestObject_0063 = queue.pop();
      expect(result).assertDeepEquals(obj1);
      expect(queue.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_6400
     * @tc.name      testQueue01Chapter0064
     * @tc.desc      pop method with boolean type elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0064';
      console.log(TAG + ' start');
      let queue: Queue<boolean> = new Queue<boolean>();
      queue.add(true);
      queue.add(false);
      queue.add(true);
      let result: boolean = queue.pop();
      expect(result).assertTrue();
      expect(queue.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_6500
     * @tc.name      testQueue01Chapter0065
     * @tc.desc      pop method with array type elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0065';
      console.log(TAG + ' start');
      let queue: Queue<Array<number>> = new Queue<Array<number>>();
      let arr1: Array<number> = [1, 2, 3];
      let arr2: Array<number> = [4, 5, 6];
      queue.add(arr1);
      queue.add(arr2);
      let result: Array<number> = queue.pop();
      expect(result).assertDeepEquals(arr1);
      expect(queue.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_6600
     * @tc.name      testQueue01Chapter0066
     * @tc.desc      pop method with null and undefined elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0066';
      console.log(TAG + ' start');
      let queue: Queue<number | null | undefined> = new Queue<number | null | undefined>();
      queue.add(null);
      queue.add(undefined);
      queue.add(5);
      let firstResult: number | null | undefined = queue.pop();
      let secondResult: number | null | undefined = queue.pop();
      let thirdResult: number | null | undefined = queue.pop();
      expect(firstResult).assertNull();
      expect(secondResult).assertUndefined();
      expect(thirdResult).assertEqual(5);
      expect(queue.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_6700
     * @tc.name      testQueue01Chapter0067
     * @tc.desc      pop method returns correct element after add and pop operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0067';
      console.log(TAG + ' start');
      let queue: Queue<number> = new Queue<number>();
      queue.add(100);
      let firstPop: number = queue.pop();
      queue.add(200);
      queue.add(300);
      let secondPop: number = queue.pop();
      expect(firstPop).assertEqual(100);
      expect(secondPop).assertEqual(200);
      expect(queue.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_6800
     * @tc.name      testQueue01Chapter0068
     * @tc.desc      pop method cannot be bound error scenario
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0068';
      console.log(TAG + ' start');

      let queue: Queue<number> = new Queue<number>();
      queue.add(1);
      queue.add(2);

      let popMethod: () => number = queue.pop;
      let result: number = popMethod();
      expect(result).assertEqual(1);
      let result2: number = popMethod();
      expect(result2).assertEqual(2);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_6900
     * @tc.name      testQueue01Chapter0069
     * @tc.desc      pop method error when called on extracted method with wrong context
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0069';
      console.log(TAG + ' start');

      try {
        let queue1: Queue<number> = new Queue<number>();
        queue1.add(10);
        let queue2: Queue<number> = new Queue<number>();
        queue2.add(20);
        let result: number = queue2.pop();
        expect(result).assertEqual(20);
      } catch (error) {
        let businessError = error as BusinessError_0069;
        expect(businessError.code).assertEqual(10200011);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_7000
     * @tc.name      testQueue01Chapter0070
     * @tc.desc      pop method with large number of elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0070';
      console.log(TAG + ' start');
      let queue: Queue<number> = new Queue<number>();
      for (let i: int = 0; i < 100; i++) {
        queue.add(i);
      }
      for (let j: int = 0; j < 100; j++) {
        let result: number = queue.pop();
        expect(result).assertEqual(j);
      }
      expect(queue.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_7100
     * @tc.name      testQueue01Chapter0071
     * @tc.desc      pop method maintains queue order after multiple operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0071';
      console.log(TAG + ' start');
      let queue: Queue<string> = new Queue<string>();
      queue.add("A");
      queue.add("B");
      let firstPop: string = queue.pop();
      queue.add("C");
      queue.add("D");
      let secondPop: string = queue.pop();
      let thirdPop: string = queue.pop();
      let fourthPop: string = queue.pop();
      expect(firstPop).assertEqual("A");
      expect(secondPop).assertEqual("B");
      expect(thirdPop).assertEqual("C");
      expect(fourthPop).assertEqual("D");
      expect(queue.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_7200
     * @tc.name      testQueue01Chapter0072
     * @tc.desc      Test getFirst method with normal queue elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0072';
      console.log(TAG + ' start');
      let queue: Queue<number> = new Queue<number>();
      queue.add(2);
      queue.add(4);
      queue.add(5);
      queue.add(2);
      let result: number = queue.getFirst();
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_7300
     * @tc.name      testQueue01Chapter0073
     * @tc.desc      Test getFirst method with string type queue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0073';
      console.log(TAG + ' start');
      let queue: Queue<string> = new Queue<string>();
      queue.add("hello");
      queue.add("world");
      queue.add("queue");
      let result: string = queue.getFirst();
      expect(result).assertEqual("hello");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_7400
     * @tc.name      testQueue01Chapter0074
     * @tc.desc      Test getFirst method with object type queue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0074';
      console.log(TAG + ' start');

      let queue: Queue<Person_0074> = new Queue<Person_0074>();
      let person1: Person_0074 = { name: "Alice", age: 25 };
      let person2: Person_0074 = { name: "Bob", age: 30 };
      queue.add(person1);
      queue.add(person2);
      let result: Person_0074 = queue.getFirst();
      expect(result.name).assertEqual("Alice");
      expect(result.age).assertEqual(25);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_7500
     * @tc.name      testQueue01Chapter0075
     * @tc.desc      Test getFirst method with empty queue to trigger error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0075';
      console.log(TAG + ' start');
      let queue: Queue<number> = new Queue<number>();
      try {
        let result: number = queue.getFirst();
        expect(result).assertUndefined();
      } catch (e) {
        expect(e !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_7600
     * @tc.name      testQueue01Chapter0076
     * @tc.desc      Test pop method on empty queue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0076';
      console.log(TAG + ' start');
      let queue: Queue<number> = new Queue<number>();

      try {
        let result: number = queue.pop();
        expect(result).assertUndefined();
      } catch (e) {
        expect(e !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_7700
     * @tc.name      testQueue01Chapter0077
     * @tc.desc      Test getFirst method with single element queue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0077';
      console.log(TAG + ' start');
      let queue: Queue<boolean> = new Queue<boolean>();
      queue.add(true);
      let result: boolean = queue.getFirst();
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_7800
     * @tc.name      testQueue01Chapter0078
     * @tc.desc      Test forEach with queue containing TypedArray elements (Int8Array)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0078';
      console.log(TAG + ' start');
      let queue = new Queue<Int8Array>();
      queue.add(new Int8Array([-128, 0, 127]));
      queue.add(new Int8Array([-129, 128]));

      let results: number[] = [];
      queue.forEach((value: Int8Array): void => {
        results = results.concat(Array.from(value));
      });

      expect(results.length).assertEqual(5);
      expect(results[0]).assertEqual(-128);
      expect(results[2]).assertEqual(127);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_7900
     * @tc.name      testQueue01Chapter0079
     * @tc.desc      Test forEach with queue containing TypedArray elements (Uint8Array)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0079';
      console.log(TAG + ' start');
      let queue = new Queue<Uint8Array>();
      queue.add(new Uint8Array([0, 128, 255]));
      queue.add(new Uint8Array([-1, 256]));

      let results: number[] = [];
      queue.forEach((value: Uint8Array): void => {
        results = results.concat(Array.from(value));
      });

      expect(results.length).assertEqual(5);
      expect(results[0]).assertEqual(0);
      expect(results[2]).assertEqual(255);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_8000
     * @tc.name      testQueue01Chapter0080
     * @tc.desc      Test forEach with queue containing TypedArray elements (Uint8ClampedArray)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0080';
      console.log(TAG + ' start');
      let queue = new Queue<Uint8ClampedArray>();
      queue.add(new Uint8ClampedArray([0, 128, 255]));
      queue.add(new Uint8ClampedArray([-1, 256]));

      let results: number[] = [];
      queue.forEach((value: Uint8ClampedArray): void => {
        results = results.concat(Array.from(value));
      });

      expect(results.length).assertEqual(5);
      expect(results[0]).assertEqual(0);
      expect(results[2]).assertEqual(255);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_8100
     * @tc.name      testQueue01Chapter0081
     * @tc.desc      Test forEach with queue containing TypedArray elements (Int16Array)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0081';
      console.log(TAG + ' start');
      let queue = new Queue<Int16Array>();
      queue.add(new Int16Array([-32768, 0, 32767]));
      queue.add(new Int16Array([-32769, 32768]));

      let results: number[] = [];
      queue.forEach((value: Int16Array): void => {
        results = results.concat(Array.from(value));
      });

      expect(results.length).assertEqual(5);
      expect(results[0]).assertEqual(-32768);
      expect(results[2]).assertEqual(32767);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_8200
     * @tc.name      testQueue01Chapter0082
     * @tc.desc      Test forEach with queue containing TypedArray elements (Uint16Array)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0082';
      console.log(TAG + ' start');
      let queue = new Queue<Uint16Array>();
      queue.add(new Uint16Array([0, 32768, 65535]));
      queue.add(new Uint16Array([-1, 65536]));

      let results: number[] = [];
      queue.forEach((value: Uint16Array): void => {
        results = results.concat(Array.from(value));
      });

      expect(results.length).assertEqual(5);
      expect(results[0]).assertEqual(0);
      expect(results[2]).assertEqual(65535);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_8300
     * @tc.name      testQueue01Chapter0083
     * @tc.desc      Test forEach with queue containing TypedArray elements (Int32Array)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0083';
      console.log(TAG + ' start');
      let queue = new Queue<Int32Array>();
      queue.add(new Int32Array([-2147483648, 0, 2147483647]));
      queue.add(new Int32Array([-2147483649, 2147483648]));

      let results: number[] = [];
      queue.forEach((value: Int32Array): void => {
        results = results.concat(Array.from(value));
      });

      expect(results.length).assertEqual(5);
      expect(results[0]).assertEqual(-2147483648);
      expect(results[2]).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_8400
     * @tc.name      testQueue01Chapter0084
     * @tc.desc      Test forEach with queue containing TypedArray elements (Uint32Array)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0084';
      console.log(TAG + ' start');
      let queue = new Queue<Uint32Array>();
      queue.add(new Uint32Array([0, 2147483648, 4294967295]));
      queue.add(new Uint32Array([-1, 4294967296]));

      let results: number[] = [];
      queue.forEach((value: Uint32Array): void => {
        results = results.concat(Array.from(value));
      });

      expect(results.length).assertEqual(5);
      expect(results[0]).assertEqual(0);
      expect(results[2]).assertEqual(4294967295);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_8500
     * @tc.name      testQueue01Chapter0085
     * @tc.desc      Test forEach with queue containing TypedArray elements (Float32Array)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0085';
      console.log(TAG + ' start');
      let queue = new Queue<Float32Array>();
      queue.add(new Float32Array([-3.4E38, 0, 3.4E38]));
      queue.add(new Float32Array([-3.5e38, 3.5e38]));

      let results: number[] = [];
      queue.forEach((value: Float32Array): void => {
        results = results.concat(Array.from(value));
      });

      expect(results.length).assertEqual(5);
      expect(results[1]).assertEqual(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_8600
     * @tc.name      testQueue01Chapter0086
     * @tc.desc      Test forEach with queue containing TypedArray elements (Float64Array)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0086';
      console.log(TAG + ' start');
      let queue = new Queue<Float64Array>();
      queue.add(new Float64Array([-1.7E308, 0, 1.7E308]));
      queue.add(new Float64Array([-1.7E308, 1.7E308]));

      let results: number[] = [];
      queue.forEach((value: Float64Array): void => {
        results = results.concat(Array.from(value));
      });

      expect(results.length).assertEqual(5);
      expect(results[1]).assertEqual(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_8700
     * @tc.name      testQueue01Chapter0087
     * @tc.desc      Test forEach with queue containing TypedArray elements (BigInt64Array)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0087';
      console.log(TAG + ' start');
      let queue = new Queue<BigInt64Array>();
      queue.add(new BigInt64Array([-9223372036854775808n, 0n, 9223372036854775807n]));
      queue.add(new BigInt64Array([-9223372036854775809n, 9223372036854775808n]));

      let results: bigint[] = [];
      queue.forEach((value: BigInt64Array): void => {
        results = results.concat(Array.from(value));
      });

      expect(results.length).assertEqual(5);
      expect(results[0]).assertEqual(-9223372036854775808n);
      expect(results[2]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_8800
     * @tc.name      testQueue01Chapter0088
     * @tc.desc      Test forEach with queue containing TypedArray elements (BigUint64Array)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0088';
      console.log(TAG + ' start');
      let queue = new Queue<BigUint64Array>();
      queue.add(new BigUint64Array([0n, 9223372036854775808n, 18446744073709551615n]));
      queue.add(new BigUint64Array([18446744073709551616n]));

      let results: bigint[] = [];
      queue.forEach((value: BigUint64Array): void => {
        results = results.concat(Array.from(value));
      });

      expect(results.length).assertEqual(4);
      expect(results[0]).assertEqual(0n);
      expect(results[2]).assertEqual(18446744073709551615n);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_8900
     * @tc.name      testQueue01Chapter0089
     * @tc.desc      Test forEach with queue containing special values (Infinity, -Infinity, NaN) in Float arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0089';
      console.log(TAG + ' start');
      let queue = new Queue<Float32Array>();
      queue.add(new Float32Array([Infinity, -Infinity, NaN]));

      let hasInfinity = false;
      let hasNegativeInfinity = false;
      let hasNaN = false;

      queue.forEach((value: Float32Array): void => {
        let arr = Array.from(value);
        arr.forEach((num: number): void => {
          if (num === Infinity) {
            hasInfinity = true;
          }
          if (num === -Infinity) {
            hasNegativeInfinity = true;
          }
          if (isNaN(num)) {
            hasNaN = true;
          }
        });
      });

      expect(hasInfinity).assertTrue();
      expect(hasNegativeInfinity).assertTrue();
      expect(hasNaN).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_9000
     * @tc.name      testQueue01Chapter0090
     * @tc.desc      Test forEach with queue containing special string characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0090';
      console.log(TAG + ' start');
      let queue = new Queue<string>();
      let specialChars = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";

      for (let ch of specialChars) {
        queue.add(ch);
      }

      let collected: string[] = [];
      queue.forEach((value: string): void => {
        collected.push(value);
      });

      expect(collected.length).assertEqual(specialChars.length);
      expect(collected.join('')).assertEqual(specialChars);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_9100
     * @tc.name      testQueue01Chapter0091
     * @tc.desc      Test forEach with queue containing ASCII characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0091';
      console.log(TAG + ' start');
      let queue = new Queue<string>();
      let asciiChars =
        "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";

      for (let ch of asciiChars) {
        queue.add(ch);
      }

      let collected: string[] = [];
      queue.forEach((value: string): void => {
        collected.push(value);
      });

      expect(collected.length).assertEqual(asciiChars.length);
      expect(collected.join('')).assertEqual(asciiChars);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_QUEUE_TESTONE_9200
     * @tc.name      testQueue01Chapter0092
     * @tc.desc      Test forEach with queue containing escape sequences
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue01Chapter0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue01Chapter0092';
      console.log(TAG + ' start');
      let queue = new Queue<string>();
      let escapeSequences = ["\\a", "\\b", "\\f", "\\n", "\\r", "\\t", "\\v", "\\\\", "\\'", '\\"', "\\?", "\\0"];

      escapeSequences.forEach((seq: string): void => {
        queue.add(seq);
      });

      let collected: string[] = [];
      queue.forEach((value: string): void => {
        collected.push(value);
      });

      expect(collected.length).assertEqual(escapeSequences.length);
      expect(collected[0]).assertEqual("\\a");
      expect(collected[10]).assertEqual("\\?");
    });
  })
}