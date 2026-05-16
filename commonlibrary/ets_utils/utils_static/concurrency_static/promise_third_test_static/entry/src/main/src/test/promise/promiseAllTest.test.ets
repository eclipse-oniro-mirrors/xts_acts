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
class CustomError extends Error {
  constructor(message: string) {
    super(message);
    this.name = 'CustomError';
  }
}

class CriticalError extends Error {
  constructor(str:string) {
    super(str)
  }
}

class RetryableError extends Error {
  constructor(str:string) {
    super(str)
  }
}

class Level1Error extends Error {
  constructor(str:string) {
    super(str)
  }
}

class Level2Error extends Error {
  constructor(str:string) {
    super(str)
  }
}

function createRecursivePromise (depth: int): Promise<int> {
  if (depth === 0) {
    return Promise.resolve(1);
  }
  return Promise.all([createRecursivePromise(depth - 1)])
    .then((val: int[]) => val[0] * 2)
    .catch((err: Error) => depth);
}

function createResolvedChain(value: number, depth: number): Promise<number> {
  if (depth === 0) {
    return Promise.resolve(value);
  }
  return Promise.resolve(createResolvedChain(value * 2, depth - 1));
};

function createRecursivePromise88(n: int): Promise<int> {
  if (n <= 0) {
    return Promise.resolve(1);
  }
  return Promise.all([
    createRecursivePromise88(n - 1),
    createRecursivePromise88(n - 1)
  ]).then((res: int[]) => res[0] + res[1]);
};

export default function promiseAllTest(){
  describe('promiseAllTest', ():void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll((): void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (): Promise<void> => {
      await sleep(100);
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
     * @tc.number SUB_BUILTINS_Promise_all_TEST_0100
     * @tc.name PromiseAllTest001
     * @tc.desc test Promise.all with all resolved promises
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAllTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<int> = Promise.resolve(1);
      const p2: Promise<string> = Promise.resolve('two');
      const p3: Promise<boolean> = Promise.resolve(true);

      const result = await Promise.all([p1, p2, p3]);
      expect(result).assertDeepEquals([1, 'two', true]);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_0200
     * @tc.name PromiseAllTest002
     * @tc.desc test Promise.all with one rejected promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAllTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<int> = Promise.resolve(1);
      const p2: Promise<string> = Promise.reject(new Error('rejection'));
      const p3: Promise<boolean> = Promise.resolve(true);

      try {
        await Promise.all([p1, p2, p3]);
        expect().assertFail();
      } catch (err) {
        expect((err as Error).message).assertEqual('rejection');
      }
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_0300
     * @tc.name PromiseAllTest003
     * @tc.desc test Promise.all with non-promise values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAllTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<int> = Promise.resolve(1);
      const p2: number = 2;
      const p3: string = 'three';

      const result = await Promise.all([p1, p2, p3]);
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, 2, 'three']));
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_0500
     * @tc.name PromiseAllTest005
     * @tc.desc test Promise.all preserves order of results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAllTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<number> = new Promise<number>((resolve) =>
      {setTimeout(() => resolve(1), 30)}
      );
      const p2: Promise<number> = new Promise<number>((resolve) =>
      {setTimeout(() => resolve(2), 10)}
      );
      const p3: Promise<number> = new Promise<number>((resolve) =>
      {setTimeout(() => resolve(3), 20)}
      );

      const result = await Promise.all([p1, p2, p3]);
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_0600
     * @tc.name PromiseAllTest006
     * @tc.desc test Promise.all with mixed resolved and pending promises
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAllTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<string> = Promise.resolve('ready');
      const p2: Promise<number> = new Promise<number>((resolve) =>
      {setTimeout(() => resolve(42), 20)}
      );

      const result = await Promise.all([p1, p2]);
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify(['ready', 42]));
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_0700
     * @tc.name PromiseAllTest007
     * @tc.desc test Promise.all rejects immediately on first rejection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAllTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const startTime = Date.now();
      const p1: Promise<void> = new Promise<void>((resolve, reject) =>
      {setTimeout(() => reject(new Error('first')), 10)}
      );
      const p2: Promise<void> = new Promise<void>((resolve, reject) =>
      {setTimeout(() => reject(new Error('second')), 50)}
      );

      try {
        await Promise.all([p1, p2]);
        expect().assertFail();
      } catch (err) {
        expect((err as Error).message).assertEqual('first');
      }
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_0900
     * @tc.name PromiseAllTest009
     * @tc.desc test Promise.all with large number of promises
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAllTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const promises: Promise<int>[] = Array.create<number>(10, 0)
        .map((_, i: int) => Promise.resolve(i));

      const result = await Promise.all(promises);
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]));
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_1000
     * @tc.name PromiseAllTest010
     * @tc.desc test Promise.all with rejected promise and catch handler
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAllTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<int> = Promise.resolve(1);
      const p2: Promise<string> = Promise.reject(new Error('fail'));

      const result = await Promise.all([p1, p2.catch((err: Error) => (err as Error).message)]);
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, 'fail']));
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_1200
     * @tc.name PromiseAllTest012
     * @tc.desc test Promise.all with rejected promise in middle of array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAllTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<int> = Promise.resolve(10);
      const p2: Promise<string> = Promise.reject(new Error('middle error'));
      const p3: Promise<boolean> = new Promise<boolean>((resolve) => {
        setTimeout(() => resolve(true), 100);
      });

      try {
        await Promise.all([p1, p2, p3]);
        expect().assertFail();
      } catch (err) {
        expect((err as Error).message).assertEqual('middle error');
      }
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_1300
     * @tc.name PromiseAllTest013
     * @tc.desc test Promise.all with promises that resolve to arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAllTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<number[]> = new Promise<number[]>((resolve) => {
        resolve([1, 2, 3]);
      });
      const p2: Promise<string[]> = new Promise<string[]>((resolve) => {
        resolve(['a', 'b']);
      });

      const result = await Promise.all([p1, p2]);
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([[1, 2, 3], ['a', 'b']]));
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_1400
     * @tc.name PromiseAllTest014
     * @tc.desc test Promise.all with non-array iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAllTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const promiseSet: Set<Promise<int>> = new Set<Promise<int>>([
        Promise.resolve(1),
        new Promise<int>((resolve) => resolve(2))
      ]);

      const result = await Promise.all(promiseSet);
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, 2]));
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_1500
     * @tc.name PromiseAllTest015
     * @tc.desc test Promise.all with long delay promises
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAllTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const startTime = Date.now();
      const p1: Promise<string> = new Promise<string>((resolve) => {
        setTimeout(() => resolve('slow'), 100);
      });
      const p2: Promise<int> = new Promise<int>((resolve) => {
        setTimeout(() => resolve(100), 150);
      });

      const result = await Promise.all([p1, p2]);

      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify(['slow', 100]));
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_1700
     * @tc.name PromiseAllTest017
     * @tc.desc test Promise.all with promises that resolve to null and undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAllTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<null> = new Promise<null>((resolve) => {
        resolve(null);
      });
      const p2: Promise<undefined> = new Promise<undefined>((resolve) => {
        resolve(undefined);
      });
      const p3: Promise<boolean> = Promise.resolve(false);

      const result = await Promise.all([p1, p2, p3]);
      expect(result).assertDeepEquals([null, undefined, false]);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_1900
     * @tc.name PromiseAllTest019
     * @tc.desc test Promise.all with mixed promise types and primitives
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAllTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<int> = new Promise<int>((resolve) => {
        setTimeout(() => resolve(42), 30);
      });
      const p2: boolean = true;
      const p3: Promise<string> = Promise.resolve('hello');
      const p4: null = null;

      const result = await Promise.all([p1, p2, p3, p4]);
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([42, true, 'hello', null]));
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_2100
     * @tc.name PromiseAllTest021
     * @tc.desc test Promise.all with catch handling specific error type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAllTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<int> = Promise.reject(new CustomError('custom failure'))
        .catch((err: Error) => err.message.length);
      const p2: Promise<int> = Promise.resolve(10);

      const result = await Promise.all([p1, p2]);
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([14, 10]));
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_2200
     * @tc.name PromiseAllTest022
     * @tc.desc test Promise.all with multiple catch handlers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAllTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<string> = Promise.reject(new Error('error1'))
        .catch((err: Error) => `caught: ${err.message}`);
      const p2: Promise<string> = Promise.reject(new Error('error2'))
        .catch((err: Error) => `handled: ${err.message}`);

      const result = await Promise.all([p1, p2]);
      expect(result).assertDeepEquals(['caught: error1', 'handled: error2']);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_2300
     * @tc.name PromiseAllTest023
     * @tc.desc test Promise.all with catch returning different type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAllTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<int> = Promise.reject(new Error('count error'))
        .catch((err: Error) => err.message.length);
      const p2: Promise<string> = Promise.resolve('success');

      const result = await Promise.all([p1, p2]);
      expect(result).assertDeepEquals([11, 'success']); // 'count error' has 11 characters
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_2400
     * @tc.name PromiseAllTest024
     * @tc.desc test Promise.all with nested catches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAllTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1 = new Promise<number>((resolve, reject) => {
        reject(new Error('level 1'));
      })
        .catch((err: Error) => {
          return new Promise<number>((resolve, reject) => {
            reject(new Error(`${err.message} -> level 2`));
          }).catch((innerErr: Error) => innerErr.message.length);
        });

      const result = await Promise.all([p1]);
      expect(result).assertDeepEquals([18]);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_2500
     * @tc.name PromiseAllTest025
     * @tc.desc test Promise.all with catch rethrowing different error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAllTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<void> = Promise.reject(new Error('original'))
        .catch((err: Error) => {
          throw new Error(`wrapped: ${err.message}`);
        });

      try {
        await Promise.all([p1]);
        expect().assertFail();
      } catch (err) {
        expect((err as Error).message).assertEqual('wrapped: original');
      }
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_2600
     * @tc.name PromiseAllTest026
     * @tc.desc test Promise.all with some promises catching and some rejecting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAllTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<string> = Promise.reject(new Error('fail1'))
        .catch((err: Error) => `fixed: ${err.message}`);
      const p2: Promise<number> = Promise.reject(new Error('fail2'));

      try {
        await Promise.all([p1, p2]);
        expect().assertFail();
      } catch (err) {
        expect((err as Error).message).assertEqual('fail2');
      }
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_2700
     * @tc.name PromiseAllTest027
     * @tc.desc test Promise.all with catch returning promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAllTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<number> = Promise.reject(new Error('delayed'))
        .catch((err: Error) => {
          return new Promise<number>((resolve) => {
            setTimeout(() => resolve(err.message.length * 2), 50);
          });
        });
      const p2: Promise<int> = Promise.resolve(5);

      const result = await Promise.all([p1, p2]);
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([14, 5]));
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_2900
     * @tc.name PromiseAllTest029
     * @tc.desc test Promise.all with catch and finally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAllTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const log: string[] = [];

      const p1: Promise<string> = Promise.reject(new Error('oops'))
        .catch((err: Error) => {
          log.push(`caught: ${err.message}`);
          return 'recovered';
        })
        .finally(() => {
          log.push('p1 finally');
        });

      const result = await Promise.all([p1]);
      expect(result).assertDeepEquals(['recovered']);
      expect(log).assertDeepEquals(['caught: oops', 'p1 finally']);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_3000
     * @tc.name PromiseAllTest030
     * @tc.desc test Promise.all with catch in outer and inner promises
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAllTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const innerPromise: Promise<int> = Promise.reject(new Error('inner'))
        .catch((err: Error) => err.message.length);

      const outerPromise = Promise.all([innerPromise, Promise.resolve(5)])
        .catch((err: Error) => [err.message.length]);

      const result = await outerPromise;
      expect(result).assertDeepEquals([5, 5]);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_3200
     * @tc.name PromiseAllTest032
     * @tc.desc test Promise.all with catch and async operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAllTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<int> = Promise.reject(new Error('need delay'))
        .catch(async (err: Error) => {
          await new Promise<void>(resolve => {setTimeout(()=>{resolve(undefined)}, 30)});
          return err.message.length;
        });
      const p2: Promise<int> = new Promise<int>(resolve =>{
      setTimeout(() => resolve(20), 20)}
      );

      const result = await Promise.all([p1, p2]);
      expect(result).assertDeepEquals([10, 20]); // 'need delay' has 10 characters
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_3500
     * @tc.name PromiseAllTest035
     * @tc.desc test Promise.all with unhandled error in nested promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAllTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<number> = new Promise<number>((resolve) => {
        resolve(10);
      });

      const p2: Promise<void> = new Promise<void>((resolve, reject) => {
        setTimeout(() => reject(new Error('nested fail')), 20);
      });

      try {
        await Promise.all([p1, p2.catch((err: Error) => {
          // Re-throw without handling
          throw new Error(`enhanced: ${err.message}`);
        })]);
        expect().assertFail();
      } catch (err) {
        expect((err as Error).message).assertEqual('enhanced: nested fail');
      }
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_3600
     * @tc.name PromiseAllTest036
     * @tc.desc test Promise.all with catch that returns same type as resolved value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAllTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<int> = Math.random() > 0.5
        ? Promise.resolve(100)
        : Promise.reject(new Error('random fail')).catch((err: Error) => err.message.length);

      const p2: Promise<int> = Promise.resolve(200);

      const result = await Promise.all([p1, p2]);
      expect(result[0] > 0).assertTrue();
      expect(result[1]).assertEqual(200);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_3700
     * @tc.name PromiseAllTest037
     * @tc.desc test Promise.all with catch and multiple finally blocks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAllTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const log: string[] = [];

      const p1: Promise<int> = Promise.reject(new Error('fail'))
        .catch((err: Error) => {
          log.push(`caught: ${err.message}`);
          return 1;
        })
        .finally(() => log.push('p1 finally 1'))
        .finally(() => log.push('p1 finally 2'));

      const p2: Promise<int> = Promise.resolve(2)
        .finally(() => log.push('p2 finally'));

      const result = await Promise.all([p1, p2]);
      expect(result).assertDeepEquals([1, 2]);
      expect(log).assertDeepEquals([
        "caught: fail", "p2 finally", "p1 finally 1", "p1 finally 2"
      ]);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_3900
     * @tc.name PromiseAllTest039
     * @tc.desc test Promise.all with catch that modifies shared state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAllTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let sharedState = 0;

      const p1: Promise<void> = Promise.reject(new Error('increment'))
        .catch((err: Error) => {
          sharedState++;
        });

      const p2: Promise<void> = Promise.reject(new Error('increment again'))
        .catch((err: Error) => {
          sharedState++;
        });

      await Promise.all([p1, p2]);
      expect(sharedState).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_4000
     * @tc.name PromiseAllTest040
     * @tc.desc test Promise.all with catch and promise chaining
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAllTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<int> = Promise.reject(new Error('start'))
        .catch((err: Error) => err.message.length) // 5
        .then(val => val * 2) // 10
        .then(val => val + 5); // 15

      const p2: Promise<int> = Promise.resolve(10)
        .then(val => val * 2); // 20

      const result = await Promise.all([p1, p2]);
      expect(result).assertDeepEquals([15, 20]);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_4100
     * @tc.name PromiseAllTest041
     * @tc.desc test Promise.all with nested Promise.all and async catches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAllTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const innerPromise = Promise.all([
        Promise.reject(new Error('inner1')).catch(async (err: Error) => {
          await new Promise<int>(resolve => {setTimeout(()=>{resolve(1)}, 10)});
          return err.message.length;
        }),
        Promise.resolve(5)
      ]);

      const result = await Promise.all([innerPromise, Promise.resolve(10)]);
      expect(result).assertDeepEquals([[6, 5], 10]); // 'inner1' has 6 characters
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_4200
     * @tc.name PromiseAllTest042
     * @tc.desc test Promise.all with race condition in async operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAllTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const start = Date.now();
      const p1 = new Promise<int>(resolve => {
      setTimeout(() => resolve(1), 50)}
      );
      const p2 = new Promise<int>((resolve, reject) => {
      setTimeout(() => reject(new Error('fast fail')), 20)}
      ).catch((err: Error) => err.message.length);

      const result = await Promise.all([p1, p2]);

      expect(result).assertDeepEquals([1, 9]); // 'fast fail' has 9 characters
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_4400
     * @tc.name PromiseAllTest044
     * @tc.desc test Promise.all with multiple layers of error handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAllTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1 = new Promise<number>((resolve, reject) => {
        setTimeout(() => reject(new Error('level1')), 10);
      })
        .catch((err: Error) => {
          return new Promise<number>((resolve, reject) => {
            setTimeout(() => reject(new Error(`level2: ${err.message}`)), 10);
          });
        })
        .catch((err: Error) => {
          return err.message.length;
        });

      const result = await Promise.all([p1]);
      expect(result).assertDeepEquals([14]); // 'level2: level1' has 13 characters
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_4600
     * @tc.name PromiseAllTest046
     * @tc.desc test Promise.all with mixed sync and async rejections
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAllTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1: Promise<string> = Promise.reject(new Error('sync error'))
        .catch((err: Error) => err.message);
      const p2: Promise<string> = new Promise<string>((resolve, reject) => {
        setTimeout(() => reject(new Error('async error')), 20);
      }).catch((err: Error) => err.message);

      const result = await Promise.all([p1, p2]);
      expect(result).assertDeepEquals(['sync error', 'async error']);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_4700
     * @tc.name PromiseAllTest047
     * @tc.desc test Promise.all with recursive promise structure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAllTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await Promise.all([
        createRecursivePromise(3),
        createRecursivePromise(0)
      ]);
      expect(result).assertDeepEquals([8, 1]);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_4800
     * @tc.name PromiseAllTest048
     * @tc.desc test Promise.all with promises that resolve to other promises
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAllTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1: Promise<int> = Promise.resolve(
        new Promise<int>(resolve => {setTimeout(() => resolve(10), 20)})
      );
      const p2: Promise<int> = Promise.resolve(20);

      const result = await Promise.all([p1, p2]);
      expect(result).assertDeepEquals([10, 20]);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_5000
     * @tc.name PromiseAllTest050
     * @tc.desc test Promise.all with mixed settled states and cleanup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAllTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const resources: string[] = [];

      const p1: Promise<int> = Promise.resolve(1)
        .finally(() => resources.push('p1 cleaned'));

      const p2: Promise<int> = Promise.reject(new Error('fail'))
        .catch((err: Error) => {
          resources.push('p2 handled');
          return 2;
        })
        .finally(() => resources.push('p2 cleaned'));

      const result = await Promise.all([p1, p2]);
      expect(result).assertDeepEquals([1, 2]);
      expect(resources).assertDeepEquals(['p1 cleaned', 'p2 handled', 'p2 cleaned']);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_5100
     * @tc.name PromiseAllTest051
     * @tc.desc test Promise.all with long chain of async operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAllTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const createChainedPromise = (start: number, steps: number): Promise<number> => {
        let promise: Promise<number> = Promise.resolve(start);
        for (let i = 0; i < steps; i++) {
          promise = promise.then(val =>
          new Promise<number>(resolve =>{
            setTimeout(() => resolve(val * 2), 5)
            }));
        }
        return promise;
      };

      const result = await Promise.all([
        createChainedPromise(1, 3), // 1 → 2 → 4 → 8
        createChainedPromise(2, 2)// 2 → 4 → 8
      ]);
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([8, 8]));
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_5300
     * @tc.name PromiseAllTest053
     * @tc.desc test Promise.all with nested error in resolved promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAllTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1: Promise<int> = Promise.resolve()
        .then(() => {
          return new Promise<int>((resolve) => {
            setTimeout(() => {
              try {
                throw new Error('hidden error');
              } catch (e) {
                resolve((e as Error).message.length);
              }
            }, 10);
          });
        });

      const result = await Promise.all([p1]);
      expect(result).assertDeepEquals([12]); // 'hidden error' has 12 characters
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_5700
     * @tc.name PromiseAllTest057
     * @tc.desc test Promise.all with resources that must be cleaned up
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAllTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const resources: string[] = [];

      const createResource = (name: string, shouldFail: boolean): Promise<string> => {
        resources.push(`acquired ${name}`);
        const promise = shouldFail
          ? Promise.reject(new Error(`${name} failed`))
          : Promise.resolve(`${name} success`);

        return promise
          .catch((err: Error) => err.message)
          .finally(() => resources.push(`released ${name}`));
      };

      const result = await Promise.all([
        createResource('res1', false),
        createResource('res2', true),
        createResource('res3', false)
      ]);

      expect(result).assertDeepEquals([
        'res1 success',
        'res2 failed',
        'res3 success'
      ]);
      expect(resources).assertDeepEquals([
        'acquired res1',
        'acquired res2',
        'acquired res3',
        'released res1',
        'released res2',
        'released res3'
      ]);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_5900
     * @tc.name PromiseAllTest059
     * @tc.desc test Promise.all with nested promises that resolve after delays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAllTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const createNestedPromise = (value: number, delay: int): Promise<number> => {
        return new Promise<number>(resolve => {
          setTimeout(() => {
            resolve(new Promise<number>(resolve => {
              setTimeout(() => resolve(value * 2), delay / 2);
            }));
          }, delay);
        });
      };

      const result = await Promise.all([
        createNestedPromise(2, 40), // 2*2=4 with total ~60ms delay
        createNestedPromise(3, 20)// 3*2=6 with total ~30ms delay
      ]);
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([4, 6]));
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_6000
     * @tc.name PromiseAllTest060
     * @tc.desc test Promise.all with complex error recovery strategy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAllTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const operation = (id: int, failType?: 'critical' | 'retry' | 'none'): Promise<int> => {
        return new Promise<int>((resolve, reject) => {
          setTimeout(() => {
            if (failType === 'critical') {
              reject(new CriticalError(`critical ${id}`));
            } else if (failType ===
              'retry') {
              reject(new RetryableError(`retry ${id}`));
            } else {
              resolve(id);
            }
          }, id * 10);
        });
      };

      // Complex recovery strategy with retries for certain errors
      const safeOperation = async (id: int, failType?: string): Promise<int | string> => {
        try {
          return await operation(id, failType as "critical" | "retry" | "none");
        } catch (err) {
          if (err instanceof RetryableError) {
            // Retry once for retryable errors
            return await operation(id);
          } else if (err instanceof CriticalError) {
            // Return error message for critical errors
            return `failed: ${(err as CriticalError).message}`;
          }
          throw err as Error;
        }
      };

      const result = await Promise.all([
        safeOperation(1, 'none'), // Should succeed
        safeOperation(2, 'retry'), // Should retry and succeed
        safeOperation(3, 'critical')// Should fail critically
      ]);

      expect(result).assertDeepEquals([1, 2, 'failed: critical 3']);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_6300
     * @tc.name PromiseAllTest063
     * @tc.desc test Promise.all with timed cascading promises
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAllTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const startTime = Date.now();

      const createTimedPromise = (delay: int, value: number): Promise<number> => {
        return new Promise<number>(resolve => {
          setTimeout(() => resolve(value), delay);
        });
      };

      const p1: Promise<number> = createTimedPromise(10, 1);
      const p2: Promise<number> = p1.then(val => createTimedPromise(20, val * 2));
      const p3: Promise<number> = p2.then(val => createTimedPromise(30, val * 2));

      const result = await Promise.all([p1, p2, p3]);

      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, 2, 4]));
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_6800
     * @tc.name PromiseAllTest068
     * @tc.desc test Promise.all with timing in nested all calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAllTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const startTime = Date.now();

      const inner1: Promise<number> = Promise.all([
        new Promise<number>(resolve => {setTimeout(() => resolve(1), 10)}),
        new Promise<number>(resolve => {setTimeout(() => resolve(2), 20)})
      ]).then((res: number[]) => {
        let a = res[0]
        let b = res[1]
        return a + b
      });

      const inner2: Promise<number> = Promise.all([
        new Promise<number>(resolve => {setTimeout(() => resolve(3), 15)}),
        new Promise<number>(resolve => {setTimeout(() => resolve(4), 5)})
      ]).then((res: number[]) => res[0] + res[1]);

      const result = await Promise.all([inner1, inner2]);

      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([3, 7]));
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_6900
     * @tc.name PromiseAllTest069
     * @tc.desc test Promise.all with cascading error recovery
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAllTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const createFailingPromise = (id: int, shouldFail: boolean): Promise<int> => {
        return new Promise<int>((resolve, reject) => {
          setTimeout(() => {
            if (shouldFail) {
              reject(new Error(`p${id} failed`));
            } else {
              resolve(id);
            }
          }, id * 10);
        });
      };

      // Create recovery chain
      const p1: Promise<int> = createFailingPromise(1, false);
      const p2: Promise<int> = p1.then(() => createFailingPromise(2, true))
        .catch((err: Error) => createFailingPromise(2, false));
      const p3: Promise<int> = p2.then(() => createFailingPromise(3, true))
        .catch((err: Error) => createFailingPromise(3, true))
        .catch((err: Error) => createFailingPromise(3, false));

      const result = await Promise.all([p1, p2, p3]);
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_7200
     * @tc.name PromiseAllTest072
     * @tc.desc test Promise.all with parallel and sequential mix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAllTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const startTime = Date.now();

      // Parallel operations
      const parallel1: Promise<int> = new Promise<int>(resolve =>{
      setTimeout(() => resolve(1), 20)}
      );
      const parallel2: Promise<int> = new Promise<int>(resolve =>{
      setTimeout(() => resolve(2), 30)}
      );

      // Sequential operation that depends on parallel results
      const sequential: Promise<int> = Promise.all([parallel1, parallel2])
        .then((res: int[]) => new Promise<int>(resolve =>{
        setTimeout(() => resolve(res[0] + res[1]), 15)}
        ));

      const result = await Promise.all([parallel1, parallel2, sequential]);

      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_7700
     * @tc.name PromiseAllTest077
     * @tc.desc test Promise.all with cascading in nested arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAllTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1: Promise<number> = new Promise<number>(resolve =>{
      setTimeout(() => resolve(1), 10)}
      );

      const p2: Promise<number> = p1.then(val =>
      new Promise<number>(resolve => {setTimeout(() => resolve(val * 2), 10)})
      );

      const innerAll: Promise<number[]> = Promise.all([p1, p2]);
      const p3: Promise<number> = innerAll.then((res: number[]) =>
      new Promise<number>(resolve => {setTimeout(() => resolve(res[0] + res[1]), 10)})
      );

      const result = await Promise.all([innerAll, p3]);
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([[1, 2], 3]));
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_ALL_TEST_8200
     * @tc.name PromiseAllTest082
     * @tc.desc test Promise.all with Promise.resolve in nested chains
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAllTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const result = await Promise.all([
        createResolvedChain(1, 3), // 1 → 2 → 4 → 8
        createResolvedChain(2, 2)// 2 → 4 → 8
      ]);
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([8, 8]));
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_ALL_TEST_8300
     * @tc.name PromiseAllTest083
     * @tc.desc test Promise.all with Promise.reject and catch in nested structure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAllTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const p1 = Promise.reject(new Error('outer'))
        .catch((err: Error) => {
          return Promise.reject(new Error(`inner: ${err.message}`))
            .catch((innerErr: Error) => innerErr.message);
        });

      const p2 = Promise.resolve(10)
        .then(val => Promise.reject(new Error('mid')))
        .catch((err: Error) => err.message.length);

      const result = await Promise.all([p1, p2]);
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify(['inner: outer', 3]));
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_ALL_TEST_8800
     * @tc.name PromiseAllTest088
     * @tc.desc test Promise.all with recursive Promise creation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAllTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const result = await Promise.all([
        createRecursivePromise88(3), // 1 → 2 → 4 → 8
        createRecursivePromise88(2)// 1 → 2 → 4
      ]);
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([8, 4]));
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_ALL_TEST_9100
     * @tc.name PromiseAllTest091
     * @tc.desc test Promise.all with mixed static and instance methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAllTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const p1: Promise<int> = Promise.resolve(10)
        .then(val => Promise.resolve(val * 2))
        .then(val => val + 5);

      const p2: Promise<int> = Promise.reject(new Error('test'))
        .catch((err: Error) => err.message.length)
        .then(len => len * 2);

      const p3 = Promise.all([p1, p2])
        .then((res: int[]) => res[0] + res[1]);

      const result = await Promise.all([p1, p2, p3]);
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([25, 8, 33]));
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_ALL_TEST_9300
     * @tc.name PromiseAllTest093
     * @tc.desc test Promise.all with error propagation through multiple levels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAllTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const p1 = new Promise<string>((resolve, reject) => {
        setTimeout(() => reject(new Level1Error('level1')), 10);
      })
        .catch((err: Error) => {
          return new Promise<string>((resolve, reject) => {
            setTimeout(() => reject(new Level2Error(`wrapped: ${err.message}`)), 10);
          });
        });

      const p2 = p1.catch((err: Error) => err.message);
      const p3 = p1.catch((err: Error) => err.name);

      const result = await Promise.all([p2, p3]);
      expect(result).assertDeepEquals(['wrapped: level1', 'Error']);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_ALL_TEST_9600
     * @tc.name PromiseAllTest096
     * @tc.desc test Promise.all with mixed promise sources and timing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAllTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const startTime = Date.now();
      // Different types of promise sources
      const p1 = Promise.resolve(1);
      const p2 = new Promise<int>(resolve => {setTimeout(() => resolve(2), 20)});
      const p3 = Promise.reject<string>(new Error('p3')).catch((err: Error) => err.message);
      const p4 = Promise.all([p1, p2]).then((res: int[]) => res[0] + res[1]);

      const result = await Promise.all([p1, p2, p3, p4]);

      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, 2, 'p3', 3]));
    });
     
  })
}
