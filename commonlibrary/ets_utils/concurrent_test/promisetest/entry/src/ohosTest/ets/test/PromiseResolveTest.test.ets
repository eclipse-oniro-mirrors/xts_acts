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


export default function PromiseResolveTest() {
  describe('PromiseResolveTest', () => {
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
     * @tc.number SUB_PROMISE_RESOLVE_TEST_0100
     * @tc.name PromiseResolveTest0100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseResolveTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseResolveTest0100';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<null>[] = [];
        arr.push(1);
        const myPromise: Promise<null> = Promise.resolve(null);
        let result: null = null;
        arr.push(2);
        myPromise
          .then((value: null) => {
            arr.push(3);
            result = value;
            console.log('The Promise is resolved, and the result is:', result);
            return result;
          })
          .then(() => {
            if (result === null) {
              successMessage = `The Promise is resolved: ${result}`;
              arr.push(4);
              console.log('The result is null');
            } else {
              arr.push(5);
              console.log('The result is not null');
            }
          })
          .catch((error: Error) => {
            errorMessage = 'The Promise is rejected';
            arr.push(6);
            console.error('The Promise is rejected:', error);
          });
        arr.push(7);
        taskPromises.push(myPromise);
        await Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,2,7,3,4]');
        expect(result).assertEqual(null);
        expect(successMessage).assertEqual('The Promise is resolved: null');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_RESOLVE_TEST_0200
     * @tc.name PromiseResolveTest0200
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseResolveTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseResolveTest0200';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<undefined>[] = [];
        arr.push(1);
        const myPromise: Promise<undefined> = Promise.resolve(undefined);
        let result: undefined = undefined;
        arr.push(2);
        myPromise
          .then((value: undefined) => {
            arr.push(3);
            result = value;
            console.log('The Promise is resolved, and the result is:', result);
            return result;
          })
          .then(() => {
            if (result === undefined) {
              successMessage = `The Promise is resolved: ${result}`;
              arr.push(4);
              console.log('The result is null');
            } else {
              arr.push(5);
              console.log('The result is not null');
            }
          })
          .catch((error: Error) => {
            arr.push(6);
            errorMessage = 'The Promise is rejected';
            console.error('The Promise is rejected:', error);
          });
        arr.push(7);
        taskPromises.push(myPromise);
        await Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,2,7,3,4]');
        expect(result).assertEqual(undefined);
        expect(successMessage).assertEqual('The Promise is resolved: undefined');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_RESOLVE_TEST_0300
     * @tc.name PromiseResolveTest0300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseResolveTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseResolveTest0300';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<string>[] = [];
        arr.push(1);
        const myPromise: Promise<string> = Promise.resolve('success');
        let result: string = '';
        arr.push(2);
        myPromise
          .then((value: string) => {
            arr.push(3);
            result = value;
            console.log('The Promise is resolved, and the result is:', result);
            return result;
          })
          .then(() => {
            if (typeof result === 'string') {
              successMessage = `The Promise is resolved: ${result}`;
              arr.push(4);
              console.log('The result is null');
            } else {
              arr.push(5);
              console.log('The result is not null');
            }
          })
          .catch((error: Error) => {
            arr.push(6);
            errorMessage = 'The Promise is rejected';
            console.error('The Promise is rejected:', error);
          });
        arr.push(7);
        taskPromises.push(myPromise);
        await Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,2,7,3,4]');
        expect(result).assertEqual('success');
        expect(successMessage).assertEqual('The Promise is resolved: success');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_RESOLVE_TEST_0400
     * @tc.name PromiseResolveTest0400
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseResolveTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseResolveTest0400';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<number>[] = [];
        arr.push(1);
        const myPromise: Promise<number> = Promise.resolve(10);
        let result: number = 10;
        arr.push(2);
        myPromise
          .then((value: number) => {
            arr.push(3);
            result = value;
            console.log('The Promise is resolved, and the result is:', result);
            return result;
          })
          .then(() => {
            if (typeof result === 'number') {
              successMessage = `The Promise is resolved: ${result}`;
              arr.push(4);
              console.log('The result is null');
            } else {
              arr.push(5);
              console.log('The result is not null');
            }
          })
          .catch((error: Error) => {
            arr.push(6);
            errorMessage = 'The Promise is rejected';
            console.error('The Promise is rejected:', error);
          });
        arr.push(7);
        taskPromises.push(myPromise);
        await Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,2,7,3,4]');
        expect(result).assertEqual(10);
        expect(successMessage).assertEqual('The Promise is resolved: 10');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_RESOLVE_TEST_0500
     * @tc.name PromiseResolveTest0500
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseResolveTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseResolveTest0500';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<boolean>[] = [];
        arr.push(1);
        const myPromise: Promise<boolean> = Promise.resolve(true);
        let result: boolean = false;
        arr.push(2);
        myPromise
          .then((value: boolean) => {
            arr.push(3);
            result = value;
            console.log('The Promise is resolved, and the result is:', result);
            return result;
          })
          .then(() => {
            if (typeof result === 'boolean') {
              successMessage = `The Promise is resolved: ${result}`;
              arr.push(4);
              console.log('The result is null');
            } else {
              arr.push(5);
              console.log('The result is not null');
            }
          })
          .catch((error: Error) => {
            arr.push(6);
            errorMessage = 'The Promise is rejected';
            console.error('The Promise is rejected:', error);
          });
        arr.push(7);
        taskPromises.push(myPromise);
        await Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,2,7,3,4]');
        expect(result).assertEqual(true);
        expect(successMessage).assertEqual('The Promise is resolved: true');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_RESOLVE_TEST_0600
     * @tc.name PromiseResolveTest0600
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseResolveTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseResolveTest0600';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<bigint>[] = [];
        arr.push(1);
        const myPromise: Promise<bigint> = Promise.resolve(10n);
        let result: bigint = 0n;
        arr.push(2);
        myPromise
          .then((value: bigint) => {
            arr.push(3);
            result = value;
            console.log('The Promise is resolved, and the result is:', result);
            return result;
          })
          .then(() => {
            if (typeof result === 'bigint') {
              successMessage = `The Promise is resolved: ${result}`;
              arr.push(4);
              console.log('The result is null');
            } else {
              arr.push(5);
              console.log('The result is not null');
            }
          })
          .catch((error: Error) => {
            arr.push(6);
            errorMessage = 'The Promise is rejected';
            console.error('The Promise is rejected:', error);
          });
        arr.push(7);
        taskPromises.push(myPromise);
        await Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,2,7,3,4]');
        expect(result).assertEqual(10n);
        expect(successMessage).assertEqual('The Promise is resolved: 10');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_RESOLVE_TEST_0700
     * @tc.name PromiseResolveTest0700
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseResolveTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseResolveTest0700';
        console.info(`${caseName} test start`);

        interface SuccessResponse {
          success: string;
        }

        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<SuccessResponse>[] = [];
        arr.push(1);
        const successObj: SuccessResponse = {
          success: 'Object Promise success'
        };
        const myPromise: Promise<SuccessResponse> = Promise.resolve(successObj);
        let result: string = '';
        arr.push(2);
        myPromise
          .then((value) => {
            arr.push(3);
            result = value.success;
            console.log('The Promise is resolved, and the result is:', result);
            return result;
          })
          .then(() => {
            if (typeof result === 'string') {
              successMessage = `The Promise is resolved: ${result}`;
              arr.push(4);
              console.log('The result is a string');
            } else {
              arr.push(5);
              console.log('The result is not a string');
            }
          })
          .catch((error: Error) => {
            arr.push(6);
            errorMessage = 'The Promise is rejected';
            console.error('The Promise is rejected:', error);
          });
        arr.push(7);
        taskPromises.push(myPromise);
        await Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,2,7,3,4]');
        expect(result).assertEqual('Object Promise success');
        expect(successMessage).assertEqual('The Promise is resolved: Object Promise success');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_RESOLVE_TEST_0800
     * @tc.name PromiseResolveTest0800
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseResolveTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseResolveTest0800';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<number>[] = [];
        let result: number = 0;
        arr.push(1);
        const originalPromise: Promise<number> = new Promise((resolve) => {
          setTimeout(() => {
            resolve(42);
          }, 100);
        });
        const myPromise: Promise<number> = Promise.resolve(originalPromise);
        arr.push(2);
        myPromise
          .then((value) => {
            arr.push(3);
            result = value;
            console.log('The Promise is resolved, and the result is:', result);
            return result;
          })
          .then(() => {
            if (typeof result === 'number') {
              successMessage = `The Promise is resolved: ${result}`;
              arr.push(4);
              console.log('The result is a number');
            } else {
              arr.push(5);
              console.log('The result is not a number');
            }
          })
          .catch((error: Error) => {
            arr.push(6);
            errorMessage = 'The Promise is rejected';
            console.error('The Promise is rejected:', error);
          });
        arr.push(7);
        taskPromises.push(myPromise);
        await Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,2,7,3,4]');
        expect(result).assertEqual(42);
        expect(successMessage).assertEqual('The Promise is resolved: 42');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_RESOLVE_TEST_0900
     * @tc.name PromiseResolveTest0900
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseResolveTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseResolveTest0900';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<string[]>[] = [];
        let result: string[] = [];
        arr.push(1);
        const stringArray: string[] = ['apple', 'banana', 'cherry'];
        const myPromise: Promise<string[]> = Promise.resolve(stringArray);
        arr.push(2);
        myPromise
          .then((value) => {
            arr.push(3);
            result = value;
            console.log('The Promise is resolved, and the result is:', result);
            return result;
          })
          .then(() => {
            if (Array.isArray(result) && result.every(item => typeof item === 'string')) {
              successMessage = `The Promise is resolved: ${result.join(', ')}`;
              arr.push(4);
              console.log('The result is an array of strings');
            } else {
              arr.push(5);
              console.log('The result is not an array of strings');
            }
          })
          .catch((error: Error) => {
            arr.push(6);
            errorMessage = 'The Promise is rejected';
            console.error('The Promise is rejected:', error);
          });
        arr.push(7);
        taskPromises.push(myPromise);
        await Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,2,7,3,4]');
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(stringArray));
        expect(successMessage).assertEqual(`The Promise is resolved: ${stringArray.join(', ')}`);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_RESOLVE_TEST_1000
     * @tc.name PromiseResolveTest1000
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseResolveTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseResolveTest1000';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<number[]>[] = [];
        let result: number[] = [];
        arr.push(1);
        const numberArray: number[] = [1, 2, 3, 4, 5];
        const myPromise: Promise<number[]> = Promise.resolve(numberArray);
        arr.push(2);
        myPromise
          .then((value) => {
            arr.push(3);
            result = value;
            console.log('The Promise is resolved, and the result is:', result);
            return result;
          })
          .then(() => {
            if (Array.isArray(result) && result.every(item => typeof item === 'number')) {
              successMessage = `The Promise is resolved: ${result.join(', ')}`;
              arr.push(4);
              console.log('The result is an array of numbers');
            } else {
              arr.push(5);
              console.log('The result is not an array of numbers');
            }
          })
          .catch((error: Error) => {
            arr.push(6);
            errorMessage = 'The Promise is rejected';
            console.error('The Promise is rejected:', error);
          });
        arr.push(7);
        taskPromises.push(myPromise);
        await Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,2,7,3,4]');
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(numberArray));
        expect(successMessage).assertEqual(`The Promise is resolved: ${numberArray.join(', ')}`);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_RESOLVE_TEST_1100
     * @tc.name PromiseResolveTest1100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseResolveTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseResolveTest1100';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<Error>[] = [];
        let result: Error = new Error('This is a test error');
        arr.push(1);
        const errorInstance = new Error('This is a test error');
        const myPromise: Promise<Error> = Promise.resolve(errorInstance);
        arr.push(2);
        myPromise
          .then((value) => {
            arr.push(3);
            result = value;
            console.log('The Promise is resolved, and the result is an Error:', result.message);
            return result;
          })
          .then(() => {
            if (result instanceof Error) {
              successMessage = `The Promise is resolved with an Error: ${result.message}`;
              arr.push(4);
              console.log('The result is an Error object');
            } else {
              arr.push(5);
              console.log('The result is not an Error object');
            }
          })
          .catch((error: Error) => {
            arr.push(6);
            errorMessage = 'The Promise is rejected';
            console.error('The Promise is rejected:', error);
          });
        arr.push(7);
        taskPromises.push(myPromise);
        await Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,2,7,3,4]');
        expect(result.message).assertEqual('This is a test error');
        expect(successMessage).assertEqual(`The Promise is resolved with an Error: This is a test error`);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_RESOLVE_TEST_1200
     * @tc.name PromiseResolveTest1200
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseResolveTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseResolveTest1200';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<string[]>[] = [];
        arr.push(1);
        const largeArray: string[] = Array(1000000).fill('test');
        const myPromise: Promise<string[]> = Promise.resolve(largeArray);
        let result: string[] = [];
        arr.push(2);
        myPromise
          .then((value) => {
            arr.push(3);
            result = value;
            console.log('The Promise is resolved, and the result is a large array.');
            return result;
          })
          .then(() => {
            if (Array.isArray(result) && result.every(item => item === 'test')) {
              successMessage = 'The Promise is resolved with a large array of "test" strings.';
              arr.push(4);
              console.log('The result is a valid large array.');
            } else {
              arr.push(5);
              console.log('The result is not a valid large array.');
            }
          })
          .catch((error: Error) => {
            arr.push(6);
            errorMessage = 'The Promise is rejected';
            console.error('The Promise is rejected:', error);
          });
        arr.push(7);
        taskPromises.push(myPromise);
        await Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,2,7,3,4]');
        expect(result.length).assertEqual(1000000);
        expect(result.every(item => item === 'test')).assertTrue();
        expect(successMessage).assertEqual('The Promise is resolved with a large array of "test" strings.');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_RESOLVE_TEST_1300
     * @tc.name PromiseResolveTest1300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseResolveTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseResolveTest1300';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<string>[] = [];
        arr.push(1);

        interface Thenable {
          then: (resolve: (value: string) => void) => void;
        }

        const thenable: Thenable = {
          then: (resolve: (value: string) => void) => {
            Promise.resolve('Resolved value from thenable').then(resolve);
          }
        };
        const myPromise: Promise<string> = Promise.resolve(thenable);
        let result: string = '';
        arr.push(2);
        myPromise
          .then((value) => {
            arr.push(3);
            result = value;
            console.log('The Promise is resolved, and the result is:', result);
            return result;
          })
          .then(() => {
            if (typeof result === 'string') {
              successMessage = `The Promise is resolved: ${result}`;
              arr.push(4);
              console.log('The result is a string');
            } else {
              arr.push(5);
              console.log('The result is not a string');
            }
          })
          .catch((error: Error) => {
            arr.push(6);
            errorMessage = 'The Promise is rejected';
            console.error('The Promise is rejected:', error);
          });
        arr.push(7);
        taskPromises.push(myPromise);
        await Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,2,7,3,4]');
        expect(result).assertEqual('Resolved value from thenable');
        expect(successMessage).assertEqual('The Promise is resolved: Resolved value from thenable');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_RESOLVE_TEST_1400
     * @tc.name PromiseResolveTest1400
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseResolveTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseResolveTest1400';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<string>[] = [];
        let result: string | undefined;
        arr.push(1);

        interface Thenable {
          then: (resolve: (value: string) => void, reject: (reason: Error) => void) => void;
        }

        const thenable: Thenable = {
          then: (resolve: (value: string) => void, reject: (reason: Error) => void) => {
            new Promise<string>((innerResolve, innerReject) => {
              console.log('Inside new Promise, resolving with value');
              innerResolve('Resolved value from thenable');
            }).then(resolve, reject);
          }
        };
        const myPromise: Promise<string> = Promise.resolve(thenable);
        arr.push(2);
        myPromise
          .then((value) => {
            arr.push(3);
            result = value;
            console.log('The Promise is resolved, and the result is:', result);
            return result;
          })
          .then(() => {
            if (typeof result === 'string') {
              successMessage = `The Promise is resolved: ${result}`;
              arr.push(4);
              console.log('The result is a string');
            } else {
              arr.push(5);
              console.log('The result is not a string');
            }
          })
          .catch((error: Error) => {
            arr.push(6);
            errorMessage = `The Promise is rejected: ${error.message}`;
            console.error('The Promise is rejected:', error);
          });
        arr.push(7);
        taskPromises.push(myPromise);
        await Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,2,7,3,4]');
        expect(result).assertEqual('Resolved value from thenable');
        expect(successMessage).assertEqual('The Promise is resolved: Resolved value from thenable');

        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_RESOLVE_TEST_1500
     * @tc.name PromiseResolveTest1500
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseResolveTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseResolveTest1500';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<string>[] = [];
        let result: string | undefined = undefined;
        arr.push(1);
        const nestedResolvedPromise = Promise.resolve(Promise.resolve('Resolved from nested Promise.resolve()'));
        arr.push(2);
        nestedResolvedPromise
          .then((value) => {
            arr.push(3);
            result = value;
            console.log('The Promise is resolved, and the result is:', result);
            return result;
          })
          .then(() => {
            if (typeof result === 'string') {
              successMessage = `The Promise is resolved: ${result}`;
              arr.push(4);
              console.log('The result is a string');
            } else {
              arr.push(5);
              console.log('The result is not a string');
            }
          })
          .catch((error: Error) => {
            arr.push(6);
            errorMessage = `The Promise is rejected: ${error.message}`;
            console.error('The Promise is rejected:', error);
          });
        arr.push(7);
        taskPromises.push(nestedResolvedPromise);
        await Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,2,7,3,4]');
        expect(result).assertEqual('Resolved from nested Promise.resolve()');
        expect(successMessage).assertEqual('The Promise is resolved: Resolved from nested Promise.resolve()');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_RESOLVE_TEST_1600
     * @tc.name PromiseResolveTest1600
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseResolveTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseResolveTest1600';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<string>[] = [];
        let result: Error | undefined | string;
        arr.push(1);
        const promiseOfPromise: Promise<string> = new Promise((resolve, reject) => {
          arr.push(4);
          resolve('success');
        });
        const resolvedCustomRejectedPromise = Promise.resolve(promiseOfPromise);
        arr.push(2);
        resolvedCustomRejectedPromise
          .then((value) => {
            arr.push(3);
            result = value;
            successMessage = `The Promise is resolved: ${result}`;
            console.log('This should not be executed since the Promise is rejected.' + successMessage);
          })
          .catch((error: Error) => {
            arr.push(6);
            result = error;
            errorMessage = `The Promise is rejected: ${error.message}`;
            console.error('The Promise is rejected:', error);
          });
        arr.push(7);
        taskPromises.push(resolvedCustomRejectedPromise);
        await Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,4,2,7,3]');
        expect(successMessage).assertEqual('The Promise is resolved: success');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_RESOLVE_TEST_1700
     * @tc.name PromiseResolveTest1700
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseResolveTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseResolveTest1700';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<string>[] = [];
        let result: string | undefined = undefined;
        arr.push(1);

        interface Thenable {
          then: (resolve: (value: string) => void, reject: (reason: Error) => void) => void;
        }

        const innerThenable: Thenable = {
          then: (resolve: (value: string) => void, reject: (reason: Error) => void) => {
            console.log('Inside inner thenable, resolving with value');
            resolve('Resolved from inner thenable');
          }
        };
        const outerThenable: Thenable = {
          then: (resolve: (value: string) => void, reject: (reason: Error) => void) => {
            console.log('Inside outer thenable, resolving inner thenable');
            innerThenable.then((innerValue) => {
              resolve(innerValue);
            }, reject);
          }
        };
        const myPromise: Promise<string> = Promise.resolve(outerThenable);
        arr.push(2);
        myPromise
          .then((value) => {
            arr.push(3);
            result = value;
            console.log('The Promise is resolved, and the result is:', result);
            return result;
          })
          .then(() => {
            if (typeof result === 'string') {
              successMessage = `The Promise is resolved: ${result}`;
              arr.push(4);
              console.log('The result is a string');
            } else {
              arr.push(5);
              console.log('The result is not a string');
            }
          })
          .catch((error: Error) => {
            arr.push(6);
            errorMessage = `The Promise is rejected: ${error.message}`;
            console.error('The Promise is rejected:', error);
          });
        arr.push(7);
        taskPromises.push(myPromise);
        await Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,2,7,3,4]');
        expect(result).assertEqual('Resolved from inner thenable');
        expect(successMessage).assertEqual('The Promise is resolved: Resolved from inner thenable');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_RESOLVE_TEST_1800
     * @tc.name PromiseResolveTest1800
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseResolveTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseResolveTest1800';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let result: string = '';
        let taskPromises: Promise<string>[] = [];
        arr.push(1);
        const myPromise = Promise.resolve('Initial value');
        arr.push(2);
        taskPromises.push(myPromise);
        myPromise
          .then((value) => {
            arr.push(3);
            result = value;
            console.log('The Promise is resolved with value:', result);
            throw new Error('Error thrown inside .then');
          })
          .then(() => {
            arr.push(4);
            successMessage = `The Promise is resolved: ${result}`;
            console.log('The result is a string');
          })
          .catch((error: Error) => {
            arr.push(5);
            result = error.message;
            errorMessage = `The Promise is rejected: ${error.message}`;
            console.error('The Promise is rejected:', error);
          });
        arr.push(6);
        await Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,2,6,3,5]');
        expect(result).assertEqual('Error thrown inside .then');
        expect(errorMessage).assertEqual('The Promise is rejected: Error thrown inside .then');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_RESOLVE_TEST_1900
     * @tc.name PromiseResolveTest1900
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseResolveTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseResolveTest1900';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let result: string = '';
        let taskPromises: Promise<string>[] = [];
        arr.push(1);
        const myPromise = Promise.resolve('Initial value');
        taskPromises.push(myPromise);
        arr.push(2);
        myPromise
          .then((value) => {
            arr.push(3);
            result = value;
            successMessage = `The Promise is resolved: ${result}`;
            console.log('The result is a string');
          })
          .catch((newError: Error) => {
            arr.push(4);
            result = newError.message;
            errorMessage = `Initial rejection: ${newError.message}`;
            console.error('Initial rejection caught:', newError);
            throw new Error('Error thrown inside .catch');
          });
        arr.push(6);
        await Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,2,6,3]');
        expect(result).assertEqual('Initial value');
        expect(successMessage).assertEqual('The Promise is resolved: Initial value');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_RESOLVE_TEST_2000
     * @tc.name PromiseResolveTest2000
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseResolveTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseResolveTest2000';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let message: string = '';
        let result: string = '';
        let taskPromises: Promise<string>[] = [];
        arr.push(1);
        const myPromise = Promise.resolve('Initial value');
        taskPromises.push(myPromise);
        arr.push(2);
        myPromise
          .then((value) => {
            arr.push(3);
            result = value;
            successMessage = `The Promise is resolved: ${result}`;
            console.log('The result is a string');
            return result;
          })
          .catch((newError: Error) => {
            arr.push(4);
            result = newError.message;
            errorMessage = `Error in .finally: ${newError.message}`;
            console.error('Error caught:', newError);
          })
          .finally(() => {
            arr.push(5);
            message = 'Promise finally';
            console.log('Entered the .finally block');
            throw new Error('Error thrown inside .finally');
          })
        arr.push(6);
        await Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,2,6,3,5]');
        expect(result).assertEqual('Initial value');
        expect(message).assertEqual('Promise finally');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_RESOLVE_TEST_2100
     * @tc.name PromiseResolveTest2100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseResolveTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseResolveTest2100';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<number>[] = [];
        arr.push(1);
        const asyncOperation = (value: number): Promise<number> => {
          return new Promise((resolve) => {
            setTimeout(() => {
              arr.push(2);
              resolve(value * 2);
            }, 200);
          });
        };
        taskPromises.push(asyncOperation(5));
        Promise.resolve(5)
          .then((result) => {
            arr.push(3);
            successMessage = `First step result: ${result}`;
            console.log("successMessage:" + successMessage);
            return asyncOperation(result);
          })
          .then((newResult) => {
            arr.push(4);
            successMessage = `Second step result: ${newResult}`;
            console.log("successMessage:" + successMessage);
          })
          .catch((error: Error) => {
            arr.push(5);
            errorMessage = `An error occurred: ${error}`;
            console.error("errorMessage:" + errorMessage);
          });
        arr.push(6);
        await Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,6,3,2,2,4]');
        expect(successMessage).assertEqual('Second step result: 10');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_RESOLVE_TEST_2200
     * @tc.name PromiseResolveTest2200
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseResolveTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseResolveTest2200';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<number>[] = [];
        arr.push(1);
        const asyncOperation = (value: number): Promise<number> => {
          return new Promise((resolve) => {
            setTimeout(() => {
              arr.push(2);
              resolve(value * 2);
            }, 200);
          });
        };
        taskPromises.push(asyncOperation(5));
        Promise.resolve(5)
          .then((result) => {
            arr.push(3);
            successMessage = `Step 1 result: ${result}`;
            console.log("successMessage:" + successMessage);
            return asyncOperation(result);
          })
          .then((newResult) => {
            arr.push(4);
            successMessage = `Step 2 result: ${newResult}`;
            console.log("successMessage:" + successMessage);
            return asyncOperation(newResult);
          })
          .then((newResult) => {
            arr.push(5);
            successMessage = `Step 3 result: ${newResult}`;
            console.log("successMessage:" + successMessage);
            return asyncOperation(newResult);
          })
          .then((newResult) => {
            arr.push(6);
            successMessage = `Step 4 result: ${newResult}`;
            console.log("successMessage:" + successMessage);
            return asyncOperation(newResult);
          })
          .then((newResult) => {
            arr.push(7);
            successMessage = `Step 5 result: ${newResult}`;
            console.log("successMessage:" + successMessage);
            return asyncOperation(newResult);
          })
          .then((newResult) => {
            arr.push(8);
            successMessage = `Step 6 result: ${newResult}`;
            console.log("successMessage:" + successMessage);
            return asyncOperation(newResult);
          })
          .then((newResult) => {
            arr.push(9);
            successMessage = `Step 7 result: ${newResult}`;
            console.log("successMessage:" + successMessage);
            return asyncOperation(newResult);
          })
          .then((newResult) => {
            arr.push(10);
            successMessage = `Step 8 result: ${newResult}`;
            console.log("successMessage:" + successMessage);
            return asyncOperation(newResult);
          })
          .then((newResult) => {
            arr.push(11);
            successMessage = `Step 9 result: ${newResult}`;
            console.log("successMessage:" + successMessage);
            return asyncOperation(newResult);
          })
          .then((newResult) => {
            arr.push(12);
            successMessage = `Step 10 result: ${newResult}`;
            console.log("successMessage:" + successMessage);
          })
          .catch((error: Error) => {
            arr.push(13);
            errorMessage = `An error occurred: ${error}`;
            console.error("errorMessage:" + errorMessage);
          });
        arr.push(14);
        await Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,14,3,2,2,4]');
        expect(successMessage).assertEqual('Step 2 result: 10');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_RESOLVE_TEST_2300
     * @tc.name PromiseResolveTest2300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseResolveTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseResolveTest2300';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<number>[] = [];
        arr.push(1);
        const asyncOperation = (value: number): Promise<number> => {
          return new Promise((resolve) => {
            setTimeout(() => {
              arr.push(2);
              resolve(value * 2);
            }, 200);
          });
        };
        taskPromises.push(asyncOperation(5));
        Promise.resolve(5)
          .then((result) => {
            arr.push(3);
            successMessage = `Step 1 result: ${result}`;
            console.log("successMessage:" + successMessage);
            return asyncOperation(result);
          })
          .catch((error: Error) => {
            arr.push(4);
            errorMessage = `Catch Step 1 error: ${error}`;
            console.error("errorMessage:" + errorMessage);
            throw error;
          })
          .then((newResult) => {
            arr.push(5);
            successMessage = `Step 2 result: ${newResult}`;
            console.log("successMessage:" + successMessage);
            return asyncOperation(newResult);
          })
          .catch((error: Error) => {
            arr.push(6);
            errorMessage = `Catch Step 2 error: ${error}`;
            console.error("errorMessage:" + errorMessage);
            throw error;
          })
          .then((newResult) => {
            arr.push(7);
            successMessage = `Step 3 result: ${newResult}`;
            console.log("successMessage:" + successMessage);
            return asyncOperation(newResult);
          })
          .catch((error: Error) => {
            arr.push(8);
            errorMessage = `Catch Step 3 error: ${error}`;
            console.error("errorMessage:" + errorMessage);
            throw error;
          })
          .then((newResult) => {
            arr.push(9);
            successMessage = `Step 4 result: ${newResult}`;
            console.log("successMessage:" + successMessage);
            return asyncOperation(newResult);
          })
          .catch((error: Error) => {
            arr.push(10);
            errorMessage = `Catch Step 4 error: ${error}`;
            console.error("errorMessage:" + errorMessage);
            throw error;
          })
          .then((newResult) => {
            arr.push(11);
            successMessage = `Step 5 result: ${newResult}`;
            console.log("successMessage:" + successMessage);
            return asyncOperation(newResult);
          })
          .catch((error: Error) => {
            arr.push(12);
            errorMessage = `Catch Step 5 error: ${error}`;
            console.error("errorMessage:" + errorMessage);
            throw error;
          })
          .then((newResult) => {
            arr.push(13);
            successMessage = `Step 6 result: ${newResult}`;
            console.log("successMessage:" + successMessage);
            return asyncOperation(newResult);
          })
          .catch((error: Error) => {
            arr.push(14);
            errorMessage = `Catch Step 6 error: ${error}`;
            console.error("errorMessage:" + errorMessage);
            throw error;
          })
          .then((newResult) => {
            arr.push(15);
            successMessage = `Step 7 result: ${newResult}`;
            console.log("successMessage:" + successMessage);
            return asyncOperation(newResult);
          })
          .catch((error: Error) => {
            arr.push(16);
            errorMessage = `Catch Step 7 error: ${error}`;
            console.error("errorMessage:" + errorMessage);
            throw error;
          })
          .then((newResult) => {
            arr.push(17);
            successMessage = `Step 8 result: ${newResult}`;
            console.log("successMessage:" + successMessage);
            return asyncOperation(newResult);
          })
          .catch((error: Error) => {
            arr.push(18);
            errorMessage = `Catch Step 8 error: ${error}`;
            console.error("errorMessage:" + errorMessage);
            throw error;
          })
          .then((newResult) => {
            arr.push(19);
            successMessage = `Step 9 result: ${newResult}`;
            console.log("successMessage:" + successMessage);
            return asyncOperation(newResult);
          })
          .catch((error: Error) => {
            arr.push(20);
            errorMessage = `Catch Step 9 error: ${error}`;
            console.error("errorMessage:" + errorMessage);
            throw error;
          })
          .then((newResult) => {
            arr.push(21);
            successMessage = `Step 10 result: ${newResult}`;
            console.log("successMessage:" + successMessage);
          })
          .catch((error: Error) => {
            arr.push(22);
            errorMessage = `Catch Step 10 error: ${error}`;
            console.error("errorMessage:" + errorMessage);
          });
        arr.push(23);
        await Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,23,3,2,2,5]');
        expect(successMessage).assertEqual('Step 2 result: 10');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_RESOLVE_TEST_2400
     * @tc.name PromiseResolveTest2400
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseResolveTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseResolveTest2400';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<number>[] = [];
        arr.push(1);
        const asyncOperation = (value: number): Promise<number> => {
          return new Promise((resolve) => {
            setTimeout(() => {
              arr.push(2);
              resolve(value * 2);
            }, 200);
          });
        };
        taskPromises.push(asyncOperation(5));
        Promise.resolve(5)
          .then((result) => {
            arr.push(3);
            successMessage = `Step 1 result: ${result}`;
            console.log("successMessage:" + successMessage);
            return asyncOperation(result);
          })
          .catch((error: Error) => {
            arr.push(4);
            errorMessage = `Catch Step 1 error: ${error}`;
            console.error("errorMessage:" + errorMessage);
            throw error;
          })
          .then((newResult) => {
            arr.push(5);
            successMessage = `Step 2 result: ${newResult}`;
            console.log("successMessage:" + successMessage);
            return asyncOperation(newResult);
          })
          .catch((error: Error) => {
            arr.push(6);
            errorMessage = `Catch Step 2 error: ${error}`;
            console.error("errorMessage:" + errorMessage);
            throw error;
          })
          .then((newResult) => {
            arr.push(7);
            successMessage = `Step 3 result: ${newResult}`;
            console.log("successMessage:" + successMessage);
            return asyncOperation(newResult);
          })
          .catch((error: Error) => {
            arr.push(8);
            errorMessage = `Catch Step 3 error: ${error}`;
            console.error("errorMessage:" + errorMessage);
            throw error;
          })
          .then((newResult) => {
            arr.push(9);
            successMessage = `Step 4 result: ${newResult}`;
            console.log("successMessage:" + successMessage);
            return asyncOperation(newResult);
          })
          .catch((error: Error) => {
            arr.push(10);
            errorMessage = `Catch Step 4 error: ${error}`;
            console.error("errorMessage:" + errorMessage);
            throw error;
          })
          .then((newResult) => {
            arr.push(11);
            successMessage = `Step 5 result: ${newResult}`;
            console.log("successMessage:" + successMessage);
          })
          .catch((error: Error) => {
            arr.push(12);
            errorMessage = `Catch Step 5 error: ${error}`;
            console.error("errorMessage:" + errorMessage);
          });
        arr.push(13);
        await Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,13,3,2,2,5]');
        expect(successMessage).assertEqual('Step 2 result: 10');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_RESOLVE_TEST_2500
     * @tc.name PromiseResolveTest2500
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseResolveTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseResolveTest2500';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<number>[] = [];
        arr.push(1);

        class Thenable {
          private initialValue: number;
          private delay: number;

          constructor(initialValue: number, delay: number) {
            this.initialValue = initialValue;
            this.delay = delay;
          }

          then(resolve: (value: number) => void) {
            setTimeout(() => {
              arr.push(2);
              resolve(this.initialValue);
            }, this.delay);
          }
        }

        const thenable = new Thenable(5, 200);
        taskPromises.push(new Promise<number>((resolve) => {
          thenable.then(resolve);
        }));
        Promise.resolve(thenable)
          .then((result) => {
            arr.push(3);
            successMessage = `Step 1 result: ${result}`;
            console.log("successMessage:" + successMessage);
            return new Promise<number>((resolve) => {
              setTimeout(() => {
                arr.push(2);
                resolve(result * 2);
              }, 200);
            });
          })
          .catch((error: Error) => {
            arr.push(4);
            errorMessage = `Catch Step 1 error: ${error}`;
            console.error("errorMessage:" + errorMessage);
            throw error;
          })
        arr.push(5);
        await Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,5,2,2,3]');
        expect(successMessage).assertEqual('Step 1 result: 5');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_RESOLVE_TEST_2600
     * @tc.name PromiseResolveTest2600
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseResolveTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseResolveTest2600';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<number>[] = [];
        arr.push(1);
        const promise1 = new Promise<number>((resolve) => {
          setTimeout(() => {
            arr.push(1);
            resolve(10);
          }, 200);
        });
        const promise2 = new Promise<number>((resolve) => {
          setTimeout(() => {
            arr.push(2);
            resolve(20);
          }, 300);
        });
        const promise3 = new Promise<number>((resolve) => {
          setTimeout(() => {
            arr.push(3);
            resolve(30);
          }, 100);
        });
        const allPromises = [promise1, promise2, promise3];
        taskPromises.push(promise1);
        taskPromises.push(promise2);
        taskPromises.push(promise3);
        Promise.all(allPromises)
          .then((results) => {
            arr.push(4);
            successMessage = `Promise.all results: ${results}`;
            console.log("successMessage:" + successMessage);
          })
          .catch((error: Error) => {
            arr.push(5);
            errorMessage = `Catch error: ${error}`;
            console.error("errorMessage:" + errorMessage);
          });
        arr.push(6);
        await Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,6,3,1,2,4]');
        expect(successMessage).assertEqual('Promise.all results: 10,20,30');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_RESOLVE_TEST_2700
     * @tc.name PromiseResolveTest2700
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseResolveTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseResolveTest2700';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<number>[] = [];
        const asyncOperation = (value: number, delay: number) => {
          return new Promise<number>((resolve, reject) => {
            setTimeout(() => {
              arr.push(value);
              resolve(value * 2);
            }, delay);
          });
        };
        const outerPromises = [
          asyncOperation(1, 200),
          asyncOperation(2, 300),
          asyncOperation(3, 100)
        ];
        taskPromises.push(asyncOperation(1, 200));
        taskPromises.push(asyncOperation(2, 300));
        taskPromises.push(asyncOperation(3, 100));
        Promise.allSettled(outerPromises)
          .then((outerResults) => {
            arr.push(4);
            successMessage = `Outer Promise.allSettled results: ${JSON.stringify(outerResults)}`;
            console.log("successMessage:" + successMessage);
            const innerPromises = outerResults.map((result): Promise<null> | Promise<number> => {
              if (result.status === 'fulfilled') {
                return asyncOperation(result.value, 150);
              }
              return Promise.resolve(null);
            });
            return Promise.allSettled(innerPromises);
          })
          .then((innerResults) => {
            arr.push(5);
            successMessage = `Inner Promise.allSettled results: success`;
            console.log("successMessage:" + successMessage);
          })
          .catch((error: Error) => {
            arr.push(6);
            errorMessage = `Catch error: ${error.message}`;
            console.error("errorMessage:" + errorMessage);
          });
        arr.push(7);
        await Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[7,3,3,1,1,2,4,2,2,4,6,5]');
        expect(successMessage).assertEqual('Inner Promise.allSettled results: success');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_RESOLVE_TEST_2800
     * @tc.name PromiseResolveTest2800
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseResolveTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseResolveTest2800';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<number>[] = [];
        const asyncOperation = (value: number, delay: number) => {
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              arr.push(value);
              resolve(value * 2);
            }, delay);
          });
        };
        const outerPromises = [
          asyncOperation(1, 600),
          asyncOperation(2, 900),
          asyncOperation(3, 300)
        ];
        taskPromises.push(asyncOperation(1, 600));
        taskPromises.push(asyncOperation(2, 900));
        taskPromises.push(asyncOperation(3, 300));
        Promise.resolve()
          .then(() => {
            return Promise.any(outerPromises);
          })
          .then((outerResult) => {
            arr.push(4);
            successMessage = `Outer: ${outerResult}`;
            console.log(successMessage);
            const innerPromises = [
              asyncOperation(outerResult / 2 * 4, 450),
              asyncOperation(outerResult / 2 * 5, 600),
              asyncOperation(outerResult / 2 * 6, 540)
            ];
            return Promise.any(innerPromises);
          })
          .then((innerResult) => {
            arr.push(5);
            successMessage = `Inner: ${innerResult}`;
            console.log(successMessage);
          })
          .catch((error: Error) => {
            arr.push(6);
            errorMessage = `Error: ${error.message}`;
            console.error(errorMessage);
          });
        arr.push(7);
        await Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[7,3,4,3,1,1,12,5,18,2,2,15]');
        expect(successMessage).assertEqual('Inner: 24');
        console.info(`${caseName} test end`);
        Done();
      });

  })
}