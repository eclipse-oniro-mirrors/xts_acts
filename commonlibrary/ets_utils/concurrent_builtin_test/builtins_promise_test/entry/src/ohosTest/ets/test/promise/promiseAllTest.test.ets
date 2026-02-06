import { afterEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { PromiseAllTest043, PromiseAllTest054, PromiseAllTest095 } from './promisejs';
import {
  PromiseAllTest055,
  PromiseAllTest073,
  PromiseAllTest090,
  thenable08_1,
  thenable08_2,
  thenable16_1,
  thenable16_2,
  thenable34,
  type11,
  type11_2
} from './promisets';
import { sleep } from './utils';

export default function promiseAllTest() {
  describe('promiseAllTest', () => {
    afterEach(async () => {
      await sleep(100)
    })

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_0100
     * @tc.name PromiseAllTest001
     * @tc.desc test Promise.all with all resolved promises
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAllTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1: Promise<number> = Promise.resolve(1);
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
     * @tc.level Level 1
     */
    it('PromiseAllTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1: Promise<number> = Promise.resolve(1);
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
     * @tc.level Level 1
     */
    it('PromiseAllTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1: Promise<number> = Promise.resolve(1);
      const p2: number = 2;
      const p3: string = 'three';

      const result = await Promise.all([p1, p2, p3]);
      expect(result).assertDeepEquals([1, 2, 'three']);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_0400
     * @tc.name PromiseAllTest004
     * @tc.desc test Promise.all with empty iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAllTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await Promise.all([] as Promise<Object>[]);
      expect(result).assertDeepEquals([]);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_0500
     * @tc.name PromiseAllTest005
     * @tc.desc test Promise.all preserves order of results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAllTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1: Promise<number> = new Promise<number>((resolve) =>
      setTimeout(() => resolve(1), 30)
      );
      const p2: Promise<number> = new Promise<number>((resolve) =>
      setTimeout(() => resolve(2), 10)
      );
      const p3: Promise<number> = new Promise<number>((resolve) =>
      setTimeout(() => resolve(3), 20)
      );

      const result = await Promise.all([p1, p2, p3]);
      expect(result).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_0600
     * @tc.name PromiseAllTest006
     * @tc.desc test Promise.all with mixed resolved and pending promises
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAllTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1: Promise<string> = Promise.resolve('ready');
      const p2: Promise<number> = new Promise<number>((resolve) =>
      setTimeout(() => resolve(42), 20)
      );

      const result = await Promise.all([p1, p2]);
      expect(result).assertDeepEquals(['ready', 42]);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_0700
     * @tc.name PromiseAllTest007
     * @tc.desc test Promise.all rejects immediately on first rejection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAllTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const startTime = Date.now();
      const p1: Promise<void> = new Promise<void>((_, reject) =>
      setTimeout(() => reject(new Error('first')), 10)
      );
      const p2: Promise<void> = new Promise<void>((_, reject) =>
      setTimeout(() => reject(new Error('second')), 50)
      );

      try {
        await Promise.all([p1, p2]);
        expect().assertFail();
      } catch (err) {
        expect((err as Error).message).assertEqual('first');
      }
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_0800
     * @tc.name PromiseAllTest008
     * @tc.desc test Promise.all with thenables
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAllTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await Promise.all([thenable08_1, thenable08_2]);
      expect(result).assertDeepEquals(['thenable1', 100]);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_0900
     * @tc.name PromiseAllTest009
     * @tc.desc test Promise.all with large number of promises
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAllTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const promises: Promise<number>[] = new Array(10)
        .fill(0)
        .map((_: Object, i: number) => Promise.resolve(i));

      const result = await Promise.all(promises);
      expect(result).assertDeepEquals([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_1000
     * @tc.name PromiseAllTest010
     * @tc.desc test Promise.all with rejected promise and catch handler
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAllTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1: Promise<number> = Promise.resolve(1);
      const p2: Promise<string> = Promise.reject(new Error('fail'));

      const result = await Promise.all([p1, p2.catch((err: Error) => (err as Error).message)]);
      expect(result).assertDeepEquals([1, 'fail']);
    });
    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_1100
     * @tc.name PromiseAllTest011
     * @tc.desc test Promise.all with promises resolving to objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAllTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1: Promise<type11> = new Promise<type11>((resolve) => {
        resolve({ id: 1 });
      });
      const p2: Promise<type11_2> = new Promise<type11_2>((resolve) => {
        resolve({ name: 'test' });
      });

      const result = await Promise.all([p1, p2]);
      expect(result).assertDeepEquals([{ id: 1 }, { name: 'test' }]);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_1200
     * @tc.name PromiseAllTest012
     * @tc.desc test Promise.all with rejected promise in middle of array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAllTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1: Promise<number> = Promise.resolve(10);
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
     * @tc.level Level 1
     */
    it('PromiseAllTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1: Promise<number[]> = new Promise<number[]>((resolve) => {
        resolve([1, 2, 3]);
      });
      const p2: Promise<string[]> = new Promise<string[]>((resolve) => {
        resolve(['a', 'b']);
      });

      const result = await Promise.all([p1, p2]);
      expect(result).assertDeepEquals([[1, 2, 3], ['a', 'b']]);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_1400
     * @tc.name PromiseAllTest014
     * @tc.desc test Promise.all with non-array iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAllTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      // Create a Set as a non-array iterable
      const promiseSet: Set<Promise<number>> = new Set([
        Promise.resolve(1),
        new Promise<number>((resolve) => resolve(2))
      ]);

      const result = await Promise.all(promiseSet);
      // Set iteration order is insertion order in modern JS engines
      expect(result).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_1500
     * @tc.name PromiseAllTest015
     * @tc.desc test Promise.all with long delay promises
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAllTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const startTime = Date.now();
      const p1: Promise<string> = new Promise<string>((resolve) => {
        setTimeout(() => resolve('slow'), 100);
      });
      const p2: Promise<number> = new Promise<number>((resolve) => {
        setTimeout(() => resolve(100), 150);
      });

      const result = await Promise.all([p1, p2]);

      expect(result).assertDeepEquals(['slow', 100]);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_1600
     * @tc.name PromiseAllTest016
     * @tc.desc test Promise.all with thenables that return promises
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAllTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await Promise.all([thenable16_1, thenable16_2]);
      expect(result).assertDeepEquals([10, 'thenable']);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_1700
     * @tc.name PromiseAllTest017
     * @tc.desc test Promise.all with promises that resolve to null and undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAllTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
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
     * @tc.number SUB_BUILTINS_Promise_all_TEST_1800
     * @tc.name PromiseAllTest018
     * @tc.desc test Promise.all with already settled promises
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAllTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1: Promise<number> = Promise.resolve(5);
      const p2: Promise<string> = Promise.reject(new Error('already rejected')).catch((err: Error) => err.message);

      // Wait for promises to settle first
      await new Promise<void>(resolve => setTimeout(resolve, 50));

      const result = await Promise.all([p1, p2]);
      expect(result).assertDeepEquals([5, 'already rejected']);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_1900
     * @tc.name PromiseAllTest019
     * @tc.desc test Promise.all with mixed promise types and primitives
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAllTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1: Promise<number> = new Promise<number>((resolve) => {
        setTimeout(() => resolve(42), 30);
      });
      const p2: boolean = true;
      const p3: Promise<string> = Promise.resolve('hello');
      const p4: null = null;

      const result = await Promise.all([p1, p2, p3, p4]);
      expect(result).assertDeepEquals([42, true, 'hello', null]);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_2000
     * @tc.name PromiseAllTest020
     * @tc.desc test Promise.all with promises that resolve to functions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAllTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1: Promise<() => number> = new Promise<() => number>((resolve) => {
        resolve(() => 10);
      });
      const p2: Promise<(a: number, b: number) => number> = new Promise<(a: number, b: number) => number>((resolve) => {
        resolve((a, b) => a + b);
      });

      const result = await Promise.all([p1, p2]);
      expect(result[0]()).assertEqual(10);
      expect(result[1](5, 3)).assertEqual(8);
    });
    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_2100
     * @tc.name PromiseAllTest021
     * @tc.desc test Promise.all with catch handling specific error type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAllTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      class CustomError extends Error {
        constructor(message: string) {
          super(message);
          this.name = 'CustomError';
        }
      }

      const p1: Promise<number> = Promise.reject(new CustomError('custom failure'))
        .catch((err: CustomError) => err.message.length);
      const p2: Promise<number> = Promise.resolve(10);

      const result = await Promise.all([p1, p2]);
      expect(result).assertDeepEquals([14, 10]); // 'custom failure' has 15 characters
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_2200
     * @tc.name PromiseAllTest022
     * @tc.desc test Promise.all with multiple catch handlers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAllTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
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
     * @tc.level Level 1
     */
    it('PromiseAllTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1: Promise<number> = Promise.reject(new Error('count error'))
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
     * @tc.level Level 1
     */
    it('PromiseAllTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1: Promise<number> = new Promise<number>((resolve, reject) => {
        reject(new Error('level 1'));
      })
        .catch((err: Error) => {
          return new Promise<number>((resolve, reject) => {
            reject(new Error(`${err.message} -> level 2`));
          }).catch((innerErr: Error) => innerErr.message.length);
        });

      const result = await Promise.all([p1]);
      expect(result).assertDeepEquals([18]); // 'level 1 -> level 2' has 23 characters
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_2500
     * @tc.name PromiseAllTest025
     * @tc.desc test Promise.all with catch rethrowing different error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAllTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
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
     * @tc.level Level 1
     */
    it('PromiseAllTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
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
     * @tc.level Level 1
     */
    it('PromiseAllTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1: Promise<number> = Promise.reject(new Error('delayed'))
        .catch((err: Error) => {
          return new Promise<number>((resolve) => {
            setTimeout(() => resolve(err.message.length * 2), 50);
          });
        });
      const p2: Promise<number> = Promise.resolve(5);

      const result = await Promise.all([p1, p2]);
      expect(result).assertDeepEquals([14, 5]); // 'delayed' (6 letters) * 2 = 12
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_2800
     * @tc.name PromiseAllTest028
     * @tc.desc test Promise.all with type guard in catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAllTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      class ValidationError extends Error {
        public code: number;

        constructor(code: number, message: string) {
          super(message);
          this.code = code;
          this.name = 'ValidationError';
        }
      }

      const p1: Promise<string> = Promise.reject(new ValidationError(400, 'invalid'))
        .catch((err: ValidationError) => {
          if (err instanceof ValidationError) {
            return `code: ${err.code}`;
          }
          return 'unknown error';
        });

      const result = await Promise.all([p1]);
      expect(result).assertDeepEquals(['code: 400']);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_2900
     * @tc.name PromiseAllTest029
     * @tc.desc test Promise.all with catch and finally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAllTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
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
     * @tc.level Level 1
     */
    it('PromiseAllTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const innerPromise: Promise<number> = Promise.reject(new Error('inner'))
        .catch((err: Error) => err.message.length);

      const outerPromise: Promise<number[]> = Promise.all([innerPromise, Promise.resolve(5)])
        .catch((err: Error) => [err.message.length]);

      const result = await outerPromise;
      expect(result).assertDeepEquals([5, 5]); // 'inner' has 5 characters, plus 5 from resolved promise
    });
    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_3100
     * @tc.name PromiseAllTest031
     * @tc.desc test Promise.all with catch returning different error type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAllTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      class NetworkError extends Error {
        constructor(message: string) {
          super(message);
          this.name = 'NetworkError';
        }
      }

      class ValidationError extends Error {
        constructor(message: string) {
          super(message);
          this.name = 'ValidationError';
        }
      }

      const p1: Promise<string> = Promise.reject(new NetworkError('timeout'))
        .catch((err: NetworkError) => {
          throw new ValidationError(`validity: ${err.message}`);
        });

      try {
        await Promise.all([p1]);
        expect().assertFail();
      } catch (err) {
        expect(err instanceof ValidationError).assertEqual(true);
        expect((err as ValidationError).message).assertEqual('validity: timeout');
      }
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_3200
     * @tc.name PromiseAllTest032
     * @tc.desc test Promise.all with catch and async operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAllTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1: Promise<number> = Promise.reject(new Error('need delay'))
        .catch(async (err: Error) => {
          await new Promise<void>(resolve => setTimeout(resolve, 30));
          return err.message.length;
        });
      const p2: Promise<number> = new Promise<number>(resolve =>
      setTimeout(() => resolve(20), 20)
      );

      const result = await Promise.all([p1, p2]);
      expect(result).assertDeepEquals([10, 20]); // 'need delay' has 10 characters
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_3300
     * @tc.name PromiseAllTest033
     * @tc.desc test Promise.all with multiple error types in catches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAllTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      class TypeError extends Error {
      }

      class RangeError extends Error {
      }

      const p1: Promise<string> = Promise.reject(new TypeError('invalid type'))
        .catch((err: TypeError) => `type: ${err.message}`);
      const p2: Promise<string> = Promise.reject(new RangeError('out of range'))
        .catch((err: RangeError) => `range: ${err.message}`);

      const result = await Promise.all([p1, p2]);
      expect(result).assertDeepEquals([
        'type: invalid type',
        'range: out of range'
      ]);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_3400
     * @tc.name PromiseAllTest034
     * @tc.desc test Promise.all with catch that returns thenable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAllTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1: Promise<string> = Promise.reject(new Error('raw'))
        .catch(async (err: Error): Promise<string> => {
          return await thenable34;
        });

      const result = await Promise.all([p1]);
      expect(result).assertDeepEquals(['processed']);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_3500
     * @tc.name PromiseAllTest035
     * @tc.desc test Promise.all with unhandled error in nested promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAllTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1: Promise<number> = new Promise<number>((resolve) => {
        resolve(10);
      });

      const p2: Promise<void> = new Promise<void>((_, reject) => {
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
     * @tc.level Level 1
     */
    it('PromiseAllTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1: Promise<number> = Math.random() > 0.5
        ? Promise.resolve(100)
        : Promise.reject(new Error('random fail')).catch((err: Error) => err.message.length);

      const p2: Promise<number> = Promise.resolve(200);

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
     * @tc.level Level 1
     */
    it('PromiseAllTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const log: string[] = [];

      const p1: Promise<number> = Promise.reject(new Error('fail'))
        .catch((err: Error) => {
          log.push(`caught: ${err.message}`);
          return 1;
        })
        .finally(() => log.push('p1 finally 1'))
        .finally(() => log.push('p1 finally 2'));

      const p2: Promise<number> = Promise.resolve(2)
        .finally(() => log.push('p2 finally'));

      const result = await Promise.all([p1, p2]);
      expect(result).assertDeepEquals([1, 2]);
      expect(log).assertDeepEquals([
        "caught: fail", "p2 finally", "p1 finally 1", "p1 finally 2"
      ]);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_3800
     * @tc.name PromiseAllTest038
     * @tc.desc test Promise.all with catch handling unknown error type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAllTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1: Promise<string> = Promise.reject('not an error object')
        .catch((err: Error | string) => {
          if (typeof err === 'string') {
            return `string error: ${err}`;
          } else if (err instanceof Error) {
            return `error object: ${err.message}`;
          }
          return 'unknown error type';
        });

      const result = await Promise.all([p1]);
      expect(result).assertDeepEquals(['string error: not an error object']);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_3900
     * @tc.name PromiseAllTest039
     * @tc.desc test Promise.all with catch that modifies shared state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAllTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
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
     * @tc.level Level 1
     */
    it('PromiseAllTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1: Promise<number> = Promise.reject(new Error('start'))
        .catch((err: Error) => err.message.length) // 5
        .then(val => val * 2) // 10
        .then(val => val + 5); // 15

      const p2: Promise<number> = Promise.resolve(10)
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
     * @tc.level Level 2
     */
    it('PromiseAllTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const innerPromise: Promise<number[]> = Promise.all([
        Promise.reject(new Error('inner1')).catch(async (err: Error) => {
          await new Promise<number>(resolve => setTimeout(resolve, 10));
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
     * @tc.level Level 2
     */
    it('PromiseAllTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start = Date.now();
      const p1: Promise<number> = new Promise<number>(resolve =>
      setTimeout(() => resolve(1), 50)
      );
      const p2: Promise<number> = new Promise<number>((_, reject) =>
      setTimeout(() => reject(new Error('fast fail')), 20)
      ).catch((err: Error) => err.message.length);

      const result = await Promise.all([p1, p2]);

      expect(result).assertDeepEquals([1, 9]); // 'fast fail' has 9 characters
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_4300
     * @tc.name PromiseAllTest043
     * @tc.desc test Promise.all with nested thenables and errors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const p1: Promise<string> = PromiseAllTest043();

      const result = await Promise.all([p1]);
      expect(result).assertDeepEquals(['caught: thenable error']);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_4400
     * @tc.name PromiseAllTest044
     * @tc.desc test Promise.all with multiple layers of error handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const p1 = new Promise<number>((_, reject) => {
        setTimeout(() => reject(new Error('level1')), 10);
      })
        .catch((err: Error) => {
          return new Promise<number>((_, reject) => {
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
     * @tc.number SUB_BUILTINS_Promise_all_TEST_4500
     * @tc.name PromiseAllTest045
     * @tc.desc test Promise.all with async finally blocks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const log: string[] = [];

      const p1: Promise<number> = Promise.reject(new Error('test'))
        .catch((err: Error) => {
          log.push('catch 1');
          return 1;
        })
        .finally(async () => {
          await new Promise<number>(resolve => setTimeout(resolve, 10));
          log.push('finally 1');
        });

      const p2: Promise<number> = Promise.resolve(2)
        .finally(async () => {
          await new Promise<number>(resolve => setTimeout(resolve, 5));
          log.push('finally 2');
        });

      await Promise.all([p1, p2]);
      expect(log).assertDeepEquals(['catch 1', 'finally 2', 'finally 1']);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_4600
     * @tc.name PromiseAllTest046
     * @tc.desc test Promise.all with mixed sync and async rejections
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const p1: Promise<string> = Promise.reject(new Error('sync error'))
        .catch((err: Error) => err.message);
      const p2: Promise<string> = new Promise<string>((_, reject) => {
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
     * @tc.level Level 2
     */
    it('PromiseAllTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const createRecursivePromise = (depth: number): Promise<number> => {
        if (depth === 0) {
          return Promise.resolve(1);
        }
        return Promise.all([createRecursivePromise(depth - 1)])
          .then((val: number[]) => val[0] * 2)
          .catch((err: Error) => depth);
      };

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
     * @tc.level Level 2
     */
    it('PromiseAllTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const p1: Promise<number> = Promise.resolve(
        new Promise<number>(resolve => setTimeout(() => resolve(10), 20))
      );
      const p2: Promise<number> = Promise.resolve(20);

      const result = await Promise.all([p1, p2]);
      expect(result).assertDeepEquals([10, 20]);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_4900
     * @tc.name PromiseAllTest049
     * @tc.desc test Promise.all with async error transformation chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const p1: Promise<string> = Promise.reject(new Error('original'))
        .catch(async (err: Error) => {
          await new Promise<string>(resolve => setTimeout(resolve, 10));
          throw new Error(`first: ${err.message}`);
        })
        .catch(async (err: Error) => {
          await new Promise<string>(resolve => setTimeout(resolve, 5));
          return `second: ${err.message}`;
        });

      const result = await Promise.all([p1]);
      expect(result).assertDeepEquals(['second: first: original']);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_5000
     * @tc.name PromiseAllTest050
     * @tc.desc test Promise.all with mixed settled states and cleanup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const resources: string[] = [];

      const p1: Promise<number> = Promise.resolve(1)
        .finally(() => resources.push('p1 cleaned'));

      const p2: Promise<number> = Promise.reject(new Error('fail'))
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
     * @tc.level Level 2
     */
    it('PromiseAllTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const createChainedPromise = (start: number, steps: number): Promise<number> => {
        let promise: Promise<number> = Promise.resolve(start);
        for (let i = 0; i < steps; i++) {
          promise = promise.then(val =>
          new Promise<number>(resolve =>
          setTimeout(() => resolve(val * 2), 5)
          )
          );
        }
        return promise;
      };

      const result = await Promise.all([
        createChainedPromise(1, 3), // 1 → 2 → 4 → 8
        createChainedPromise(2, 2)// 2 → 4 → 8
      ]);
      expect(result).assertDeepEquals([8, 8]);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_5200
     * @tc.name PromiseAllTest052
     * @tc.desc test Promise.all with parallel error handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const errors: string[] = [];

      const createErrorPromise = (msg: string, delay: number): Promise<number> => {
        return new Promise<number>((_, reject) => {
          setTimeout(() => reject(new Error(msg)), delay);
        }).catch((err: Error) => {
          errors.push(err.message);
          return msg.length;
        });
      };

      const result = await Promise.all([
        createErrorPromise('a', 30),
        createErrorPromise('bb', 10),
        createErrorPromise('ccc', 20)
      ]);

      expect(result).assertDeepEquals([1, 2, 3]);
      expect(errors).assertDeepEquals(['bb', 'ccc', 'a']); // Order based on rejection time
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_5300
     * @tc.name PromiseAllTest053
     * @tc.desc test Promise.all with nested error in resolved promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const p1: Promise<number> = Promise.resolve()
        .then(() => {
          return new Promise<number>((resolve) => {
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
     * @tc.number SUB_BUILTINS_Promise_all_TEST_5400
     * @tc.name PromiseAllTest054
     * @tc.desc test Promise.all with async iterable processing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result: number[] = await PromiseAllTest054()
      expect(result).assertDeepEquals([0, 2, 4]);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_5500
     * @tc.name PromiseAllTest055
     * @tc.desc test Promise.all with mixed thenables and promises in error states
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result: string[] = await PromiseAllTest055()
      expect(result).assertDeepEquals(['caught: thenable error', 'handled: promise error']);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_5600
     * @tc.name PromiseAllTest056
     * @tc.desc test Promise.all with async validation chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      class ValidationError extends Error {
      }

      const validate = (value: number, min: number, delay: number): Promise<number> => {
        return new Promise<number>((resolve, reject) => {
          setTimeout(() => {
            if (value >= min) {
              resolve(value);
            } else {
              reject(new ValidationError(`too small: ${value}`));
            }
          }, delay);
        });
      };

      const p1: Promise<number | string> = validate(5, 3, 20)
        .catch((err: ValidationError) => err.message);
      const p2: Promise<number | string> = validate(2, 3, 10)
        .catch((err: ValidationError) => err.message);

      const result = await Promise.all([p1, p2]);
      expect(result).assertDeepEquals([5, 'too small: 2']);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_5700
     * @tc.name PromiseAllTest057
     * @tc.desc test Promise.all with resources that must be cleaned up
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.number SUB_BUILTINS_Promise_all_TEST_5800
     * @tc.name PromiseAllTest058
     * @tc.desc test Promise.all with delayed error propagation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const log: string[] = [];

      const p1: Promise<void> = new Promise<void>((_, reject) => {
        setTimeout(() => {
          log.push('p1 rejecting');
          reject(new Error('p1 failed'));
        }, 30);
      });

      const p2: Promise<void> = new Promise<void>(resolve => {
        setTimeout(() => {
          log.push('p2 resolving');
          resolve();
        }, 10);
      });

      try {
        await Promise.all([p1, p2]);
        expect().assertFail();
      } catch (err) {
        expect((err as Error).message).assertEqual('p1 failed');
        expect(log).assertDeepEquals(['p2 resolving', 'p1 rejecting']);
      }
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_5900
     * @tc.name PromiseAllTest059
     * @tc.desc test Promise.all with nested promises that resolve after delays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const createNestedPromise = (value: number, delay: number): Promise<number> => {
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
      expect(result).assertDeepEquals([4, 6]);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_6000
     * @tc.name PromiseAllTest060
     * @tc.desc test Promise.all with complex error recovery strategy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      class CriticalError extends Error {
      }

      class RetryableError extends Error {
      }

      const operation = (id: number, failType?: 'critical' | 'retry' | 'none'): Promise<number> => {
        return new Promise<number>((resolve, reject) => {
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
      const safeOperation = async (id: number, failType?: string): Promise<number | string> => {
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
     * @tc.number SUB_BUILTINS_Promise_all_TEST_6100
     * @tc.name PromiseAllTest061
     * @tc.desc test Promise.all with cascading promises in sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const log: string[] = [];

      const p1: Promise<number> = new Promise<number>(resolve => {
        setTimeout(() => {
          log.push('p1 resolved');
          resolve(1);
        }, 10);
      });

      const p2: Promise<number> = p1.then(val => {
        return new Promise<number>(resolve => {
          setTimeout(() => {
            log.push('p2 resolved');
            resolve(val * 2);
          }, 10);
        });
      });

      const p3: Promise<number> = p2.then(val => {
        return new Promise<number>(resolve => {
          setTimeout(() => {
            log.push('p3 resolved');
            resolve(val * 2);
          }, 10);
        });
      });

      const result = await Promise.all([p1, p2, p3]);
      expect(result).assertDeepEquals([1, 2, 4]);
      expect(log).assertDeepEquals(['p1 resolved', 'p2 resolved', 'p3 resolved']);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_6200
     * @tc.name PromiseAllTest062
     * @tc.desc test Promise.all with cascading errors through chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const log: string[] = [];

      const p1: Promise<number> = new Promise<number>((_, reject) => {
        setTimeout(() => {
          log.push('p1 rejected');
          reject(new Error('fail'));
        }, 10);
      });

      const p2: Promise<number> = p1.catch((err: Error) => {
        log.push('p1 caught');
        return new Promise<number>((_, reject) => {
          setTimeout(() => {
            log.push('p2 rejected');
            reject(new Error(`${err.message} again`));
          }, 10);
        });
      });

      const p3: Promise<string | number> = p2.catch((err: Error) => {
        log.push('p2 caught');
        return `handled: ${err.message}`;
      });

      const result = await Promise.all([p1.catch(() => 0), p2.catch(() => 0), p3]);
      expect(result).assertDeepEquals([0, 0, 'handled: fail again']);
      expect(log).assertDeepEquals(['p1 rejected', 'p1 caught', 'p2 rejected', 'p2 caught']);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_6300
     * @tc.name PromiseAllTest063
     * @tc.desc test Promise.all with timed cascading promises
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const startTime = Date.now();

      const createTimedPromise = (delay: number, value: number): Promise<number> => {
        return new Promise<number>(resolve => {
          setTimeout(() => resolve(value), delay);
        });
      };

      const p1: Promise<number> = createTimedPromise(10, 1);
      const p2: Promise<number> = p1.then(val => createTimedPromise(20, val * 2));
      const p3: Promise<number> = p2.then(val => createTimedPromise(30, val * 2));

      const result = await Promise.all([p1, p2, p3]);

      expect(result).assertDeepEquals([1, 2, 4]);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_6500
     * @tc.name PromiseAllTest065
     * @tc.desc test Promise.all with dependent timing constraints
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const startTime = Date.now();
      let p2Start: number;

      const p1: Promise<void> = new Promise<void>(resolve => {
        setTimeout(resolve, 30);
      });

      const p2: Promise<number> = p1.then(() => {
        p2Start = Date.now();
        return new Promise<number>(resolve => {
          setTimeout(() => resolve(42), 20);
        });
      });

      await Promise.all([p1, p2]);
      const p2Duration = Date.now() - p2Start!;

      expect(p2Duration + 1).assertLargerOrEqual(20);
      expect(p2Duration).assertLess(30);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_6600
     * @tc.name PromiseAllTest066
     * @tc.desc test Promise.all with cascading finally blocks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const log: string[] = [];

      const p1: Promise<number> = new Promise<number>(resolve => {
        setTimeout(() => resolve(1), 10);
      })
        .finally(() => log.push('p1 finally'));

      const p2: Promise<number> = p1.then(val => {
        return new Promise<number>(resolve => {
          setTimeout(() => resolve(val * 2), 10);
        });
      })
        .finally(() => log.push('p2 finally'));

      const p3: Promise<number> = p2.then(val => {
        return new Promise<number>(resolve => {
          setTimeout(() => resolve(val * 2), 10);
        });
      })
        .finally(() => log.push('p3 finally'));

      const result = await Promise.all([p1, p2, p3]);
      expect(result).assertDeepEquals([1, 2, 4]);
      expect(log).assertDeepEquals([
        'p1 finally',
        'p2 finally',
        'p3 finally'
      ]);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_6700
     * @tc.name PromiseAllTest067
     * @tc.desc test Promise.all with interleaved cascading promises
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const log: string[] = [];

      const base: Promise<number> = new Promise<number>(resolve => {
        setTimeout(() => {
          log.push('base resolved');
          resolve(10);
        }, 20);
      });

      const p1: Promise<number> = base.then(val => {
        log.push('p1 processing');
        return val * 2;
      });

      const p2: Promise<number> = base.then(val => {
        log.push('p2 processing');
        return new Promise<number>(resolve => {
          setTimeout(() => resolve(val + 5), 10);
        });
      });

      const p3: Promise<number> = base.then(val => {
        log.push('p3 processing');
        return val - 3;
      });

      const result = await Promise.all([p1, p2, p3]);
      expect(result).assertDeepEquals([20, 15, 7]);
      expect(log).assertDeepEquals([
        'base resolved',
        'p1 processing',
        'p2 processing',
        'p3 processing'
      ]);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_6800
     * @tc.name PromiseAllTest068
     * @tc.desc test Promise.all with timing in nested all calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const startTime = Date.now();

      const inner1: Promise<number> = Promise.all([
        new Promise<number>(resolve => setTimeout(() => resolve(1), 10)),
        new Promise<number>(resolve => setTimeout(() => resolve(2), 20))
      ]).then((res: number[]) => {
        let a = res[0]
        let b = res[1]
        return a + b
      });

      const inner2: Promise<number> = Promise.all([
        new Promise<number>(resolve => setTimeout(() => resolve(3), 15)),
        new Promise<number>(resolve => setTimeout(() => resolve(4), 5))
      ]).then((res: number[]) => res[0] + res[1]);

      const result = await Promise.all([inner1, inner2]);

      expect(result).assertDeepEquals([3, 7]);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_6900
     * @tc.name PromiseAllTest069
     * @tc.desc test Promise.all with cascading error recovery
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const createFailingPromise = (id: number, shouldFail: boolean): Promise<number> => {
        return new Promise<number>((resolve, reject) => {
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
      const p1: Promise<number> = createFailingPromise(1, false);
      const p2: Promise<number> = p1.then(() => createFailingPromise(2, true))
        .catch((err: Error) => createFailingPromise(2, false));
      const p3: Promise<number> = p2.then(() => createFailingPromise(3, true))
        .catch((err: Error) => createFailingPromise(3, true))
        .catch((err: Error) => createFailingPromise(3, false));

      const result = await Promise.all([p1, p2, p3]);
      expect(result).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_7000
     * @tc.name PromiseAllTest070
     * @tc.desc test Promise.all with sequential timing dependencies
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const timestamps: number[] = [];

      const p1: Promise<void> = new Promise<void>(resolve => {
        setTimeout(() => {
          timestamps.push(Date.now());
          resolve();
        }, 10);
      });

      const p2: Promise<void> = p1.then(() => {
        return new Promise<void>(resolve => {
          setTimeout(() => {
            timestamps.push(Date.now());
            resolve();
          }, 10);
        });
      });

      const p3: Promise<void> = p2.then(() => {
        return new Promise<void>(resolve => {
          setTimeout(() => {
            timestamps.push(Date.now());
            resolve();
          }, 10);
        });
      });

      await Promise.all([p1, p2, p3]);

      // Verify each step is at least 10ms apart
      expect(timestamps[1] - timestamps[0] + 1).assertLargerOrEqual(10);
      expect(timestamps[2] - timestamps[1] + 1).assertLargerOrEqual(10);
      expect(timestamps[2] - timestamps[0] + 1).assertLargerOrEqual(20);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_7100
     * @tc.name PromiseAllTest071
     * @tc.desc test Promise.all with cascading promises and shared state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const shared: number[] = [];

      const p1: Promise<number> = new Promise<number>(resolve => {
        setTimeout(() => {
          shared.push(1);
          resolve(1);
        }, 10);
      });

      const p2: Promise<number> = p1.then(val => {
        return new Promise<number>(resolve => {
          setTimeout(() => {
            shared.push(val * 2);
            resolve(val * 2);
          }, 10);
        });
      });

      const p3: Promise<number> = Promise.all([p1, p2]).then((res: number[]) => {
        return new Promise<number>(resolve => {
          setTimeout(() => {
            shared.push(res[0] + res[1]);
            resolve(res[0] + res[1]);
          }, 10);
        });
      });

      const result = await Promise.all([p1, p2, p3]);
      expect(result).assertDeepEquals([1, 2, 3]);
      expect(shared).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_7200
     * @tc.name PromiseAllTest072
     * @tc.desc test Promise.all with parallel and sequential mix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const startTime = Date.now();

      // Parallel operations
      const parallel1: Promise<number> = new Promise<number>(resolve =>
      setTimeout(() => resolve(1), 20)
      );
      const parallel2: Promise<number> = new Promise<number>(resolve =>
      setTimeout(() => resolve(2), 30)
      );

      // Sequential operation that depends on parallel results
      const sequential: Promise<number> = Promise.all([parallel1, parallel2])
        .then((res: number[]) => new Promise<number>(resolve =>
        setTimeout(() => resolve(res[0] + res[1]), 15)
        ));

      const result = await Promise.all([parallel1, parallel2, sequential]);

      expect(result).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_7300
     * @tc.name PromiseAllTest073
     * @tc.desc test Promise.all with cascading thenables and timing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const log: string[] = await PromiseAllTest073();
      expect(log).assertDeepEquals([
        "thenable2 start", "thenable2 resolved", "thenable1 start", "thenable1 resolved"
      ]);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_7400
     * @tc.name PromiseAllTest074
     * @tc.desc test Promise.all with timed error propagation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const log: string[] = [];
      const startTime = Date.now();

      const p1: Promise<void> = new Promise<void>((_, reject) => {
        setTimeout(() => {
          log.push('p1 rejected');
          reject(new Error('fail'));
        }, 20);
      });

      const p2: Promise<void> = p1.catch((err: Error) => {
        log.push('p1 caught');
        return new Promise<void>((_, reject) => {
          setTimeout(() => {
            log.push('p2 rejected');
            reject(new Error('another fail'));
          }, 10);
        });
      });

      try {
        await Promise.all([p1.catch(() => {
        }), p2]);
        expect().assertFail();
      } catch (err) {
        expect((err as Error).message).assertEqual('another fail');
        expect(log).assertDeepEquals(['p1 rejected', 'p1 caught', 'p2 rejected']);
      }
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_7500
     * @tc.name PromiseAllTest075
     * @tc.desc test Promise.all with cascading promises and varying delays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const createChainedPromise = (initial: number, delays: number[]): Promise<number> => {
        return delays.reduce((promise, delay) => {
          return promise.then(val => {
            return new Promise<number>(resolve => {
              setTimeout(() => resolve(val * 2), delay);
            });
          });
        }, Promise.resolve(initial));
      };

      const p1: Promise<number> = createChainedPromise(1, [10, 20]); // 1 → 2 → 4
      const p2: Promise<number> = createChainedPromise(2, [5, 15, 10]); // 2 → 4 → 8 → 16

      const result = await Promise.all([p1, p2]);
      expect(result).assertDeepEquals([4, 16]);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_7600
     * @tc.name PromiseAllTest076
     * @tc.desc test Promise.all with conditional cascading
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const log: string[] = [];

      const p1: Promise<number> = new Promise<number>(resolve => {
        setTimeout(() => resolve(10), 10);
      });

      const p2: Promise<number> = p1.then(val => {
        log.push(`p1 value: ${val}`);
        if (val > 5) {
          return new Promise<number>(resolve => {
            setTimeout(() => resolve(val * 2), 10);
          });
        } else {
          return new Promise<number>(resolve => {
            setTimeout(() => resolve(val + 5), 10);
          });
        }
      });

      const p3: Promise<number> = p2.then(val => {
        log.push(`p2 value: ${val}`);
        return val / 2;
      });

      const result = await Promise.all([p1, p2, p3]);
      expect(result).assertDeepEquals([10, 20, 10]);
      expect(log).assertDeepEquals(['p1 value: 10', 'p2 value: 20']);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_7700
     * @tc.name PromiseAllTest077
     * @tc.desc test Promise.all with cascading in nested arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const p1: Promise<number> = new Promise<number>(resolve =>
      setTimeout(() => resolve(1), 10)
      );

      const p2: Promise<number> = p1.then(val =>
      new Promise<number>(resolve => setTimeout(() => resolve(val * 2), 10))
      );

      const innerAll: Promise<number[]> = Promise.all([p1, p2]);
      const p3: Promise<number> = innerAll.then((res: number[]) =>
      new Promise<number>(resolve => setTimeout(() => resolve(res[0] + res[1]), 10))
      );

      const result = await Promise.all([innerAll, p3]);
      expect(result).assertDeepEquals([[1, 2], 3]);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_7800
     * @tc.name PromiseAllTest078
     * @tc.desc test Promise.all with cascading cleanup operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const resources: string[] = [];

      const openResource = (name: string): Promise<string> => {
        resources.push(`open ${name}`);
        return Promise.resolve(name);
      };

      const processResource = (name: string): Promise<string> => {
        return new Promise<string>(resolve => {
          setTimeout(() => {
            resources.push(`process ${name}`);
            resolve(name);
          }, 10);
        });
      };

      const closeResource = (name: string): Promise<void> => {
        return new Promise<void>((resolve) => {
          setTimeout(() => {
            resources.push(`close ${name}`);
            resolve();
          }, 10);
        });
      };

      // Create cascading resource operations
      const p1: Promise<void> = openResource('res1')
        .then(name => processResource(name))
        .then(name => closeResource(name));

      const p2: Promise<void> = openResource('res2')
        .then(name => processResource(name))
        .then(name => closeResource(name));

      await Promise.all([p1, p2]);
      expect(resources).assertDeepEquals([
        'open res1',
        'open res2',
        'process res1',
        'process res2',
        'close res1',
        'close res2'
      ]);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_7900
     * @tc.name PromiseAllTest079
     * @tc.desc test Promise.all with timing in error recovery chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const startTime = Date.now();

      const p1: Promise<number> = new Promise<number>((_, reject) => {
        setTimeout(() => reject(new Error('first')), 10);
      })
        .catch(async (err: Error) => {
          await new Promise<number>(resolve => setTimeout(resolve, 15));
          throw new Error('second');
        })
        .catch(async (err: Error) => {
          await new Promise<number>(resolve => setTimeout(resolve, 5));
          return 42;
        });

      const result = await Promise.all([p1]);

      expect(result).assertDeepEquals([42]);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_all_TEST_8000
     * @tc.name PromiseAllTest080
     * @tc.desc test Promise.all with complex cascading dependency graph
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      // Create base promises
      const a: Promise<number> = new Promise<number>(resolve =>
      setTimeout(() => resolve(1), 10)
      );
      const b: Promise<number> = new Promise<number>(resolve =>
      setTimeout(() => resolve(2), 15)
      );

      // Create dependent promises
      const c: Promise<number> = Promise.all([a, b]).then((res: number[]) => res[0] + res[1]);
      const d: Promise<number> = a.then(x => x * 3);
      const e: Promise<number> = b.then(y => y * 2);

      // Create final dependent promise
      const f: Promise<number> = Promise.all([c, d, e]).then((res: number[]) =>
      res[0] + res[1] + res[2]
      );

      const result = await Promise.all([a, b, c, d, e, f]);
      expect(result).assertDeepEquals([1, 2, 3, 3, 4, 10]);
    });
    /**
     * @tc.number SUB_BUILTINS_PROMISE_ALL_TEST_8100
     * @tc.name PromiseAllTest081
     * @tc.desc test Promise.all with Promise.race in cascading chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAllTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const log: string[] = [];

      const fastPromise = new Promise<number>(resolve =>
      setTimeout(() => {
        log.push('fast');
        resolve(1);
      }, 10)
      );
      const slowPromise = new Promise<number>(resolve =>
      setTimeout(() => {
        log.push('slow');
        resolve(2);
      }, 20)
      );

      const raceResult = Promise.race([fastPromise, slowPromise]);
      const chained = raceResult.then(val =>
      new Promise<number>(resolve =>
      setTimeout(() => resolve(val * 10), 15)
      )
      );

      const result = await Promise.all([raceResult, chained]);
      expect(result).assertDeepEquals([1, 10]);
      expect(log).assertDeepEquals(['fast', 'slow']); // slow still executes
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
      const createResolvedChain = (value: number, depth: number): Promise<number> => {
        if (depth === 0) {
          return Promise.resolve(value);
        }
        return Promise.resolve(createResolvedChain(value * 2, depth - 1));
      };

      const result = await Promise.all([
        createResolvedChain(1, 3), // 1 → 2 → 4 → 8
        createResolvedChain(2, 2)// 2 → 4 → 8
      ]);
      expect(result).assertDeepEquals([8, 8]);
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
      expect(result).assertDeepEquals(['inner: outer', 3]);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_ALL_TEST_8400
     * @tc.name PromiseAllTest084
     * @tc.desc test Promise.all with Promise.allSettled in cascading chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAllTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const p1 = new Promise<number>((resolve) => setTimeout(() => resolve(1), 10));
      const p2 = new Promise<number>((_, reject) => setTimeout(() => reject(new Error('fail')), 15));

      const settled = Promise.allSettled([p1, p2]);
      const processed = settled.then((results) => {
        let arr = results.map((r): string | number =>
        r.status === 'fulfilled' ? r.value : r.reason.message
        ) as string | number[];
        return arr
      });

      const result = await Promise.all([settled, processed]);
      expect(result[1]).assertDeepEquals([1, 'fail']);
      expect(result[0].length).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_ALL_TEST_8500
     * @tc.name PromiseAllTest085
     * @tc.desc test Promise.all with timing and Promise.any in chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAllTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const startTime = Date.now();

      const createFailingPromise = (id: number, delay: number) =>
      new Promise<number>((_, reject) =>
      setTimeout(() => reject(new Error(`p${id}`)), delay)
      );

      const createSuccessPromise = (id: number, delay: number) =>
      new Promise<number>(resolve =>
      setTimeout(() => resolve(id), delay)
      );

      const anyResult = Promise.any([
        createFailingPromise(1, 10),
        createSuccessPromise(2, 20),
        createSuccessPromise(3, 30)
      ]);

      const chained = anyResult.then(val =>
      new Promise<number>(resolve => setTimeout(() => resolve(val * 10), 15))
      );

      const result = await Promise.all([anyResult, chained]);

      expect(result).assertDeepEquals([2, 20]);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_ALL_TEST_8600
     * @tc.name PromiseAllTest086
     * @tc.desc test Promise.all with nested Promise.all and race conditions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAllTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const outerStartTime = Date.now();

      const inner1 = Promise.all([
        new Promise<number>(resolve => setTimeout(() => resolve(1), 10)),
        new Promise<number>(resolve => setTimeout(() => resolve(2), 20))
      ]);

      const inner2 = Promise.all([
        new Promise<number>(resolve => setTimeout(() => resolve(3), 15)),
        new Promise<number>(resolve => setTimeout(() => resolve(4), 5))
      ]);

      const raceBetweenInners = Promise.race([inner1, inner2]);
      const allResults = Promise.all([inner1, inner2, raceBetweenInners]);

      const result = await allResults;

      expect(result[0]).assertDeepEquals([1, 2]);
      expect(result[1]).assertDeepEquals([3, 4]);
      expect(result[2]).assertDeepEquals([3, 4]); // inner2 finishes first
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_ALL_TEST_8700
     * @tc.name PromiseAllTest087
     * @tc.desc test Promise.all with then/catch/finally combination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAllTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const log: string[] = [];

      const p1 = new Promise<number>((resolve) => setTimeout(() => resolve(1), 10))
        .then(val => val * 2)
        .catch((err: Error) => log.push(`p1 catch: ${err.message}`))
        .finally(() => log.push('p1 finally'));

      const p2 = new Promise<number>((_, reject) => setTimeout(() => reject(new Error('p2 fail')), 15))
        .then(val => log.push(`p2 then: ${val}`))
        .catch((err: Error) => {
          log.push(`p2 catch: ${err.message}`);
          return -1;
        })
        .finally(() => log.push('p2 finally'));

      const result = await Promise.all([p1, p2]);
      expect(result).assertDeepEquals([2, -1]);
      expect(log).assertDeepEquals([
        'p1 finally',
        'p2 catch: p2 fail',
        'p2 finally'
      ]);
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
      const createRecursivePromise = (n: number): Promise<number> => {
        if (n <= 0) {
          return Promise.resolve(1);
        }
        return Promise.all([
          createRecursivePromise(n - 1),
          createRecursivePromise(n - 1)
        ]).then((res: number[]) => res[0] + res[1]);
      };

      const result = await Promise.all([
        createRecursivePromise(3), // 1 → 2 → 4 → 8
        createRecursivePromise(2)// 1 → 2 → 4
      ]);
      expect(result).assertDeepEquals([8, 4]);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_ALL_TEST_8900
     * @tc.name PromiseAllTest089
     * @tc.desc test Promise.all with async/await in cascading chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAllTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const log: string[] = [];

      const asyncFunc1 = async (): Promise<number> => {
        log.push('func1 start');
        await new Promise<number>(resolve => setTimeout(resolve, 10));
        log.push('func1 end');
        return 1;
      };

      const asyncFunc2 = async (val: number): Promise<number> => {
        log.push('func2 start');
        await new Promise<number>(resolve => setTimeout(resolve, 15));
        log.push('func2 end');
        return val * 2;
      };

      const p1 = asyncFunc1();
      const p2 = p1.then(async val => await asyncFunc2(val));

      const result = await Promise.all([p1, p2]);
      expect(result).assertDeepEquals([1, 2]);
      expect(log).assertDeepEquals([
        'func1 start',
        'func1 end',
        'func2 start',
        'func2 end'
      ]);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_ALL_TEST_9000
     * @tc.name PromiseAllTest090
     * @tc.desc test Promise.all with Promise.resolve wrapping thenables
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAllTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const result: number[] = await PromiseAllTest090();
      expect(result).assertDeepEquals([1, 3]);
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
      const p1: Promise<number> = Promise.resolve(10)
        .then(val => Promise.resolve(val * 2))
        .then(val => val + 5);

      const p2: Promise<number> = Promise.reject(new Error('test'))
        .catch((err: Error) => err.message.length)
        .then(len => len * 2);

      const p3 = Promise.all([p1, p2])
        .then((res: number[]) => res[0] + res[1]);

      const result = await Promise.all([p1, p2, p3]);
      expect(result).assertDeepEquals([25, 8, 33]);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_ALL_TEST_9200
     * @tc.name PromiseAllTest092
     * @tc.desc test Promise.all with timing and Promise.race in nested chains
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAllTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const startTime = Date.now();

      const createTimedPromise = (value: number, delay: number): Promise<number> =>
      new Promise<number>(resolve => setTimeout(() => resolve(value), delay));

      const race1 = Promise.race([
        createTimedPromise(1, 20),
        createTimedPromise(2, 10)
      ]);

      const race2 = Promise.race([
        createTimedPromise(3, 5),
        createTimedPromise(4, 30)
      ]);

      const allRaces = Promise.all([race1, race2]);
      const chained = allRaces.then((res: number[]) => {
        return createTimedPromise(res[0] + res[1], 15)
      }
      );

      const result = await Promise.all([allRaces, chained]);

      expect(result).assertDeepEquals([[2, 3], 5]);
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
      class Level1Error extends Error {
      }

      class Level2Error extends Error {
      }

      const p1 = new Promise<string>((_, reject) => {
        setTimeout(() => reject(new Level1Error('level1')), 10);
      })
        .catch((err: Level1Error) => {
          return new Promise<string>((_, reject) => {
            setTimeout(() => reject(new Level2Error(`wrapped: ${err.message}`)), 10);
          });
        });

      const p2 = p1.catch((err: Level2Error) => err.message);
      const p3 = p1.catch((err: Error) => err.name);

      const result = await Promise.all([p2, p3]);
      expect(result).assertDeepEquals(['wrapped: level1', 'Error']);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_ALL_TEST_9400
     * @tc.name PromiseAllTest094
     * @tc.desc test Promise.all with Promise.allSettled and conditional handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAllTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const promises = [
        Promise.resolve(10),
        Promise.reject(new Error('fail')),
        new Promise<number>(resolve => setTimeout(() => resolve(20), 15))
      ];

      const settled = Promise.allSettled(promises);
      const processed = settled.then((results) => {
        let arr = results.map((r): number => {
          if (r.status === 'fulfilled') {
            return r.value * 2;
          }
          return r.reason.message.length;
        }) as number[];
        return arr
      });

      const result = await Promise.all([settled, processed]);
      expect(result[1]).assertDeepEquals([20, 4, 40]);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_ALL_TEST_9500
     * @tc.name PromiseAllTest095
     * @tc.desc test Promise.all with async iterators and Promise.resolve
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAllTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const result: number[] = await PromiseAllTest095();
      expect(result).assertDeepEquals([0, 2, 4]);
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
      const p2 = new Promise<number>(resolve => setTimeout(() => resolve(2), 20));
      const p3 = Promise.reject<string>(new Error('p3')).catch((err: Error) => err.message);
      const p4 = Promise.all([p1, p2]).then((res: number[]) => res[0] + res[1]);

      const result = await Promise.all([p1, p2, p3, p4]);

      expect(result).assertDeepEquals([1, 2, 'p3', 3]);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_ALL_TEST_9700
     * @tc.name PromiseAllTest097
     * @tc.desc test Promise.all with finally blocks in nested structure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAllTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const log: string[] = [];

      const inner = new Promise<number>(resolve => setTimeout(() => resolve(1), 10))
        .finally(() => log.push('inner finally'));

      const outer = inner.then((val: number) => {
        return new Promise<number>(resolve => setTimeout(() => resolve(val * 2), 10))
          .finally(() => log.push('middle finally'));
      })
        .finally(() => log.push('outer finally'));

      await Promise.all([inner, outer]);
      expect(log).assertDeepEquals([
        'inner finally',
        'middle finally',
        'outer finally'
      ]);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_ALL_TEST_9800
     * @tc.name PromiseAllTest098
     * @tc.desc test Promise.all with Promise.any and error recovery
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAllTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const createPromise = (id: number, delay: number, shouldFail: boolean) =>
      new Promise<number>((resolve, reject) =>
      setTimeout(() => {
        if (shouldFail) {
          reject(new Error(`p${id}`));
        } else {
          resolve(id);
        }
      }, delay)
      );

      const anyResult = Promise.any([
        createPromise(1, 10, true),
        createPromise(2, 20, true),
        createPromise(3, 30, false)
      ]);

      const allResults = Promise.all([
        anyResult,
        anyResult.then((val: number) => val * 2)
      ]);

      const result = await allResults;
      expect(result).assertDeepEquals([3, 6]);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_ALL_TEST_9900
     * @tc.name PromiseAllTest099
     * @tc.desc test Promise.all with complex dependency graph and timing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAllTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const startTime = Date.now();

      // Base promises with different delays
      const a = new Promise<number>(resolve => setTimeout(() => resolve(2), 10));
      const b = new Promise<number>(resolve => setTimeout(() => resolve(3), 15));

      // Intermediate promises with different dependencies
      const c = Promise.all([a, b]).then((res: number[]) => {
        let x = res[0]
        let y = res[1]
        return x * y
      });
      const d = a.then((x: number) => new Promise<number>(resolve => setTimeout(() => resolve(x * 2), 5)));
      const e = b.then((y: number) => new Promise<number>(resolve => setTimeout(() => resolve(y + 1), 10)));

      // Final promise depending on all intermediates
      const f = Promise.all([c, d, e]).then((res: number[]) => {
        let prod = res[0]
        let double = res[1]
        let inc = res[2]
        return new Promise<number>(resolve => setTimeout(() => resolve(prod + double + inc), 10))
      });

      const result = await Promise.all([a, b, c, d, e, f]);

      expect(result).assertDeepEquals([2, 3, 6, 4, 4, 14]);
    });

    /**
     * @tc.number SUB_BUILTINS_PROMISE_ALL_TEST_10000
     * @tc.name PromiseAllTest100
     * @tc.desc test Promise.all with all Promise static methods in chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAllTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Create promises that will fail and succeed
      const fastFail = new Promise<number>((_, reject) => setTimeout(() => reject(1), 5));
      const slowSuccess = new Promise<number>(resolve => setTimeout(() => resolve(2), 10));
      const mediumSuccess = new Promise<number>(resolve => setTimeout(() => resolve(3), 15));

      // Combine different static methods
      const anyResult = Promise.any([fastFail, slowSuccess, mediumSuccess]);
      const raceResult = Promise.race([fastFail.catch(() => 0), slowSuccess]);
      const allSettledResult = Promise.allSettled([fastFail.catch(() => 'caught'), mediumSuccess]);

      // Final all with all results
      const result = await Promise.all([
        anyResult,
        raceResult,
        allSettledResult.then(results => results.length)
      ]);

      expect(result).assertDeepEquals([2, 0, 2]);
    });

  })
}