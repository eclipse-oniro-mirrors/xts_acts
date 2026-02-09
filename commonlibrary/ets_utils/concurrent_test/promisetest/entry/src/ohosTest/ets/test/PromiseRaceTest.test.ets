/*
 * Copyright (C) 2025 HiHope Open Source Organization.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { sleep, TestObject, ThrowingIterable, createIterableArray, PromiseFulfilledResult, PromiseRejectedResult, PromiseSettledResult, simulateRaceSettled } from '../testability/pages/TestUtils';


export default function PromiseRaceTest() {
  describe('PromiseRaceTest', () => {
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
      console.info('PromiseRaceTest beforeAll called');
    })

    beforeEach(async () => {
      await sleep(200);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      // Add delay to ensure resources from the previous test case are released
      console.info('PromiseRaceTest beforeEach called');
    })

    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
      console.info('PromiseRaceTest afterEach called');
    })

    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
      console.info('PromiseRaceTest afterAll called');
    })

    /**
     * @tc.name   PromiseRaceTest0100
     * @tc.number SUB_PROMISE_RACE_TEST_0100
     * @tc.desc   Test Promise.race with different types in iterable array (string|number|boolean|bigint|object|promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRaceTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseRaceTest0100';
      console.info(`${caseName} test start`);

      try {
        console.info(`${caseName} Testing string type`);
        const stringPromise = Promise.resolve('test string');
        const stringResult = await Promise.race([stringPromise]);
        expect(typeof stringResult).assertEqual('string');
        expect(stringResult).assertEqual('test string');

        console.info(`${caseName} Testing number type`);
        const numberPromise = Promise.resolve(42);
        const numberResult = await Promise.race([numberPromise]);
        expect(typeof numberResult).assertEqual('number');
        expect(numberResult).assertEqual(42);

        console.info(`${caseName} Testing boolean type`);
        const booleanPromise = Promise.resolve(true);
        const booleanResult = await Promise.race([booleanPromise]);
        expect(typeof booleanResult).assertEqual('boolean');
        expect(booleanResult).assertEqual(true);

        console.info(`${caseName} Testing bigint type`);
        const bigintValue = BigInt(9007199254740991);
        const bigintPromise = Promise.resolve(bigintValue);
        const bigintResult = await Promise.race([bigintPromise]);
        expect(typeof bigintResult).assertEqual('bigint');
        expect(bigintResult).assertEqual(bigintValue);

        console.info(`${caseName} Testing object type`);
        const testObject: TestObject = { name: 'test', value: 42 };
        const objectPromise = Promise.resolve(testObject);
        const objectResult = await Promise.race([objectPromise]);
        expect(typeof objectResult).assertEqual('object');
        expect(objectResult).assertEqual(testObject);
        expect(objectResult.name).assertEqual('test');
        expect(objectResult.value).assertEqual(42);

        console.info(`${caseName} Testing promise racing`);
        const executionOrder: string[] = [];
        
        const p1 = new Promise<string>(resolve => {
          executionOrder.push('p1 scheduling');
          setTimeout(() => {
            executionOrder.push('p1 resolving');
            resolve('p1 result');
          }, 50);
        });
        
        const p2 = new Promise<string>(resolve => {
          executionOrder.push('p2 scheduling');
          setTimeout(() => {
            executionOrder.push('p2 resolving');
            resolve('p2 result');
          }, 100);
        });

        executionOrder.push('race start');
        const raceResult = await Promise.race([p1, p2]);
        executionOrder.push('race resolved');
        
        await sleep(100);
        
        expect(raceResult).assertEqual('p1 result');
        
        const expectedOrder = [
          'p1 scheduling',
          'p2 scheduling',
          'race start',
          'p1 resolving',
          'race resolved',
          'p2 resolving'
        ];
        expect(JSON.stringify(executionOrder)).assertEqual(JSON.stringify(expectedOrder));
      } catch (error) {
        console.error(`${caseName} Test failed with error: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseRaceTest0200
     * @tc.number SUB_PROMISE_RACE_TEST_0200
     * @tc.desc   Test Promise.race with combinations of different types in iterable array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRaceTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseRaceTest0200';
      console.info(`${caseName} test start`);

      try {
        console.info(`${caseName} Testing string and number combination`);
        const stringPromise = Promise.resolve('string value');
        const numberPromise = Promise.resolve(42);
        const result1 = await Promise.race([stringPromise, numberPromise]);
        expect(result1).assertEqual('string value');

        console.info(`${caseName} Testing boolean and object combination`);
        const testObject: TestObject = { name: 'test', value: 100 };
        const objectPromise = new Promise<TestObject>(resolve => {
          setTimeout(() => resolve(testObject), 50);
        });
        const booleanPromise = Promise.resolve(true);
        const result2 = await Promise.race([objectPromise, booleanPromise]);
        expect(result2).assertEqual(true);

        console.info(`${caseName} Testing bigint and non-promise combination`);
        const bigintValue = BigInt(9007199254740991);
        const bigintPromise = new Promise<bigint>(resolve => {
          setTimeout(() => resolve(bigintValue), 10);
        });
        const nonPromise = 'immediate non-promise';
        const result3 = await Promise.race([bigintPromise, nonPromise]);
        expect(result3).assertEqual('immediate non-promise');

        console.info(`${caseName} Testing resolved and rejected promise combination`);
        const resolvedPromise = Promise.resolve('resolved value');
        const rejectedPromise = Promise.reject(new Error('rejected error'));
        const result4 = await Promise.race([resolvedPromise, rejectedPromise]);
        expect(result4).assertEqual('resolved value');

        console.info(`${caseName} Testing delayed resolved promises combination`);
        const fastPromise = new Promise<string>(resolve => {
          setTimeout(() => resolve('fast'), 20);
        });
        const slowPromise = new Promise<string>(resolve => {
          setTimeout(() => resolve('slow'), 80);
        });
        const result5 = await Promise.race([fastPromise, slowPromise]);
        expect(result5).assertEqual('fast');
      } catch (error) {
        console.error(`${caseName} Test failed with error: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseRaceTest0300
     * @tc.number SUB_PROMISE_RACE_TEST_0300
     * @tc.desc   Test Promise.race with different types of iterables
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRaceTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseRaceTest0300';
      console.info(`${caseName} test start`);

      try {
        console.info(`${caseName} Testing with array iterable`);
        const arrayResult = await Promise.race([Promise.resolve('array value')]);
        expect(arrayResult).assertEqual('array value');

        console.info(`${caseName} Testing with Set iterable`);
        const promiseSet = new Set<Promise<string>>();
        promiseSet.add(Promise.resolve('set value'));
        const setResult = await Promise.race(promiseSet);
        expect(setResult).assertEqual('set value');

        console.info(`${caseName} Testing with Map iterable`);
        const promiseMap = new Map<string, Promise<string>>();
        promiseMap.set('key', Promise.resolve('map value'));
        const mapPromises = Array.from(promiseMap.values());
        const mapResult = await Promise.race(mapPromises);
        expect(mapResult).assertEqual('map value');

        console.info(`${caseName} Testing with array-like iterable`);
        const customIterable = createIterableArray([Promise.resolve('custom iterable value')]);
        const iterableResult = await Promise.race(customIterable);
        expect(iterableResult).assertEqual('custom iterable value');
      } catch (error) {
        console.error(`${caseName} Test failed with error: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseRaceTest0400
     * @tc.number SUB_PROMISE_RACE_TEST_0400
     * @tc.desc   Test Promise.race with empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRaceTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseRaceTest0400';
      console.info(`${caseName} test start`);

      try {
        console.info(`${caseName} Testing with empty array`);
        let emptyResolved = false;
        const emptyPromise = Promise.race([]);
        
        setTimeout(() => {
          if (!emptyResolved) {
            console.info(`${caseName} Empty race is still pending as expected`);
            done();
          }
        }, 500);
        
        try {
          await Promise.race<void>([
            emptyPromise,
            new Promise<void>((_, reject) => setTimeout(() => reject(new Error('Timeout')), 100))
          ]);
          emptyResolved = true;
          console.error(`${caseName} Empty race unexpectedly resolved`);
          expect(false).assertTrue();
        } catch (error) {
          expect(error.message).assertEqual('Timeout');
        }
      } catch (error) {
        console.error(`${caseName} Test failed with error: ${error}`);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   PromiseRaceTest0500
     * @tc.number SUB_PROMISE_RACE_TEST_0500
     * @tc.desc   Test Promise.race with non-Promise values in iterable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRaceTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseRaceTest0500';
      console.info(`${caseName} test start`);

      try {
        console.info(`${caseName} Testing with string non-Promise`);
        const stringValue = 'immediate string';
        const stringResult = await Promise.race([stringValue, Promise.resolve('delayed string')]);
        expect(stringResult).assertEqual('immediate string');

        console.info(`${caseName} Testing with number non-Promise`);
        const numberValue = 42;
        const numberResult = await Promise.race([
          new Promise<number>(resolve => setTimeout(() => resolve(100), 50)),
          numberValue
        ]);
        expect(numberResult).assertEqual(42);

        console.info(`${caseName} Testing with boolean non-Promise`);
        const booleanValue = true;
        const booleanResult = await Promise.race([booleanValue, Promise.resolve(false)]);
        expect(booleanResult).assertEqual(true);

        console.info(`${caseName} Testing with object non-Promise`);
        const objectValue: TestObject = { name: 'immediate', value: 42 };
        const delayedObject: TestObject = { name: 'delayed', value: 100 };
        const objectResult = await Promise.race([
          new Promise<TestObject>(resolve => setTimeout(() => resolve(delayedObject), 50)),
          objectValue
        ]);
        expect(objectResult).assertEqual(objectValue);
        expect(objectResult.name).assertEqual('immediate');
      } catch (error) {
        console.error(`${caseName} Test failed with error: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseRaceTest0600
     * @tc.number SUB_PROMISE_RACE_TEST_0600
     * @tc.desc   Test Promise.race with an iterable that throws an exception. Input: A throwing iterator.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRaceTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseRaceTest0600';
      console.info(`${caseName} test start`);

      try {
        console.info(`${caseName} Testing with iterable that throws during iteration`);
        const throwingIterable = new ThrowingIterable('Iterable error');

        try {
          await Promise.race<string>(throwingIterable);
          console.error(`${caseName} Promise.race unexpectedly succeeded with throwing iterable`);
          expect(false).assertTrue();
        } catch (error) {
          expect(error.message).assertEqual('Iterable error');
        }

        console.info(`${caseName} Test completed successfully`);
      } catch (error) {
        console.error(`${caseName} Test failed with error: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseRaceTest0700
     * @tc.number SUB_PROMISE_RACE_TEST_0700
     * @tc.desc   Test Promise.race with multiple promises where one succeeds. Input: Three promises, first one resolves, second one rejects, third one resolves.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRaceTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseRaceTest0700';
      console.info(`${caseName} test start`);

      try {
        const executionOrder: string[] = [];
        
        const p1 = new Promise<string>((resolve) => {
          executionOrder.push('p1 created');
          setTimeout(() => {
            executionOrder.push('p1 resolving');
            resolve('p1 result');
          }, 50);
        });
        
        const p2 = new Promise<string>((_, reject) => {
          executionOrder.push('p2 created');
          setTimeout(() => {
            executionOrder.push('p2 rejecting');
            reject(new Error('p2 error'));
          }, 100);
        });
        
        const p3 = new Promise<string>((resolve) => {
          executionOrder.push('p3 created');
          setTimeout(() => {
            executionOrder.push('p3 resolving');
            resolve('p3 result');
          }, 150);
        });

        executionOrder.push('race start');
        const result = await Promise.race<string>([p1, p2, p3]);
        executionOrder.push('race resolved');
        
        await sleep(200);
        executionOrder.push('after wait');
        
        expect(result).assertEqual('p1 result');
        
        const expectedOrder = [
          'p1 created',
          'p2 created',
          'p3 created',
          'race start',
          'p1 resolving',
          'race resolved',
          'p2 rejecting',
          'p3 resolving',
          'after wait'
        ];
        
        expect(JSON.stringify(executionOrder)).assertEqual(JSON.stringify(expectedOrder));
        
      } catch (error) {
        console.error(`${caseName} Test failed with error: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseRaceTest0800
     * @tc.number SUB_PROMISE_RACE_TEST_0800
     * @tc.desc   Test Promise.race where all promises fail. Input: Three promises, all of them fail.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRaceTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseRaceTest0800';
      console.info(`${caseName} test start`);

      try {
        const executionOrder: string[] = [];
        
        const p1 = new Promise<string>((_, reject) => {
          executionOrder.push('p1 created');
          setTimeout(() => {
            executionOrder.push('p1 rejecting');
            reject(new Error('p1 error'));
          }, 100);
        });
        
        const p2 = new Promise<string>((_, reject) => {
          executionOrder.push('p2 created');
          setTimeout(() => {
            executionOrder.push('p2 rejecting');
            reject(new Error('p2 error'));
          }, 50);
        });
        
        const p3 = new Promise<string>((_, reject) => {
          executionOrder.push('p3 created');
          setTimeout(() => {
            executionOrder.push('p3 rejecting');
            reject(new Error('p3 error'));
          }, 150);
        });

        executionOrder.push('race start');
        
        try {
          await Promise.race<string>([p1, p2, p3]);
          executionOrder.push('race unexpectedly resolved');
          expect(false).assertTrue();
        } catch (error) {
          executionOrder.push('race rejected');
          expect(error.message).assertEqual('p2 error');
        }
        
        await sleep(200);
        executionOrder.push('after wait');
        
        const expectedOrder = [
          'p1 created',
          'p2 created',
          'p3 created',
          'race start',
          'p2 rejecting',
          'race rejected',
          'p1 rejecting',
          'p3 rejecting',
          'after wait'
        ];
        
        expect(JSON.stringify(executionOrder)).assertEqual(JSON.stringify(expectedOrder));
        
      } catch (error) {
        console.error(`${caseName} Test failed with error: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseRaceTest0900
     * @tc.number SUB_PROMISE_RACE_TEST_0900
     * @tc.desc   Test Promise.race where a promise throws during construction. Input: One promise throws error during construction, another one is normal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRaceTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseRaceTest0900';
      console.info(`${caseName} test start`);

      try {
        const executionOrder: string[] = [];
        
        const throwError = (): Promise<string> => {
          executionOrder.push('throwError function called');
          throw new Error('Construction error');
        };
        
        const p1 = new Promise<string>((resolve) => {
          executionOrder.push('p1 created');
          setTimeout(() => {
            executionOrder.push('p1 resolving');
            resolve('p1 result');
          }, 100);
        });
        
        executionOrder.push('before try-catch block');
        
        try {
          executionOrder.push('race start');
          let errorThrown = false;
          
          try {
            const race = Promise.race<string>([throwError(), p1]);
            executionOrder.push('Promise.race call completed');
            await race;
          } catch (error) {
            errorThrown = true;
            executionOrder.push('race rejected');
            expect(error.message).assertEqual('Construction error');
          }
          
          expect(errorThrown).assertTrue();
          
        } catch (error) {
          executionOrder.push('outer catch called');
          console.error(`Unexpected error: ${error.message}`);
          expect(false).assertTrue();
        }
        
        await sleep(150);
        executionOrder.push('after wait');
        
        const expectedOrder = [
          'before try-catch block',
          'race start',
          'throwError function called',
          'race rejected',
          'p1 created',
          'p1 resolving',
          'after wait'
        ];
        
        expectedOrder.forEach(event => {
          expect(executionOrder.includes(event)).assertTrue();
        });
        
      } catch (error) {
        console.error(`${caseName} Test failed with error: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseRaceTest1000
     * @tc.number SUB_PROMISE_RACE_TEST_1000
     * @tc.desc   Test Promise.race with a promise that's already resolved. Input: One promise that is immediately resolved.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRaceTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseRaceTest1000';
      console.info(`${caseName} test start`);

      try {
        const executionOrder: string[] = [];
        
        const p1 = Promise.resolve('immediate result');
        executionOrder.push('p1 created (resolved)');
        
        const p2 = new Promise<string>((resolve) => {
          executionOrder.push('p2 created');
          setTimeout(() => {
            executionOrder.push('p2 resolving');
            resolve('p2 result');
          }, 50);
        });
        
        executionOrder.push('race start');
        const result = await Promise.race<string>([p1, p2]);
        executionOrder.push('race resolved');
        
        await sleep(100);
        executionOrder.push('after wait');
        
        expect(result).assertEqual('immediate result');
        
        const expectedOrder = [
          'p1 created (resolved)',
          'p2 created',
          'race start',
          'race resolved',
          'p2 resolving',
          'after wait'
        ];
        
        expect(JSON.stringify(executionOrder)).assertEqual(JSON.stringify(expectedOrder));
        
      } catch (error) {
        console.error(`${caseName} Test failed with error: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseRaceTest1100
     * @tc.number SUB_PROMISE_RACE_TEST_1100
     * @tc.desc   Test Promise.race with one immediately resolved and one immediately rejected promise. Input: One promise immediately resolved, one promise immediately rejected.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRaceTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseRaceTest1100';
      console.info(`${caseName} test start`);

      try {
        const executionOrder: string[] = [];
        
        const p1 = Promise.resolve('immediate resolved result');
        executionOrder.push('p1 created (resolved)');
        
        const p2 = Promise.reject(new Error('immediate rejection'));
        executionOrder.push('p2 created (rejected)');
        
        p2.catch(() => {
          executionOrder.push('p2 catch handler');
        });
        
        executionOrder.push('race start');
        const result = await Promise.race<string>([p1, p2]);
        executionOrder.push('race resolved');
        
        await sleep(50);
        executionOrder.push('after wait');
        
        expect(result).assertEqual('immediate resolved result');
        
        expect(executionOrder.includes('p1 created (resolved)')).assertTrue();
        expect(executionOrder.includes('p2 created (rejected)')).assertTrue();
        expect(executionOrder.includes('race start')).assertTrue();
        expect(executionOrder.includes('race resolved')).assertTrue();
        expect(executionOrder.includes('p2 catch handler')).assertTrue();
        expect(executionOrder.includes('after wait')).assertTrue();
        
      } catch (error) {
        console.error(`${caseName} Test failed with error: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseRaceTest1200
     * @tc.number SUB_PROMISE_RACE_TEST_1200
     * @tc.desc   Test Promise.race with an immediately rejected promise. Input: One promise that is immediately rejected.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRaceTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseRaceTest1200';
      console.info(`${caseName} test start`);

      try {
        const executionOrder: string[] = [];
        
        const p1 = Promise.reject(new Error('immediate rejection'));
        executionOrder.push('p1 created (rejected)');
        
        p1.catch(() => {
          executionOrder.push('p1 catch handler');
        });
        
        const p2 = new Promise<string>((resolve) => {
          executionOrder.push('p2 created');
          setTimeout(() => {
            executionOrder.push('p2 resolving');
            resolve('p2 result');
          }, 50);
        });
        
        executionOrder.push('race start');
        
        try {
          await Promise.race<string>([p1, p2]);
          executionOrder.push('race unexpectedly resolved');
          expect(false).assertTrue();
        } catch (error) {
          executionOrder.push('race rejected');
          expect(error.message).assertEqual('immediate rejection');
        }
        
        await sleep(100);
        executionOrder.push('after wait');
        
        const expectedOrder = [
          'p1 created (rejected)',
          'p2 created',
          'race start',
          'race rejected',
          'p1 catch handler',
          'p2 resolving',
          'after wait'
        ];
        
        expectedOrder.forEach(event => {
          expect(executionOrder.includes(event)).assertTrue();
        });
        
        const raceRejectedIndex = executionOrder.indexOf('race rejected');
        const p2ResolvingIndex = executionOrder.indexOf('p2 resolving');
        expect(raceRejectedIndex).assertLess(p2ResolvingIndex);
        
      } catch (error) {
        console.error(`${caseName} Test failed with error: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseRaceTest1300
     * @tc.number SUB_PROMISE_RACE_TEST_1300
     * @tc.desc   Test Promise.race where all promises succeed. Input: Three promises that all resolve successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRaceTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseRaceTest1300';
      console.info(`${caseName} test start`);

      try {
        const executionOrder: string[] = [];
        
        const p1 = new Promise<string>(resolve => {
          executionOrder.push('p1 created');
          setTimeout(() => {
            executionOrder.push('p1 resolving');
            resolve('p1 result');
          }, 100);
        });
        
        const p2 = new Promise<string>(resolve => {
          executionOrder.push('p2 created');
          setTimeout(() => {
            executionOrder.push('p2 resolving');
            resolve('p2 result');
          }, 50);
        });
        
        const p3 = new Promise<string>(resolve => {
          executionOrder.push('p3 created');
          setTimeout(() => {
            executionOrder.push('p3 resolving');
            resolve('p3 result');
          }, 150);
        });
        
        executionOrder.push('race start');
        const result = await Promise.race<string>([p1, p2, p3]);
        executionOrder.push('race resolved');
        
        await sleep(200);
        executionOrder.push('after wait');
        
        expect(result).assertEqual('p2 result');
        
        const expectedOrder = [
          'p1 created',
          'p2 created',
          'p3 created',
          'race start',
          'p2 resolving',
          'race resolved',
          'p1 resolving',
          'p3 resolving',
          'after wait'
        ];
        
        expect(JSON.stringify(executionOrder)).assertEqual(JSON.stringify(expectedOrder));
        
      } catch (error) {
        console.error(`${caseName} Test failed with error: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseRaceTest1400
     * @tc.number SUB_PROMISE_RACE_TEST_1400
     * @tc.desc   Test Promise.race with delayed promises. Input: Two promises, first one resolves after 2 seconds, second one rejects after 1 second.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRaceTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseRaceTest1400';
      console.info(`${caseName} test start`);

      try {
        const executionOrder: string[] = [];
        const longDelay = 2000;
        const shortDelay = 1000;
        
        const p1 = new Promise<string>(resolve => {
          executionOrder.push('p1 created');
          setTimeout(() => {
            executionOrder.push('p1 resolving');
            resolve('p1 result');
          }, longDelay);
        });
        
        const p2 = new Promise<string>((_, reject) => {
          executionOrder.push('p2 created');
          setTimeout(() => {
            executionOrder.push('p2 rejecting');
            reject(new Error('p2 error'));
          }, shortDelay);
        });
        
        executionOrder.push('race start');
        
        try {
          await Promise.race<string>([p1, p2]);
          executionOrder.push('race unexpectedly resolved');
          expect(false).assertTrue();
        } catch (error) {
          executionOrder.push('race rejected');
          expect(error.message).assertEqual('p2 error');
        }
        
        await sleep(longDelay + 100);
        executionOrder.push('after wait');
        
        const expectedOrder = [
          'p1 created',
          'p2 created',
          'race start',
          'p2 rejecting',
          'race rejected',
          'p1 resolving',
          'after wait'
        ];
        
        expect(JSON.stringify(executionOrder)).assertEqual(JSON.stringify(expectedOrder));
        
      } catch (error) {
        console.error(`${caseName} Test failed with error: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseRaceTest1500
     * @tc.number SUB_PROMISE_RACE_TEST_1500
     * @tc.desc   Test Promise.race with delayed promises. Input: Two promises, first one resolves after 1 second, second one rejects after 2 seconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRaceTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseRaceTest1500';
      console.info(`${caseName} test start`);

      try {
        const executionOrder: string[] = [];
        const longDelay = 2000;
        const shortDelay = 1000;
        
        const p1 = new Promise<string>(resolve => {
          executionOrder.push('p1 created');
          setTimeout(() => {
            executionOrder.push('p1 resolving');
            resolve('p1 result');
          }, shortDelay);
        });
        
        const p2 = new Promise<string>((_, reject) => {
          executionOrder.push('p2 created');
          setTimeout(() => {
            executionOrder.push('p2 rejecting');
            reject(new Error('p2 error'));
          }, longDelay);
        });
        
        executionOrder.push('race start');
        const result = await Promise.race<string>([p1, p2]);
        executionOrder.push('race resolved');
        
        await sleep(longDelay + 100);
        executionOrder.push('after wait');
        
        expect(result).assertEqual('p1 result');
        
        const expectedOrder = [
          'p1 created',
          'p2 created',
          'race start',
          'p1 resolving',
          'race resolved',
          'p2 rejecting',
          'after wait'
        ];
        
        expect(JSON.stringify(executionOrder)).assertEqual(JSON.stringify(expectedOrder));
        
      } catch (error) {
        console.error(`${caseName} Test failed with error: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseRaceTest1600
     * @tc.number SUB_PROMISE_RACE_TEST_1600
     * @tc.desc   Test Promise.race with different types of objects. Input: One primitive value, one iterable object, one throwing iterable object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRaceTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseRaceTest1600';
      console.info(`${caseName} test start`);

      try {
        const executionOrder: string[] = [];
        
        const primitiveValue = 'immediate primitive';
        
        const p1 = new Promise<string>(resolve => {
          executionOrder.push('promise in iterable created');
          setTimeout(() => {
            executionOrder.push('promise in iterable resolving');
            resolve('iterable promise result');
          }, 50);
        });
        
        const iterableArray = [p1];
        
        executionOrder.push('race with primitive and iterable start');
        const result1 = await Promise.race<string>([primitiveValue, ...iterableArray]);
        executionOrder.push('race with primitive and iterable resolved');
        
        expect(result1).assertEqual('immediate primitive');
        
        await sleep(100);
        executionOrder.push('after first race');
        
        executionOrder.push('preparing throwing scenario');
        let throwingCalled = false;
        
        const throwingPromise = new Promise<string>((_resolve, _reject) => {
          executionOrder.push('throwing scenario created');
          if (!throwingCalled) {
            throwingCalled = true;
            executionOrder.push('throwing scenario executed');
            throw new Error('Throwing iterable error');
          }
        });
        
        executionOrder.push('race with throwing scenario start');
        
        try {
          const delayedPromise = new Promise<string>(resolve => {
            setTimeout(() => resolve('delayed promise'), 50);
          });
          
          await Promise.race<string>([throwingPromise, delayedPromise]);
          executionOrder.push('race with throwing scenario unexpectedly resolved');
          expect(false).assertTrue();
        } catch (error) {
          executionOrder.push('race with throwing scenario rejected');
          expect(error.message).assertEqual('Throwing iterable error');
        }
        
        await sleep(100);
        executionOrder.push('after second race');
        
        const expectedEvents = [
          'promise in iterable created',
          'race with primitive and iterable start',
          'race with primitive and iterable resolved',
          'promise in iterable resolving',
          'after first race',
          'preparing throwing scenario',
          'throwing scenario created',
          'throwing scenario executed',
          'race with throwing scenario rejected',
          'after second race'
        ];
        
        expectedEvents.forEach(event => {
          expect(executionOrder.includes(event)).assertTrue();
        });
        
      } catch (error) {
        console.error(`${caseName} Test failed with error: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseRaceTest1700
     * @tc.number SUB_PROMISE_RACE_TEST_1700
     * @tc.desc   Test nested Promise.any(). Input: Promise.any([Promise.any([resolved promise, rejected promise]), rejected promise])
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRaceTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseRaceTest1700';
      console.info(`${caseName} test start`);

      try {
        const executionOrder: string[] = [];
        
        const p1 = new Promise<string>(resolve => {
          executionOrder.push('p1 created');
          setTimeout(() => {
            executionOrder.push('p1 resolving');
            resolve('p1 result');
          }, 50);
        });
        
        const p2 = new Promise<string>((_, reject) => {
          executionOrder.push('p2 created');
          setTimeout(() => {
            executionOrder.push('p2 rejecting');
            reject(new Error('p2 error'));
          }, 100);
        });
        
        const p3 = new Promise<string>((_, reject) => {
          executionOrder.push('p3 created');
          setTimeout(() => {
            executionOrder.push('p3 rejecting');
            reject(new Error('p3 error'));
          }, 150);
        });
        
        executionOrder.push('inner any start');
        const innerAny = Promise.any<string>([p1, p2]);
        
        executionOrder.push('outer any start');
        const result = await Promise.any<string>([innerAny, p3]);
        executionOrder.push('outer any resolved');
        
        await sleep(200);
        executionOrder.push('after wait');
        
        expect(result).assertEqual('p1 result');
        
        const expectedEvents = [
          'p1 created',
          'p2 created',
          'p3 created',
          'inner any start',
          'outer any start',
          'p1 resolving',
          'outer any resolved',
          'p2 rejecting',
          'p3 rejecting',
          'after wait'
        ];
        
        expectedEvents.forEach(event => {
          expect(executionOrder.includes(event)).assertTrue();
        });
        
        const p1ResolvingIndex = executionOrder.indexOf('p1 resolving');
        const outerAnyResolvedIndex = executionOrder.indexOf('outer any resolved');
        expect(p1ResolvingIndex).assertLess(outerAnyResolvedIndex);
        
      } catch (error) {
        console.error(`${caseName} Test failed with error: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseRaceTest1800
     * @tc.number SUB_PROMISE_RACE_TEST_1800
     * @tc.desc   Test nested Promise.any() with all rejected promises. Input: Promise.any([Promise.any([rejected promise, rejected promise]), rejected promise])
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRaceTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseRaceTest1800';
      console.info(`${caseName} test start`);

      try {
        const executionOrder: string[] = [];
        
        const p1 = new Promise<string>((_, reject) => {
          executionOrder.push('p1 created');
          setTimeout(() => {
            executionOrder.push('p1 rejecting');
            reject(new Error('p1 error'));
          }, 50);
        });
        
        const p2 = new Promise<string>((_, reject) => {
          executionOrder.push('p2 created');
          setTimeout(() => {
            executionOrder.push('p2 rejecting');
            reject(new Error('p2 error'));
          }, 100);
        });
        
        const p3 = new Promise<string>((_, reject) => {
          executionOrder.push('p3 created');
          setTimeout(() => {
            executionOrder.push('p3 rejecting');
            reject(new Error('p3 error'));
          }, 150);
        });
        
        executionOrder.push('inner any start');
        const innerAny = Promise.any<string>([p1, p2]);
        
        executionOrder.push('outer any start');
        
        try {
          await Promise.any<string>([innerAny, p3]);
          executionOrder.push('outer any unexpectedly resolved');
          expect(false).assertTrue();
        } catch (error) {
          executionOrder.push('outer any rejected');
          expect(error instanceof AggregateError).assertTrue();
          expect(error.errors.length).assertEqual(2);
        }
        
        await sleep(200);
        executionOrder.push('after wait');
        
        const expectedEvents = [
          'p1 created',
          'p2 created',
          'p3 created',
          'inner any start',
          'outer any start',
          'p1 rejecting',
          'p2 rejecting',
          'p3 rejecting',
          'outer any rejected',
          'after wait'
        ];
        
        expectedEvents.forEach(event => {
          expect(executionOrder.includes(event)).assertTrue();
        });
        
        const p1RejectingIndex = executionOrder.indexOf('p1 rejecting');
        const p2RejectingIndex = executionOrder.indexOf('p2 rejecting');
        const p3RejectingIndex = executionOrder.indexOf('p3 rejecting');
        const outerAnyRejectedIndex = executionOrder.indexOf('outer any rejected');
        
        expect(p1RejectingIndex).assertLess(outerAnyRejectedIndex);
        expect(p2RejectingIndex).assertLess(outerAnyRejectedIndex);
        expect(p3RejectingIndex).assertLess(outerAnyRejectedIndex);
        
      } catch (error) {
        console.error(`${caseName} Test failed with error: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseRaceTest1900
     * @tc.number SUB_PROMISE_RACE_TEST_1900
     * @tc.desc   Test nested Promise.race() with Promise.any(). Input: Promise.any([Promise.race([resolved promise, rejected promise]), resolved promise])
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRaceTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseRaceTest1900';
      console.info(`${caseName} test start`);

      try {
        const executionOrder: string[] = [];
        
        const p1 = new Promise<string>(resolve => {
          executionOrder.push('p1 created');
          setTimeout(() => {
            executionOrder.push('p1 resolving');
            resolve('p1 result');
          }, 50);
        });
        
        const p2 = new Promise<string>((_, reject) => {
          executionOrder.push('p2 created');
          setTimeout(() => {
            executionOrder.push('p2 rejecting');
            reject(new Error('p2 error'));
          }, 100);
        });
        
        const p3 = new Promise<string>((resolve) => {
          executionOrder.push('p3 created');
          setTimeout(() => {
            executionOrder.push('p3 resolving');
            resolve('p3 result');
          }, 150);
        });
        
        executionOrder.push('inner race start');
        const innerRace = Promise.race<string>([p1, p2]);
        
        executionOrder.push('outer any start');
        const result = await Promise.any<string>([innerRace, p3]);
        executionOrder.push('outer any resolved');
        
        await sleep(200);
        executionOrder.push('after wait');
        
        expect(result).assertEqual('p1 result');
        
        const expectedEvents = [
          'p1 created',
          'p2 created',
          'p3 created',
          'inner race start',
          'outer any start',
          'p1 resolving',
          'outer any resolved',
          'p2 rejecting',
          'p3 resolving',
          'after wait'
        ];
        
        expectedEvents.forEach(event => {
          expect(executionOrder.includes(event)).assertTrue();
        });
        
        const p1ResolvingIndex = executionOrder.indexOf('p1 resolving');
        const outerAnyResolvedIndex = executionOrder.indexOf('outer any resolved');
        expect(p1ResolvingIndex).assertLess(outerAnyResolvedIndex);
        
      } catch (error) {
        console.error(`${caseName} Test failed with error: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseRaceTest2000
     * @tc.number SUB_PROMISE_RACE_TEST_2000
     * @tc.desc   Test nested Promise.any() with inner fast-resolving Promise. Input: Promise.any([Promise.any([fast-resolved promise, rejected promise]), slow-rejected promise])
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRaceTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseRaceTest2000';
      console.info(`${caseName} test start`);

      try {
        const executionOrder: string[] = [];
        
        const p1 = new Promise<string>(resolve => {
          executionOrder.push('p1 created');
          setTimeout(() => {
            executionOrder.push('p1 resolving');
            resolve('p1 result');
          }, 30);
        });
        
        const p2 = new Promise<string>((_, reject) => {
          executionOrder.push('p2 created');
          setTimeout(() => {
            executionOrder.push('p2 rejecting');
            reject(new Error('p2 error'));
          }, 70);
        });
        
        const p3 = new Promise<string>((_, reject) => {
          executionOrder.push('p3 created');
          setTimeout(() => {
            executionOrder.push('p3 rejecting');
            reject(new Error('p3 error'));
          }, 100);
        });
        
        executionOrder.push('inner any start');
        const innerAny = Promise.any<string>([p1, p2]);
        
        executionOrder.push('outer any start');
        const result = await Promise.any<string>([innerAny, p3]);
        executionOrder.push('outer any resolved');
        
        await sleep(200);
        executionOrder.push('after wait');
        
        expect(result).assertEqual('p1 result');
        
        const expectedEvents = [
          'p1 created',
          'p2 created',
          'p3 created',
          'inner any start',
          'outer any start',
          'p1 resolving',
          'outer any resolved',
          'p2 rejecting',
          'p3 rejecting',
          'after wait'
        ];
        
        expectedEvents.forEach(event => {
          expect(executionOrder.includes(event)).assertTrue();
        });
        
        const p1ResolvingIndex = executionOrder.indexOf('p1 resolving');
        const outerAnyResolvedIndex = executionOrder.indexOf('outer any resolved');
        expect(p1ResolvingIndex).assertLess(outerAnyResolvedIndex);
        expect(p1ResolvingIndex).assertLess(executionOrder.indexOf('p2 rejecting'));
        expect(p1ResolvingIndex).assertLess(executionOrder.indexOf('p3 rejecting'));
        
      } catch (error) {
        console.error(`${caseName} Test failed with error: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseRaceTest2100
     * @tc.number SUB_PROMISE_RACE_TEST_2100
     * @tc.desc   Test nested Promise combinations. Input: Promise.all([Promise.race([resolved promise, rejected promise]), resolved promise])
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRaceTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseRaceTest2100';
      console.info(`${caseName} test start`);

      try {
        const executionOrder: string[] = [];
        
        const p1 = new Promise<string>(resolve => {
          executionOrder.push('p1 created');
          setTimeout(() => {
            executionOrder.push('p1 resolving');
            resolve('p1 result');
          }, 30);
        });
        
        const p2 = new Promise<string>((_, reject) => {
          executionOrder.push('p2 created');
          setTimeout(() => {
            executionOrder.push('p2 rejecting');
            reject(new Error('p2 error'));
          }, 70);
        });
        
        const p3 = new Promise<string>(resolve => {
          executionOrder.push('p3 created');
          setTimeout(() => {
            executionOrder.push('p3 resolving');
            resolve('p3 result');
          }, 100);
        });
        
        executionOrder.push('inner any start');
        const innerAny = Promise.any<string>([p1, p2]);
        
        executionOrder.push('outer any start');
        const result = await Promise.any<string>([innerAny, p3]);
        executionOrder.push('outer any resolved');
        
        await sleep(200);
        executionOrder.push('after wait');
        
        expect(result).assertEqual('p1 result');
        
        const expectedEvents = [
          'p1 created',
          'p2 created',
          'p3 created',
          'inner any start',
          'outer any start',
          'p1 resolving',
          'outer any resolved',
          'p2 rejecting',
          'p3 resolving',
          'after wait'
        ];
        
        expectedEvents.forEach(event => {
          expect(executionOrder.includes(event)).assertTrue();
        });
        
        const p1ResolvingIndex = executionOrder.indexOf('p1 resolving');
        const outerAnyResolvedIndex = executionOrder.indexOf('outer any resolved');
        expect(p1ResolvingIndex).assertLess(outerAnyResolvedIndex);
        expect(p1ResolvingIndex).assertLess(executionOrder.indexOf('p2 rejecting'));
        expect(p1ResolvingIndex).assertLess(executionOrder.indexOf('p3 resolving'));
        
      } catch (error) {
        console.error(`${caseName} Test failed with error: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseRaceTest2200
     * @tc.number SUB_PROMISE_RACE_TEST_2200
     * @tc.desc   Test nested Promise.any() with fast-rejecting outer Promise. Input: Promise.any([Promise.any([slow-resolved promise, rejected promise]), fast-rejected promise])
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRaceTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseRaceTest2200';
      console.info(`${caseName} test start`);

      try {
        const executionOrder: string[] = [];

        const p1 = new Promise<string>(resolve => {
          executionOrder.push('p1 created');
          setTimeout(() => {
            executionOrder.push('p1 resolving');
            resolve('p1 result');
          }, 30);
        });

        const p2 = new Promise<string>((_, reject) => {
          executionOrder.push('p2 created');
          setTimeout(() => {
            executionOrder.push('p2 rejecting');
            reject(new Error('p2 error'));
          }, 70);
        });

        const p3 = new Promise<string>((_, reject) => {
          executionOrder.push('p3 created');
          setTimeout(() => {
            executionOrder.push('p3 rejecting');
            reject(new Error('p3 error'));
          }, 100);
        });

        executionOrder.push('inner any start');
        const innerAny = Promise.any<string>([p1, p2]);

        executionOrder.push('outer any start');
        const result = await Promise.any<string>([innerAny, p3]);
        executionOrder.push('outer any resolved');

        await sleep(200);
        executionOrder.push('after wait');

        expect(result).assertEqual('p1 result');

        const expectedEvents = [
          'p1 created',
          'p2 created',
          'p3 created',
          'inner any start',
          'outer any start',
          'p1 resolving',
          'outer any resolved',
          'p2 rejecting',
          'p3 rejecting',
          'after wait'
        ];

        expectedEvents.forEach(event => {
          expect(executionOrder.includes(event)).assertTrue();
        });

        const p1ResolvingIndex = executionOrder.indexOf('p1 resolving');
        const outerAnyResolvedIndex = executionOrder.indexOf('outer any resolved');
        expect(p1ResolvingIndex).assertLess(outerAnyResolvedIndex);
        expect(p1ResolvingIndex).assertLess(executionOrder.indexOf('p2 rejecting'));
        expect(p1ResolvingIndex).assertLess(executionOrder.indexOf('p3 rejecting'));

      } catch (error) {
        console.error(`${caseName} Test failed with error: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseRaceTest2300
     * @tc.number SUB_PROMISE_RACE_TEST_2300
     * @tc.desc   Test nested simulated Promise.raceSettled() within Promise.any(). Input: Promise.any([simulatedRaceSettled([resolved, rejected]), resolved])
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRaceTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseRaceTest2300';
      console.info(`${caseName} test start`);

      try {
        const executionOrder: string[] = [];

        const p1 = new Promise<string>(resolve => {
          executionOrder.push('p1 created');
          setTimeout(() => {
            executionOrder.push('p1 resolving');
            resolve('p1 result');
          }, 30);
        });

        const p2 = new Promise<string>((_, reject) => {
          executionOrder.push('p2 created');
          setTimeout(() => {
            executionOrder.push('p2 rejecting');
            reject(new Error('p2 error'));
          }, 70);
        });
        p2.catch(() => { executionOrder.push('p2 catch handler'); });

        const p3 = new Promise<string>(resolve => {
          executionOrder.push('p3 created');
          setTimeout(() => {
            executionOrder.push('p3 resolving');
            resolve('p3 result');
          }, 100);
        });

        executionOrder.push('inner simulateRaceSettled start');
        const innerSettledPromise: Promise<Array<PromiseSettledResult<string>>> = simulateRaceSettled<string>([p1, p2]);
        executionOrder.push('inner simulateRaceSettled promise created');

        innerSettledPromise.then((results: Array<PromiseSettledResult<string>>): Array<PromiseSettledResult<string>> => {
           executionOrder.push('inner simulateRaceSettled resolving');
           return results;
        });

        executionOrder.push('outer any start');
        const result: Object = await Promise.any<Object>([innerSettledPromise, p3]);
        executionOrder.push('outer any resolved');

        await sleep(150);
        executionOrder.push('after wait');

        expect(Array.isArray(result)).assertTrue();
        const resultArray = result as Array<PromiseSettledResult<string>>;
        expect(resultArray.length).assertEqual(2);
        expect(resultArray[0].status).assertEqual('fulfilled');
        expect((resultArray[0] as PromiseFulfilledResult<string>).value).assertEqual('p1 result');
        expect(resultArray[1].status).assertEqual('rejected');
        expect((resultArray[1] as PromiseRejectedResult).reason.message).assertEqual('p2 error');

        const expectedEvents = [
          'p1 created',
          'p2 created',
          'p3 created',
          'inner simulateRaceSettled start',
          'inner simulateRaceSettled promise created',
          'outer any start',
          'p1 resolving',
          'p2 rejecting',
          'p2 catch handler',
          'inner simulateRaceSettled resolving',
          'outer any resolved',
          'p3 resolving',
          'after wait'
        ];

        expectedEvents.forEach(event => {
          expect(executionOrder.includes(event)).assertTrue();
        });

        const innerResolvedIndex = executionOrder.indexOf('inner simulateRaceSettled resolving');
        const outerResolvedIndex = executionOrder.indexOf('outer any resolved');
        const p3ResolvedIndex = executionOrder.indexOf('p3 resolving');

        expect(innerResolvedIndex).assertLess(outerResolvedIndex);
        expect(outerResolvedIndex).assertLess(p3ResolvedIndex);

      } catch (error) {
        console.error(`${caseName} Test failed with error: ${error.message}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseRaceTest2400
     * @tc.number SUB_PROMISE_RACE_TEST_2400
     * @tc.desc   Test nested simulated Promise.raceSettled() within Promise.any(). Input: Promise.any([simulatedRaceSettled([resolved, rejected]), rejected])
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRaceTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseRaceTest2400';
      console.info(`${caseName} test start`);

      try {
        const executionOrder: string[] = [];

        const p1 = new Promise<string>(resolve => {
          executionOrder.push('p1 created');
          setTimeout(() => {
            executionOrder.push('p1 resolving');
            resolve('p1 result');
          }, 30);
        });

        const p2 = new Promise<string>((_, reject) => {
          executionOrder.push('p2 created');
          setTimeout(() => {
            executionOrder.push('p2 rejecting');
            reject(new Error('p2 error'));
          }, 70);
        });
        p2.catch(() => { executionOrder.push('p2 catch handler'); });

        const p3 = new Promise<string>((_, reject) => {
          executionOrder.push('p3 created');
          setTimeout(() => {
            executionOrder.push('p3 rejecting');
            reject(new Error('p3 error'));
          }, 100);
        });
        p3.catch(()=>{
           executionOrder.push('p3 catch handler');
        });

        executionOrder.push('inner simulateRaceSettled start');
        const innerSettledPromise: Promise<Array<PromiseSettledResult<string>>> = simulateRaceSettled<string>([p1, p2]);
        executionOrder.push('inner simulateRaceSettled promise created');

        innerSettledPromise.then((results: Array<PromiseSettledResult<string>>): Array<PromiseSettledResult<string>> => {
           executionOrder.push('inner simulateRaceSettled resolving');
           return results;
        });

        executionOrder.push('outer any start');
        const result: Object = await Promise.any<Object>([innerSettledPromise, p3]);
        executionOrder.push('outer any resolved');

        await sleep(150);
        executionOrder.push('after wait');

        expect(Array.isArray(result)).assertTrue();
        const resultArray = result as Array<PromiseSettledResult<string>>;
        expect(resultArray.length).assertEqual(2);
        expect(resultArray[0].status).assertEqual('fulfilled');
        expect((resultArray[0] as PromiseFulfilledResult<string>).value).assertEqual('p1 result');
        expect(resultArray[1].status).assertEqual('rejected');
        expect((resultArray[1] as PromiseRejectedResult).reason.message).assertEqual('p2 error');

        const expectedEvents = [
          'p1 created',
          'p2 created',
          'p3 created',
          'inner simulateRaceSettled start',
          'inner simulateRaceSettled promise created',
          'outer any start',
          'p1 resolving',
          'p2 rejecting',
          'p2 catch handler',
          'inner simulateRaceSettled resolving',
          'outer any resolved',
          'p3 rejecting',
          'p3 catch handler',
          'after wait'
        ];

        expectedEvents.forEach(event => {
          expect(executionOrder.includes(event)).assertTrue();
        });

        const innerResolvedIndex = executionOrder.indexOf('inner simulateRaceSettled resolving');
        const outerResolvedIndex = executionOrder.indexOf('outer any resolved');
        const p3RejectedIndex = executionOrder.indexOf('p3 rejecting');

        expect(innerResolvedIndex).assertLess(outerResolvedIndex);
        expect(outerResolvedIndex).assertLess(p3RejectedIndex);

      } catch (error) {
        console.error(`${caseName} Test failed with error: ${error.message}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseRaceTest2500
     * @tc.number SUB_PROMISE_RACE_TEST_2500
     * @tc.desc   Test Promise.race execution order with .then added after race participation. Input: Promise added to race, then() added to promise, then() added to race result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRaceTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseRaceTest2500';
      console.info(`${caseName} test start`);
      try {
        const executionOrder: string[] = [];
        let p1ThenResult: string = '';
        let raceThenResult: string = '';

        const p1 = new Promise<string>(resolve => {
          executionOrder.push('p1 created');
          setTimeout(() => {
            executionOrder.push('p1 resolving');
            resolve('p1 result');
          }, 50);
        });

        executionOrder.push('race start');
        const racePromise = Promise.race<string>([p1]);
        executionOrder.push('race promise created');

        executionOrder.push('p1.then attaching');
        p1.then(value => {
          executionOrder.push('p1.then executing');
          p1ThenResult = value;
          return 'p1 then processed';
        });
        executionOrder.push('p1.then attached');

        executionOrder.push('racePromise.then attaching');
        racePromise.then(value => {
          executionOrder.push('racePromise.then executing');
          raceThenResult = value;
          return 'race then processed';
        });
        executionOrder.push('racePromise.then attached');

        await sleep(100);
        executionOrder.push('after wait');

        expect(p1ThenResult).assertEqual('p1 result');
        expect(raceThenResult).assertEqual('p1 result');

        const expectedOrder = [
          'p1 created',
          'race start',
          'race promise created',
          'p1.then attaching',
          'p1.then attached',
          'racePromise.then attaching',
          'racePromise.then attached',
          'p1 resolving',
          'p1.then executing',
          'racePromise.then executing',
          'after wait'
        ];

        expect(JSON.stringify(executionOrder)).assertEqual(JSON.stringify(expectedOrder));

      } catch (error) {
        console.error(`${caseName} Test failed with error: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseRaceTest2600
     * @tc.number SUB_PROMISE_RACE_TEST_2600
     * @tc.desc   Test Promise.race execution order where promise is added to race, then race.then is executed, then promise.then is executed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseRaceTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseRaceTest2600';
      console.info(`${caseName} test start`);

      try {
        const executionOrder: string[] = [];
        let raceThenResult: string = '';
        let p1ThenResult: string = '';

        const p1 = new Promise<string>(resolve => {
          executionOrder.push('p1 created');
          setTimeout(() => {
            executionOrder.push('p1 resolving');
            resolve('p1 result');
          }, 50);
        });
        executionOrder.push('p1 definition completed');

        executionOrder.push('race start');
        const racePromise = Promise.race<string>([p1]);
        executionOrder.push('race promise created');

        executionOrder.push('racePromise.then attaching');
        racePromise.then(value => {
          executionOrder.push('racePromise.then executing');
          raceThenResult = value;
          return 'race then processed';
        });
        executionOrder.push('racePromise.then attached');

        executionOrder.push('p1.then attaching');
        p1.then(value => {
          executionOrder.push('p1.then executing');
          p1ThenResult = value;
          return 'p1 then processed';
        });
        executionOrder.push('p1.then attached');

        await sleep(100);
        executionOrder.push('after wait');

        expect(p1ThenResult).assertEqual('p1 result');
        expect(raceThenResult).assertEqual('p1 result');

        const expectedOrder = [
          'p1 created',
          'p1 definition completed',
          'race start',
          'race promise created',
          'racePromise.then attaching',
          'racePromise.then attached',
          'p1.then attaching',
          'p1.then attached',
          'p1 resolving',
          'p1.then executing',
          'racePromise.then executing',
          'after wait'
        ];

        expect(JSON.stringify(executionOrder)).assertEqual(JSON.stringify(expectedOrder));

      } catch (error) {
        console.error(`${caseName} Test failed with error: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

  });
}
