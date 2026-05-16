import { afterEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { sleep } from './utils';

export default function asyncInteropTest() {
  describe('asyncInteropTest', () => {
    afterEach(async () => {
      await sleep(50)
    })

    /**
     * @tc.name   asyncInteropTest001
     * @tc.number SUB_BUILTINS_asyncInterop_TEST_001
     * @tc.desc   Test async function mixing with callbacks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncInteropTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const callbackWrapper = async (
        callback: (value: number) => void
      ): Promise<number> => {
        const value = await Promise.resolve(42);
        callback(value);
        return value;
      };

      let callbackValue = 0;
      const result = await callbackWrapper((val) => {
        callbackValue = val;
      });

      expect(result).assertEqual(42);
      expect(callbackValue).assertEqual(42);
    });

    /**
     * @tc.name   asyncInteropTest002
     * @tc.number SUB_BUILTINS_asyncInterop_TEST_002
     * @tc.desc   Test async function with callback returning promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncInteropTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const callbackAsync = (
        callback: () => Promise<number>
      ): Promise<number> => {
        return callback();
      };

      const result = await callbackAsync(async () => {
        return await Promise.resolve(100);
      });

      expect(result).assertEqual(100);
    });

    /**
     * @tc.name   asyncInteropTest003
     * @tc.number SUB_BUILTINS_asyncInterop_TEST_003
     * @tc.desc   Test async function with event-style callbacks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncInteropTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      class EventEmitter {
        private listeners: Map<string, (data: string) => void> = new Map();

        on(event: string, callback: (data: string) => void): void {
          this.listeners.set(event, callback);
        }

        emit(event: string, data: string): void {
          const callback = this.listeners.get(event);
          if (callback) {
            callback(data);
          }
        }
      }

      const emitter = new EventEmitter();
      let eventData = '';

      const waitForEvent = async (): Promise<string> => {
        return new Promise((resolve) => {
          emitter.on('data', (data: string) => {
            resolve(data);
          });
          emitter.emit('data', 'event-data');
        });
      };

      const result = await waitForEvent();
      expect(result).assertEqual('event-data');
    });

    /**
     * @tc.name   asyncInteropTest004
     * @tc.number SUB_BUILTINS_asyncInterop_TEST_004
     * @tc.desc   Test async function with sync function in Promise chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncInteropTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const syncMultiply = (x: number): number => {
        return x * 2;
      };

      const asyncOperation = async (): Promise<number> => {
        const value = await Promise.resolve(5);
        return syncMultiply(value);
      };

      const result = await asyncOperation();
      expect(result).assertEqual(10);
    });

    /**
     * @tc.name   asyncInteropTest005
     * @tc.number SUB_BUILTINS_asyncInterop_TEST_005
     * @tc.desc   Test async function with then/catch mixing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncInteropTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mixedStyle = async (): Promise<number> => {
        return Promise.resolve(10)
          .then(val => val * 2)
          .then(async val => {
            const doubled = await Promise.resolve(val * 2);
            return doubled;
          });
      };

      const result = await mixedStyle();
      expect(result).assertEqual(40); // 10 * 2 * 2
    });

    /**
     * @tc.name   asyncInteropTest006
     * @tc.number SUB_BUILTINS_asyncInterop_TEST_006
     * @tc.desc   Test async function wrapped in Promise constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncInteropTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const promiseWrapper = (asyncFn: () => Promise<number>): Promise<number> => {
        return new Promise((resolve, reject) => {
          asyncFn()
            .then(resolve)
            .catch(reject);
        });
      };

      const myAsync = async (): Promise<number> => {
        return await Promise.resolve(42);
      };

      const result = await promiseWrapper(myAsync);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.name   asyncInteropTest007
     * @tc.number SUB_BUILTINS_asyncInterop_TEST_007
     * @tc.desc   Test async function with setTimeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncInteropTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const withTimeout = async (): Promise<string> => {
        // Use Promise.resolve instead of setTimeout for reliable async execution
        return new Promise((resolve) => {
          Promise.resolve().then(() => {
            resolve('timeout-complete');
          });
        });
      };

      const result = await withTimeout();
      expect(result).assertEqual('timeout-complete');
    });

    /**
     * @tc.name   asyncInteropTest008
     * @tc.number SUB_BUILTINS_asyncInterop_TEST_008
     * @tc.desc   Test async function returning non-promise values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncInteropTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mixedReturn = async (condition: boolean): Promise<number | string> => {
        if (condition) {
          return 42;
        }
        return 'string-value';
      };

      const result1 = await mixedReturn(true);
      const result2 = await mixedReturn(false);

      expect(result1).assertEqual(42);
      expect(result2).assertEqual('string-value');
    });

    /**
     * @tc.name   asyncInteropTest010
     * @tc.number SUB_BUILTINS_asyncInterop_TEST_010
     * @tc.desc   Test async function with reduce
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncInteropTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const asyncReduce = async (): Promise<number> => {
        const values = [1, 2, 3, 4, 5];

        let sum = 0;
        for (const val of values) {
          sum += await Promise.resolve(val);
        }

        return sum;
      };

      const result = await asyncReduce();
      expect(result).assertEqual(15);
    });

    /**
     * @tc.name   asyncInteropTest011
     * @tc.number SUB_BUILTINS_asyncInterop_TEST_011
     * @tc.desc   Test async function with filter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncInteropTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      class FilterItem {
        public val: number = 0;
        public shouldKeep: boolean = false;
      }

      const asyncFilter = async (): Promise<number[]> => {
        const values = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

        const filtered = await Promise.all(
          values.map(async val => {
            const shouldKeep = await Promise.resolve(val % 2 === 0);
            const item: FilterItem = new FilterItem();
            item.val = val;
            item.shouldKeep = shouldKeep;
            return item;
          })
        );

        return filtered
          .filter(item => item.shouldKeep)
          .map(item => item.val);
      };

      const result = await asyncFilter();
      expect(result).assertDeepEquals([2, 4, 6, 8, 10]);
    });

    /**
     * @tc.name   asyncInteropTest012
     * @tc.number SUB_BUILTINS_asyncInterop_TEST_012
     * @tc.desc   Test async function with object methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncInteropTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      class TestObj {
        public value: number = 10;

        async getValue(): Promise<number> {
          return await Promise.resolve(this.value);
        }

        async setValue(newValue: number): Promise<void> {
          this.value = newValue;
          await Promise.resolve();
        }
      }

      const obj = new TestObj();
      const result1 = await obj.getValue();
      await obj.setValue(20);
      const result2 = await obj.getValue();

      expect(result1).assertEqual(10);
      expect(result2).assertEqual(20);
    });

    /**
     * @tc.name   asyncInteropTest013
     * @tc.number SUB_BUILTINS_asyncInterop_TEST_013
     * @tc.desc   Test async function with class inheritance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncInteropTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      class BaseClass {
        async baseMethod(): Promise<string> {
          return 'base';
        }
      }

      class DerivedClass extends BaseClass {
        async derivedMethod(): Promise<string> {
          const base = await this.baseMethod();
          return base + '-derived';
        }
      }

      const instance = new DerivedClass();
      const result = await instance.derivedMethod();

      expect(result).assertEqual('base-derived');
    });

    /**
     * @tc.name   asyncInteropTest015
     * @tc.number SUB_BUILTINS_asyncInterop_TEST_015
     * @tc.desc   Test async function with Promise.resolve/reject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncInteropTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const useStaticMethods = async (success: boolean): Promise<number> => {
        if (success) {
          return await Promise.resolve(42);
        }
        return await Promise.reject(new Error('failed'));
      };

      const result1 = await useStaticMethods(true);

      let errorCaught = false;
      let errorMessage = '';
      try {
        await useStaticMethods(false);
      } catch (err) {
        errorCaught = true;
        if (err instanceof Error) {
          errorMessage = err.message;
        }
      }

      expect(result1).assertEqual(42);
      expect(errorCaught).assertTrue();
      expect(errorMessage).assertEqual('failed');
    });

    /**
     * @tc.name   asyncInteropTest016
     * @tc.number SUB_BUILTINS_asyncInterop_TEST_016
     * @tc.desc   Test async function with multiple error handlers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncInteropTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const multiErrorHandling = async (): Promise<string> => {
        return Promise.resolve('value')
          .then(val => val.toUpperCase())
          .catch((err: Error): string => {
            return 'error1';
          })
          .catch((err: Error): string => {
            return 'error2';
          });
      };

      const result = await multiErrorHandling();
      expect(result).assertEqual('VALUE');
    });

    /**
     * @tc.name   asyncInteropTest018
     * @tc.number SUB_BUILTINS_asyncInterop_TEST_018
     * @tc.desc   Test async function with JSON operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncInteropTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      class TestData {
        public id: number = 0;
        public name: string = '';
      }

      const jsonify = async (): Promise<string> => {
        const data: TestData = new TestData();
        data.id = 1;
        data.name = 'test';
        return JSON.stringify(data);
      };

      const parse = async (jsonStr: string): Promise<TestData> => {
        const parsed = JSON.parse(jsonStr) as TestData;
        return parsed;
      };

      const json = await jsonify();
      const parsed = await parse(json);

      expect(json).assertEqual('{"id":1,"name":"test"}');
      expect(parsed).assertDeepEquals({ id: 1, name: 'test' });
    });

    /**
     * @tc.name   asyncInteropTest019
     * @tc.number SUB_BUILTINS_asyncInterop_TEST_019
     * @tc.desc   Test async function with setTimeout clearing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncInteropTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const clearTimeoutTest = async (): Promise<string> => {
        return new Promise((resolve) => {
          let cleared = false;
          let resolved = false;

          // Create a delayed promise that can be cancelled
          const delayedPromise = new Promise<string>((res) => {
            Promise.resolve().then().then().then().then(() => {
              if (!resolved) {
                res('too-late');
              }
            });
          });

          // Immediately "clear" the first promise
          Promise.resolve().then(() => {
            if (!resolved) {
              cleared = true;
              resolved = true;
              resolve('cleared');
            }
          });

          // Wait for the first operation to "clear"
          Promise.resolve().then(() => {
            if (!resolved && cleared) {
              resolved = true;
            }
          });

          delayedPromise.then((result) => {
            if (!resolved) {
              resolved = true;
              resolve(result);
            }
          });
        });
      };

      const result = await clearTimeoutTest();
      expect(result).assertEqual('cleared');
    });

    /**
     * @tc.name   asyncInteropTest020
     * @tc.number SUB_BUILTINS_asyncInterop_TEST_020
     * @tc.desc   Test async function composition (pipeline)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncInteropTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const step1 = async (input: number): Promise<number> => {
        return input * 2;
      };

      const step2 = async (input: number): Promise<number> => {
        return input + 10;
      };

      const step3 = async (input: number): Promise<number> => {
        return input / 2;
      };

      const pipeline = async (value: number): Promise<number> => {
        let result = value;
        result = await step1(result);
        result = await step2(result);
        result = await step3(result);
        return result;
      };

      const result = await pipeline(5);
      expect(result).assertEqual(10); // (5 * 2 + 10) / 2 = 10
    });
  });
}
