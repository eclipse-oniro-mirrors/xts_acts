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


export default function PromiseRejectTest() {
  describe('PromiseRejectTest', () => {
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
     * @tc.number SUB_PROMISE_REJECT_TEST_0100
     * @tc.name PromiseRejectTest0100
     * @tc.desc test null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseRejectTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseRejectTest0100';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<null>[] = [];
        arr.push(1);
        const myPromise: Promise<null> = Promise.reject(null);
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
          .catch((error: null) => {
            errorMessage = 'The Promise is rejected';
            arr.push(6);
            console.error('The Promise is rejected:', error);
          });
        arr.push(7);
        taskPromises.push(myPromise);
        await Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,2,7,6]');
        expect(result).assertEqual(null);
        expect(errorMessage).assertEqual('The Promise is rejected');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_REJECT_TEST_0200
     * @tc.name PromiseRejectTest0200
     * @tc.desc test undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseRejectTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseRejectTest0200';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<undefined>[] = [];
        arr.push(1);
        const myPromise: Promise<undefined> = Promise.reject(undefined);
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
          .catch((error: undefined) => {
            result = error;
            errorMessage = `The Promise is rejected: ${result}`;
            arr.push(6);
            console.error('The Promise is rejected:', error);
          });
        arr.push(7);
        taskPromises.push(myPromise);
        await Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,2,7,6]');
        expect(result).assertEqual(undefined);
        expect(errorMessage).assertEqual('The Promise is rejected: undefined');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_REJECT_TEST_0300
     * @tc.name PromiseRejectTest0300
     * @tc.desc test string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseRejectTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseRejectTest0300';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<string>[] = [];
        arr.push(1);
        const rejectionString = 'This is a rejection string';
        const myPromise = Promise.reject(rejectionString);
        let result = null;
        myPromise
          .then((value) => {
            arr.push(3);
            result = value;
            console.log('The Promise is resolved, and the result is:', result);
            return result;
          })
          .then(() => {
            console.log('Inside second then block');
            if (result === null) {
              successMessage = `The Promise is resolved: ${result}`;
              arr.push(4);
              console.log('The result is null');
            } else {
              arr.push(5);
              console.log('The result is not null');
            }
          })
          .catch((error: string) => {
            console.log('Inside catch block');
            errorMessage = error;
            arr.push(6);
            console.error('The Promise is rejected:', errorMessage);
          });
        arr.push(7);
        taskPromises.push(myPromise);
        Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,7,6]');
        expect(result).assertEqual(null);
        expect(errorMessage).assertEqual('This is a rejection string');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_REJECT_TEST_0400
     * @tc.name PromiseRejectTest0400
     * @tc.desc test number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseRejectTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseRejectTest0400';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<string>[] = [];
        arr.push(1);
        const rejectionNumber = 42;
        const myPromise = Promise.reject(rejectionNumber);
        let result = null;
        myPromise
          .then((value) => {
            arr.push(3);
            result = value;
            console.log('The Promise is resolved, and the result is:', result);
            return result;
          })
          .then(() => {
            console.log('Inside second then block');
            successMessage = `The Promise is resolved: ${result}`;
            console.log("successMessage:" + successMessage);
          })
          .catch((error: number) => {
            console.log('Inside catch block');
            errorMessage = `The Promise is rejected with error: ${error}`;
            arr.push(6);
            console.error('The Promise is rejected:', errorMessage);
          });
        arr.push(7);
        taskPromises.push(myPromise);
        Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,7,6]');
        expect(result).assertEqual(null);
        expect(errorMessage).assertEqual('The Promise is rejected with error: 42');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_REJECT_TEST_0500
     * @tc.name PromiseRejectTest0500
     * @tc.desc test boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseRejectTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseRejectTest0500';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<boolean>[] = [];
        arr.push(1);
        let bool = true;
        const myPromise = Promise.reject(bool);
        let result = null;
        arr.push(2);
        myPromise
          .then((value) => {
            arr.push(3);
            result = value;
            console.log('The Promise is resolved, and the result is:', result);
            return result;
          })
          .then(() => {
            console.log('Inside second then block');
            successMessage = `The Promise is resolved: ${result}`;
            console.log("successMessage:" + successMessage);
          })
          .catch((error: boolean) => {
            bool = false;
            console.log('Inside catch block');
            errorMessage = `The Promise is rejected with error: ${bool}`;
            arr.push(6);
            console.error('The Promise is rejected:', errorMessage);
          });
        arr.push(7);
        taskPromises.push(myPromise);
        Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,2,7,6]');
        expect(bool).assertEqual(false);
        expect(errorMessage).assertEqual('The Promise is rejected with error: false');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_REJECT_TEST_0600
     * @tc.name PromiseRejectTest0600
     * @tc.desc test bigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseRejectTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseRejectTest0600';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<bigint>[] = [];
        arr.push(1);
        let bigInt = 10n;
        const myPromise = Promise.reject(bigInt);
        let result = null;
        arr.push(2);
        myPromise
          .then((value) => {
            arr.push(3);
            result = value;
            console.log('The Promise is resolved, and the result is:', result);
            return result;
          })
          .then(() => {
            console.log('Inside second then block');
            successMessage = `The Promise is resolved: ${result}`;
            console.log("successMessage:" + successMessage);
          })
          .catch((error: bigint) => {
            console.log('Inside catch block');
            errorMessage = `The Promise is rejected with error: ${error}`;
            arr.push(6);
            console.error('The Promise is rejected:', errorMessage);
          });
        arr.push(7);
        taskPromises.push(myPromise);
        Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,2,7,6]');
        expect(errorMessage).assertEqual('The Promise is rejected with error: 10');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_REJECT_TEST_0700
     * @tc.name PromiseRejectTest0700
     * @tc.desc test object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseRejectTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseRejectTest0700';
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
          success: 'Object Promise failed'
        };
        const myPromise: Promise<SuccessResponse> = Promise.reject(successObj);
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
          .catch((error: SuccessResponse) => {
            arr.push(6);
            result = error.success;
            errorMessage = 'The Promise is rejected';
            console.error('The Promise is rejected:', error);
          });
        arr.push(7);
        taskPromises.push(myPromise);
        Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,2,7,6]');
        expect(result).assertEqual('Object Promise failed');
        expect(errorMessage).assertEqual('The Promise is rejected');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_REJECT_TEST_0800
     * @tc.name PromiseRejectTest0800
     * @tc.desc test promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseRejectTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseRejectTest0800'
        console.info(`${caseName} test start`)
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<number>[] = [];
        let result: number = 0;
        arr.push(1);
        const originalPromise: Promise<number> = new Promise((resolve, reject) => {
          setTimeout(() => {
            reject(42);
          }, 100);
        });
        const myPromise: Promise<number> = Promise.reject(originalPromise);
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
            console.log('error:' + error)
            errorMessage = 'The Promise is rejected';
            console.error('The Promise is rejected:', error);
          });
        arr.push(7);
        taskPromises.push(myPromise);
        Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,2,7,6]');
        expect(result).assertEqual(0);
        expect(errorMessage).assertEqual('The Promise is rejected');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_REJECT_TEST_0900
     * @tc.name PromiseRejectTest0900
     * @tc.desc test string[]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseRejectTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseRejectTest0900';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<string>[] = [];
        arr.push(1);
        const rejectionStringArray = ['error1', 'error2', 'error3'];
        const myPromise: Promise<string> = Promise.reject(rejectionStringArray);
        myPromise
          .then(() => {
            arr.push(3);
            console.log('This should not be executed as the promise is rejected.');
          })
          .then(() => {
            console.log('Inside second then block, also should not be executed.');
            successMessage = 'The Promise is resolved';
            arr.push(4);
          })
          .catch((error: Error) => {
            console.log('Inside catch block');
            errorMessage = `The Promise is rejected with error: ${JSON.stringify(error)}`;
            arr.push(6);
            console.error('The Promise is rejected:', errorMessage);
          });
        arr.push(7);
        taskPromises.push(myPromise);
        Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,7,6]');
        expect(errorMessage).assertEqual(`The Promise is rejected with error: ${JSON.stringify(rejectionStringArray)}`);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_REJECT_TEST_1000
     * @tc.name PromiseRejectTest1000
     * @tc.desc test string[]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseRejectTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseRejectTest1000';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<number>[] = [];
        arr.push(1);
        const rejectionNumberArray: number[] = [10, 20, 30];
        const myPromise: Promise<number> = Promise.reject(rejectionNumberArray);
        myPromise
          .then(() => {
            arr.push(3);
            console.log('This should not be executed as the promise is rejected.');
          })
          .then(() => {
            console.log('Inside second then block, also should not be executed.');
            successMessage = 'The Promise is resolved';
            arr.push(4);
          })
          .catch((error: number[]) => {
            console.log('Inside catch block');
            errorMessage = `The Promise is rejected with error: ${JSON.stringify(error)}`;
            arr.push(6);
            console.error('The Promise is rejected:', errorMessage);
          });
        arr.push(7);
        taskPromises.push(myPromise);
        Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,7,6]');
        expect(errorMessage).assertEqual(`The Promise is rejected with error: ${JSON.stringify(rejectionNumberArray)}`);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_REJECT_TEST_1100
     * @tc.name PromiseRejectTest1100
     * @tc.desc test Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseRejectTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseRejectTest1100';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<Error>[] = [];
        let result: Error = new Error('This is a test error');
        arr.push(1);
        const errorInstance = new Error('This is a test error');
        const myPromise: Promise<Error> = Promise.reject(errorInstance);
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
        Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,2,7,6]');
        expect(errorMessage).assertEqual(`The Promise is rejected`);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_REJECT_TEST_1200
     * @tc.name PromiseRejectTest1200
     * @tc.desc test value = Array(1000000).fill('test')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseRejectTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseRejectTest1200';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<string[]>[] = [];
        arr.push(1);
        const largeArray: string[] = Array(1000000).fill('test');
        const myPromise: Promise<string[]> = Promise.reject(largeArray);
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
        Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,2,7,6]');
        expect(errorMessage).assertEqual('The Promise is rejected');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_REJECT_TEST_1300
     * @tc.name PromiseRejectTest1300
     * @tc.desc test Promise.resolve
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseRejectTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseRejectTest1300';
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
        const myPromise: Promise<string> = Promise.reject(thenable);
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
        Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,2,7,6]');
        expect(errorMessage).assertEqual('The Promise is rejected');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_REJECT_TEST_1400
     * @tc.name PromiseRejectTest1400
     * @tc.desc test Promise.reject
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseRejectTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseRejectTest1400';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<string>[] = [];
        arr.push(1);

        interface Thenable {
          then: (resolve: (value: string) => void, reject: (reason: Error) => void) => void;
        }

        const thenable: Thenable = {
          then: (resolve: (value: string) => void, reject: (reason: Error) => void) => {
            Promise.reject(new Error('Rejected from thenable')).then(resolve, reject);
          }
        };
        const myPromise: Promise<string> = Promise.reject(thenable);
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
            console.error('The Promise is rejected:', error.message);
          });
        arr.push(7);
        taskPromises.push(myPromise);
        Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,2,7,6]');
        expect(errorMessage).assertEqual('The Promise is rejected');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_REJECT_TEST_1500
     * @tc.name PromiseRejectTest1500
     * @tc.desc test new Promise resolve
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseRejectTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseRejectTest1500';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<string>[] = [];
        arr.push(1);

        interface Thenable {
          then: (resolve: (value: string) => void, reject: (reason: Error) => void) => void;
        }

        const thenable: Thenable = {
          then: (resolve: (value: string) => void, reject: (reason: Error) => void) => {
            new Promise<string>((innerResolve) => {
              innerResolve('Resolved from thenable');
            }).then(resolve, reject);
          }
        };
        const myPromise: Promise<string> = Promise.reject(thenable);
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
            console.error('The Promise is rejected:', error.message);
          });
        arr.push(7);
        taskPromises.push(myPromise);
        Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,2,7,6]');
        expect(errorMessage).assertEqual('The Promise is rejected');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_REJECT_TEST_1600
     * @tc.name PromiseRejectTest1600
     * @tc.desc test throw new Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseRejectTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseRejectTest1600';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<string>[] = [];
        arr.push(1);

        interface Thenable {
          then: (resolve: (value: string) => void, reject: (reason: Error) => void) => void;
        }

        const thenable: Thenable = {
          then: (resolve: (value: string) => void, reject: (reason: Error) => void) => {
            new Promise<string>((_, __) => {
              throw new Error('Exception thrown from inner promise');
            }).then(resolve, reject);
          }
        };
        const myPromise: Promise<string> = Promise.reject(thenable);
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
            console.error('The Promise is rejected:', error.message);
          });
        arr.push(7);
        taskPromises.push(myPromise);
        Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,2,7,6]');
        expect(errorMessage).assertEqual('The Promise is rejected');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_REJECT_TEST_1700
     * @tc.name PromiseRejectTest1700
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseRejectTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseRejectTest1700';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<string>[] = [];
        arr.push(1);
        const innerPromise: Promise<string> = Promise.resolve('Resolved from inner promise');
        const myPromise: Promise<string> = Promise.reject(innerPromise);
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
            console.error('The Promise is rejected:', error.message);
          });
        arr.push(7);
        taskPromises.push(myPromise);
        Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,2,7,6]');
        expect(errorMessage).assertEqual('The Promise is rejected');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_REJECT_TEST_1800
     * @tc.name PromiseRejectTest1800
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseRejectTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseRejectTest1800';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<string>[] = [];
        arr.push(1);
        const innerPromise: Promise<string> = Promise.reject(new Error('Rejected from inner promise'));
        const myPromise: Promise<string> = Promise.reject(innerPromise);
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
            console.error('The Promise is rejected:', error.message);
          });
        arr.push(7);
        taskPromises.push(myPromise);
        Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,2,7,6]');
        expect(errorMessage).assertEqual('The Promise is rejected');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_REJECT_TEST_1900
     * @tc.name PromiseRejectTest1900
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseRejectTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseRejectTest1900';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<string>[] = [];
        arr.push(1);
        const innerPromise: Promise<string> = new Promise((resolve) => {
          resolve('Resolved from inner promise');
        });
        const myPromise: Promise<string> = Promise.reject(innerPromise);
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
            console.error('The Promise is rejected:', error.message);
          });
        arr.push(7);
        taskPromises.push(myPromise);
        Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,2,7,6]');
        expect(errorMessage).assertEqual('The Promise is rejected');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_REJECT_TEST_2000
     * @tc.name PromiseRejectTest2000
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseRejectTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseRejectTest2000';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<string>[] = [];
        arr.push(1);
        const innerPromise: Promise<string> = new Promise((_, reject) => {
          reject(new Error('Rejected from inner promise'));
        });
        const myPromise: Promise<string> = Promise.reject(innerPromise);
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
            console.error('The Promise is rejected:', error.message);
          });
        arr.push(7);
        taskPromises.push(myPromise);
        Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,2,7,6]');
        expect(errorMessage).assertEqual('The Promise is rejected');
        console.info(`${caseName} test end`);
        Done();
      });

  })
}