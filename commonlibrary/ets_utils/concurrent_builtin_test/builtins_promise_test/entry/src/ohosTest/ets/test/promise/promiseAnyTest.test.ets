import { afterEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { PromiseAnyTest054 } from './promisejs';
import { emptyObj, obj40, type12, type27, type90 } from './promisets';
import { sleep } from './utils';

export default function promiseAnyTest() {
  describe('promiseAnyTest', () => {
    afterEach(async () => {
      await sleep(100)
    })
    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0010
     * @tc.name PromiseAnyTest001
     * @tc.desc All promises resolve, return the first resolved result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1: Promise<number> = Promise.resolve(1);
      const p2: Promise<number> = Promise.resolve(2);
      const p3: Promise<number> = Promise.resolve(3);

      const result = await Promise.any([p1, p2, p3]);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0020
     * @tc.name PromiseAnyTest002
     * @tc.desc Some promises resolve, return the first resolved result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1: Promise<number> = Promise.reject(new Error('Error 1'));
      const p2: Promise<number> = Promise.resolve(2);
      const p3: Promise<number> = Promise.resolve(3);

      const result = await Promise.any([p1, p2, p3]);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0030
     * @tc.name PromiseAnyTest003
     * @tc.desc All promises reject, return AggregateError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
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
     * @tc.level Level 1
     */
    it('PromiseAnyTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1: Promise<number> = new Promise<number>((resolve) => setTimeout(() => resolve(1), 100));
      const p2: Promise<number> = new Promise<number>((resolve) => setTimeout(() => resolve(2), 50));

      const result = await Promise.any([p1, p2]);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0050
     * @tc.name PromiseAnyTest005
     * @tc.desc Handle array with non-promise values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await Promise.any([1, 2, 3]);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0060
     * @tc.name PromiseAnyTest006
     * @tc.desc Pass empty array, return rejected promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        await Promise.any([]);
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
     * @tc.level Level 1
     */
    it('PromiseAnyTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1: Promise<number> = new Promise<number>(() => {
      }); // Forever pending
      const p2: Promise<number> = Promise.resolve(2);

      const result = await Promise.any([p1, p2]);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0080
     * @tc.name PromiseAnyTest008
     * @tc.desc Test promise state changes: reject first then resolve
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAnyTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let resolveFn: (value: number) => void;

      const p1: Promise<number> = new Promise<number>((_, reject) => {
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
     * @tc.level Level 1
     */
    it('PromiseAnyTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
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
     * @tc.level Level 1
     */
    it('PromiseAnyTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1: Promise<string> = Promise.reject(new Error('Error'));
      const p2: Promise<number> = new Promise<number>((resolve) => setTimeout(() => resolve(42), 50));
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
     * @tc.level Level 1
     */
    it('PromiseAnyTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1: Promise<string> = Promise.resolve("first");
      const p2: Promise<string> = new Promise<string>((resolve) => setTimeout(() => resolve("second"), 100));

      const result = await Promise.any([p1, p2]);
      expect(result).assertEqual("first");
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0120
     * @tc.name PromiseAnyTest012
     * @tc.desc Resolve with object values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1: Promise<type12> = new Promise<type12>((resolve) => setTimeout(() => resolve({ id: 1 }), 50));
      const p2: Promise<type12> = Promise.resolve<type12>({ id: 2 });

      const result = await Promise.any([p1, p2]);
      expect(result.id).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0130
     * @tc.name PromiseAnyTest013
     * @tc.desc Rejections with different error types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAnyTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const p1: Promise<number> = Promise.reject(new TypeError('Type error'));
      const p2: Promise<number> = Promise.reject(new RangeError('Range error'));
      const p3: Promise<number> = Promise.reject('Simple error string');

      try {
        await Promise.any([p1, p2, p3]);
        expect().assertFail();
      } catch (error) {
        expect(error instanceof AggregateError).assertEqual(true);
        expect((error as AggregateError).errors.length).assertEqual(3);
        expect((error as AggregateError).errors[0] instanceof TypeError).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0140
     * @tc.name PromiseAnyTest014
     * @tc.desc Single promise that resolves
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
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
     * @tc.level Level 1
     */
    it('PromiseAnyTest015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const p1: Promise<number> = new Promise<number>((_, reject) => reject(new Error('Single error')));

      try {
        await Promise.any([p1]);
        expect().assertFail();
      } catch (error) {
        expect(error instanceof AggregateError).assertEqual(true);
        expect((error as AggregateError).errors.length).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0160
     * @tc.name PromiseAnyTest016
     * @tc.desc Resolve after multiple rejections
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAnyTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const p1: Promise<number> = new Promise<number>((_, reject) => setTimeout(() => reject('Error 1'), 10));
      const p2: Promise<number> = new Promise<number>((_, reject) => setTimeout(() => reject('Error 2'), 20));
      const p3: Promise<number> = new Promise<number>((resolve) => setTimeout(() => resolve(3), 30));

      const result = await Promise.any([p1, p2, p3]);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0170
     * @tc.name PromiseAnyTest017
     * @tc.desc Non-promise and promise mix in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1: Promise<number> = new Promise<number>((resolve) => setTimeout(() => resolve(100), 50));
      const mixedArray = [42, p1, "string"] as Promise<number | string>[];

      const result = await Promise.any(mixedArray);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0180
     * @tc.name PromiseAnyTest018
     * @tc.desc Promise rejects after long delay, but another resolves
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAnyTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const p1: Promise<number> = new Promise<number>((_, reject) => setTimeout(() => reject('Late error'), 200));
      const p2: Promise<number> = new Promise<number>((resolve) => setTimeout(() => resolve(150), 100));

      const result = await Promise.any([p1, p2]);
      expect(result).assertEqual(150);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0190
     * @tc.name PromiseAnyTest019
     * @tc.desc AggregateError with non-Error objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAnyTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const p1: Promise<number> = Promise.reject(404);
      const p2: Promise<number> = Promise.reject({ code: 500 });
      const p3: Promise<number> = Promise.reject(null);

      try {
        await Promise.any([p1, p2, p3]);
        expect().assertFail();
      } catch (error) {
        expect(error instanceof AggregateError).assertEqual(true);
        expect((error as AggregateError).errors).assertDeepEquals([404, { code: 500 }, null]);
      }
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0200
     * @tc.name PromiseAnyTest020
     * @tc.desc Resolve with undefined value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const p1: Promise<undefined> = new Promise<undefined>((resolve) => resolve(undefined));
      const p2: Promise<number> = new Promise<number>((resolve) => setTimeout(() => resolve(1), 10));

      const result = await Promise.any([p1, p2]);
      expect(result).assertEqual(undefined);
    });
    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0210
     * @tc.name PromiseAnyTest021
     * @tc.desc Resolve with null value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const p1: Promise<null> = new Promise<null>((resolve) => resolve(null));
      const p2: Promise<string> = new Promise<string>((resolve) => setTimeout(() => resolve("not null"), 10));

      const result = await Promise.any([p1, p2]);
      expect(result).assertEqual(null);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0220
     * @tc.name PromiseAnyTest022
     * @tc.desc Resolve with bigint type
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const p1: Promise<bigint> = new Promise<bigint>((resolve) => resolve(BigInt(9007199254740991)));
      const p2: Promise<bigint> = new Promise<bigint>((resolve) => setTimeout(() => resolve(BigInt(123)), 50));

      const result = await Promise.any([p1, p2]);
      expect(result).assertEqual(BigInt(9007199254740991));
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0230
     * @tc.name PromiseAnyTest023
     * @tc.desc Multiple layers of promise resolution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAnyTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const p1: Promise<number> = new Promise<number>((resolve) =>
      resolve(new Promise<number>((res) => res(10)))
      );
      const p2: Promise<number> = new Promise<number>((resolve) => setTimeout(() => resolve(20), 30));

      const result = await Promise.any([p1, p2]);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0240
     * @tc.name PromiseAnyTest024
     * @tc.desc Nested promises in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAnyTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const nestedPromise: Promise<Promise<number>> = new Promise<Promise<number>>((resolve) =>
      setTimeout(() => resolve(Promise.resolve(5)), 10)
      );
      const p1: Promise<number> = new Promise<number>((resolve) => setTimeout(() => resolve(1), 50));

      const result = await Promise.any([nestedPromise, p1]);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0250
     * @tc.name PromiseAnyTest025
     * @tc.desc Very fast resolving promise
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const p1: Promise<string> = new Promise<string>((resolve) => {
        resolve("immediate");
      });
      const p2: Promise<string> = Promise.resolve("resolved");

      const result = await Promise.any([p1, p2]);
      // Either could resolve first depending on implementation, but we check for either valid result
      expect(result === "immediate" || result === "resolved").assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0260
     * @tc.name PromiseAnyTest026
     * @tc.desc Rejections with different timings before resolution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAnyTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const p1: Promise<number> = new Promise<number>((_, reject) => setTimeout(() => reject("Error 1"), 10));
      const p2: Promise<number> = new Promise<number>((_, reject) => setTimeout(() => reject("Error 2"), 20));
      const p3: Promise<number> = new Promise<number>((_, reject) => setTimeout(() => reject("Error 3"), 30));
      const p4: Promise<number> = new Promise<number>((resolve) => setTimeout(() => resolve(4), 40));

      const result = await Promise.any([p1, p2, p3, p4]);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0270
     * @tc.name PromiseAnyTest027
     * @tc.desc Test with Symbol type resolution
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {

      const p1 = new Promise<type27>((resolve) => {
        setTimeout(() => resolve({ id: 'obj-1', value: 'first-resolved' }), 30);
      });

      const p2 = new Promise<type27>((resolve) => {
        setTimeout(() => resolve({ id: 'obj-2', value: 'second-resolved' }), 10);
      });

      const p3 = new Promise<type27>((resolve) => {
        setTimeout(() => resolve({ id: 'obj-3', value: 'third-resolved' }), 20);
      });

      const result = await Promise.any([p1, p2, p3]);
      expect(result.value).assertEqual('second-resolved');
      expect(result.id).assertEqual('obj-2');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0280
     * @tc.name PromiseAnyTest028
     * @tc.desc Large number of promises
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAnyTest028', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      // Create 100 rejected promises
      const promises: Promise<number>[] = [];
      for (let i = 0; i < 99; i++) {
        promises.push(new Promise<number>((_, reject) => reject(i)));
      }
      // Add one resolving promise
      promises.push(new Promise<number>((resolve) => resolve(99)));

      const result = await Promise.any(promises);
      expect(result).assertEqual(99);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0290
     * @tc.name PromiseAnyTest029
     * @tc.desc First promise rejects, second resolves, others pending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAnyTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const p1: Promise<number> = new Promise<number>((_, reject) => setTimeout(() => reject("Error"), 10));
      const p2: Promise<number> = new Promise<number>((resolve) => setTimeout(() => resolve(2), 20));
      const p3: Promise<number> = new Promise<number>(() => {
      }); // Pending forever
      const p4: Promise<number> = new Promise<number>(() => {
      }); // Pending forever

      const result = await Promise.any([p1, p2, p3, p4]);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0300
     * @tc.name PromiseAnyTest030
     * @tc.desc Resolve with function type
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const func1 = () => "first";
      const func2 = () => "second";

      const p1: Promise<() => string> = new Promise<() => string>((resolve) => resolve(func1));
      const p2: Promise<() => string> = new Promise<() => string>((resolve) => setTimeout(() => resolve(func2), 10));

      const result = await Promise.any([p1, p2]);
      expect(result()).assertEqual("first");
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0310
     * @tc.name PromiseAnyTest031
     * @tc.desc Resolve with array value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1: Promise<number[]> = new Promise<number[]>((resolve) => resolve([1, 2, 3]));
      const p2: Promise<number[]> = new Promise<number[]>((resolve) => setTimeout(() => resolve([4, 5, 6]), 50));

      const result = await Promise.any([p1, p2]);
      expect(result).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0320
     * @tc.name PromiseAnyTest032
     * @tc.desc Test with date objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const date1 = new Date(2023, 0, 1);
      const date2 = new Date(2023, 0, 2);

      const p1: Promise<Date> = new Promise<Date>((resolve) => setTimeout(() => resolve(date1), 50));
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
     * @tc.level Level 2
     */
    it('PromiseAnyTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const p1: Promise<number> = new Promise<number>(() => {
      }); // Pending
      const p2: Promise<number> = new Promise<number>(() => {
      }); // Pending
      const p3: Promise<number> = new Promise<number>((resolve) => setTimeout(() => resolve(3), 100));

      const result = await Promise.any([p1, p2, p3]);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0340
     * @tc.name PromiseAnyTest034
     * @tc.desc Different rejection types including Error subclasses
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAnyTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      class CustomError extends Error {
        constructor(message: string) {
          super(message);
          this.name = 'CustomError';
        }
      }

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
     * @tc.level Level 1
     */
    it('PromiseAnyTest035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const regex1 = /test1/;
      const regex2 = /test2/;

      const p1: Promise<RegExp> = new Promise<RegExp>((resolve) => resolve(regex1));
      const p2: Promise<RegExp> = new Promise<RegExp>((resolve) => setTimeout(() => resolve(regex2), 10));

      const result = await Promise.any([p1, p2]);
      expect(result).assertEqual(regex1);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0360
     * @tc.name PromiseAnyTest036
     * @tc.desc Test with Map objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map1 = new Map<string, number>([['a', 1]]);
      const map2 = new Map<string, number>([['b', 2]]);

      const p1: Promise<Map<string, number>> =
        new Promise<Map<string, number>>((resolve) => setTimeout(() => resolve(map1), 50));
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
     * @tc.level Level 1
     */
    it('PromiseAnyTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const set1 = new Set<number>([1, 2, 3]);
      const set2 = new Set<number>([4, 5, 6]);

      const p1: Promise<Set<number>> = new Promise<Set<number>>((resolve) => resolve(set1));
      const p2: Promise<Set<number>> = new Promise<Set<number>>((resolve) => setTimeout(() => resolve(set2), 50));

      const result = await Promise.any([p1, p2]);
      expect(result).assertEqual(set1);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0380
     * @tc.name PromiseAnyTest038
     * @tc.desc Very long delay before resolution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAnyTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const p1: Promise<string> = new Promise<string>((_, reject) => setTimeout(() => reject("Error"), 50));
      const p2: Promise<string> = new Promise<string>((resolve) => setTimeout(() => resolve("Finally resolved"), 200));

      const result = await Promise.any([p1, p2]);
      expect(result).assertEqual("Finally resolved");
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0390
     * @tc.name PromiseAnyTest039
     * @tc.desc Resolve with class instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      class TestClass {
        public value: string;

        constructor(value: string) {
          this.value = value;
        }
      }

      const instance1 = new TestClass("first");
      const instance2 = new TestClass("second");

      const p1: Promise<TestClass> = new Promise<TestClass>((resolve) => resolve(instance1));
      const p2: Promise<TestClass> = new Promise<TestClass>((resolve) => setTimeout(() => resolve(instance2), 10));

      const result = await Promise.any([p1, p2]);
      expect(result.value).assertEqual("first");
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0400
     * @tc.name PromiseAnyTest040
     * @tc.desc Empty and non-empty object resolution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PromiseAnyTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const p1: Promise<object> = new Promise<object>((resolve) => setTimeout(() => resolve(emptyObj), 50));
      const p2: Promise<object> = new Promise<object>((resolve) => resolve(obj40));

      const result = await Promise.any([p1, p2]);
      expect(result).assertDeepEquals(obj40);
    });
    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0410
     * @tc.name PromiseAnyTest041
     * @tc.desc Cascading promise resolutions with varying delays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAnyTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const p1: Promise<number> = new Promise<number>((resolve) =>
      setTimeout(() => resolve(1), 100)
      );
      const p2: Promise<number> = new Promise<number>((resolve) =>
      setTimeout(() => resolve(new Promise<number>((res) =>
      setTimeout(() => res(2), 50)
      )), 30)
      );

      const result = await Promise.any([p1, p2]);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0420
     * @tc.name PromiseAnyTest042
     * @tc.desc Async function returning promises in sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAnyTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const asyncFn1 = async (): Promise<number> => {
        await new Promise<void>((resolve) => setTimeout(resolve, 80));
        return 1;
      };

      const asyncFn2 = async (): Promise<number> => {
        await new Promise<void>((resolve) => setTimeout(resolve, 40));
        return 2;
      };

      const result = await Promise.any([asyncFn1(), asyncFn2()]);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0430
     * @tc.name PromiseAnyTest043
     * @tc.desc Deeply nested promises with different resolve times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAnyTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const nestedPromise: Promise<Promise<Promise<string>>> = new Promise<Promise<Promise<string>>>((resolve) =>
      setTimeout(() => resolve(new Promise<Promise<string>>((res) =>
      setTimeout(() => res(Promise.resolve("deep")), 20)
      )), 10)
      );

      const directPromise: Promise<string> = new Promise<string>((resolve) =>
      setTimeout(() => resolve("direct"), 50)
      );

      const result = await Promise.any([nestedPromise, directPromise]);
      expect(result).assertEqual("deep");
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0440
     * @tc.name PromiseAnyTest044
     * @tc.desc Race between immediate reject and delayed resolve
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAnyTest044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const p1: Promise<number> = Promise.reject(new Error('Immediate reject'));
      const p2: Promise<number> = new Promise<number>((resolve) => setTimeout(() => resolve(2), 10));

      const result = await Promise.any([p1, p2]);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0450
     * @tc.name PromiseAnyTest045
     * @tc.desc Sequential promise creation affecting resolution order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAnyTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const promises: Promise<number>[] = [];

      // Create promises in sequence with increasing delays
      for (let i = 0; i < 5; i++) {
        promises.push(new Promise<number>((resolve) =>
        setTimeout(() => resolve(i), (5 - i) * 20)
        ));
        await new Promise<void>((resolve) => setTimeout(resolve, 10));
      }

      const result = await Promise.any(promises);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0460
     * @tc.name PromiseAnyTest046
     * @tc.desc Async cascading with mixed resolve/reject
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAnyTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const p1: Promise<number> = new Promise<number>((resolve) =>
      setTimeout(() => resolve(
        new Promise<number>((res, rej) => setTimeout(() => rej('Inner reject'), 10))
      ), 20)
      );

      const p2: Promise<number> = new Promise<number>((resolve) =>
      setTimeout(() => resolve(
        new Promise<number>((res) => setTimeout(() => res(2), 30))
      ), 10)
      );

      const result = await Promise.any([p1, p2]);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0470
     * @tc.name PromiseAnyTest047
     * @tc.desc Timing test with microtasks vs macrotasks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAnyTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let result1: number = 0;
      let result2: number = 0;

      // Microtask (Promise.then)
      const p1: Promise<number> = Promise.resolve(1).then(num => {
        result1 = num;
        return num;
      });

      // Macrotask (setTimeout)
      const p2: Promise<number> = new Promise<number>((resolve) =>
      setTimeout(() => {
        result2 = 2;
        resolve(2);
      }, 0)
      );

      const result = await Promise.any([p1, p2]);
      expect(result).assertEqual(1);
      expect(result1).assertEqual(1);
      expect(result2).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0480
     * @tc.name PromiseAnyTest048
     * @tc.desc Nested async functions with varying completion times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAnyTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const createNestedAsync = (delay: number, value: number): Promise<number> => {
        return new Promise<number>(async (resolve) => {
          await new Promise<void>((res) => setTimeout(res, delay / 2));
          resolve(new Promise<number>(async (res) => {
            await new Promise<void>((r) => setTimeout(r, delay / 2));
            res(value);
          }));
        });
      };

      const p1: Promise<number> = createNestedAsync(100, 1);
      const p2: Promise<number> = createNestedAsync(60, 2);
      const p3: Promise<number> = createNestedAsync(80, 3);

      const result = await Promise.any([p1, p2, p3]);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0490
     * @tc.name PromiseAnyTest049
     * @tc.desc Rejections followed by late resolution in async chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAnyTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const p1: Promise<string> = new Promise<string>((_, reject) =>
      setTimeout(() => reject('Early reject'), 10)
      );

      const p2: Promise<string> = new Promise<string>((_, reject) =>
      setTimeout(() => reject('Medium reject'), 30)
      );

      const p3: Promise<string> = new Promise<string>(async (resolve) => {
        await new Promise<void>((res) => setTimeout(res, 50));
        resolve('Late resolve');
      });

      const result = await Promise.any([p1, p2, p3]);
      expect(result).assertEqual('Late resolve');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0500
     * @tc.name PromiseAnyTest050
     * @tc.desc Multiple levels of promise chaining
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAnyTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const chain1: Promise<number> = Promise.resolve(1)
        .then(num => new Promise<number>((res) => setTimeout(() => res(num + 1), 50)))
        .then(num => new Promise<number>((res) => setTimeout(() => res(num + 1), 50)));

      const chain2: Promise<number> = Promise.resolve(10)
        .then(num => new Promise<number>((res) => setTimeout(() => res(num + 1), 20)))
        .then(num => new Promise<number>((res) => setTimeout(() => res(num + 1), 20)));

      const result = await Promise.any([chain1, chain2]);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0510
     * @tc.name PromiseAnyTest051
     * @tc.desc Parallel async operations with different completion times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAnyTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const fetchData = (id: number, delay: number): Promise<type12> => {
        return new Promise<type12>((resolve) =>
        setTimeout(() => resolve({ id }), delay)
        );
      };

      const promises = [
        fetchData(1, 100),
        fetchData(2, 60),
        fetchData(3, 80),
        fetchData(4, 40)
      ];

      const result = await Promise.any(promises);
      expect(result.id).assertEqual(4);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0520
     * @tc.name PromiseAnyTest052
     * @tc.desc Promise.any with promises created in async loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAnyTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const promises: Promise<number>[] = [];

      for (let i = 1; i <= 5; i++) {
        // Create promises with increasing delays
        const p: Promise<number> = new Promise<number>((resolve) =>
        setTimeout(() => resolve(i), i * 20)
        );
        promises.push(p);
        // Add small delay between promise creation
        await new Promise<void>((resolve) => setTimeout(resolve, 5));
      }

      const result = await Promise.any(promises);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0530
     * @tc.name PromiseAnyTest053
     * @tc.desc Nested Promise.any calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAnyTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const innerAny1: Promise<number> = Promise.any([
        new Promise<number>((resolve) => setTimeout(() => resolve(1), 100)),
        new Promise<number>((resolve) => setTimeout(() => resolve(2), 50))
      ]);

      const innerAny2: Promise<number> = Promise.any([
        new Promise<number>((resolve) => setTimeout(() => resolve(3), 30)),
        new Promise<number>((resolve) => setTimeout(() => resolve(4), 40))
      ]);

      const result = await Promise.any([innerAny1, innerAny2]);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0540
     * @tc.name PromiseAnyTest054
     * @tc.desc Async generators providing promises
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAnyTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const result: number = await PromiseAnyTest054();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0550
     * @tc.name PromiseAnyTest055
     * @tc.desc Reject cascade with final resolve
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAnyTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const createTimedPromise = (value: number, delay: number, shouldReject: boolean): Promise<number> => {
        return new Promise<number>((resolve, reject) =>
        setTimeout(() => {
          if (shouldReject) {
            reject(`Rejected ${value}`);
          } else {
            resolve(value);
          }
        }, delay)
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
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0560
     * @tc.name PromiseAnyTest056
     * @tc.desc Complex nested async operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAnyTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const complexOp = async (id: number, baseDelay: number): Promise<number> => {
        await new Promise<void>((resolve) => setTimeout(resolve, baseDelay * 0.3));
        return new Promise<number>(async (resolve) => {
          await new Promise<void>((res) => setTimeout(res, baseDelay * 0.5));
          resolve(new Promise<number>((r) => {
            setTimeout(() => r(id), baseDelay * 0.2);
          }));
        });
      };

      const result = await Promise.any([
        complexOp(1, 100),
        complexOp(2, 60),
        complexOp(3, 80)
      ]);

      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0570
     * @tc.name PromiseAnyTest057
     * @tc.desc Timing test with overlapping async operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAnyTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const start = Date.now();
      let p1ResolveTime: number = 0
      let p2ResolveTime: number = 0
      let finish = false
      const p1: Promise<number> = new Promise<number>((resolve) =>
      setTimeout(() => {
        p1ResolveTime = Date.now() - start;
        resolve(1);
        finish = true
      }, 50)
      );

      const p2: Promise<number> = new Promise<number>((resolve) => {
        // Start a shorter timer after a delay
        setTimeout(() => {
          setTimeout(() => {
            p2ResolveTime = Date.now() - start;
            resolve(2);
          }, 30);
        }, 10);
      });
      const result = await Promise.any([p1, p2]);
      while (!finish) {
        await sleep(10)
      }
      expect(result).assertEqual(2);
      expect(p2ResolveTime).assertLess(p1ResolveTime);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0580
     * @tc.name PromiseAnyTest058
     * @tc.desc Promise.any with promises that resolve after multiple steps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAnyTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const step1: Promise<number> = new Promise<number>((resolve) =>
      setTimeout(() => resolve(10), 20)
      );

      const step2: Promise<number> = step1.then(num =>
      new Promise<number>((resolve) => setTimeout(() => resolve(num + 5), 20))
      );

      const step3: Promise<number> = step2.then(num =>
      new Promise<number>((resolve) => setTimeout(() => resolve(num + 3), 20))
      );

      const alternative: Promise<number> = new Promise<number>((resolve) =>
      setTimeout(() => resolve(15), 50)
      );

      const result = await Promise.any([step3, alternative]);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0590
     * @tc.name PromiseAnyTest059
     * @tc.desc Race between multiple async initialization processes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAnyTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      class Service {
        private name: string;
        private initTime: number

        constructor(name: string, initTime: number) {
          this.name = name
          this.initTime = initTime
        }

        async initialize(): Promise<string> {
          await new Promise<void>((resolve) => setTimeout(resolve, this.initTime));
          return `Service ${this.name} ready`;
        }
      }

      const serviceA = new Service('A', 100);
      const serviceB = new Service('B', 60);
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
     * @tc.level Level 3
     */
    it('PromiseAnyTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const validate = (value: number, delay: number): Promise<number> => {
        return new Promise<number>((resolve, reject) =>
        setTimeout(() => {
          if (value % 2 === 0) {
            resolve(value);
          } else {
            reject(`Invalid: ${value}`);
          }
        }, delay)
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
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0610
     * @tc.name PromiseAnyTest061
     * @tc.desc Nested promises with varying reject/resolve points
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAnyTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const p1: Promise<string> = new Promise<string>((resolve) =>
      resolve(new Promise<string>((res, rej) =>
      setTimeout(() => rej('Inner reject'), 10)
      ))
      );

      const p2: Promise<string> = new Promise<string>((resolve) =>
      setTimeout(() => resolve(
        new Promise<string>((res) =>
        setTimeout(() => res('Late resolve'), 30)
        )
      ), 20)
      );

      const p3: Promise<string> = new Promise<string>((resolve) =>
      setTimeout(() => resolve(
        new Promise<string>((res, rej) =>
        setTimeout(() => rej('Another reject'), 5)
        )
      ), 15)
      );

      const result = await Promise.any([p1, p2, p3]);
      expect(result).assertEqual('Late resolve');
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0620
     * @tc.name PromiseAnyTest062
     * @tc.desc Promise.any with dynamic promise creation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAnyTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const createPromisesDynamically = async (count: number): Promise<Promise<number>[]> => {
        const promises: Promise<number>[] = [];
        for (let i = 0; i < count; i++) {
          // Create promises with random delays
          const delay = Math.floor(Math.random() * 100) + 10;
          promises.push(new Promise<number>((resolve) =>
          setTimeout(() => resolve(i), delay)
          ));
          await new Promise<void>((resolve) => setTimeout(resolve, 5));
        }
        return promises;
      };

      const promises = await createPromisesDynamically(5);
      const result = await Promise.any(promises);

      // Find the smallest delay promise
      const minIndex = promises.findIndex((_, idx) => idx === result);
      expect(minIndex).assertLargerOrEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0630
     * @tc.name PromiseAnyTest063
     * @tc.desc Cascading timeouts with Promise.any
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAnyTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const withTimeout = <T>(promise: Promise<T>, timeout: number): Promise<T | string> => {
        return Promise.race([
          promise,
          new Promise<string>((_, reject) =>
          setTimeout(() => reject(`Timeout after ${timeout}ms`), timeout)
          )
        ]);
      };

      const fetch1: Promise<number> = new Promise<number>((resolve) =>
      setTimeout(() => resolve(1), 150)
      );

      const fetch2: Promise<number> = new Promise<number>((resolve) =>
      setTimeout(() => resolve(2), 80)
      );

      const result = await Promise.any([
        withTimeout(fetch1, 100), // Will timeout
        withTimeout(fetch2, 100)// Will succeed
      ]);

      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0640
     * @tc.name PromiseAnyTest064
     * @tc.desc Async dependency resolution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAnyTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const resolveDependency = async (id: number, deps: number[]): Promise<number> => {
        if (deps.length > 0) {
          // Resolve dependencies first
          await Promise.all(deps.map(dep =>
          resolveDependency(dep, [])
          ));
        }
        // Simulate resolution time
        await new Promise<void>((resolve) => setTimeout(resolve, id * 20));
        return id;
      };

      const result = await Promise.any([
        resolveDependency(1, [2, 3]), // Depends on 2 and 3
        resolveDependency(2, []), // No dependencies
        resolveDependency(3, [4]), // Depends on 4
        resolveDependency(4, [])// No dependencies
      ]);

      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0650
     * @tc.name PromiseAnyTest065
     * @tc.desc Promise.any with promises that resolve in reverse creation order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAnyTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const promises: Promise<number>[] = [];

      // Create promises that resolve in reverse order of creation
      for (let i = 1; i <= 5; i++) {
        promises.push(new Promise<number>((resolve) =>
        setTimeout(() => resolve(i), (6 - i) * 30)
        ));
      }

      const result = await Promise.any(promises);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0660
     * @tc.name PromiseAnyTest066
     * @tc.desc Complex error handling in nested promises
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAnyTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const riskyOperation = (success: boolean, delay: number, value: number): Promise<number> => {
        return new Promise<number>((resolve, reject) =>
        setTimeout(() => {
          if (success) {
            resolve(value);
          } else {
            reject(new Error(`Operation failed: ${value}`));
          }
        }, delay)
        );
      };

      const result = await Promise.any([
        riskyOperation(false, 10, 1),
        riskyOperation(false, 20, 2),
        riskyOperation(true, 30, 3),
        riskyOperation(true, 40, 4)
      ]);

      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0670
     * @tc.name PromiseAnyTest067
     * @tc.desc Async data processing pipeline race
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAnyTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const processData = async (data: string, delay: number): Promise<string> => {
        // Step 1: Validate
        await new Promise<void>((resolve) => setTimeout(resolve, delay * 0.2));
        // Step 2: Transform
        await new Promise<void>((resolve) => setTimeout(resolve, delay * 0.3));
        // Step 3: Finalize
        await new Promise<void>((resolve) => setTimeout(resolve, delay * 0.5));
        return `Processed: ${data}`;
      };

      const result = await Promise.any([
        processData("A", 100),
        processData("B", 60),
        processData("C", 80)
      ]);

      expect(result).assertEqual("Processed: B");
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0680
     * @tc.name PromiseAnyTest068
     * @tc.desc Promise.any with promises that change state after delays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAnyTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let resolveP1: (value: number) => void;
      let resolveP2: (value: number) => void;

      const p1: Promise<number> = new Promise<number>((resolve) => {
        resolveP1 = resolve;
      });

      const p2: Promise<number> = new Promise<number>((resolve) => {
        resolveP2 = resolve;
      });

      // Schedule resolutions in reverse order
      setTimeout(() => resolveP2(2), 50);
      setTimeout(() => resolveP1(1), 30);

      const result = await Promise.any([p1, p2]);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0690
     * @tc.name PromiseAnyTest069
     * @tc.desc Concurrent async tasks with different resource acquisition times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAnyTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const acquireResource = async (name: string, delay: number): Promise<string> => {
        // Simulate resource acquisition delay
        await new Promise<void>((resolve) => setTimeout(resolve, delay));
        return `Resource ${name} acquired`;
      };

      const result = await Promise.any([
        acquireResource("DB", 100),
        acquireResource("Cache", 40),
        acquireResource("API", 70)
      ]);

      expect(result).assertEqual("Resource Cache acquired");
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0700
     * @tc.name PromiseAnyTest070
     * @tc.desc Promise.any with mixed immediate and delayed operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAnyTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Immediate reject
      const p1: Promise<number> = Promise.reject(new Error('Immediate reject'));

      // Immediate resolve
      const p2: Promise<number> = Promise.resolve(2);

      // Short delay resolve
      const p3: Promise<number> = new Promise<number>((resolve) => setTimeout(() => resolve(3), 10));

      // Medium delay resolve
      const p4: Promise<number> = new Promise<number>((resolve) => setTimeout(() => resolve(4), 50));

      // Long delay reject
      const p5: Promise<number> = new Promise<number>((_, reject) => setTimeout(() => reject('Late reject'), 100));

      const result = await Promise.any([p1, p2, p3, p4, p5]);
      expect(result).assertEqual(2);
    });
    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0710
     * @tc.name PromiseAnyTest071
     * @tc.desc Three-level nested promises timing race
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAnyTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Three-level nesting, total delay 10+20+30=60ms
      const nested3: Promise<number> = new Promise<number>((resolve) =>
      setTimeout(() => resolve(
        new Promise<number>((res) => setTimeout(() => res(
          new Promise<number>((r) => setTimeout(() => r(3), 30))
        ), 20))
      ), 10)
      );

      // Two-level nesting, total delay 40+15=55ms
      const nested2: Promise<number> = new Promise<number>((resolve) =>
      setTimeout(() => resolve(
        new Promise<number>((res) => setTimeout(() => res(2), 15))
      ), 40)
      );

      const result = await Promise.any([nested3, nested2]);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0720
     * @tc.name PromiseAnyTest072
     * @tc.desc Timing control in async function cascade calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAnyTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const asyncStep = async (value: number, delay: number): Promise<number> => {
        await new Promise<void>((resolve) => setTimeout(resolve, delay));
        return value;
      };

      const cascade1: Promise<number> = asyncStep(1, 20)
        .then(num => asyncStep(num * 2, 30))
        .then(num => asyncStep(num + 5, 20));

      const cascade2: Promise<number> = asyncStep(2, 15)
        .then(num => asyncStep(num * 3, 25))
        .then(num => asyncStep(num - 4, 10));

      const result = await Promise.any([cascade1, cascade2]);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0730
     * @tc.name PromiseAnyTest073
     * @tc.desc Multi-stage async operations with varying completion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAnyTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const stage1: Promise<number> = new Promise<number>((resolve) =>
      setTimeout(() => resolve(10), 15)
      );

      const pipelineA: Promise<number> = stage1
        .then(num => new Promise<number>((resolve) =>
        setTimeout(() => resolve(num + 5), 25)
        ))
        .then(num => new Promise<number>((resolve) =>
        setTimeout(() => resolve(num * 2), 20)
        ));

      const stage2: Promise<number> = new Promise<number>((resolve) =>
      setTimeout(() => resolve(8), 10)
      );

      const pipelineB: Promise<number> = stage2
        .then(num => new Promise<number>((resolve) =>
        setTimeout(() => resolve(num * 3), 15)
        ))
        .then(num => new Promise<number>((resolve) =>
        setTimeout(() => resolve(num + 7), 10)
        ));

      const result = await Promise.any([pipelineA, pipelineB]);
      expect(result).assertEqual(31);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0740
     * @tc.name PromiseAnyTest074
     * @tc.desc Race between sequentially created promise chains
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAnyTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const createChain = (id: number, baseDelay: number): Promise<number> => {
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            resolve(new Promise<number>((res) => {
              setTimeout(() => {
                res(new Promise<number>((r) => {
                  setTimeout(() => r(id), baseDelay * 0.2);
                }));
              }, baseDelay * 0.3);
            }));
          }, baseDelay * 0.5);
        });
      };

      const chains: Promise<number>[] = [];
      // Create chains with increasing base delays
      for (let i = 1; i <= 4; i++) {
        chains.push(createChain(i, i * 20));
        // Small delay between chain creation
        await new Promise<void>((resolve) => setTimeout(resolve, 5));
      }

      const result = await Promise.any(chains);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0750
     * @tc.name PromiseAnyTest075
     * @tc.desc Async validation cascades with early success
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAnyTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const validateLevel1 = (value: string): Promise<string> => {
        return new Promise<string>((resolve, reject) => {
          setTimeout(() => {
            if (value.length > 3) {
              resolve(value);
            } else {
              reject(`Level 1 failed: ${value}`);
            }
          }, 10);
        });
      };

      const validateLevel2 = (value: string): Promise<string> => {
        return new Promise<string>((resolve, reject) => {
          setTimeout(() => {
            if (value.includes('valid')) {
              resolve(value);
            } else {
              reject(`Level 2 failed: ${value}`);
            }
          }, 15);
        });
      };

      const validatePipeline = (value: string, initialDelay: number): Promise<string> => {
        return new Promise<string>((resolve) => {
          setTimeout(() => {
            resolve(validateLevel1(value)
              .then(validated => validateLevel2(validated)));
          }, initialDelay);
        });
      };

      const result = await Promise.any([
        validatePipeline("test", 30), // Will fail level 2
        validatePipeline("valid1", 40), // Will succeed
        validatePipeline("short", 20), // Will fail level 1
        validatePipeline("valid2", 50)// Will succeed later
      ]);

      expect(result).assertEqual("valid1");
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0760
     * @tc.name PromiseAnyTest076
     * @tc.desc Multi-layered promise resolution with cumulative delays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAnyTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const layer1: Promise<number> = new Promise<number>((resolve) =>
      setTimeout(() => resolve(1), 10)
      );

      const layer2: Promise<number> = layer1.then(num =>
      new Promise<number>((resolve) => setTimeout(() => resolve(num * 2), 15))
      );

      const layer3: Promise<number> = layer2.then(num =>
      new Promise<number>((resolve) => setTimeout(() => resolve(num + 3), 20))
      );

      const alternative1: Promise<number> = new Promise<number>((resolve) =>
      setTimeout(() => resolve(5), 30)
      );

      const alternative2: Promise<number> = new Promise<number>((resolve) =>
      setTimeout(() => resolve(6), 40)
      );

      const result = await Promise.any([layer3, alternative1, alternative2]);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0770
     * @tc.name PromiseAnyTest077
     * @tc.desc Timing race between nested async operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAnyTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const start = Date.now();
      let completionTimes: type90[] = [];

      const createNestedOp = (id: number, delays: number[]): Promise<number> => {
        return new Promise<number>(async (resolve) => {
          let currentDelay = 0;
          for (const delay of delays) {
            currentDelay += delay;
            await new Promise<void>((res) => setTimeout(res, delay));
          }
          completionTimes.push({ id, time: Date.now() - start });
          resolve(id);
        });
      };

      const result = await Promise.any([
        createNestedOp(1, [10, 20, 30]), // Total: 60ms
        createNestedOp(2, [15, 15, 20]), // Total: 50ms
        createNestedOp(3, [5, 25, 15])// Total: 45ms
      ]);

      expect(result).assertEqual(3);
      // Verify the order of completion
      expect(completionTimes[0].id).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0780
     * @tc.name PromiseAnyTest078
     * @tc.desc Cascading promises with alternating resolve/reject
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAnyTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const stepA: Promise<number> = new Promise<number>((resolve) =>
      setTimeout(() => resolve(10), 10)
      );

      const stepB: Promise<number> = stepA.then(num =>
      new Promise<number>((resolve, reject) =>
      setTimeout(() => reject(new Error('Failed at B')), 15)
      )
      ).catch(() => new Promise<number>((resolve) =>
      setTimeout(() => resolve(20), 10)
      ));

      const stepC: Promise<number> = stepB.then(num =>
      new Promise<number>((resolve) =>
      setTimeout(() => resolve(num + 5), 20)
      )
      );

      const alternative: Promise<number> = new Promise<number>((resolve) =>
      setTimeout(() => resolve(22), 40)
      );

      const result = await Promise.any([stepC, alternative]);
      expect(result).assertEqual(22);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0790
     * @tc.name PromiseAnyTest079
     * @tc.desc Async dependency chains with varying resolution paths
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAnyTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const dependencyX: Promise<string> = new Promise<string>((resolve) =>
      setTimeout(() => resolve("X"), 25)
      );

      const dependencyY: Promise<string> = new Promise<string>((resolve) =>
      setTimeout(() => resolve("Y"), 15)
      );

      const serviceA: Promise<string> = dependencyX.then(x =>
      new Promise<string>((resolve) =>
      setTimeout(() => resolve(`ServiceA:${x}`), 20)
      )
      );

      const serviceB: Promise<string> = dependencyY.then(y =>
      new Promise<string>((resolve) =>
      setTimeout(() => resolve(`ServiceB:${y}`), 30)
      )
      );

      const serviceC: Promise<string> = Promise.all([dependencyX, dependencyY])
        .then((res: string[]) => new Promise<string>((resolve) =>
        setTimeout(() => resolve(`ServiceC:${res[0]}${res[1]}`), 10)
        ));

      const result = await Promise.any([serviceA, serviceB, serviceC]);
      expect(result).assertEqual("ServiceC:XY");
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0800
     * @tc.name PromiseAnyTest080
     * @tc.desc Time-sensitive cascading operations with fallback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAnyTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const primaryOperation: Promise<number> = new Promise<number>((resolve) =>
      setTimeout(() => resolve(
        new Promise<number>((res) => setTimeout(() => res(
          new Promise<number>((r) => setTimeout(() => r(1), 50))
        ), 30))
      ), 20)
      );

      const fallback1: Promise<number> = new Promise<number>((resolve) =>
      setTimeout(() => resolve(2), 80)
      );

      const fallback2: Promise<number> = new Promise<number>((resolve) =>
      setTimeout(() => resolve(3), 60)
      );

      const result = await Promise.any([primaryOperation, fallback1, fallback2]);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0810
     * @tc.name PromiseAnyTest081
     * @tc.desc Multi-stage data processing with parallel branches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAnyTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const fetchData = (source: string, delay: number): Promise<string> => {
        return new Promise<string>((resolve) =>
        setTimeout(() => resolve(`Data from ${source}`), delay)
        );
      };

      const processData = (data: string, delay: number): Promise<string> => {
        return new Promise<string>((resolve) =>
        setTimeout(() => resolve(`Processed: ${data}`), delay)
        );
      };

      const pipeline1: Promise<string> = fetchData("API", 30)
        .then(data => processData(data, 25));

      const pipeline2: Promise<string> = fetchData("Cache", 15)
        .then(data => processData(data, 20));

      const pipeline3: Promise<string> = fetchData("Database", 20)
        .then(data => processData(data, 10));

      const result = await Promise.any([pipeline1, pipeline2, pipeline3]);
      expect(result).assertEqual("Processed: Data from Database");
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0820
     * @tc.name PromiseAnyTest082
     * @tc.desc Nested Promise.any within cascading operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAnyTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const innerAny1: Promise<number> = Promise.any([
        new Promise<number>((resolve) => setTimeout(() => resolve(1), 40)),
        new Promise<number>((resolve) => setTimeout(() => resolve(2), 20))
      ]);

      const innerAny2: Promise<number> = Promise.any([
        new Promise<number>((resolve) => setTimeout(() => resolve(3), 15)),
        new Promise<number>((resolve) => setTimeout(() => resolve(4), 30))
      ]);

      const outerPipeline: Promise<number> = innerAny1.then(num =>
      new Promise<number>((resolve) => setTimeout(() => resolve(num * 2), 10))
      );

      const result = await Promise.any([outerPipeline, innerAny2]);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0840
     * @tc.name PromiseAnyTest084
     * @tc.desc Sequential async operations with early termination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAnyTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const operations: Array<() => Promise<number>> = [
        () => new Promise<number>((resolve) => setTimeout(() => resolve(1), 100)),
        () => new Promise<number>((resolve) => setTimeout(() => resolve(2), 60)),
        () => new Promise<number>((resolve) => setTimeout(() => resolve(3), 80))
      ];

      const promises: Promise<number>[] = [];
      let lastStart = 0;

      // Start operations sequentially with small delays between them
      for (const op of operations) {
        const startDelay = Date.now() - lastStart;
        lastStart = Date.now();

        promises.push(new Promise<number>((resolve) => {
          setTimeout(() => {
            op().then(resolve);
          }, startDelay);
        }));

        await new Promise<void>((resolve) => setTimeout(resolve, 10));
      }

      const result = await Promise.any(promises);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0860
     * @tc.name PromiseAnyTest086
     * @tc.desc Timed cascading with progressive delays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAnyTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const createProgressiveCascade = (id: number, baseDelay: number): Promise<number> => {
        let current = Promise.resolve(id);

        // Create 3 stages with increasing delays
        for (let i = 1; i <= 3; i++) {
          current = current.then(val =>
          new Promise<number>((resolve) =>
          setTimeout(() => resolve(val), baseDelay * i)
          )
          );
        }

        return current;
      };

      const result = await Promise.any([
        createProgressiveCascade(1, 10), // Total: 10+20+30=60ms
        createProgressiveCascade(2, 8), // Total: 8+16+24=48ms
        createProgressiveCascade(3, 12)// Total: 12+24+36=72ms
      ]);

      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0870
     * @tc.name PromiseAnyTest087
     * @tc.desc Async retry mechanism race conditions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAnyTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const withRetry = async (id: number, initialDelay: number, retries: number): Promise<number> => {
        let delay = initialDelay;

        for (let i = 0; i <= retries; i++) {
          try {
            await new Promise<void>((resolve) => setTimeout(resolve, delay));
            // Succeed on last retry
            if (i === retries) {
              return id;
            }
            throw new Error(`Attempt ${i} failed`);
          } catch (e) {
            delay *= 2; // Exponential backoff
          }
        }

        throw new Error("All retries failed");
      };

      const result = await Promise.any([
        withRetry(1, 10, 2), // 10ms (fail) → 20ms (fail) → 40ms (success) → Total: 70ms
        withRetry(2, 5, 1), // 5ms (fail) → 10ms (success) → Total: 15ms
        withRetry(3, 15, 0)// 15ms (success) → Total: 15ms
      ]);

      // Either 2 or 3 could win - check for either valid result
      expect(result === 2 || result === 3).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0890
     * @tc.name PromiseAnyTest089
     * @tc.desc Cascading promises with conditional branching
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAnyTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const start: Promise<number> = new Promise<number>((resolve) =>
      setTimeout(() => resolve(10), 10)
      );

      const branchA: Promise<number> = start.then(num =>
      new Promise<number>((resolve) => {
        if (num > 5) {
          setTimeout(() => resolve(num * 2), 30);
        } else {
          setTimeout(() => resolve(num + 5), 20);
        }
      })
      );

      const branchB: Promise<number> = start.then(num =>
      new Promise<number>((resolve) => {
        if (num % 2 === 0) {
          setTimeout(() => resolve(num / 2), 15);
        } else {
          setTimeout(() => resolve(num - 3), 25);
        }
      })
      );

      const alternative: Promise<number> = new Promise<number>((resolve) =>
      setTimeout(() => resolve(7), 40)
      );

      const result = await Promise.any([branchA, branchB, alternative]);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_0900
     * @tc.name PromiseAnyTest090
     * @tc.desc Complex timing with overlapping async operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAnyTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const start = Date.now();
      const log: Array<type90> = [];

      // Create promises with overlapping timelines
      const p1: Promise<number> = new Promise<number>((resolve) => {
        setTimeout(() => {
          log.push({ id: 1, time: Date.now() - start });
          resolve(1);
        }, 50);
      });

      const p2: Promise<number> = new Promise<number>((resolve) => {
        setTimeout(() => {
          // Start a second timer from here
          setTimeout(() => {
            log.push({ id: 2, time: Date.now() - start });
            resolve(2);
          }, 20);
        }, 10);
      });

      const p3: Promise<number> = new Promise<number>((resolve) => {
        setTimeout(() => {
          log.push({ id: 3, time: Date.now() - start });
          resolve(3);
        }, 30);
      });

      const result = await Promise.any([p1, p2, p3]);
      expect(result == 2 || result == 3).assertEqual(true);
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
      const p1: Promise<number> = Promise.resolve(10);
      const p2: Promise<number> = Promise.reject(new Error('Failed'));
      const p3: Promise<number> = new Promise<number>(resolve =>
      setTimeout(() => resolve(20), 50)
      );

      const result = await Promise.any([p1, p2, p3]);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_092
     * @tc.name PromiseAnyTest092
     * @tc.desc Combine Promise.any with Promise.all in nested structure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAnyTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const p1: Promise<number> = Promise.all([
        Promise.resolve(1),
        new Promise<number>(resolve => setTimeout(() => resolve(2), 30))
      ]).then(values => values.reduce((a, b) => a + b, 0));

      const p2: Promise<number> = Promise.all([
        new Promise<number>(resolve => setTimeout(() => resolve(3), 10)),
        Promise.resolve(4)
      ]).then(values => values.reduce((a, b) => a + b, 0));

      const result = await Promise.any([p1, p2]);
      expect(result).assertEqual(7);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_093
     * @tc.name PromiseAnyTest093
     * @tc.desc Combine Promise.any with Promise.race in cascading calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAnyTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const race1: Promise<string> = Promise.race([
        new Promise<string>(resolve => setTimeout(() => resolve("race1-1"), 50)),
        new Promise<string>(resolve => setTimeout(() => resolve("race1-2"), 30))
      ]);

      const race2: Promise<string> = Promise.race([
        new Promise<string>(resolve => setTimeout(() => resolve("race2-1"), 20)),
        new Promise<string>(resolve => setTimeout(() => resolve("race2-2"), 40))
      ]);

      const result = await Promise.any([race1, race2]);
      expect(result).assertEqual("race2-1");
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_094
     * @tc.name PromiseAnyTest094
     * @tc.desc Combine Promise.any with Promise.allSettled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAnyTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const allSettled1: Promise<number> = Promise.allSettled([
        Promise.resolve(10),
        Promise.reject(new Error('Error')),
        new Promise<number>(resolve => setTimeout(() => resolve(20), 20))
      ]).then(results => {
        const values = results
          .filter(r => r.status === 'fulfilled')
          .map(r => (r as PromiseFulfilledResult<number>).value);
        return Math.max(...values);
      });

      const allSettled2: Promise<number> = Promise.allSettled([
        new Promise<number>(resolve => setTimeout(() => resolve(15), 10)),
        Promise.resolve(5)
      ]).then(results => {
        const values = results
          .filter(r => r.status === 'fulfilled')
          .map(r => (r as PromiseFulfilledResult<number>).value);
        return Math.max(...values);
      });

      const result = await Promise.any([allSettled1, allSettled2]);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_095
     * @tc.name PromiseAnyTest095
     * @tc.desc Nested Promise.any with mixed promise combinators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAnyTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const innerAny: Promise<number> = Promise.any([
        Promise.resolve(1),
        new Promise<number>(resolve => setTimeout(() => resolve(2), 20))
      ]);

      const innerAll: Promise<number> = Promise.all([
        new Promise<number>(resolve => setTimeout(() => resolve(3), 10)),
        new Promise<number>(resolve => setTimeout(() => resolve(4), 15))
      ]).then(values => values[0] + values[1]);

      const result = await Promise.any([
        innerAny.then(num => num * 10),
        innerAll.then(sum => sum + 5)
      ]);

      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_096
     * @tc.name PromiseAnyTest096
     * @tc.desc Combine Promise.any with async/await chains
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAnyTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const asyncChain1 = async (): Promise<string> => {
        const step1: number = await new Promise<number>(resolve =>
        setTimeout(() => resolve(10), 10)
        );
        const step2: number = await new Promise<number>(resolve =>
        setTimeout(() => resolve(step1 * 2), 20)
        );
        return `Result: ${step2}`;
      };

      const asyncChain2 = async (): Promise<string> => {
        const step1: number = await new Promise<number>(resolve =>
        setTimeout(() => resolve(15), 5)
        );
        const step2: number = await new Promise<number>(resolve =>
        setTimeout(() => resolve(step1 + 5), 15)
        );
        return `Result: ${step2}`;
      };

      const result = await Promise.any([asyncChain1(), asyncChain2()]);
      expect(result).assertEqual("Result: 20");
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_097
     * @tc.name PromiseAnyTest097
     * @tc.desc Combine Promise.any with conditional promise creation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAnyTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const createConditionalPromise = (shouldResolveFast: boolean): Promise<number> => {
        if (shouldResolveFast) {
          return new Promise<number>(resolve =>
          setTimeout(() => resolve(1), 10)
          );
        } else {
          return Promise.all([
            new Promise<number>(resolve => setTimeout(() => resolve(2), 20)),
            new Promise<number>(resolve => setTimeout(() => resolve(3), 30))
          ]).then((res: number[]) => res[0] + res[1]);
        }
      };

      const result = await Promise.any([
        createConditionalPromise(false),
        createConditionalPromise(true),
        Promise.reject(new Error('Not used'))
      ]);

      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_099
     * @tc.name PromiseAnyTest099
     * @tc.desc Complex combination with Promise.any, all and race
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('PromiseAnyTest099', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL4, async () => {
      // Layer 1: Create individual promises
      const p1: Promise<number> = new Promise<number>(resolve => setTimeout(() => resolve(1), 10));
      const p2: Promise<number> = new Promise<number>(resolve => setTimeout(() => resolve(2), 20));
      const p3: Promise<number> = new Promise<number>((_, reject) => setTimeout(() => reject(), 15));

      // Layer 2: Combine with Promise.all
      const all1: Promise<number> = Promise.all([p1, p2]).then(v => v[0] + v[1]);

      // Layer 2: Combine with Promise.race
      const race1: Promise<number> = Promise.race([p2, p3]);

      // Layer 3: Combine with Promise.any
      const any1: Promise<number> = Promise.any([all1, race1]);

      // Alternative path
      const alt1: Promise<number> = new Promise<number>(resolve => setTimeout(() => resolve(5), 30));

      // Final combination
      const result = await Promise.any([any1, alt1]);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_Promise_any_TEST_100
     * @tc.name PromiseAnyTest100
     * @tc.desc Promise.any with mixed combinators and error handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('PromiseAnyTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const combine1: Promise<string> = Promise.all([
        Promise.resolve("a"),
        new Promise<string>(resolve => setTimeout(() => resolve("b"), 20))
      ]).then((res: string[]) => res[0] + res[1])
        .catch(() => "fallback1");

      const combine2: Promise<string> = Promise.race([
        new Promise<string>((_, reject) => setTimeout(() => reject(), 10)),
        new Promise<string>(resolve => setTimeout(() => resolve("c"), 15))
      ]).catch(() => "fallback2");

      const result = await Promise.any([combine1, combine2]);
      expect(result).assertEqual("fallback2");
    });
    
  })
}