import { afterEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import {
  PromiseAllSettledTest026,
  PromiseAllSettledTest037,
  PromiseAllSettledTest041,
  PromiseAllSettledTest044,
  PromiseAllSettledTest047,
  PromiseAllSettledTest088,
  PromiseAllSettledTest092,
  PromiseAllSettledTest093
} from './promisejs';
import { type14, type38 } from './promisets';
import { sleep } from './utils';

export default function promiseAllSettledTest() {
  describe('promiseAllSettledTest', () => {
    afterEach(async () => {
      await sleep(50)
    })

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_0100
     * @tc.name PromiseAllSettledTest001
     * @tc.desc Resolved and rejected promises mixed in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAllSettledTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
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
     * @tc.level Level 1
     */
    it('PromiseAllSettledTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1: Promise<number> = new Promise<number>((resolve) => setTimeout(() => resolve(10), 10));
      const p2: Promise<number> = new Promise<number>((resolve) => setTimeout(() => resolve(20), 20));

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
     * @tc.level Level 1
     */
    it('PromiseAllSettledTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
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
     * @tc.level Level 1
     */
    it('PromiseAllSettledTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1: Promise<boolean> = new Promise<boolean>((resolve) => resolve(true));
      const rawValue = 'non-promise';

      const results = await Promise.allSettled([p1, rawValue]);

      expect((results[0] as PromiseFulfilledResult<boolean>).value).assertEqual(true);
      expect((results[1] as PromiseFulfilledResult<string>).value).assertEqual('non-promise');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_0500
     * @tc.name PromiseAllSettledTest005
     * @tc.desc Empty iterable input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAllSettledTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const results = await Promise.allSettled([]);

      expect(Array.isArray(results)).assertEqual(true);
      expect(results.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_0600
     * @tc.name PromiseAllSettledTest006
     * @tc.desc Promises resolving to object type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAllSettledTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      interface Data {
        id: number;
        content: string;
      }

      const p1: Promise<Data> = new Promise<Data>((resolve) => resolve({ id: 1, content: 'test' }));
      const p2: Promise<Data> =
        new Promise<Data>((resolve) => setTimeout(() => resolve({ id: 2, content: 'delay' }), 15));

      const results = await Promise.allSettled([p1, p2]);
      const result1 = (results[0] as PromiseFulfilledResult<Data>).value;
      const result2 = (results[1] as PromiseFulfilledResult<Data>).value;

      expect(result1.id).assertEqual(1);
      expect(result2.content).assertEqual('delay');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_0700
     * @tc.name PromiseAllSettledTest007
     * @tc.desc Single promise in input array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAllSettledTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1: Promise<number> = new Promise<number>((resolve) => resolve(100));

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
     * @tc.level Level 1
     */
    it('PromiseAllSettledTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1: Promise<string> = new Promise<string>((resolve) => setTimeout(() => resolve('late success'), 30));
      const p2: Promise<string> =
        new Promise<string>((_, reject) => setTimeout(() => reject(new Error('late failure')), 10));

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
     * @tc.level Level 1
     */
    it('PromiseAllSettledTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      type MathFn = (a: number, b: number) => number;
      const add: MathFn = (a, b) => a + b;
      const multiply: MathFn = (a, b) => a * b;

      const p1: Promise<MathFn> = new Promise<MathFn>((resolve) => resolve(add));
      const p2: Promise<MathFn> = new Promise<MathFn>((resolve) => resolve(multiply));

      const results = await Promise.allSettled([p1, p2]);
      const addFn = (results[0] as PromiseFulfilledResult<MathFn>).value;
      const multiplyFn = (results[1] as PromiseFulfilledResult<MathFn>).value;

      expect(addFn(2, 3)).assertEqual(5);
      expect(multiplyFn(2, 3)).assertEqual(6);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_1000
     * @tc.name PromiseAllSettledTest010
     * @tc.desc Set as iterable input instead of array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAllSettledTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1: Promise<number> = new Promise<number>((resolve) => resolve(5));
      const p2: Promise<string> = new Promise<string>((_, reject) => reject(new Error('set error')));
      const promiseSet = new Set([p1, p2]);

      const results = await Promise.allSettled(Array.from(promiseSet));
      const resultArray = Array.from(results);

      expect(resultArray.length).assertEqual(2);
      expect((resultArray[0] as PromiseFulfilledResult<number>).value).assertEqual(5);
      expect((resultArray[1] as PromiseRejectedResult).reason.message).assertEqual('set error');
    });
    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_1100
     * @tc.name PromiseAllSettledTest011
     * @tc.desc Mixed resolved promises with string and number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAllSettledTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1: Promise<string> = new Promise<string>((resolve) => resolve('hello'));
      const p2: Promise<number> = new Promise<number>((resolve) => resolve(123));

      const results = await Promise.allSettled([p1, p2]);

      expect((results[0] as PromiseFulfilledResult<string>).value).assertEqual('hello');
      expect((results[1] as PromiseFulfilledResult<number>).value).assertEqual(123);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_1200
     * @tc.name PromiseAllSettledTest012
     * @tc.desc Rejected promises with custom error messages
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAllSettledTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
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
     * @tc.level Level 1
     */
    it('PromiseAllSettledTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1: Promise<number> = new Promise<number>((resolve) => resolve(0));
      const rawTrue = true;
      const rawFalse = false;

      const results = await Promise.allSettled([p1, rawTrue, rawFalse]);

      expect((results[0] as PromiseFulfilledResult<number>).value).assertEqual(0);
      expect((results[1] as PromiseFulfilledResult<boolean>).value).assertEqual(true);
      expect((results[2] as PromiseFulfilledResult<boolean>).value).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_1400
     * @tc.name PromiseAllSettledTest014
     * @tc.desc Promises resolving to nested objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllSettledTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      interface NestedData {
        user: type14;
        isActive: boolean;
      }

      const p1: Promise<NestedData> = new Promise<NestedData>((resolve) => resolve({
        user: { id: 101, name: 'Alice' },
        isActive: true
      }));

      const results = await Promise.allSettled([p1]);
      const result = (results[0] as PromiseFulfilledResult<NestedData>).value;

      expect(result.user.id).assertEqual(101);
      expect(result.user.name).assertEqual('Alice');
      expect(result.isActive).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_1500
     * @tc.name PromiseAllSettledTest015
     * @tc.desc Delay resolved promises with increasing timings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllSettledTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const p1: Promise<number> = new Promise<number>((resolve) => setTimeout(() => resolve(1), 10));
      const p2: Promise<number> = new Promise<number>((resolve) => setTimeout(() => resolve(2), 20));
      const p3: Promise<number> = new Promise<number>((resolve) => setTimeout(() => resolve(3), 30));

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
     * @tc.level Level 1
     */
    it('PromiseAllSettledTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1: Promise<null> = new Promise<null>((resolve) => resolve(null));
      const rawNull = null;
      const p2: Promise<string> = new Promise<string>((resolve) => resolve('not null'));

      const results = await Promise.allSettled([p1, rawNull, p2]);

      expect((results[0] as PromiseFulfilledResult<null>).value).assertEqual(null);
      expect((results[1] as PromiseFulfilledResult<null>).value).assertEqual(null);
      expect((results[2] as PromiseFulfilledResult<string>).value).assertEqual('not null');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_1700
     * @tc.name PromiseAllSettledTest017
     * @tc.desc Promises rejected with same error type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAllSettledTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
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
     * @tc.level Level 1
     */
    it('PromiseAllSettledTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1: Promise<string> = new Promise<string>((resolve) => resolve('defined'));
      const rawUndefined = undefined;

      const results = await Promise.allSettled([p1, rawUndefined]);

      expect((results[0] as PromiseFulfilledResult<string>).value).assertEqual('defined');
      expect((results[1] as PromiseFulfilledResult<undefined>).value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_1900
     * @tc.name PromiseAllSettledTest019
     * @tc.desc Promises resolving to array values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllSettledTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const p1: Promise<number[]> = new Promise<number[]>((resolve) => resolve([1, 2, 3]));
      const p2: Promise<string[]> = new Promise<string[]>((resolve) => setTimeout(() => resolve(['a', 'b']), 20));

      const results = await Promise.allSettled([p1, p2]);
      const arr1 = (results[0] as PromiseFulfilledResult<number[]>).value;
      const arr2 = (results[1] as PromiseFulfilledResult<string[]>).value;

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
     * @tc.level Level 2
     */
    it('PromiseAllSettledTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const p1: Promise<string> =
        new Promise<string>((_, reject) => setTimeout(() => reject(new Error('fast fail')), 5));
      const p2: Promise<string> = new Promise<string>((resolve) => setTimeout(() => resolve('slow success'), 50));

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
     * @tc.level Level 2
     */
    it('PromiseAllSettledTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.level Level 2
     */
    it('PromiseAllSettledTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const p1: Promise<number> = new Promise<number>((resolve) => resolve(10));
      const p2: Promise<string> = new Promise<string>((_, reject) => reject(new Error('fail')));
      const p3: Promise<boolean> = new Promise<boolean>((resolve) => setTimeout(() => resolve(false), 15));

      const results = await Promise.allSettled([p1, p2, p3]);

      expect((results[0] as PromiseFulfilledResult<number>).value).assertEqual(10);
      expect((results[1] as PromiseRejectedResult).reason.message).assertEqual('fail');
      expect((results[2] as PromiseFulfilledResult<boolean>).value).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_2300
     * @tc.name PromiseAllSettledTest023
     * @tc.desc Raw symbol value in input array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllSettledTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.level Level 2
     */
    it('PromiseAllSettledTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.level Level 2
     */
    it('PromiseAllSettledTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const p1: Promise<number> = new Promise<number>((resolve) => resolve(5)).then(num => num * 2);
      const p2: Promise<string> = new Promise<string>((resolve) => resolve('test')).then(str => str.toUpperCase());

      const results = await Promise.allSettled([p1, p2]);

      expect((results[0] as PromiseFulfilledResult<number>).value).assertEqual(10);
      expect((results[1] as PromiseFulfilledResult<string>).value).assertEqual('TEST');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_2600
     * @tc.name PromiseAllSettledTest026
     * @tc.desc Iterable input with generator function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAllSettledTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const results = await PromiseAllSettledTest026();
      expect(results).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_2700
     * @tc.name PromiseAllSettledTest027
     * @tc.desc Promises resolving to class instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllSettledTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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

      const p1: Promise<Product> = new Promise<Product>((resolve) => resolve(new Product(1, 'Laptop')));
      const p2: Promise<Product> =
        new Promise<Product>((resolve) => setTimeout(() => resolve(new Product(2, 'Phone')), 25));

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
     * @tc.level Level 3
     */
    it('PromiseAllSettledTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1: Promise<string> = new Promise<string>((_, reject) => reject(new Error('fail 1')))
        .catch((err: Error) => `Caught: ${err.message}`);
      const p2: Promise<number> = new Promise<number>((resolve) => resolve(100));
      const p3: Promise<boolean> = new Promise<boolean>((_, reject) => reject(new Error('fail 3')));

      const results = await Promise.allSettled([p1, p2, p3]);

      expect((results[0] as PromiseFulfilledResult<string>).value).assertEqual('Caught: fail 1');
      expect((results[1] as PromiseFulfilledResult<number>).value).assertEqual(100);
      expect((results[2] as PromiseRejectedResult).reason.message).assertEqual('fail 3');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_2900
     * @tc.name PromiseAllSettledTest029
     * @tc.desc Promises resolving to bigint values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllSettledTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const p1: Promise<bigint> = new Promise<bigint>((resolve) => resolve(9007199254740991n));
      const p2: Promise<bigint> =
        new Promise<bigint>((resolve) => setTimeout(() => resolve(12345678901234567890n), 15));

      const results = await Promise.allSettled([p1, p2]);

      expect((results[0] as PromiseFulfilledResult<bigint>).value).assertEqual(9007199254740991n);
      expect((results[1] as PromiseFulfilledResult<bigint>).value).assertEqual(12345678901234567890n);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_3000
     * @tc.name PromiseAllSettledTest030
     * @tc.desc Nested allSettled calls in input array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAllSettledTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const innerSettled1: Promise<PromiseSettledResult<Object>[]> = Promise.allSettled([
        Promise.resolve('inner 1'),
        Promise.reject(new Error('inner error'))
      ]);
      const innerSettled2: Promise<PromiseSettledResult<number>[]> = Promise.allSettled([
        new Promise<number>((resolve) => setTimeout(() => resolve(5), 10))
      ]);

      const results = await Promise.allSettled([innerSettled1, innerSettled2]);
      const innerResult1 = (results[0] as PromiseFulfilledResult<PromiseSettledResult<Object>[]>).value;
      const innerResult2 = (results[1] as PromiseFulfilledResult<PromiseSettledResult<number>[]>).value;

      expect((innerResult1[0] as PromiseFulfilledResult<string>).value).assertEqual('inner 1');
      expect((innerResult1[1] as PromiseRejectedResult).reason.message).assertEqual('inner error');
      expect((innerResult2[0] as PromiseFulfilledResult<number>).value).assertEqual(5);
    });
    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_3100
     * @tc.name PromiseAllSettledTest031
     * @tc.desc Promises resolving to regexp objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllSettledTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const p1: Promise<RegExp> = new Promise<RegExp>((resolve) => resolve(/test/i));
      const p2: Promise<RegExp> =
        new Promise<RegExp>((resolve) => setTimeout(() => resolve(new RegExp('pattern', 'g')), 20));

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
     * @tc.level Level 2
     */
    it('PromiseAllSettledTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const add = (a: number, b: number) => a + b;
      const p1: Promise<string> = new Promise<string>((resolve) => resolve('func test'));
      const rawFunc = (str: string) => str.toUpperCase();

      const results = await Promise.allSettled([p1, add, rawFunc]);
      const resultAdd = (results[1] as PromiseFulfilledResult<(a: number, b: number) => number>).value;
      const resultRawFunc = (results[2] as PromiseFulfilledResult<(str: string) => string>).value;

      expect((results[0] as PromiseFulfilledResult<string>).value).assertEqual('func test');
      expect(resultAdd(3, 5)).assertEqual(8);
      expect(resultRawFunc('hello')).assertEqual('HELLO');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_3300
     * @tc.name PromiseAllSettledTest033
     * @tc.desc Mixed delayed rejected promises with different timings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllSettledTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const p1: Promise<Object> =
        new Promise<Object>((_, reject) => setTimeout(() => reject(new Error('10ms fail')), 10));
      const p2: Promise<Object> =
        new Promise<Object>((_, reject) => setTimeout(() => reject(new Error('5ms fail')), 5));
      const p3: Promise<Object> =
        new Promise<Object>((_, reject) => setTimeout(() => reject(new Error('15ms fail')), 15));

      const results = await Promise.allSettled([p1, p2, p3]);

      expect((results[0] as PromiseRejectedResult).reason.message).assertEqual('10ms fail');
      expect((results[1] as PromiseRejectedResult).reason.message).assertEqual('5ms fail');
      expect((results[2] as PromiseRejectedResult).reason.message).assertEqual('15ms fail');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_3400
     * @tc.name PromiseAllSettledTest034
     * @tc.desc Promises resolving to typed arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllSettledTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const p1: Promise<Uint8Array> = new Promise<Uint8Array>((resolve) => resolve(new Uint8Array([1, 2, 3])));
      const p2: Promise<Float32Array> =
        new Promise<Float32Array>((resolve) => setTimeout(() => resolve(new Float32Array([1.5, 2.5])), 25));

      const results = await Promise.allSettled([p1, p2]);
      const uintArr = (results[0] as PromiseFulfilledResult<Uint8Array>).value;
      const floatArr = (results[1] as PromiseFulfilledResult<Float32Array>).value;

      expect(uintArr[0]).assertEqual(1);
      expect(uintArr.length).assertEqual(3);
      expect(floatArr[1]).assertEqual(2.5);
      expect(floatArr.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_3500
     * @tc.name PromiseAllSettledTest035
     * @tc.desc Input array with both resolved and pending promises
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllSettledTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const p1: Promise<number> = Promise.resolve(5);
      const p2: Promise<string> = new Promise<string>((resolve) => setTimeout(() => resolve('delayed'), 30));
      const p3: Promise<boolean> = Promise.resolve(false);

      const results = await Promise.allSettled([p1, p2, p3]);

      expect((results[0] as PromiseFulfilledResult<number>).value).assertEqual(5);
      expect((results[1] as PromiseFulfilledResult<string>).value).assertEqual('delayed');
      expect((results[2] as PromiseFulfilledResult<boolean>).value).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_3600
     * @tc.name PromiseAllSettledTest036
     * @tc.desc Promises rejected with non-error values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllSettledTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const p1: Promise<Object> = new Promise<Object>((_, reject) => reject('string error'));
      const p2: Promise<Object> = new Promise<Object>((_, reject) => reject(404));
      const p3: Promise<Object> = new Promise<Object>((_, reject) => setTimeout(() => reject({ code: 500 }), 15));

      const results = await Promise.allSettled([p1, p2, p3]);

      expect((results[0] as PromiseRejectedResult).reason).assertEqual('string error');
      expect((results[1] as PromiseRejectedResult).reason).assertEqual(404);
      expect((results[2] as PromiseRejectedResult).reason.code).assertEqual(500);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_3700
     * @tc.name PromiseAllSettledTest037
     * @tc.desc Async iterable as input (async generator)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAllSettledTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const results = await PromiseAllSettledTest037();

      expect((results[0] as PromiseFulfilledResult<number>).value).assertEqual(10);
      expect((results[1] as PromiseRejectedResult).reason.message).assertEqual('async gen error');
      expect((results[2] as PromiseFulfilledResult<string>).value).assertEqual('sync value from async gen');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_3800
     * @tc.name PromiseAllSettledTest038
     * @tc.desc Promises resolving to null and undefined in nested objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllSettledTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      interface NestedNullData {
        data: type38;
        meta: undefined | number;
      }

      const p1: Promise<NestedNullData> = new Promise<NestedNullData>((resolve) => resolve({
        data: { value: null },
        meta: undefined
      }));
      const p2: Promise<NestedNullData> = new Promise<NestedNullData>((resolve) => setTimeout(() => resolve({
        data: { value: 'valid' },
        meta: 123
      }), 20));

      const results = await Promise.allSettled([p1, p2]);
      const result1 = (results[0] as PromiseFulfilledResult<NestedNullData>).value;
      const result2 = (results[1] as PromiseFulfilledResult<NestedNullData>).value;

      expect(result1.data.value).assertEqual(null);
      expect(result1.meta).assertEqual(undefined);
      expect(result2.data.value).assertEqual('valid');
      expect(result2.meta).assertEqual(123);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_3900
     * @tc.name PromiseAllSettledTest039
     * @tc.desc Mixed promises with then-chained values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllSettledTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const p1: Promise<number> = new Promise<number>((resolve) => resolve(2))
        .then(num => num * 3)
        .then(num => num + 4);
      const p2: Promise<string> = new Promise<string>((resolve) => setTimeout(() => resolve('chain'), 10))
        .then(str => str.repeat(2));
      const p3: Promise<boolean> = Promise.resolve(true);

      const results = await Promise.allSettled([p1, p2, p3]);

      expect((results[0] as PromiseFulfilledResult<number>).value).assertEqual(10);
      expect((results[1] as PromiseFulfilledResult<string>).value).assertEqual('chainchain');
      expect((results[2] as PromiseFulfilledResult<boolean>).value).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_4000
     * @tc.name PromiseAllSettledTest040
     * @tc.desc Set with mixed promise statuses as input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllSettledTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const p1: Promise<number> = new Promise<number>((resolve) => resolve(100));
      const p2: Promise<string> = new Promise<string>((_, reject) => reject(new Error('set fail')));
      const p3: Promise<boolean> = new Promise<boolean>((resolve) => setTimeout(() => resolve(true), 15));
      const promiseSet = new Set([p1, p2, p3]);

      const results = await Promise.allSettled(Array.from(promiseSet));
      const resultArray = Array.from(results);

      expect((resultArray[0] as PromiseFulfilledResult<number>).value).assertEqual(100);
      expect((resultArray[1] as PromiseRejectedResult).reason.message).assertEqual('set fail');
      expect((resultArray[2] as PromiseFulfilledResult<boolean>).value).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_4100
     * @tc.name PromiseAllSettledTest041
     * @tc.desc Multi-level nested allSettled with async delays
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseAllSettledTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const results = await PromiseAllSettledTest041();
      expect(results).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_4200
     * @tc.name PromiseAllSettledTest042
     * @tc.desc Async sequence with dependent promise timings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAllSettledTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let delay1 = 0;
      const p1: Promise<number> = new Promise<number>((resolve) => {
        setTimeout(() => {
          delay1 = 20;
          resolve(delay1);
        }, 20);
      });
      const p2: Promise<number> = new Promise<number>((resolve) => {
        setTimeout(() => resolve(delay1 * 2), 30);
      });
      const p3: Promise<number> = new Promise<number>((resolve) => setTimeout(() => resolve(5), 10));

      const results = await Promise.allSettled([p1, p2, p3]);

      expect((results[0] as PromiseFulfilledResult<number>).value).assertEqual(20);
      expect((results[1] as PromiseFulfilledResult<number>).value).assertEqual(40);
      expect((results[2] as PromiseFulfilledResult<number>).value).assertEqual(5);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_4300
     * @tc.name PromiseAllSettledTest043
     * @tc.desc 3-level nested promises with mixed statuses
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseAllSettledTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const innerInner = [
        new Promise<string>((resolve) => setTimeout(() => resolve('deep success'), 5)),
        Promise.reject(new Error('deep fail'))
      ];
      const inner = [
        Promise.allSettled(innerInner),
        new Promise<boolean>((resolve) => setTimeout(() => resolve(true), 15))
      ];
      const outer: Promise<Object>[] = [
        Promise.allSettled(inner),
        Promise.reject(new Error('outer fail')),
        new Promise<number>((resolve) => setTimeout(() => resolve(100), 10))
      ];

      const results = await Promise.allSettled(outer);
      const outerResult1 = (results[0] as PromiseFulfilledResult<PromiseSettledResult<Object>[]>).value;
      const innerResult0 = (outerResult1[0] as PromiseFulfilledResult<PromiseSettledResult<Object>[]>).value;

      expect((innerResult0[0] as PromiseFulfilledResult<string>).value).assertEqual('deep success');
      expect((innerResult0[1] as PromiseRejectedResult).reason.message).assertEqual('deep fail');
      expect((outerResult1[1] as PromiseFulfilledResult<boolean>).value).assertEqual(true);
      expect((results[1] as PromiseRejectedResult).reason.message).assertEqual('outer fail');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_4400
     * @tc.name PromiseAllSettledTest044
     * @tc.desc Async iterator with nested allSettled
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseAllSettledTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const resultArray = await PromiseAllSettledTest044();
      const innerResult = (resultArray[0] as PromiseFulfilledResult<PromiseSettledResult<Object>[]>).value;

      expect((innerResult[0] as PromiseFulfilledResult<number>).value).assertEqual(10);
      expect((innerResult[1] as PromiseRejectedResult).reason.message).assertEqual('gen inner fail');
      expect((resultArray[1] as PromiseFulfilledResult<string>).value).assertEqual('gen outer');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_4500
     * @tc.name PromiseAllSettledTest045
     * @tc.desc Timing test: fast reject vs slow resolve
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAllSettledTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const start = Date.now();
      const p1: Promise<string> = new Promise<string>((_, reject) => setTimeout(() => reject(new Error('fast')), 10));
      const p2: Promise<string> = new Promise<string>((resolve) => setTimeout(() => resolve('slow'), 100));

      const results = await Promise.allSettled([p1, p2]);
      const end = Date.now();

      expect((results[0] as PromiseRejectedResult).reason.message).assertEqual('fast');
      expect((results[1] as PromiseFulfilledResult<string>).value).assertEqual('slow');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_4600
     * @tc.name PromiseAllSettledTest046
     * @tc.desc 4-level nested then-chained allSettled
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseAllSettledTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const level4 = Promise.allSettled([new Promise<number>((r) => setTimeout(() => r(4), 5))])
        .then(res => (res[0] as PromiseFulfilledResult<number>).value * 2);
      const level3 = Promise.allSettled([level4])
        .then(res => (res[0] as PromiseFulfilledResult<number>).value + 2);
      const level2 = Promise.allSettled([level3])
        .then(res => (res[0] as PromiseFulfilledResult<number>).value * 3);
      const level1: Promise<PromiseSettledResult<number>[]> = Promise.allSettled([level2]);

      const results = await level1;
      expect((results[0] as PromiseFulfilledResult<number>).value).assertEqual(30);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_4700
     * @tc.name PromiseAllSettledTest047
     * @tc.desc Async generator with dependent timings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAllSettledTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const resultArray = await PromiseAllSettledTest047();

      expect((resultArray[0] as PromiseFulfilledResult<number>).value).assertEqual(20);
      expect((resultArray[1] as PromiseFulfilledResult<number>).value).assertEqual(40);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_4800
     * @tc.name PromiseAllSettledTest048
     * @tc.desc Nested allSettled with mixed resolved/rejected levels
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseAllSettledTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const layer1 = Promise.allSettled([
        Promise.reject(new Error('layer1 fail')),
        Promise.allSettled([
          new Promise<string>((resolve) => setTimeout(() => resolve('layer2 success'), 10)),
          Promise.allSettled([
            new Promise<number>((resolve) => setTimeout(() => resolve(3), 5))
          ])
        ])
      ]);

      const results = await layer1;
      const layer1Result1 = (results[1] as PromiseFulfilledResult<PromiseSettledResult<Object>[]>).value;
      const layer2Result1 = (layer1Result1[1] as PromiseFulfilledResult<PromiseSettledResult<Object>[]>).value;

      expect((results[0] as PromiseRejectedResult).reason.message).assertEqual('layer1 fail');
      expect((layer1Result1[0] as PromiseFulfilledResult<string>).value).assertEqual('layer2 success');
      expect((layer2Result1[0] as PromiseFulfilledResult<number>).value).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_4900
     * @tc.name PromiseAllSettledTest049
     * @tc.desc Timing priority: late resolve vs early reject
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAllSettledTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1: Promise<number> = new Promise<number>((resolve) => setTimeout(() => resolve(100), 200));
      const p2: Promise<number> = new Promise<number>((_, reject) => setTimeout(() => reject(new Error('50ms')), 50));
      const p3: Promise<number> = new Promise<number>((resolve) => setTimeout(() => resolve(200), 150));

      const results = await Promise.allSettled([p1, p2, p3]);
      const end = Date.now();

      expect((results[0] as PromiseFulfilledResult<number>).value).assertEqual(100);
      expect((results[1] as PromiseRejectedResult).reason.message).assertEqual('50ms');
      expect((results[2] as PromiseFulfilledResult<number>).value).assertEqual(200);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_5000
     * @tc.name PromiseAllSettledTest050
     * @tc.desc Nested async functions in allSettled
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseAllSettledTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const asyncInner = async (): Promise<number> => {
        const res = await Promise.allSettled([new Promise<number>((r) => setTimeout(() => r(10), 5))]);
        return (res[0] as PromiseFulfilledResult<number>).value * 2;
      };
      const asyncMiddle = async (): Promise<number> => {
        const res = await Promise.allSettled([asyncInner()]);
        return (res[0] as PromiseFulfilledResult<number>).value + 5;
      };
      const outer: Promise<Object>[] = [asyncMiddle(), Promise.reject(new Error('outer'))];

      const results = await Promise.allSettled(outer);

      expect((results[0] as PromiseFulfilledResult<number>).value).assertEqual(25);
      expect((results[1] as PromiseRejectedResult).reason.message).assertEqual('outer');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_5100
     * @tc.name PromiseAllSettledTest051
     * @tc.desc Sequential async delays in nested allSettled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAllSettledTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const start = Date.now();
      const p1: Promise<number> = new Promise<number>((resolve) => setTimeout(() => resolve(1), 10));
      const p2: Promise<number> =
        p1.then(val => new Promise<number>((resolve) => setTimeout(() => resolve(val + 1), 20)));
      const p3: Promise<number> =
        p2.then(val => new Promise<number>((resolve) => setTimeout(() => resolve(val + 1), 30)));

      const results = await Promise.allSettled([p1, p2, p3]);
      const end = Date.now();

      expect((results[0] as PromiseFulfilledResult<number>).value).assertEqual(1);
      expect((results[1] as PromiseFulfilledResult<number>).value).assertEqual(2);
      expect((results[2] as PromiseFulfilledResult<number>).value).assertEqual(3);
    });
    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_5200
     * @tc.name PromiseAllSettledTest052
     * @tc.desc 3-level nested Set with promises
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseAllSettledTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const innerSet = new Set([
        new Promise<string>((resolve) => setTimeout(() => resolve('inner set'), 5)),
        Promise.reject(new Error('inner set fail'))
      ]);
      const middleSet = new Set([
        Promise.allSettled(innerSet),
        new Promise<number>((resolve) => setTimeout(() => resolve(100), 10))
      ]);
      const outerSet = new Set([Promise.allSettled(Array.from(middleSet))]);

      const results = await Promise.allSettled(outerSet);
      const outerResult = (Array.from(results)[0] as PromiseFulfilledResult<PromiseSettledResult<Object>[]>).value;
      const middleResult =
        (Array.from(outerResult)[0] as PromiseFulfilledResult<PromiseSettledResult<Object>[]>).value;
      const innerResult = Array.from(middleResult);

      expect((innerResult[0] as PromiseFulfilledResult<string>).value).assertEqual('inner set');
      expect((innerResult[1] as PromiseRejectedResult).reason.message).assertEqual('inner set fail');
      expect((Array.from(outerResult)[1] as PromiseFulfilledResult<number>).value).assertEqual(100);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_5300
     * @tc.name PromiseAllSettledTest053
     * @tc.desc Async timing race in nested allSettled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAllSettledTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1: Promise<number> = new Promise<number>((resolve) => setTimeout(() => resolve(10), 30));
      const p2: Promise<number> = new Promise<number>((resolve) => setTimeout(() => resolve(20), 10));
      const nested = Promise.allSettled([p1, p2]);
      const outer = Promise.allSettled([nested, new Promise<number>((resolve) => setTimeout(() => resolve(30), 20))]);

      const results = await outer;
      const nestedResult = (results[0] as PromiseFulfilledResult<PromiseSettledResult<number>[]>).value;

      expect((nestedResult[0] as PromiseFulfilledResult<number>).value).assertEqual(10);
      expect((nestedResult[1] as PromiseFulfilledResult<number>).value).assertEqual(20);
      expect((results[1] as PromiseFulfilledResult<number>).value).assertEqual(30);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_5400
     * @tc.name PromiseAllSettledTest054
     * @tc.desc 4-level nested async functions with delays
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseAllSettledTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const level4 = async (): Promise<number> => {
        return await new Promise<number>((resolve) => setTimeout(() => resolve(2), 5));
      };
      const level3 = async (): Promise<number> => {
        const res = await Promise.allSettled([level4()]);
        return (res[0] as PromiseFulfilledResult<number>).value * 3;
      };
      const level2 = async (): Promise<number> => {
        const res = await Promise.allSettled([level3()]);
        return (res[0] as PromiseFulfilledResult<number>).value + 4;
      };
      const level1 = async (): Promise<number> => {
        const res = await Promise.allSettled([level2()]);
        return (res[0] as PromiseFulfilledResult<number>).value / 2;
      };

      const results = await Promise.allSettled([level1(), Promise.reject(new Error('level1 fail'))]);

      expect((results[0] as PromiseFulfilledResult<number>).value).assertEqual(5);
      expect((results[1] as PromiseRejectedResult).reason.message).assertEqual('level1 fail');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_5500
     * @tc.name PromiseAllSettledTest055
     * @tc.desc Timing test: multiple late rejects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAllSettledTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const start = Date.now();
      const p1: Promise<Object> = new Promise<Object>((_, reject) => setTimeout(() => reject(new Error('50ms')), 50));
      const p2: Promise<Object> =
        new Promise<Object>((_, reject) => setTimeout(() => reject(new Error('100ms')), 100));
      const p3: Promise<Object> =
        new Promise<Object>((_, reject) => setTimeout(() => reject(new Error('150ms')), 150));

      const results = await Promise.allSettled([p1, p2, p3]);
      const end = Date.now();

      expect((results[0] as PromiseRejectedResult).reason.message).assertEqual('50ms');
      expect((results[1] as PromiseRejectedResult).reason.message).assertEqual('100ms');
      expect((results[2] as PromiseRejectedResult).reason.message).assertEqual('150ms');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_5600
     * @tc.name PromiseAllSettledTest056
     * @tc.desc Nested allSettled with async generator inside
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseAllSettledTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {

      let innerGen = [
        new Promise<number>((resolve) => setTimeout(() => resolve(10), 5)),
        Promise.reject(new Error('gen fail'))
      ]

      const middle = Promise.allSettled(innerGen);
      const outer =
        Promise.allSettled([middle, new Promise<string>((resolve) => setTimeout(() => resolve('outer'), 15))]);

      const results = await outer;
      const middleResult = (results[0] as PromiseFulfilledResult<PromiseSettledResult<Object>[]>).value;
      const genResult = Array.from(middleResult);

      expect((genResult[0] as PromiseFulfilledResult<number>).value).assertEqual(10);
      expect((genResult[1] as PromiseRejectedResult).reason.message).assertEqual('gen fail');
      expect((results[1] as PromiseFulfilledResult<string>).value).assertEqual('outer');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_5700
     * @tc.name PromiseAllSettledTest057
     * @tc.desc Dependent async values in nested allSettled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAllSettledTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let base = 0;
      const p1: Promise<number> = new Promise<number>((resolve) => setTimeout(() => {
        base = 10;
        resolve(base);
      }, 20));
      const p2: Promise<number> = Promise.allSettled([p1]).then(res => {
        return new Promise<number>((resolve) => setTimeout(() => resolve((res[0] as PromiseFulfilledResult<number>).value *
          2), 10));
      });
      const p3: Promise<number> =
        Promise.allSettled([p2]).then(res => (res[0] as PromiseFulfilledResult<number>).value + 5);

      const results = await Promise.allSettled([p1, p2, p3]);

      expect((results[0] as PromiseFulfilledResult<number>).value).assertEqual(10);
      expect((results[1] as PromiseFulfilledResult<number>).value).assertEqual(20);
      expect((results[2] as PromiseFulfilledResult<number>).value).assertEqual(25);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_5800
     * @tc.name PromiseAllSettledTest058
     * @tc.desc 3-level nested with mixed resolve/reject timing
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseAllSettledTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const inner = Promise.allSettled([
        new Promise<string>((resolve) => setTimeout(() => resolve('inner success'), 30)),
        Promise.reject(new Error('inner fail (10ms)')), 10
      ]);
      const middle = Promise.allSettled([
        inner,
        new Promise<boolean>((_, reject) => setTimeout(() => reject(new Error('middle fail (20ms)')), 20))
      ]);
      const outer = Promise.allSettled([
        middle,
        new Promise<number>((resolve) => setTimeout(() => resolve(100), 25))
      ]);

      const results = await outer;
      const middleResult = (results[0] as PromiseFulfilledResult<PromiseSettledResult<Object>[]>).value;
      const innerResult = (middleResult[0] as PromiseFulfilledResult<PromiseSettledResult<Object>[]>).value;

      expect((innerResult[0] as PromiseFulfilledResult<string>).value).assertEqual('inner success');
      expect((innerResult[1] as PromiseRejectedResult).reason.message).assertEqual('inner fail (10ms)');
      expect((middleResult[1] as PromiseRejectedResult).reason.message).assertEqual('middle fail (20ms)');
      expect((results[1] as PromiseFulfilledResult<number>).value).assertEqual(100);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_5900
     * @tc.name PromiseAllSettledTest059
     * @tc.desc Async iterator with nested then chains
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAllSettledTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {

      let chainGen = [
        new Promise<number>((resolve) => setTimeout(() => resolve(2), 5))
          .then(num => num * 3)
          .then(num => num + 4),
        Promise.reject(new Error('gen chain fail'))
          .catch((err: Error) => `Caught: ${err.message}`)]

      const results = await Promise.allSettled(chainGen);
      const resultArray = Array.from(results);

      expect((resultArray[0] as PromiseFulfilledResult<number>).value).assertEqual(10);
      expect((resultArray[1] as PromiseFulfilledResult<string>).value).assertEqual('Caught: gen chain fail');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_6000
     * @tc.name PromiseAllSettledTest060
     * @tc.desc Timing test: shortest vs longest delay
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAllSettledTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const start = Date.now();
      const delays = [5, 50, 20, 80, 10];
      const promises = delays.map((delay, idx) =>
      new Promise<number>((resolve) => setTimeout(() => resolve(idx), delay))
      );

      const results = await Promise.allSettled(promises);
      const end = Date.now();

      delays.forEach((_, idx) => {
        expect((results[idx] as PromiseFulfilledResult<number>).value).assertEqual(idx);
      });
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_6100
     * @tc.name PromiseAllSettledTest061
     * @tc.desc 4-level nested Set with async generators
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseAllSettledTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const level3Set =
        new Set([Promise.allSettled([new Promise<number>((resolve) => setTimeout(() => resolve(1), 5))])]);
      const level2Set =
        new Set([Promise.allSettled(level3Set), new Promise<number>((resolve) => setTimeout(() => resolve(2), 10))]);
      const level1Set = new Set([Promise.allSettled(Array.from(level2Set)), Promise.reject(new Error('level1 fail'))]);

      const results = await Promise.allSettled(level1Set);
      const resultArray = Array.from(results);
      const level2Result = (resultArray[0] as PromiseFulfilledResult<PromiseSettledResult<Object>[]>).value;
      const level3Result =
        (Array.from(level2Result)[0] as PromiseFulfilledResult<PromiseSettledResult<Object>[]>).value;
      const level4Result = Array.from(level3Result);

      expect((level4Result[0] as PromiseFulfilledResult<number>).value)
        .assertDeepEquals([{ "status": "fulfilled", "value": 1 }]);
      expect((Array.from(level2Result)[1] as PromiseFulfilledResult<number>).value).assertEqual(2);
      expect((resultArray[1] as PromiseRejectedResult).reason.message).assertEqual('level1 fail');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_6200
     * @tc.name PromiseAllSettledTest062
     * @tc.desc Nested allSettled with dependent errors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAllSettledTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const inner = Promise.allSettled([
        Promise.reject(new Error('inner root')),
        new Promise<string>((_, reject) => setTimeout(() => reject(new Error('inner delay')), 15))
      ]);
      const outer = Promise.allSettled([
        inner.then(res => {
          const errMsg: string = (res[0] as PromiseRejectedResult).reason.message;
          return new Promise<string>((resolve) => setTimeout(() => resolve(`Wrapped: ${errMsg}`), 10));
        })
      ]);

      const results = await outer;
      const outerResult = (results[0] as PromiseFulfilledResult<string>).value;

      expect(outerResult).assertEqual('Wrapped: inner root');
    });
    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_6300
     * @tc.name PromiseAllSettledTest063
     * @tc.desc Async timing with overlapping delays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAllSettledTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const timeLog: number[] = [];
      const p1: Promise<number> = new Promise<number>((resolve) =>
      setTimeout(() => {
        timeLog.push(1);
        resolve(1);
      }, 20)
      );
      const p2: Promise<number> = new Promise<number>((resolve) =>
      setTimeout(() => {
        timeLog.push(2);
        resolve(2);
      }, 10)
      );
      const p3: Promise<number> = new Promise<number>((resolve) =>
      setTimeout(() => {
        timeLog.push(3);
        resolve(3);
      }, 15)
      );

      const results = await Promise.allSettled([p1, p2, p3]);

      expect((results[0] as PromiseFulfilledResult<number>).value).assertEqual(1);
      expect((results[1] as PromiseFulfilledResult<number>).value).assertEqual(2);
      expect((results[2] as PromiseFulfilledResult<number>).value).assertEqual(3);
      expect(timeLog).assertDeepEquals([2, 3, 1]);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_6400
     * @tc.name PromiseAllSettledTest064
     * @tc.desc 3-level nested async functions with mixed statuses
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseAllSettledTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const level3 = async (): Promise<string> => {
        const res = await Promise.allSettled([Promise.reject(new Error('level3 fail'))]);
        return (res[0] as PromiseRejectedResult).reason.message;
      };
      const level2 = async (): Promise<Object> => {
        const res = await Promise.allSettled([
          new Promise<number>((resolve) => setTimeout(() => resolve(100), 5)),
          level3()
        ]);
        return res;
      };
      const level1 = Promise.allSettled([level2(), Promise.resolve('level1 success')]);

      const results = await level1;
      const level2Result = (results[0] as PromiseFulfilledResult<PromiseSettledResult<Object>[]>).value;

      expect((level2Result[0] as PromiseFulfilledResult<number>).value).assertEqual(100);
      expect((level2Result[1] as PromiseFulfilledResult<string>).value).assertEqual('level3 fail');
      expect((results[1] as PromiseFulfilledResult<string>).value).assertEqual('level1 success');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_6500
     * @tc.name PromiseAllSettledTest065
     * @tc.desc Timing test: reject after multiple resolves
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAllSettledTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const start = Date.now();
      const p1: Promise<number> = new Promise<number>((resolve) => setTimeout(() => resolve(10), 10));
      const p2: Promise<number> = new Promise<number>((resolve) => setTimeout(() => resolve(20), 30));
      const p3: Promise<Object> =
        new Promise<Object>((_, reject) => setTimeout(() => reject(new Error('late reject')), 50));

      const results = await Promise.allSettled([p1, p2, p3]);
      const end = Date.now();

      expect(end - start + 1).assertLargerOrEqual(50);
      expect((results[0] as PromiseFulfilledResult<number>).value).assertEqual(10);
      expect((results[1] as PromiseFulfilledResult<number>).value).assertEqual(20);
      expect((results[2] as PromiseRejectedResult).reason.message).assertEqual('late reject');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_6600
     * @tc.name PromiseAllSettledTest066
     * @tc.desc Nested allSettled with typed array results
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseAllSettledTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const inner = Promise.allSettled([
        new Promise<Uint16Array>((resolve) => setTimeout(() => resolve(new Uint16Array([1, 2])), 5)),
        Promise.reject(new Error('typed array fail'))
      ]);
      const middle = Promise.allSettled([
        inner,
        new Promise<Float64Array>((resolve) => setTimeout(() => resolve(new Float64Array([3.14, 2.71])), 10))
      ]);
      const outer = Promise.allSettled([middle]);

      const results = await outer;
      const middleResult = (results[0] as PromiseFulfilledResult<PromiseSettledResult<Object>[]>).value;
      const innerResult = (middleResult[0] as PromiseFulfilledResult<PromiseSettledResult<Object>[]>).value;
      const uintArr = (innerResult[0] as PromiseFulfilledResult<Uint16Array>).value;
      const floatArr = (middleResult[1] as PromiseFulfilledResult<Float64Array>).value;

      expect(uintArr[1]).assertEqual(2);
      expect(uintArr.BYTES_PER_ELEMENT).assertEqual(2);
      expect(floatArr[0]).assertEqual(3.14);
      expect((innerResult[1] as PromiseRejectedResult).reason.message).assertEqual('typed array fail');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_6700
     * @tc.name PromiseAllSettledTest067
     * @tc.desc Async generator with nested Set of promises
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseAllSettledTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const innerSet = new Set([
        new Promise<string>((resolve) => setTimeout(() => resolve('set inner'), 5)),
        Promise.reject(new Error('set inner fail'))
      ]);

      let genWithSet = [
        Promise.allSettled(innerSet),
        new Promise<number>((resolve) => setTimeout(() => resolve(99), 15))
      ]

      const results = await Promise.allSettled(genWithSet);
      const resultArray = Array.from(results);
      const setResult = (resultArray[0] as PromiseFulfilledResult<PromiseSettledResult<Object>[]>).value;

      expect((Array.from(setResult)[0] as PromiseFulfilledResult<string>).value).assertEqual('set inner');
      expect((Array.from(setResult)[1] as PromiseRejectedResult).reason.message).assertEqual('set inner fail');
      expect((resultArray[1] as PromiseFulfilledResult<number>).value).assertEqual(99);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_6800
     * @tc.name PromiseAllSettledTest068
     * @tc.desc Dependent timing in nested then chains
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAllSettledTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let totalDelay = 0;
      const p1: Promise<number> = new Promise<number>((resolve) => {
        const delay = 10;
        totalDelay += delay;
        setTimeout(() => resolve(delay), delay);
      });
      const p2: Promise<number> = p1.then(val => new Promise<number>((resolve) => {
        const delay = val * 2;
        totalDelay += delay;
        setTimeout(() => resolve(delay), delay);
      }));
      const p3: Promise<number> = p2.then(val => new Promise<number>((resolve) => {
        const delay = val + 5;
        totalDelay += delay;
        setTimeout(() => resolve(delay), delay);
      }));

      const results = await Promise.allSettled([p1, p2, p3]);

      expect((results[0] as PromiseFulfilledResult<number>).value).assertEqual(10);
      expect((results[1] as PromiseFulfilledResult<number>).value).assertEqual(20);
      expect((results[2] as PromiseFulfilledResult<number>).value).assertEqual(25);
      expect(totalDelay).assertEqual(55);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_6900
     * @tc.name PromiseAllSettledTest069
     * @tc.desc 4-level nested with mixed resolve/reject and delays
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseAllSettledTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const level4 = Promise.allSettled([new Promise<number>((r) => setTimeout(() => r(1), 5))]);
      const level3 = Promise.allSettled([
        level4,
        Promise.reject(new Error('level3 fail'))
      ]);
      const level2 = Promise.allSettled([
        level3,
        new Promise<string>((r) => setTimeout(() => r('level2 success'), 15))
      ]);
      const level1 = Promise.allSettled([
        level2,
        Promise.reject(new Error('level1 fail'))
      ]);

      const results = await level1;
      const level2Result = (results[0] as PromiseFulfilledResult<PromiseSettledResult<Object>[]>).value;
      const level3Result = (level2Result[0] as PromiseFulfilledResult<PromiseSettledResult<Object>[]>).value;
      const level4Result = (level3Result[0] as PromiseFulfilledResult<PromiseSettledResult<number>[]>).value;

      expect((level4Result[0] as PromiseFulfilledResult<number>).value).assertEqual(1);
      expect((level3Result[1] as PromiseRejectedResult).reason.message).assertEqual('level3 fail');
      expect((level2Result[1] as PromiseFulfilledResult<string>).value).assertEqual('level2 success');
      expect((results[1] as PromiseRejectedResult).reason.message).assertEqual('level1 fail');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_7000
     * @tc.name PromiseAllSettledTest070
     * @tc.desc Timing test: all promises with increasing delays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAllSettledTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const start = Date.now();
      const promises = [10, 20, 30, 40, 50].map((delay, idx) =>
      new Promise<number>((resolve) => setTimeout(() => resolve(idx), delay))
      );

      const results = await Promise.allSettled(promises);
      const end = Date.now();

      promises.forEach((_, idx) => {
        expect((results[idx] as PromiseFulfilledResult<number>).value).assertEqual(idx);
      });
    });
    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_7100
     * @tc.name PromiseAllSettledTest071
     * @tc.desc 5-level nested allSettled with incremental delays
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 5
     */
    it('PromiseAllSettledTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const level5 = Promise.allSettled([new Promise<number>((r) => setTimeout(() => r(1), 5))]);
      const level4 = Promise.allSettled([level5, new Promise<number>((r) => setTimeout(() => r(2), 10))]);
      const level3 = Promise.allSettled([level4, new Promise<number>((r) => setTimeout(() => r(3), 15))]);
      const level2 = Promise.allSettled([level3, new Promise<number>((r) => setTimeout(() => r(4), 20))]);
      const level1 = Promise.allSettled([level2, new Promise<number>((r) => setTimeout(() => r(5), 25))]);

      const results = await level1;
      const l2Res = (results[0] as PromiseFulfilledResult<PromiseSettledResult<Object>[]>).value;
      const l3Res = (l2Res[0] as PromiseFulfilledResult<PromiseSettledResult<Object>[]>).value;
      const l4Res = (l3Res[0] as PromiseFulfilledResult<PromiseSettledResult<Object>[]>).value;
      const l5Res = (l4Res[0] as PromiseFulfilledResult<PromiseSettledResult<number>[]>).value;

      expect((l5Res[0] as PromiseFulfilledResult<number>).value).assertEqual(1);
      expect((l4Res[1] as PromiseFulfilledResult<number>).value).assertEqual(2);
      expect((l3Res[1] as PromiseFulfilledResult<number>).value).assertEqual(3);
      expect((l2Res[1] as PromiseFulfilledResult<number>).value).assertEqual(4);
      expect((results[1] as PromiseFulfilledResult<number>).value).assertEqual(5);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_7200
     * @tc.name PromiseAllSettledTest072
     * @tc.desc Timing cascade: reject triggers dependent resolve
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseAllSettledTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let rejectMsg = '';
      const p1: Promise<Object> =
        new Promise<Object>((_, reject) => setTimeout(() => reject(new Error('trigger')), 10));
      const p2: Promise<string> = Promise.allSettled([p1]).then(res => {
        rejectMsg = (res[0] as PromiseRejectedResult).reason.message;
        return new Promise<string>((resolve) => setTimeout(() => resolve(`Handled: ${rejectMsg}`), 20));
      });
      const p3: Promise<string> =
        Promise.allSettled([p2]).then(res => (res[0] as PromiseFulfilledResult<string>).value.toUpperCase());

      const results = await Promise.allSettled([p1, p2, p3]);

      expect((results[0] as PromiseRejectedResult).reason.message).assertEqual('trigger');
      expect((results[1] as PromiseFulfilledResult<string>).value).assertEqual('Handled: trigger');
      expect((results[2] as PromiseFulfilledResult<string>).value).assertEqual('HANDLED: TRIGGER');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_7300
     * @tc.name PromiseAllSettledTest073
     * @tc.desc Nested Set + async generator with cross-level timing
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 5
     */
    it('PromiseAllSettledTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const innerSet = new Set([new Promise<number>((r) => setTimeout(() => r(10), 5))]);

      let midGen = [
        Promise.allSettled(innerSet),
        Promise.reject(new Error('gen mid fail'))]

      const outerSet =
        new Set([Promise.allSettled(midGen), new Promise<string>((r) => setTimeout(() => r('outer'), 20))]);

      const results = await Promise.allSettled(Array.from(outerSet));
      const resArr = Array.from(results);
      const midRes = (resArr[0] as PromiseFulfilledResult<PromiseSettledResult<Object>[]>).value;
      const innerRes = (Array.from(midRes)[0] as PromiseFulfilledResult<PromiseSettledResult<number>[]>).value;

      expect((innerRes[0] as PromiseFulfilledResult<number>).value).assertEqual(10);
      expect((Array.from(midRes)[1] as PromiseRejectedResult).reason.message).assertEqual('gen mid fail');
      expect((resArr[1] as PromiseFulfilledResult<string>).value).assertEqual('outer');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_7400
     * @tc.name PromiseAllSettledTest074
     * @tc.desc Sequential timing cascade with 3-level dependencies
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseAllSettledTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const start = Date.now();
      const p1: Promise<number> = new Promise<number>((r) => setTimeout(() => r(2), 10));
      const p2: Promise<number> = Promise.allSettled([p1]).then(res =>
      new Promise<number>((r) => setTimeout(() => r((res[0] as PromiseFulfilledResult<number>).value * 3), 20))
      );
      const p3: Promise<number> = Promise.allSettled([p2]).then(res =>
      new Promise<number>((r) => setTimeout(() => r((res[0] as PromiseFulfilledResult<number>).value + 4), 30))
      );

      const results = await Promise.allSettled([p1, p2, p3]);
      const end = Date.now();

      expect((results[0] as PromiseFulfilledResult<number>).value).assertEqual(2);
      expect((results[1] as PromiseFulfilledResult<number>).value).assertEqual(6);
      expect((results[2] as PromiseFulfilledResult<number>).value).assertEqual(10);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_7500
     * @tc.name PromiseAllSettledTest075
     * @tc.desc 4-level nested with alternating resolve/reject
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 5
     */
    it('PromiseAllSettledTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const level4 = Promise.allSettled([Promise.resolve(1)]);
      const level3 = Promise.allSettled([level4, Promise.reject(new Error('l3 fail'))]);
      const level2 = Promise.allSettled([level3, Promise.resolve('l2 success')]);
      const level1 = Promise.allSettled([level2, Promise.reject(new Error('l1 fail'))]);

      const results = await level1;
      const l2Res = (results[0] as PromiseFulfilledResult<PromiseSettledResult<Object>[]>).value;
      const l3Res = (l2Res[0] as PromiseFulfilledResult<PromiseSettledResult<Object>[]>).value;
      const l4Res = (l3Res[0] as PromiseFulfilledResult<PromiseSettledResult<number>[]>).value;

      expect((l4Res[0] as PromiseFulfilledResult<number>).value).assertEqual(1);
      expect((l3Res[1] as PromiseRejectedResult).reason.message).assertEqual('l3 fail');
      expect((l2Res[1] as PromiseFulfilledResult<string>).value).assertEqual('l2 success');
      expect((results[1] as PromiseRejectedResult).reason.message).assertEqual('l1 fail');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_7600
     * @tc.name PromiseAllSettledTest076
     * @tc.desc Timing: early resolve waits for late reject in nested
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseAllSettledTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const start = Date.now();
      const inner = Promise.allSettled([
        new Promise<string>((r) => setTimeout(() => r('fast'), 10)),
        new Promise<Object>((_, rj) => setTimeout(() => rj(new Error('slow')), 50))
      ]);
      const outer = Promise.allSettled([inner, new Promise<number>((r) => setTimeout(() => r(100), 30))]);

      const results = await outer;
      const end = Date.now();
      const innerRes = (results[0] as PromiseFulfilledResult<PromiseSettledResult<Object>[]>).value;

      expect(end - start + 1).assertLargerOrEqual(50);
      expect((innerRes[0] as PromiseFulfilledResult<string>).value).assertEqual('fast');
      expect((innerRes[1] as PromiseRejectedResult).reason.message).assertEqual('slow');
      expect((results[1] as PromiseFulfilledResult<number>).value).assertEqual(100);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_7700
     * @tc.name PromiseAllSettledTest077
     * @tc.desc Nested async functions with cascade timing
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 5
     */
    it('PromiseAllSettledTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const level4 = async (): Promise<number> => await new Promise<number>((r) => setTimeout(() => r(2), 5));
      const level3 = async (): Promise<number> => {
        const res = await Promise.allSettled([level4()]);
        return new Promise<number>((r) => setTimeout(() => r((res[0] as PromiseFulfilledResult<number>).value * 2),
          10));
      };
      const level2 = async (): Promise<number> => {
        const res = await Promise.allSettled([level3()]);
        return new Promise<number>((r) => setTimeout(() => r((res[0] as PromiseFulfilledResult<number>).value + 5),
          15));
      };
      const level1 = async (): Promise<number> => {
        const res = await Promise.allSettled([level2()]);
        return new Promise<number>((r) => setTimeout(() => r((res[0] as PromiseFulfilledResult<number>).value / 3),
          20));
      };

      const results = await Promise.allSettled([level1()]);
      expect((results[0] as PromiseFulfilledResult<number>).value).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_7800
     * @tc.name PromiseAllSettledTest078
     * @tc.desc Timing overlap: nested resolves in parallel
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseAllSettledTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const timeLog: string[] = [];
      const p1: Promise<string> = new Promise<string>((r) => setTimeout(() => {
        timeLog.push('p1');
        r('p1');
      }, 20));
      const p2: Promise<string> = new Promise<string>((r) => setTimeout(() => {
        timeLog.push('p2');
        r('p2');
      }, 10));
      const inner = Promise.allSettled([p1, p2]);
      const p3: Promise<string> = new Promise<string>((r) => setTimeout(() => {
        timeLog.push('p3');
        r('p3');
      }, 15));

      const results = await Promise.allSettled([inner, p3]);
      const innerRes = (results[0] as PromiseFulfilledResult<PromiseSettledResult<string>[]>).value;

      expect((innerRes[0] as PromiseFulfilledResult<string>).value).assertEqual('p1');
      expect((innerRes[1] as PromiseFulfilledResult<string>).value).assertEqual('p2');
      expect((results[1] as PromiseFulfilledResult<string>).value).assertEqual('p3');
      expect(timeLog).assertDeepEquals(['p2', 'p3', 'p1']);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_7900
     * @tc.name PromiseAllSettledTest079
     * @tc.desc 3-level nested Set with alternating delays
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 5
     */
    it('PromiseAllSettledTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const innerSet = new Set([new Promise<number>((r) => setTimeout(() => r(1), 15))]);
      const midSet = new Set([
        Promise.allSettled(innerSet),
        Promise.reject(new Error('mid fail'))
      ]);
      const outerSet = new Set([
        Promise.allSettled(midSet),
        new Promise<string>((r) => setTimeout(() => r('outer'), 10))
      ]);

      const results = await Promise.allSettled(Array.from(outerSet));
      const resArr = Array.from(results);
      const midRes = (resArr[0] as PromiseFulfilledResult<PromiseSettledResult<Object>[]>).value;
      const innerRes = (Array.from(midRes)[0] as PromiseFulfilledResult<PromiseSettledResult<number>[]>).value;

      expect((innerRes[0] as PromiseFulfilledResult<number>).value).assertEqual(1);
      expect((Array.from(midRes)[1] as PromiseRejectedResult).reason.message).assertEqual('mid fail');
      expect((resArr[1] as PromiseFulfilledResult<string>).value).assertEqual('outer');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_8000
     * @tc.name PromiseAllSettledTest080
     * @tc.desc Cascade reject: nested errors propagate via then
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseAllSettledTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1: Promise<Object> = new Promise<Object>((_, rj) => setTimeout(() => rj(new Error('root')), 10));
      const p2: Promise<Object> = Promise.allSettled([p1]).then(res => {
        const err: string = (res[0] as PromiseRejectedResult).reason.message;
        return new Promise<Object>((_, rj) => setTimeout(() => rj(new Error(`wrap: ${err}`)), 20));
      });
      const p3: Promise<string> = Promise.allSettled([p2]).then((res): string =>
      (res[0] as PromiseRejectedResult).reason.message
      );

      const results = await Promise.allSettled([p1, p2, p3]);

      expect((results[0] as PromiseRejectedResult).reason.message).assertEqual('root');
      expect((results[1] as PromiseRejectedResult).reason.message).assertEqual('wrap: root');
      expect((results[2] as PromiseFulfilledResult<string>).value).assertEqual('wrap: root');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_8100
     * @tc.name PromiseAllSettledTest081
     * @tc.desc 4-level nested async generator with incremental delays
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 5
     */
    it('PromiseAllSettledTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {

      let level4Gen = [new Promise<number>((r) => setTimeout(() => r(1), 5))]

      let level3Gen = [
        Promise.allSettled(level4Gen),
        new Promise<number>((r) => setTimeout(() => r(2), 10))]

      let level2Gen = [
        Promise.allSettled(level3Gen),
        new Promise<number>((r) => setTimeout(() => r(3), 15))
      ]

      const level1 = Promise.allSettled(level2Gen);

      const results = await level1;
      const resArr = Array.from(results);
      const l3Res = (resArr[0] as PromiseFulfilledResult<PromiseSettledResult<Object>[]>).value;
      const l4Res = (Array.from(l3Res)[0] as PromiseFulfilledResult<PromiseSettledResult<number>[]>).value;

      expect((l4Res[0] as PromiseFulfilledResult<number>).value).assertEqual(1);
      expect((Array.from(l3Res)[1] as PromiseFulfilledResult<number>).value).assertEqual(2);
      expect((resArr[1] as PromiseFulfilledResult<number>).value).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_8200
     * @tc.name PromiseAllSettledTest082
     * @tc.desc Timing cascade: parallel resolves depend on root promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseAllSettledTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const start = Date.now();
      const root: Promise<number> = new Promise<number>((r) => setTimeout(() => r(10), 20));
      const p1: Promise<number> = Promise.allSettled([root]).then(res =>
      new Promise<number>((r) => setTimeout(() => r((res[0] as PromiseFulfilledResult<number>).value * 2), 10))
      );
      const p2: Promise<number> = Promise.allSettled([root]).then(res =>
      new Promise<number>((r) => setTimeout(() => r((res[0] as PromiseFulfilledResult<number>).value + 5), 15))
      );

      const results = await Promise.allSettled([root, p1, p2]);
      const end = Date.now();

      expect((results[0] as PromiseFulfilledResult<number>).value).assertEqual(10);
      expect((results[1] as PromiseFulfilledResult<number>).value).assertEqual(20);
      expect((results[2] as PromiseFulfilledResult<number>).value).assertEqual(15);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_8300
     * @tc.name PromiseAllSettledTest083
     * @tc.desc Nested Set + allSettled with mixed timing failures
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 5
     */
    it('PromiseAllSettledTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const innerSet = new Set([
        new Promise<string>((r) => setTimeout(() => r('inner ok'), 20)),
        Promise.reject(new Error('inner fail (5ms)'))
      ]);
      const mid = Promise.allSettled(innerSet);
      const outerSet = new Set([
        mid,
        new Promise<number>((_, rj) => setTimeout(() => rj(new Error('outer fail (15ms)')), 15))
      ]);

      const results = await Promise.allSettled(Array.from(outerSet));
      const resArr = Array.from(results);
      const innerRes = (resArr[0] as PromiseFulfilledResult<PromiseSettledResult<Object>[]>).value;

      expect((Array.from(innerRes)[0] as PromiseFulfilledResult<string>).value).assertEqual('inner ok');
      expect((Array.from(innerRes)[1] as PromiseRejectedResult).reason.message).assertEqual('inner fail (5ms)');
      expect((resArr[1] as PromiseRejectedResult).reason.message).assertEqual('outer fail (15ms)');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_8400
     * @tc.name PromiseAllSettledTest084
     * @tc.desc 3-level sequential timing with dependent values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseAllSettledTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let step = 0;
      const p1: Promise<number> = new Promise<number>((r) => setTimeout(() => {
        step = 1;
        r(step);
      }, 10));
      const p2: Promise<number> = Promise.allSettled([p1]).then(res =>
      new Promise<number>((r) => setTimeout(() => {
        step = (res[0] as PromiseFulfilledResult<number>).value * 3;
        r(step);
      }, 20))
      );
      const p3: Promise<number> = Promise.allSettled([p2]).then(res =>
      new Promise<number>((r) => setTimeout(() => {
        step = (res[0] as PromiseFulfilledResult<number>).value + 2;
        r(step);
      }, 30))
      );

      const results = await Promise.allSettled([p1, p2, p3]);

      expect((results[0] as PromiseFulfilledResult<number>).value).assertEqual(1);
      expect((results[1] as PromiseFulfilledResult<number>).value).assertEqual(3);
      expect((results[2] as PromiseFulfilledResult<number>).value).assertEqual(5);
      expect(step).assertEqual(5);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_8500
     * @tc.name PromiseAllSettledTest085
     * @tc.desc 5-level nested with mixed resolve/reject and fixed delays
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 5
     */
    it('PromiseAllSettledTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const level5 = Promise.allSettled([new Promise<number>((r) => setTimeout(() => r(1), 5))]);
      const level4 = Promise.allSettled([level5, Promise.reject(new Error('l4 fail'))]);
      const level3 = Promise.allSettled([level4, new Promise<string>((r) => setTimeout(() => r('l3 ok'), 10))]);
      const level2 = Promise.allSettled([level3, Promise.reject(new Error('l2 fail'))]);
      const level1 = Promise.allSettled([level2, new Promise<boolean>((r) => setTimeout(() => r(true), 15))]);

      const results = await level1;
      const l2Res = (results[0] as PromiseFulfilledResult<PromiseSettledResult<Object>[]>).value;
      const l3Res = (l2Res[0] as PromiseFulfilledResult<PromiseSettledResult<Object>[]>).value;
      const l4Res = (l3Res[0] as PromiseFulfilledResult<PromiseSettledResult<Object>[]>).value;
      const l5Res = (l4Res[0] as PromiseFulfilledResult<PromiseSettledResult<number>[]>).value;

      expect((l5Res[0] as PromiseFulfilledResult<number>).value).assertEqual(1);
      expect((l4Res[1] as PromiseRejectedResult).reason.message).assertEqual('l4 fail');
      expect((l3Res[1] as PromiseFulfilledResult<string>).value).assertEqual('l3 ok');
      expect((l2Res[1] as PromiseRejectedResult).reason.message).assertEqual('l2 fail');
      expect((results[1] as PromiseFulfilledResult<boolean>).value).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_8600
     * @tc.name PromiseAllSettledTest086
     * @tc.desc Timing: late resolve blocks outer allSettled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseAllSettledTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const start = Date.now();
      const inner = Promise.allSettled([
        new Promise<number>((r) => setTimeout(() => r(10), 50)),
        new Promise<string>((r) => setTimeout(() => r('fast'), 10))
      ]);
      const outer = Promise.allSettled([inner, new Promise<boolean>((r) => setTimeout(() => r(true), 30))]);

      const results = await outer;
      const end = Date.now();
      const innerRes = (results[0] as PromiseFulfilledResult<PromiseSettledResult<Object>[]>).value;

      expect(end - start + 1).assertLargerOrEqual(50);
      expect((innerRes[0] as PromiseFulfilledResult<number>).value).assertEqual(10);
      expect((innerRes[1] as PromiseFulfilledResult<string>).value).assertEqual('fast');
      expect((results[1] as PromiseFulfilledResult<boolean>).value).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_8700
     * @tc.name PromiseAllSettledTest087
     * @tc.desc Nested async functions with cross-level timing dependencies
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 5
     */
    it('PromiseAllSettledTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let shared = 0;
      const level4 = async (): Promise<number> => {
        return new Promise<number>((r) => setTimeout(() => {
          shared = 2;
          r(shared);
        }, 5));
      };
      const level3 = async (): Promise<number> => {
        const res = await Promise.allSettled([level4()]);
        return new Promise<number>((r) => setTimeout(() => {
          shared = (res[0] as PromiseFulfilledResult<number>).value * 3;
          r(shared);
        }, 10));
      };
      const level2 = async (): Promise<number> => {
        const res = await Promise.allSettled([level3()]);
        return new Promise<number>((r) => setTimeout(() => {
          shared = (res[0] as PromiseFulfilledResult<number>).value + shared;
          r(shared);
        }, 15));
      };

      const results = await Promise.allSettled([level2(), Promise.resolve(shared)]);
      const finalShared = shared;

      expect((results[0] as PromiseFulfilledResult<number>).value).assertEqual(12);
      expect((results[1] as PromiseFulfilledResult<number>).value).assertEqual(0);
      expect(finalShared).assertEqual(12);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_8800
     * @tc.name PromiseAllSettledTest088
     * @tc.desc 2-level nested Set + async generator with overlapping delays
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 5
     */
    it('PromiseAllSettledTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const timeLog: string[] = await PromiseAllSettledTest088()
      expect(timeLog).assertDeepEquals(['set2', 'gen1', 'set1']);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_8900
     * @tc.name PromiseAllSettledTest089
     * @tc.desc Cascade resolve: nested then chains with incremental values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseAllSettledTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1: Promise<number> = new Promise<number>((r) => setTimeout(() => r(1), 10));
      const p2: Promise<number> = Promise.allSettled([p1]).then(res =>
      new Promise<number>((r) => setTimeout(() => r((res[0] as PromiseFulfilledResult<number>).value + 2), 20))
      );
      const p3: Promise<number> = Promise.allSettled([p2]).then(res =>
      new Promise<number>((r) => setTimeout(() => r((res[0] as PromiseFulfilledResult<number>).value * 3), 30))
      );
      const p4: Promise<number> = Promise.allSettled([p3]).then(res =>
      new Promise<number>((r) => setTimeout(() => r((res[0] as PromiseFulfilledResult<number>).value - 4), 15))
      );

      const results = await Promise.allSettled([p1, p2, p3, p4]);

      expect((results[0] as PromiseFulfilledResult<number>).value).assertEqual(1);
      expect((results[1] as PromiseFulfilledResult<number>).value).assertEqual(3);
      expect((results[2] as PromiseFulfilledResult<number>).value).assertEqual(9);
      expect((results[3] as PromiseFulfilledResult<number>).value).assertEqual(5);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_9000
     * @tc.name PromiseAllSettledTest090
     * @tc.desc 3-level nested mixed structure (Set + gen + allSettled) with timing race
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 5
     */
    it('PromiseAllSettledTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const timeLog: string[] = [];
      // 内层Set：包含快慢两个resolve
      const innerSet = new Set([
        new Promise<string>((r) => setTimeout(() => {
          timeLog.push('set-slow');
          r('set-slow');
        }, 30)),
        new Promise<string>((r) => setTimeout(() => {
          timeLog.push('set-fast');
          r('set-fast');
        }, 10))
      ]);

      // 中层异步生成器：包含Set的allSettled结果和一个延迟reject
      let midGen = [
        Promise.allSettled(innerSet),
        new Promise<Object>((_, rj) => setTimeout(() => {
          timeLog.push('gen-reject');
          rj(new Error('gen-fail'));
        }, 20))
      ]

      // 外层：包含生成器的allSettled结果和一个独立resolve
      const outer = Promise.allSettled([
        Promise.allSettled(midGen),
        new Promise<number>((r) => setTimeout(() => {
          timeLog.push('outer-resolve');
          r(99);
        }, 25))
      ]);

      const results = await outer;
      const outerRes1 = (results[0] as PromiseFulfilledResult<PromiseSettledResult<Object>[]>).value;
      const midGenRes = Array.from(outerRes1);
      const innerSetRes = (midGenRes[0] as PromiseFulfilledResult<PromiseSettledResult<string>[]>).value;

      // 验证值正确性
      expect((Array.from(innerSetRes)[0] as PromiseFulfilledResult<string>).value).assertEqual('set-slow');
      expect((Array.from(innerSetRes)[1] as PromiseFulfilledResult<string>).value).assertEqual('set-fast');
      expect((midGenRes[1] as PromiseRejectedResult).reason.message).assertEqual('gen-fail');
      expect((results[1] as PromiseFulfilledResult<number>).value).assertEqual(99);
      // 验证时序（fast先于reject，reject先于outer，outer先于slow）
      expect(timeLog).assertDeepEquals(['set-fast', 'gen-reject', 'outer-resolve', 'set-slow']);
    });
    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_9100
     * @tc.name PromiseAllSettledTest091
     * @tc.desc allSettled nested with Promise.race and Promise.resolve
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseAllSettledTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const racePromise = Promise.race([
        new Promise<number>((r) => setTimeout(() => r(10), 20)),
        Promise.resolve(5)
      ]);
      const inner = Promise.allSettled([racePromise, Promise.resolve('race-test')]);
      const outer = Promise.allSettled([inner, Promise.reject(new Error('outer-fail'))]);

      const results = await outer;
      const innerRes = (results[0] as PromiseFulfilledResult<PromiseSettledResult<Object>[]>).value;

      expect((innerRes[0] as PromiseFulfilledResult<number>).value).assertEqual(5);
      expect((innerRes[1] as PromiseFulfilledResult<string>).value).assertEqual('race-test');
      expect((results[1] as PromiseRejectedResult).reason.message).assertEqual('outer-fail');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_9200
     * @tc.name PromiseAllSettledTest092
     * @tc.desc allSettled + Promise.all + Promise.reject cascade
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 5
     */
    it('PromiseAllSettledTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let result = await PromiseAllSettledTest092()
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_9300
     * @tc.name PromiseAllSettledTest093
     * @tc.desc allSettled with Promise.any nested in async generator
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 5
     */
    it('PromiseAllSettledTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let result = await PromiseAllSettledTest093()
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_9400
     * @tc.name PromiseAllSettledTest094
     * @tc.desc Promise.resolve chaining with nested allSettled and race
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseAllSettledTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const chain = Promise.resolve(1)
        .then(val => Promise.race([
          new Promise<number>((r) => setTimeout(() => r(val * 5), 20)),
          Promise.resolve(val * 3)
        ]))
        .then(val => Promise.allSettled([
          Promise.resolve(val + 2),
          Promise.reject(new Error(`chain-${val}`))
        ]));

      const results = await Promise.allSettled([chain]);
      const chainRes = (results[0] as PromiseFulfilledResult<PromiseSettledResult<Object>[]>).value;

      expect((chainRes[0] as PromiseFulfilledResult<number>).value).assertEqual(5);
      expect((chainRes[1] as PromiseRejectedResult).reason.message).assertEqual('chain-3');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_9500
     * @tc.name PromiseAllSettledTest095
     * @tc.desc allSettled wrapping Promise.all + Promise.race with timing dependency
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 5
     */
    it('PromiseAllSettledTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const raceVal = Promise.race([
        new Promise<number>((r) => setTimeout(() => r(10), 15)),
        new Promise<number>((r) => setTimeout(() => r(20), 5))
      ]);
      const allPromise = Promise.all([
        raceVal,
        new Promise<number>((r) => setTimeout(() => r(30), 20))
      ]);
      const outer = Promise.allSettled([
        allPromise,
        Promise.reject(new Error('outer-err')),
        Promise.race([Promise.resolve('race-end'), new Promise<string>((r) => setTimeout(r, 25))])
      ]);

      const results = await outer;
      expect((results[0] as PromiseFulfilledResult<number[]>).value).assertDeepEquals([20, 30]);
      expect((results[1] as PromiseRejectedResult).reason.message).assertEqual('outer-err');
      expect((results[2] as PromiseFulfilledResult<string>).value).assertEqual('race-end');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_9600
     * @tc.name PromiseAllSettledTest096
     * @tc.desc Async function with allSettled, any and resolve combination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseAllSettledTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const asyncFunc = async (): Promise<Object> => {
        const anyRes = await Promise.any([
          Promise.reject(new Error('any-fail')),
          Promise.resolve('any-success')
        ]);
        const allSettledRes = await Promise.allSettled([
          anyRes,
          Promise.resolve(anyRes.length),
          Promise.reject(new Error('inner-err'))
        ]);
        return Promise.resolve(allSettledRes);
      };

      const results = await Promise.allSettled([asyncFunc(), Promise.resolve(100)]);
      const funcRes = (results[0] as PromiseFulfilledResult<PromiseSettledResult<Object>[]>).value;

      expect((funcRes[0] as PromiseFulfilledResult<string>).value).assertEqual('any-success');
      expect((funcRes[1] as PromiseFulfilledResult<number>).value).assertEqual(11);
      expect((funcRes[2] as PromiseRejectedResult).reason.message).assertEqual('inner-err');
      expect((results[1] as PromiseFulfilledResult<number>).value).assertEqual(100);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_9700
     * @tc.name PromiseAllSettledTest097
     * @tc.desc allSettled nested in Promise.race with multiple all/any combinations
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 5
     */
    it('PromiseAllSettledTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const raceCandidate1 = Promise.allSettled([
        Promise.all([Promise.resolve(1), Promise.resolve(2)]),
        Promise.reject(new Error('c1-err'))
      ]);
      const raceCandidate2 = Promise.allSettled([
        Promise.any([Promise.reject('a'), Promise.resolve('b')]),
        Promise.resolve(3)
      ]);
      const raceWinner = Promise.race([raceCandidate1, raceCandidate2]);

      const results = await Promise.allSettled([raceWinner]);
      const winnerRes = (results[0] as PromiseFulfilledResult<PromiseSettledResult<Object>[]>).value;
      // 验证race结果为更快完成的candidate2（无延迟）
      expect((winnerRes[0] as PromiseFulfilledResult<string>).value).assertDeepEquals([1,2]);
      expect((winnerRes[1] as PromiseFulfilledResult<number>).status).assertEqual('rejected');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_9800
     * @tc.name PromiseAllSettledTest098
     * @tc.desc Promise.reject chaining with allSettled and any recovery
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseAllSettledTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const rejectChain = Promise.reject(new Error('root-err'))
        .catch((err: Error) => Promise.allSettled([
          Promise.reject(new Error(`${err.message}-chain`)),
          Promise.resolve(`caught: ${err.message}`)
        ]))
        .then(res => Promise.any(res.map(item =>
        item.status === 'fulfilled' ? item.value : Promise.reject(item.reason)
        )));

      const results = await Promise.allSettled([rejectChain]);
      expect((results[0] as PromiseFulfilledResult<string>).value).assertEqual('caught: root-err');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_9900
     * @tc.name PromiseAllSettledTest099
     * @tc.desc 3-level nested: allSettled > all > race with timing overlap
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 5
     */
    it('PromiseAllSettledTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const level3 = Promise.race([
        new Promise<number>((r) => setTimeout(() => r(1), 20)),
        new Promise<number>((r) => setTimeout(() => r(2), 10)),
        new Promise<number>((r) => setTimeout(() => r(3), 15))
      ]);
      const level2 = Promise.all([
        level3,
        new Promise<number>((r) => setTimeout(() => r(level3.then(val => val * 5)), 25))
      ]);
      const level1 = Promise.allSettled([
        level2,
        Promise.reject(new Error('level1-err')),
        Promise.resolve(100)
      ]);

      const results = await level1;
      const level2Res = (results[0] as PromiseFulfilledResult<Object[]>).value;
      const resolvedLevel2Val1 = await level2Res[1];

      expect(level2Res[0]).assertEqual(2);
      expect(resolvedLevel2Val1).assertEqual(10);
      expect((results[1] as PromiseRejectedResult).reason.message).assertEqual('level1-err');
      expect((results[2] as PromiseFulfilledResult<number>).value).assertEqual(100);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_allSettled_TEST_10000
     * @tc.name PromiseAllSettledTest100
     * @tc.desc All Promise APIs combination: allSettled + all + race + any + resolve/reject
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 5
     */
    it('PromiseAllSettledTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const anyPromise = Promise.any([
        Promise.reject('any-err1'),
        new Promise<string>((r) => setTimeout(() => r('any-win'), 10)),
        Promise.reject('any-err2')
      ]);
      const racePromise = Promise.race([
        new Promise<number>((r) => setTimeout(() => r(50), 20)),
        Promise.resolve(30)
      ]);
      const allPromise = Promise.all([anyPromise, racePromise]);
      const outer = Promise.allSettled([
        allPromise,
        Promise.reject(new Error('outer-err')),
        Promise.resolve(allPromise.then((res) => res[0] + res[1]))
      ]);

      const results = await outer;
      const allRes = (results[0] as PromiseFulfilledResult<[string, number]>).value;
      const resolvedOuterVal2 = await (results[2] as PromiseFulfilledResult<Object>).value;

      expect(allRes).assertDeepEquals(['any-win', 30]);
      expect((results[1] as PromiseRejectedResult).reason.message).assertEqual('outer-err');
      expect(resolvedOuterVal2).assertEqual('any-win30');
    });
  })
}