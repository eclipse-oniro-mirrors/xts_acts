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
class TestClass {
  public value: string;

  constructor(value: string) {
    this.value = value;
  }
}

class Service {
  private name: string;
  private initTime: int

  constructor(name: string, initTime: int) {
    this.name = name
    this.initTime = initTime
  }

  async initialize(): Promise<string> {
    await new Promise<void>((resolve) => {setTimeout(()=>{resolve(undefined)}, this.initTime)});
    return `Service ${this.name} ready`;
  }
}

async function resolveDependency (id: int, deps: int[]): Promise<int> {
  if (deps.length > 0) {
    // Resolve dependencies first
    await Promise.all(deps.map(dep =>
    resolveDependency(dep, [] as int[])
    ));
  }
  // Simulate resolution time
  await new Promise<void>((resolve) => {setTimeout(()=>{resolve(undefined)}, id * 20)});
  return id;
};


export default function promiseAnyTest() {
  describe('promiseAnyTest', ():void => {
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
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0010
     * @tc.name PromiseAnyTest001
     * @tc.desc All promises resolve, return the first resolved result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAnyTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<int> = Promise.resolve(1);
      const p2: Promise<int> = Promise.resolve(2);
      const p3: Promise<int> = Promise.resolve(3);

      const result = await Promise.any([p1, p2, p3]);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0020
     * @tc.name PromiseAnyTest002
     * @tc.desc Some promises resolve, return the first resolved result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAnyTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<int> = Promise.reject(new Error('Error 1'));
      const p2: Promise<int> = Promise.resolve(2);
      const p3: Promise<int> = Promise.resolve(3);

      const result = await Promise.any([p1, p2, p3]);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0030
     * @tc.name PromiseAnyTest003
     * @tc.desc All promises reject, return AggregateError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAnyTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<number> = Promise.reject(new Error('Error 1'));
      const p2: Promise<number> = Promise.reject(new Error('Error 2'));
      const p3: Promise<number> = Promise.reject(new Error('Error 3'));

      try {
        await Promise.any([p1, p2, p3]);
        expect().assertFail();
      } catch (error) {
        expect(error instanceof AggregateError).assertEqual(true);
        expect((error as AggregateError).errors.length).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0040
     * @tc.name PromiseAnyTest004
     * @tc.desc First promise resolves later, faster one returns first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAnyTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<number> = new Promise<number>((resolve) => {setTimeout(() => resolve(1), 100)});
      const p2: Promise<number> = new Promise<number>((resolve) => {setTimeout(() => resolve(2), 50)});

      const result = await Promise.any([p1, p2]);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0050
     * @tc.name PromiseAnyTest005
     * @tc.desc Handle array with non-promise values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAnyTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result = await Promise.any([1, 2, 3]);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0060
     * @tc.name PromiseAnyTest006
     * @tc.desc Pass empty array, return rejected promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAnyTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      try {
        await Promise.any([] as number[]);
        expect().assertFail();
      } catch (error) {
        expect(error instanceof AggregateError).assertEqual(true);
        expect((error as AggregateError).message.includes('')).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0070
     * @tc.name PromiseAnyTest007
     * @tc.desc Contains pending promise and resolved promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAnyTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<int> = new Promise<int>(() => {
      }); // Forever pending
      const p2: Promise<int> = Promise.resolve(2);

      const result = await Promise.any([p1, p2]);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0080
     * @tc.name PromiseAnyTest008
     * @tc.desc Test promise state changes: reject first then resolve
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAnyTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let resolveFn: (value: number) => void = ()=>{};
      const p1: Promise<number> = new Promise<number>((resolve, reject) => {
        setTimeout(() => reject(new Error('Error')), 50);
      });
      const p2: Promise<number> = new Promise<number>((resolve) => {
        resolveFn = resolve;
      });
      setTimeout(() => resolveFn(2), 100);
      const result = await Promise.any([p1, p2]);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0090
     * @tc.name PromiseAnyTest009
     * @tc.desc Verify AggregateError contains all error messages
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAnyTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<number> = Promise.reject(new Error('Error 1'));
      const p2: Promise<number> = Promise.reject(new Error('Error 2'));

      try {
        await Promise.any([p1, p2]);
        expect().assertFail();
      } catch (error) {
        expect(error instanceof AggregateError).assertEqual(true);
        expect((error as AggregateError).errors.length).assertEqual(2);
        expect(((error as AggregateError).errors[0] as Error).message).assertEqual('Error 1');
        expect(((error as AggregateError).errors[1] as Error).message).assertEqual('Error 2');
      }
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0100
     * @tc.name PromiseAnyTest010
     * @tc.desc Test mixed types in promises
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAnyTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<string> = Promise.reject(new Error('Error'));
      const p2: Promise<number> = new Promise<number>((resolve) => {setTimeout(() => resolve(42), 50)});
      const p3: Promise<boolean> = Promise.resolve(true);

      const result = await Promise.any([p1, p2, p3]);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0110
     * @tc.name PromiseAnyTest011
     * @tc.desc First resolved promise with string type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAnyTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<string> = Promise.resolve("first");
      const p2: Promise<string> = new Promise<string>((resolve) => {setTimeout(() => resolve("second"), 100)});

      const result = await Promise.any([p1, p2]);
      expect(result).assertEqual("first");
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0140
     * @tc.name PromiseAnyTest014
     * @tc.desc Single promise that resolves
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAnyTest014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const p1: Promise<boolean> = new Promise<boolean>((resolve) => resolve(true));

      const result = await Promise.any([p1]);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0150
     * @tc.name PromiseAnyTest015
     * @tc.desc Single promise that rejects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAnyTest015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const p1: Promise<number> = new Promise<number>((resolve, reject) => reject(new Error('Single error')));

      try {
        await Promise.any([p1]);
        expect().assertFail();
      } catch (error) {
        expect(error instanceof AggregateError).assertEqual(true);
        expect((error as AggregateError).errors.length).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0170
     * @tc.name PromiseAnyTest017
     * @tc.desc Non-promise and promise mix in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAnyTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<number> = new Promise<number>((resolve) => {setTimeout(() => resolve(100), 50)});
      const mixedArray = [42, p1, "string"];

      const result = await Promise.any(mixedArray);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0210
     * @tc.name PromiseAnyTest021
     * @tc.desc Resolve with null value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAnyTest021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const p1: Promise<null> = new Promise<null>((resolve) => resolve(null));
      const p2: Promise<string> = new Promise<string>((resolve) => {setTimeout(() => resolve("not null"), 10)});

      const result = await Promise.any([p1, p2]);
      expect(result).assertEqual(null);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0220
     * @tc.name PromiseAnyTest022
     * @tc.desc Resolve with bigint type
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAnyTest022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const p1: Promise<bigint> = new Promise<bigint>((resolve) => resolve(BigInt(9007199254740991)));
      const p2: Promise<bigint> = new Promise<bigint>((resolve) => {setTimeout(() => resolve(BigInt(123)), 50)});

      const result = await Promise.any([p1, p2]);
      expect(result).assertEqual(BigInt(9007199254740991));
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0240
     * @tc.name PromiseAnyTest024
     * @tc.desc Nested promises in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAnyTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const nestedPromise: Promise<Promise<int>> = new Promise<Promise<int>>((resolve) =>{
      setTimeout(() => resolve(Promise.resolve(5)), 10)}
      );
      const p1: Promise<int> = new Promise<int>((resolve) => {setTimeout(() => resolve(1), 50)});

      const result = await Promise.any([nestedPromise, p1]);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0310
     * @tc.name PromiseAnyTest031
     * @tc.desc Resolve with array value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAnyTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<number[]> = new Promise<number[]>((resolve) => resolve([1, 2, 3]));
      const p2: Promise<number[]> = new Promise<number[]>((resolve) => {setTimeout(() => resolve([4, 5, 6]), 50)});

      const result = await Promise.any([p1, p2]);
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0320
     * @tc.name PromiseAnyTest032
     * @tc.desc Test with date objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAnyTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const date1 = new Date(2023, 0, 1);
      const date2 = new Date(2023, 0, 2);

      const p1: Promise<Date> = new Promise<Date>((resolve) => {setTimeout(() => resolve(date1), 50)});
      const p2: Promise<Date> = new Promise<Date>((resolve) => resolve(date2));

      const result = await Promise.any([p1, p2]);
      expect(result).assertEqual(date2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0330
     * @tc.name PromiseAnyTest033
     * @tc.desc Resolve after multiple pending promises
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAnyTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<number> = new Promise<number>(() => {
      }); // Pending
      const p2: Promise<number> = new Promise<number>(() => {
      }); // Pending
      const p3: Promise<number> = new Promise<number>((resolve) => {setTimeout(() => resolve(3), 100)});

      const result = await Promise.any([p1, p2, p3]);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0340
     * @tc.name PromiseAnyTest034
     * @tc.desc Different rejection types including Error subclasses
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAnyTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const p1: Promise<number> = Promise.reject(new CustomError('Custom error'));
      const p2: Promise<number> = Promise.reject(new SyntaxError('Syntax error'));
      const p3: Promise<number> = Promise.reject(new ReferenceError('Reference error'));

      try {
        await Promise.any([p1, p2, p3]);
        expect().assertFail();
      } catch (error) {
        expect(error instanceof AggregateError).assertEqual(true);
        expect((error as AggregateError).errors.length).assertEqual(3);
        expect((error as AggregateError).errors[0] instanceof CustomError).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0350
     * @tc.name PromiseAnyTest035
     * @tc.desc Resolve with regexp value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAnyTest035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const regex1 = new RegExp('test1');
      const regex2 = new RegExp('test2');

      const p1: Promise<RegExp> = new Promise<RegExp>((resolve) => resolve(regex1));
      const p2: Promise<RegExp> = new Promise<RegExp>((resolve) => {setTimeout(() => resolve(regex2), 10)});

      const result = await Promise.any([p1, p2]);
      expect(result).assertEqual(regex1);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0360
     * @tc.name PromiseAnyTest036
     * @tc.desc Test with Map objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAnyTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const map1 = new Map<string, number>([['a', 1]]);
      const map2 = new Map<string, number>([['b', 2]]);

      const p1: Promise<Map<string, number>> =
        new Promise<Map<string, number>>((resolve) => {setTimeout(() => resolve(map1), 50)});
      const p2: Promise<Map<string, number>> = new Promise<Map<string, number>>((resolve) => resolve(map2));

      const result = await Promise.any([p1, p2]);
      expect(result).assertEqual(map2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0370
     * @tc.name PromiseAnyTest037
     * @tc.desc Test with Set objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseAnyTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const set1 = new Set<number>([1, 2, 3]);
      const set2 = new Set<number>([4, 5, 6]);

      const p1: Promise<Set<number>> = new Promise<Set<number>>((resolve) => resolve(set1));
      const p2: Promise<Set<number>> = new Promise<Set<number>>((resolve) => {setTimeout(() => resolve(set2), 50)});

      const result = await Promise.any([p1, p2]);
      expect(result).assertEqual(set1);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0420
     * @tc.name PromiseAnyTest042
     * @tc.desc Async function returning promises in sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const asyncFn1 = async (): Promise<int> => {
        await new Promise<void>((resolve) => {setTimeout(()=>{resolve(undefined)}, 90)});
        return 1;
      };

      const asyncFn2 = async (): Promise<int> => {
        await new Promise<void>((resolve) => {setTimeout(()=>{resolve(undefined)}, 40)});
        return 2;
      };

      const result = await Promise.any([asyncFn1(), asyncFn2()]);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0550
     * @tc.name PromiseAnyTest055
     * @tc.desc Reject cascade with final resolve
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const createTimedPromise = (value: number, delay: int, shouldReject: boolean): Promise<number> => {
        return new Promise<number>((resolve, reject) =>{
        setTimeout(() => {
          if (shouldReject) {
            reject(new Error(`Rejected ${value}`));
          } else {
            resolve(value);
          }
        }, delay)}
        );
      };

      const promises = [
        createTimedPromise(1, 10, true),
        createTimedPromise(2, 20, true),
        createTimedPromise(3, 30, true),
        createTimedPromise(4, 40, true),
        createTimedPromise(5, 50, false)
      ];

      const result = await Promise.any(promises);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0590
     * @tc.name PromiseAnyTest059
     * @tc.desc Race between multiple async initialization processes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const serviceA = new Service('A', 100);
      const serviceB = new Service('B', 10);
      const serviceC = new Service('C', 80);

      const result = await Promise.any([
        serviceA.initialize(),
        serviceB.initialize(),
        serviceC.initialize()
      ]);

      expect(result).assertEqual('Service B ready');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0600
     * @tc.name PromiseAnyTest060
     * @tc.desc Async validation chain with early success
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const validate = (value: number, delay: int): Promise<number> => {
        return new Promise<number>((resolve, reject) =>{
        setTimeout(() => {
          if (value % 2 === 0) {
            resolve(value);
          } else {
            reject(new Error(`Invalid: ${value}`));
          }
        }, delay)}
        );
      };

      const result = await Promise.any([
        validate(1, 10), // Rejects
        validate(3, 20), // Rejects
        validate(5, 30), // Rejects
        validate(4, 40), // Resolves
        validate(6, 50)// Resolves later
      ]);

      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0680
     * @tc.name PromiseAnyTest068
     * @tc.desc Promise.any with promises that change state after delays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let resolveP1: (value: number) => void = ()=>{};
      let resolveP2: (value: number) => void = ()=>{};

      const p1: Promise<number> = new Promise<number>((resolve) => {
        resolveP1 = resolve;
      });

      const p2: Promise<number> = new Promise<number>((resolve) => {
        resolveP2 = resolve;
      });

      // Schedule resolutions in reverse order
      setTimeout(() => resolveP2(2), 80);
      setTimeout(() => resolveP1(1), 30);

      const result = await Promise.any([p1, p2]);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_091
     * @tc.name PromiseAnyTest091
     * @tc.desc Combine Promise.any with Promise.resolve and Promise.reject
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAnyTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const p1: Promise<int> = Promise.resolve(10);
      const p2: Promise<int> = Promise.reject(new Error('Failed'));
      const p3: Promise<int> = new Promise<int>(resolve =>{
      setTimeout(() => resolve(20), 50)}
      );

      const result = await Promise.any([p1, p2, p3]);
      expect(result).assertEqual(10);
    });

  })
}
