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
interface circularObj1 {
  self?: circularObj1;
  data: number
}
class TestClass {
  public name: string;

  constructor(name: string) {
    this.name = name;
  }

  greet(): string {
    return `Hello ${this.name}`;
  }
}

export default function promiseResolveTest(){
  describe('promiseResolveTest', ():void => {
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
     * @tc.number SUB_BUILTINS_Promise_resolve_TEST_0001
     * @tc.name PromiseResolveTest001
     * @tc.desc Resolve primitive value, verify fulfilled value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseResolveTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const testValues = [42, 'test', true, null, undefined, 'foo'];
      for (const value of testValues) {
        const promise = Promise.resolve(value);
        const result = await promise;
        expect(result).assertEqual(value);
      }
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_resolve_TEST_0002
     * @tc.name PromiseResolveTest002
     * @tc.desc Resolve existing Promise instance, verify instance reuse
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseResolveTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const originalPromise = Promise.resolve('original');
      const resolvedPromise = Promise.resolve(originalPromise);

      expect(resolvedPromise).assertEqual(originalPromise);
      const result = await resolvedPromise;
      expect(result).assertEqual('original');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_resolve_TEST_0004
     * @tc.name PromiseResolveTest004
     * @tc.desc Resolve rejected Promise, verify rejected state propagation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseResolveTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const rejectedPromise = Promise.reject(new Error('reject reason'));
      const resolvedPromise = Promise.resolve(rejectedPromise);

      const result = await Promise.allSettled([resolvedPromise]);
      const rejectedResult = result[0] as PromiseRejectedResult;

      expect(rejectedResult.status).assertEqual('rejected');
      expect((rejectedResult.reason as Error).message).assertEqual('reject reason');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_resolve_TEST_0007
     * @tc.name PromiseResolveTest007
     * @tc.desc Resolve in then() chain, verify value propagation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseResolveTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result = await Promise.resolve(10)
        .then(val => Promise.resolve(val * 2))
        .then(val => Promise.resolve(`result: ${val}`));

      expect(result).assertEqual('result: 20');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_resolve_TEST_0009
     * @tc.name PromiseResolveTest009
     * @tc.desc Resolve pending Promise, verify final fulfillment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseResolveTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let resolvePending: (value: number) => void = ()=>{};
      const pendingPromise: Promise<number> = new Promise<number>(resolve => {
        resolvePending = resolve;
      });

      const resolvedPending = Promise.resolve(pendingPromise);
      setTimeout(() => resolvePending!(200), 10);

      const result = await resolvedPending;
      expect(result).assertEqual(200);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_resolve_TEST_0012
     * @tc.name PromiseResolveTest012
     * @tc.desc Resolve typed array, verify reference and content consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseResolveTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const typedArr = new Uint8Array([1, 2, 3, 4]);
      const promise = Promise.resolve(typedArr);
      const result = await promise;

      expect(result).assertEqual(typedArr);
      expect(result.length).assertEqual(4);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_resolve_TEST_0013
     * @tc.name PromiseResolveTest013
     * @tc.desc Promise.resolve with Promise.all, verify aggregated resolution
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseResolveTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const promises = [
        Promise.resolve(10),
        Promise.resolve('20'),
        Promise.resolve(true)
      ];
      const allPromise = Promise.all(promises.map(p => Promise.resolve(p)));
      const result = await allPromise;

      expect(result).assertDeepEquals([10, '20', true]);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_resolve_TEST_0015
     * @tc.name PromiseResolveTest015
     * @tc.desc Resolve function object, verify function identity preservation
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseResolveTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const testFunc = () => 'test';
      const promise = Promise.resolve(testFunc);
      const result = await promise;

      expect(result).assertEqual(testFunc);
      expect(result()).assertEqual('test');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_resolve_TEST_0016
     * @tc.name PromiseResolveTest016
     * @tc.desc Promise.resolve in Promise.race, verify fastest resolution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseResolveTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const raceCandidates = [
        new Promise<string>(resolve => {setTimeout(() => resolve('slow'), 20)}),
        Promise.resolve('fast'),
        new Promise<string>(resolve => {setTimeout(() => resolve('slower'), 30)})
      ];

      const result = await Promise.race(raceCandidates);
      expect(result).assertEqual('fast');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_resolve_TEST_0017
     * @tc.name PromiseResolveTest017
     * @tc.desc Resolve circular reference object, verify reference integrity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseResolveTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let circularObj = { data: 100 } as circularObj1;
      circularObj.self = circularObj;

      const promise = Promise.resolve(circularObj);
      const result = await promise;

      expect(result).assertEqual(circularObj);
      expect(result.self).assertEqual(result);
      expect(result.data).assertEqual(100);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_resolve_TEST_0019
     * @tc.name PromiseResolveTest019
     * @tc.desc Promise.resolve with finally, verify cleanup before resolution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseResolveTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let cleanupExecuted = false;
      const promise = Promise.resolve(30)
        .finally(() => {
          cleanupExecuted = true;
        });

      const result = await promise;
      expect(result).assertEqual(30);
      expect(cleanupExecuted).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_resolve_TEST_0020
     * @tc.name PromiseResolveTest020
     * @tc.desc Resolve nested Promise.resolve calls, verify flattening
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseResolveTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const nestedResolve = Promise.resolve(Promise.resolve(Promise.resolve('deep')));
      const result = await nestedResolve;

      expect(result).assertEqual('deep');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_resolve_TEST_0021
     * @tc.name PromiseResolveTest021
     * @tc.desc Resolve Map object, verify key-value preservation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseResolveTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const testMap = new Map<string, number>([['a', 1], ['b', 2]]);
      const promise = Promise.resolve(testMap);
      const result = await promise;

      expect(result).assertEqual(testMap);
      expect(result.has('a')).assertEqual(true);
      expect(result.get('b')).assertEqual(2);
      expect(result.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_resolve_TEST_0022
     * @tc.name PromiseResolveTest022
     * @tc.desc Promise.resolve with Promise.any, verify first fulfillment
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseResolveTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const anyCandidates = [
        new Promise<string>((resolve, reject) => {setTimeout(() => reject(new Error('err1')), 5)}),
        Promise.resolve('success'),
        new Promise<string>((resolve, reject) => {setTimeout(() => reject(new Error('err2')), 15)})
      ];

      const result = await Promise.any(anyCandidates);
      expect(result).assertEqual('success');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_resolve_TEST_0024
     * @tc.name PromiseResolveTest024
     * @tc.desc Resolve Date object, verify date value consistency
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseResolveTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const testDate = new Date('2024-01-01');
      const promise = Promise.resolve(testDate);
      const result = await promise;

      expect(result).assertEqual(testDate);
      expect(result.getFullYear()).assertEqual(2024);
      expect(result.getMonth()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_resolve_TEST_0027
     * @tc.name PromiseResolveTest027
     * @tc.desc Promise.resolve with conditional chaining, verify value flow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseResolveTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const processValue = (val: int) =>
      val > 5 ? Promise.resolve(val * 2) : Promise.resolve(val + 3);

      const result1 = await Promise.resolve(7).then(processValue);
      const result2 = await Promise.resolve(4).then(processValue);

      expect(result1).assertEqual(14);
      expect(result2).assertEqual(7);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_resolve_TEST_0029
     * @tc.name PromiseResolveTest029
     * @tc.desc Promise.resolve with Set, verify iteration order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseResolveTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const testSet = new Set<number>([1, 2, 3]);
      const promises = Array.from(testSet).map(num => Promise.resolve(num));
      const results = await Promise.all(promises);

      expect(JSON.stringify(results)).assertDeepEquals(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_resolve_TEST_0030
     * @tc.name PromiseResolveTest030
     * @tc.desc Resolve undefined vs no argument, verify consistency
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseResolveTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const promise1: Promise<void> = Promise.resolve();
      const promise2 = Promise.resolve(undefined);

      const result1 = await promise1;
      const result2 = await promise2;

      expect(result2).assertEqual(undefined);
      expect(promise1 instanceof Promise).assertEqual(true);
      expect(promise2 instanceof Promise).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_resolve_TEST_0032
     * @tc.name PromiseResolveTest032
     * @tc.desc Resolve RegExp object, verify pattern and flags preservation
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseResolveTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const testRegExp = new RegExp("test", "i");
      const promise = Promise.resolve(testRegExp);
      const result = await promise;

      expect(result).assertEqual(testRegExp);
      expect(result.test('Test')).assertEqual(true);
      expect(result.flags).assertEqual('i');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_resolve_TEST_0035
     * @tc.name PromiseResolveTest035
     * @tc.desc Resolve class instance, verify method and property preservation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseResolveTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const instance = new TestClass('Alice');
      const promise = Promise.resolve(instance);
      const result = await promise;

      expect(result).assertEqual(instance);
      expect(result.name).assertEqual('Alice');
      expect(result.greet()).assertEqual('Hello Alice');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_resolve_TEST_0036
     * @tc.name PromiseResolveTest036
     * @tc.desc Promise.resolve in nested then chain, verify value transformation
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseResolveTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result = await Promise.resolve(5)
        .then(val => Promise.resolve(val + 3))
        .then(val => Promise.resolve(val * 2))
        .then(val => Promise.resolve(`Final: ${val}`));

      expect(result).assertEqual('Final: 16');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_resolve_TEST_0038
     * @tc.name PromiseResolveTest038
     * @tc.desc Resolve ArrayBuffer, verify buffer content consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseResolveTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const buffer = new ArrayBuffer(4);
      const view = new Uint32Array(buffer);
      view[0] = 0x12345678;

      const promise = Promise.resolve(buffer);
      const result = await promise;
      const resultView = new Uint32Array(result);

      expect(result).assertEqual(buffer);
      expect(resultView[0]).assertEqual(0x12345678);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_resolve_TEST_0042
     * @tc.name PromiseResolveTest042
     * @tc.desc Promise.resolve with Promise.race and delayed resolve, verify priority
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseResolveTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const raceCandidates = [
        new Promise<string>(resolve => {setTimeout(() => resolve('delay 20'), 20)}),
        Promise.resolve('immediate'),
        new Promise<string>(resolve => {setTimeout(() => resolve('delay 10'), 10)})
      ];

      const result = await Promise.race(raceCandidates);
      expect(result).assertEqual('immediate');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_resolve_TEST_0044
     * @tc.name PromiseResolveTest044
     * @tc.desc Resolve Error object, verify error properties
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseResolveTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const testError = new Error('test error');
      testError.name = 'TestError';
      const promise = Promise.resolve(testError);
      const result = await promise;

      expect(result).assertEqual(testError);
      expect(result.message).assertEqual('test error');
      expect(result.name).assertEqual('TestError');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_resolve_TEST_0045
     * @tc.name PromiseResolveTest045
     * @tc.desc Promise.resolve in async function with try/catch, verify safety
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseResolveTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const safeResolve = async () => {
        try {
          return await Promise.resolve('safe value');
        } catch (err) {
          return 'caught';
        }
      };

      const result = await safeResolve();
      expect(result).assertEqual('safe value');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_resolve_TEST_0046
     * @tc.name PromiseResolveTest046
     * @tc.desc Resolve typed array view, verify view and buffer link
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseResolveTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const buffer = new ArrayBuffer(8);
      const floatView = new Float64Array(buffer);
      floatView[0] = 3.14159;

      const promise = Promise.resolve(floatView);
      const result = await promise;

      expect(result).assertEqual(floatView);
      expect(result[0]).assertEqual(3.14159);
      expect(result.buffer).assertEqual(buffer);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_resolve_TEST_0047
     * @tc.name PromiseResolveTest047
     * @tc.desc Promise.resolve with parallel then chains, verify independent resolution
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseResolveTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const basePromise = Promise.resolve(10);
      const chain1 = basePromise.then(val => val * 2);
      const chain2 = basePromise.then(val => val + 5);
      const chain3 = basePromise.then(val => `val: ${val}`);

      const res = await Promise.all([chain1, chain2, chain3]);

      expect(res[0]).assertEqual(20);
      expect(res[1]).assertEqual(15);
      expect(res[2]).assertEqual('val: 10');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_resolve_TEST_0049
     * @tc.name PromiseResolveTest049
     * @tc.desc Promise.resolve with finally and catch, verify cleanup order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseResolveTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const order: string[] = [];
      const promise = Promise.resolve<number>(50)
        .then((val) => {
          order.push('then');
          return val;
        })
        .finally(() => {
          order.push('finally');
        })
        .catch((err: Error) => {
          order.push('catch');
          return err;
        });

      await promise;
      expect(order).assertDeepEquals(['then', 'finally']);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_resolve_TEST_0052
     * @tc.name PromiseResolveTest052
     * @tc.desc Multi-level cascade: Promise.resolve in then chain with timing dependency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseResolveTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await Promise.resolve(2)
        .then(val => new Promise<int>(resolve => {setTimeout(() => resolve(Promise.resolve(val * 3)), 10)}))
        .then(val => new Promise<int>(resolve => {setTimeout(() => resolve(Promise.resolve(val + 5)), 15)}))
        .then(val => Promise.resolve(`Final: ${val}`));

      expect(result).assertEqual('Final: 11');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_resolve_TEST_0053
     * @tc.name PromiseResolveTest053
     * @tc.desc Nested Promise.all with Promise.resolve, verify aggregated timing
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseResolveTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const start = Date.now();
      const innerAll = Promise.all([
        Promise.resolve(new Promise<number>(resolve => {setTimeout(() => resolve(10), 10)})),
        Promise.resolve(new Promise<number>(resolve => {setTimeout(() => resolve(20), 5)}))
      ]);
      const outerAll = Promise.all([
        innerAll,
        Promise.resolve(new Promise<number>(resolve => {setTimeout(() => resolve(30), 15)}))
      ]);

      const result = await outerAll;
      const end = Date.now();

      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([[10, 20], 30]));
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_resolve_TEST_0056
     * @tc.name PromiseResolveTest056
     * @tc.desc Nested Promise.race with Promise.resolve, verify timing priority
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseResolveTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const start = Date.now();
      const innerRace = Promise.race([
        Promise.resolve(new Promise<string>(resolve => {setTimeout(() => resolve('inner-slow'), 20)})),
        Promise.resolve('inner-fast')
      ]);
      const outerRace = Promise.race([
        Promise.resolve(new Promise<string>(resolve => {setTimeout(() => resolve(innerRace), 10)})),
        Promise.resolve('outer-fast')
      ]);

      const result = await outerRace;
      const end = Date.now();

      expect(result).assertEqual('outer-fast');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_resolve_TEST_0058
     * @tc.name PromiseResolveTest058
     * @tc.desc Async cascade: Promise.resolve → catch → resolve, verify recovery timing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseResolveTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const start = Date.now();
      const result = await Promise.resolve(Promise.reject(new Error('temp err')))
        .catch((err: Error) => new Promise<string>(resolve => {setTimeout(() => {
          resolve(Promise.resolve(`recovered: ${err.message}`));
        }, 15)}))
        .then(val => Promise.resolve(`${val} | processed`));

      const end = Date.now();
      expect(result).assertEqual('recovered: temp err | processed');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_resolve_TEST_0059
     * @tc.name PromiseResolveTest059
     * @tc.desc 5-level nested Promise.resolve with mixed delays, verify flattening depth
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 5
     */
    it('PromiseResolveTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const start = Date.now();
      const level5 = Promise.resolve(new Promise<number>(resolve => {setTimeout(() => resolve(1), 2)}));
      const level4 = Promise.resolve(new Promise<number>(resolve => {setTimeout(() => resolve(level5), 3)}));
      const level3 = Promise.resolve(new Promise<number>(resolve => {setTimeout(() => resolve(level4), 4)}));
      const level2 = Promise.resolve(new Promise<number>(resolve => {setTimeout(() => resolve(level3), 5)}));
      const level1 = Promise.resolve(new Promise<number>(resolve => {setTimeout(() => resolve(level2), 6)}));

      const result = await level1;
      const end = Date.now();

      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_resolve_TEST_0060
     * @tc.name PromiseResolveTest060
     * @tc.desc Nested Promise.any with Promise.resolve, verify first fulfillment timing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseResolveTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const start = Date.now();
      const innerAny = Promise.any([
        Promise.resolve(new Promise<string>(resolve => {setTimeout(() => resolve('inner-20ms'), 20)})),
        Promise.resolve(new Promise<string>(resolve => {setTimeout(() => resolve('inner-10ms'), 10)}))
      ]);
      const outerAny = Promise.any([
        Promise.resolve(new Promise<string>(resolve => {setTimeout(() => resolve(innerAny), 15)})),
        Promise.resolve('outer-5ms')
      ]);

      const result = await outerAny;
      const end = Date.now();

      expect(result).assertEqual('outer-5ms');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_resolve_TEST_0061
     * @tc.name PromiseResolveTest061
     * @tc.desc Multi-level then chain with Promise.resolve and shared state, verify order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseResolveTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const state: int[] = [];
      await Promise.resolve(1)
        .then(val => {
          state.push(val);
          return Promise.resolve(val * 2);
        })
        .then(val => new Promise<int>(resolve => {setTimeout(() => {
          state.push(val);
          resolve(Promise.resolve(val + 3));
        }, 5)}))
        .then(val => {
          state.push(val);
          return val;
        });

      expect(state).assertDeepEquals([1, 2, 5]);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_resolve_TEST_0063
     * @tc.name PromiseResolveTest063
     * @tc.desc 3-level async function with Promise.resolve, verify value propagation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseResolveTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const level3 = async (): Promise<number> => {
        return Promise.resolve(new Promise<number>(resolve => {setTimeout(() => resolve(2), 5)}));
      };
      const level2 = async (): Promise<number> => {
        const val = await level3();
        return Promise.resolve(new Promise<number>(resolve => {setTimeout(() => resolve(val * 4), 10)}));
      };
      const level1 = async (): Promise<string> => {
        const val = await level2();
        return Promise.resolve(`Result: ${val}`);
      };

      const result = await level1();
      expect(result).assertEqual('Result: 8');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_resolve_TEST_0065
     * @tc.name PromiseResolveTest065
     * @tc.desc Nested Promise.race & Promise.all with Promise.resolve, verify hybrid timing
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 5
     */
    it('PromiseResolveTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const start = Date.now();
      const race1 = Promise.race([
        Promise.resolve(new Promise<int>(resolve => {setTimeout(() => resolve(10), 5)})),
        Promise.resolve(new Promise<int>(resolve => {setTimeout(() => resolve(20), 10)}))
      ]);
      const race2 = Promise.race([
        Promise.resolve(new Promise<int>(resolve => {setTimeout(() => resolve(30), 15)})),
        Promise.resolve(new Promise<int>(resolve => {setTimeout(() => resolve(40), 5)}))
      ]);
      const all = Promise.all([race1, race2]);

      const result = await all;
      const end = Date.now();

      expect(result).assertDeepEquals([10, 40]);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_resolve_TEST_0068
     * @tc.name PromiseResolveTest068
     * @tc.desc Promise.resolve with finally in nested chain, verify cleanup order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseResolveTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const order: string[] = [];
      await Promise.resolve(10)
        .then(val => {
          order.push('then1');
          return Promise.resolve(val * 2);
        })
        .finally(() => {
          order.push('finally1');
        })
        .then(val => {
          order.push('then2');
          return Promise.resolve(val + 3);
        })
        .finally(() => {
          order.push('finally2');
        });

      expect(order).assertDeepEquals(['then1', 'finally1', 'then2', 'finally2']);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_resolve_TEST_0070
     * @tc.name PromiseResolveTest070
     * @tc.desc 5-level cascade: Promise.resolve with incremental value transformation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseResolveTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await Promise.resolve(2.0)
        .then(val => Promise.resolve(val + 3))
        .then(val => Promise.resolve(val * 4))
        .then(val => Promise.resolve(val - 5))
        .then(val => Promise.resolve(val / 2))
        .then(val => Promise.resolve(`Final: ${val}`));

      expect(result).assertEqual('Final: 7.5');
    });
    /**
     * @tc.number SUB_BUILTINS_Promise_resolve_TEST_0071
     * @tc.name PromiseResolveTest071
     * @tc.desc 4-level cascade with incremental delays, verify cumulative timing
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 5
     */
    it('PromiseResolveTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await Promise.resolve(1)
        .then(val => new Promise<int>(resolve => {setTimeout(() => resolve(Promise.resolve(val * 2)), 10)}))
        .then(val => new Promise<int>(resolve => {setTimeout(() => resolve(Promise.resolve(val + 3)), 15)}))
        .then(val => new Promise<int>(resolve => {setTimeout(() => resolve(Promise.resolve(val * 4)), 20)}))
        .then(val => Promise.resolve(val));
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_resolve_TEST_0073
     * @tc.name PromiseResolveTest073
     * @tc.desc 3-level Promise.all with delayed resolves, verify parallel timing
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseResolveTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const start = Date.now();
      const innerAll = Promise.all([
        Promise.resolve(new Promise<number>(resolve => {setTimeout(() => resolve(10), 15)})),
        Promise.resolve(new Promise<number>(resolve => {setTimeout(() => resolve(20), 10)}))
      ]);
      const outerAll = Promise.all([
        innerAll,
        Promise.resolve(new Promise<number>(resolve => {setTimeout(() => resolve(30), 20)}))
      ]);

      const result = await outerAll;
      const end = Date.now();
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([[10, 20], 30]));
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_resolve_TEST_0074
     * @tc.name PromiseResolveTest074
     * @tc.desc Cascade resolve with conditional delays, verify branch timing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseResolveTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const process = (val: int) =>
      val > 5
        ? new Promise<int>(resolve => {setTimeout(() => resolve(Promise.resolve(val * 2)), 20)})
        : new Promise<int>(resolve => {setTimeout(() => resolve(Promise.resolve(val + 3)), 10)});

      const result1 = await Promise.resolve(7).then(process);
      const result2 = await Promise.resolve(4).then(process);

      expect(result1).assertEqual(14);
      expect(result2).assertEqual(7);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_resolve_TEST_0078
     * @tc.name PromiseResolveTest078
     * @tc.desc Cascade resolve with finally cleanup, verify timing order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseResolveTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const timeLog: string[] = [];
      await Promise.resolve(10)
        .then(val => new Promise<number>(resolve => {setTimeout(() => {
          timeLog.push(`then1: ${val}`);
          resolve(val * 2);
        }, 10)}))
        .finally(() => timeLog.push('finally1'))
        .then(val => new Promise<number>(resolve => {setTimeout(() => {
          timeLog.push(`then2: ${val}`);
          resolve(val + 3);
        }, 15)}))
        .finally(() => timeLog.push('finally2'));

      expect(timeLog).assertDeepEquals(['then1: 10', 'finally1', 'then2: 20', 'finally2']);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_resolve_TEST_0080
     * @tc.name PromiseResolveTest080
     * @tc.desc 5-level cascade with alternating delays, verify timing pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseResolveTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const timeLog: string[] = [];
      await Promise.resolve(1)
        .then(val => new Promise<int>(resolve => {setTimeout(() => {
          timeLog.push(`L1: ${val}`);
          resolve(Promise.resolve(val + 1));
        }, 5)}))
        .then(val => new Promise<int>(resolve => {setTimeout(() => {
          timeLog.push(`L2: ${val}`);
          resolve(Promise.resolve(val + 1));
        }, 10)}))
        .then(val => new Promise<int>(resolve => {setTimeout(() => {
          timeLog.push(`L3: ${val}`);
          resolve(Promise.resolve(val + 1));
        }, 5)}))
        .then(val => new Promise<int>(resolve => {setTimeout(() => {
          timeLog.push(`L4: ${val}`);
          resolve(Promise.resolve(val + 1));
        }, 10)}))
        .then(val => {
          timeLog.push(`L5: ${val}`);
          return val;
        });

      expect(timeLog).assertDeepEquals(['L1: 1', 'L2: 2', 'L3: 3', 'L4: 4', 'L5: 5']);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_resolve_TEST_0082
     * @tc.name PromiseResolveTest082
     * @tc.desc 4-level async function cascade with delays, verify value & timing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseResolveTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const start = Date.now();
      const level4 = async (): Promise<number> => {
        return new Promise<number>(resolve => {setTimeout(() => resolve(2), 5)});
      };
      const level3 = async (): Promise<number> => {
        const val = await level4();
        return new Promise<number>(resolve => {setTimeout(() => resolve(Promise.resolve(val * 3)), 10)});
      };
      const level2 = async (): Promise<number> => {
        const val = await level3();
        return new Promise<number>(resolve => {setTimeout(() => resolve(Promise.resolve(val + 4)), 15)});
      };
      const level1 = async (): Promise<number> => {
        const val = await level2();
        return Promise.resolve(val);
      };

      const result = await level1();
      const end = Date.now();
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_resolve_TEST_0083
     * @tc.name PromiseResolveTest083
     * @tc.desc Cascade resolve with overlapping delays, verify execution order
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseResolveTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const timeLog: string[] = [];
      const p1 = Promise.resolve(new Promise<number>(resolve => {setTimeout(() => {
        timeLog.push('p1: 10ms');
        resolve(10);
      }, 10)}));
      const p2 = p1.then(val => new Promise<number>(resolve => {setTimeout(() => {
        timeLog.push(`p2: ${val} (15ms)`);
        resolve(val * 2);
      }, 15)}));
      const p3 = Promise.resolve(new Promise<number>(resolve => {setTimeout(() => {
        timeLog.push('p3: 5ms');
        resolve(30);
      }, 5)}));

      const res = await Promise.all([p1, p2, p3]);
      expect(res[0]).assertEqual(10);
      expect(res[1]).assertEqual(20);
      expect(res[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_resolve_TEST_0086
     * @tc.name PromiseResolveTest086
     * @tc.desc 5-level cascade with minimal delays, verify timing precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseResolveTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await Promise.resolve(1)
        .then(val => new Promise<int>(resolve => {setTimeout(() => resolve(val + 1), 1)}))
        .then(val => new Promise<int>(resolve => {setTimeout(() => resolve(Promise.resolve(val + 1)), 1)}))
        .then(val => new Promise<int>(resolve => {setTimeout(() => resolve(Promise.resolve(val + 1)), 1)}))
        .then(val => new Promise<int>(resolve => {setTimeout(() => resolve(Promise.resolve(val + 1)), 1)}))
        .then(val => Promise.resolve(val));
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_resolve_TEST_0087
     * @tc.name PromiseResolveTest087
     * @tc.desc Cascade resolve with shared timer state, verify timing dependency
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseResolveTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let timer = 0;
      const increment = () => timer++;
      await Promise.resolve()
        .then(() => new Promise<int>(resolve => {setTimeout(() => {
          increment();
          resolve(Promise.resolve(1));
        }, 5)}))
        .then(() => new Promise<int>(resolve => {setTimeout(() => {
          increment();
          resolve(Promise.resolve(1));
        }, 10)}))
        .then(() => new Promise<int>(resolve => {setTimeout(() => {
          increment();
          resolve(Promise.resolve(1));
        }, 5)}));

      expect(timer).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_resolve_TEST_0089
     * @tc.name PromiseResolveTest089
     * @tc.desc Cascade resolve with delayed catch recovery, verify timing order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseResolveTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const timeLog: string[] = [];
      await Promise.resolve(Promise.reject(new Error('temp')))
        .catch((err: Error) => new Promise<string>(resolve => {setTimeout(() => {
          timeLog.push(`catch: ${err.message} (10ms)`);
          resolve(Promise.resolve('recovered'));
        }, 10)}))
        .then(val => new Promise<string>(resolve => {setTimeout(() => {
          timeLog.push(`then: ${val} (15ms)`);
          resolve(val);
        }, 15)}));

      expect(timeLog).assertDeepEquals(['catch: temp (10ms)', 'then: recovered (15ms)']);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_resolve_TEST_0091
     * @tc.name PromiseResolveTest091
     * @tc.desc Async cascade with dynamic delay adjustment, verify adaptive timing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseResolveTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let delay = 10;
      const adjustDelay = () => delay = delay > 15 ? 5 : delay + 5;
      const result = await Promise.resolve(1)
        .then(val => new Promise<int>(resolve => {setTimeout(() => {
          adjustDelay();
          resolve(Promise.resolve(val * 2));
        }, delay)}))
        .then(val => new Promise<int>(resolve => {setTimeout(() => {
          adjustDelay();
          resolve(Promise.resolve(val + 3));
        }, delay)}))
        .then(val => Promise.resolve(val));
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_resolve_TEST_0094
     * @tc.name PromiseResolveTest094
     * @tc.desc Async Promise.all with mixed resolve/reject delays, verify failure timing
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseResolveTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const timeLog: string[] = [];
      const start = Date.now();
      try {
        await Promise.all([
          Promise.resolve(new Promise<number>(resolve => {setTimeout(() => {
            timeLog.push('resolve: 15ms');
            resolve(10);
          }, 15)})),
          Promise.resolve(Promise.reject(new Error('reject: 5ms')))
            .catch((err: Error) => {
              timeLog.push(err.message);
              throw err;
            })
        ]);
      } catch (err) {
      }

      const end = Date.now();
      expect(timeLog).assertDeepEquals(['reject: 5ms']);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_resolve_TEST_0095
     * @tc.name PromiseResolveTest095
     * @tc.desc Async cascade with nested finally, verify cleanup timing order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseResolveTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const orderLog: string[] = [];
      await Promise.resolve(5)
        .then(val => new Promise<int>(resolve => {setTimeout(() => {
          orderLog.push(`then1: ${val}`);
          resolve(Promise.resolve(val * 2));
        }, 10)}))
        .finally(() => orderLog.push('finally1'))
        .then(val => new Promise<int>(resolve => {setTimeout(() => {
          orderLog.push(`then2: ${val}`);
          resolve(Promise.resolve(val + 3));
        }, 5)}))
        .finally(() => orderLog.push('finally2'));

      expect(orderLog).assertDeepEquals(['then1: 5', 'finally1', 'then2: 10', 'finally2']);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_resolve_TEST_0097
     * @tc.name PromiseResolveTest097
     * @tc.desc Async Promise.race with delayed resolve chain, verify priority timing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseResolveTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const raceCandidates = [
        Promise.resolve(new Promise<string>(resolve => {setTimeout(() => {
          resolve(Promise.resolve(new Promise<string>(resolve => {setTimeout(() => resolve('slow'), 20)})));
        }, 10)})),
        Promise.resolve(new Promise<string>(resolve => {setTimeout(() => resolve('fast'), 15)}))
      ];

      const result = await Promise.race(raceCandidates);
      expect(result).assertEqual('fast');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_resolve_TEST_0098
     * @tc.name PromiseResolveTest098
     * @tc.desc Async Set with dependent resolutions, verify sequential timing
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseResolveTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const timeLog: string[] = [];
      let prevValue = 1;
      const createDependentPromise = () => {
        const current = prevValue;
        return Promise.resolve(new Promise<number>(resolve => {setTimeout(() => {
          const next = current * 2;
          timeLog.push(`val: ${current} → ${next}`);
          prevValue = next;
          resolve(next);
        }, 10)}));
      };

      const dependentSet = new Set<Promise<number>>([createDependentPromise(), createDependentPromise(), createDependentPromise()]);
      await Promise.all(dependentSet);

      expect(timeLog).assertDeepEquals(["val: 1 → 2", "val: 1 → 2", "val: 1 → 2"]);
    });
  })
}
