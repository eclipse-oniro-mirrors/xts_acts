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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Size, Level, TestType } from "@ohos/hypium";
import { sleep } from "../testability/pages/TestUtils";

export default function PromiseAllSettledSecondTest() {
  describe('PromiseAllSettledSecondTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })


    /**
     * @tc.number SUB_PROMISE_ALLSETTLED_TEST_3000
     * @tc.name PromiseAllSettledTest3000
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllSettledTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllSettledTest3000';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<PromiseSettledResult<string | number>[]>[] = [];
        const successPromise1: Promise<string> = new Promise((resolve) => {
          setTimeout(() => {
            resolve('Success 1');
            arr.push(1);
          }, 800);
        });
        const failurePromise: Promise<number> = new Promise((_, reject) => {
          setTimeout(() => {
            reject(new Error('Failure in test'));
            arr.push(2);
          }, 1200);
        });
        const successPromise2: Promise<number> = new Promise((resolve) => {
          setTimeout(() => {
            resolve(100);
            arr.push(3);
          }, 1000);
        });
        const successPromise2WithError = successPromise2.then((result) => {
          arr.push(4);
          console.log('Second single Promise then executed, result:', result);
          throw new Error('Error in second then');
        }).catch((error: Error) => {
          arr.push(5);
          errorMessage = error.message;
          console.log('Error in second single Promise then, error message:', errorMessage);
          return Promise.reject(error);
        });
        const allSettledPromise = Promise.allSettled([successPromise1, failurePromise, successPromise2WithError]);
        taskPromises.push(allSettledPromise);
        allSettledPromise.then((results) => {
          arr.push(6);
          console.log('Promise.allSettled then executed, result:', results);
          if (results.every(result => result.status === 'rejected')) {
            errorMessage = 'All promises were rejected';
          } else {
            successMessage = 'success';
          }
          return results;
        }).catch((error: Error) => {
          arr.push(7);
          errorMessage = error.message;
          console.log('Error in Promise.allSettled then, error message:', errorMessage);
        });
        await sleep(400);
        await Promise.all(taskPromises);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,3,4,5,2,6]');
          expect(errorMessage).assertEqual('Error in second then');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,2,3,4,6]');
          expect(successMessage).assertEqual('success');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_ALLSETTLED_TEST_3100
     * @tc.name PromiseAllSettledTest3100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllSettledTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllSettledTest3100';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<PromiseSettledResult<string | number>[]>[] = [];
        const failedPromise: Promise<string> = new Promise((_, reject) => {
          setTimeout(() => {
            reject(new Error('Promise failed'));
            arr.push(1);
          }, 500);
        });
        const successPromise: Promise<string> = new Promise((resolve) => {
          setTimeout(() => {
            resolve('Promise succeeded');
            arr.push(2);
          }, 300);
        });
        const allSettledPromise = Promise.allSettled([failedPromise, successPromise]);
        taskPromises.push(allSettledPromise);
        allSettledPromise.catch((error: Error) => {
          arr.push(3);
          errorMessage = error.message;
          console.log('First catch (usually won\'t execute):', errorMessage);
        });
        const processPromiseResult = allSettledPromise.then((results) => {
          arr.push(4);
          console.log('Promise.allSettled then executed, result:', results);
          throw new Error('Error during result processing');
        });
        processPromiseResult.catch((error: Error) => {
          arr.push(5);
          errorMessage = error.message;
          console.log('Second catch (after result processing error):', errorMessage);
        });
        await sleep(800);
        await Promise.all(taskPromises);
        expect(JSON.stringify(arr)).assertEqual('[2,1,4,5]');
        expect(errorMessage).assertEqual('Error during result processing');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_ALLSETTLED_TEST_3200
     * @tc.name PromiseAllSettledTest3200
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllSettledTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllSettledTest3200';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<PromiseSettledResult<string | boolean>[]>[] = [];
        const quickSuccessPromise: Promise<string> = new Promise((resolve) => {
          setTimeout(() => {
            resolve('Quick Success');
            arr.push(1);
          }, 300);
        });
        const longFailurePromise: Promise<boolean> = new Promise((_, reject) => {
          setTimeout(() => {
            reject(new Error('Long running operation failed'));
            arr.push(2);
          }, 1500);
        });
        const delayedSuccessPromise: Promise<string> = new Promise((resolve) => {
          setTimeout(() => {
            resolve('Delayed Success');
            arr.push(3);
          }, 1000);
        });
        const delayedSuccessWithCatch = delayedSuccessPromise.then((result) => {
          arr.push(4);
          console.log('Delayed single Promise then executed, result:', result);
          throw new Error('Error in delayed promise');
        }).catch((error: Error) => {
          arr.push(5);
          errorMessage = error.message;
          console.log('Error in delayed single Promise then, error message:', errorMessage);
          return Promise.reject(error);
        });
        const allSettledPromise =
          Promise.allSettled([quickSuccessPromise, longFailurePromise, delayedSuccessWithCatch]);
        taskPromises.push(allSettledPromise);
        allSettledPromise.then((results) => {
          arr.push(6);
          console.log('Promise.allSettled then executed, result:', results);
          if (results.every(result => result.status === 'rejected')) {
            errorMessage = 'All promises were rejected';
          } else {
            successMessage = 'success';
          }
          return results;
        }).catch((error: Error) => {
          arr.push(7);
          errorMessage = error.message;
          console.log('Error in Promise.allSettled then, error message:', errorMessage);
        });
        await sleep(1800);
        await Promise.all(taskPromises);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,3,4,5,2,6]');
          expect(errorMessage).assertEqual('Error in delayed promise');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,3,4,2,6]');
          expect(successMessage).assertEqual('success');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_ALLSETTLED_TEST_3300
     * @tc.name PromiseAllSettledTest3300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllSettledTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllSettledTest3300';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<PromiseSettledResult<string | number>[]>[] = [];
        const basePromise1: Promise<string> = new Promise((resolve) => {
          setTimeout(() => {
            resolve('Base Promise 1 Resolved');
            arr.push(1);
          }, 800);
        });
        const basePromise2: Promise<number> = new Promise((_, reject) => {
          setTimeout(() => {
            reject(new Error('Base Promise 2 Rejected'));
            arr.push(2);
          }, 1200);
        });
        const processedPromise1 = basePromise1.then((result) => {
          arr.push(3);
          console.log('Base Promise 1 then executed, result:', result);
          return result;
        });
        const processedPromise2 = basePromise2.then((result) => {
          arr.push(4);
          console.log('Base Promise 2 then executed, result:', result);
          return result;
        }).catch((error: Error) => {
          arr.push(5);
          errorMessage = error.message;
          console.log('Error in Base Promise 2 catch, error message:', errorMessage);
          return Promise.reject(error);
        });
        const allSettledPromise = Promise.allSettled([processedPromise1, processedPromise2]);
        taskPromises.push(allSettledPromise);
        allSettledPromise.finally(() => {
          arr.push(6);
          console.log('Promise.allSettled finally executed');
          throw new Error('Error thrown in finally');
        }).then(() => {
          arr.push(7);
          console.log('Promise.allSettled then after finally (won\'t execute)');
        }).catch((error: Error) => {
          arr.push(8);
          errorMessage = error.message;
          console.log('Error caught after Promise.allSettled finally, error message:', errorMessage);
        });
        allSettledPromise.then((results) => {
          arr.push(9);
          console.log('Promise.allSettled then executed, result:', results);
          if (results.every(result => result.status === 'rejected')) {
            errorMessage = 'All promises were rejected';
          } else {
            successMessage = 'success';
          }
          return results;
        });
        await sleep(1500);
        await Promise.all(taskPromises);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,3,2,5,6,9,8]');
          expect(errorMessage).assertEqual('Error thrown in finally');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,2,3,5,6,9]');
          expect(successMessage).assertEqual('success');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_ALLSETTLED_TEST_3400
     * @tc.name PromiseAllSettledTest3400
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllSettledTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllSettledTest3400';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<PromiseSettledResult<string | number>[]>[] = [];
        const promise1: Promise<string> = new Promise((resolve) => {
          setTimeout(() => {
            resolve('Promise 1 resolved');
            arr.push(1);
          }, 800);
        });
        const promise2: Promise<number> = new Promise((_, reject) => {
          setTimeout(() => {
            reject(new Error('Promise 2 rejected'));
            arr.push(2);
          }, 1200);
        });
        const processedPromise1 = promise1.then((result) => {
          arr.push(3);
          console.log('Promise 1 then executed, result:', result);
          return result;
        }).finally(() => {
          arr.push(4);
          console.log('Promise 1 finally executed');
          throw new Error('Error thrown in Promise 1 finally');
        }).catch((error: Error) => {
          arr.push(5);
          errorMessage = error.message;
          console.log('Error caught in Promise 1 finally catch, error message:', errorMessage);
          return Promise.reject(error);
        });
        const processedPromise2 = promise2.then((result) => {
          arr.push(6);
          console.log('Promise 2 then executed, result:', result);
          return result;
        }).catch((error: Error) => {
          arr.push(7);
          errorMessage = error.message;
          console.log('Error caught in Promise 2 catch, error message:', errorMessage);
          return Promise.reject(error);
        }).finally(() => {
          arr.push(8);
          console.log('Promise 2 finally executed');
          throw new Error('Error thrown in Promise 2 finally');
        }).catch((error: Error) => {
          arr.push(9);
          errorMessage = error.message;
          console.log('Error caught in Promise 2 finally catch, error message:', errorMessage);
          return Promise.reject(error);
        });
        const allSettledPromise = Promise.allSettled([processedPromise1, processedPromise2]);
        taskPromises.push(allSettledPromise);
        allSettledPromise.then((results) => {
          arr.push(10);
          console.log('Promise.allSettled then executed, result:', results);
          if (results.every(result => result.status === 'rejected')) {
            errorMessage = 'All promises were rejected';
          } else {
            successMessage = 'success';
          }
          return results;
        });
        await sleep(1500);
        await Promise.all(taskPromises);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,3,4,5,2,7,8,9,10]');
          expect(errorMessage).assertEqual('All promises were rejected');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,2,3,4,6,8,10]');
          expect(successMessage).assertEqual('success');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_ALLSETTLED_TEST_3500
     * @tc.name PromiseAllSettledTest3500
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllSettledTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllSettledTest3500';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<PromiseSettledResult<string | number>[]>[] = [];
        const promise1: Promise<string> = new Promise((resolve) => {
          setTimeout(() => {
            resolve('Promise 1 resolved');
            arr.push(1);
          }, 500);
        });
        const promise2: Promise<number> = new Promise((_, reject) => {
          setTimeout(() => {
            reject(new Error('Promise 2 rejected'));
            arr.push(2);
          }, 800);
        });
        const processedPromise1 = promise1.then((result) => {
          arr.push(3);
          console.log('Promise 1 then executed, result:', result);
          return result;
        }).finally(() => {
          arr.push(4);
          console.log('Promise 1 finally executed');
        });
        const processedPromise2 = promise2.then((result) => {
          arr.push(5);
          console.log('Promise 2 then executed, result:', result);
          return result;
        }).catch((error: Error) => {
          arr.push(6);
          errorMessage = error.message;
          console.log('Error caught in Promise 2 catch, error message:', errorMessage);
          return Promise.reject(error);
        }).finally(() => {
          arr.push(7);
          console.log('Promise 2 finally executed');
        });
        const allSettledPromise = Promise.allSettled([processedPromise1, processedPromise2]);
        taskPromises.push(allSettledPromise);
        allSettledPromise.then((results) => {
          arr.push(8);
          console.log('Promise.allSettled then executed, result:', results);
          if (results.every(result => result.status === 'rejected')) {
            errorMessage = 'All promises were rejected';
          } else {
            successMessage = 'success';
          }
          return results;
        });
        await sleep(1000);
        await Promise.all(taskPromises);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,3,4,2,6,7,8]');
          expect(errorMessage).assertEqual('Promise 2 rejected');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,2,3,4,5,7,8]');
          expect(successMessage).assertEqual('success');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_ALLSETTLED_TEST_3600
     * @tc.name PromiseAllSettledTest3600
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllSettledTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllSettledTest3600';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<PromiseSettledResult<string | number>[]>[] = [];
        const promise1: Promise<string> = new Promise((_, reject) => {
          setTimeout(() => {
            reject(new Error('Promise 1 rejected'));
            arr.push(1);
          }, 500);
        });
        const promise2: Promise<number> = new Promise((_, reject) => {
          setTimeout(() => {
            reject(new Error('Promise 2 rejected'));
            arr.push(2);
          }, 800);
        });
        const allSettledPromise = Promise.allSettled([promise1, promise2]);
        taskPromises.push(allSettledPromise);
        allSettledPromise.finally(() => {
          arr.push(3);
          console.log('Promise.allSettled finally executed');
          throw new Error('Error thrown in finally');
        }).catch((error: Error) => {
          arr.push(4);
          errorMessage = error.message;
          console.log('Error caught in finally catch, error message:', errorMessage);
        });
        allSettledPromise.then((results) => {
          arr.push(5);
          console.log('Promise.allSettled then executed, result:', results);
          if (results.every(result => result.status === 'rejected')) {
            errorMessage = 'All promises were rejected';
          } else {
            successMessage = 'success';
          }
          return results;
        });
        await sleep(1000);
        await Promise.all(taskPromises);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,2,3,5,4]');
          expect(errorMessage).assertEqual('Error thrown in finally');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,2,3,5]');
          expect(successMessage).assertEqual('success');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_ALLSETTLED_TEST_3700
     * @tc.name PromiseAllSettledTest3700
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllSettledTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllSettledTest3700';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<PromiseSettledResult<string | number>[]>[] = [];
        const promise1: Promise<string> = new Promise((_, reject) => {
          setTimeout(() => {
            reject(new Error('Promise 1 rejected'));
            arr.push(1);
          }, 500);
        });
        const promise2: Promise<number> = new Promise((_, reject) => {
          setTimeout(() => {
            reject(new Error('Promise 2 rejected'));
            arr.push(2);
          }, 800);
        });
        const processedPromise1 = promise1.finally(() => {
          arr.push(3);
          console.log('Promise 1 finally executed');
          throw new Error('Error thrown in Promise 1 finally');
        }).catch((error: Error) => {
          arr.push(4);
          errorMessage = error.message;
          console.log('Error caught in Promise 1 finally catch, error message:', errorMessage);
          return Promise.reject(error);
        });
        const processedPromise2 = promise2.finally(() => {
          arr.push(5);
          console.log('Promise 2 finally executed');
          throw new Error('Error thrown in Promise 2 finally');
        }).catch((error: Error) => {
          arr.push(6);
          errorMessage = error.message;
          console.log('Error caught in Promise 2 finally catch, error message:', errorMessage);
          return Promise.reject(error);
        });
        const allSettledPromise = Promise.allSettled([processedPromise1, processedPromise2]);
        taskPromises.push(allSettledPromise);
        allSettledPromise.then((results) => {
          arr.push(7);
          console.log('Promise.allSettled then executed, result:', results);
          if (results.every(result => result.status === 'rejected')) {
            errorMessage = 'All promises were rejected';
          } else {
            successMessage = 'success';
          }
          return results;
        });
        await sleep(1000);
        await Promise.all(taskPromises);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,3,4,2,5,6,7]');
          expect(errorMessage).assertEqual('All promises were rejected');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,2,3,5,7]');
          expect(successMessage).assertEqual('success');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_ALLSETTLED_TEST_3800
     * @tc.name PromiseAllSettledTest3800
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllSettledTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllSettledTest3800';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<PromiseSettledResult<string | number>[]>[] = [];
        const promise1: Promise<string> = new Promise((_, reject) => {
          setTimeout(() => {
            reject(new Error('Promise 1 rejected'));
            arr.push(1);
          }, 300);
        });
        const promise2: Promise<number> = new Promise((_, reject) => {
          setTimeout(() => {
            reject(new Error('Promise 2 rejected'));
            arr.push(2);
          }, 600);
        });
        const processedPromise1 = promise1.finally(() => {
          arr.push(3);
          console.log('Promise 1 finally executed');
        }).catch((error: Error) => {
          arr.push(4);
          errorMessage = error.message;
          console.log('Error caught in Promise 1 catch, error message:', errorMessage);
          return Promise.reject(error);
        });
        const processedPromise2 = promise2.finally(() => {
          arr.push(5);
          console.log('Promise 2 finally executed');
        }).catch((error: Error) => {
          arr.push(6);
          errorMessage = error.message;
          console.log('Error caught in Promise 2 catch, error message:', errorMessage);
          return Promise.reject(error);
        });
        const allSettledPromise = Promise.allSettled([processedPromise1, processedPromise2]);
        taskPromises.push(allSettledPromise);
        allSettledPromise.then((results) => {
          arr.push(7);
          console.log('Promise.allSettled then executed, result:', results);
          if (results.every(result => result.status === 'rejected')) {
            errorMessage = 'All promises were rejected';
          } else {
            successMessage = 'success';
          }
          return results;
        });
        await sleep(800);
        await Promise.all(taskPromises);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,3,4,2,5,6,7]');
          expect(errorMessage).assertEqual('All promises were rejected');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,2,3,5,7]');
          expect(successMessage).assertEqual('success');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_ALLSETTLED_TEST_3900
     * @tc.name PromiseAllSettledTest3900
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllSettledTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllSettledTest3900';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<PromiseSettledResult<string | number>[]>[] = [];
        const promise1: Promise<string> = new Promise((resolve) => {
          setTimeout(() => {
            resolve('Promise 1 resolved');
            arr.push(1);
          }, 300);
        });
        const promise2: Promise<number> = new Promise((resolve) => {
          setTimeout(() => {
            resolve(100);
            arr.push(2);
          }, 600);
        });
        const processedPromise1 = promise1.then((result) => {
          arr.push(3);
          console.log('Promise 1 then executed, result:', result);
          throw new Error('Error thrown in Promise 1 then');
        }).catch((error: Error) => {
          arr.push(4);
          errorMessage = error.message;
          console.log('Error caught in Promise 1 catch, error message:', errorMessage);
          return Promise.reject(error);
        });
        const processedPromise2 = promise2.then((result) => {
          arr.push(5);
          console.log('Promise 2 then executed, result:', result);
          return result;
        });
        const allSettledPromise = Promise.allSettled([processedPromise1, processedPromise2]);
        taskPromises.push(allSettledPromise);
        allSettledPromise.then((results) => {
          arr.push(6);
          console.log('Promise.allSettled then executed, result:', results);
          if (results.every(result => result.status === 'rejected')) {
            errorMessage = 'All promises were rejected';
          } else {
            successMessage = 'success';
          }
          return results;
        });
        await sleep(800);
        await Promise.all(taskPromises);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,3,4,2,5,6]');
          expect(errorMessage).assertEqual('Error thrown in Promise 1 then');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,2,3,5,6]');
          expect(successMessage).assertEqual('success');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_ALLSETTLED_TEST_4000
     * @tc.name PromiseAllSettledTest4000
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllSettledTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllSettledTest4000';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<PromiseSettledResult<string | number>[]>[] = [];
        const promise1: Promise<string> = new Promise((resolve) => {
          setTimeout(() => {
            resolve('Promise 1 resolved');
            arr.push(1);
          }, 400);
        });
        const promise2: Promise<number> = new Promise((resolve) => {
          setTimeout(() => {
            resolve(200);
            arr.push(2);
          }, 700);
        });
        const allSettledPromise = Promise.allSettled([promise1, promise2]);
        taskPromises.push(allSettledPromise);
        const allSettledWithException = allSettledPromise.then((results: PromiseSettledResult<string | number>[]) => {
          arr.push(3);
          console.log('Promise.allSettled then executed initially, result:', results);
          throw new Error('Error thrown in Promise.allSettled then');
        }).catch((error: Error) => {
          arr.push(4);
          errorMessage = error.message;
          console.log('Error caught in Promise.allSettled then catch, error message:', errorMessage);
          return Promise.reject(error);
        });
        allSettledWithException.then((results: PromiseSettledResult<string | number>[]) => {
          arr.push(5);
          console.log('Promise.allSettled then executed again, result:', results);
          let allRejected = true;
          for (let i = 0; i < results.length; i++) {
            if (results[i].status !== 'rejected') {
              allRejected = false;
              break;
            }
          }
          if (allRejected) {
            errorMessage = 'All promises were rejected';
          } else {
            successMessage = 'success';
          }
          return results;
        });
        await sleep(900);
        await Promise.all(taskPromises);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,2,3,4]');
          expect(errorMessage).assertEqual('Error thrown in Promise.allSettled then');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,2,3,5]');
          expect(successMessage).assertEqual('success');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_ALLSETTLED_TEST_4100
     * @tc.name PromiseAllSettledTest4100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllSettledTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllSettledTest4100';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<PromiseSettledResult<string | number>[]>[] = [];
        const promise1: Promise<string> = new Promise((resolve) => {
          setTimeout(() => {
            resolve('Promise 1 resolved');
            arr.push(1);
          }, 300);
        });
        const promise2: Promise<number> = new Promise((resolve) => {
          setTimeout(() => {
            resolve(200);
            arr.push(2);
          }, 600);
        });
        const allSettledPromise = Promise.allSettled([promise1, promise2]);
        taskPromises.push(allSettledPromise);
        allSettledPromise.then((results: PromiseSettledResult<string | number>[]) => {
          arr.push(3);
          console.log('Promise.allSettled then executed, result:', results);
          throw new Error('Error thrown in Promise.allSettled then');
        }).catch((error: Error) => {
          arr.push(4);
          errorMessage = error.message;
          console.log('Error caught in Promise.allSettled then catch, error message:', errorMessage);
        });
        await sleep(800);
        await Promise.all(taskPromises);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,2,3,4]');
          expect(errorMessage).assertEqual('Error thrown in Promise.allSettled then');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,2,3]');
          expect(successMessage).assertEqual('success');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_ALLSETTLED_TEST_4200
     * @tc.name PromiseAllSettledTest4200
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllSettledTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllSettledTest4200';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<PromiseSettledResult<string | number>[]>[] = [];
        let resolvePromise1: (value: string) => void;
        const promise1: Promise<string> = new Promise((resolve) => {
          resolvePromise1 = resolve;
        });
        let resolvePromise2: (value: number) => void;
        const promise2: Promise<number> = new Promise((resolve) => {
          resolvePromise2 = resolve;
        });
        const allSettledPromise = Promise.allSettled([promise1, promise2]);
        taskPromises.push(allSettledPromise);
        setTimeout(() => {
          resolvePromise1('Promise 1 resolved');
          arr.push(1);
        }, 300);
        allSettledPromise.then((results: PromiseSettledResult<string | number>[]) => {
          arr.push(2);
          console.log('Promise.allSettled then executed, result:', results);
          if (results.some(result => result.status === 'rejected')) {
            throw new Error('Some promises were rejected');
          }
          successMessage = 'success';
          return results;
        }).catch((error: Error) => {
          arr.push(3);
          errorMessage = error.message;
          console.log('Error caught in Promise.allSettled catch, error message:', errorMessage);
        });
        setTimeout(() => {
          resolvePromise2(200);
          arr.push(4);
          promise2.then((result) => {
            arr.push(5);
            console.log('Promise 2 then executed, result:', result);
          });
        }, 600);
        await sleep(800);
        await Promise.all(taskPromises);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,2,3,4,5]');
          expect(errorMessage).assertEqual('Some promises were rejected');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,4,5,2]');
          expect(successMessage).assertEqual('success');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_ALLSETTLED_TEST_4300
     * @tc.name PromiseAllSettledTest4300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllSettledTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllSettledTest4300';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<PromiseSettledResult<string | number>[]>[] = [];
        let resolvePromise1: (value: string) => void;
        const promise1: Promise<string> = new Promise((resolve) => {
          resolvePromise1 = resolve;
        });
        let rejectPromise2: (reason: Error) => void;
        const promise2: Promise<number> = new Promise((_, reject) => {
          rejectPromise2 = reject;
        });
        const allSettledPromise = Promise.allSettled([promise1, promise2]);
        taskPromises.push(allSettledPromise);
        allSettledPromise.then((results: PromiseSettledResult<string | number>[]) => {
          arr.push(1);
          console.log('Promise.allSettled then executed, result:', results);
          if (results.some(result => result.status === 'rejected')) {
            throw new Error('Some promises were rejected');
          }
          successMessage = 'success';
          return results;
        }).catch((error: Error) => {
          arr.push(2);
          errorMessage = error.message;
          console.log('Error caught in Promise.allSettled catch, error message:', errorMessage);
        });
        setTimeout(() => {
          resolvePromise1('Promise 1 resolved');
          arr.push(3);
          promise1.then((result) => {
            arr.push(4);
            console.log('Promise 1 then executed, result:', result);
          });
        }, 300);
        setTimeout(() => {
          rejectPromise2(new Error('Promise 2 rejected'));
          arr.push(5);
          promise2.catch((error: Error) => {
            arr.push(6);
            console.log('Promise 2 catch executed, error message:', error.message);
          });
        }, 600);
        await sleep(800);
        await Promise.all(taskPromises);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[3,4,5,6,1,2]');
          expect(errorMessage).assertEqual('Some promises were rejected');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,3,4,5,6]');
          expect(successMessage).assertEqual('success');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_ALLSETTLED_TEST_4400
     * @tc.name PromiseAllSettledTest4400
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllSettledTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllSettledTest4400';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<PromiseSettledResult<string | number>[]>[] = [];
        const promise1 = new Promise<string>((resolve) => {
          setTimeout(() => {
            resolve('Promise 1 resolved');
            arr.push(1);
          }, 500);
        });
        const promise2 = new Promise<number>((_, reject) => {
          setTimeout(() => {
            reject(new Error('Promise 2 rejected'));
            arr.push(2);
          }, 800);
        });
        const allSettledPromise = Promise.allSettled([promise1, promise2]);
        taskPromises.push(allSettledPromise);
        allSettledPromise.then((results) => {
          arr.push(3);
          console.log('Promise.allSettled then executed, result:', results);
          if (results.some(result => result.status === 'rejected')) {
            throw new Error('Some promises were rejected');
          }
          successMessage = 'success';
          return results;
        })
          .catch((error: Error) => {
            arr.push(4);
            errorMessage = error.message;
            console.log('Error caught in Promise.allSettled catch, error message:', errorMessage);
          });
        promise1.then((result) => {
          arr.push(5);
          console.log('Promise 1 then executed, result:', result);
        });
        promise2.catch((error: Error) => {
          arr.push(6);
          console.log('Promise 2 catch executed, error message:', error.message);
        });
        await sleep(1000);
        await Promise.all(taskPromises);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,5,2,6,3,4]');
          expect(errorMessage).assertEqual('Some promises were rejected');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,2,3,5,6]');
          expect(successMessage).assertEqual('success');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_ALLSETTLED_TEST_4500
     * @tc.name PromiseAllSettledTest4500
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllSettledTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllSettledTest4500';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<PromiseSettledResult<string | number>[]>[] = [];
        const promise1 = new Promise<string>((_, reject) => {
          setTimeout(() => {
            reject(new Error('Promise 1 rejected'));
            arr.push(1);
          }, 300);
        });
        const promise2 = new Promise<number>((resolve) => {
          setTimeout(() => {
            resolve(200);
            arr.push(2);
          }, 600);
        });
        const allSettledPromise = Promise.allSettled([promise1, promise2]);
        taskPromises.push(allSettledPromise);
        promise1.catch((error: Error) => {
          arr.push(3);
          console.log('Promise 1 catch executed, error message:', error.message);
        });
        allSettledPromise.then((results) => {
          arr.push(4);
          console.log('Promise.allSettled then executed, result:', results);
          if (results.some(result => result.status === 'rejected')) {
            throw new Error('Some promises were rejected');
          }
          successMessage = 'success';
          return results;
        })
          .catch((error: Error) => {
            arr.push(5);
            errorMessage = error.message;
            console.log('Error caught in Promise.allSettled catch, error message:', errorMessage);
          });
        promise2.then((result) => {
          arr.push(6);
          console.log('Promise 2 then executed, result:', result);
        });
        await sleep(800);
        await Promise.all(taskPromises);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,3,2,6,4,5]');
          expect(errorMessage).assertEqual('Some promises were rejected');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,2,3,4,6]');
          expect(successMessage).assertEqual('success');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_ALLSETTLED_TEST_4600
     * @tc.name PromiseAllSettledTest4600
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllSettledTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllSettledTest4600';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<PromiseSettledResult<string | number>[]>[] = [];
        const promise1 = new Promise<string>((_, reject) => {
          setTimeout(() => {
            reject(new Error('Promise 1 rejected'));
            arr.push(1);
          }, 300);
        });
        const promise2 = new Promise<number>((resolve) => {
          setTimeout(() => {
            resolve(200);
            arr.push(2);
          }, 600);
        });
        promise1.catch((error: Error) => {
          arr.push(3);
          console.log('Promise 1 catch executed, error message:', error.message);
          return Promise.reject(error);
        }).finally(() => {
          arr.push(4);
          console.log('Promise 1 finally executed');
        });
        const allSettledPromise = Promise.allSettled([promise1, promise2]);
        taskPromises.push(allSettledPromise);
        promise2.then((result) => {
          arr.push(5);
          console.log('Promise 2 then executed, result:', result);
          return result;
        });
        allSettledPromise.then((results) => {
          arr.push(6);
          console.log('Promise.allSettled then executed, result:', results);
          if (results.some(result => result.status === 'rejected')) {
            throw new Error('Some promises were rejected');
          }
          successMessage = 'success';
          return results;
        })
          .catch((error: Error) => {
            arr.push(7);
            errorMessage = error.message;
            console.log('Error caught in Promise.allSettled catch, error message:', errorMessage);
          });
        promise2.finally(() => {
          arr.push(8);
          console.log('Promise 2 finally executed');
        });
        await sleep(900);
        await Promise.all(taskPromises);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,3,4,2,5,8,6,7]');
          expect(errorMessage).assertEqual('Some promises were rejected');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,2,3,4,5,6,8]');
          expect(successMessage).assertEqual('success');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_ALLSETTLED_TEST_4700
     * @tc.name PromiseAllSettledTest4700
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllSettledTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllSettledTest4700';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<PromiseSettledResult<string | number>[]>[] = [];
        const numPromises = 1000;
        const promises: Promise<string | number>[] = [];
        const firstPromise: Promise<string> = new Promise((resolve) => {
          resolve('First promise resolved');
          arr.push(1);
        });
        promises.push(firstPromise);
        for (let i = 1; i < numPromises; i++) {
          const delayPromise: Promise<number> = new Promise((_, reject) => {
            setTimeout(() => {
              reject(new Error(`Promise ${i + 1} rejected`));
              arr.push(i + 1);
            }, 500);
          });
          promises.push(delayPromise);
        }
        const allSettledPromise = Promise.allSettled(promises);
        taskPromises.push(allSettledPromise);
        allSettledPromise.then((results) => {
          arr.push(numPromises + 1);
          console.log('Promise.allSettled then executed, result:', results);
          if (results.some(result => result.status === 'rejected')) {
            errorMessage = 'Some promises were rejected';
          } else {
            successMessage = 'success';
          }
          return results;
        }).catch((error: Error) => {
          arr.push(numPromises + 2);
          errorMessage = error.message;
          console.log('Error caught in Promise.allSettled catch, error message:', errorMessage);
        });
        await sleep(1000);
        await Promise.all(taskPromises);
        if (errorMessage) {
          expect(arr.length).assertEqual(1001);
          expect(errorMessage).assertEqual('Some promises were rejected');
        } else {
          expect(arr.length).assertEqual(numPromises + 1);
          expect(successMessage).assertEqual('success');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_ALLSETTLED_TEST_4800
     * @tc.name PromiseAllSettledTest4800
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllSettledTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllSettledTest4800';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<PromiseSettledResult<number>[]>[] = [];
        const numPromises = 1000;
        const promises: Promise<number>[] = [];
        for (let i = 0; i < numPromises; i++) {
          const promise: Promise<number> = new Promise((resolve) => {
            setTimeout(() => {
              resolve(i);
              arr.push(i + 1);
            }, 100);
          });
          promises.push(promise);
        }
        const allSettledPromise = Promise.allSettled(promises);
        taskPromises.push(allSettledPromise);
        allSettledPromise.then((results) => {
          arr.push(numPromises + 1);
          console.log('Promise.allSettled then executed, result:', results);
          if (results.some(result => result.status === 'rejected')) {
            errorMessage = 'Some promises were rejected';
          } else {
            successMessage = 'All promises were resolved successfully';
          }
          return results;
        }).catch((error: Error) => {
          arr.push(numPromises + 2);
          errorMessage = error.message;
          console.log('Error caught in Promise.allSettled catch, error message:', errorMessage);
        });
        await sleep(1500);
        await Promise.all(taskPromises);
        if (errorMessage) {
          expect(arr.length).assertEqual(numPromises + 2);
          expect(errorMessage).assertEqual('Some promises were rejected');
        } else {
          expect(arr.length).assertEqual(numPromises + 1);
          expect(successMessage).assertEqual('All promises were resolved successfully');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_ALLSETTLED_TEST_4900
     * @tc.name PromiseAllSettledTest4900
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllSettledTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllSettledTest4900';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<PromiseSettledResult<number>[]>[] = [];
        const numPromises = 1000;
        const promises: Promise<number>[] = [];
        for (let i = 0; i < numPromises; i++) {
          const promise: Promise<number> = new Promise((_, reject) => {
            setTimeout(() => {
              reject(new Error(`Promise ${i + 1} failed`));
              arr.push(i + 1);
            }, 100);
          });
          promises.push(promise);
        }
        const allSettledPromise = Promise.allSettled(promises);
        taskPromises.push(allSettledPromise);
        allSettledPromise.then((results) => {
          arr.push(numPromises + 1);
          console.log('Promise.allSettled then executed, result:', results);
          if (results.some(result => result.status === 'rejected')) {
            errorMessage = 'All promises were rejected';
          } else {
            successMessage = 'All promises were resolved successfully';
          }
          return results;
        }).catch((error: Error) => {
          arr.push(numPromises + 2);
          errorMessage = error.message;
          console.log('Error caught in Promise.allSettled catch, error message:', errorMessage);
        });
        await sleep(1500);
        await Promise.all(taskPromises);
        if (errorMessage) {
          expect(arr.length).assertEqual(1001);
          expect(errorMessage).assertEqual('All promises were rejected');
        } else {
          expect(arr.length).assertEqual(numPromises + 1);
          expect(successMessage).assertEqual('All promises were resolved successfully');
        }
        console.info(`${caseName} test end`);
        Done();
      });

  })
}