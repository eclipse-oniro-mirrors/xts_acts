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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Size, Level, TestType } from '../../../hypium/index';
import { sleep } from '../testability/pages/TestUtils';



interface Thenable1 {
  then: (resolve: (value: string) => void) => void;
}

interface Thenable2 {
  then: (resolve: (value: string) => void, reject: (reason: Error) => void) => void;
}

interface Thenable3 {
  then: (resolve: (value: string) => void, reject: (reason: Error) => void) => void;
}

interface Thenable4 {
  then: (resolve: (value: string) => void, reject: (reason: Error) => void) => void;
}

export default function PromiseRejectTest() {
  describe('PromiseRejectTest', (): void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(():void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async ():Promise<void> => {
      await sleep(100);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(():void => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(():void => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })


    /**
     * @tc.number SUB_PROMISE_REJECT_TEST_0500
     * @tc.name PromiseRejectTest0500
     * @tc.desc test boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseRejectTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'PromiseRejectTest0500';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<boolean>[] = [];
        arr.push(1);
        let bool = true;
        const myPromise = Promise.reject(new Error('true'));
        let result: string = '';
        arr.push(2);
        myPromise
          .then((value: string):string => {
            arr.push(3);
            result = value;
            console.log('The Promise is resolved, and the result is:', result);
            return result;
          })
          .then(():void => {
            console.log('Inside second then block');
            successMessage = `The Promise is resolved: ${result}`;
            console.log('successMessage:' + successMessage);
          })
          .catch((error: Error):void => {
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
     * @tc.number SUB_PROMISE_REJECT_TEST_0800
     * @tc.name PromiseRejectTest0800
     * @tc.desc test promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseRejectTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'PromiseRejectTest0800'
        console.info(`${caseName} test start`)
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<number>[] = [];
        let result: number = 0;
        arr.push(1);
        const originalPromise: Promise<number> = new Promise<number>((resolve, reject) => {
          setTimeout(() => {
            reject(new Error('42'));
          }, 100);
        });
        const myPromise: Promise<number> = Promise.reject(new Error('42'));
        arr.push(2);
        myPromise
          .then((value: number): number => {
            arr.push(3);
            result = value;
            console.log('The Promise is resolved, and the result is:', result);
            return result;
          })
          .then((): void => {
            if (typeof result === 'number') {
              successMessage = `The Promise is resolved: ${result}`;
              arr.push(4);
              console.log('The result is a number');
            } else {
              arr.push(5);
              console.log('The result is not a number');
            }
          })
          .catch((error: Error) : void=> {
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
     * @tc.number SUB_PROMISE_REJECT_TEST_1100
     * @tc.name PromiseRejectTest1100
     * @tc.desc test Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseRejectTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'PromiseRejectTest1100';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<Error>[] = [];
        let result: string = '';
        arr.push(1);
        const errorInstance = new Error('This is a test error');
        const myPromise: Promise<Error> = Promise.reject(errorInstance);
        arr.push(2);
        myPromise
          .then((value: string) : string=> {
            arr.push(3);
            result = value;
            console.log('The Promise is resolved, and the result is an Error:', result);
            return result;
          })
          .then(() : void=> {
            if (result instanceof Error) {
              successMessage = `The Promise is resolved with an Error: ${result}`;
              arr.push(4);
              console.log('The result is an Error object');
            } else {
              arr.push(5);
              console.log('The result is not an Error object');
            }
          })
          .catch((error: Error): void => {
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
      async (Done: () => void): Promise<void> => {
        const caseName = 'PromiseRejectTest1200';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<string[]>[] = [];
        arr.push(1);
        const myPromise: Promise<string[]> = Promise.reject(new Error('Inner Promise rejected'));
        let result: string[] = [];
        arr.push(2);
        myPromise
          .then((value: string[]): string[] => {
            arr.push(3);
            result = value;
            console.log('The Promise is resolved, and the result is a large array.');
            return result;
          })
          .then(() : void=> {
            if (Array.isArray(result) && result.every(item => item === 'test')) {
              successMessage = 'The Promise is resolved with a large array of "test" strings.';
              arr.push(4);
              console.log('The result is a valid large array.');
            } else {
              arr.push(5);
              console.log('The result is not a valid large array.');
            }
          })
          .catch((error: Error) : void=> {
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
      async (Done: () => void): Promise<void> => {
        const caseName = 'PromiseRejectTest1300';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<string>[] = [];
        arr.push(1);

        const thenable: Thenable1 = {
          then: (resolve: (value: string) => void) => {
            Promise.resolve('Resolved value from thenable').then(resolve);
          }
        };
        const myPromise: Promise<string> = Promise.reject(new Error('Resolved value from thenable'));
        let result: string = '';
        arr.push(2);
        myPromise
          .then((value: string): string => {
            arr.push(3);
            result = value;
            console.log('The Promise is resolved, and the result is:', result);
            return result;
          })
          .then(() : void=> {
            if (typeof result === 'string') {
              successMessage = `The Promise is resolved: ${result}`;
              arr.push(4);
              console.log('The result is a string');
            } else {
              arr.push(5);
              console.log('The result is not a string');
            }
          })
          .catch((error: Error):void => {
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
      async (Done: () => void): Promise<void> => {
        const caseName = 'PromiseRejectTest1400';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<string>[] = [];
        arr.push(1);
        const thenable: Thenable2 = {
          then: (resolve: (value: string) => void, reject: (reason: Error) => void) => {
            Promise.reject(new Error('Rejected from thenable')).then(resolve, reject);
          }
        };
        const myPromise: Promise<string> = Promise.reject(new Error('Rejected from thenable'));
        let result: string = '';
        arr.push(2);
        myPromise
          .then((value: string): string => {
            arr.push(3);
            result = value;
            console.log('The Promise is resolved, and the result is:', result);
            return result;
          })
          .then(():void => {
            if (typeof result === 'string') {
              successMessage = `The Promise is resolved: ${result}`;
              arr.push(4);
              console.log('The result is a string');
            } else {
              arr.push(5);
              console.log('The result is not a string');
            }
          })
          .catch((error: Error) :void=> {
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
      async (Done: () => void): Promise<void> => {
        const caseName = 'PromiseRejectTest1500';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<string>[] = [];
        arr.push(1);
        const thenable: Thenable3 = {
          then: (resolve: (value: string) => void, reject: (reason: Error) => void) => {
            new Promise<string>((innerResolve) => {
              innerResolve('Resolved from thenable');
            }).then(resolve, reject);
          }
        };
        const myPromise: Promise<string> = Promise.reject(new Error('Resolved from thenable'));
        let result: string = '';
        arr.push(2);
        myPromise
          .then((value: string): string => {
            arr.push(3);
            result = value;
            console.log('The Promise is resolved, and the result is:', result);
            return result;
          })
          .then(():void => {
            if (typeof result === 'string') {
              successMessage = `The Promise is resolved: ${result}`;
              arr.push(4);
              console.log('The result is a string');
            } else {
              arr.push(5);
              console.log('The result is not a string');
            }
          })
          .catch((error: Error):void => {
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
      async (Done: () => void): Promise<void> => {
        const caseName = 'PromiseRejectTest1600';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<string>[] = [];
        arr.push(1);
        const thenable: Thenable4 = {
          then: (resolve: (value: string) => void, reject: (reason: Error) => void) => {
            new Promise<string>((_, __) => {
              throw new Error('Exception thrown from inner promise');
            }).then(resolve, reject);
          }
        };
        const myPromise: Promise<string> = Promise.reject(new Error('Exception thrown from inner promise'));
        let result: string = '';
        arr.push(2);
        myPromise
          .then((value: string): string => {
            arr.push(3);
            result = value;
            console.log('The Promise is resolved, and the result is:', result);
            return result;
          })
          .then(():void => {
            if (typeof result === 'string') {
              successMessage = `The Promise is resolved: ${result}`;
              arr.push(4);
              console.log('The result is a string');
            } else {
              arr.push(5);
              console.log('The result is not a string');
            }
          })
          .catch((error: Error):void => {
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
      async (Done: () => void): Promise<void> => {
        const caseName = 'PromiseRejectTest1700';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<string>[] = [];
        arr.push(1);
        const innerPromise: Promise<string> = Promise.resolve('Resolved from inner promise');
        const myPromise: Promise<string> = Promise.reject(new Error('Resolved from inner promise'));
        let result: string = '';
        arr.push(2);
        myPromise
          .then((value: string): string => {
            arr.push(3);
            result = value;
            console.log('The Promise is resolved, and the result is:', result);
            return result;
          })
          .then(():void => {
            if (typeof result === 'string') {
              successMessage = `The Promise is resolved: ${result}`;
              arr.push(4);
              console.log('The result is a string');
            } else {
              arr.push(5);
              console.log('The result is not a string');
            }
          })
          .catch((error: Error):void => {
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
      async (Done: () => void): Promise<void> => {
        const caseName = 'PromiseRejectTest1800';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<string>[] = [];
        arr.push(1);
        const innerPromise: Promise<string> = Promise.reject(new Error('Rejected from inner promise'));
        const myPromise: Promise<string> = Promise.reject(new Error('Rejected from inner promise'));
        let result: string = '';
        arr.push(2);
        myPromise
          .then((value: string): string => {
            arr.push(3);
            result = value;
            console.log('The Promise is resolved, and the result is:', result);
            return result;
          })
          .then(():void => {
            if (typeof result === 'string') {
              successMessage = `The Promise is resolved: ${result}`;
              arr.push(4);
              console.log('The result is a string');
            } else {
              arr.push(5);
              console.log('The result is not a string');
            }
          })
          .catch((error: Error):void => {
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
      async (Done: () => void): Promise<void> => {
        const caseName = 'PromiseRejectTest1900';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<string>[] = [];
        arr.push(1);
        const innerPromise: Promise<string> = new Promise<string>((resolve) => {
          resolve('Resolved from inner promise');
        });
        const myPromise: Promise<string> = Promise.reject(new Error('Resolved from inner promise'));
        let result: string = '';
        arr.push(2);
        myPromise
          .then((value: string) : string=> {
            arr.push(3);
            result = value;
            console.log('The Promise is resolved, and the result is:', result);
            return result;
          })
          .then(():void => {
            if (typeof result === 'string') {
              successMessage = `The Promise is resolved: ${result}`;
              arr.push(4);
              console.log('The result is a string');
            } else {
              arr.push(5);
              console.log('The result is not a string');
            }
          })
          .catch((error: Error):void => {
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
      async (Done: () => void): Promise<void> => {
        const caseName = 'PromiseRejectTest2000';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<string>[] = [];
        arr.push(1);
        const innerPromise: Promise<string> = new Promise<string>((_, reject) => {
          reject(new Error('Rejected from inner promise'));
        });
        const myPromise: Promise<string> = Promise.reject(new Error('Rejected from inner promise'));
        let result: string = '';
        arr.push(2);
        myPromise
          .then((value: string) : string=> {
            arr.push(3);
            result = value;
            console.log('The Promise is resolved, and the result is:', result);
            return result;
          })
          .then(():void => {
            if (typeof result === 'string') {
              successMessage = `The Promise is resolved: ${result}`;
              arr.push(4);
              console.log('The result is a string');
            } else {
              arr.push(5);
              console.log('The result is not a string');
            }
          })
          .catch((error: Error):void => {
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