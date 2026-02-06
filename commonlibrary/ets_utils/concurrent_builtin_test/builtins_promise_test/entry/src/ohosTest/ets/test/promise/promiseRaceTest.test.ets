import { afterEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { PromiseRaceTest020 } from './promisejs';
import {
  customThenable42_1,
  customThenable42_2,
  emptyObj,
  obj34,
  obj65,
  obj84,
  PromiseRaceTest033,
  PromiseRaceTest057,
  PromiseRaceTest066,
  PromiseRaceTest068,
  PromiseRaceTest077,
  thenable27_1,
  thenable27_2,
  type12,
  type86
} from './promisets';
import { sleep } from './utils';

export default function promiseRaceTest() {
  describe('promiseRaceTest', () => {
    afterEach(async () => {
      await sleep(100)
    })

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_001
     * @tc.name PromiseRaceTest001
     * @tc.desc Basic usage: the fastest resolving promise determines the result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseRaceTest001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const p1: Promise<number> = new Promise<number>(resolve => setTimeout(() => resolve(1), 200));
      const p2: Promise<number> = new Promise<number>(resolve => setTimeout(() => resolve(2), 50));
      const p3: Promise<number> = new Promise<number>(resolve => setTimeout(() => resolve(3), 350));

      const result = await Promise.race([p1, p2, p3]);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_002
     * @tc.name PromiseRaceTest002
     * @tc.desc Rejection priority: the fastest rejecting promise determines the result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseRaceTest002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const p1: Promise<number> = new Promise<number>((_, reject) => setTimeout(() => reject(new Error('Fail 1')), 280));
      const p2: Promise<number> = new Promise<number>((_, reject) => setTimeout(() => reject(new Error('Fail 2')), 40));
      const p3: Promise<number> = new Promise<number>(resolve => setTimeout(() => resolve(3), 500));

      try {
        await Promise.race([p1, p2, p3]);
        expect(true).assertFail();
      } catch (error) {
        expect((error as Error).message).assertEqual('Fail 2');
      }
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_003
     * @tc.name PromiseRaceTest003
     * @tc.desc Race between immediate resolve and delayed operations
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseRaceTest003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const immediate: Promise<string> = Promise.resolve('Immediate result');
      const delayed: Promise<string> = new Promise<string>(resolve => setTimeout(() => resolve('Delayed result'), 250));

      const result = await Promise.race([immediate, delayed]);
      expect(result).assertEqual('Immediate result');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_004
     * @tc.name PromiseRaceTest004
     * @tc.desc Race with non-promise values in the iterable
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseRaceTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await Promise.race([
        new Promise<number>(resolve => setTimeout(() => resolve(1), 300)),
        2
      ]);

      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_005
     * @tc.name PromiseRaceTest005
     * @tc.desc Timeout implementation using Promise.race
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseRaceTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const fetchData: Promise<string> = new Promise<string>(resolve =>
      setTimeout(() => resolve('Data received'), 350)
      );

      const timeout: Promise<never> = new Promise<never>((_, reject) =>
      setTimeout(() => reject(new Error('Operation timed out')), 100)
      );

      try {
        await Promise.race([fetchData, timeout]);
        expect(true).assertFail();
      } catch (error) {
        expect((error as Error).message).assertEqual('Operation timed out');
      }
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_006
     * @tc.name PromiseRaceTest006
     * @tc.desc Race between mixed resolved and rejected promises
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseRaceTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1: Promise<number> = new Promise<number>(resolve => setTimeout(() => resolve(1), 360));
      const p2: Promise<number> = new Promise<number>((_, reject) => setTimeout(() => reject(new Error('Error')), 40));
      const p3: Promise<number> = new Promise<number>(resolve => setTimeout(() => resolve(3), 580));

      try {
        await Promise.race([p1, p2, p3]);
        expect(true).assertFail();
      } catch (error) {
        expect((error as Error).message).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_007
     * @tc.name PromiseRaceTest007
     * @tc.desc Race with empty iterable (never settles)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseRaceTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const neverSettles: Promise<never> = Promise.race([]);
      const timeout: Promise<string> = new Promise<string>((_, reject) =>
      setTimeout(() => reject(new Error('Test timeout')), 100)
      );

      try {
        await Promise.race([neverSettles, timeout]);
        expect(true).assertFail();
      } catch (error) {
        expect((error as Error).message).assertEqual('Test timeout');
      }
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_008
     * @tc.name PromiseRaceTest008
     * @tc.desc Race with promises returning different data types
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseRaceTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1: Promise<string> = new Promise<string>(resolve => setTimeout(() => resolve('string'), 260));
      const p2: Promise<number> = new Promise<number>(resolve => setTimeout(() => resolve(123), 40));
      const p3: Promise<boolean> = new Promise<boolean>(resolve => setTimeout(() => resolve(true), 480));

      const result = await Promise.race<number | string | boolean>([p1, p2, p3]);
      expect(result).assertEqual(123);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_009
     * @tc.name PromiseRaceTest009
     * @tc.desc Nested Promise.race calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseRaceTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const innerRace1: Promise<number> = Promise.race([
        new Promise<number>(resolve => setTimeout(() => resolve(1), 300)),
        new Promise<number>(resolve => setTimeout(() => resolve(2), 10))
      ]);

      const innerRace2: Promise<number> = Promise.race([
        new Promise<number>(resolve => setTimeout(() => resolve(3), 200)),
        new Promise<number>(resolve => setTimeout(() => resolve(4), 400))
      ]);

      const result = await Promise.race([innerRace1, innerRace2]);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_010
     * @tc.name PromiseRaceTest010
     * @tc.desc Race with dynamically added promises
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseRaceTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const promises: Promise<number>[] = [];
      let latePromiseResolver: (value: number) => void;

      // Add initial promise
      promises.push(new Promise<number>(resolve => setTimeout(() => resolve(1), 300)));

      // Add a promise that will be resolved later
      const latePromise: Promise<number> = new Promise<number>(resolve => {
        latePromiseResolver = resolve;
      });
      promises.push(latePromise);

      // Start the race
      const raceResult = Promise.race(promises);

      // Resolve the late promise before the initial one
      setTimeout(() => latePromiseResolver(2), 50);

      const result = await raceResult;
      expect(result).assertEqual(2);
    });
    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_011
     * @tc.name PromiseRaceTest011
     * @tc.desc Race between promises with zero delay and microtasks
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseRaceTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let microtaskResult: string = '';
      const microtaskPromise: Promise<string> = Promise.resolve().then(() => {
        microtaskResult = 'microtask';
        return microtaskResult;
      });

      const zeroDelayPromise: Promise<string> = new Promise<string>(resolve =>
      setTimeout(() => resolve('zero delay'), 100)
      );

      const result = await Promise.race([microtaskPromise, zeroDelayPromise]);
      expect(result).assertEqual('microtask');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_012
     * @tc.name PromiseRaceTest012
     * @tc.desc Race with promises that resolve to promises
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseRaceTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1: Promise<Promise<number>> = new Promise<Promise<number>>(resolve =>
      setTimeout(() => resolve(Promise.resolve(1)), 250)
      );

      const p2: Promise<Promise<number>> = new Promise<Promise<number>>(resolve =>
      setTimeout(() => resolve(Promise.resolve(2)), 30)
      );

      const result = await Promise.race([p1, p2]);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_013
     * @tc.name PromiseRaceTest013
     * @tc.desc Race with chained promises of varying lengths
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseRaceTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const chain1: Promise<number> = new Promise<number>(resolve =>
      setTimeout(() => resolve(1), 10)
      ).then(num => new Promise<number>(resolve =>
      setTimeout(() => resolve(num * 2), 10)
      ));

      const chain2: Promise<number> = new Promise<number>(resolve =>
      setTimeout(() => resolve(3), 150)
      ).then(num => new Promise<number>(resolve =>
      setTimeout(() => resolve(num + 4), 150)
      )).then(num => new Promise<number>(resolve =>
      setTimeout(() => resolve(num * 2), 100)
      ));

      const result = await Promise.race([chain1, chain2]);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_014
     * @tc.name PromiseRaceTest014
     * @tc.desc Race with promises created in a loop with varying delays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseRaceTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const promises: Promise<number>[] = [];
      for (let i = 1; i <= 5; i++) {
        promises.push(new Promise<number>(resolve =>
        setTimeout(() => resolve(i), i * 100)
        ));
      }

      const result = await Promise.race(promises);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_015
     * @tc.name PromiseRaceTest015
     * @tc.desc Race between promises that modify shared state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseRaceTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let sharedValue = 0;

      const p1: Promise<number> = new Promise<number>(resolve =>
      setTimeout(() => {
        sharedValue = 10;
        resolve(sharedValue);
      }, 250)
      );

      const p2: Promise<number> = new Promise<number>(resolve =>
      setTimeout(() => {
        sharedValue = 20;
        resolve(sharedValue);
      }, 30)
      );

      const result = await Promise.race([p1, p2]);
      expect(result).assertEqual(20);
      // Verify the final state after both promises complete
      await new Promise<number>(resolve => setTimeout(resolve, 530));
      expect(sharedValue).assertEqual(10);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_016
     * @tc.name PromiseRaceTest016
     * @tc.desc Race with promises that return different object types
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseRaceTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1: Promise<type12> = new Promise<type12>(resolve =>
      setTimeout(() => resolve({ id: 1 }), 460)
      );

      const p2: Promise<string> = new Promise<string>(resolve =>
      setTimeout(() => resolve("winner"), 40)
      );

      const p3: Promise<number[]> = new Promise<number[]>(resolve =>
      setTimeout(() => resolve([1, 2, 3]), 250)
      );

      const result = await Promise.race<type12 | string | number[]>([p1, p2, p3]);
      expect(result).assertEqual("winner");
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_017
     * @tc.name PromiseRaceTest017
     * @tc.desc Race with promises that reject with different error types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseRaceTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1: Promise<void> = new Promise<void>((_, reject) =>
      setTimeout(() => reject(new TypeError('Invalid type')), 450)
      );

      const p2: Promise<void> = new Promise<void>((_, reject) =>
      setTimeout(() => reject(new RangeError('Out of range')), 30)
      );

      const p3: Promise<void> = new Promise<void>((_, reject) =>
      setTimeout(() => reject(new Error('Generic error')), 240)
      );

      try {
        await Promise.race([p1, p2, p3]);
        expect(true).assertFail();
      } catch (error) {
        expect(error instanceof RangeError).assertEqual(true);
        expect((error as Error).message).assertEqual('Out of range');
      }
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_018
     * @tc.name PromiseRaceTest018
     * @tc.desc Race between synchronous and asynchronous rejection
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseRaceTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const syncReject: Promise<never> = Promise.reject(new Error('Sync reject'));
      const asyncReject: Promise<number> = new Promise<number>((_, reject) =>
      setTimeout(() => reject(new Error('Async reject')), 100)
      );

      try {
        await Promise.race([syncReject, asyncReject]);
        expect(true).assertFail();
      } catch (error) {
        expect((error as Error).message).assertEqual('Sync reject');
      }
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_019
     * @tc.name PromiseRaceTest019
     * @tc.desc Race with promises that resolve after multiple async steps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseRaceTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const createMultiStepPromise = (value: number, delays: number[]): Promise<number> => {
        return delays.reduce((promise, delay) => {
          return promise.then(prev =>
          new Promise<number>(resolve =>
          setTimeout(() => resolve(prev + value), delay)
          )
          );
        }, Promise.resolve(0));
      };

      const p1: Promise<number> = createMultiStepPromise(1, [100, 200, 300]); // Total ~60ms
      const p2: Promise<number> = createMultiStepPromise(2, [5, 15, 25]); // Total ~45ms

      const result = await Promise.race([p1, p2]);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_020
     * @tc.name PromiseRaceTest020
     * @tc.desc Race with promises that use different timer functions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseRaceTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result: number = await PromiseRaceTest020();
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_021
     * @tc.name PromiseRaceTest021
     * @tc.desc Race between promises that resolve in reverse order of creation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseRaceTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const promises: Promise<number>[] = [];

      // Create promises that resolve faster when created later
      for (let i = 1; i <= 4; i++) {
        promises.push(new Promise<number>(resolve =>
        setTimeout(() => resolve(i), (5 - i) * 50)
        ));
      }

      const result = await Promise.race(promises);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_022
     * @tc.name PromiseRaceTest022
     * @tc.desc Race with promises that have dependent timings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseRaceTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let p2Delay = 0;

      const p1: Promise<number> = new Promise<number>(resolve =>
      setTimeout(() => {
        p2Delay = 20; // Modify p2's delay after p1 starts
        resolve(1);
      }, 100)
      );

      const p2: Promise<number> = new Promise<number>(resolve =>
      setTimeout(() => resolve(2), p2Delay)
      );

      const result = await Promise.race([p1, p2]);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_023
     * @tc.name PromiseRaceTest023
     * @tc.desc Race with promises that wrap callback-based functions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseRaceTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      // Wrap setTimeout callback in promises
      const callbackPromise = (id: number, delay: number): Promise<number> => {
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            resolve(id);
          }, delay);
        });
      };

      const result = await Promise.race([
        callbackPromise(1, 360),
        callbackPromise(2, 40),
        callbackPromise(3, 250)
      ]);

      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_024
     * @tc.name PromiseRaceTest024
     * @tc.desc Race with promises that resolve to functions
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseRaceTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1: Promise<() => number> = new Promise<() => number>(resolve =>
      setTimeout(() => resolve(() => 10), 150)
      );

      const p2: Promise<() => number> = new Promise<() => number>(resolve =>
      setTimeout(() => resolve(() => 20), 30)
      );

      const resultFn = await Promise.race([p1, p2]);
      expect(resultFn()).assertEqual(20);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_025
     * @tc.name PromiseRaceTest025
     * @tc.desc Race with very large number of promises
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseRaceTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const promises: Promise<number>[] = [];
      const winnerIndex = 42;

      // Create 100 promises where only one resolves quickly
      for (let i = 0; i < 100; i++) {
        const delay = i === winnerIndex ? 10 : 1000;
        promises.push(new Promise<number>(resolve =>
        setTimeout(() => resolve(i), delay)
        ));
      }

      const result = await Promise.race(promises);
      expect(result).assertEqual(winnerIndex);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_026
     * @tc.name PromiseRaceTest026
     * @tc.desc Race with promises that have error handlers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseRaceTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1: Promise<string> = new Promise<string>((_, reject) =>
      setTimeout(() => reject(new Error('Fail')), 20)
      ).catch((error: Error) => `Caught: ${(error as Error).message}`);

      const p2: Promise<string> = new Promise<string>(resolve =>
      setTimeout(() => resolve('Success'), 230)
      );

      // p1 rejects but catches the error, so becomes a resolving promise
      const result = await Promise.race([p1, p2]);
      expect(result).assertEqual('Caught: Fail');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_027
     * @tc.name PromiseRaceTest027
     * @tc.desc Race with promises that return thenables
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseRaceTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await Promise.race([
        thenable27_1 as Promise<number>,
        thenable27_2 as Promise<number>
      ]);

      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_028
     * @tc.name PromiseRaceTest028
     * @tc.desc Race with promises that resolve conditionally based on external state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseRaceTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let externalState = false;

      // Change state after 25ms
      setTimeout(() => {
        externalState = true;
      }, 25);

      const p1: Promise<number> = new Promise<number>((resolve) => {
        const checkState = () => {
          if (externalState) {
            resolve(1);
          } else {
            setTimeout(checkState, 5);
          }
        };
        checkState();
      });

      const p2: Promise<number> = new Promise<number>(resolve =>
      setTimeout(() => resolve(2), 400)
      );

      const result = await Promise.race([p1, p2]);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_029
     * @tc.name PromiseRaceTest029
     * @tc.desc Race with promises that are created asynchronously
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseRaceTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const promises: Promise<number>[] = [];

      // Add first promise immediately
      promises.push(new Promise<number>(resolve =>
      setTimeout(() => resolve(1), 40)
      ));

      // Add second promise after a delay
      setTimeout(() => {
        promises.push(new Promise<number>(resolve =>
        setTimeout(() => resolve(2), 120)
        ));
      }, 30);

      // The race is determined when promises settle, not when they're added
      const result = await Promise.race(promises);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_030
     * @tc.name PromiseRaceTest030
     * @tc.desc Race with promises that use AbortController for cancellation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseRaceTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let isAborted = false;
      let p1TimeoutId = -1;

      const p1 = new Promise<string>((resolve, reject) => {
        p1TimeoutId = setTimeout(() => {
          if (isAborted) {
            reject(new Error('p1 abort'));
          } else {
            resolve('p1 completed');
          }
        }, 200);
      });

      const p2 = new Promise<string>(resolve => {
        setTimeout(() => {
          isAborted = true;
          clearTimeout(p1TimeoutId);
          resolve('p2 completed');
        }, 50);
      });

      const result = await Promise.race([p1, p2]);
      expect(result).assertEqual('p2 completed');
    });
    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_031
     * @tc.name PromiseRaceTest031
     * @tc.desc Race with promises that resolve to different promise types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseRaceTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1: Promise<number> = Promise.resolve(Promise.resolve(1));
      const p2: Promise<number> = new Promise<number>(resolve => setTimeout(() => resolve(2), 200));

      const result = await Promise.race([p1, p2]);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_032
     * @tc.name PromiseRaceTest032
     * @tc.desc Race between promises with varying resolve/reject patterns
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseRaceTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1: Promise<number> = new Promise<number>((resolve) => {
        setTimeout(() => resolve(1), 250);
      });

      const p2: Promise<number> = new Promise<number>((_, reject) => {
        setTimeout(() => reject(new Error('Rejected')), 30);
      }).catch(() => new Promise<number>(resolve => setTimeout(() => resolve(2), 10)));

      const result = await Promise.race([p1, p2]);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_033
     * @tc.name PromiseRaceTest033
     * @tc.desc Race with promises that resolve after async generator yields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseRaceTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let result: number = await PromiseRaceTest033()
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_035
     * @tc.name PromiseRaceTest035
     * @tc.desc Race with promises that use different delay calculation methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseRaceTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const start = Date.now();

      const p1: Promise<number> = new Promise<number>(resolve => {
        const targetTime = start + 150;
        const check = () => {
          if (Date.now() >= targetTime) {
            resolve(1);
          } else {
            setTimeout(check, 5);
          }
        };
        check();
      });

      const p2: Promise<number> = new Promise<number>(resolve =>
      setTimeout(() => resolve(2), 30)
      );
      const result = await Promise.race([p1, p2]);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_036
     * @tc.name PromiseRaceTest036
     * @tc.desc Race with promises that return self-referential objects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseRaceTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      interface SelfRefObj {
        id: number;
        self?: SelfRefObj;
      }

      // Create self-referential object with proper typing
      const selfRefObj36: SelfRefObj = { id: 1 };
      selfRefObj36.self = selfRefObj36; // Establish self-reference

      // p1: Resolves with self-referential object after 40ms
      const p1: Promise<SelfRefObj> = new Promise<SelfRefObj>(resolve =>
      setTimeout(() => resolve(selfRefObj36), 240)
      );

      const p2: Promise<number> = new Promise<number>(resolve =>
      setTimeout(() => resolve(2), 20)
      );

      const result = await Promise.race<SelfRefObj | number>([p1, p2]);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_037
     * @tc.name PromiseRaceTest037
     * @tc.desc Race with promises that use closure state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseRaceTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {

      let createClosurePromise = (initial: number, delay: number): Promise<number> => {
        let value = initial;
        return new Promise<number>(resolve => {
          setTimeout(() => {
            value *= 2;
            resolve(value);
          }, delay);
        });
      }

      const p1: Promise<number> = createClosurePromise(3, 250);
      const p2: Promise<number> = createClosurePromise(5, 30);

      const result = await Promise.race([p1, p2]);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_038
     * @tc.name PromiseRaceTest038
     * @tc.desc Race with promises that resolve after network-like delays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseRaceTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const simulateNetwork = (latency: number, data: string): Promise<string> => {
        return new Promise<string>(resolve => {
          // Simulate variable network delay
          const actualDelay = latency + Math.random() * 20;
          setTimeout(() => resolve(data), actualDelay);
        });
      };

      const result = await Promise.race([
        simulateNetwork(600, 'Server A'),
        simulateNetwork(300, 'Server B'),
        simulateNetwork(450, 'Server C')
      ]);

      expect(result).assertEqual('Server B');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_039
     * @tc.name PromiseRaceTest039
     * @tc.desc Race with promises that use class methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseRaceTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      class AsyncOperation {
        private name: string;
        private delay: number;

        constructor(name: string, delay: number) {
          this.name = name
          this.delay = delay
        }

        execute(): Promise<string> {
          return new Promise<string>(resolve => {
            setTimeout(() => resolve(`Completed ${this.name}`), this.delay);
          });
        }
      }

      const op1 = new AsyncOperation('Operation 1', 260);
      const op2 = new AsyncOperation('Operation 2', 40);

      const result = await Promise.race([op1.execute(), op2.execute()]);
      expect(result).assertEqual('Completed Operation 2');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_040
     * @tc.name PromiseRaceTest040
     * @tc.desc Race with promises that resolve to symbols
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseRaceTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const identifier1 = 'unique-first-identifier';
      const identifier2 = 'unique-second-identifier';

      // p1: Resolves with first identifier after 50ms
      const p1: Promise<string> = new Promise<string>(resolve =>
      setTimeout(() => resolve(identifier1), 250)
      );

      // p2: Resolves with second identifier after 30ms
      const p2: Promise<string> = new Promise<string>(resolve =>
      setTimeout(() => resolve(identifier2), 30)
      );

      // Race to get the first resolved value
      const result = await Promise.race([p1, p2]);

      // Verify p2 (faster promise) wins the race
      expect(result).assertEqual(identifier2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_041
     * @tc.name PromiseRaceTest041
     * @tc.desc Race with promises that use progressive delays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseRaceTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const createProgressivePromise = (id: number, baseDelay: number): Promise<number> => {
        return new Promise<number>(resolve => {
          let delay = 0;
          const interval = setInterval(() => {
            delay += baseDelay;
            if (delay >= 100) {
              clearInterval(interval);
              resolve(id);
            }
          }, baseDelay);
        });
      };

      const result = await Promise.race([
        createProgressivePromise(1, 250), // ~120ms (30*4)
        createProgressivePromise(2, 20), // ~100ms (20*5)
        createProgressivePromise(3, 25)// ~100ms (25*4)
      ]);

      expect([2, 3]).assertContain(result);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_042
     * @tc.name PromiseRaceTest042
     * @tc.desc Race with promises that have custom then methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseRaceTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await Promise.race([
        customThenable42_1 as Promise<number>,
        customThenable42_2 as Promise<number>
      ]);

      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_043
     * @tc.name PromiseRaceTest043
     * @tc.desc Race with promises that use shared timers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseRaceTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const timerIds: number[] = [];
      let cleanupCalled = false;

      const p1: Promise<number> = new Promise<number>(resolve => {
        const id = setTimeout(() => resolve(1), 260);
        timerIds.push(id);
      });

      const p2: Promise<number> = new Promise<number>(resolve => {
        const id = setTimeout(() => {
          // Clean up other timers
          timerIds.forEach(clearTimeout);
          cleanupCalled = true;
          resolve(2);
        }, 40);
        timerIds.push(id);
      });

      const result = await Promise.race([p1, p2]);
      expect(result).assertEqual(2);
      expect(cleanupCalled).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_044
     * @tc.name PromiseRaceTest044
     * @tc.desc Race with promises that resolve to big integers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseRaceTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const big1 = BigInt('1000000000000000000000');
      const big2 = BigInt('2000000000000000000000');

      const p1: Promise<bigint> = new Promise<bigint>(resolve =>
      setTimeout(() => resolve(big1), 250)
      );

      const p2: Promise<bigint> = new Promise<bigint>(resolve =>
      setTimeout(() => resolve(big2), 30)
      );

      const result = await Promise.race([p1, p2]);
      expect(result).assertEqual(big2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_045
     * @tc.name PromiseRaceTest045
     * @tc.desc Race with promises that use recursive resolution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseRaceTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const recursiveResolve = (value: number, depth: number, delay: number): Promise<number> => {
        if (depth === 0) {
          return new Promise<number>(resolve => setTimeout(() => resolve(value), delay));
        }
        return new Promise<number>(resolve =>
        setTimeout(() => resolve(recursiveResolve(value, depth - 1, delay / 2)), delay)
        );
      };

      const p1: Promise<number> = recursiveResolve(1, 3, 140); // ~40 + 20 + 10 + 5 = 75ms
      const p2: Promise<number> = recursiveResolve(2, 2, 30); // ~30 + 15 + 7.5 = 52.5ms

      const result = await Promise.race([p1, p2]);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_046
     * @tc.name PromiseRaceTest046
     * @tc.desc Race with promises that use WeakMap for state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseRaceTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const stateMap = new WeakMap<object, number>();
      const key1 = emptyObj;
      const key2 = emptyObj;

      stateMap.set(key1, 10);
      stateMap.set(key2, 20);

      const p1: Promise<number> = new Promise<number>(resolve =>
      setTimeout(() => resolve(stateMap.get(key1)!), 250)
      );

      const p2: Promise<number> = new Promise<number>(resolve =>
      setTimeout(() => resolve(stateMap.get(key2)!), 30)
      );

      const result = await Promise.race([p1, p2]);
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_047
     * @tc.name PromiseRaceTest047
     * @tc.desc Race with promises that resolve after animation frames
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseRaceTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const waitForFrames = (frames: number, value: number): Promise<number> => {
        return new Promise<number>(resolve => {
          let count = 0;
          const frameDuration = 160; // Approximate ms per frame at 60fps

          const check = () => {
            count++;
            if (count >= frames) {
              resolve(value);
            } else {
              setTimeout(check, frameDuration);
            }
          };

          // Start the first check
          setTimeout(check, frameDuration);
        });
      };

      // 3 frames ~48ms, 2 frames ~32ms - 2 frames should resolve first
      const result = await Promise.race([
        waitForFrames(3, 1),
        waitForFrames(2, 2)
      ]);

      // Verify the faster promise (2 frames) wins
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_048
     * @tc.name PromiseRaceTest048
     * @tc.desc Race with promises that use different error propagation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseRaceTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      class CustomError extends Error {
        constructor(message: string) {
          super(message);
          this.name = 'CustomError';
        }
      }

      const p1: Promise<number> = new Promise<number>((_, reject) =>
      setTimeout(() => reject(new CustomError('Error 1')), 240)
      );

      const p2: Promise<number> = new Promise<number>((_, reject) =>
      setTimeout(() => reject(new Error('Error 2')), 20)
      );

      try {
        await Promise.race([p1, p2]);
        expect(true).assertFail();
      } catch (error) {
        expect((error as Error).message).assertEqual('Error 2');
        expect(error instanceof CustomError).assertEqual(false);
      }
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_049
     * @tc.name PromiseRaceTest049
     * @tc.desc Race with promises that resolve to functions with side effects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseRaceTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let sideEffectCount = 0;

      const createEffectPromise = (value: number, delay: number): Promise<() => number> => {
        return new Promise<() => number>(resolve => {
          setTimeout(() => {
            resolve(() => {
              sideEffectCount++;
              return value;
            });
          }, delay);
        });
      };

      const resultFn = await Promise.race([
        createEffectPromise(1, 250),
        createEffectPromise(2, 30)
      ]);

      const result = resultFn();
      expect(result).assertEqual(2);
      expect(sideEffectCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_050
     * @tc.name PromiseRaceTest050
     * @tc.desc Race with promises that use dynamic module imports
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseRaceTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      // Mock dynamic imports with different delays
      const mockImport = (moduleName: string, delay: number): Promise<string> => {
        return new Promise<string>(resolve =>
        setTimeout(() => resolve(`Loaded ${moduleName}`), delay)
        );
      };

      const result = await Promise.race([
        mockImport('moduleA', 360),
        mockImport('moduleB', 40),
        mockImport('moduleC', 150)
      ]);

      expect(result).assertEqual('Loaded moduleB');
    });
    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_051
     * @tc.name PromiseRaceTest051
     * @tc.desc Multi-level nested promise race with varying depths
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRaceTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      // Level 3 nested promise
      const level3: Promise<Promise<Promise<number>>> = new Promise<Promise<Promise<number>>>(resolve =>
      setTimeout(() => resolve(
        new Promise<Promise<number>>(resolve =>
        setTimeout(() => resolve(
          new Promise<number>(resolve => setTimeout(() => resolve(1), 10))
        ), 10)
        )
      ), 10)
      );

      // Level 2 nested promise
      const level2: Promise<Promise<number>> = new Promise<Promise<number>>(resolve =>
      setTimeout(() => resolve(
        new Promise<number>(resolve => setTimeout(() => resolve(2), 250))
      ), 25)
      );

      // Level 1 promise
      const level1: Promise<number> = new Promise<number>(resolve =>
      setTimeout(() => resolve(3), 160)
      );

      const result = await Promise.race([level3, level2, level1]);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_052
     * @tc.name PromiseRaceTest052
     * @tc.desc Race between cascading async operations with dependent timings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRaceTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let step1Complete = false;

      // Cascade 1: 10ms → 20ms → 30ms (total ~60ms)
      const cascade1: Promise<number> = new Promise<number>(resolve =>
      setTimeout(() => {
        step1Complete = true;
        resolve(1);
      }, 10)
      ).then(num => new Promise<number>(resolve =>
      setTimeout(() => resolve(num * 2), 120)
      )).then(num => new Promise<number>(resolve =>
      setTimeout(() => resolve(num + 3), 130)
      ));

      // Cascade 2: Waits for step1Complete then 30ms (total ~40ms)
      const cascade2: Promise<number> = new Promise<number>(resolve => {
        const check = () => {
          if (step1Complete) {
            setTimeout(() => resolve(10), 30);
          } else {
            setTimeout(check, 5);
          }
        };
        check();
      });

      const result = await Promise.race([cascade1, cascade2]);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_054
     * @tc.name PromiseRaceTest054
     * @tc.desc Race between promises with interleaved micro and macro tasks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRaceTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const log: string[] = [];

      const p1: Promise<string> = new Promise<string>(resolve => {
        setTimeout(() => {
          log.push('p1 macro 1');
          Promise.resolve().then(() => {
            log.push('p1 micro 1');
            setTimeout(() => {
              log.push('p1 macro 2');
              resolve('p1 done');
            }, 0);
          });
        }, 10);
      });

      const p2: Promise<string> = new Promise<string>(resolve => {
        setTimeout(() => {
          log.push('p2 macro 1');
          Promise.resolve().then(() => {
            log.push('p2 micro 1');
            resolve('p2 done');
          });
        }, 150);
      });

      const result = await Promise.race([p1, p2]);
      expect(result).assertEqual('p1 done');
      expect(log).assertDeepEquals(['p1 macro 1', 'p1 micro 1', 'p1 macro 2']);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_055
     * @tc.name PromiseRaceTest055
     * @tc.desc Race with dynamically built promise chains
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRaceTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {

      let buildChain = (values: number[], delays: number[]): Promise<number> => {
        return values.reduce((promise, value, index) => {
          return promise.then(prev =>
          new Promise<number>(resolve =>
          setTimeout(() => resolve(prev + value), delays[index])
          )
          );
        }, Promise.resolve(0));
      }

      // Chain 1: 0 + 1 (10ms) + 2 (20ms) + 3 (30ms) → 6ms total
      const chain1: Promise<number> = buildChain([1, 2, 3], [100, 20, 300]);

      // Chain 2: 0 + 5 (5ms) + 5 (15ms) → 20ms total
      const chain2: Promise<number> = buildChain([5, 5], [5, 15]);

      const result = await Promise.race([chain1, chain2]);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_056
     * @tc.name PromiseRaceTest056
     * @tc.desc Race with promises that use nested Promise.race calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRaceTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      // Inner races with different timings
      const innerRace1: Promise<number> = Promise.race([
        new Promise<number>(resolve => setTimeout(() => resolve(1), 200)),
        new Promise<number>(resolve => setTimeout(() => resolve(2), 100))
      ]);

      const innerRace2: Promise<number> = Promise.race([
        new Promise<number>(resolve => setTimeout(() => resolve(3), 150)),
        Promise.race([
          new Promise<number>(resolve => setTimeout(() => resolve(4), 5)),
          new Promise<number>(resolve => setTimeout(() => resolve(5), 100))
        ])
      ]);

      // Outer race between inner races
      const result = await Promise.race([
        innerRace1.then(num => num * 10),
        innerRace2.then(num => num * 10)
      ]);

      expect(result).assertEqual(40);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_057
     * @tc.name PromiseRaceTest057
     * @tc.desc Race with promises that resolve after async generator chains
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRaceTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await PromiseRaceTest057();
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_058
     * @tc.name PromiseRaceTest058
     * @tc.desc Race with promises that use time-based progression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRaceTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const startTime = Date.now();
      const p1: Promise<number> = new Promise<number>(resolve => {
        const check = () => {
          const elapsed = Date.now() - startTime;
          if (elapsed >= 500) {
            resolve(1);
          } else {
            // Use standard setTimeout with 5ms interval for checking
            setTimeout(check, 50);
          }
        };
        check();
      });

      // p2: Uses interval-based timing (unchanged core logic)
      const p2: Promise<number> = new Promise<number>(resolve => {
        let elapsed = 0;
        const interval = setInterval(() => {
          elapsed += 10;
          if (elapsed >= 40) {
            clearInterval(interval);
            resolve(2);
          }
        }, 10);
      });

      // Race to get first resolved promise
      const result = await Promise.race([p1, p2]);

      // Verify p2 wins the race
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_059
     * @tc.name PromiseRaceTest059
     * @tc.desc Race between promises with complex dependency graphs
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 5
     */
    it('PromiseRaceTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      // Create independent base promises
      const base1: Promise<number> = new Promise<number>(resolve => setTimeout(() => resolve(10), 10));
      const base2: Promise<number> = new Promise<number>(resolve => setTimeout(() => resolve(20), 15));
      const base3: Promise<number> = new Promise<number>(resolve => setTimeout(() => resolve(30), 5));

      // Create dependent promises
      const dep1: Promise<number> = Promise.all([base1, base2]).then((res: number[]) => res[0] + res[1]);
      const dep2: Promise<number> = base3.then(num => new Promise<number>(resolve =>
      setTimeout(() => resolve(num * 2), 200)
      ));
      const dep3: Promise<number> = Promise.race([base1, base3]).then(num => num + 5);

      // Final race between dependent promises
      const result = await Promise.race([dep1, dep2, dep3]);
      expect(result).assertEqual(35);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_061
     * @tc.name PromiseRaceTest061
     * @tc.desc Race with promises that resolve after multiple parallel steps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRaceTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const parallelStep = (delay: number, value: number): Promise<number> => {
        return new Promise<number>(resolve => setTimeout(() => resolve(value), delay));
      };

      const p1: Promise<number> = Promise.all([
        parallelStep(120, 10),
        parallelStep(130, 20)
      ]).then((res: number[]) => res[0] + res[1]);

      const p2: Promise<number> = Promise.all([
        parallelStep(15, 15),
        parallelStep(25, 25)
      ]).then((res: number[]) => res[0] + res[1]);

      const result = await Promise.race([p1, p2]);
      expect(result).assertEqual(40);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_062
     * @tc.name PromiseRaceTest062
     * @tc.desc Race with promises that use mixed parallel and sequential steps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRaceTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      // Sequence with parallel steps in between
      const workflow1: Promise<number> = new Promise<number>(resolve =>
      setTimeout(() => resolve(1), 10)
      ).then(num => Promise.all([
        Promise.resolve(num * 2),
        new Promise<number>(resolve => setTimeout(() => resolve(5), 15))
      ])).then((res: number[]) => new Promise<number>(resolve =>
      setTimeout(() => resolve(res[0] + res[1]), 100)
      ));

      const workflow2: Promise<number> = new Promise<number>(resolve =>
      setTimeout(() => resolve(2), 5)
      ).then(num => Promise.all([
        new Promise<number>(resolve => setTimeout(() => resolve(num * 3), 10)),
        Promise.resolve(8)
      ])).then((res: number[]) => new Promise<number>(resolve =>
      setTimeout(() => resolve(res[0] + res[1]), 15)
      ));

      const result = await Promise.race([workflow1, workflow2]);
      expect(result).assertEqual(14);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_065
     * @tc.name PromiseRaceTest065
     * @tc.desc Race with promises that use async retry logic with backoff
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRaceTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let attemptCounts = obj65;

      let withBackoff = (id: string, maxAttempts: number, initialDelay: number): Promise<number> => {
        return new Promise<number>((resolve, reject) => {
          setTimeout(() => {
            attemptCounts[id]++;
            // Fail first attempt, succeed on second
            if (attemptCounts[id] < 2) {
              reject(new Error('Temporary failure'));
            } else {
              resolve(parseInt(id.replace('p', '')));
            }
          }, initialDelay);
        }).catch((error: Error) => {
          if (attemptCounts[id] < maxAttempts) {
            return withBackoff(id, maxAttempts, initialDelay * 2);
          }
          return Promise.reject(error);
        });
      }

      const p1: Promise<number> = withBackoff('p1', 3, 100); // 10ms (fail) → 20ms (success) → total ~30ms
      const p2: Promise<number> = withBackoff('p2', 3, 5); // 5ms (fail) → 10ms (success) → total ~15ms

      const result = await Promise.race([p1, p2]);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_068
     * @tc.name PromiseRaceTest068
     * @tc.desc Race with promises that use async iterators with varying yields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRaceTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let result = await PromiseRaceTest068()
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_069
     * @tc.name PromiseRaceTest069
     * @tc.desc Race with promises that use dynamic timeout adjustment based on performance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRaceTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1: Promise<number> = new Promise<number>(resolve => {
        const start = Date.now(); // Use Date.now() instead of performance.now()
        const check = () => {
          const elapsed = Date.now() - start;
          // Adjust target time based on elapsed time
          const target = elapsed > 20 ? 30 : 50;

          if (elapsed >= target) {
            resolve(1);
          } else {
            setTimeout(check, 5);
          }
        };
        check();
      });

      // p2: Uses interval logic with clear timing
      const p2: Promise<number> = new Promise<number>(resolve => {
        let iterations = 0;
        const interval = setInterval(() => {
          iterations++;
          // Double interval after 3 iterations (original logic preserved)
          if (iterations >= 3) {
            clearInterval(interval);
            setTimeout(() => resolve(2), 100);
          }
        }, 10); // 10ms interval
      });

      // Race to get first resolved promise
      const result = await Promise.race([p1, p2]);

      // Verify p2 wins the race
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_070
     * @tc.name PromiseRaceTest070
     * @tc.desc Race with promises that resolve after multiple nested Promise.all calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRaceTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const nestedAll1: Promise<number> = Promise.all([
        Promise.all([
          new Promise<number>(resolve => setTimeout(() => resolve(1), 10)),
          new Promise<number>(resolve => setTimeout(() => resolve(2), 15))
        ]).then((res: number[]) => res[0] + res[1]),
        new Promise<number>(resolve => setTimeout(() => resolve(3), 200))
      ]).then((res: number[]) => res[0] * res[1]);

      const nestedAll2: Promise<number> = Promise.all([
        new Promise<number>(resolve => setTimeout(() => resolve(4), 5)),
        Promise.all([
          new Promise<number>(resolve => setTimeout(() => resolve(5), 10)),
          new Promise<number>(resolve => setTimeout(() => resolve(6), 12))
        ]).then((res: number[]) => res[0] + res[1])
      ]).then((res: number[]) => res[0] * res[1]);

      const result = await Promise.race([nestedAll1, nestedAll2]);
      expect(result).assertEqual(44);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_071
     * @tc.name PromiseRaceTest071
     * @tc.desc Race with promises that use async error recovery chains
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRaceTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1: Promise<string> = new Promise<string>((_, reject) =>
      setTimeout(() => reject(new Error('Failure A')), 10)
      ).catch((error: Error) => {
        return new Promise<string>((_, reject) =>
        setTimeout(() => reject(new Error('Failure B')), 15)
        );
      }).catch((error: Error) => {
        return new Promise<string>(resolve =>
        setTimeout(() => resolve('Recovery 1'), 150)
        );
      }); // Total ~30ms

      const p2: Promise<string> = new Promise<string>((_, reject) =>
      setTimeout(() => reject(new Error('Failure X')), 5)
      ).catch((error: Error) => {
        return new Promise<string>(resolve =>
        setTimeout(() => resolve('Recovery 2'), 20)
        );
      }); // Total ~25ms

      const result = await Promise.race([p1, p2]);
      expect(result).assertEqual('Recovery 2');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_074
     * @tc.name PromiseRaceTest074
     * @tc.desc Race with promises that use async memoization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRaceTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const memo = new Map<string, Promise<number>>();

      let memoizedAsync = (key: string, delay: number, value: number): Promise<number> => {
        if (memo.has(key)) {
          return memo.get(key)!;
        }

        const promise = new Promise<number>(resolve =>
        setTimeout(() => resolve(value), delay)
        );
        memo.set(key, promise);
        return promise;
      }

      // First call - no memoization
      const p1: Promise<number> = memoizedAsync('data', 130, 10);

      // Second call - uses memoized promise
      const p2: Promise<number> = memoizedAsync('data', 200, 20);

      // Different key - no memoization
      const p3: Promise<number> = memoizedAsync('other', 20, 15);

      const result = await Promise.race([p1, p2, p3]);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_075
     * @tc.name PromiseRaceTest075
     * @tc.desc Race with promises that resolve after async validation with dependencies
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRaceTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const validateA = (): Promise<boolean> =>
      new Promise<boolean>(resolve => setTimeout(() => resolve(true), 10));

      const validateB = (): Promise<boolean> =>
      new Promise<boolean>(resolve => setTimeout(() => resolve(true), 150));

      const validateC = (): Promise<boolean> =>
      new Promise<boolean>(resolve => setTimeout(() => resolve(true), 5));

      const p1: Promise<string> = validateA()
        .then(valid => valid ? validateB() : Promise.reject())
        .then(valid => valid ? 'Validation 1 complete' : '');

      const p2: Promise<string> = validateC()
        .then(valid => valid ? new Promise<string>(resolve =>
        setTimeout(() => resolve('Validation 2 complete'), 10)
        ) : '');

      const result = await Promise.race([p1, p2]);
      expect(result).assertEqual('Validation 2 complete');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_076
     * @tc.name PromiseRaceTest076
     * @tc.desc Race with promises that use recursive async composition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRaceTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {

      let composeAsync = (
        value: number,
        depth: number,
        delay: number
      ): Promise<number> => {
        if (depth === 0) {
          return Promise.resolve(value);
        }

        return new Promise<number>(resolve =>
        setTimeout(() => {
          resolve(composeAsync(value * 2, depth - 1, delay / 2));
        }, delay)
        );
      }

      // Depth 3: 3 → 6 → 12 → 24 with delays 40 → 20 → 10 → total ~70ms
      const p1: Promise<number> = composeAsync(3, 3, 240);

      // Depth 2: 5 → 10 → 20 with delays 30 → 15 → total ~45ms
      const p2: Promise<number> = composeAsync(5, 2, 30);

      const result = await Promise.race([p1, p2]);
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_077
     * @tc.name PromiseRaceTest077
     * @tc.desc Race with promises that use async event emitters pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRaceTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let result = await PromiseRaceTest077()
      // Verify the earliest signal (value 3) wins
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_078
     * @tc.name PromiseRaceTest078
     * @tc.desc Race with promises that use varying async iteration strategies
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRaceTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      // Batched processing
      const batchProcess = async (items: number[], batchSize: number, delay: number): Promise<number> => {
        let total = 0;
        for (let i = 0; i < items.length; i += batchSize) {
          const batch = items.slice(i, i + batchSize);
          await new Promise<void>(resolve => setTimeout(resolve, delay));
          total += batch.reduce((sum, item) => sum + item, 0);
        }
        return total;
      };

      // Sequential processing
      const sequentialProcess = async (items: number[], delay: number): Promise<number> => {
        let total = 0;
        for (const item of items) {
          await new Promise<void>(resolve => setTimeout(resolve, delay));
          total += item;
        }
        return total;
      };

      const items = [1, 2, 3, 4, 5];

      const p1: Promise<number> = batchProcess(items, 2, 100); // 3 batches × 10ms = 30ms
      const p2: Promise<number> = sequentialProcess(items, 5); // 5 items × 5ms = 25ms

      const result = await Promise.race([p1, p2]);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_080
     * @tc.name PromiseRaceTest080
     * @tc.desc Race with promises that use complex time-based decision trees
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRaceTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const startTime = Date.now();

      const decisionTree = async (id: number, initialDelay: number): Promise<number> => {
        await new Promise<void>(resolve => setTimeout(resolve, initialDelay));
        const elapsed = Date.now() - startTime;

        // Different paths based on elapsed time
        if (elapsed < 20) {
          await new Promise<void>(resolve => setTimeout(resolve, 100));
          return id * 10;
        } else if (elapsed < 40) {
          await new Promise<void>(resolve => setTimeout(resolve, 50));
          return id * 20;
        } else {
          return id * 30;
        }
      };

      const p1: Promise<number> = decisionTree(1, 150); // ~15ms initial → ~10ms extra → total ~25ms
      const p2: Promise<number> = decisionTree(2, 100); // ~10ms initial → ~10ms extra → total ~20ms

      const result = await Promise.race([p1, p2]);
      expect(result).assertEqual(60);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_081
     * @tc.name PromiseRaceTest081
     * @tc.desc Race with promises that use async validation chains with branching
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRaceTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const validate = (value: number, delay: number): Promise<number> => {
        return new Promise<number>((resolve) => {
          setTimeout(() => resolve(value), delay);
        });
      };

      const branch1 = (value: number): Promise<number> => {
        return validate(value, 10).then(num => {
          if (num > 5) {
            return validate(num * 2, 150);
          } else {
            return validate(num + 3, 5);
          }
        });
      };

      const branch2 = (value: number): Promise<number> => {
        return validate(value, 5).then(num => {
          if (num % 2 === 0) {
            return validate(num - 2, 20);
          } else {
            return validate(num * 3, 10);
          }
        });
      };

      const p1: Promise<number> = branch1(7); // 10ms → 15ms → total ~25ms
      const p2: Promise<number> = branch2(3); // 5ms → 10ms → total ~15ms

      const result = await Promise.race([p1, p2]);
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_082
     * @tc.name PromiseRaceTest082
     * @tc.desc Race with promises that use async middleware pipelines
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRaceTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      type Middleware = (value: number) => Promise<number>;

      const createMiddleware = (delay: number, factor: number): Middleware => {
        return (value: number) => new Promise<number>(resolve =>
        setTimeout(() => resolve(value * factor), delay)
        );
      };

      const pipeline = (value: number, middleware: Middleware[]): Promise<number> => {
        return middleware.reduce((promise, mw) => {
          return promise.then(mw);
        }, Promise.resolve(value));
      };

      // Pipeline 1: 2 → ×2 (10ms) → ×3 (15ms) → ×1 (5ms) → total ~30ms
      const pipeline1: Promise<number> = pipeline(2, [
        createMiddleware(10, 2),
        createMiddleware(150, 3),
        createMiddleware(5, 1)
      ]);

      // Pipeline 2: 3 → ×3 (5ms) → ×2 (10ms) → ×2 (10ms) → total ~25ms
      const pipeline2: Promise<number> = pipeline(3, [
        createMiddleware(5, 3),
        createMiddleware(10, 2),
        createMiddleware(10, 2)
      ]);

      const result = await Promise.race([pipeline1, pipeline2]);
      expect(result).assertEqual(36);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_083
     * @tc.name PromiseRaceTest083
     * @tc.desc Race with promises that use dynamic async task queues
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRaceTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      class AsyncQueue {
        private tasks: Array<() => Promise<number>> = [];

        addTask(task: () => Promise<number>) {
          this.tasks.push(task);
        }

        process(): Promise<number> {
          return this.tasks.reduce((promise, task) => {
            return promise.then(total => task().then(value => total + value));
          }, Promise.resolve(0));
        }
      }

      const queue1 = new AsyncQueue();
      queue1.addTask(() => new Promise<number>(resolve => setTimeout(() => resolve(10), 10)));
      queue1.addTask(() => new Promise<number>(resolve => setTimeout(() => resolve(20), 150)));

      const queue2 = new AsyncQueue();
      queue2.addTask(() => new Promise<number>(resolve => setTimeout(() => resolve(15), 5)));
      queue2.addTask(() => new Promise<number>(resolve => setTimeout(() => resolve(25), 10)));

      const result = await Promise.race([queue1.process(), queue2.process()]);
      expect(result).assertEqual(40);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_085
     * @tc.name PromiseRaceTest085
     * @tc.desc Race with promises that use async circuit breakers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRaceTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      class CircuitBreaker {
        private failures = 0;
        private readonly failureThreshold: number;

        constructor(failureThreshold: number) {
          this.failureThreshold = failureThreshold;
        }

        execute<T>(operation: () => Promise<T>, delay: number): Promise<T> {
          if (this.failures >= this.failureThreshold) {
            return Promise.reject(new Error('Circuit open'));
          }

          return new Promise<T>((resolve, reject) => {
            setTimeout(() => {
              try {
                // Execute the operation and handle its result
                const result = operation();
                // Since operation returns a promise, we need to handle it properly
                result.then(value => {
                  this.failures = 0;
                  resolve(value);
                }).catch((error: Error) => {
                  this.failures++;
                  reject(error);
                });
              } catch (error) {
                this.failures++;
                reject(error);
              }
            }, delay);
          });
        }
      }

      const breaker1 = new CircuitBreaker(2);
      // Force failure then success for predictable timing
      const p1: Promise<number> = breaker1.execute(
        () => Promise.reject(new Error('Fail')), // First attempt fails
        10
      ).catch(() =>
      breaker1.execute(() => Promise.resolve(1), 200) // Second attempt succeeds
      );

      // Create second circuit breaker with threshold 1
      const breaker2 = new CircuitBreaker(1);
      // Force success on first attempt for predictable timing
      const p2: Promise<number> = breaker2.execute(
        () => Promise.resolve(2), // First attempt succeeds
        5
      ).catch(() =>
      breaker2.execute(() => Promise.resolve(2), 15)
      );

      // Race to get first resolved promise
      const result = await Promise.race([p1, p2]);

      // Verify p2 wins the race
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_086
     * @tc.name PromiseRaceTest086
     * @tc.desc Race with promises that use async caching with TTL
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRaceTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const cache = new Map<string, type86>();

      const getWithCache = (key: string, ttl: number, delay: number, value: number): Promise<number> => {
        const entry = cache.get(key);
        if (entry && entry.expiry > Date.now()) {
          return Promise.resolve(entry.value);
        }

        return new Promise<number>(resolve => {
          setTimeout(() => {
            const valueToCache = value;
            cache.set(key, {
              value: valueToCache,
              expiry: Date.now() + ttl
            });
            resolve(valueToCache);
          }, delay);
        });
      };

      // First call - no cache
      const p1: Promise<number> = getWithCache('key1', 1000, 130, 10);

      // Second call - uses cache if available
      const p2: Promise<number> = getWithCache('key1', 1000, 200, 20);

      // Different key - no cache
      const p3: Promise<number> = getWithCache('key2', 1000, 20, 15);

      const result = await Promise.race([p1, p2, p3]);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_087
     * @tc.name PromiseRaceTest087
     * @tc.desc Race with promises that use async rate limiting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRaceTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      class RateLimiter {
        private lastExecution = 0;
        private readonly interval: number;

        constructor(interval: number) {
          this.interval = interval;
        }

        execute<T>(operation: () => T, value: T): Promise<T> {
          const now = Date.now();
          const delay = Math.max(0, this.interval - (now - this.lastExecution));

          return new Promise<T>(resolve => {
            setTimeout(() => {
              this.lastExecution = Date.now();
              resolve(value);
            }, delay);
          });
        }
      }

      const limiter1 = new RateLimiter(200);
      const p1: Promise<number> = limiter1.execute(() => 1, 1)
        .then(() => limiter1.execute(() => 1, 1));

      const limiter2 = new RateLimiter(10);
      const p2: Promise<number> = limiter2.execute(() => 2, 2)
        .then(() => limiter2.execute(() => 2, 2));

      const result = await Promise.race([p1, p2]);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_088
     * @tc.name PromiseRaceTest088
     * @tc.desc Race with promises that use async batching with dynamic sizes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRaceTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const processBatch = (batch: number[], delay: number): Promise<number> => {
        return new Promise<number>(resolve => {
          setTimeout(() => {
            resolve(batch.reduce((sum, item) => sum + item, 0));
          }, delay);
        });
      };

      const dynamicBatching = async (items: number[], initialBatchSize: number): Promise<number> => {
        let total = 0;
        let batchSize = initialBatchSize;
        let index = 0;

        while (index < items.length) {
          const batch = items.slice(index, index + batchSize);
          total += await processBatch(batch, batchSize * 50);
          index += batchSize;
          batchSize = Math.min(batchSize * 2, items.length - index); // Double batch size each time
        }

        return total;
      };

      const items = [1, 2, 3, 4, 5, 6, 7, 8];

      // Batch sizes: 2 → 4 → 2 (total delay: 10 + 20 + 10 = 40ms)
      const p1: Promise<number> = dynamicBatching(items, 2);

      // Batch sizes: 1 → 2 → 4 → 1 (total delay: 5 + 10 + 20 + 5 = 40ms)
      const p2: Promise<number> = dynamicBatching(items, 1);

      const result = await Promise.race([p1, p2]);
      expect(result).assertEqual(36);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_089
     * @tc.name PromiseRaceTest089
     * @tc.desc Race with promises that use async retry with exponential backoff
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRaceTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const withExponentialBackoff = (id: number, maxRetries: number): Promise<number> => {
        let attempts = 0;

        const attempt = (): Promise<number> => {
          attempts++;
          return new Promise<number>((resolve, reject) => {
            // Fail first two attempts
            if (attempts <= 2) {
              const delay = Math.pow(2, attempts) * 50; // 10ms, 20ms
              setTimeout(() => reject(new Error('Temporary failure')), delay);
            } else {
              // Succeed on third attempt
              resolve(id);
            }
          }).catch((error: Error) => {
            if (attempts < maxRetries) {
              return attempt();
            }
            return Promise.reject(error);
          });
        };

        return attempt();
      };

      // Retry pattern: fail (10ms) → fail (20ms) → succeed → total ~30ms
      const p1: Promise<number> = withExponentialBackoff(1, 3);

      // Retry pattern: fail (10ms) → fail (20ms) → succeed → total ~30ms
      const p2: Promise<number> = withExponentialBackoff(2, 3);

      const result = await Promise.race([p1, p2]);
      // Either 1 or 2 is acceptable as they finish around the same time
      expect([1, 2]).assertContain(result);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_090
     * @tc.name PromiseRaceTest090
     * @tc.desc Race with promises that use complex async workflow patterns
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 5
     */
    it('PromiseRaceTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      // Simulate a complex workflow with multiple stages
      const stage1 = (value: number): Promise<number> =>
      new Promise<number>(resolve => setTimeout(() => resolve(value * 2), 10));

      const stage2 = (value: number): Promise<number> =>
      new Promise<number>(resolve => setTimeout(() => resolve(value + 5), 15));

      const stage3 = (value: number): Promise<number> =>
      new Promise<number>(resolve => setTimeout(() => resolve(value * 3), 20));

      // Workflow 1: Sequential stages with some parallel steps
      const workflow1: Promise<number> = stage1(2)
        .then(num => Promise.all([
          stage2(num),
          new Promise<number>(resolve => setTimeout(() => resolve(10), 5))
        ]))
        .then((res: number[]) => stage3(res[0] + res[1]));

      // Workflow 2: Different sequence with conditional steps
      const workflow2: Promise<number> = stage2(3)
        .then(num => {
          if (num > 5) {
            return stage1(num);
          }
          return Promise.resolve(num);
        })
        .then(num => stage3(num));

      const result = await Promise.race([workflow1, workflow2]);
      expect(result == 57 || result == 48).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_091
     * @tc.name PromiseRaceTest091
     * @tc.desc Race between Promise.all and Promise.allSettled with different completion times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 5
     */
    it('PromiseRaceTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      // All settled completes faster but with more results
      const allSettledPromise = Promise.allSettled([
        new Promise<number>(resolve => setTimeout(() => resolve(1), 10)),
        new Promise<number>((_, reject) => setTimeout(() => reject(new Error('Fail')), 15))
      ]);

      // All completes slower but with successful results only
      const allPromise = Promise.all([
        new Promise<number>(resolve => setTimeout(() => resolve(2), 20)),
        new Promise<number>(resolve => setTimeout(() => resolve(3), 250))
      ]);

      const result = await Promise.race([allSettledPromise, allPromise]);

      // Verify we got the allSettled result which should complete first
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(2);
      expect((result[0] as PromiseFulfilledResult<number>).value).assertEqual(1);
      expect(((result[1] as PromiseRejectedResult).reason as Error).message).assertEqual('Fail');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_092
     * @tc.name PromiseRaceTest092
     * @tc.desc Race between resolved promise and pending promise chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRaceTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      // Immediately resolved promise
      const resolvedPromise = Promise.resolve(100);

      // Longer promise chain that would resolve later
      const chainPromise = new Promise<number>(resolve => setTimeout(() => resolve(1), 100))
        .then(num => new Promise<number>(resolve => setTimeout(() => resolve(num * 2), 5)))
        .then(num => num + 3);

      const result = await Promise.race([resolvedPromise, chainPromise]);
      expect(result).assertEqual(100); // Resolved promise should win
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_093
     * @tc.name PromiseRaceTest093
     * @tc.desc Race between rejected promise and slow-resolving promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRaceTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      // Rejected promise with delay
      const rejectedPromise = new Promise<number>((_, reject) =>
      setTimeout(() => reject(new Error('Expected error')), 15)
      );

      // Slower resolving promise
      const slowPromise = new Promise<number>(resolve =>
      setTimeout(() => resolve(200), 200)
      );
      let err = ''
      await Promise.race([rejectedPromise, slowPromise]).catch((e: Error) => {
        err = e.message
      })
      // Race should reject because rejectedPromise is faster
      expect(err).assertEqual('Expected error')
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_094
     * @tc.name PromiseRaceTest094
     * @tc.desc Race between mixed all/race combinations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 5
     */
    it('PromiseRaceTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      // Combination 1: race inside all
      const combo1 = Promise.all([
        Promise.race([
          new Promise<string>(resolve => setTimeout(() => resolve('fast'), 5)),
          new Promise<string>(resolve => setTimeout(() => resolve('slow'), 150))
        ]),
        new Promise<string>(resolve => setTimeout(() => resolve('fixed'), 10))
      ]);

      // Combination 2: all inside race
      const combo2 = Promise.race([
        Promise.all([
          new Promise<number>(resolve => setTimeout(() => resolve(1), 8)),
          new Promise<number>(resolve => setTimeout(() => resolve(2), 120))
        ]),
        new Promise<string>(resolve => setTimeout(() => resolve('winner'), 180))
      ]);

      const result = await Promise.race([combo1, combo2]);

      // combo1 should win: ~10ms vs combo2's ~18ms
      expect(result).assertDeepEquals(['fast', 'fixed']);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_095
     * @tc.name PromiseRaceTest095
     * @tc.desc Race between allSettled and race with mixed resolutions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 5
     */
    it('PromiseRaceTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      // All settled with mixed results
      const allSettled = Promise.allSettled([
        new Promise<number>(resolve => setTimeout(() => resolve(10), 5)),
        new Promise<number>((_, reject) => setTimeout(() => reject(new Error('Oops')), 10))
      ]);

      // Nested race with reject
      const nestedRace = Promise.race([
        new Promise<number>((_, reject) => setTimeout(() => reject(new Error('Fail fast')), 120)),
        new Promise<number>(resolve => setTimeout(() => resolve(20), 150))
      ]);

      try {
        const result = await Promise.race([allSettled, nestedRace]);
        // If we reach here, allSettled won
        expect((result as Object[]).length).assertEqual(2);
      } catch (error) {
        // If we reach here, nestedRace's rejection won
        expect((error as Error).message).assertEqual('Fail fast');
      }
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_096
     * @tc.name PromiseRaceTest096
     * @tc.desc Race between resolved promise and allSettled with delayed results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseRaceTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      // Immediately resolved with then chain
      const quickResolve = Promise.resolve(5)
        .then(num => num * 2)
        .then(num => num + 3);

      // All settled with longer delays
      const slowAllSettled = Promise.allSettled([
        new Promise<number>(resolve => setTimeout(() => resolve(1), 20)),
        new Promise<number>(resolve => setTimeout(() => resolve(2), 250))
      ]);

      const result = await Promise.race([quickResolve, slowAllSettled]);
      expect(result).assertEqual(13); // quickResolve should finish first
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_097
     * @tc.name PromiseRaceTest097
     * @tc.desc Race between promise chain with catch and all with rejection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 5
     */
    it('PromiseRaceTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      // Chain with rejection and catch recovery
      const recoveryChain = new Promise<number>((_, reject) =>
      setTimeout(() => reject(new Error('Recoverable')), 100)
      )
        .catch((error: Error) => {
          return new Promise<string>(resolve =>
          setTimeout(() => resolve(`Recovered: ${error.message}`), 5)
          );
        });

      // All with one rejection that will fail the whole all
      const failingAll = Promise.all([
        new Promise<number>(resolve => setTimeout(() => resolve(1), 8)),
        new Promise<number>((_, reject) => reject(new Error('Fatal')))
      ]);
      let err = ''
      const result = await Promise.race([recoveryChain, failingAll]).catch((e: Error) => {
        err = e.message
      });
      expect(err).assertEqual('Fatal');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_098
     * @tc.name PromiseRaceTest098
     * @tc.desc Race between allSettled and all with different completion times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 5
     */
    it('PromiseRaceTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      // AllSettled with one fast, one slow
      const allSettled = Promise.allSettled([
        new Promise<number>(resolve => setTimeout(() => resolve(1), 5)),
        new Promise<number>((_, reject) => setTimeout(() => reject(new Error('Error')), 300))
      ]);

      // All with two medium promises
      const all = Promise.all([
        new Promise<number>(resolve => setTimeout(() => resolve(2), 15)),
        new Promise<number>(resolve => setTimeout(() => resolve(3), 20))
      ]);

      const result = await Promise.race([allSettled, all]);

      // all should complete first (~20ms) vs allSettled (~30ms)
      expect(result).assertDeepEquals([2, 3]);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_race_TEST_100
     * @tc.name PromiseRaceTest100
     * @tc.desc Race between mixed promise combinators with error handling
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 5
     */
    it('PromiseRaceTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      // Combination with allSettled and catch
      const combo1 = Promise.allSettled([
        new Promise<string>((_, reject) => setTimeout(() => reject(new Error('Fail 1')), 5)),
        new Promise<string>(resolve => setTimeout(() => resolve('Success 1'), 10))
      ]).catch((error: Error) => `Combo1 failed: ${error.message}`);

      // Combination with all and race
      const combo2 = Promise.race([
        Promise.all([
          new Promise<string>(resolve => setTimeout(() => resolve('Success 2'), 8)),
          new Promise<string>((_, reject) => setTimeout(() => reject(new Error('Fail 2')), 12))
        ]).catch((error: Error) => `Combo2 failed: ${error.message}`),
        new Promise<string>(resolve => setTimeout(() => resolve('Combo2 winner'), 150))
      ]);

      const result = await Promise.race([combo1, combo2]);

      // combo1 completes around 10ms, combo2 around 15ms
      expect(Array.isArray(result)).assertTrue();
      expect((result[0] as PromiseRejectedResult).reason instanceof Error).assertTrue();
      expect((result[1] as PromiseFulfilledResult<string>).value).assertEqual('Success 1');
    });

  })
}