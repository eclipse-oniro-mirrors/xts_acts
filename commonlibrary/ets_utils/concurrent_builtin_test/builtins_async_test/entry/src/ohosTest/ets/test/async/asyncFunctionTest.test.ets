import { afterEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import {
  ApiResponse,
  asyncFunctionTest016,
  asyncFunctionTest043,
  asyncFunctionTest053,
  asyncFunctionTest063,
  asyncFunctionTest068,
  asyncFunctionTest087,
  asyncFunctionTest089,
  asyncFunctionTest090,
  asyncFunctionTest091,
  asyncFunctionTest099,
  CacheKey,
  Data,
  FormData,
  ResultObj,
  type100,
  type62,
  type68,
  type71,
  type83,
  type86,
  type93,
  type94,
  type96,
  User
} from './async';
import { sleep } from './utils';

function formatData(data: string): Promise<string>;

function formatData(data: number): Promise<string>;

function formatData(data: string | number): Promise<string> {
  const nestedFormat = async (): Promise<string> => {
    if (typeof data === 'string') {
      return await Promise.resolve(data.toUpperCase());
    }
    return await Promise.resolve(data.toString().padStart(3, '0'));
  };
  return nestedFormat();
}

export default function asyncFunctionTest() {
  describe('asyncFunctionTest', () => {
    afterEach(async () => {
      await sleep(10)
    })
    /**
     * @tc.name   asyncFunctionTest001
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_001
     * @tc.desc   Basic async function returns resolved value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asyncFunctionTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const getValue = async (): Promise<number> => 42;
      const result = await getValue();
      expect(result).assertEqual(42);
    });

    /**
     * @tc.name   asyncFunctionTest002
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_002
     * @tc.desc   Async function returns Promise object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asyncFunctionTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const getPromise = async (): Promise<string> => Promise.resolve('test');
      const result: Promise<string> = getPromise();
      expect(result instanceof Promise).assertEqual(true);
    });

    /**
     * @tc.name   asyncFunctionTest003
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_003
     * @tc.desc   Async function uses await with external Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFunctionTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const externalPromise: Promise<number> = Promise.resolve(15);
      const useAwait = async (): Promise<number> => {
        const val = await externalPromise;
        return val * 2;
      };
      const result = await useAwait();
      expect(result).assertEqual(30);
    });

    /**
     * @tc.name   asyncFunctionTest004
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_004
     * @tc.desc   Async function throws error, caught by try/catch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFunctionTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const throwError = async (): Promise<void> => {
        throw new Error('async error');
      };
      let errorCaught = false;
      try {
        await throwError();
      } catch (err) {
        errorCaught = true;
        expect((err as Error).message).assertEqual('async error');
      }
      expect(errorCaught).assertEqual(true);
    });

    /**
     * @tc.name   asyncFunctionTest005
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_005
     * @tc.desc   Async function with no return returns Promise.resolve(undefined)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asyncFunctionTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const noReturn = async (): Promise<undefined> => {
        return;
      };
      const result = await noReturn();
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.name   asyncFunctionTest006
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_006
     * @tc.desc   Async function with nested async arrow function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFunctionTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const outerAsync = async (): Promise<number> => {
        const innerAsync = async (): Promise<number> => 8;
        const innerVal = await innerAsync();
        return innerVal * 3;
      };
      const result = await outerAsync();
      expect(result).assertEqual(24);
    });

    /**
     * @tc.name   asyncFunctionTest007
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_007
     * @tc.desc   Multiple awaits in single async function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFunctionTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const multiAwait = async (): Promise<number> => {
        const p1: Promise<number> = Promise.resolve(2);
        const p2: Promise<number> = Promise.resolve(3);
        const v1 = await p1;
        const v2 = await p2;
        return v1 * v2;
      };
      const result = await multiAwait();
      expect(result).assertEqual(6);
    });

    /**
     * @tc.name   asyncFunctionTest008
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_008
     * @tc.desc   Async function returns rejected Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFunctionTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const returnRejected = async (): Promise<never> => {
        return Promise.reject(new Error('rejected promise'));
      };
      let errorMsg = '';
      try {
        await returnRejected();
      } catch (err) {
        errorMsg = (err as Error).message;
      }
      expect(errorMsg).assertEqual('rejected promise');
    });

    /**
     * @tc.name   asyncFunctionTest009
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_009
     * @tc.desc   Async function with parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asyncFunctionTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const withParam = async (num: number): Promise<number> => num + 10;
      const result = await withParam(5);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.name   asyncFunctionTest010
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_010
     * @tc.desc   Async function with default parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFunctionTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const defaultParam = async (num: number = 3): Promise<number> => num * 4;
      const result1 = await defaultParam();
      const result2 = await defaultParam(5);
      expect(result1).assertEqual(12);
      expect(result2).assertEqual(20);
    });

    /**
     * @tc.name   asyncFunctionTest011
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_011
     * @tc.desc   Async function with rest parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFunctionTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const restParam = async (...nums: number[]): Promise<number> => {
        return nums.reduce((sum, curr) => sum + curr, 0);
      };
      const result = await restParam(1, 2, 3, 4);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.name   asyncFunctionTest012
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_012
     * @tc.desc   Async function returns BigInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asyncFunctionTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const returnBigInt = async (): Promise<bigint> => 100n;
      const result = await returnBigInt();
      expect(result).assertEqual(100n);
    });

    /**
     * @tc.name   asyncFunctionTest013
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_013
     * @tc.desc   Async function uses await in try/catch block
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFunctionTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const tryCatchAwait = async (): Promise<string> => {
        try {
          const p: Promise<never> = Promise.reject(new Error('await error'));
          await p;
          return 'success';
        } catch (err) {
          return (err as Error).message;
        }
      };
      const result = await tryCatchAwait();
      expect(result).assertEqual('await error');
    });

    /**
     * @tc.name   asyncFunctionTest014
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_014
     * @tc.desc   Async function with try/finally block
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFunctionTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let finallyExecuted = false;
      const tryFinally = async (): Promise<number> => {
        try {
          return 5;
        } finally {
          finallyExecuted = true;
        }
      };
      await tryFinally();
      expect(finallyExecuted).assertEqual(true);
    });

    /**
     * @tc.name   asyncFunctionTest015
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_015
     * @tc.desc   Async function assigned to variable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asyncFunctionTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const asyncVar = async (): Promise<string> => 'assigned';
      const result = await asyncVar();
      expect(result).assertEqual('assigned');
    });

    /**
     * @tc.name   asyncFunctionTest016
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_016
     * @tc.desc   Async function as object method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFunctionTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await asyncFunctionTest016();
      expect(result).assertEqual(14);
    });

    /**
     * @tc.name   asyncFunctionTest017
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_017
     * @tc.desc   Async function as class method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFunctionTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      class TestClass {
        async classMethod(str: string): Promise<string> {
          return str.toUpperCase();
        }
      }

      const instance = new TestClass();
      const result = await instance.classMethod('test');
      expect(result).assertEqual('TEST');
    });

    /**
     * @tc.name   asyncFunctionTest018
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_018
     * @tc.desc   Async function returns object literal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asyncFunctionTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const returnObj = async (): Promise<ResultObj> => ({ key: 'value', count: 3 });
      const result = await returnObj();
      expect(result.key).assertEqual('value');
      expect(result.count).assertEqual(3);
    });

    /**
     * @tc.name   asyncFunctionTest019
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_019
     * @tc.desc   Async function with Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFunctionTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usePromiseAll = async (): Promise<number> => {
        const promises: Promise<number>[] = [
          Promise.resolve(1),
          Promise.resolve(2),
          Promise.resolve(3)
        ];
        const results = await Promise.all(promises);
        return results.reduce((a, b) => a + b, 0);
      };
      const result = await usePromiseAll();
      expect(result).assertEqual(6);
    });

    /**
     * @tc.name   asyncFunctionTest020
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_020
     * @tc.desc   Async function with Promise.race (resolved first)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFunctionTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usePromiseRace = async (): Promise<string> => {
        const p1: Promise<string> = Promise.resolve('fast');
        const p2: Promise<string> = Promise.resolve('slow');
        return await Promise.race([p1, p2]);
      };
      const result = await usePromiseRace();
      expect(result).assertEqual('fast');
    });

    /**
     * @tc.name   asyncFunctionTest021
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_021
     * @tc.desc   Async function with Promise.allSettled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      type SettledStatus = 'fulfilled' | 'rejected';
      const useAllSettled = async (): Promise<SettledStatus[]> => {
        const promises: Array<Promise<number | never>> = [
          Promise.resolve(5),
          Promise.reject(new Error('fail'))
        ];
        const results = await Promise.allSettled(promises);
        return results.map(res => res.status);
      };
      const result = await useAllSettled();
      expect(result).assertDeepEquals(['fulfilled', 'rejected']);
    });

    /**
     * @tc.name   asyncFunctionTest022
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_022
     * @tc.desc   Async function calls another async function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFunctionTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const async1 = async (): Promise<number> => 4;
      const async2 = async (): Promise<number> => {
        const val = await async1();
        return val + 6;
      };
      const result = await async2();
      expect(result).assertEqual(10);
    });

    /**
     * @tc.name   asyncFunctionTest023
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_023
     * @tc.desc   Async function returns resolved Promise directly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asyncFunctionTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const returnResolved = async (): Promise<string> => Promise.resolve('done');
      const result = await returnResolved();
      expect(result).assertEqual('done');
    });

    /**
     * @tc.name   asyncFunctionTest024
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_024
     * @tc.desc   Async function returns array with typed elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asyncFunctionTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const returnArray = async (): Promise<number[]> => [1, 2, 3];
      const result = await returnArray();
      expect(result).assertDeepEquals([1, 2, 3]);
      expect(result.every(item => typeof item === 'number')).assertEqual(true);
    });

    /**
     * @tc.name   asyncFunctionTest025
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_025
     * @tc.desc   Async function with conditional await (typed branches)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFunctionTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const conditionalAwait = async (useFast: boolean): Promise<string> => {
        const fastPromise: Promise<string> = Promise.resolve('fast val');
        const slowPromise: Promise<string> = Promise.resolve('slow val');
        return useFast ? await fastPromise : await slowPromise;
      };
      const result1 = await conditionalAwait(true);
      const result2 = await conditionalAwait(false);
      expect(result1).assertEqual('fast val');
      expect(result2).assertEqual('slow val');
    });

    /**
     * @tc.name   asyncFunctionTest026
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_026
     * @tc.desc   Async function with nested conditional await (typed data flow)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const nestedCondAwait = async (level: number): Promise<number> => {
        const getVal = async (num: number): Promise<number> => num * 2;
        if (level === 1) {
          return await getVal(5);
        } else if (level === 2) {
          const val1 = await getVal(3);
          return await getVal(val1);
        }
        return 0;
      };
      const result1 = await nestedCondAwait(1);
      const result2 = await nestedCondAwait(2);
      expect(result1).assertEqual(10);
      expect(result2).assertEqual(12);
    });

    /**
     * @tc.name   asyncFunctionTest027
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_027
     * @tc.desc   Async arrow function with typed parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asyncFunctionTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const asyncArrow = async (str: string): Promise<string> => str.repeat(2);
      const result = await asyncArrow('test');
      expect(result).assertEqual('testtest');
    });

    /**
     * @tc.name   asyncFunctionTest028
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_028
     * @tc.desc   Async arrow function with no parameters (returns typed value)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asyncFunctionTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const noParamAsyncArrow = async (): Promise<number> => new Date().getFullYear();
      const result = await noParamAsyncArrow();
      expect(typeof result).assertEqual('number');
    });

    /**
     * @tc.name   asyncFunctionTest029
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_029
     * @tc.desc   Async function returns typed Symbol
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asyncFunctionTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0b0101; // Initial value (5 in decimal)
      const orVal = 0b1010; // OR mask (10 in decimal)

      // Async function wrapping atomic OR operation
      const asyncAtomicOr = async (mask:number) => {
        return new Promise<number>(resolve => {
          setTimeout(() => {
            const oldVal = Atomics.or(ia, 0, mask); // Atomic OR: return old value
            const currentVal = Atomics.load(ia, 0); // Atomic load: get updated value
            resolve( currentVal );
          }, 0);
        });
      };

      // Execute async atomic OR operation
      const result = await asyncAtomicOr(orVal);

      // Key assertions (5 | 10 = 15 = 0b1111)
      expect(result).assertEqual(15); // Verify OR operation result
      expect(ia[0]).assertEqual(15); // Verify memory consistency
    });

    /**
     * @tc.name   asyncFunctionTest030
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_030
     * @tc.desc   Async function with await in loop (typed array result)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFunctionTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const awaitInLoop = async (): Promise<number[]> => {
        const nums: number[] = [1, 2, 3];
        const results: number[] = [];
        for (const num of nums) {
          const delayedVal: Promise<number> = Promise.resolve(num * 2);
          results.push(await delayedVal);
        }
        return results;
      };
      const result = await awaitInLoop();
      expect(result).assertDeepEquals([2, 4, 6]);
    });

    /**
     * @tc.name   asyncFunctionTest031
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_031
     * @tc.desc   Async function with forEach and await (typed result sorting)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const awaitInForEach = async (): Promise<number[]> => {
        const nums: number[] = [1, 2, 3];
        const results: number[] = [];
        const promiseList: Promise<void>[] = [];

        nums.forEach(num => {
          const promise: Promise<void> = (async () => {
            const val: number = await Promise.resolve(num * 2);
            results.push(val);
          })();
          promiseList.push(promise);
        });

        await Promise.all(promiseList);
        return results.sort((a, b) => a - b);
      };
      const result = await awaitInForEach();
      expect(result).assertDeepEquals([2, 4, 6]);
    });

    /**
     * @tc.name   asyncFunctionTest032
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_032
     * @tc.desc   Async function returns typed Map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asyncFunctionTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const returnMap = async (): Promise<Map<string, number>> => {
        const map: Map<string, number> = new Map();
        map.set('a', 1);
        map.set('b', 2);
        return map;
      };
      const result = await returnMap();
      expect(result.get('a')).assertEqual(1);
      expect(result.get('b')).assertEqual(2);
    });

    /**
     * @tc.name   asyncFunctionTest033
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_033
     * @tc.desc   Async function returns typed Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asyncFunctionTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const returnSet = async (): Promise<Set<number>> => {
        const set: Set<number> = new Set();
        set.add(1);
        set.add(2);
        set.add(2);
        return set;
      };
      const result = await returnSet();
      expect(result.size).assertEqual(2);
      expect(result.has(1)).assertEqual(true);
    });

    /**
     * @tc.name   asyncFunctionTest034
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_034
     * @tc.desc   Async function with async callback in array map (typed promises)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFunctionTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const asyncMapCallback = async (): Promise<number[]> => {
        const nums: number[] = [1, 2, 3];
        const promises: Promise<number>[] = nums.map(async (num) => {
          return await Promise.resolve(num * 3);
        });
        return Promise.all(promises);
      };
      const result = await asyncMapCallback();
      expect(result).assertDeepEquals([3, 6, 9]);
    });

    /**
     * @tc.name   asyncFunctionTest035
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_035
     * @tc.desc   Async function with error propagation from nested async (typed error)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFunctionTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const nestedAsyncError = async (): Promise<void> => {
        const innerAsync = async (): Promise<void> => {
          throw new Error('inner error');
        };
        await innerAsync();
      };
      let errorCaught = false;
      try {
        await nestedAsyncError();
      } catch (err) {
        errorCaught = true;
        expect((err as Error).message).assertEqual('inner error');
      }
      expect(errorCaught).assertEqual(true);
    });

    /**
     * @tc.name   asyncFunctionTest036
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_036
     * @tc.desc   Async function with typed custom Promise implementation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const asyncCalculate = async (base:number, shouldMultiply:boolean) => {
        return new Promise<number>(resolve => {
          setTimeout(() => {
            let result = base + 10; // Basic async calculation
            if (shouldMultiply) {
              result *= 2; // Conditional secondary operation
            }
            resolve(result);
          }, 0);
        });
      };

      // Simulate dependent async operation (uses previous result)
      const asyncDependentProcess = async (prevResult:number) => {
        return new Promise<number>(resolve => {
          setTimeout(() => {
            resolve(prevResult - 3); // Dependent logic
          }, 0);
        });
      };

      // Execute async workflow: sequential + chaining + conditional
      const firstResult = await asyncCalculate(8, true); // 8+10=18 → 18*2=36
      const finalResult = await asyncDependentProcess(firstResult); // 36-3=33

      // Parallel verification: different condition
      const secondResult = await asyncCalculate(8, false); // 8+10=18 (no multiply)
      const finalResult2 = await asyncDependentProcess(secondResult); // 18-3=15

      // Key assertions
      expect(firstResult).assertEqual(36);
      expect(finalResult).assertEqual(33);

      expect(secondResult).assertEqual(18);
      expect(finalResult2).assertEqual(15);
    });

    /**
     * @tc.name   asyncFunctionTest037
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_037
     * @tc.desc   Async function with typed Promise.resolve chaining
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFunctionTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const promiseChaining = async (): Promise<number> => {
        return await Promise.resolve(2)
          .then((val: number) => val * 3)
          .then((val: number) => val + 4);
      };
      const result = await promiseChaining();
      expect(result).assertEqual(10);
    });

    /**
     * @tc.name   asyncFunctionTest038
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_038
     * @tc.desc   Async function with typed Promise.catch in chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFunctionTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const promiseCatchChain = async (): Promise<string> => {
        return await Promise.reject(new Error('chain error'))
          .catch((err: Error) => err.message)
          .then((msg: string) => `Caught: ${msg}`);
      };
      const result = await promiseCatchChain();
      expect(result).assertEqual('Caught: chain error');
    });

    /**
     * @tc.name   asyncFunctionTest039
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_039
     * @tc.desc   Async function with await on typed non-Promise value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asyncFunctionTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const awaitNonPromise = async (): Promise<string> => {
        const nonPromiseVal: string = 'not a promise';
        return await nonPromiseVal;
      };
      const result = await awaitNonPromise();
      expect(result).assertEqual('not a promise');
    });

    /**
     * @tc.name   asyncFunctionTest040
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_040
     * @tc.desc   Async function with await on typed null value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asyncFunctionTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const awaitNull = async (): Promise<null> => {
        const nullVal: null = null;
        return await nullVal;
      };
      const result = await awaitNull();
      expect(result).assertEqual(null);
    });

    /**
     * @tc.name   asyncFunctionTest041
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_041
     * @tc.desc   Async function with await on typed undefined value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asyncFunctionTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const awaitUndefined = async (): Promise<undefined> => {
        const undefinedVal: undefined = undefined;
        return await undefinedVal;
      };
      const result = await awaitUndefined();
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.name   asyncFunctionTest042
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_042
     * @tc.desc   Async function with parallel async calls (typed Promise.all)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFunctionTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const parallelAsync = async (): Promise<number> => {
        const p1: Promise<number> = Promise.resolve(10);
        const p2: Promise<number> = Promise.resolve(20);
        const res = await Promise.all([p1, p2]);
        return res[0] + res[1];
      };
      const result = await parallelAsync();
      expect(result).assertEqual(30);
    });

    /**
     * @tc.name   asyncFunctionTest043
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_043
     * @tc.desc   Async function with typed async generator call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const result: number[] = await asyncFunctionTest043()
      expect(result).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   asyncFunctionTest044
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_044
     * @tc.desc   Async function as typed event listener callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Initialize shared memory (atomic operation carrier)
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 25;

      // Minimal async function: Wrap atomic subtraction (simulate async business scenarios)
      const asyncAtomicSub = async (subtractVal:number) => {
        return new Promise<number>(resolve => {
          setTimeout(() => {
            Atomics.sub(ia, 0, subtractVal);
            resolve(Atomics.load(ia, 0));
          }, 0);
        });
      };

      // Execute async atomic operations (two consecutive calls to verify execution order)
      const result1 = await asyncAtomicSub(8);
      const result2 = await asyncAtomicSub(5);

      // Key assertions (verify async results and memory consistency)
      expect(result1).assertEqual(17);
      expect(result2).assertEqual(12);
      expect(ia[0]).assertEqual(12);
    });

    /**
     * @tc.name   asyncFunctionTest045
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_045
     * @tc.desc   Async function with return in finally block (overrides try/catch return)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFunctionTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const returnInFinally = async (shouldThrow: boolean): Promise<string> => {
        try {
          if (shouldThrow) {
            throw new Error('test');
          }
          return 'try return';
        } catch {
          return 'catch return';
        } finally {
          return 'finally return';
        }
      };
      const result1 = await returnInFinally(false);
      const result2 = await returnInFinally(true);
      expect(result1).assertEqual('finally return');
      expect(result2).assertEqual('finally return');
    });

    /**
     * @tc.name   asyncFunctionTest046
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_046
     * @tc.desc   3-level nested async functions with sequential awaits (typed data flow)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const level3 = async (num: number): Promise<number> => {
        return await Promise.resolve(num * 2);
      };
      const level2 = async (num: number): Promise<number> => {
        const val = await level3(num);
        return await Promise.resolve(val + 3);
      };
      const level1 = async (num: number): Promise<number> => {
        const val = await level2(num);
        return await Promise.resolve(val * 4);
      };
      const result = await level1(2); // 2→4→7→28
      expect(result).assertEqual(28);
    });

    /**
     * @tc.name   asyncFunctionTest047
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_047
     * @tc.desc   Async function with parallel nested async calls via typed Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const nestedAsync1 = async (): Promise<number> => await Promise.resolve(5);
      const nestedAsync2 = async (): Promise<number> => await Promise.resolve(8);
      const nestedAsync3 = async (): Promise<number> => await Promise.resolve(3);

      const parallelNested = async (): Promise<number> => {
        const val = await Promise.all([nestedAsync1(), nestedAsync2(), nestedAsync3()]);
        return val[1] + val[2] + val[0];
      };
      const result = await parallelNested();
      expect(result).assertEqual(16);
    });

    /**
     * @tc.name   asyncFunctionTest048
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_048
     * @tc.desc   Async function with conditional nested async (typed branch results)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const branchA = async (num: number): Promise<number> => {
        const inner = async (): Promise<number> => await Promise.resolve(num * 3);
        return await inner();
      };
      const branchB = async (num: number): Promise<number> => {
        const inner1 = async (): Promise<number> => await Promise.resolve(num + 2);
        const inner2 = async (val: number): Promise<number> => await Promise.resolve(val * 4);
        return await inner2(await inner1());
      };

      const conditionalNested = async (useBranchA: boolean, num: number): Promise<number> => {
        return useBranchA ? await branchA(num) : await branchB(num);
      };
      const result1 = await conditionalNested(true, 4); // 4→12
      const result2 = await conditionalNested(false, 3); // 3→5→20
      expect(result1).assertEqual(12);
      expect(result2).assertEqual(20);
    });

    /**
     * @tc.name   asyncFunctionTest049
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_049
     * @tc.desc   Async function with nested async arrow functions in typed array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const asyncTasks: Array<() => Promise<number>> = [
        async () => await Promise.resolve(2),
        async () => await Promise.resolve(5),
        async () => await Promise.resolve(7)
      ];

      const runNestedArrayTasks = async (): Promise<number> => {
        const results: number[] = [];
        for (const task of asyncTasks) {
          results.push(await task());
        }
        return results.reduce((a, b) => a * b, 1);
      };
      const result = await runNestedArrayTasks(); // 2*5*7=70
      expect(result).assertEqual(70);
    });

    /**
     * @tc.name   asyncFunctionTest050
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_050
     * @tc.desc   Async function with error handling in nested async layers (typed errors)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const level3 = async (shouldThrow: boolean): Promise<number> => {
        if (shouldThrow) {
          throw new Error('level3 error');
        }
        return await Promise.resolve(10);
      };
      const level2 = async (shouldThrow: boolean): Promise<number> => {
        try {
          return await level3(shouldThrow);
        } catch (err) {
          throw new Error(`level2 wrapped: ${(err as Error).message}`);
        }
      };
      const level1 = async (shouldThrow: boolean): Promise<string | number> => {
        try {
          return await level2(shouldThrow);
        } catch (err) {
          return `caught: ${(err as Error).message}`;
        }
      };

      const result1 = await level1(false);
      const result2 = await level1(true);
      expect(result1).assertEqual(10);
      expect(result2).assertEqual('caught: level2 wrapped: level3 error');
    });

    /**
     * @tc.name   asyncFunctionTest051
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_051
     * @tc.desc   Async function with nested async that returns another async function (typed)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const getAsyncFunc = async (multiplier: number): Promise<(num: number) => Promise<number>> => {
        // Nested async returns typed async function
        return async (num: number): Promise<number> => {
          return await Promise.resolve(num * multiplier);
        };
      };

      const useNestedFunc = async (): Promise<number> => {
        const asyncFunc = await getAsyncFunc(4); // Get typed async function
        return await asyncFunc(6); // Call returned async function
      };
      const result = await useNestedFunc(); // 6*4=24
      expect(result).assertEqual(24);
    });

    /**
     * @tc.name   asyncFunctionTest052
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_052
     * @tc.desc   4-level async nested workflow with typed data passing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Level 4: Final data processing (typed)
      const processData = async (data: number): Promise<number> => {
        return await Promise.resolve(data + 10);
      };
      // Level 3: Transform data (typed)
      const transformData = async (data: number): Promise<number> => {
        const processed = await processData(data);
        return await Promise.resolve(processed * 2);
      };
      // Level 2: Fetch mock data (typed)
      const fetchData = async (id: number): Promise<number> => {
        const mockData = await Promise.resolve(id * 5);
        return await transformData(mockData);
      };
      // Level 1: Initiate workflow (typed)
      const startWorkflow = async (id: number): Promise<number> => {
        const data = await fetchData(id);
        return await Promise.resolve(data - 5);
      };

      const result = await startWorkflow(3); // 3→15→25→50→45
      expect(result).assertEqual(45);
    });

    /**
     * @tc.name   asyncFunctionTest053
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_053
     * @tc.desc   Async function with nested async in typed object properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const result = await asyncFunctionTest053();
      expect(result).assertEqual(25);
    });

    /**
     * @tc.name   asyncFunctionTest054
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_054
     * @tc.desc   Async function with nested async that uses typed Promise.race
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const nestedRace = async (): Promise<string> => {
        const p1: Promise<string> = Promise.resolve('winner');
        const p2: Promise<string> = Promise.resolve('loser');
        return await Promise.race([p1, p2]);
      };

      const outerAsync = async (): Promise<string> => {
        const raceResult = await nestedRace();
        return `Result: ${raceResult}`;
      };
      const result = await outerAsync();
      expect(result).assertEqual('Result: winner');
    });

    /**
     * @tc.name   asyncFunctionTest055
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_055
     * @tc.desc   Async function with nested async error recovery (typed fallback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const riskyAsync = async (shouldThrow: boolean): Promise<number> => {
        if (shouldThrow) {
          throw new Error('risky failed');
        }
        return await Promise.resolve(15);
      };

      const withFallback = async (shouldThrow: boolean): Promise<number> => {
        try {
          return await riskyAsync(shouldThrow);
        } catch {
          // Fallback to typed async call
          return await Promise.resolve(10);
        }
      };

      const result1 = await withFallback(false);
      const result2 = await withFallback(true);
      expect(result1).assertEqual(15);
      expect(result2).assertEqual(10);
    });

    /**
     * @tc.name   asyncFunctionTest056
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_056
     * @tc.desc   Async function with nested async in typed class hierarchy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      class Parent {
        async parentMethod(num: number): Promise<number> {
          return await Promise.resolve(num * 2);
        }
      }

      class Child extends Parent {
        async childMethod(num: number): Promise<number> {
          // Call parent's typed async method
          const parentVal = await this.parentMethod(num);
          // Nested async in child (typed)
          const childVal = await Promise.resolve(parentVal + 7);
          return childVal;
        }
      }

      const runClassAsync = async (): Promise<number> => {
        const child = new Child();
        return await child.childMethod(5); // 5→10→17
      };
      const result = await runClassAsync();
      expect(result).assertEqual(17);
    });

    /**
     * @tc.name   asyncFunctionTest057
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_057
     * @tc.desc   Async function with nested async that returns typed Promise.allSettled results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      type SettledResult = PromiseSettledResult<number>;
      const getSettled = async (): Promise<SettledResult[]> => {
        const tasks: Array<Promise<number | never>> = [
          Promise.resolve(3),
          Promise.reject(new Error('fail')),
          Promise.resolve(7)
        ];
        return await Promise.allSettled(tasks);
      };

      const processSettled = async (): Promise<number> => {
        const results = await getSettled();
        const fulfilled = results
          .filter((res) => (res as PromiseFulfilledResult<number>).status === 'fulfilled')
          .map((res): number => (res as PromiseFulfilledResult<number>).value);
        return fulfilled.reduce((a, b) => a + b, 0);
      };
      const result = await processSettled(); // 3+7=10
      expect(result).assertEqual(10);
    });

    /**
     * @tc.name   asyncFunctionTest058
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_058
     * @tc.desc   Async function with nested async in loop (typed dynamic task count)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const createAsyncTask = (num: number): (() => Promise<number>) => {
        return async (): Promise<number> => await Promise.resolve(num * 2);
      };

      const runDynamicTasks = async (taskCount: number): Promise<number[]> => {
        // Create typed dynamic async tasks
        const tasks: Array<() => Promise<number>> = Array.from(
          new Array(taskCount),
          (_: number, i) => createAsyncTask(i + 1)
        );
        const results: number[] = [];
        for (const task of tasks) {
          results.push(await task());
        }
        return results;
      };

      const result = await runDynamicTasks(4); // [2,4,6,8]
      expect(result).assertDeepEquals([2, 4, 6, 8]);
    });

    /**
     * @tc.name   asyncFunctionTest059
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_059
     * @tc.desc   Async function with nested async that returns typed tuple
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      type DataTuple = [string, number, boolean];
      const getTypedTuple = async (): Promise<DataTuple> => {
        const nested1 = async (): Promise<string> => await Promise.resolve('test');
        const nested2 = async (): Promise<number> => await Promise.resolve(42);
        const nested3 = async (): Promise<boolean> => await Promise.resolve(true);

        return [await nested1(), await nested2(), await nested3()];
      };

      const useTypedTuple = async (): Promise<DataTuple> => {
        return await getTypedTuple();
      };
      const res = await useTypedTuple();
      expect(res[0]).assertEqual('test');
      expect(res[1]).assertEqual(42);
      expect(res[2]).assertEqual(true);
    });

    /**
     * @tc.name   asyncFunctionTest060
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_060
     * @tc.desc   Async function with nested async in typed interface implementation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      interface DataProcessor {
        fetch: (id: number) => Promise<string>;
        transform: (data: string) => Promise<string>;
        save: (data: string) => Promise<boolean>;
      }

      const createProcessor = (): DataProcessor => {
        return {
          fetch: async (id: number): Promise<string> => {
            // Nested async in interface method
            const mockFetch = async (): Promise<string> => await Promise.resolve(`data_${id}`);
            return await mockFetch();
          },
          transform: async (data: string): Promise<string> => {
            const mockTransform = async (): Promise<string> => await Promise.resolve(data.toUpperCase());
            return await mockTransform();
          },
          save: async (data: string): Promise<boolean> => {
            const mockSave = async (): Promise<boolean> => await Promise.resolve(true);
            return await mockSave();
          }
        };
      };

      const runProcessor = async (id: number): Promise<boolean> => {
        const processor = createProcessor();
        const raw = await processor.fetch(id);
        const transformed = await processor.transform(raw);
        return await processor.save(transformed);
      };
      const result = await runProcessor(5); // data_5 → DATA_5 → saved
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   asyncFunctionTest061
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_061
     * @tc.desc   Async function with nested async that handles typed optional values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const getOptionalData = async (hasData: boolean): Promise<number | null> => {
        const nestedGet = async (): Promise<number | null> => {
          if (hasData) {
            return await Promise.resolve(100);
          }
          return await Promise.resolve(null);
        };
        return await nestedGet();
      };

      const processOptional = async (hasData: boolean): Promise<number> => {
        const data = await getOptionalData(hasData);
        return data ?? 0; // Fallback for null
      };

      const result1 = await processOptional(true);
      const result2 = await processOptional(false);
      expect(result1).assertEqual(100);
      expect(result2).assertEqual(0);
    });

    /**
     * @tc.name   asyncFunctionTest062
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_062
     * @tc.desc   Async function with nested async that uses typed generic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const genericFetcher = async<T>(data: T): Promise<T> => {
        // Nested async with generic type
        const nestedFetch = async (): Promise<T> => await Promise.resolve(data);
        return await nestedFetch();
      };

      const useGeneric = async (): Promise<type62> => {
        const strData = await genericFetcher<string>('generic');
        const numData = await genericFetcher<number>(50);
        return { str: strData, num: numData };
      };
      const result = await useGeneric();
      expect(result.str).assertEqual('generic');
      expect(result.num).assertEqual(50);
    });

    /**
     * @tc.name   asyncFunctionTest063
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_063
     * @tc.desc   Async function with nested async in typed module-like object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const result = await asyncFunctionTest063();
      expect(result.name).assertEqual('test');
      expect(result.id).assertEqual(1);
    });

    /**
     * @tc.name   asyncFunctionTest064
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_064
     * @tc.desc   Async function with nested async that chains typed transformations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const transform1 = async (num: number): Promise<number> => {
        const nested = async (): Promise<number> => await Promise.resolve(num + 5);
        return await nested();
      };
      const transform2 = async (num: number): Promise<number> => {
        const nested = async (): Promise<number> => await Promise.resolve(num * 2);
        return await nested();
      };
      const transform3 = async (num: number): Promise<number> => {
        const nested = async (): Promise<number> => await Promise.resolve(num - 3);
        return await nested();
      };

      const chainTransforms = async (initial: number): Promise<number> => {
        return await transform3(await transform2(await transform1(initial)));
      };
      const result = await chainTransforms(4); // 4→9→18→15
      expect(result).assertEqual(15);
    });

    /**
     * @tc.name   asyncFunctionTest065
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_065
     * @tc.desc   Async function with nested async that validates typed input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const fetchInitialData = async (value?:number) => {
        return new Promise<number>(resolve => {
          setTimeout(() => {
            resolve(value?value:15); // Initial raw data
          }, 0);
        });
      };

      // Simulate async data transformation 1 (second link)
      const transformData1 = async (data:number) => {
        return new Promise<number>(resolve => {
          setTimeout(() => {
            resolve(data * 3); // Transform: multiply by 3
          }, 0);
        });
      };

      // Simulate async data transformation 2 (third link)
      const transformData2 = async (data:number) => {
        return new Promise<number>(resolve => {
          setTimeout(() => {
            resolve(data + 8); // Transform: add 8
          }, 0);
        });
      };

      // Execute async chain: fetch → transform1 → transform2
      const rawData = await fetchInitialData();
      const transformedData1 = await transformData1(rawData);
      const finalData = await transformData2(transformedData1);

      // Parallel chain with different initial value
      const rawData2 = await fetchInitialData(20);
      const transformedData2_2 = await transformData1(rawData2 || 20);
      const finalData2 = await transformData2(transformedData2_2);

      // Key assertions
      expect(rawData).assertEqual(15);
      expect(transformedData1).assertEqual(45); // 15 * 3 = 45
      expect(finalData).assertEqual(53); // 45 + 8 = 53

      expect(rawData2 || 20).assertEqual(20);
      expect(transformedData2_2).assertEqual(60); // 20 * 3 = 60
      expect(finalData2).assertEqual(68); // 60 + 8 = 68

      // Verify chain order and data consistency
      expect(transformedData1).assertEqual(rawData * 3);
      expect(finalData).assertEqual(transformedData1 + 8);
    });

    /**
     * @tc.name   asyncFunctionTest066
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_066
     * @tc.desc   Async function with nested async that uses typed enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      enum Status {
        Pending = 'pending',
        Success = 'success',
        Failed = 'failed'
      }

      const getStatus = async (isSuccess: boolean): Promise<Status> => {
        const nestedStatus = async (): Promise<Status> => {
          if (isSuccess) {
            return await Promise.resolve(Status.Success);
          }
          return await Promise.resolve(Status.Failed);
        };
        return await nestedStatus();
      };

      const checkStatus = async (isSuccess: boolean): Promise<boolean> => {
        const status = await getStatus(isSuccess);
        return status === Status.Success;
      };

      const result1 = await checkStatus(true);
      const result2 = await checkStatus(false);
      expect(result1).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.name   asyncFunctionTest067
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_067
     * @tc.desc   Async function with nested async that returns typed union
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      type UnionType = string | number | boolean;
      const getUnionData = async (type: 'str' | 'num' | 'bool'): Promise<UnionType> => {
        const nestedGet = async (): Promise<UnionType> => {
          switch (type) {
            case 'str':
              return await Promise.resolve('union');
            case 'num':
              return await Promise.resolve(10);
            case 'bool':
              return await Promise.resolve(true);
          }
        };
        return await nestedGet();
      };

      const processUnion = async (type: 'str' | 'num' | 'bool'): Promise<string> => {
        const data = await getUnionData(type);
        return typeof data;
      };

      const result1 = await processUnion('str');
      const result2 = await processUnion('num');
      const result3 = await processUnion('bool');
      expect(result1).assertEqual('string');
      expect(result2).assertEqual('number');
      expect(result3).assertEqual('boolean');
    });

    /**
     * @tc.name   asyncFunctionTest068
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_068
     * @tc.desc   Async function with nested async that handles typed readonly data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const result = await asyncFunctionTest068();
      expect(result.id).assertEqual(1);
      expect(result.name).assertEqual('modified');
    });

    /**
     * @tc.name   asyncFunctionTest069
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_069
     * @tc.desc   Async function with nested async that uses typed function overloads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Typed function overloads


      const useOverload = async (): Promise<[string, string]> => {
        const strResult = await formatData('test');
        const numResult = await formatData(5);
        return [strResult, numResult];
      };
      const res = await useOverload();
      expect(res[0]).assertEqual('TEST');
      expect(res[1]).assertEqual('005');
    });

    /**
     * @tc.name   asyncFunctionTest070
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_070
     * @tc.desc   Async function with nested async that processes typed array of objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      const initialVal = 28;
      const updateVal = 56;

      // Async function wrapping atomic store + load
      const asyncAtomicStoreLoad = async (val:number) => {
        return new Promise<number>(resolve => {
          setTimeout(() => {
            Atomics.store(ia, 0, val); // Atomic store: set new value
            const currentVal = Atomics.load(ia, 0); // Atomic load: get latest value
            resolve(currentVal);
          }, 0);
        });
      };

      // Execute async atomic operations (initial store + update store)
      const result1 = await asyncAtomicStoreLoad(initialVal);
      const result2 = await asyncAtomicStoreLoad(updateVal);

      // Key assertions
      expect(result1).assertEqual(initialVal); // Verify initial store/load result
      expect(result2).assertEqual(updateVal); // Verify update store/load result
      expect(Atomics.load(ia, 0)).assertEqual(updateVal); // Verify final memory consistency
    });

    /**
     * @tc.name   asyncFunctionTest071
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_071
     * @tc.desc   Async function with nested async that uses typed WeakMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const useWeakMapCache = async () => {
        const cache = new WeakMap<CacheKey, Promise<string>>();

        const getFromCache = async (key: CacheKey): Promise<string> => {
          if (cache.has(key)) {
            return await cache.get(key)!;
          }
          // Nested async to simulate data fetch
          const fetchData = async (): Promise<string> => await Promise.resolve(`data_${key.id}`);
          const data = fetchData();
          cache.set(key, data);
          return await data;
        };

        const key1: CacheKey = { id: 1 };
        const firstCall = await getFromCache(key1);
        const secondCall = await getFromCache(key1); // Should use cache
        return { firstCall, secondCall } as type71;
      };

      const res = await useWeakMapCache();
      expect(res.firstCall).assertEqual('data_1');
      expect(res.secondCall).assertEqual('data_1');
    });

    /**
     * @tc.name   asyncFunctionTest072
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_072
     * @tc.desc   Async function with nested async that validates typed date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const isFutureDate = async (date: Date): Promise<boolean> => {
        const nestedCheck = async (): Promise<boolean> => {
          const now = await Promise.resolve(new Date());
          return date > now;
        };
        return await nestedCheck();
      };

      const testDates = async (): Promise<[boolean, boolean]> => {
        const pastDate = new Date('2020-01-01');
        const futureDate = new Date(Date.now() + 86400000); // Next day
        return [await isFutureDate(pastDate), await isFutureDate(futureDate)];
      };

      const res = await testDates();
      expect(res[0]).assertEqual(false);
      expect(res[1]).assertEqual(true);
    });

    /**
     * @tc.name   asyncFunctionTest073
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_073
     * @tc.desc   Async function with nested async that uses typed generator return
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 10;

      const asyncAtomicAdd = async (addVal:number) => {
        return new Promise<number>(resolve => {
          setTimeout(() => {
            Atomics.add(ia, 0, addVal);
            resolve(Atomics.load(ia, 0));
          }, 0);
        });
      };

      const result1 = await asyncAtomicAdd(6);
      const result2 = await asyncAtomicAdd(9);

      expect(result1).assertEqual(16);
      expect(result2).assertEqual(25);
      expect(ia[0]).assertEqual(25);
    });

    /**
     * @tc.name   asyncFunctionTest074
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_074
     * @tc.desc   Async function with nested async that handles typed error objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      class CustomError extends Error {
        code: number;

        constructor(message: string, code: number) {
          super(message);
          this.code = code;
          this.name = 'CustomError';
        }
      }

      const throwCustomError = async (): Promise<never> => {
        const nestedThrow = async (): Promise<never> => {
          throw await Promise.resolve(new CustomError('custom issue', 400));
        };
        return await nestedThrow();
      };

      const catchCustomError = async (): Promise<number> => {
        try {
          await throwCustomError();
          return 0;
        } catch (err) {
          if (err instanceof CustomError) {
            return err.code;
          }
          return 500;
        }
      };

      const errorCode = await catchCustomError();
      expect(errorCode).assertEqual(400);
    });

    /**
     * @tc.name   asyncFunctionTest075
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_075
     * @tc.desc   Async function with nested async that uses typed Promise.withResolvers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0b1010; // Initial value (10 in decimal)

      // Async function wrapping atomic xor
      const asyncAtomicXor = async (xorVal:number) => {
        return new Promise<number>(resolve => {
          setTimeout(() => {
            const oldVal = Atomics.xor(ia, 0, xorVal);
            resolve(Atomics.load(ia, 0) );
          }, 0);
        });
      };

      // Execute async atomic operation (xor with 0b0111 = 7)
      const result = await asyncAtomicXor(7);

      // Key assertions (10 ^ 7 = 13 = 0b1101)
      expect(result).assertEqual(13); // Verify xor result
      expect(ia[0]).assertEqual(13); // Verify memory consistency
    });

    /**
     * @tc.name   asyncFunctionTest076
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_076
     * @tc.desc   Async function with nested async that processes typed tuple array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      type PointTuple = [number, number]; // [x, y]
      const calculateDistance = async (points: PointTuple[]): Promise<number[]> => {
        const nestedCalculate = async (point: PointTuple): Promise<number> => {
          const distance = Math.sqrt(point[0]**2 + point[1]**2);
          return await Promise.resolve(distance);
        };

        return Promise.all(points.map(point => nestedCalculate(point)));
      };

      const inputPoints: PointTuple[] = [[3, 4], [5, 12], [0, 0]];
      const distances = await calculateDistance(inputPoints);
      expect(distances[0]).assertEqual(5);
      expect(distances[1]).assertEqual(13);
      expect(distances[2]).assertEqual(0);
    });

    /**
     * @tc.name   asyncFunctionTest077
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_077
     * @tc.desc   Async function with nested async that uses typed ReadonlyArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sumReadonlyArray = async (arr: ReadonlyArray<number>): Promise<number> => {
        const nestedSum = async (): Promise<number> => {
          return await Promise.resolve(arr.reduce((a, b) => a + b, 0));
        };
        return await nestedSum();
      };

      const readonlyArr: ReadonlyArray<number> = [1, 2, 3, 4];
      // readonlyArr.push(5); // Would throw compile error (readonly)
      const result = await sumReadonlyArray(readonlyArr);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.name   asyncFunctionTest078
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_078
     * @tc.desc   Async function with nested async that handles typed nullable properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const getEmail = async (user: User): Promise<string> => {
        const nestedGet = async (): Promise<string> => {
          if (user.email == null) {
            return await Promise.resolve('no-email@example.com');
          }
          return await Promise.resolve(user.email);
        };
        return await nestedGet();
      };

      const user1: User = { id: 1, name: 'User 1' };
      const user2: User = { id: 2, name: 'User 2', email: null };
      const user3: User = { id: 3, name: 'User 3', email: 'user3@example.com' };

      const email1 = await getEmail(user1);
      const email2 = await getEmail(user2);
      const email3 = await getEmail(user3);

      expect(email1).assertEqual('no-email@example.com');
      expect(email2).assertEqual('no-email@example.com');
      expect(email3).assertEqual('user3@example.com');
    });

    /**
     * @tc.name   asyncFunctionTest079
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_079
     * @tc.desc   Async function with nested async that uses typed Record
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 42; // Initial value

      // Async function wrapping atomic exchange
      const asyncAtomicExchange = async (newVal:number) => {
        return new Promise<number>(resolve => {
          setTimeout(() => {
            const oldVal = Atomics.exchange(ia, 0, newVal);
            resolve(Atomics.load(ia, 0) );
          }, 0);
        });
      };

      // Execute async atomic operation
      const result = await asyncAtomicExchange(99);

      // Key assertions
      expect(result).assertEqual(99); // Verify updated value
      expect(ia[0]).assertEqual(99); // Verify memory consistency
    });

    /**
     * @tc.name   asyncFunctionTest080
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_080
     * @tc.desc   Async function with nested async that chains typed async validations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const validateUsername = async (username: string): Promise<boolean> => {
        return await Promise.resolve(username.length >= 3);
      };

      const validatePassword = async (password: string): Promise<boolean> => {
        return await Promise.resolve(password.length >= 6);
      };

      const validateForm = async (form: FormData): Promise<boolean> => {
        // Chain nested async validations (short-circuit on first failure)
        const isUsernameValid = await validateUsername(form.username);
        if (!isUsernameValid) {
          return false;
        }

        const isPasswordValid = await validatePassword(form.password);
        return isPasswordValid;
      };

      const validForm: FormData = { username: 'user', password: 'password123' };
      const invalidUserForm: FormData = { username: 'us', password: 'password123' };
      const invalidPwdForm: FormData = { username: 'user', password: 'pwd' };

      const result1 = await validateForm(validForm);
      const result2 = await validateForm(invalidUserForm);
      const result3 = await validateForm(invalidPwdForm);

      expect(result1).assertEqual(true);
      expect(result2).assertEqual(false);
      expect(result3).assertEqual(false);
    });

    /**
     * @tc.name   asyncFunctionTest081
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_081
     * @tc.desc   Async function with nested async that uses typed Promise.allSettled with filtering
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const fetchData = async (id: number): Promise<ApiResponse> => {
        if (id === 2) {
          throw new Error(`Fetch failed for id ${id}`);
        }
        return await Promise.resolve({ data: id * 10 } as ApiResponse);
      };

      const batchFetch = async (ids: number[]): Promise<number[]> => {
        const promises: Promise<ApiResponse>[] = ids.map(id => fetchData(id));
        const results = await Promise.allSettled(promises);

        // Filter and extract successful results
        return results
          .filter((res) => (res as PromiseFulfilledResult<ApiResponse>).status === 'fulfilled')
          .map(res => (res as PromiseFulfilledResult<ApiResponse>).value.data);
      };

      const result = await batchFetch([1, 2, 3]); // [10, (failed), 30]
      expect(result).assertDeepEquals([10, 30]);
    });

    /**
     * @tc.name   asyncFunctionTest082
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_082
     * @tc.desc   Async function with nested async that handles typed bigint values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const processBigInt = async (num: bigint): Promise<bigint> => {
        const nestedProcess = async (): Promise<bigint> => {
          const doubled = await Promise.resolve(num * 2n);
          return await Promise.resolve(doubled + 5n);
        };
        return await nestedProcess();
      };

      const input = 100n;
      const result = await processBigInt(input); // 100n*2n+5n=205n
      expect(result).assertEqual(205n);
      expect(typeof result).assertEqual('bigint');
    });

    /**
     * @tc.name   asyncFunctionTest083
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_083
     * @tc.desc   Async function with nested async that uses typed Set operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      type UniqueNumbers = Set<number>;
      const processSet = async (nums: number[]): Promise<type83> => {
        const nestedProcess = async (): Promise<UniqueNumbers> => {
          const uniqueSet = new Set(nums);
          return await Promise.resolve(uniqueSet);
        };

        const uniqueSet = await nestedProcess();
        return {
          size: uniqueSet.size,
          hasFive: uniqueSet.has(5)
        };
      };

      const input = [1, 2, 2, 3, 5, 5];
      const result = await processSet(input);
      expect(result.size).assertEqual(4);
      expect(result.hasFive).assertEqual(true);
    });

    /**
     * @tc.name   asyncFunctionTest084
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_084
     * @tc.desc   Async function with nested async that uses typed Map transformations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      type StringMap = Map<string, number>;
      const transformMap = async (map: StringMap): Promise<Map<string, string>> => {
        const nestedTransform = async (): Promise<Map<string, string>> => {
          const newMap = new Map<string, string>();
          map.forEach((val, key) => {
            newMap.set(key, val.toString());
          });
          return await Promise.resolve(newMap);
        };
        return await nestedTransform();
      };

      const inputMap = new Map<string, number>([['a', 1], ['b', 2]]);
      const resultMap = await transformMap(inputMap);

      expect(resultMap.get('a')).assertEqual('1');
      expect(resultMap.get('b')).assertEqual('2');
      expect(resultMap.size).assertEqual(2);
    });

    /**
     * @tc.name   asyncFunctionTest085
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_085
     * @tc.desc   Async function with nested async that validates typed enum values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      enum HttpMethod {
        GET = 'GET',
        POST = 'POST',
        PUT = 'PUT'
      }

      const isValidMethod = async (method: string): Promise<boolean> => {
        const nestedCheck = async (): Promise<boolean> => {
          return await Promise.resolve(Object.values(HttpMethod).includes(method as HttpMethod));
        };
        return await nestedCheck();
      };

      const result1 = await isValidMethod('GET');
      const result2 = await isValidMethod('DELETE');
      const result3 = await isValidMethod(HttpMethod.POST);

      expect(result1).assertEqual(true);
      expect(result2).assertEqual(false);
      expect(result3).assertEqual(true);
    });

    /**
     * @tc.name   asyncFunctionTest086
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_086
     * @tc.desc   Async function with nested async that uses typed Promise.race with timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const asyncTask = async (taskId:number, delayMs:number) => {
        return new Promise<type86>(resolve => {
          setTimeout(() => {
            const result = taskId * 10; // Simple task logic
            resolve({ taskId:taskId, result :result} as type86);
          }, delayMs);
        });
      };

      // Execute multiple async tasks in parallel using Promise.all
      const parallelTasks = [
        asyncTask(1, 20),  // Task 1: delay 20ms, result = 10
        asyncTask(2, 10),  // Task 2: delay 10ms, result = 20
        asyncTask(3, 30)   // Task 3: delay 30ms, result = 30
      ];

      // Aggregate parallel results
      const results = await Promise.all(parallelTasks);
      const aggregatedSum = results.reduce((sum, item) => sum + item.result, 0);

      // Key assertions
      // Verify number of completed tasks
      expect(results.length).assertEqual(3);

      // Verify individual task results
      expect(results.find(r => r.taskId === 1)?.result).assertEqual(10);
      expect(results.find(r => r.taskId === 2)?.result).assertEqual(20);
      expect(results.find(r => r.taskId === 3)?.result).assertEqual(30);

      // Verify aggregated result
      expect(aggregatedSum).assertEqual(60); // 10 + 20 + 30 = 60

      // Verify parallel execution (all tasks complete regardless of delay order)
      const taskIds = results.map(r => r.taskId).sort();
      expect(taskIds).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   asyncFunctionTest087
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_087
     * @tc.desc   Async function with nested async that processes typed optional chaining
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let res = await asyncFunctionTest087()

      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   asyncFunctionTest088
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_088
     * @tc.desc   Async function with nested async that uses typed nullish coalescing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const getDefaultValue = async (value: string | null | undefined): Promise<string> => {
        const nestedGet = async (): Promise<string> => {
          const result = value ?? 'default';
          return await Promise.resolve(result);
        };
        return await nestedGet();
      };

      const result1 = await getDefaultValue('test');
      const result2 = await getDefaultValue(null);
      const result3 = await getDefaultValue(undefined);
      const result4 = await getDefaultValue(''); // Empty string is not nullish

      expect(result1).assertEqual('test');
      expect(result2).assertEqual('default');
      expect(result3).assertEqual('default');
      expect(result4).assertEqual('');
    });

    /**
     * @tc.name   asyncFunctionTest089
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_089
     * @tc.desc   Async function with nested async that uses typed class with async methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const result = await asyncFunctionTest089();
      expect(result.length).assertEqual(1);
      expect(result.item).assertEqual('item1');
    });

    /**
     * @tc.name   asyncFunctionTest090
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_090
     * @tc.desc   Async function with nested async that uses typed function composition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const result = await asyncFunctionTest090();

      expect(result).assertEqual(16);
    });

    /**
     * @tc.name   asyncFunctionTest091
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_091
     * @tc.desc   Async function with nested async that uses typed generator composition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const result: number[] = await asyncFunctionTest091();
      expect(result).assertDeepEquals([1, 2, 3, 4]);
    });

    /**
     * @tc.name   asyncFunctionTest092
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_092
     * @tc.desc   Async function with nested async arrow function and BigInt return
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const calculateBigInt = async (a: bigint, b: bigint): Promise<bigint> => {
        const nestedAdd = async (x: bigint, y: bigint): Promise<bigint> => x + y;
        const nestedXor = async (x: bigint, y: bigint): Promise<bigint> => x ^ y;
        const sum = await nestedAdd(a, b);
        return nestedXor(sum, 15n);
      };
      const result = await calculateBigInt(23n, 47n);
      expect(result).assertEqual((23n + 47n) ^ 15n); // 70n ^ 15n = 63n
    });

    /**
     * @tc.name   asyncFunctionTest093
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_093
     * @tc.desc   Async function handling Promise.allSettled with mixed results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const processTasks = async (): Promise<type93> => {
        const tasks = [
          Promise.resolve(10),
          Promise.reject(new Error('test err')),
          Promise.resolve(20),
          Promise.reject(new Error('another err'))
        ];
        const results = await Promise.allSettled(tasks);
        return {
          success: results.filter(res => res.status === 'fulfilled').length,
          failed: results.filter(res => res.status === 'rejected').length
        };
      };
      const result = await processTasks();
      expect(result.success).assertEqual(2);
      expect(result.failed).assertEqual(2);
    });

    /**
     * @tc.name   asyncFunctionTest094
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_094
     * @tc.desc   Async function with closure state tracking async calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const createCounter = () => {
        let callCount = 0;
        const asyncIncrement = async (step: number): Promise<number> => {
          callCount++;
          return new Promise(resolve => setTimeout(() => resolve(callCount * step), 5));
        };
        return { asyncIncrement, getCount: () => callCount } as type94;
      };
      const res = createCounter();
      const res1 = await res.asyncIncrement(2);
      const res2 = await res.asyncIncrement(3);
      expect(res1).assertEqual(2); // 1 * 2
      expect(res2).assertEqual(6); // 2 * 3
      expect(res.getCount()).assertEqual(2);
    });

    /**
     * @tc.name   asyncFunctionTest095
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_095
     * @tc.desc   Async function returning Promise.race between value and timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const raceTasks = async <T>(value: T, timeoutMs: number): Promise<T | 'timeout'> => {
        const valueTask = new Promise<T>(resolve => setTimeout(() => resolve(value), timeoutMs * 2));
        const timeoutTask = new Promise<'timeout'>(resolve => setTimeout(() => resolve('timeout'), timeoutMs));
        return Promise.race([valueTask, timeoutTask]);
      };
      const result1 = await raceTasks('success', 10);
      const result2 = await raceTasks('late', 20);
      expect(result1).assertEqual('timeout');
      expect(result2).assertEqual('timeout');
    });

    /**
     * @tc.name   asyncFunctionTest096
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_096
     * @tc.desc   Async function with generic type and object transformation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Simulate async data fetch operation
      const fetchData = async (delayMs:number, data:number) => {
        return new Promise<number>(resolve => {
          setTimeout(() => {
            resolve(data); // Resolve with target data after delay
          }, delayMs);
        });
      };

      // Simulate async data processing operation
      const processData = async (input:number) => {
        return new Promise<number>(resolve => {
          setTimeout(() => {
            const processed = input * 2 + 3; // Simple processing logic
            resolve(processed);
          }, 10);
        });
      };

      // Execute async operations in sequence
      const rawData1 = await fetchData(0, 7);
      const processedData1 = await processData(rawData1);

      const rawData2 = await fetchData(0, 12);
      const processedData2 = await processData(rawData2);

      // Key assertions
      expect(rawData1).assertEqual(7);
      expect(processedData1).assertEqual(17); // 7*2+3=17

      expect(rawData2).assertEqual(12);
      expect(processedData2).assertEqual(27); // 12*2+3=27

      // Verify independent execution of async operations
      expect(rawData1 !== rawData2).assertEqual(true);
      expect(processedData1 !== processedData2).assertEqual(true);
    });

    /**
     * @tc.name   asyncFunctionTest097
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_097
     * @tc.desc   Async function handling error recovery with retry logic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 10; // 初始值

      const asyncAtomicAdd = async () => {
        // 异步执行原子操作（模拟实际异步场景）
        return new Promise<number>(resolve => {
          setTimeout(() => {
            Atomics.add(ia, 0, 5); // 原子+5
            resolve(Atomics.load(ia, 0)); // 返回最新值
          }, 0);
        });
      };

      const result = await asyncAtomicAdd();

      expect(result).assertEqual(15); // 异步执行结果正确
      expect(ia[0]).assertEqual(15); // 内存中值与异步返回结果一致
    });

    /**
     * @tc.name   asyncFunctionTest098
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_098
     * @tc.desc   Async function with nested Promise chain and type coercion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const processValue = async (initial: string): Promise<number> => {
        return Promise.resolve(initial)
          .then((val:string) => val.length)
          .then((len:number) => len * 3)
          .then((num:number) => new Promise<number>(resolve => setTimeout(() => resolve(num + 7), 3)))
          .then((final:number) => final >>> 0); // Coerce to unsigned 32-bit
      };
      const result = await processValue('typescript');
      expect(result).assertEqual((10 * 3) + 7); // 37
    });

    /**
     * @tc.name   asyncFunctionTest099
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_099
     * @tc.desc   Async function returning async generator and consuming with for await...of
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const result = await asyncFunctionTest099();
      expect(result).assertDeepEquals([0, 3, 6, 9]);
    });

    /**
     * @tc.name   asyncFunctionTest100
     * @tc.number SUB_BUILTINS_asyncFunction_TEST_100
     * @tc.desc   Complex async function workflow: validate → process → finalize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFunctionTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const workflow = async (dataList: Data[]): Promise<type100> => {
        // Step 1: Validate
        const validate = async (data: Data): Promise<boolean> => {
          return new Promise(resolve => setTimeout(() => resolve(data.id > 0 && data.value.length > 0), 4));
        };
        const validations = await Promise.all(dataList.map(validate));
        const validData = dataList.filter((_, idx) => validations[idx]);

        // Step 2: Process
        const process = async (data: Data): Promise<string> => {
          return new Promise(resolve => setTimeout(() => resolve(`${data.id}-${data.value.toUpperCase()}`), 3));
        };
        const processed = await Promise.all(validData.map(process));

        // Step 3: Finalize
        return { valid: validData, processed, count: processed.length };
      };

      const input: Data[] = [
        { id: 1, value: 'test' },
        { id: -2, value: 'invalid' },
        { id: 3, value: 'demo' },
        { id: 4, value: '' }
      ];
      const result = await workflow(input);
      expect(result.valid).assertDeepEquals([{ id: 1, value: 'test' }, { id: 3, value: 'demo' }]);
      expect(result.processed).assertDeepEquals(['1-TEST', '3-DEMO']);
      expect(result.count).assertEqual(2);
    });
  })
}