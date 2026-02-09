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
import { sleep } from '../testability/pages/TestUtils';


export default function PromiseAnyTest() {
  describe('PromiseAnyTest', () => {
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
      console.info('PromiseAnyTest beforeAll called');
    })

    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      console.info('PromiseAnyTest beforeEach called');
      // Add delay to ensure resources from the previous test case are released
      await sleep(300);
    })

    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
      console.info('PromiseAnyTest afterEach called');
    })

    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
      console.info('PromiseAnyTest afterAll called');
    })

    /**
     * @tc.name   PromiseAnyTest0100
     * @tc.number SUB_PROMISE_ANY_TEST_0100
     * @tc.desc   Test Promise.any with 1000 promises, the first one resolves immediately.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAnyTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseAnyTest0100';
      console.info(`${caseName} test start`);
      const startTime = Date.now();
      const promises: Promise<string>[] = [];
      const successValue = 'FirstSuccess';
      const totalPromises = 1000;
      const delay = 200;
      promises.push(Promise.resolve(successValue));
      console.info(`${caseName} Added immediately resolving promise.`);
      for (let i = 1; i < totalPromises; i++) {
        promises.push(
          new Promise((_, reject) =>
          setTimeout(() => {
            reject(new Error(`Failure ${i}`));
          }, delay)
          )
        );
      }
      console.info(`${caseName} Added ${totalPromises - 1} delayed rejecting promises.`);
      try {
        console.info(`${caseName} Calling Promise.any with ${totalPromises} promises.`);
        const result = await Promise.any(promises);
        const endTime = Date.now();
        const duration = endTime - startTime;
        console.info(`${caseName} Promise.any resolved with: ${result}`);
        console.info(`${caseName} Duration: ${duration}ms`);
        expect(result).assertEqual(successValue);
      } catch (error) {
        console.error(`${caseName} Promise.any unexpectedly rejected: ${error}`);
        expect(false).assertTrue();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   PromiseAnyTest0200
     * @tc.number SUB_PROMISE_ANY_TEST_0200
     * @tc.desc   Test Promise.any with 1000 promises, all of which reject.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAnyTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseAnyTest0200';
      console.info(`${caseName} test start`);
      const startTime = Date.now();
      const promises: Promise<string>[] = [];
      const totalPromises = 1000;
      const delay = 100;
      for (let i = 0; i < totalPromises; i++) {
        promises.push(
          new Promise((_, reject) =>
          setTimeout(() => {
            reject(new Error(`Failure ${i}`));
          }, delay)
          )
        );
      }
      console.info(`${caseName} Added ${totalPromises} delayed rejecting promises.`);
      try {
        console.info(`${caseName} Calling Promise.any with ${totalPromises} rejecting promises.`);
        await Promise.any(promises);
        console.error(`${caseName} Promise.any unexpectedly resolved.`);
        expect(false).assertTrue();
      } catch (error) {
        const endTime = Date.now();
        const duration = endTime - startTime;
        console.info(`${caseName} Promise.any correctly rejected.`);
        console.info(`${caseName} Duration: ${duration}ms`);
        expect(error.name).assertEqual('AggregateError');
        expect(Array.isArray(error.errors)).assertTrue();
        expect(error.errors.length).assertEqual(totalPromises);
        if (error.errors.length > 0) {
          expect(error.errors[0].message).assertEqual('Failure 0');
          const lastIndex = totalPromises - 1;
          expect(error.errors[lastIndex].message).assertEqual(`Failure ${lastIndex}`);
        }
        console.info(`${caseName} Verified AggregateError with ${error.errors.length} errors.`);
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseAnyTest0300
     * @tc.number SUB_PROMISE_ANY_TEST_0300
     * @tc.desc   Test Promise.any with 1000 promises, all of which resolve.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAnyTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseAnyTest0300';
      console.info(`${caseName} test start`);
      const startTime = Date.now();
      const promises: Promise<string>[] = [];
      const totalPromises = 1000;
      const baseDelay = 100;
      for (let i = 0; i < totalPromises; i++) {
        const currentDelay = baseDelay + i;
        const successValue = `Success ${i}`;
        promises.push(
          new Promise((resolve) =>
          setTimeout(() => {
            resolve(successValue);
          }, currentDelay)
          )
        );
      }
      console.info(`${caseName} Added ${totalPromises} delayed resolving promises.`);
      try {
        console.info(`${caseName} Calling Promise.any with ${totalPromises} resolving promises.`);
        const result = await Promise.any(promises);
        const endTime = Date.now();
        const duration = endTime - startTime;
        console.info(`${caseName} Promise.any correctly resolved with: ${result}`);
        console.info(`${caseName} Duration: ${duration}ms`);
        expect(result.startsWith('Success ')).assertTrue();
      } catch (error) {
        console.error(`${caseName} Promise.any unexpectedly rejected: ${error}`);
        expect(false).assertTrue();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseAnyTest0400
     * @tc.number SUB_PROMISE_ANY_TEST_0400
     * @tc.desc   Test Promise.any with three promises: resolve, reject, resolve.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAnyTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseAnyTest0400';
      console.info(`${caseName} test start`);
      const startTime = Date.now();
      let arr:number[] = [];
      const firstResolveDelay = 50;
      const rejectDelay = 100;
      const secondResolveDelay = 150;
      const firstSuccessValue = 'FirstSuccess';
      const secondSuccessValue = 'ThirdSuccess';
      const promises: Promise<string>[] = [
        new Promise((resolve) => {
        setTimeout(() =>{
          arr.push(1);
          resolve(firstSuccessValue)
        },firstResolveDelay);
      }),
        new Promise((_, reject) =>{
          setTimeout(() =>{
            arr.push(2);
            reject(new Error('Failure'));
          }, rejectDelay);
        }),
        new Promise((resolve) =>{
          setTimeout(() =>{
            arr.push(3);
            resolve(secondSuccessValue);
          }, secondResolveDelay)
        })
      ];
      arr.push(4);
      console.info(`${caseName} Added 3 promises (resolve, reject, resolve) with delays.`);
      try {
        arr.push(5);
        console.info(`${caseName} Calling Promise.any...`);
        const result = await Promise.any(promises);
        const endTime = Date.now();
        const duration = endTime - startTime;
        console.info(`${caseName} Promise.any resolved with: ${result}`);
        console.info(`${caseName} Duration: ${duration}ms`);
        expect(result).assertEqual(firstSuccessValue);
      } catch (error) {
        arr.push(6);
        console.error(`${caseName} Promise.any unexpectedly rejected: ${error}`);
        expect(false).assertTrue();
      } finally {
        arr.push(7);
        expect(JSON.stringify(arr)).assertEqual('[4,5,1,7]');
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseAnyTest0500
     * @tc.number SUB_PROMISE_ANY_TEST_0500
     * @tc.desc   Test Promise.any with three promises, all of which reject.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAnyTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseAnyTest0500';
      console.info(`${caseName} test start`);
      const startTime = Date.now();
      let arr:number[] = [];
      const delay1 = 50;
      const delay2 = 100;
      const delay3 = 150;
      const promises: Promise<string>[] = [
        new Promise((_, reject) =>{
          setTimeout(() =>{
            arr.push(1);
            reject(new Error('Failure 1'))
          }, delay1);
        }),
        new Promise((_, reject) =>{
          setTimeout(() =>{
            arr.push(2);
            reject(new Error('Failure 2'))
          }, delay2);
        }),
        new Promise((_, reject) =>{
          setTimeout(() =>{
            arr.push(3);
            reject(new Error('Failure 3'))
          }, delay3)
        }),
      ];
      arr.push(4);
      console.info(`${caseName} Added 3 rejecting promises with delays.`);
      try {
        arr.push(5);
        console.info(`${caseName} Calling Promise.any (expected to reject)...`);
        await Promise.any(promises);
        console.error(`${caseName} Promise.any unexpectedly resolved.`);
        expect(false).assertTrue();
      } catch (error) {
        arr.push(6);
        const endTime = Date.now();
        const duration = endTime - startTime;
        console.info(`${caseName} Promise.any correctly rejected.`);
        console.info(`${caseName} Duration: ${duration}ms`);
        expect(error.name).assertEqual('AggregateError');
        expect(Array.isArray(error.errors)).assertTrue();
        expect(error.errors.length).assertEqual(3);
        const errorMessages: string[] = error.errors.map((e: Error): string => e.message).sort();
        expect(errorMessages[0]).assertEqual('Failure 1');
        expect(errorMessages[1]).assertEqual('Failure 2');
        expect(errorMessages[2]).assertEqual('Failure 3');
        console.info(`${caseName} Verified AggregateError with 3 errors.`);
      } finally {
        arr.push(7);
        expect(JSON.stringify(arr)).assertEqual('[4,5,1,2,3,6,7]');
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseAnyTest0600
     * @tc.number SUB_PROMISE_ANY_TEST_0600
     * @tc.desc   Test Promise.any with one promise throwing sync error during construction and one resolving normally.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAnyTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseAnyTest0600';
      console.info(`${caseName} test start`);
      const startTime = Date.now();
      let arr:number[] = [];
      const resolveDelay = 50;
      const successValue = 'NormalResolve';
      const syncErrorMessage = 'Sync Construction Error';
      const promises: Promise<string>[] = [];
      try {
        const syncErrorPromise = new Promise<string>(() => {
          arr.push(1);
          throw new Error(syncErrorMessage);
        });
        promises.push(syncErrorPromise);
      } catch (constructionError) {
        arr.push(2);
        console.warn(`${caseName} Caught error during sync promise construction: ${constructionError}`);
        promises.push(Promise.reject(constructionError));
      }

      const resolvingPromise = new Promise<string>((resolve) => {
        setTimeout(() =>{
          arr.push(3);
          resolve(successValue)
        }, resolveDelay);
      });
      promises.push(resolvingPromise);
      console.info(`${caseName} Added 1 sync-error promise and 1 resolving promise.`);
      try {
        arr.push(4);
        console.info(`${caseName} Calling Promise.any...`);
        const result = await Promise.any(promises);
        const endTime = Date.now();
        const duration = endTime - startTime;
        console.info(`${caseName} Promise.any resolved with: ${result}`);
        console.info(`${caseName} Duration: ${duration}ms`);
        expect(result).assertEqual(successValue);
      } catch (error) {
        arr.push(5);
        console.error(`${caseName} Promise.any unexpectedly rejected: ${error}`);
        if (error.name === 'AggregateError') {
          console.error(`${caseName} Aggregate Errors: ${JSON.stringify(error.errors)}`);
        }
        expect(false).assertTrue();
      } finally {
        arr.push(6);
        expect(JSON.stringify(arr)).assertEqual('[1,4,3,6]');
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseAnyTest0700
     * @tc.number SUB_PROMISE_ANY_TEST_0700
     * @tc.desc   Test Promise.any with one promise resolving synchronously during construction.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAnyTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseAnyTest0700';
      console.info(`${caseName} test start`);
      const startTime = Date.now();
      let arr:number[] = [];
      const syncSuccessValue = 'SyncResolve';
      const delayedSuccessValue = 'DelayedResolve';
      const delayedResolveDelay = 50;
      const promises: Promise<string>[] = [
        new Promise<string>((resolve) => {
          arr.push(1);
          resolve(syncSuccessValue);
        }),
        new Promise<string>((resolve) => {
          setTimeout(() =>{
            arr.push(2);
            resolve(delayedSuccessValue)
          }, delayedResolveDelay);
        }),
      ];
      arr.push(3);
      console.info(`${caseName} Added 1 sync-resolving promise and 1 delayed resolving promise.`);
      try {
        arr.push(4);
        console.info(`${caseName} Calling Promise.any...`);
        const result = await Promise.any(promises);
        const endTime = Date.now();
        const duration = endTime - startTime;
        console.info(`${caseName} Promise.any resolved with: ${result}`);
        console.info(`${caseName} Duration: ${duration}ms`);
        expect(result).assertEqual(syncSuccessValue);
      } catch (error) {
        arr.push(5);
        console.error(`${caseName} Promise.any unexpectedly rejected: ${error}`);
        expect(false).assertTrue();
      } finally {
        arr.push(6);
        expect(JSON.stringify(arr)).assertEqual('[1,3,4,6]');
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseAnyTest0800
     * @tc.number SUB_PROMISE_ANY_TEST_0800
     * @tc.desc   Test Promise.any with one promise resolving and one rejecting synchronously during construction.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAnyTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseAnyTest0800';
      console.info(`${caseName} test start`);
      const startTime = Date.now();
      let arr:number[] = [];
      const syncSuccessValue = 'SyncResolveFirst';
      const syncErrorMessage = 'SyncRejectSecond';
      const arbitraryShortDelay = 150;
      const promises: Promise<string>[] = [];
      const syncResolvePromise = new Promise<string>((resolve) => {
        arr.push(1);
        resolve(syncSuccessValue);
      });
      promises.push(syncResolvePromise);
      arr.push(2);
      try {
        const syncErrorPromise = new Promise<string>(() => {
          arr.push(3);
          throw new Error(syncErrorMessage);
        });
        promises.push(syncErrorPromise);
      } catch (constructionError) {
        arr.push(4);
        console.warn(`${caseName} Caught error during sync promise construction: ${constructionError}`);
        promises.push(Promise.reject(constructionError));
      }
      console.info(`${caseName} Added 1 sync-resolving and 1 sync-rejecting promise.`);
      try {
        arr.push(5);
        console.info(`${caseName} Calling Promise.any...`);
        const result = await Promise.any(promises);
        console.info(`${caseName} Promise.any resolved with: ${result}`);
        expect(result).assertEqual(syncSuccessValue);
      } catch (error) {
        arr.push(6);
        console.error(`${caseName} Promise.any unexpectedly rejected: ${error}`);
        if (error.name === 'AggregateError') {
          console.error(`${caseName} Aggregate Errors: ${JSON.stringify(error.errors)}`);
        }
        expect(false).assertTrue();
      } finally {
        arr.push(7);
        expect(JSON.stringify(arr)).assertEqual('[1,2,3,5,7]');
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseAnyTest0900
     * @tc.number SUB_PROMISE_ANY_TEST_0900
     * @tc.desc   Test Promise.any with a single promise that rejects synchronously during construction.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAnyTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseAnyTest0900';
      console.info(`${caseName} test start`);
      const startTime = Date.now();
      let arr:number[] = [];
      const syncErrorMessage = 'Sync Construction Reject';
      const promises: Promise<string>[] = [];
      try {
        const syncErrorPromise = new Promise<string>(() => {
          arr.push(1);
          throw new Error(syncErrorMessage);
        });
        promises.push(syncErrorPromise);
      } catch (constructionError) {
        arr.push(2);
        console.warn(`${caseName} Caught error during sync promise construction: ${constructionError}`);
        promises.push(Promise.reject(constructionError));
      }
      arr.push(3);
      console.info(`${caseName} Added 1 sync-rejecting promise.`);
      try {
        arr.push(4);
        console.info(`${caseName} Calling Promise.any (expected to reject)...`);
        await Promise.any(promises);
        console.error(`${caseName} Promise.any unexpectedly resolved.`);
        expect(false).assertTrue();
      } catch (error) {
        arr.push(5);
        const endTime = Date.now();
        const duration = endTime - startTime;
        console.info(`${caseName} Promise.any correctly rejected.`);
        console.info(`${caseName} Duration: ${duration}ms`);
        expect(error.name).assertEqual('AggregateError');
        expect(Array.isArray(error.errors)).assertTrue();
        expect(error.errors.length).assertEqual(1);
        expect(error.errors[0].message).assertEqual(syncErrorMessage);
        console.info(`${caseName} Verified AggregateError with 1 error.`);
      } finally {
        arr.push(6);
        expect(JSON.stringify(arr)).assertEqual('[1,3,4,5,6]');
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseAnyTest1000
     * @tc.number SUB_PROMISE_ANY_TEST_1000
     * @tc.desc   Test Promise.any with three resolving promises with different delays.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAnyTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseAnyTest1000';
      console.info(`${caseName} test start`);
      const startTime = Date.now();
      let arr:number[] = [];
      const delay1 = 150;
      const delay2 = 300;
      const delay3 = 550;
      const successValue1 = 'Success1';
      const successValue2 = 'Success2';
      const successValue3 = 'Success3';
      const promises: Promise<string>[] = [
        new Promise((resolve) =>{
          setTimeout(() =>{
            arr.push(1);
            resolve(successValue1);
          }, delay1)
        }),
        new Promise((resolve) =>{
          setTimeout(() =>{
            arr.push(2);
            resolve(successValue2);
          }, delay2)
        }),
        new Promise((resolve) =>{
          setTimeout(() =>{
            arr.push(3);
            resolve(successValue3);
          }, delay3)
        }),
      ];
      console.info(`${caseName} Added 3 resolving promises.`);
      try {
        arr.push(4);
        const result = await Promise.any(promises);
        const endTime = Date.now();
        const duration = endTime - startTime;
        console.info(`${caseName} Promise.any resolved with: ${result}`);
        console.info(`${caseName} Duration: ${duration}ms`);
        expect(result).assertEqual(successValue1);
      } catch (error) {
        arr.push(5);
        console.error(`${caseName} Promise.any unexpectedly rejected: ${error}`);
        expect(false).assertTrue();
      } finally {
        arr.push(6);
        expect(JSON.stringify(arr)).assertEqual('[4,1,6]');
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseAnyTest1100
     * @tc.number SUB_PROMISE_ANY_TEST_1100
     * @tc.desc   Test Promise.any: P1(resolve 2s), P2(reject 1s).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAnyTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseAnyTest1100';
      console.info(`${caseName} test start`);
      const startTime = Date.now();
      let arr:number[] = [];
      const resolveDelay = 2000;
      const rejectDelay = 1000;
      const successValue = 'SlowSuccess';
      const promises: Promise<string>[] = [
        new Promise((resolve) =>{
          setTimeout(() =>{
            arr.push(1);
            resolve(successValue)
          }, resolveDelay)
        }),
        new Promise((_, reject) =>{
          setTimeout(() =>{
            arr.push(2);
            reject(new Error('FastReject'))
          }, rejectDelay)
        }),
      ];
      console.info(`${caseName} Added P1(resolve ${resolveDelay}ms), P2(reject ${rejectDelay}ms).`);
      try {
        arr.push(3);
        const result = await Promise.any(promises);
        const endTime = Date.now();
        const duration = endTime - startTime;
        console.info(`${caseName} Promise.any resolved with: ${result}`);
        console.info(`${caseName} Duration: ${duration}ms`);
        expect(result).assertEqual(successValue);
      } catch (error) {
        arr.push(4);
        console.error(`${caseName} Promise.any unexpectedly rejected: ${error}`);
        expect(false).assertTrue();
      } finally {
        arr.push(5);
        expect(JSON.stringify(arr)).assertEqual('[3,2,1,5]');
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseAnyTest1200
     * @tc.number SUB_PROMISE_ANY_TEST_1200
     * @tc.desc   Test Promise.any: P1(resolve 1s), P2(reject 2s).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAnyTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseAnyTest1200';
      console.info(`${caseName} test start`);
      const startTime = Date.now();
      let arr:number[] = [];
      const resolveDelay = 1000;
      const rejectDelay = 2000;
      const successValue = 'FastSuccess';
      const promises: Promise<string>[] = [
        new Promise((resolve) =>{
          setTimeout(() =>{
            arr.push(1);
            resolve(successValue)
          }, resolveDelay)
        }),
        new Promise((_, reject) =>{
          setTimeout(() =>{
            arr.push(2);
            reject(new Error('SlowReject'))
          }, rejectDelay)
        }),
      ];
      console.info(`${caseName} Added P1(resolve ${resolveDelay}ms), P2(reject ${rejectDelay}ms).`);

      try {
        arr.push(3);
        const result = await Promise.any(promises);
        const endTime = Date.now();
        const duration = endTime - startTime;
        console.info(`${caseName} Promise.any resolved with: ${result}`);
        console.info(`${caseName} Duration: ${duration}ms`);
        expect(result).assertEqual(successValue);
      } catch (error) {
        arr.push(4);
        console.error(`${caseName} Promise.any unexpectedly rejected: ${error}`);
        expect(false).assertTrue();
      } finally {
        arr.push(5);
        expect(JSON.stringify(arr)).assertEqual('[3,1,5]');
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseAnyTest1300
     * @tc.number SUB_PROMISE_ANY_TEST_1300
     * @tc.desc   Test Promise.any with mixed types: basic type, normal iterable, and throwing iterable class.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAnyTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseAnyTest1300';
      console.info(`${caseName} test start`);
      const startTime = Date.now();
      let arr:number[] = [];
      const basicTypeValue = 'BasicValueSuccess';
      const resolveDelay = 150;
      const rejectDelay = 300;
      const normalIterable: Promise<string>[] = [
        new Promise<string>((resolve: (value: string) => void) =>{
          setTimeout(() =>{
            arr.push(1);
            resolve('IterableResolve');
          } ,resolveDelay);
        }),
        new Promise<string>((_, reject: (reason?: Error) => void) =>{
          setTimeout(() =>{
            arr.push(2);
            reject(new Error('IterableReject'))
          }, rejectDelay);
        })
      ];
      const throwingIterableErrorMsg = "Error during iteration";
      arr.push(3);
      class ThrowingIteratorClass {
        next(): never {
          throw new Error(throwingIterableErrorMsg);
        }
      }
      class ThrowingIterableClass {
        [Symbol.iterator](): ThrowingIteratorClass {
          return new ThrowingIteratorClass();
        }
      }
      const throwingIterable = new ThrowingIterableClass();
      const mixedInputs: (string | Promise<string>[] | ThrowingIterableClass)[] = [
        basicTypeValue,
        normalIterable,
        throwingIterable
      ];
      console.info(`${caseName} Created mixed inputs: basic type, normal iterable, throwing iterable class.`);
      try {
        arr.push(4);
        console.info(`${caseName} Calling Promise.any with mixed inputs...`);
        const result = await Promise.any(mixedInputs) as string;
        const endTime = Date.now();
        const duration = endTime - startTime;
        console.info(`${caseName} Promise.any resolved with: ${result}`);
        console.info(`${caseName} Duration: ${duration}ms`);
        expect(result).assertEqual(basicTypeValue);
      } catch (error) {
        arr.push(5);
        if (error instanceof Error) {
          console.error(`${caseName} Promise.any unexpectedly rejected: ${error.message}`);
        } else {
          console.error(`${caseName} Promise.any unexpectedly rejected with non-Error type: ${JSON.stringify(error)}`);
        }
        expect(false).assertTrue();
      } finally {
        arr.push(6);
        expect(JSON.stringify(arr)).assertEqual('[3,4,6]');
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseAnyTest1400
     * @tc.number SUB_PROMISE_ANY_TEST_1400
     * @tc.desc   Test nested Promise.any: any([any([resolve, reject]), reject]).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAnyTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseAnyTest1400';
      console.info(`${caseName} test start`);
      const startTime = Date.now();
      let arr:number[] = [];
      const innerResolveDelay = 150;
      const innerRejectDelay = 300;
      const outerRejectDelay = 550;
      const successValue = 'InnerResolve';
      const innerAny = Promise.any<string>([
        new Promise<string>((resolve: (value: string) => void) =>{
          setTimeout(() =>{
            arr.push(1);
            resolve(successValue)
          }, innerResolveDelay);
        }),
        new Promise<string>((_, reject: (reason?: Error) => void) =>{
          setTimeout(() =>{
            arr.push(2);
            reject(new Error('InnerReject'))
          }, innerRejectDelay);
        })
      ]);
      arr.push(3);
      const outerReject = new Promise<string>((_, reject: (reason?: Error) => void) => setTimeout(() => reject(new Error('OuterReject')), outerRejectDelay));
      console.info(`${caseName} Created nested any([any([resolve, reject]), reject]).`);
      try {
        arr.push(4);
        const result = await Promise.any<string>([innerAny, outerReject]);
        const endTime = Date.now();
        const duration = endTime - startTime;
        console.info(`${caseName} Outer Promise.any resolved with: ${result}`);
        console.info(`${caseName} Duration: ${duration}ms`);
        expect(result as string).assertEqual(successValue);
      } catch (error) {
        arr.push(5);
        if (error instanceof Error) {
           console.error(`${caseName} Outer Promise.any unexpectedly rejected: ${error.message}`);
        } else {
           console.error(`${caseName} Outer Promise.any unexpectedly rejected: ${JSON.stringify(error)}`);
        }
        expect(false).assertTrue();
      } finally {
        arr.push(6);
        expect(JSON.stringify(arr)).assertEqual('[3,4,1,6]');
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseAnyTest1500
     * @tc.number SUB_PROMISE_ANY_TEST_1500
     * @tc.desc   Test nested Promise.any: any([any([reject, reject]), reject]). Expect outer reject.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAnyTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseAnyTest1500';
      console.info(`${caseName} test start`);
      const startTime = Date.now();
      let arr:number[] = [];
      const innerRejectDelay1 = 150;
      const innerRejectDelay2 = 300;
      const outerRejectDelay = 550;
      const innerError1 = 'InnerReject1';
      const innerError2 = 'InnerReject2';
      const outerError = 'OuterReject';
      const innerAny = Promise.any<string>([
        new Promise<string>((_, reject) =>{
          setTimeout(() =>{
            arr.push(1);
            reject(new Error(innerError1));
          }, innerRejectDelay1)
        }),
        new Promise<string>((_, reject) =>{
          setTimeout(() =>{
            arr.push(2);
            reject(new Error(innerError2))
          }, innerRejectDelay2)
        })
      ]);
      const outerReject = new Promise<string>((_, reject) =>{
        setTimeout(() =>{
          arr.push(3);
          reject(new Error(outerError));
        }, outerRejectDelay)
      });
      console.info(`${caseName} Created nested any([any([reject, reject]), reject]).`);
      try {
        arr.push(4);
        await Promise.any<string>([innerAny, outerReject]);
        console.error(`${caseName} Outer Promise.any unexpectedly resolved.`);
        expect(false).assertTrue();
      } catch (error) {
        arr.push(5);
        const endTime = Date.now();
        const duration = endTime - startTime;
        console.info(`${caseName} Outer Promise.any correctly rejected.`);
        console.info(`${caseName} Duration: ${duration}ms`);
        expect(error instanceof AggregateError).assertTrue();
        const aggregateError = error as AggregateError;
        expect(aggregateError.name).assertEqual('AggregateError');
        expect(Array.isArray(aggregateError.errors)).assertTrue();
        expect(aggregateError.errors.length).assertEqual(2);
        let foundInnerAggregate = false;
        let foundOuterError = false;
        for(const err of aggregateError.errors as (Error | AggregateError)[]) {
          if (err instanceof Error && err.message === outerError) {
            arr.push(7);
            foundOuterError = true;
          } else if (err instanceof AggregateError) {
            arr.push(8);
            foundInnerAggregate = true;
            const innerAggregate = err as AggregateError;
            expect(Array.isArray(innerAggregate.errors)).assertTrue();
            expect(innerAggregate.errors.length).assertEqual(2);
            const innerMessages = innerAggregate.errors.map<string>((e: Error): string => e.message).sort();
            expect(JSON.stringify(innerMessages)).assertEqual(JSON.stringify([innerError1, innerError2].sort()));
          }
        }
        expect(foundInnerAggregate).assertTrue();
        expect(foundOuterError).assertTrue();
      } finally {
        arr.push(6);
        expect(JSON.stringify(arr)).assertEqual('[4,1,2,3,5,8,7,6]');
        console.info(`${caseName} test end`);
        done();
      }
    });


    /**
     * @tc.name   PromiseAnyTest1600
     * @tc.number SUB_PROMISE_ANY_TEST_1600
     * @tc.desc   Test nested Promise.any: any([any([resolve1, reject]), resolve2]). Expect first resolve.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAnyTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseAnyTest1600';
      console.info(`${caseName} test start`);
      const startTime = Date.now();
      let arr:number[] = [];
      const innerResolveDelay = 150;
      const innerRejectDelay = 300;
      const outerResolveDelay = 550;
      const successValue1 = 'InnerResolve';
      const successValue2 = 'OuterResolve';
      const innerAny = Promise.any<string>([
        new Promise<string>((resolve) =>{
          setTimeout(() =>{
            arr.push(1);
            resolve(successValue1)
          }, innerResolveDelay)
        }),
        new Promise<string>((_, reject) =>{
          setTimeout(() =>{
            arr.push(2);
            reject(new Error('InnerReject'))
          }, innerRejectDelay)
        })
      ]);
      const outerResolve = new Promise<string>((resolve) =>{
        setTimeout(() =>{
          arr.push(3);
          resolve(successValue2);
        }, outerResolveDelay)
      });
      console.info(`${caseName} Created nested any([any([resolve1, reject]), resolve2]).`);
      try {
        arr.push(4);
        const result = await Promise.any<string>([innerAny, outerResolve]);
        const endTime = Date.now();
        const duration = endTime - startTime;
        console.info(`${caseName} Outer Promise.any resolved with: ${result}`);
        console.info(`${caseName} Duration: ${duration}ms`);
        expect(result as string).assertEqual(successValue1);
      } catch (error) {
        arr.push(5);
        console.error(`${caseName} Outer Promise.any unexpectedly rejected: ${error}`);
        expect(false).assertTrue();
      } finally {
        arr.push(6);
        expect(JSON.stringify(arr)).assertEqual('[4,1,6]');
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseAnyTest1700
     * @tc.number SUB_PROMISE_ANY_TEST_1700
     * @tc.desc   Test nested Promise.any: any([any([resolve, reject1]), reject2]). Expect inner resolve.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAnyTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseAnyTest1700';
      console.info(`${caseName} test start`);
      const startTime = Date.now();
      let arr:number[] = [];
      const innerResolveDelay = 150;
      const innerRejectDelay = 300;
      const outerRejectDelay = 550;
      const successValue = 'InnerResolveAgain';
      const innerAny = Promise.any<string>([
        new Promise<string>((resolve) =>{
          setTimeout(() =>{
            arr.push(1);
            resolve(successValue);
          }, innerResolveDelay)
        }),
        new Promise<string>((_, reject) =>{
          setTimeout(() =>{
            arr.push(2);
            reject(new Error('InnerReject1'));
          }, innerRejectDelay)
        })
      ]);

      const outerReject = new Promise<string>((_, reject) =>{
        setTimeout(() =>{
          arr.push(3);
          reject(new Error('OuterReject2'));
        }, outerRejectDelay)
      });
      console.info(`${caseName} Created nested any([any([resolve, reject1]), reject2]).`);
      try {
        arr.push(4);
        const result = await Promise.any<string>([innerAny, outerReject]);
        const endTime = Date.now();
        const duration = endTime - startTime;
        console.info(`${caseName} Outer Promise.any resolved with: ${result}`);
        console.info(`${caseName} Duration: ${duration}ms`);
        expect(result as string).assertEqual(successValue);
      } catch (error) {
        arr.push(5);
        console.error(`${caseName} Outer Promise.any unexpectedly rejected: ${error}`);
        expect(false).assertTrue();
      } finally {
        arr.push(6);
        expect(JSON.stringify(arr)).assertEqual('[4,1,6]');
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseAnyTest1800
     * @tc.number SUB_PROMISE_ANY_TEST_1800
     * @tc.desc   Test nested Promise.race: any([race([resolve1, reject]), resolve2]). Expect first resolve.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAnyTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseAnyTest1800';
      console.info(`${caseName} test start`);
      const startTime = Date.now();
      let arr:number[] = [];
      const innerResolveDelay = 150;
      const innerRejectDelay = 300;
      const outerResolveDelay = 550;
      const successValue1 = 'InnerRaceResolve';
      const successValue2 = 'OuterResolve';
      const innerRace = Promise.race<string>([
        new Promise<string>((resolve) =>{
          setTimeout(() =>{
            arr.push(1);
            resolve(successValue1)
          }, innerResolveDelay)
        }),
        new Promise<string>((_, reject) =>{
          setTimeout(() =>{
            arr.push(2);
            reject(new Error('InnerRaceReject'))
          }, innerRejectDelay)
        })
      ]);
      const outerResolve = new Promise<string>((resolve) =>{
        setTimeout(() =>{
          arr.push(3);
          resolve(successValue2)
        }, outerResolveDelay)
      });
      console.info(`${caseName} Created nested any([race([resolve1, reject]), resolve2]).`);
      try {
        arr.push(4);
        const result = await Promise.any<string>([innerRace, outerResolve]);
        const endTime = Date.now();
        const duration = endTime - startTime;
        console.info(`${caseName} Outer Promise.any resolved with: ${result}`);
        console.info(`${caseName} Duration: ${duration}ms`);
        expect(result as string).assertEqual(successValue1);
      } catch (error) {
        arr.push(5);
        console.error(`${caseName} Outer Promise.any unexpectedly rejected: ${error}`);
        expect(false).assertTrue();
      } finally {
        arr.push(6);
        expect(JSON.stringify(arr)).assertEqual('[4,1,6]');
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseAnyTest1900
     * @tc.number SUB_PROMISE_ANY_TEST_1900
     * @tc.desc   Test nested Promise.race: any([race([resolve, reject1]), reject2]). Expect inner resolve.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAnyTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseAnyTest1900';
      console.info(`${caseName} test start`);
      const startTime = Date.now();
      let arr:number[] = [];
      const innerResolveDelay = 150;
      const innerRejectDelay = 300;
      const outerRejectDelay = 550;
      const successValue = 'InnerRaceResolveAgain';
      const innerRace = Promise.race<string>([
        new Promise<string>((resolve) =>{
          setTimeout(() =>{
            arr.push(1);
            resolve(successValue)
          }, innerResolveDelay)
        }),
        new Promise<string>((_, reject) =>{
          setTimeout(() =>{
            arr.push(2);
            reject(new Error('InnerRaceReject1'))
          }, innerRejectDelay)
        })
      ]);
      const outerReject = new Promise<string>((_, reject) =>{
        setTimeout(() =>{
          arr.push(3);
          reject(new Error('OuterReject2'))
        }, outerRejectDelay)
      });
      console.info(`${caseName} Created nested any([race([resolve, reject1]), reject2]).`);
      try {
        arr.push(4);
        const result = await Promise.any<string>([innerRace, outerReject]);
        const endTime = Date.now();
        const duration = endTime - startTime;
        console.info(`${caseName} Outer Promise.any resolved with: ${result}`);
        console.info(`${caseName} Duration: ${duration}ms`);
        expect(result as string).assertEqual(successValue);
      } catch (error) {
        arr.push(5);
        console.error(`${caseName} Outer Promise.any unexpectedly rejected: ${error}`);
        expect(false).assertTrue();
      } finally {
        arr.push(6);
        expect(JSON.stringify(arr)).assertEqual('[4,1,6]');
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseAnyTest2000
     * @tc.number SUB_PROMISE_ANY_TEST_2000
     * @tc.desc   Test nested Promise.allSettled: any([allSettled([resolve, reject]), resolve2]). Expect allSettled result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAnyTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseAnyTest2000';
      console.info(`${caseName} test start`);
      const startTime = Date.now();
      let arr:number[] = [];
      const innerResolveDelay = 150;
      const innerRejectDelay = 300;
      const outerResolveDelay = 550;
      const successValue1 = 'InnerSettledResolve';
      const rejectReason1 = 'InnerSettledReject';
      const successValue2 = 'OuterResolve';
      const innerAllSettled = Promise.allSettled<[Promise<string>, Promise<string>]>([
        new Promise<string>((resolve) =>{
          setTimeout(() =>{
            arr.push(1);
            resolve(successValue1)
          }, innerResolveDelay)
        }),
        new Promise<string>((_, reject) =>{
          setTimeout(() =>{
            arr.push(2);
            reject(new Error(rejectReason1))
          }, innerRejectDelay)
        })
      ]);
      const outerResolve = new Promise<string>((resolve) =>{
        setTimeout(() =>{
          arr.push(3);
          resolve(successValue2)
        }, outerResolveDelay)
      });
      console.info(`${caseName} Created nested any([allSettled([resolve, reject]), resolve2]).`);
      try {
        arr.push(4);
        const result = await Promise.any<PromiseSettledResult<string>[] | string>([innerAllSettled, outerResolve]);
        const endTime = Date.now();
        const duration = endTime - startTime;
        console.info(`${caseName} Outer Promise.any resolved.`);
        console.info(`${caseName} Duration: ${duration}ms`);
        const settlementArray = result as PromiseSettledResult<string>[];
        expect(Array.isArray(settlementArray)).assertTrue();
        expect(settlementArray.length).assertEqual(2);
        const firstResult = settlementArray[0];
        expect(firstResult.status).assertEqual('fulfilled');
        if (firstResult.status === 'fulfilled') {
          expect(firstResult.value).assertEqual(successValue1);
        } else {
          expect(false).assertTrue();
        }
        const secondResult = settlementArray[1];
        expect(secondResult.status).assertEqual('rejected');
        if (secondResult.status === 'rejected') {
          expect(secondResult.reason instanceof Error).assertTrue();
          expect((secondResult.reason as Error).message).assertEqual(rejectReason1);
        } else {
          expect(false).assertTrue();
        }
      } catch (error) {
        arr.push(5);
        console.error(`${caseName} Outer Promise.any unexpectedly rejected: ${error}`);
        expect(false).assertTrue();
      } finally {
        expect(JSON.stringify(arr)).assertEqual('[4,1,2]');
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseAnyTest2100
     * @tc.number SUB_PROMISE_ANY_TEST_2100
     * @tc.desc   Test nested Promise.allSettled: any([allSettled([resolve, reject]), reject2]). Expect allSettled result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAnyTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseAnyTest2100';
      console.info(`${caseName} test start`);
      const startTime = Date.now();
      let arr:number[] = [];
      const innerResolveDelay = 150;
      const innerRejectDelay = 300;
      const outerRejectDelay = 550;
      const successValue1 = 'InnerSettledResolveAgain';
      const rejectReason1 = 'InnerSettledRejectAgain';
      const rejectReason2 = 'OuterReject';
      const innerAllSettled = Promise.allSettled<[Promise<string>, Promise<string>]>([
        new Promise<string>((resolve) =>{
          setTimeout(() =>{
            arr.push(1);
            resolve(successValue1)
          }, innerResolveDelay)
        }),
        new Promise<string>((_, reject) =>{
          setTimeout(() =>{
            arr.push(2);
            reject(new Error(rejectReason1))
          }, innerRejectDelay)
        })
      ]);
      const outerReject = new Promise<string>((_, reject) =>{
        setTimeout(() =>{
          arr.push(3);
          reject(new Error(rejectReason2))
        }, outerRejectDelay)
      });
      console.info(`${caseName} Created nested any([allSettled([resolve, reject]), reject2]).`);
      try {
        arr.push(4);
        const result = await Promise.any<PromiseSettledResult<string>[] | string>([innerAllSettled, outerReject]);
        const endTime = Date.now();
        const duration = endTime - startTime;
        console.info(`${caseName} Outer Promise.any resolved.`);
        console.info(`${caseName} Duration: ${duration}ms`);
        const settlementArray = result as PromiseSettledResult<string>[];
        expect(Array.isArray(settlementArray)).assertTrue();
        expect(settlementArray.length).assertEqual(2);
        const firstResult = settlementArray[0];
        expect(firstResult.status).assertEqual('fulfilled');
        if (firstResult.status === 'fulfilled') {
          expect(firstResult.value).assertEqual(successValue1);
        } else {
          expect(false).assertTrue();
        }
        const secondResult = settlementArray[1];
        expect(secondResult.status).assertEqual('rejected');
        if (secondResult.status === 'rejected') {
          expect(secondResult.reason instanceof Error).assertTrue();
          expect((secondResult.reason as Error).message).assertEqual(rejectReason1);
        } else {
          expect(false).assertTrue();
        }
      } catch (error) {
        arr.push(5);
        console.error(`${caseName} Outer Promise.any unexpectedly rejected: ${error}`);
        expect(false).assertTrue();
      } finally {
        expect(JSON.stringify(arr)).assertEqual('[4,1,2]');
        console.info(`${caseName} test end`);
        done();
      }
    });


    /**
     * @tc.name   PromiseAnyTest2200
     * @tc.number SUB_PROMISE_ANY_TEST_2200
     * @tc.desc   Test execution order: Promise.any creation -> p1.then attachment -> anyPromise.then attachment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAnyTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseAnyTest2200';
      const executionOrder: string[] = [];
      let expectedOrder: string[] = [];
      const p1Delay = 150;
      const overallDelay = 350;
      executionOrder.push('start');
      const p1 = new Promise<string>((resolve) => {
        executionOrder.push('p1 created');
        setTimeout(() => {
          executionOrder.push('p1 resolving');
          resolve('p1 resolved value');
        }, p1Delay);
      });
      const p2 = Promise.resolve('p2 immediate value');
      executionOrder.push('p2 created');
      executionOrder.push('any creation');
      const anyPromise = Promise.any([p1, p2]);
      p1.then(() => {
        executionOrder.push('p1 then executed');
      });
      executionOrder.push('p1 then attached');
      anyPromise
        .then((value) => {
          executionOrder.push('any then 1 executed');
          expect(value).assertEqual('p2 immediate value');
          return 'from any then 1';
        })
        .then((value) => {
          executionOrder.push('any then 2 executed');
          expect(value).assertEqual('from any then 1');
        });
      executionOrder.push('any thens attached');

      try {
        executionOrder.push('awaiting any');
        const result = await anyPromise;

        await sleep(0);
        executionOrder.push('after microtask wait');

        executionOrder.push('any awaited');
        expect(result).assertEqual('p2 immediate value');

        await sleep(overallDelay);
        executionOrder.push('final wait complete');

        expectedOrder = [
          'start',
          'p1 created',
          'p2 created',
          'any creation',
          'p1 then attached',
          'any thens attached',
          'awaiting any',
          'any then 1 executed',
          'any then 2 executed',
          'after microtask wait',
          'any awaited',
          'p1 resolving',
          'p1 then executed',
          'final wait complete'
        ];

        expect(JSON.stringify(executionOrder)).assertEqual(JSON.stringify(expectedOrder));

      } catch (error) {
        console.error(`${caseName} Test failed with error: ${error?.message || error}`);
        console.error(`Expected: ${JSON.stringify(expectedOrder)}`);
        console.error(`Actual:   ${JSON.stringify(executionOrder)}`);
        expect(true).assertFalse();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseAnyTest2300
     * @tc.number SUB_PROMISE_ANY_TEST_2300
     * @tc.desc   Test execution order: any -> any.then -> p1.then attachment.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAnyTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseAnyTest2300';
      const executionOrder: string[] = [];
      let expectedOrder: string[] = [];
      const p1Delay = 150;
      const overallDelay = 350;
      executionOrder.push('start');

      const p1 = new Promise<string>((resolve) => {
        executionOrder.push('p1 created');
        setTimeout(() => {
          executionOrder.push('p1 resolving');
          resolve('p1 resolved value');
        }, p1Delay);
      });

      const p2 = Promise.resolve('p2 immediate value');
      executionOrder.push('p2 created');

      executionOrder.push('any creation');
      const anyPromise = Promise.any([p1, p2]);

      anyPromise
        .then((value) => {
          executionOrder.push('any then 1 executed');
          expect(value).assertEqual('p2 immediate value');
          return 'from any then 1';
        })
        .then((value) => {
          executionOrder.push('any then 2 executed');
          expect(value).assertEqual('from any then 1');
        });
      executionOrder.push('any thens attached');

      p1.then(() => {
        executionOrder.push('p1 then executed');
      });
      executionOrder.push('p1 then attached');

      try {
        executionOrder.push('awaiting any');
        const result = await anyPromise;

        await sleep(0);
        executionOrder.push('after microtask wait');

        executionOrder.push('any awaited');
        expect(result).assertEqual('p2 immediate value');

        await sleep(overallDelay);
        executionOrder.push('final wait complete');

        expectedOrder = [
          'start',
          'p1 created',
          'p2 created',
          'any creation',
          'any thens attached',
          'p1 then attached',
          'awaiting any',
          'any then 1 executed',
          'any then 2 executed',
          'after microtask wait',
          'any awaited',
          'p1 resolving',
          'p1 then executed',
          'final wait complete'
        ];

        expect(JSON.stringify(executionOrder)).assertEqual(JSON.stringify(expectedOrder));

      } catch (error) {
        console.error(`${caseName} Test failed with error: ${error?.message || error}`);
        console.error(`Expected: ${JSON.stringify(expectedOrder)}`);
        console.error(`Actual:   ${JSON.stringify(executionOrder)}`);
        expect(true).assertFalse();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseAnyTest2400
     * @tc.number SUB_PROMISE_ANY_TEST_2400
     * @tc.desc   Test execution order: p1.then -> any creation -> any.then attachment.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAnyTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseAnyTest2400';
      const executionOrder: string[] = [];
      let expectedOrder: string[] = [];
      const p1Delay = 150;
      const overallDelay = 350;
      executionOrder.push('start');
      const p1 = new Promise<string>((resolve) => {
        executionOrder.push('p1 created');
        setTimeout(() => {
          executionOrder.push('p1 resolving');
          resolve('p1 resolved value');
        }, p1Delay);
      });

      const p2 = Promise.resolve('p2 immediate value');
      executionOrder.push('p2 created');

      p1.then(() => {
        executionOrder.push('p1 then executed');
      });
      executionOrder.push('p1 then attached');

      executionOrder.push('any creation');
      const anyPromise = Promise.any([p1, p2]);

      anyPromise
        .then((value) => {
          executionOrder.push('any then 1 executed');
          expect(value).assertEqual('p2 immediate value');
          return 'from any then 1';
        })
        .then((value) => {
          executionOrder.push('any then 2 executed');
          expect(value).assertEqual('from any then 1');
        });
      executionOrder.push('any thens attached');

      try {
        executionOrder.push('awaiting any');
        const result = await anyPromise;

        await sleep(0);
        executionOrder.push('after microtask wait');

        executionOrder.push('any awaited');
        expect(result).assertEqual('p2 immediate value');

        await sleep(overallDelay);
        executionOrder.push('final wait complete');

        expectedOrder = [
          'start',
          'p1 created',
          'p2 created',
          'p1 then attached',
          'any creation',
          'any thens attached',
          'awaiting any',
          'any then 1 executed',
          'any then 2 executed',
          'after microtask wait',
          'any awaited',
          'p1 resolving',
          'p1 then executed',
          'final wait complete'
        ];

        expect(JSON.stringify(executionOrder)).assertEqual(JSON.stringify(expectedOrder));

      } catch (error) {
        console.error(`${caseName} Test failed with error: ${error?.message || error}`);
        console.error(`Expected: ${JSON.stringify(expectedOrder)}`);
        console.error(`Actual:   ${JSON.stringify(executionOrder)}`);
        expect(true).assertFalse();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseAnyTest2500
     * @tc.number SUB_PROMISE_ANY_TEST_2500
     * @tc.desc   Test execution order: p1.then(throws) -> any -> any.then.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAnyTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseAnyTest2500';
      const executionOrder: string[] = [];
      let expectedOrder: string[] = [];
      const p1Delay = 150;
      const overallDelay = 350;
      const p1ThenErrorMessage = 'Error thrown in p1.then';
      executionOrder.push('start');

      const p1 = new Promise<string>((resolve) => {
        executionOrder.push('p1 created');
        setTimeout(() => {
          executionOrder.push('p1 resolving');
          resolve('p1 resolved value');
        }, p1Delay);
      });
      const p2 = Promise.resolve('p2 immediate value');
      executionOrder.push('p2 created');

      p1.then(() => {
        console.info(`${caseName}: Inside p1.then, about to throw...`);
        throw new Error(p1ThenErrorMessage);
      });
      executionOrder.push('p1 then attached');

      executionOrder.push('any creation');
      const anyPromise = Promise.any([p1, p2]);

      anyPromise
        .then((value) => {
          executionOrder.push('any then 1 executed');
          expect(value).assertEqual('p2 immediate value');
          return 'from any then 1';
        })
        .then((value) => {
          executionOrder.push('any then 2 executed');
          expect(value).assertEqual('from any then 1');
        });
      executionOrder.push('any thens attached');

      try {
        executionOrder.push('awaiting any');
        const result = await anyPromise;
        await sleep(0);
        executionOrder.push('after microtask wait');
        executionOrder.push('any awaited');
        expect(result).assertEqual('p2 immediate value');
        await sleep(overallDelay);
        executionOrder.push('final wait complete');
        expectedOrder = [
          'start',
          'p1 created',
          'p2 created',
          'p1 then attached',
          'any creation',
          'any thens attached',
          'awaiting any',
          'any then 1 executed',
          'any then 2 executed',
          'after microtask wait',
          'any awaited',
          'p1 resolving',
          'final wait complete'
        ];

        expect(JSON.stringify(executionOrder)).assertEqual(JSON.stringify(expectedOrder));

      } catch (error) {
        console.error(`${caseName} Test failed unexpectedly in main catch block: ${error?.message || error}`);
        console.error(`Expected: ${JSON.stringify(expectedOrder)}`);
        console.error(`Actual:   ${JSON.stringify(executionOrder)}`);
        expect(true).assertFalse();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   PromiseAnyTest2600
     * @tc.number SUB_PROMISE_ANY_TEST_2600
     * @tc.desc   Test execution order: p1.then(throws) -> any -> any.then.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAnyTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName = 'PromiseAnyTest2600';
      const executionOrder: string[] = [];
      let expectedOrder: string[] = [];
      const p1Delay = 150;
      const overallDelay = 350;
      const p1ThenErrorMessage = 'Error intentionally thrown in p1.then';
      executionOrder.push('start');

      const p1 = new Promise<string>((resolve) => {
        executionOrder.push('p1 created');
        setTimeout(() => {
          executionOrder.push('p1 resolving');
          resolve('p1 resolved value');
        }, p1Delay);
      });

      const p2 = Promise.resolve('p2 immediate value');
      executionOrder.push('p2 created');

      p1.then(() => {
        executionOrder.push('p1 then executed (throws)');
        throw new Error(p1ThenErrorMessage);
      }).catch(() => {
        console.warn(`${caseName}: Caught expected error from p1.then: ${p1ThenErrorMessage}`);
      });
      executionOrder.push('p1 then attached');

      executionOrder.push('any creation');
      const anyPromise = Promise.any([p1, p2]);

      anyPromise
        .then((value) => {
          executionOrder.push('any then 1 executed');
          expect(value).assertEqual('p2 immediate value');
          return 'from any then 1';
        })
        .then((value) => {
          executionOrder.push('any then 2 executed');
          expect(value).assertEqual('from any then 1');
        });
      executionOrder.push('any thens attached');

      try {
        executionOrder.push('awaiting any');
        const result = await anyPromise;

        await sleep(0);
        executionOrder.push('after microtask wait');

        executionOrder.push('any awaited');
        expect(result).assertEqual('p2 immediate value');

        await sleep(overallDelay);
        executionOrder.push('final wait complete');

        expectedOrder = [
          'start',
          'p1 created',
          'p2 created',
          'p1 then attached',
          'any creation',
          'any thens attached',
          'awaiting any',
          'any then 1 executed',
          'any then 2 executed',
          'after microtask wait',
          'any awaited',
          'p1 resolving',
          'p1 then executed (throws)',
          'final wait complete'
        ];

        expect(JSON.stringify(executionOrder)).assertEqual(JSON.stringify(expectedOrder));

      } catch (error) {
        console.error(`${caseName} Test failed unexpectedly in main catch block: ${error?.message || error}`);
        console.error(`Expected: ${JSON.stringify(expectedOrder)}`);
        console.error(`Actual:   ${JSON.stringify(executionOrder)}`);
        expect(true).assertFalse();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

  });
}