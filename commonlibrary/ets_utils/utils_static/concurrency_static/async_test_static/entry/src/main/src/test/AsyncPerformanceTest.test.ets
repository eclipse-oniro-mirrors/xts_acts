'use static'
import { afterEach, describe, expect, it, Level, Size, TestType } from '../../../hypium';
import {sleep} from './Utils.test';
class DataObject {
  public id: number = 0;
  public value: string = '';
  public timestamp: number = 0;
}
async function  asyncRecursion  (n: int): Promise<int>  {
  if (n <= 1) {
    return 1;
  }
  const prev1: int = await asyncRecursion(n - 1);
  const prev2: int = await asyncRecursion(n - 2);
  return prev1 + prev2;
};



export default function asyncPerformanceTest() {
  describe('asyncPerformanceTest', () => {
    afterEach(async () => {
      await sleep(50)
    })

    /**
     * @tc.name   asyncPerformanceTest002
     * @tc.number SUB_BUILTINS_asyncPerformance_TEST_002
     * @tc.desc   Test sequential async operations (100 operations)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncPerformanceTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sequential = async (): Promise<number> => {
        let sum: number = 0;
        for (let i: int = 0; i < 100; i++) {
          const val: number = await Promise.resolve(i);
          sum += val;
        }
        return sum;
      };

      const result = await sequential();
      expect(result).assertEqual(4950); // 0+1+...+99
    });

    /**
     * @tc.name   asyncPerformanceTest003
     * @tc.number SUB_BUILTINS_asyncPerformance_TEST_003
     * @tc.desc   Test memory efficiency with many async operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncPerformanceTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const memoryEfficient = async (): Promise<number[]> => {
        const batchSize: int = 100;
        const results: number[] = [];

        for (let batch: int = 0; batch < 10; batch++) {
          const batchPromises: Promise<int>[] = [];
          for (let i: int = 0; i < batchSize; i++) {
            batchPromises.push(Promise.resolve(batch * batchSize + i));
          }
          const batchResults = await Promise.all(batchPromises);
          results.push(...batchResults);
        }

        return results;
      };

      const result = await memoryEfficient();
      expect(result.length).assertEqual(1000);
      expect(result[0]).assertEqual(0);
      expect(result[999]).assertEqual(999);
    });

    /**
     * @tc.name   asyncPerformanceTest004
     * @tc.number SUB_BUILTINS_asyncPerformance_TEST_004
     * @tc.desc   Test rapid async function creation and execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncPerformanceTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const rapidCreation = async (): Promise<int[]> => {
        const promises: Promise<int>[] = [];

        for (let i: int = 0; i < 500; i++) {
          const asyncFn = async (val: int): Promise<int> => {
            return val * 2;
          };
          promises.push(asyncFn(i));
        }

        return await Promise.all(promises);
      };

      const result = await rapidCreation();
      expect(result.length).assertEqual(500);
      expect(result[0]).assertEqual(0);
      expect(result[499]).assertEqual(998);
    });

    /**
     * @tc.name   asyncPerformanceTest005
     * @tc.number SUB_BUILTINS_asyncPerformance_TEST_005
     * @tc.desc   Test promise chain performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncPerformanceTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const chainPerformance = async (): Promise<int> => {
        let promise = Promise.resolve(0);

        for (let i: int = 0; i < 200; i++) {
          promise = promise.then(val => val + 1);
        }

        return await promise;
      };

      const result = await chainPerformance();
      expect(result).assertEqual(200);
    });

    /**
     * @tc.name   asyncPerformanceTest007
     * @tc.number SUB_BUILTINS_asyncPerformance_TEST_007
     * @tc.desc   Test async function with complex object processing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncPerformanceTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const objectProcessing = async (): Promise<DataObject[]> => {
        const objects: DataObject[] = [];

        for (let i: int = 0; i < 1000; i++) {
          const obj: DataObject = new DataObject();
          obj.id = i;
          obj.value = `value-${i}`;
          obj.timestamp = Date.now();
          objects.push(obj);
        }

        return objects;
      };

      const result = await objectProcessing();
      expect(result.length).assertEqual(1000);
      expect(result[0].id).assertEqual(0);
      expect(result[999].id).assertEqual(999);
    });

    /**
     * @tc.name   asyncPerformanceTest008
     * @tc.number SUB_BUILTINS_asyncPerformance_TEST_008
     * @tc.desc   Test concurrent async iterators processing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncPerformanceTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const iteratorProcessing = async (): Promise<number> => {
        // 不使用生成器函数，返回数组
        const generateNumbers = async (count: number): Promise<number[]> => {
          const results: number[] = [];
          for (let i: int = 0; i < count; i++) {
            results.push(i);
          }
          return results;
        };

        const numbers = await generateNumbers(100);
        let sum: number = 0;
        for (let i: int = 0; i < numbers.length; i++) {
          sum += numbers[i];
        }

        return sum;
      };

      const result = await iteratorProcessing();
      expect(result).assertEqual(4950); // 0+1+...+99
    });

    /**
     * @tc.name   asyncPerformanceTest009
     * @tc.number SUB_BUILTINS_asyncPerformance_TEST_009
     * @tc.desc   Test async function execution order consistency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncPerformanceTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const executionOrder = async (): Promise<number[]> => {
        const order: number[] = [];

        const task1 = async () => {
          order.push(1);
          await Promise.resolve();
          order.push(2);
        };

        const task2 = async () => {
          order.push(3);
          await Promise.resolve();
          order.push(4);
        };

        await Promise.all([task1(), task2()]);
        return order;
      };

      const result = await executionOrder();
      expect(result.length).assertEqual(4);
      expect(result).assertContain(1);
      expect(result).assertContain(2);
      expect(result).assertContain(3);
      expect(result).assertContain(4);
    });

    /**
     * @tc.name   asyncPerformanceTest010
     * @tc.number SUB_BUILTINS_asyncPerformance_TEST_010
     * @tc.desc   Test async function with error handling overhead
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncPerformanceTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const errorHandlingOverhead = async (): Promise<number> => {
        let successCount: number = 0;

        for (let i: int = 0; i < 100; i++) {
          try {
            if (i % 2 === 0) {
              await Promise.resolve(i);
              successCount++;
            } else {
              await Promise.reject(new Error('test'));
            }
          } catch (err) {
            // Expected error for odd numbers
          }
        }

        return successCount;
      };

      const result = await errorHandlingOverhead();
      expect(result).assertEqual(50); // Even numbers succeed
    });

    /**
     * @tc.name   asyncPerformanceTest011
     * @tc.number SUB_BUILTINS_asyncPerformance_TEST_011
     * @tc.desc   Test async function with conditional branching
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncPerformanceTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const conditionalBranching = async (): Promise<number[]> => {
        const results: number[] = [];

        for (let i: int = 0; i < 100; i++) {
          if (i % 3 === 0) {
            const val = await Promise.resolve(i);
            results.push(val);
          } else if (i % 3 === 1) {
            const val = await Promise.resolve(i * 2);
            results.push(val);
          } else {
            const val = await Promise.resolve(i * 3);
            results.push(val);
          }
        }

        return results;
      };

      const result = await conditionalBranching();
      expect(result.length).assertEqual(100);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(6);
    });

    /**
     * @tc.name   asyncPerformanceTest012
     * @tc.number SUB_BUILTINS_asyncPerformance_TEST_012
     * @tc.desc   Test async function closure creation overhead
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncPerformanceTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const closureOverhead = async (): Promise<int[]> => {
        const results: int[] = [];

        for (let i: int = 0; i < 200; i++) {
          const closure = async (val: int): Promise<int> => {
            const captured: int = val;
            return captured * 2;
          };
          results.push(await closure(i));
        }

        return results;
      };

      const result = await closureOverhead();
      expect(result.length).assertEqual(200);
      expect(result[0]).assertEqual(0);
      expect(result[199]).assertEqual(398);
    });

    /**
     * @tc.name   asyncPerformanceTest013
     * @tc.number SUB_BUILTINS_asyncPerformance_TEST_013
     * @tc.desc   Test async function with promise recycling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncPerformanceTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const promiseRecycling = async (): Promise<int> => {
        const reusablePromise = Promise.resolve(42);

        const results = await Promise.all([
          reusablePromise,
          reusablePromise,
          reusablePromise,
          reusablePromise,
          reusablePromise
        ]);

        return results.reduce((sum, val) => sum + val, 0);
      };

      const result = await promiseRecycling();
      expect(result).assertEqual(210); // 42 * 5
    });

    /**
     * @tc.name   asyncPerformanceTest014
     * @tc.number SUB_BUILTINS_asyncPerformance_TEST_014
     * @tc.desc   Test async function with nested Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncPerformanceTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const nestedPromiseAll = async (): Promise<int> => {
        const level1 = await Promise.all([
          Promise.all([Promise.resolve(1), Promise.resolve(2)]),
          Promise.all([Promise.resolve(3), Promise.resolve(4)])
        ]);

        return level1.reduce((sum: int, group) => {
          return sum + (group as int[]).reduce((s, v) => s + v, 0);
        }, 0);
      };

      const result = await nestedPromiseAll();
      expect(result).assertEqual(10); // 1+2+3+4
    });

    /**
     * @tc.name   asyncPerformanceTest015
     * @tc.number SUB_BUILTINS_asyncPerformance_TEST_015
     * @tc.desc   Test async function state management
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncPerformanceTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stateManagement = async (): Promise<string> => {
        let state = 'initial';

        const updateState = async (newState: string): Promise<void> => {
          state = newState;
          await Promise.resolve();
        };

        await updateState('processing');
        await updateState('completed');

        return state;
      };

      const result = await stateManagement();
      expect(result).assertEqual('completed');
    });

    /**
     * @tc.name   asyncPerformanceTest016
     * @tc.number SUB_BUILTINS_asyncPerformance_TEST_016
     * @tc.desc   Test async function with array operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncPerformanceTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arrayOperations = async (): Promise<int[]> => {
        const arr = await Promise.resolve([1, 2, 3, 4, 5]);

        const mapped = await Promise.resolve(
          arr.map((x: int) => x * 2)
        );

        const filtered = await Promise.resolve(
          mapped.filter(x => x > 4)
        );

        return filtered;
      };

      const result = await arrayOperations();
      expect(result).assertDeepEquals([6, 8, 10]);
    });

    /**
     * @tc.name   asyncPerformanceTest017
     * @tc.number SUB_BUILTINS_asyncPerformance_TEST_017
     * @tc.desc   Test async function with async recursion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncPerformanceTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await asyncRecursion(10);
      expect(result).assertEqual(89); // 10th Fibonacci number
    });

    /**
     * @tc.name   asyncPerformanceTest018
     * @tc.number SUB_BUILTINS_asyncPerformance_TEST_018
     * @tc.desc   Test async function batching
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncPerformanceTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const batching = async (): Promise<number[]> => {
        const allItems: number[] = [];
        const batchSize: int = 10;

        for (let batch: int = 0; batch < 10; batch++) {
          const batchItems: number[] = [];
          for (let i: int = 0; i < batchSize; i++) {
            batchItems.push(batch * batchSize + i);
          }
          const processed = await Promise.all(
            batchItems.map(x => Promise.resolve(x))
          );
          allItems.push(...processed);
        }

        return allItems;
      };

      const result = await batching();
      expect(result.length).assertEqual(100);
      expect(result[0]).assertEqual(0);
      expect(result[99]).assertEqual(99);
    });

    /**
     * @tc.name   asyncPerformanceTest020
     * @tc.number SUB_BUILTINS_asyncPerformance_TEST_020
     * @tc.desc   Test async function resource cleanup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncPerformanceTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const resourceCleanup = async (): Promise<int> => {
        const resources: int[] = [];

        try {
          for (let i: int = 0; i < 100; i++) {
            resources.push(i);
            await Promise.resolve();
          }
          return resources.length;
        } finally {
          resources.length = 0; // Cleanup
        }
      };

      const result = await resourceCleanup();
      expect(result).assertEqual(100);
    });
  });
}
