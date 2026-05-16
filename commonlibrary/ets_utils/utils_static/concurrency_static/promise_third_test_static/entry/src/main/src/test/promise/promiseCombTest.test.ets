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
class ValidationError extends Error {
  constructor(message: string) {
    super(message);
    this.name = "ValidationError";
  }
}

class RateLimiter {
  private lastCall:long = 0;
  private interval: int;

  constructor(interval: int) {
    this.interval = interval;
  }

  async acquire(): Promise<void> {
    const now = Date.now();
    const elapsed = now - this.lastCall;
    if (elapsed < this.interval) {
      await new Promise<void>(resolve => {setTimeout(()=>{resolve(undefined)}, (this.interval - elapsed).toInt())});
    }
    this.lastCall = Date.now();
  }
}
export default function promiseCombTest(){
  describe('promiseCombTest', ():void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll((): void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (): Promise<void> => {
      await sleep(50);
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
     * @tc.number SUB_BUILTINS_Promise_async_combination_TEST_0203
     * @tc.name AsyncAwaitCombTest003
     * @tc.desc Test error handling in nested async calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsyncAwaitCombTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const validateUser = (token: string): Promise<boolean> => {
        return new Promise<boolean>((resolve, reject) => {
          setTimeout(() => {
            if (token === 'valid') {
              resolve(true);
            } else {
              reject(new Error('Invalid token'));
            }
          }, 50);
        });
      };

      const fetchData = (): Promise<string> => {
        return new Promise<string>((resolve) => {
          setTimeout(() => resolve('sensitive data'), 30);
        });
      };

      let errorMessage = '';
      try {
        const isValid = await validateUser('invalid');
        if (isValid) {
          const data = await fetchData(); // Should not execute
          expect(data).assertEqual('sensitive data');
        }
      } catch (err) {
        errorMessage = (err as Error).message;
      }

      expect(errorMessage).assertEqual('Invalid token');
    });


    /**
     * @tc.number SUB_BUILTINS_Promise_async_combination_TEST_0211
     * @tc.name AsyncAwaitCombTest011
     * @tc.desc Test 8-level nested parallel-sequential hybrid workflow
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsyncAwaitCombTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const fetchData = (id: number, delay: int): Promise<number> => {
        return new Promise<number>((resolve) => {
          setTimeout(() => resolve(id * 10), delay);
        });
      };

      // Hybrid workflow: parallel groups in sequence
      const start = Date.now();

      // Level 1-2: First parallel group
      const res1 = await Promise.all([
        fetchData(1, 100),
        fetchData(2, 80)
      ]);

      // Level 3-4: Second parallel group
      const res2 = await Promise.all([
        fetchData(3, 60),
        fetchData(4, 40)
      ]);

      // Level 5-6: Third parallel group
      const res3 = await Promise.all([
        fetchData(5, 30),
        fetchData(6, 20)
      ]);

      // Level 7-8: Final sequential steps
      const g = await fetchData(7, 10);
      const total = res1[0] + res1[1] + res2[0] + res2[1] + res3[0] + res3[1] + g;

      expect(total).assertEqual(10 + 20 + 30 + 40 + 50 + 60 + 70);

    });

    /**
     * @tc.number SUB_BUILTINS_Promise_async_combination_TEST_0213
     * @tc.name AsyncAwaitCombTest013
     * @tc.desc Test 9-level error propagation timing in nested calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsyncAwaitCombTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const riskyStep = (level: number): Promise<number> => {
        return new Promise<number>((resolve, reject) => {
          setTimeout(() => {
            if (level === 6) { // Error at level 6
              reject(new Error('Expected error'));
            } else {
              resolve(level);
            }
          }, 20); // Fixed delay per level
        });
      };

      const start = Date.now();
      let errorCaught = false;

      try {
        let result = await riskyStep(1);
        result = await riskyStep(2);
        result = await riskyStep(3);
        result = await riskyStep(4);
        result = await riskyStep(5);
        result = await riskyStep(6); // Will throw
        result = await riskyStep(7); // Should not execute
        result = await riskyStep(8); // Should not execute
        result = await riskyStep(9); // Should not execute
      } catch (err) {
        errorCaught = true;
      }

      expect(errorCaught).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_async_combination_TEST_0214
     * @tc.name AsyncAwaitCombTest014
     * @tc.desc Test 10-level mixed promise types with timing constraints
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsyncAwaitCombTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      // Mix of different promise types and delays
      const immediate = (val: number): Promise<number> => Promise.resolve(val);
      const shortDelay = (val: number): Promise<number> => new Promise<number>(resolve => {setTimeout(() => resolve(val), 10)});
      const mediumDelay = (val: number): Promise<number> => new Promise<number>(resolve => {setTimeout(() => resolve(val), 30)});
      const longDelay = (val: number): Promise<number> => new Promise<number>(resolve => {setTimeout(() => resolve(val), 50)});

      const start = Date.now();

      // 10-level mixed workflow
      let result = await immediate(1);
      result = await mediumDelay(result + 1);
      result = await shortDelay(result + 2);
      result = await longDelay(result + 3);
      result = await immediate(result + 4);
      result = await mediumDelay(result + 5);
      result = await shortDelay(result + 6);
      result = await longDelay(result + 7);
      result = await mediumDelay(result + 8);
      result = await shortDelay(result + 9);

      expect(result).assertEqual(1 + 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_async_combination_TEST_0216
     * @tc.name AsyncAwaitCombTest016
     * @tc.desc Test 10-level promise chain with alternating parallel/sequential steps
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsyncAwaitCombTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const task = (id: number, delay: int): Promise<number> => {
        return new Promise<number>((resolve) => {
          setTimeout(() => resolve(id), delay);
        });
      };

      const start = Date.now();

      // Alternating pattern: sequential → parallel → sequential → etc.
      let result = await task(1, 10); // Seq 1

      const res1 = await Promise.all([task(2, 20), task(3, 15)]); // Parallel 2-3
      result += res1[0] + res1[1];

      result += await task(4, 10); // Seq 4

      const res2 = await Promise.all([task(5, 25), task(6, 15), task(7, 20)]); // Parallel 5-7
      result += res2[0] + res2[1] + res2[2];

      result += await task(8, 5); // Seq 8

      const res3 = await Promise.all([task(9, 15), task(10, 10)]); // Parallel 9-10
      result += res3[0] + res3[1];

      expect(result).assertEqual(1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10); // 55
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_async_combination_TEST_0218
     * @tc.name AsyncAwaitCombTest018
     * @tc.desc Test 10-level deep nested promises with value accumulation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsyncAwaitCombTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      // 10-level nested function chain
      const level10 = (val: number): Promise<number> => new Promise<number>((resolve) => {
        setTimeout(() => resolve(val + 10), 10);
      });

      const level9 = (val: number): Promise<number> => new Promise<number>((resolve) => {
        setTimeout(async () => {
          resolve(await level10(val) + 9);
        }, 10);
      });

      const level8 = (val: number): Promise<number> => new Promise<number>((resolve) => {
        setTimeout(async () => {
          resolve(await level9(val) + 8);
        }, 10);
      });

      const level7 = (val: number): Promise<number> => new Promise<number>((resolve) => {
        setTimeout(async () => {
          resolve(await level8(val) + 7);
        }, 10);
      });

      const level6 = (val: number): Promise<number> => new Promise<number>((resolve) => {
        setTimeout(async () => {
          resolve(await level7(val) + 6);
        }, 10);
      });

      const level5 = (val: number): Promise<number> => new Promise<number>((resolve) => {
        setTimeout(async () => {
          resolve(await level6(val) + 5);
        }, 10);
      });

      const level4 = (val: number): Promise<number> => new Promise<number>((resolve) => {
        setTimeout(async () => {
          resolve(await level5(val) + 4);
        }, 10);
      });

      const level3 = (val: number): Promise<number> => new Promise<number>((resolve) => {
        setTimeout(async () => {
          resolve(await level4(val) + 3);
        }, 10);
      });

      const level2 = (val: number): Promise<number> => new Promise<number>((resolve) => {
        setTimeout(async () => {
          resolve(await level3(val) + 2);
        }, 10);
      });

      const level1 = (val: number): Promise<number> => new Promise<number>((resolve) => {
        setTimeout(async () => {
          resolve(await level2(val) + 1);
        }, 10);
      });

      const start = Date.now();
      const result = await level1(0);

      // 0 + 1+2+3+4+5+6+7+8+9+10 = 55
      expect(result).assertEqual(55);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_async_combination_TEST_0219
     * @tc.name AsyncAwaitCombTest019
     * @tc.desc Test 8-level complex timing with mixed parallel/sequential and errors
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsyncAwaitCombTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const reliableTask = (id: number, delay: int): Promise<number> => {
        return new Promise<number>((resolve) => {
          setTimeout(() => resolve(id * delay), delay);
        });
      };

      const sometimesFails = (id: number): Promise<number> => {
        return new Promise<number>((resolve, reject) => {
          setTimeout(() => {
            if (id % 3 === 0) {
              reject(new Error('Temporary failure'));
            } else {
              resolve(id);
            }
          }, 40);
        });
      };

      const start = Date.now();
      let results: number[] = [];

      // Complex workflow with error recovery
      results.push(await reliableTask(1, 20));

      try {
        // This will fail and go to catch
        results.push(await sometimesFails(3));
      } catch (err) {
        // Recovery path with delay
        await new Promise<void>(resolve => {setTimeout(()=>{resolve(undefined)}, 50)});
        results.push(await sometimesFails(4));
      }

      // Parallel section
      const res = await Promise.all([
        reliableTask(2, 30),
        sometimesFails(5)
      ]);
      results.push(res[0], res[1]);

      // Final sequential steps
      results.push(await reliableTask(3, 10));
      results.push(await sometimesFails(7));

      const sum = results.reduce((a, b) => a + b, 0.);

      expect(sum).assertEqual(126);
    });
    /**
     * @tc.number SUB_BUILTINS_Promise_async_combination_TEST_0220
     * @tc.name AsyncAwaitCombTest020
     * @tc.desc Test 10-level nested sequential nested timing sequence with increasing delays
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AsyncAwaitCombTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      // Create 10-level nested promises with increasing delays
      const createTimedStep = (level: int): Promise<int> => {
        return new Promise<int>((resolve) => {
          setTimeout(() => {
            resolve(level);
          }, level * 10); // Increasing delay: 10ms, 20ms, ..., 100ms
        });
      };

      const start = Date.now();
      let result = 0;

      // 10 levels of sequential await
      result = await createTimedStep(1);
      result = await createTimedStep(2);
      result = await createTimedStep(3);
      result = await createTimedStep(4);
      result = await createTimedStep(5);
      result = await createTimedStep(6);
      result = await createTimedStep(7);
      result = await createTimedStep(8);
      result = await createTimedStep(9);
      result = await createTimedStep(10);

      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_combination_TEST_0122
     * @tc.name PromiseAsyncAwaitTest022
     * @tc.desc test 3 levels with timeout pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAsyncAwaitTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {

      let timeout =(ms: int): Promise<never> =>{
        return new Promise<never>((resolve, reject) => {
          setTimeout(() => reject(new Error("timeout")), ms);
        });
      }

      let level3 = async (): Promise<string> => {
        return new Promise<string>((resolve) => {
          setTimeout(() => resolve("completed"), 50);
        });
      }

      let level2 = async (): Promise<string> => {
        return Promise.race([level3(), timeout(10)]);
      }

      let level1 = async (): Promise<string> =>  {
        try {
          await level2();
          return "unexpected";
        } catch (e) {
          return (e as Error).message;
        }
      }

      const result = await level1();
      expect(result).assertEqual("timeout");
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_combination_TEST_0123
     * @tc.name PromiseAsyncAwaitTest023
     * @tc.desc test 4 levels with data caching
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAsyncAwaitTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cache: Record<string, int> = {};

      let level4 = async (key: string): Promise<int> => {
        return new Promise<int>((resolve) => {
          // Simulate fetching data
          setTimeout(() => resolve(Math.random().toInt() * 100), 10);
        });
      }

      let level3 = async (key: string): Promise<int> => {
        if (cache[key]) {
          return cache[key]!;
        }
        const data = await level4(key);
        cache[key] = data;
        return data;
      }

      let level2 = async (key: string): Promise<int> => {
        const first = await level3(key);
        const second = await level3(key);
        return first === second ? 1 : 0;
      }

      let level1 = async (key: string): Promise<int> => {
        return await level2(key);
      }

      const result = await level1("test-key");
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_combination_TEST_0124
     * @tc.name PromiseAsyncAwaitTest024
     * @tc.desc test 5 levels with recursive data processing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAsyncAwaitTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let level5 = async (n: number): Promise<number> => {
        return new Promise<number>((resolve) => {
          resolve(n <= 1 ? 1 : n * (n - 1));
        });
      }

      let level4 = async (n: number): Promise<number> => {
        const res = await level5(n);
        return res / 2;
      }

      let level3 = async (n: number): Promise<number> => {
        const res = await level4(n);
        return res + n;
      }

      let level2 = async (n: number): Promise<number> => {
        const res = await level3(n);
        return res * 2;
      }

      let level1 = async (n: number): Promise<number> => {
        return await level2(n);
      }

      const result = await level1(5);
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_combination_TEST_0125
     * @tc.name PromiseAsyncAwaitTest025
     * @tc.desc test 6 levels with date manipulation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAsyncAwaitTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let level6 = async (date: Date): Promise<Date> => {
        return new Promise<Date>((resolve) => {
          const newDate = new Date(date);
          newDate.setDate(newDate.getDate() + 6);
          resolve(newDate);
        });
      }

      let level5 = async (date: Date): Promise<Date> => {
        const res = await level6(date);
        const newDate = new Date(res);
        newDate.setMonth(newDate.getMonth() + 5);
        return newDate;
      }

      let level4 = async (date: Date): Promise<Date> => {
        const res = await level5(date);
        const newDate = new Date(res);
        newDate.setDate(newDate.getDate() - 4);
        return newDate;
      }

      let level3 = async (date: Date): Promise<Date> => {
        const res = await level4(date);
        const newDate = new Date(res);
        newDate.setFullYear(newDate.getFullYear() + 3);
        return newDate;
      }

      let level2 = async (date: Date): Promise<Date> => {
        const res = await level3(date);
        const newDate = new Date(res);
        newDate.setDate(newDate.getDate() + 2);
        return newDate;
      }

      let level1 = async (date: Date): Promise<int>=> {
        const res = await level2(date);
        return res.getFullYear();
      }

      const result = await level1(new Date(2020, 0, 1));
      expect(result).assertEqual(2023);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_combination_TEST_0127
     * @tc.name PromiseAsyncAwaitTest027
     * @tc.desc test 8 levels with map and filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAsyncAwaitTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let level8 = async (numbers: number[]): Promise<number[]> => {
        return new Promise<number[]>((resolve) => {
          resolve(numbers.map(n => n * 2));
        });
      }

      let level7 = async (numbers: number[]): Promise<number[]> => {
        const res = await level8(numbers);
        return res.filter(n => n > 9);
      };

      let level6 = async (numbers: number[]): Promise<number[]> => {
        const res = await level7(numbers);
        return res.map(n => n - 3);
      }

      let level5 = async (numbers: number[]): Promise<number[]> => {
        const res = await level6(numbers);
        return res.filter(n => n % 2 === 0);
      }

      let level4 = async (numbers: number[]): Promise<number[]> => {
        const res = await level5(numbers);
        return res.map(n => n / 2);
      }

      let level3 = async (numbers: number[]): Promise<number[]> => {
        const res = await level4(numbers);
        return res.filter(n => n < 10);
      }

      let level2 = async (numbers: number[]): Promise<number[]> => {
        const res = await level3(numbers);
        return res.map(n => n + 5);
      }

      let level1 = async (numbers: number[]): Promise<number> => {
        const res = await level2(numbers);
        return res.reduce((sum, n) => sum + n, 0.);
      }

      const result = await level1([3, 4, 5, 6, 7, 8, 9]);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_combination_TEST_0129
     * @tc.name PromiseAsyncAwaitTest029
     * @tc.desc test 10 levels with debounced operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAsyncAwaitTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let debounce = (func: () => Promise<number>, wait: int): () => Promise<number> => {
        let timeout = -1;
        return () => new Promise<number>((resolve) => {
          clearTimeout(timeout);
          timeout = setTimeout(async () => {
            resolve(await func());
          }, wait);
        });
      }

      let level10 = async (): Promise<number> => {
        return new Promise<number>((resolve) => {
          resolve(10);
        });
      }

      let level9 = async (): Promise<number> => {
        const debounced = debounce(level10, 5);
        return await debounced();
      }

      let level8 = async (): Promise<number> => {
        const res = await level9();
        return res + 8;
      }

      let level7 = async (): Promise<number> => {
        const debounced = debounce(level8, 5);
        return await debounced();
      }

      let level6 = async (): Promise<number> => {
        const res = await level7();
        return res * 6;
      }

      let level5 = async (): Promise<number> => {
        const debounced = debounce(level6, 5);
        return await debounced();
      }

      let level4 = async (): Promise<number> => {
        const res = await level5();
        return res - 4;
      }

      let level3 = async (): Promise<number> => {
        const debounced = debounce(level4, 5);
        return await debounced();
      }

      let level2 = async (): Promise<number> => {
        const res = await level3();
        return res + 2;
      }

      let level1 = async (): Promise<number> => {
        const debounced = debounce(level2, 5);
        return await debounced();
      }

      const result = await level1();
      expect(result).assertEqual(106);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_combination_TEST_0130
     * @tc.name PromiseAsyncAwaitTest030
     * @tc.desc test 10 levels with sequential promise chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAsyncAwaitTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let level10 = async (value: number): Promise<number> => {
        return new Promise<number>((resolve) => {
          setTimeout(() => resolve(value * 10), 1);
        });
      }

      let level9 = async (value: number): Promise<number> => {
        const res = await level10(value);
        return new Promise<number>((resolve) => {
          setTimeout(() => resolve(res + 9), 1);
        });
      }

      let level8 = async (value: number): Promise<number> => {
        const res = await level9(value);
        return new Promise<number>((resolve) => {
          setTimeout(() => resolve(res * 8), 1);
        });
      }

      let level7 = async (value: number): Promise<number> => {
        const res = await level8(value);
        return new Promise<number>((resolve) => {
          setTimeout(() => resolve(res - 7), 1);
        });
      }

      let level6 = async (value: number): Promise<number> => {
        const res = await level7(value);
        return new Promise<number>((resolve) => {
          setTimeout(() => resolve(res * 6), 1);
        });
      }

      let level5 = async (value: number): Promise<number> => {
        const res = await level6(value);
        return new Promise<number>((resolve) => {
          setTimeout(() => resolve(res + 5), 1);
        });
      }

      let level4 = async (value: number): Promise<number> => {
        const res = await level5(value);
        return new Promise<number>((resolve) => {
          setTimeout(() => resolve(res / 4), 1);
        });
      }

      let level3 = async (value: number): Promise<number> => {
        const res = await level4(value);
        return new Promise<number>((resolve) => {
          setTimeout(() => resolve(res + 3), 1);
        });
      }

      let level2 = async (value: number): Promise<number> => {
        const res = await level3(value);
        return new Promise<number>((resolve) => {
          setTimeout(() => resolve(res * 2), 1);
        });
      }

      let level1 = async (value: number): Promise<number> => {
        const res = await level2(value);
        return new Promise<number>((resolve) => {
          setTimeout(() => resolve(res + 1), 1);
        });
      }

      const result = await level1(2);
      expect(Math.round(result)).assertEqual(685);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_combination_TEST_0131
     * @tc.name PromiseAsyncAwaitTest031
     * @tc.desc test 2 levels with typed errors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAsyncAwaitTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let level2 = async (input: string): Promise<string> => {
        return new Promise<string>((resolve, reject) => {
          if (input.length < 5) {
            reject(new ValidationError("Too short"));
          } else {
            resolve(input);
          }
        });
      }

      let level1 = async (input: string): Promise<string> => {
        try {
          return await level2(input);
        } catch (e) {
          if (e instanceof ValidationError) {
            return "handled: " + e.message;
          }
          throw e as Error;
        }
      }

      const result = await level1("test");
      expect(result).assertEqual("handled: Too short");
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_combination_TEST_0132
     * @tc.name PromiseAsyncAwaitTest032
     * @tc.desc test 3 levels with retry logic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAsyncAwaitTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let attempt = 0;

      let level3 = async (): Promise<number> => {
        return new Promise<number>((resolve, reject) => {
          attempt++;
          if (attempt < 3) {
            reject(new Error("Transient error"));
          } else {
            resolve(attempt);
          }
        });
      }

      let level2 = async (retries: number): Promise<number> => {
        let lastError: Error = new Error();
        for (let i = 0; i < retries; i++) {
          try {
            return await level3();
          } catch (e) {
            lastError = e as Error;
            await new Promise<void>(resolve => {setTimeout(()=>{resolve(undefined)}, 10)});
          }
        }
        throw lastError!;
      }

      let level1 = async (): Promise<number> => {
        return await level2(3);
      }

      const result = await level1();
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_combination_TEST_0133
     * @tc.name PromiseAsyncAwaitTest033
     * @tc.desc test 4 levels with rate limiting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAsyncAwaitTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const limiter = new RateLimiter(10);

      let level4 = async (id: number): Promise<number> => {
        await limiter.acquire();
        return id;
      }

      let level3 = async (ids: number[]): Promise<number[]> => {
        const results:number[] = [];
        for (const id of ids) {
          results.push(await level4(id));
        }
        return results;
      }

      let level2 = async (ids: number[]): Promise<int> => {
        const results = await level3(ids);
        return results.length;
      }

      let level1 = async (): Promise<int> => {
        const start = Date.now();
        const count = await level2([1, 2, 3]);
        const duration = Date.now() - start;
        return duration >= 19 ? count : -1;
      }

      const result = await level1();
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_combination_TEST_0139
     * @tc.name PromiseAsyncAwaitTest039
     * @tc.desc test 10 levels with complex mathematical operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAsyncAwaitTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let level10 = async (n: number): Promise<number> =>{
        return new Promise<number>((resolve) => {
          resolve(Math.sin(n) * 10);
        });
      }

      let level9 = async (n: number): Promise<number>=>  {
        const res = await level10(n);
        return Math.round(res) + 9;
      }

      let level8 = async (n: number): Promise<number> => {
        const res = await level9(n);
        return res * res * 8;
      }

      let level7 = async (n: number): Promise<number> => {
        const res = await level8(n);
        return Math.sqrt(res) + 7;
      }

      let level6 = async (n: number): Promise<number> => {
        const res = await level7(n);
        return res * 6;
      }

      let level5 = async (n: number): Promise<number> => {
        const res = await level6(n);
        return Math.floor(res) + 5;
      }

      let level4 = async (n: number): Promise<number> => {
        const res = await level5(n);
        return res / 4;
      }

      let level3 = async (n: number): Promise<number> => {
        const res = await level4(n);
        return res * res + 3;
      }

      let level2 = async (n: number): Promise<number> => {
        const res = await level3(n);
        return res * 2;
      }

      let level1 = async (n: number): Promise<number> => {
        const res = await level2(n);
        return Math.round(res) + 1;
      }

      const result = await level1(Math.PI / 2);
      expect(result).assertEqual(17027);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_combination_TEST_0140
     * @tc.name PromiseAsyncAwaitTest040
     * @tc.desc test 10 levels with mixed parallel/sequential operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAsyncAwaitTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let task = async (id: number, delay: int): Promise<number> => {
        return new Promise<number>((resolve) => {
          setTimeout(() => resolve(id * delay), delay);
        });
      }

      let level10 = async (): Promise<number[]> => {
        return Promise.all([
          task(10, 1),
          task(10, 2)
        ]);
      }

      let level9 = async (): Promise<number> => {
        const results = await level10();
        return results.reduce((sum, val) => sum + val, 0.);
      }

      let level8 = async (): Promise<number[]> => {
        return Promise.all([
          level9(),
          task(8, 3)
        ]);
      }

      let level7 = async (): Promise<number> => {
        const results = await level8();
        return results.reduce((sum, val) => sum + val, 0.);
      }

      let level6 = async (): Promise<number[]> => {
        return Promise.all([
          level7(),
          task(6, 4)
        ]);
      }

      let level5 = async (): Promise<number> => {
        const results = await level6();
        return results.reduce((sum, val) => sum + val, 0.);
      }

      let level4 = async (): Promise<number[]> => {
        return Promise.all([
          level5(),
          task(4, 5)
        ]);
      }

      let level3 = async (): Promise<number> => {
        const results = await level4();
        return results.reduce((sum, val) => sum + val, 0.);
      }

      let level2 = async (): Promise<number[]> => {
        return Promise.all([
          level3(),
          task(2, 6)
        ]);
      }

      let level1 = async (): Promise<number> => {
        const results = await level2();
        return results.reduce((sum, val) => sum + val, 0.);
      }

      const result = await level1();
      expect(result).assertEqual(110);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_nested_TEST_0301
     * @tc.name NestedPromiseTest001
     * @tc.desc Test 5-level nested promises with async/await
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('NestedPromiseTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const level1 = (): Promise<number> => new Promise<number>((resolve) => resolve(1));
      const level2 = (val: number): Promise<number> => new Promise<number>((resolve) => resolve(val + 1));
      const level3 = (val: number): Promise<number> => new Promise<number>((resolve) => resolve(val + 1));
      const level4 = (val: number): Promise<number> => new Promise<number>((resolve) => resolve(val + 1));
      const level5 = (val: number): Promise<number> => new Promise<number>((resolve) => resolve(val + 1));

      const result = await level1()
        .then(val => level2(val))
        .then(val => level3(val))
        .then(val => level4(val))
        .then(val => level5(val));

      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_nested_TEST_0302
     * @tc.name NestedPromiseTest002
     * @tc.desc Test 10-level sequential promise chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('NestedPromiseTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let currentLevel = 0;
      const createLevel = (): Promise<number> => {
        return new Promise<number>((resolve) => {
          currentLevel++;
          resolve(currentLevel);
        });
      };

      let result : number = 0;
      result = await createLevel();
      result = await createLevel();
      result = await createLevel();
      result = await createLevel();
      result = await createLevel();
      result = await createLevel();
      result = await createLevel();
      result = await createLevel();
      result = await createLevel();
      result = await createLevel();

      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_nested_TEST_0303
     * @tc.name NestedPromiseTest003
     * @tc.desc Test nested promises with 3 levels of inner promises
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('NestedPromiseTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const outer = (): Promise<number> => {
        return new Promise<number>((resolve) => {
          const middle = (): Promise<number> => {
            return new Promise<number>((resolve) => {
              const inner = (): Promise<number> => new Promise<number>((resolve) => resolve(3));
              inner().then(val => resolve(val));
            });
          };
          middle().then(val => resolve(val * 2));
        });
      };

      const result = await outer();
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_nested_TEST_0304
     * @tc.name NestedPromiseTest004
     * @tc.desc Test 10-level math operation chain with async/await
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('NestedPromiseTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const multiply = (val: number): Promise<number> => new Promise<number>((resolve) => resolve(val * 2));
      const add = (val: number): Promise<number> => new Promise<number>((resolve) => resolve(val + 3));

      let result = await multiply(1); // 2
      result = await add(result); // 5
      result = await multiply(result); // 10
      result = await add(result); // 13
      result = await multiply(result); // 26
      result = await add(result); // 29
      result = await multiply(result); // 58
      result = await add(result); // 61
      result = await multiply(result); // 122
      result = await add(result); // 125

      expect(result).assertEqual(125);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_nested_TEST_0305
     * @tc.name NestedPromiseTest005
     * @tc.desc Test error propagation through 5 nested levels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('NestedPromiseTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const level1 = (): Promise<void> => new Promise<void>((resolve, reject) => reject(new Error('Level 1 error')));
      const level2 = async (): Promise<void> => {
        await level1();
      };
      const level3 = async (): Promise<void> => {
        await level2();
      };
      const level4 = async (): Promise<void> => {
        await level3();
      };
      const level5 = async (): Promise<void> => {
        await level4();
      };

      let errorMessage = '';
      try {
        await level5();
      } catch (err) {
        errorMessage = (err as Error).message;
      }

      expect(errorMessage).assertEqual('Level 1 error');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_nested_TEST_0306
     * @tc.name NestedPromiseTest006
     * @tc.desc Test 6-level nested promises with mixed parallel/sequential
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('NestedPromiseTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const fetchData = (id: number): Promise<number> => new Promise<number>((resolve) => resolve(id * 10));

      const level1 = async (): Promise<number[]> => {
        const level2 = async (): Promise<number> => {
          const level3 = async (): Promise<number> => {
            return await fetchData(3);
          };
          return (await level3()) + 20;
        };

        const parallel1 = await level2();
        const parallel2 = await fetchData(2);
        return [parallel1, parallel2];
      };

      const res = await level1();
      expect(res[0]).assertEqual(50); // (3*10) + 20
      expect(res[1]).assertEqual(20); // 2*10
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_nested_TEST_0308
     * @tc.name NestedPromiseTest008
     * @tc.desc Test 4-level nested promises with data transformation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('NestedPromiseTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const level1 = (): Promise<string> => new Promise<string>((resolve) => resolve('start'));

      const level2 = (val: string): Promise<string[]> => {
        return new Promise<string[]>((resolve) => resolve(val.split('')));
      };

      const level3 = (arr: string[]): Promise<number> => {
        return new Promise<number>((resolve) => resolve(arr.length));
      };

      const level4 = (len: number): Promise<boolean> => {
        return new Promise<boolean>((resolve) => resolve(len > 3));
      };

      const result = await level1()
        .then(val => level2(val))
        .then(arr => level3(arr))
        .then(len => level4(len));

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_nested_TEST_0309
     * @tc.name NestedPromiseTest009
     * @tc.desc Test 8-level mixed promise chain with error recovery
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('NestedPromiseTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const safeAdd = (val: number): Promise<number> => {
        return new Promise<number>((resolve) => {
          if (val === 5) {
            resolve(0);
          } else {
            resolve(val + 1);
          }
        });
      };

      let result : number = 0;
      result = await safeAdd(result); // 1
      result = await safeAdd(result); // 2
      result = await safeAdd(result); // 3
      result = await safeAdd(result); // 4
      result = await safeAdd(result); // 0 (recovery)
      result = await safeAdd(result); // 1
      result = await safeAdd(result); // 2
      result = await safeAdd(result); // 3

      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_nested_TEST_0310
     * @tc.name NestedPromiseTest010
     * @tc.desc Test 10-level promise chain with timeouts
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('NestedPromiseTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const timedStep = (level: number): Promise<number> => {
        return new Promise<number>((resolve) => {
          setTimeout(() => resolve(level), 1);
        });
      };

      let result : number = 0;
      const start = Date.now();

      result = await timedStep(1);
      result = await timedStep(2);
      result = await timedStep(3);
      result = await timedStep(4);
      result = await timedStep(5);
      result = await timedStep(6);
      result = await timedStep(7);
      result = await timedStep(8);
      result = await timedStep(9);
      result = await timedStep(10);

      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_nested_TEST_0313
     * @tc.name NestedPromiseTest013
     * @tc.desc Test 10-level chained promises with conditional branching
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('NestedPromiseTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let stepCount = 0;
      const step = (val: number): Promise<number> => {
        return new Promise<number>((resolve) => {
          stepCount++;
          if (stepCount % 3 === 0) {
            resolve(val * 2);
          } else {
            resolve(val + 1);
          }
        });
      };

      let result : number = 0;
      result = await step(result); // 1
      result = await step(result); // 2
      result = await step(result); // 4 (3*2)
      result = await step(result); // 5
      result = await step(result); // 6
      result = await step(result); // 12 (6*2)
      result = await step(result); // 13
      result = await step(result); // 14
      result = await step(result); // 28 (14+1=15 → 15*2)
      result = await step(result); // 29

      expect(result).assertEqual(29);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_nested_TEST_0315
     * @tc.name NestedPromiseTest015
     * @tc.desc Test 9-level error handling with partial recovery
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('NestedPromiseTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const riskyStep = (level: number): Promise<number> => {
        return new Promise<number>((resolve, reject) => {
          if (level === 5) {
            reject(new Error('Temporary error'));
          } else {
            resolve(level);
          }
        });
      };

      let result : number = 0;
      try {
        result = await riskyStep(1);
        result = await riskyStep(2);
        result = await riskyStep(3);
        result = await riskyStep(4);
        result = await riskyStep(5); // Will throw
        result = await riskyStep(6); // Skipped
      } catch (err) {
        // Recovery path
        result = await riskyStep(5.5);
        result = await riskyStep(6);
        result = await riskyStep(7);
        result = await riskyStep(8);
        result = await riskyStep(9);
      }

      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_nested_TEST_0317
     * @tc.name NestedPromiseTest017
     * @tc.desc Test 7-level mixed promises with async/await and .then()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('NestedPromiseTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const asyncStep = async (val: number): Promise<number> => val * 2;
      const thenStep = (val: number): Promise<number> => new Promise<number>((resolve) => resolve(val + 3));
      // Mixed usage of async/await and .then()
      let result = await asyncStep(2); // 4
      result = await thenStep(result); // 7
      result = await asyncStep(result).then(thenStep); // 7*2=14 +3=17
      await thenStep(result)
        .then(asyncStep)
        .then(val => asyncStep(val));
      result = await asyncStep(result); // 80
      result = await thenStep(result);
      result = await asyncStep(result);

      expect(result).assertEqual(74);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_nested_TEST_0319
     * @tc.name NestedPromiseTest019
     * @tc.desc Test 10-level sequential promises with varying delays
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('NestedPromiseTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const delayedStep = (level: int): Promise<number> => {
        return new Promise<number>((resolve) => {
          setTimeout(() => resolve(level), level); // Increasing delay
        });
      };

      const start = Date.now();
      let result : number = 0;

      for (let i = 1; i <= 10; i++) {
        result = await delayedStep(i);
      }

      expect(result).assertEqual(10);
    });

  })
}
