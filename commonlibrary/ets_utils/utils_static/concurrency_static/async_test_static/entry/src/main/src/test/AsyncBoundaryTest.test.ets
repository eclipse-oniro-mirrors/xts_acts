'use static'
import { afterEach, describe, expect, it, Level, Size, TestType } from '../../../hypium';
import {sleep} from './Utils.test';

class NestedObject {
  public value: number = 0;
  public next?: NestedObject;
}

async function level10(depth: int): Promise<number>{
  if (depth === 0) {
    return 1.0;
  }
  const result: number = await level10(depth - 1);
  return result + 1;
};
async function createNested (depth: int): Promise<NestedObject>  {
  if (depth === 0) {
    const obj: NestedObject = new NestedObject();
    obj.value = depth;
    return obj;
  }
  const nested = await createNested(depth - 1);
  const obj: NestedObject = new NestedObject();
  obj.value = depth;
  obj.next = nested;
  return obj;
};

async function  deepError(depth: int): Promise<number> {
  if (depth === 5) {
    throw new Error(`Error at depth ${depth}`);
  }
  return await deepError(depth - 1);
};

async function  recursiveChain (depth: int): Promise<number> {
  if (depth === 0) {
    return 0.0;
  }
  const prev = await Promise.resolve(depth);
  return prev + await recursiveChain(depth - 1);
};



export default function asyncBoundaryTest() {
  describe('asyncBoundaryTest', () => {
    afterEach(async () => {
      await sleep(50)
    })

    /**
     * @tc.name   asyncBoundaryTest001
     * @tc.number SUB_BUILTINS_asyncBoundary_TEST_001
     * @tc.desc   Test deep async nesting (10 levels)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncBoundaryTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await level10(10);
      expect(result).assertEqual(11);
    });

    /**
     * @tc.name   asyncBoundaryTest002
     * @tc.number SUB_BUILTINS_asyncBoundary_TEST_002
     * @tc.desc   Test async function with very large array processing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncBoundaryTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const largeArray = async (): Promise<number[]> => {
        const arr: number[] = [];
        for (let i: int = 0; i < 10000; i++) {
          arr.push(i);
        }
        return arr;
      };

      const result = await largeArray();
      expect(result.length).assertEqual(10000);
      expect(result[0]).assertEqual(0);
      expect(result[9999]).assertEqual(9999);
    });

    /**
     * @tc.name   asyncBoundaryTest003
     * @tc.number SUB_BUILTINS_asyncBoundary_TEST_003
     * @tc.desc   Test async function with concurrent promise execution (100 concurrent)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncBoundaryTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const concurrent = async (): Promise<int[]> => {
        const promises: Promise<int>[] = [];
        for (let i: int = 0; i < 100; i++) {
          promises.push(Promise.resolve(i));
        }
        return await Promise.all(promises);
      };

      const result = await concurrent();
      expect(result.length).assertEqual(100);
    });

    /**
     * @tc.name   asyncBoundaryTest004
     * @tc.number SUB_BUILTINS_asyncBoundary_TEST_004
     * @tc.desc   Test async function with multiple sequential awaits (50 awaits)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncBoundaryTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const manyAwaits = async (): Promise<number> => {
        let sum: number = 0;
        for (let i: int = 0; i < 50; i++) {
          const val: number = await Promise.resolve(i);
          sum += val;
        }
        return sum;
      };

      const result = await manyAwaits();
      expect(result).assertEqual(1225); // 0+1+2+...+49 = 1225
    });

    /**
     * @tc.name   asyncBoundaryTest005
     * @tc.number SUB_BUILTINS_asyncBoundary_TEST_005
     * @tc.desc   Test async function error at deep nesting level
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncBoundaryTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let caughtError: Error | undefined;
      try {
        await deepError(10);
      } catch (err) {
        caughtError = err as Error;
      }

      expect(caughtError !== undefined).assertTrue();
      expect(caughtError!.message).assertEqual('Error at depth 5');
    });

    /**
     * @tc.name   asyncBoundaryTest006
     * @tc.number SUB_BUILTINS_asyncBoundary_TEST_006
     * @tc.desc   Test async function with rapid re-execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncBoundaryTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let counter: int = 0;
      const rapidCall = async (): Promise<int> => {
        counter++;
        await Promise.resolve();
        return counter;
      };

      const results = await Promise.all([
        rapidCall(),
        rapidCall(),
        rapidCall(),
        rapidCall(),
        rapidCall()
      ]);

      expect(results.length).assertEqual(5);
      expect(results).assertDeepEquals([5, 5, 5, 5, 5]);
    });

    /**
     * @tc.name   asyncBoundaryTest007
     * @tc.number SUB_BUILTINS_asyncBoundary_TEST_007
     * @tc.desc   Test async function with very long string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncBoundaryTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const longString = async (): Promise<string> => {
        return 'a'.repeat(10000);
      };

      const result = await longString();
      expect(result.length).assertEqual(10000);
    });

    /**
     * @tc.name   asyncBoundaryTest008
     * @tc.number SUB_BUILTINS_asyncBoundary_TEST_008
     * @tc.desc   Test async function with deeply nested object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncBoundaryTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await createNested(20);
      let current: NestedObject | undefined = result;
      let count: int = 0;

      while (current) {
        count++;
        current = current?.next;
      }

      expect(count).assertEqual(21);
    });

    /**
     * @tc.name   asyncBoundaryTest009
     * @tc.number SUB_BUILTINS_asyncBoundary_TEST_009
     * @tc.desc   Test async function with mixed error types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncBoundaryTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      // ArkTS 只允许抛出 Error 类型
      const throwString = async (): Promise<never> => {
        throw new Error('string error');
      };

      const throwNumber = async (): Promise<never> => {
        throw new Error('123');
      };

      const throwObject = async (): Promise<never> => {
        throw new Error('object error');
      };

      let errorsCaught: int = 0;

      try {
        await throwString();
      } catch (e) {
        errorsCaught++;
      }

      try {
        await throwNumber();
      } catch (e) {
        errorsCaught++;
      }

      try {
        await throwObject();
      } catch (e) {
        errorsCaught++;
      }

      expect(errorsCaught).assertEqual(3);
    });

    /**
     * @tc.name   asyncBoundaryTest010
     * @tc.number SUB_BUILTINS_asyncBoundary_TEST_010
     * @tc.desc   Test async function with cyclic promise chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncBoundaryTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const chainPromise = async (count: number): Promise<int> => {
        let promise = Promise.resolve(0);
        for (let i: int = 0; i < count; i++) {
          promise = promise.then(val => val + 1);
        }
        return await promise;
      };

      const result = await chainPromise(100);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.name   asyncBoundaryTest012
     * @tc.number SUB_BUILTINS_asyncBoundary_TEST_012
     * @tc.desc   Test async function with promise rejection in Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncBoundaryTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mixedPromises = async (): Promise<Array<int|never>> => {
        const promises = [
          Promise.resolve(1),
          Promise.reject(new Error('failure')),
          Promise.resolve(3)
        ];

        try {
          return await Promise.all(promises);
        } catch (err) {
          return [0];
        }
      };

      const result = await mixedPromises();
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.name   asyncBoundaryTest013
     * @tc.number SUB_BUILTINS_asyncBoundary_TEST_013
     * @tc.desc   Test async function memory cleanup with many promises
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncBoundaryTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const memoryTest = async (): Promise<int[]> => {
        const promises: Promise<int>[] = [];
        for (let i: int = 0; i < 100; i++) {
          promises.push(Promise.resolve(i));
        }
        return await Promise.all(promises);
      };

      const result = await memoryTest();
      expect(result.length).assertEqual(100);
      expect(result[0]).assertEqual(0);
      expect(result[99]).assertEqual(99);
    });

    /**
     * @tc.name   asyncBoundaryTest014
     * @tc.number SUB_BUILTINS_asyncBoundary_TEST_014
     * @tc.desc   Test async function with recursive Promise chains
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncBoundaryTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await recursiveChain(50);
      expect(result).assertEqual(1275); // 50+49+...+1 = 1275
    });

    /**
     * @tc.name   asyncBoundaryTest016
     * @tc.number SUB_BUILTINS_asyncBoundary_TEST_016
     * @tc.desc   Test async function with interleaved await and sync operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncBoundaryTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const interleaved = async (): Promise<number[]> => {
        const results: number[] = [];

        for (let i: int = 0; i < 10; i++) {
          results.push(i); // sync
          const val = await Promise.resolve(i * 2);
          results.push(val); // async
        }

        return results;
      };

      const result = await interleaved();
      expect(result.length).assertEqual(20);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[18]).assertEqual(9);
      expect(result[19]).assertEqual(18);
    });

    /**
     * @tc.name   asyncBoundaryTest017
     * @tc.number SUB_BUILTINS_asyncBoundary_TEST_017
     * @tc.desc   Test async function with immediate resolution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asyncBoundaryTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const immediate = async (): Promise<int> => {
        return Promise.resolve().then(() => 42);
      };

      const result = await immediate();
      expect(result).assertEqual(42);
    });

    /**
     * @tc.name   asyncBoundaryTest018
     * @tc.number SUB_BUILTINS_asyncBoundary_TEST_018
     * @tc.desc   Test async function with multiple return paths
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncBoundaryTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const multiReturn = async (condition: number): Promise<string> => {
        if (condition === 1) {
          return 'one';
        } else if (condition === 2) {
          return await Promise.resolve('two');
        } else {
          const val = await Promise.resolve('three');
          return val;
        }
      };

      const r1 = await multiReturn(1);
      const r2 = await multiReturn(2);
      const r3 = await multiReturn(3);

      expect(r1).assertEqual('one');
      expect(r2).assertEqual('two');
      expect(r3).assertEqual('three');
    });
  });
}
