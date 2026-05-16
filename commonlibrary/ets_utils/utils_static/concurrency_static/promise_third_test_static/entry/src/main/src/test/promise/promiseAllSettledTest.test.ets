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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import { sleep } from "../Util.test"

interface Data {
  id: number;
  content: string;
}

interface type14 { id: number; name: string }

class Product {
  public id: number;
  public name: string

  constructor(id: number, name: string) {
    this.id = id
    this.name = name
  }

  getInfo(): string {
    return `${this.id}-${this.name}`;
  }
}
type MathFn = (a: number, b: number) => number;

export default function promiseAllSettledTest() {
  describe('promiseAllSettledTest', ():void => {
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
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_0100
     * @tc.name PromiseAllSettledTest001
     * @tc.desc Resolved and rejected promises mixed in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAllSettledTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<string> = new Promise<string>((resolve) => resolve('success'));
      const p2: Promise<never> = new Promise<never>((_, reject) => reject(new Error('failure')));

      const results = await Promise.allSettled([p1, p2]);

      expect((results[0] as PromiseFulfilledResult<string>).status).assertEqual('fulfilled');
      expect((results[0] as PromiseFulfilledResult<string>).value).assertEqual('success');
      expect((results[1] as PromiseRejectedResult).status).assertEqual('rejected');
      expect((results[1] as PromiseRejectedResult).reason.message).assertEqual('failure');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_0200
     * @tc.name PromiseAllSettledTest002
     * @tc.desc All promises resolved with number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAllSettledTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<number> = new Promise<number>((resolve) => {setTimeout(() => resolve(10), 10)});
      const p2: Promise<number> = new Promise<number>((resolve) => {setTimeout(() => {resolve(20);}, 20)});

      const results = await Promise.allSettled([p1, p2]);

      expect(results.length).assertEqual(2);
      expect((results[0] as PromiseFulfilledResult<number>).value).assertEqual(10);
      expect((results[1] as PromiseFulfilledResult<number>).value).assertEqual(20);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_0300
     * @tc.name PromiseAllSettledTest003
     * @tc.desc All promises rejected with different errors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAllSettledTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<string> = new Promise<string>((_, reject) => reject(new TypeError('type error')));
      const p2: Promise<string> = new Promise<string>((_, reject) => reject(new RangeError('range error')));

      const results = await Promise.allSettled([p1, p2]);

      expect((results[0] as PromiseRejectedResult).reason.name).assertEqual('TypeError');
      expect((results[1] as PromiseRejectedResult).reason.name).assertEqual('RangeError');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_0400
     * @tc.name PromiseAllSettledTest004
     * @tc.desc Non-promise values in input array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAllSettledTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<boolean> = new Promise<boolean>((resolve) => resolve(true));
      const rawValue = 'non-promise';

      const results = await Promise.allSettled([p1, rawValue]);

      expect((results[0] as PromiseFulfilledResult<Boolean|String>).value).assertEqual(true);
      expect((results[1] as PromiseFulfilledResult<Boolean|String>).value).assertEqual('non-promise');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_0600
     * @tc.name PromiseAllSettledTest006
     * @tc.desc Promises resolving to object type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAllSettledTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<Data> = new Promise<Data>((resolve) => {resolve({ id: 1, content: 'test' }as Data)});
      const p2: Promise<Data> =
        new Promise<Data>((resolve) => {setTimeout(() => resolve({ id: 2, content: 'delay' } as Data), 15)});

      const results = await Promise.allSettled([p1, p2]);
      const result1  = (results[0] as PromiseFulfilledResult<Data>).value;
      const result2 = (results[1] as PromiseFulfilledResult<Data>).value;

      expect((result1 ).id).assertEqual(1);
      expect((result2 ).content).assertEqual('delay');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_0700
     * @tc.name PromiseAllSettledTest007
     * @tc.desc Single promise in input array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAllSettledTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<number> = new Promise<number>((resolve) => {resolve(100)});

      const results = await Promise.allSettled([p1]);

      expect(results.length).assertEqual(1);
      expect((results[0] as PromiseFulfilledResult<number>).status).assertEqual('fulfilled');
      expect((results[0] as PromiseFulfilledResult<number>).value).assertEqual(100);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_0800
     * @tc.name PromiseAllSettledTest008
     * @tc.desc Mixed delay resolved and rejected promises
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAllSettledTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<string> = new Promise<string>((resolve) => {setTimeout(() => resolve('late success'), 30)});
      const p2: Promise<string> =
        new Promise<string>((_, reject) => {setTimeout(() => reject(new Error('late failure')), 10)});

      const results = await Promise.allSettled([p1, p2]);

      expect((results[0] as PromiseFulfilledResult<string>).value).assertEqual('late success');
      expect((results[1] as PromiseRejectedResult).reason.message).assertEqual('late failure');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_0900
     * @tc.name PromiseAllSettledTest009
     * @tc.desc Promises resolving to function type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAllSettledTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const add: MathFn = (a, b) => a + b;
      const multiply: MathFn = (a, b) => a * b;

      const p1: Promise<MathFn> = new Promise<MathFn>((resolve) => {resolve(add)});
      const p2: Promise<MathFn> = new Promise<MathFn>((resolve) => {resolve(multiply)});

      const results = await Promise.allSettled<Promise<MathFn>>([p1, p2]);
      const addFn =  (results[0] as PromiseFulfilledResult<MathFn>).value;
      const multiplyFn : MathFn=  (results[1] as PromiseFulfilledResult<MathFn>).value;

      expect(addFn(2, 3)).assertEqual(5);
      expect(multiplyFn(2, 3)).assertEqual(6);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_1000
     * @tc.name PromiseAllSettledTest010
     * @tc.desc Set as iterable input instead of array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAllSettledTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<number> = new Promise<number>((resolve) => {resolve(5)});
      const p2: Promise<string> = new Promise<string>((_, reject) => reject(new Error('set error')));
      const promiseSet = new Set<Promise<number> | Promise<string>>([p1, p2]);

      const results = await Promise.allSettled(Array.from(promiseSet));
      const resultArray = Array.from(results);

      expect(resultArray.length).assertEqual(2);
      expect((resultArray[0] as PromiseFulfilledResult<Double|String>).value).assertEqual(5);
      expect((resultArray[1] as PromiseRejectedResult).reason.message).assertEqual('set error');
    });
    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_1100
     * @tc.name PromiseAllSettledTest011
     * @tc.desc Mixed resolved promises with string and number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAllSettledTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<string> = new Promise<string>((resolve) => {resolve('hello')});
      const p2: Promise<number> = new Promise<number>((resolve) => {resolve(123)});

      const results = await Promise.allSettled([p1, p2]);

      expect((results[0] as PromiseFulfilledResult<String|Double>).value).assertEqual('hello');
      expect((results[1] as PromiseFulfilledResult<String|Double>).value).assertEqual(123);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_1200
     * @tc.name PromiseAllSettledTest012
     * @tc.desc Rejected promises with custom error messages
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAllSettledTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<Object> = new Promise<Object>((_, reject) => reject(new Error('invalid input')));
      const p2: Promise<Object> = new Promise<Object>((_, reject) => reject(new Error('timeout')));

      const results = await Promise.allSettled([p1, p2]);

      expect((results[0] as PromiseRejectedResult).reason.message).assertEqual('invalid input');
      expect((results[1] as PromiseRejectedResult).reason.message).assertEqual('timeout');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_1300
     * @tc.name PromiseAllSettledTest013
     * @tc.desc Raw boolean values in input array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAllSettledTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<number> = new Promise<number>((resolve) => {resolve(0)});
      const rawTrue = true;
      const rawFalse = false;

      const results = await Promise.allSettled([p1, rawTrue, rawFalse]);

      expect((results[0] as PromiseFulfilledResult<Double|Boolean>).value).assertEqual(0);
      expect((results[1] as PromiseFulfilledResult<Double|Boolean>).value).assertEqual(true);
      expect((results[2] as PromiseFulfilledResult<Double|Boolean>).value).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_1500
     * @tc.name PromiseAllSettledTest015
     * @tc.desc Delay resolved promises with increasing timings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAllSettledTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<number> = new Promise<number>((resolve) => {setTimeout(() => resolve(1), 10)});
      const p2: Promise<number> = new Promise<number>((resolve) => {setTimeout(() => resolve(2), 20)});
      const p3: Promise<number> = new Promise<number>((resolve) => {setTimeout(() => resolve(3), 30)});

      const results = await Promise.allSettled([p1, p2, p3]);

      expect((results[0] as PromiseFulfilledResult<number>).value).assertEqual(1);
      expect((results[1] as PromiseFulfilledResult<number>).value).assertEqual(2);
      expect((results[2] as PromiseFulfilledResult<number>).value).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_1600
     * @tc.name PromiseAllSettledTest016
     * @tc.desc Mixed resolved promises and null values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAllSettledTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<null> = new Promise<null>((resolve) => {resolve(null)});
      const rawNull = null;
      const p2: Promise<string> = new Promise<string>((resolve) => {resolve('not null')});

      const results = await Promise.allSettled([p1, rawNull, p2]);

      expect((results[0] as PromiseFulfilledResult<null|null|String>).value).assertEqual(null);
      expect((results[1] as PromiseFulfilledResult<null|null|String>).value).assertEqual(null);
      expect((results[2] as PromiseFulfilledResult<null|null|String>).value).assertEqual('not null');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_1700
     * @tc.name PromiseAllSettledTest017
     * @tc.desc Promises rejected with same error type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAllSettledTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<string> = new Promise<string>((_, reject) => reject(new TypeError('invalid type')));
      const p2: Promise<number> = new Promise<number>((_, reject) => reject(new TypeError('wrong type')));

      const results = await Promise.allSettled([p1, p2]);

      expect((results[0] as PromiseRejectedResult).reason.name).assertEqual('TypeError');
      expect((results[1] as PromiseRejectedResult).reason.name).assertEqual('TypeError');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_1800
     * @tc.name PromiseAllSettledTest018
     * @tc.desc Raw undefined value in input array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAllSettledTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<string> = new Promise<string>((resolve) => {resolve('defined')});
      const rawUndefined = undefined;

      const results = await Promise.allSettled([p1, rawUndefined]);

      expect((results[0] as PromiseFulfilledResult<String|undefined>).value).assertEqual('defined');
      expect((results[1] as PromiseFulfilledResult<String|undefined>).value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_1900
     * @tc.name PromiseAllSettledTest019
     * @tc.desc Promises resolving to array values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAllSettledTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<number[]> = new Promise<number[]>((resolve) => {resolve([1, 2, 3])});
      const p2: Promise<string[]> = new Promise<string[]>((resolve) => {setTimeout(() => resolve(['a', 'b']), 20)});

      const results = await Promise.allSettled([p1, p2]);
      const arr1 = ((results[0] as PromiseFulfilledResult<Array<Double>|Array<String>>).value) as Array<Double>;
      const arr2 = ((results[1] as PromiseFulfilledResult<Array<Double>|Array<String>>).value) as Array<String>;

      expect(arr1[0]).assertEqual(1);
      expect(arr1[2]).assertEqual(3);
      expect(arr2[0]).assertEqual('a');
      expect(arr2.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_2000
     * @tc.name PromiseAllSettledTest020
     * @tc.desc Fast rejected and slow resolved promises
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAllSettledTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<string> =
        new Promise<string>((_, reject) => {setTimeout(() => reject(new Error('fast fail')), 5)});
      const p2: Promise<string> = new Promise<string>((resolve) => {setTimeout(() => resolve('slow success'), 50)});

      const results = await Promise.allSettled([p1, p2]);

      expect((results[0] as PromiseRejectedResult).reason.message).assertEqual('fast fail');
      expect((results[1] as PromiseFulfilledResult<string>).value).assertEqual('slow success');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_2100
     * @tc.name PromiseAllSettledTest021
     * @tc.desc Promises resolving to date objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAllSettledTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const targetDate = new Date('2024-01-01');
      const p1: Promise<Date> = new Promise<Date>((resolve) => resolve(targetDate));

      const results = await Promise.allSettled([p1]);
      const resultDate = (results[0] as PromiseFulfilledResult<Date>).value;

      expect(resultDate.toISOString()).assertEqual(targetDate.toISOString());
      expect(resultDate.getFullYear()).assertEqual(2024);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_2200
     * @tc.name PromiseAllSettledTest022
     * @tc.desc Three mixed status promises in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAllSettledTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<number> = new Promise<number>((resolve) => resolve(10));
      const p2: Promise<string> = new Promise<string>((_, reject) => reject(new Error('fail')));
      const p3: Promise<boolean> = new Promise<boolean>((resolve) => {setTimeout(() => resolve(false), 15)});

      const results = await Promise.allSettled([p1, p2, p3]);

      expect((results[0] as PromiseFulfilledResult<Double|String|Boolean>).value).assertEqual(10);
      expect((results[1] as PromiseRejectedResult).reason.message).assertEqual('fail');
      expect((results[2] as PromiseFulfilledResult<Double|String|Boolean>).value).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_2300
     * @tc.name PromiseAllSettledTest023
     * @tc.desc Raw symbol value in input array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAllSettledTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<string> = new Promise<string>((resolve) => resolve('symbol test'));

      const results = await Promise.allSettled([p1, 'test']);

      expect((results[0] as PromiseFulfilledResult<string>).value).assertEqual('symbol test');
      expect((results[1] as PromiseFulfilledResult<string>).value).assertEqual('test');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_2400
     * @tc.name PromiseAllSettledTest024
     * @tc.desc Promises rejected with error objects having stack
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAllSettledTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const error1 = new Error('stack error 1');
      const error2 = new Error('stack error 2');
      const p1: Promise<Object> = new Promise<Object>((_, reject) => reject(error1));
      const p2: Promise<Object> = new Promise<Object>((_, reject) => reject(error2));

      const results = await Promise.allSettled([p1, p2]);

      expect((results[0] as PromiseRejectedResult).reason).assertEqual(error1);
      expect((results[1] as PromiseRejectedResult).reason).assertEqual(error2);
      expect((results[0] as PromiseRejectedResult).reason.message).assertEqual('stack error 1');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_2500
     * @tc.name PromiseAllSettledTest025
     * @tc.desc Promises resolving to mapped values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAllSettledTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<number> = new Promise<number>((resolve) => resolve(5)).then(num => num * 2);
      const p2: Promise<string> = new Promise<string>((resolve) => resolve('test')).then(str => str.toUpperCase());

      const results = await Promise.allSettled([p1, p2]);

      expect((results[0] as PromiseFulfilledResult<number|string>).value).assertEqual(10);
      expect((results[1] as PromiseFulfilledResult<number|string>).value).assertEqual('TEST');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_2700
     * @tc.name PromiseAllSettledTest027
     * @tc.desc Promises resolving to class instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAllSettledTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<Product> = new Promise<Product>((resolve) => resolve(new Product(1, 'Laptop')));
      const p2: Promise<Product> =
        new Promise<Product>((resolve) => {setTimeout(() => resolve(new Product(2, 'Phone')), 25)});

      const results = await Promise.allSettled([p1, p2]);
      const product1 = (results[0] as PromiseFulfilledResult<Product>).value;
      const product2 = (results[1] as PromiseFulfilledResult<Product>).value;

      expect(product1.id).assertEqual(1);
      expect(product1.getInfo()).assertEqual('1-Laptop');
      expect(product2.name).assertEqual('Phone');
      expect(product2.getInfo()).assertEqual('2-Phone');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_2800
     * @tc.name PromiseAllSettledTest028
     * @tc.desc Mixed promises with catch handlers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAllSettledTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<string> = new Promise<string>((_, reject) => reject(new Error('fail 1')))
        .catch((err: Error) => `Caught: ${err.message}`);
      const p2: Promise<number> = new Promise<number>((resolve) => resolve(100));
      const p3: Promise<boolean> = new Promise<boolean>((_, reject) => reject(new Error('fail 3')));

      const results = await Promise.allSettled([p1, p2, p3]);

      expect((results[0] as PromiseFulfilledResult<String|Double|Boolean>).value).assertEqual('Caught: fail 1');
      expect((results[1] as PromiseFulfilledResult<String|Double|Boolean>).value).assertEqual(100);
      expect((results[2] as PromiseRejectedResult).reason.message).assertEqual('fail 3');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_2900
     * @tc.name PromiseAllSettledTest029
     * @tc.desc Promises resolving to bigint values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAllSettledTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<bigint> = new Promise<bigint>((resolve) => resolve(9007199254740991n));
      const p2: Promise<bigint> =
        new Promise<bigint>((resolve) => {setTimeout(() => resolve(12345678901234567890n), 15)});

      const results = await Promise.allSettled([p1, p2]);

      expect((results[0] as PromiseFulfilledResult<bigint>).value).assertEqual(9007199254740991n);
      expect((results[1] as PromiseFulfilledResult<bigint>).value).assertEqual(12345678901234567890n);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_3100
     * @tc.name PromiseAllSettledTest031
     * @tc.desc Promises resolving to regexp objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAllSettledTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<RegExp> = new Promise<RegExp>((resolve) => resolve(new RegExp('test', 'i')));
      const p2: Promise<RegExp> =
        new Promise<RegExp>((resolve) => {setTimeout(() => resolve(new RegExp('pattern', 'g')), 20)});

      const results = await Promise.allSettled([p1, p2]);
      const regex1 = (results[0] as PromiseFulfilledResult<RegExp>).value;
      const regex2 = (results[1] as PromiseFulfilledResult<RegExp>).value;

      expect(regex1.test('Test')).assertEqual(true);
      expect(regex2.flags).assertEqual('g');
      expect(regex2.source).assertEqual('pattern');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_3200
     * @tc.name PromiseAllSettledTest032
     * @tc.desc Raw function values in input array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAllSettledTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const add = (a: number, b: number) => a + b;
      const p1: Promise<string> = new Promise<string>((resolve) => resolve('func test'));
      const rawFunc = (str: string) => str.toUpperCase();

      const results = await Promise.allSettled([p1, add, rawFunc]);
      const resultAdd = ((results[1] as PromiseFulfilledResult<String|(((p1: Double, p2: Double) => Double))|(((p1: String) => String))>).value) as ((p1: Double, p2: Double) => Double);
      const resultRawFunc = ((results[2] as PromiseFulfilledResult<String|(((p1: Double, p2: Double) => Double))|(((p1: String) => String))>).value) as ((p1: String) => String);

      expect(((results[0] as PromiseFulfilledResult<String|(((p1: Double, p2: Double) => Double))|(((p1: String) => String))>).value) as string).assertEqual('func test');
      expect(resultAdd(3, 5)).assertEqual(8);
      expect(resultRawFunc('hello')).assertEqual('HELLO');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_3300
     * @tc.name PromiseAllSettledTest033
     * @tc.desc Mixed delayed rejected promises with different timings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAllSettledTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<Object> =
        new Promise<Object>((_, reject) => {setTimeout(() => reject(new Error('10ms fail')), 10)});
      const p2: Promise<Object> =
        new Promise<Object>((_, reject) => {setTimeout(() => reject(new Error('5ms fail')), 5)});
      const p3: Promise<Object> =
        new Promise<Object>((_, reject) => {setTimeout(() => reject(new Error('15ms fail')), 15)});

      const results = await Promise.allSettled([p1, p2, p3]);

      expect((results[0] as PromiseRejectedResult).reason.message).assertEqual('10ms fail');
      expect((results[1] as PromiseRejectedResult).reason.message).assertEqual('5ms fail');
      expect((results[2] as PromiseRejectedResult).reason.message).assertEqual('15ms fail');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_3500
     * @tc.name PromiseAllSettledTest035
     * @tc.desc Input array with both resolved and pending promises
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAllSettledTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<int> = Promise.resolve(5);
      const p2: Promise<string> = new Promise<string>((resolve) => {setTimeout(() => resolve('delayed'), 30)});
      const p3: Promise<boolean> = Promise.resolve(false);

      const results = await Promise.allSettled([p1, p2, p3]);

      expect((results[0] as PromiseFulfilledResult<int|String|Boolean>).value).assertEqual(5);
      expect((results[1] as PromiseFulfilledResult<int|String|Boolean>).value).assertEqual('delayed');
      expect((results[2] as PromiseFulfilledResult<int|String|Boolean>).value).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_3900
     * @tc.name PromiseAllSettledTest039
     * @tc.desc Mixed promises with then-chained values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAllSettledTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<number> = new Promise<number>((resolve) => resolve(2))
        .then(num => num * 3)
        .then(num => num + 4);
      const p2: Promise<string> = new Promise<string>((resolve) => {setTimeout(() => resolve('chain'), 10)})
        .then(str => str.repeat(2));
      const p3: Promise<boolean> = Promise.resolve(true);

      const results = await Promise.allSettled([p1, p2, p3]);

      expect((results[0] as PromiseFulfilledResult<Double|String|Boolean>).value).assertEqual(10);
      expect((results[1] as PromiseFulfilledResult<Double|String|Boolean>).value).assertEqual('chainchain');
      expect((results[2] as PromiseFulfilledResult<Double|String|Boolean>).value).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_4000
     * @tc.name PromiseAllSettledTest040
     * @tc.desc Set with mixed promise statuses as input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAllSettledTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<number> = new Promise<number>((resolve) => resolve(100));
      const p2: Promise<string> = new Promise<string>((_, reject) => reject(new Error('set fail')));
      const p3: Promise<boolean> = new Promise<boolean>((resolve) => {setTimeout(() => resolve(true), 15)});
      const promiseSet = new Set<Promise<number>| Promise<string> | Promise<boolean>>([p1, p2, p3]);

      const results = await Promise.allSettled(Array.from(promiseSet));
      const resultArray = Array.from(results);

      expect((resultArray[0] as PromiseFulfilledResult<Double|String|Boolean>).value).assertEqual(100);
      expect((resultArray[1] as PromiseRejectedResult).reason.message).assertEqual('set fail');
      expect((resultArray[2] as PromiseFulfilledResult<Double|String|Boolean>).value).assertEqual(true);
    });



  })
}
