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


export default function PromiseAllSecondTest() {
  describe('PromiseAllSecondTest', (): void => {
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
     * @tc.number SUB_PROMISE_ALL_TEST_3000
     * @tc.name PromiseAllTest3000
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'PromiseAllTest3000';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises:(Promise<Array<String>>|Promise<string>)[] = [];
        let results: Array<string | string[]> = [];
        arr.push(1);
        const promise1: Promise<string> = new Promise<string>((resolve):void => {
          setTimeout(() => {
            arr.push(4);
            resolve('Promise 1 Resolved');
          }, 100);
        });
        const promise2: Promise<string> = new Promise<string>((resolve):void => {
          setTimeout(() => {
            arr.push(5);
            resolve('Promise 2 Resolved');
          }, 200);
        });
        promise1.then((result:string):void => {
          arr.push(6);
          console.log('Promise 1 then:', result);
        });
        promise2.then((result:string):void => {
          arr.push(7);
          console.log('Promise 2 then:', result);
        });
        arr.push(2);
        const allPromises:Promise<Array<String>> = Promise.all<String>([promise1, promise2]);
        taskPromises.push(allPromises);
        allPromises.then((res: Array<String>) :void=> {
          res.forEach((singleResult: string):void => {
            const singlePromise: Promise<string> = Promise.resolve(singleResult);
            taskPromises.push(singlePromise);
          });
        });
        arr.push(9);
        Promise.all(taskPromises)
          .then((res:Array<String|Array<String>>):void => {
            results = res;
            arr.push(3);
            console.log('All promises are resolved:', results);
            successMessage = `All promises are resolved`;
          })
          .catch((error: Error):void => {
            arr.push(8);
            errorMessage = 'At least one promise is rejected';
            console.error('At least one promise is rejected:', error.message);
          });
        await sleep(300);
        await Promise.all(taskPromises);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,6,2,9,4,5,8]');
          expect(errorMessage).assertEqual('At least one promise is rejected');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,2,9,4,6,5,7,3]');
          expect(successMessage).assertEqual('All promises are resolved');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_ALL_TEST_3100
     * @tc.name PromiseAllTest3100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'PromiseAllTest3100';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<Array<String>>[] = [];
        let results: string[] = [];
        arr.push(1);
        const promise1: Promise<string> = new Promise<string>((resolve):void => {
          setTimeout(() => {
            arr.push(4);
            resolve('Promise 1 Resolved');
          }, 100);
        });
        const promise2: Promise<string> = new Promise<string>((resolve):void => {
          setTimeout(() => {
            arr.push(5);
            resolve('Promise 2 Resolved');
          }, 200);
        });
        promise1.then((result:string) => {
          arr.push(6);
          console.log('Promise 1 then start:', result);
          throw new Error('Exception in Promise 1 then');
        }).catch((error: Error):void => {
          arr.push(7);
          console.error('Error in Promise 1 then:', error.message);
        });
        promise2.then((result:string):void => {
          arr.push(8);
          console.log('Promise 2 then:', result);
        });
        arr.push(2);
        const allPromises: Promise<Array<String>> = Promise.all<String>([promise1, promise2]);
        taskPromises.push(allPromises);
        allPromises.then((res:Array<String>):void => {
          results = res;
          arr.push(3);
          console.log('All promises are resolved:', results);
          successMessage = `All promises are resolved: ${JSON.stringify(results)}`;
        }).catch((error: Error):void => {
          arr.push(9);
          errorMessage = 'At least one promise is rejected';
          console.error('At least one promise is rejected:', error.message);
        });
        arr.push(10);
        await Promise.all(taskPromises);
        await sleep(300);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,6,7,2,10,4,5,9]');
          expect(errorMessage).assertEqual('At least one promise is rejected');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,2,10,4,6,7,5,8,3]');
          expect(successMessage).assertEqual('All promises are resolved: ["Promise 1 Resolved","Promise 2 Resolved"]');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_ALL_TEST_3200
     * @tc.name PromiseAllTest3200
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'PromiseAllTest3200';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<Array<String>>[] = [];
        let results: string[] = [];
        arr.push(1);
        const promise1: Promise<string> = new Promise<string>((resolve):void => {
          setTimeout(() => {
            arr.push(4);
            resolve('Promise 1 Resolved');
          }, 100);
        });
        const promise2: Promise<string> = new Promise<string>((resolve):void => {
          setTimeout(() => {
            arr.push(5);
            resolve('Promise 2 Resolved');
          }, 200);
        });
        const allPromises: Promise<Array<String>> = Promise.all<String>([promise1, promise2]);
        taskPromises.push(allPromises);
        arr.push(2);
        promise1.then((result:string) => {
          arr.push(6);
          console.log('Promise 1 then start:', result);
          throw new Error('Exception in Promise 1 then');
        }).catch((error: Error):void => {
          arr.push(7);
          console.error('Error in Promise 1 then:', error.message);
        });
        promise2.then((result:string):void => {
          arr.push(8);
          console.log('Promise 2 then:', result);
        });
        arr.push(9);
        allPromises.then((res: string[]):void => {
          results = res;
          arr.push(3);
          console.log('All promises are resolved:', results);
          successMessage = `All promises are resolved: ${JSON.stringify(results)}`;
        }).catch((error: Error):void => {
          arr.push(10);
          errorMessage = 'At least one promise is rejected';
          console.error('At least one promise is rejected:', error.message);
        });
        arr.push(11);
        await Promise.all(taskPromises);
        await sleep(300);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,2,9,4,6,7,5,8,10,11]');
          expect(errorMessage).assertEqual('At least one promise is rejected');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,2,9,11,4,6,7,5,8,3]');
          expect(successMessage).assertEqual('All promises are resolved: ["Promise 1 Resolved","Promise 2 Resolved"]');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_ALL_TEST_3300
     * @tc.name PromiseAllTest3300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'PromiseAllTest3300';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<Array<String>>[] = [];
        let results: string[] = [];
        arr.push(1);
        const promise1: Promise<string> = new Promise<string>((_, reject):void => {
          setTimeout(() => {
            arr.push(4);
            reject(new Error('Promise 1 rejected'));
          }, 100);
        });
        const promise2: Promise<string> = new Promise<string>((_, reject):void => {
          setTimeout(() => {
            arr.push(5);
            reject(new Error('Promise 2 rejected'));
          }, 200);
        });
        const allPromises: Promise<Array<String>> = Promise.all<String>([promise1, promise2]);
        taskPromises.push(allPromises);
        arr.push(2);
        promise1.catch((error: Error):void => {
          arr.push(6);
          console.error('Error in Promise 1 catch:', error.message);
          errorMessage = 'Promise 1 is rejected';
        });
        promise2.catch((error: Error) :void=> {
          arr.push(7);
          console.error('Error in Promise 2 catch:', error.message);
          if (!errorMessage) {
            errorMessage = 'Promise 2 is rejected';
          }
        });
        arr.push(8);
        allPromises.catch((error: Error):void => {
          arr.push(3);
          console.error('Error in allPromises catch:', error.message);
          errorMessage = 'At least one promise in all is rejected';
        });
        arr.push(9);
        Promise.all(taskPromises);
        await sleep(300);
        expect(JSON.stringify(arr)).assertEqual('[1,2,8,9,4,6,3,5,7]');
        expect(errorMessage).assertEqual('At least one promise in all is rejected');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_ALL_TEST_3400
     * @tc.name PromiseAllTest3400
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'PromiseAllTest3400';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<Array<String>>[] = [];
        arr.push(1);
        const promise1: Promise<string> = new Promise<string>((_, reject):void => {
          setTimeout(() => {
            arr.push(4);
            reject(new Error('Promise 1 rejected'));
          }, 100);
        });
        const promise2: Promise<string> = new Promise<string>((_, reject):void => {
          setTimeout(() => {
            arr.push(5);
            reject(new Error('Promise 2 rejected'));
          }, 200);
        });
        promise1.catch((error: Error):void => {
          arr.push(6);
          console.error('Error in Promise 1 catch:', error.message);
          errorMessage = 'Promise 1 is rejected';
        });
        promise2.catch((error: Error):void => {
          arr.push(7);
          console.error('Error in Promise 2 catch:', error.message);
          if (!errorMessage) {
            errorMessage = 'Promise 2 is rejected';
          }
        });
        arr.push(2);
        const allPromises: Promise<Array<String>> = Promise.all<String>([promise1, promise2]);
        taskPromises.push(allPromises);
        allPromises.catch((error: Error):void => {
          arr.push(3);
          console.error('Error in allPromises catch:', error.message);
          errorMessage = 'At least one promise in all is rejected';
        });
        arr.push(8);
        Promise.all(taskPromises);
        await sleep(300);
        expect(JSON.stringify(arr)).assertEqual('[1,2,8,4,6,3,5,7]');
        expect(errorMessage).assertEqual('At least one promise in all is rejected');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_ALL_TEST_3500
     * @tc.name PromiseAllTest3500
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'PromiseAllTest3500';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<Array<String>>[] = [];
        let results: string[] = [];
        arr.push(1);
        const promise1: Promise<string> = new Promise<string>((resolve):void => {
          setTimeout(() => {
            arr.push(4);
            resolve('Promise 1 Resolved');
          }, 100);
        });
        const promise2: Promise<string> = new Promise<string>((resolve):void => {
          setTimeout(() => {
            arr.push(5);
            resolve('Promise 2 Resolved');
          }, 200);
        });
        promise1.then((result:string) => {
          arr.push(6);
          console.log('Promise 1 then:', result);
        });
        promise2.then((result:string) => {
          arr.push(7);
          console.log('Promise 2 then:', result);
        });
        arr.push(2);
        const allPromises: Promise<Array<String>> = Promise.all<String>([promise1, promise2]);
        taskPromises.push(allPromises);
        allPromises.finally(() => {
          arr.push(8);
          console.log('All promises are settled.');
          throw new Error('Exception in finally');
        }).catch((error: Error):void => {
          arr.push(9);
          errorMessage = `Error in finally: ${error.message}`;
          console.error(errorMessage);
        });
        arr.push(10);
        allPromises.then((res: string[]):void => {
          results = res;
          arr.push(3);
          console.log('All promises are resolved:', results);
          successMessage = `All promises are resolved: ${JSON.stringify(results)}`;
        }).catch((error: Error):void => {
          arr.push(11);
          errorMessage = `At least one promise is rejected: ${error.message}`;
          console.error(errorMessage);
        });
        arr.push(12);
        await Promise.all(taskPromises);
        await sleep(300);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,2,10,12,4,6,5,7,8,3,9]');
          expect(errorMessage).assertEqual('Error in finally: Exception in finally');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,2,10,12,4,6,5,7,8,3,9]');
          expect(successMessage).assertEqual('All promises are resolved: ["Promise 1 Resolved", "Promise 2 Resolved"]');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_ALL_TEST_3600
     * @tc.name PromiseAllTest3600
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'PromiseAllTest3600';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        const taskPromises: Promise<Array<String>>[] = [];
        let results: string[] = [];
        arr.push(1);
        const promise1: Promise<string> = new Promise<string>((resolve):void => {
          setTimeout(() => {
            arr.push(4);
            resolve('Promise 1 Resolved');
          }, 100);
        });
        const promise2: Promise<string> = new Promise<string>((resolve):void => {
          setTimeout(() => {
            arr.push(5);
            resolve('Promise 2 Resolved');
          }, 200);
        });
        promise1
          .then((result:string) => {
            arr.push(6);
            console.log('Promise 1 then:', result);
            return result;
          })
          .finally(() => {
            arr.push(7);
            console.log('Promise 1 finally start');
            throw new Error('Exception in Promise 1 finally');
          })
          .catch((error: Error):void => {
            arr.push(8);
            console.error('Error in Promise 1 finally:', error.message);
            errorMessage = `Error in Promise 1 finally: ${error.message}`;
          });
        promise2
          .then((result:string):string => {
            arr.push(9);
            console.log('Promise 2 then:', result);
            return result;
          })
          .finally(() => {
            arr.push(10);
            console.log('Promise 2 finally start');
            throw new Error('Exception in Promise 2 finally');
          });
        arr.push(2);
        const allPromises: Promise<Array<String>> = Promise.all<String>([promise1, promise2]);
        taskPromises.push(allPromises);
        allPromises
          .then((res:Array<String>):void => {
            results = res;
            arr.push(3);
            console.log('All promises are resolved:', results);
            successMessage = `All promises are resolved: ${JSON.stringify(results)}`;
          })
          .catch((error: Error):void => {
            arr.push(11);
            errorMessage = `At least one promise in all is rejected: ${error.message}`;
            console.error(errorMessage);
          });
        arr.push(12);
        await Promise.all(taskPromises);
        await sleep(300);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,2,12,4,6,7,8,5,9,10,3]');
          expect(errorMessage).assertEqual('Error in Promise 1 finally: Exception in Promise 1 finally');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,4,6,7,5,9,10,2,12,3]');
          expect(successMessage).assertEqual('All promises are resolved: ["Promise 1 Resolved", "Promise 2 Resolved"]');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_ALL_TEST_3700
     * @tc.name PromiseAllTest3700
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'PromiseAllTest3700';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        const taskPromises: Promise<Array<String>>[] = [];
        let results: string[] = [];
        arr.push(1);
        const promise1: Promise<string> = new Promise<string>((resolve) => {
          setTimeout(() => {
            arr.push(4);
            resolve('Promise 1 Resolved');
          }, 100);
        });
        const promise2: Promise<string> = new Promise<string>((resolve) => {
          setTimeout(() => {
            arr.push(5);
            resolve('Promise 2 Resolved');
          }, 200);
        });
        promise1
          .then((result:string) => {
            arr.push(6);
            console.log('Promise 1 then:', result);
            return result;
          })
          .finally(() => {
            arr.push(7);
            console.log('Promise 1 finally');
          });
        promise2
          .then((result:string) => {
            arr.push(8);
            console.log('Promise 2 then:', result);
            return result;
          })
          .finally(() => {
            arr.push(9);
            console.log('Promise 2 finally');
          });
        arr.push(2);
        const allPromises: Promise<Array<String>> = Promise.all<String>([promise1, promise2]);
        taskPromises.push(allPromises);
        allPromises
          .then((res:Array<String>) => {
            results = res;
            arr.push(3);
            console.log('All promises are resolved:', results);
            successMessage = `All promises are resolved: ${JSON.stringify(results)}`;
          })
          .catch((error: Error):void => {
            arr.push(10);
            errorMessage = `At least one promise in all is rejected: ${error.message}`;
            console.error(errorMessage);
          });
        arr.push(11);
        await Promise.all(taskPromises);
        await sleep(300);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,4,6,7,5,8,9,2,11,10]');
          expect(errorMessage).assertEqual('At least one promise in all is rejected');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,2,11,4,6,7,5,8,9,3]');
          expect(successMessage).assertEqual('All promises are resolved: ["Promise 1 Resolved","Promise 2 Resolved"]');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_ALL_TEST_3800
     * @tc.name PromiseAllTest3800
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'PromiseAllTest3800';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        const taskPromises: Promise<Array<String>>[] = [];
        let results: string[] = [];
        arr.push(1);
        const promise1: Promise<string> = new Promise<string>((_, reject):void => {
          setTimeout(() => {
            arr.push(4);
            reject(new Error('Promise 1 rejected'));
          }, 100);
        });
        const promise2: Promise<string> = new Promise<string>((_, reject):void => {
          setTimeout(() => {
            arr.push(5);
            reject(new Error('Promise 2 rejected'));
          }, 200);
        });
        const allPromises: Promise<Array<String>> = Promise.all<String>([promise1, promise2]);
        taskPromises.push(allPromises);
        arr.push(2);
        allPromises.finally(() => {
          arr.push(6);
          console.log('All promises are settled.');
          throw new Error('Exception in finally');
        }).catch((error: Error):void => {
          arr.push(7);
          errorMessage = `Error in finally: ${error.message}`;
          console.error(errorMessage);
        });
        arr.push(8);
        allPromises.then((res:Array<String>):void => {
          results = res;
          arr.push(3);
          console.log('All promises are resolved:', results);
          successMessage = `All promises are resolved: ${JSON.stringify(results)}`;
        }).catch((error: Error):void => {
          arr.push(9);
          if (!errorMessage) {
            errorMessage = `At least one promise in all is rejected: ${error.message}`;
          }
          console.error(errorMessage);
        });
        arr.push(10);
        try {
          await Promise.all(taskPromises);
        } catch (error) {
        }
        await sleep(300);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,2,8,10,4,6,7,9,5]');
          expect(errorMessage).assertEqual('Error in finally: Exception in finally');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,4,5,2,6,8,3,10]');
          expect(successMessage).assertEqual('All promises are resolved: ["Promise 1 Resolved", "Promise 2 Resolved"]');
        }
        console.info(`${caseName} test end`);
        Done();
      });

    /**f
     * @tc.number SUB_PROMISE_ALL_TEST_4100
     * @tc.name PromiseAllTest4100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'PromiseAllTest4100';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        const taskPromises: Promise<Array<String>>[] = [];
        let results: string[] = [];
        arr.push(1);
        const promise1: Promise<string> = new Promise<string>((resolve):void => {
          setTimeout(() => {
            arr.push(4);
            resolve('Promise 1 Resolved');
          }, 100);
        });
        const promise2: Promise<string> = new Promise<string>((resolve) => {
          setTimeout(() => {
            arr.push(5);
            resolve('Promise 2 Resolved');
          }, 200);
        });
        promise1
          .then((result:string) => {
            arr.push(6);
            console.log('Promise 1 then start:', result);
            throw new Error('Exception in Promise 1 then');
          })
          .catch((error: Error) => {
            arr.push(7);
            errorMessage = `Error in Promise 1 then: ${error.message}`;
            console.error(errorMessage);
          });
        promise2
          .then((result:string) => {
            arr.push(8);
            console.log('Promise 2 then:', result);
          });
        arr.push(2);
        const allPromises: Promise<Array<String>> = Promise.all<String>([promise1, promise2]);
        taskPromises.push(allPromises);
        allPromises
          .then((res:Array<String>) => {
            results = res;
            arr.push(3);
            console.log('All promises are resolved:', results);
            successMessage = `All promises are resolved: ${JSON.stringify(results)}`;
          })
          .catch((error: Error) => {
            arr.push(9);
            if (!errorMessage) {
              errorMessage = `At least one promise in all is rejected: ${error.message}`;
            }
            console.error(errorMessage);
          });
        arr.push(10);
        try {
          await Promise.all(taskPromises);
        } catch (error) {
          error = error as Error;
          console.log('Caught error in Promise.all:', error.message);
        }
        await sleep(300);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,2,10,4,6,7,5,8,3]');
          expect(errorMessage).assertEqual('Error in Promise 1 then: Exception in Promise 1 then');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,4,6,5,8,2,10,3]');
          expect(successMessage).assertEqual('All promises are resolved: ["Promise 1 Resolved", "Promise 2 Resolved"]');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_ALL_TEST_4200
     * @tc.name PromiseAllTest4200
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'PromiseAllTest4200';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        const taskPromises: Promise<Array<String>>[] = [];
        let results: string[] = [];
        arr.push(1);
        const promise1: Promise<string> = new Promise<string>((resolve) => {
          setTimeout(() => {
            arr.push(4);
            resolve('Promise 1 Resolved');
          }, 100);
        });
        const promise2: Promise<string> = new Promise<string>((resolve) => {
          setTimeout(() => {
            arr.push(5);
            resolve('Promise 2 Resolved');
          }, 200);
        });
        const allPromises: Promise<Array<String>> = Promise.all<String>([promise1, promise2]);
        taskPromises.push(allPromises);
        arr.push(2);
        allPromises
          .then((res:Array<string>):void => {
            results = res;
            arr.push(6);
            console.log('All promises are resolved initially:', results);
            throw new Error('Exception in allPromises then');
          })
          .catch((error: Error) => {
            arr.push(7);
            errorMessage = `Error in allPromises then: ${error.message}`;
            console.error(errorMessage);
          });
        arr.push(8);
        allPromises
          .then((res:Array<string>):void => {
            results = res;
            arr.push(3);
            console.log('All promises are resolved again:', results);
            successMessage = `All promises are resolved: ${JSON.stringify(results)}`;
          })
          .catch((error: Error) => {
            arr.push(9);
            if (!errorMessage) {
              errorMessage = `At least one promise in all is rejected: ${error.message}`;
            }
            console.error(errorMessage);
          });
        arr.push(10);
        try {
          await Promise.all(taskPromises);
        } catch (error) {
          error = error as Error;
          console.log('Caught error in Promise.all:', (error as Error).message);
        }
        await sleep(300);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,2,8,10,4,5,6,3,7]');
          expect(errorMessage).assertEqual('Error in allPromises then: Exception in allPromises then');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,4,5,2,6,8,3,10]');
          expect(successMessage).assertEqual('All promises are resolved: ["Promise 1 Resolved", "Promise 2 Resolved"]');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_ALL_TEST_4300
     * @tc.name PromiseAllTest4300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'PromiseAllTest4300';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        const taskPromises: Promise<Array<String>>[] = [];
        let results: string[] = [];
        arr.push(1);
        const promise1: Promise<string> = new Promise<string>((resolve):void => {
          setTimeout(() => {
            arr.push(4);
            resolve('Promise 1 Resolved');
          }, 100);
        });
        const promise2: Promise<string> = new Promise<string>((resolve):void => {
          setTimeout(() => {
            arr.push(5);
            resolve('Promise 2 Resolved');
          }, 200);
        });
        const allPromises: Promise<Array<String>> = Promise.all<String>([promise1, promise2]);
        taskPromises.push(allPromises);
        arr.push(2);
        allPromises
          .then((res:Array<string>) => {
            results = res;
            arr.push(6);
            console.log('All promises are resolved initially:', results);
            throw new Error('Exception in allPromises then');
          })
          .catch((error: Error) => {
            arr.push(7);
            errorMessage = `Error in allPromises then: ${error.message}`;
            console.error(errorMessage);
          });
        arr.push(8);
        try {
          await Promise.all(taskPromises);
        } catch (error) {
          error = error as Error;
          console.log('Caught error in Promise.all:', (error as Error).message);
        }
        await sleep(300);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,2,8,4,5,6,7]');
          expect(errorMessage).assertEqual('Error in allPromises then: Exception in allPromises then');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,4,5,2,6,8]');
          expect(successMessage).assertEqual('All promises are resolved: ["Promise 1 Resolved", "Promise 2 Resolved"]');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_ALL_TEST_4400
     * @tc.name PromiseAllTest4400
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'PromiseAllTest4400';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        const taskPromises: Promise<Array<String>>[] = [];
        let results: string[] = [];
        arr.push(1);
        let resolvePromise1: ((value: string) => void) | undefined;
        const promise1: Promise<string> = new Promise<string>((resolve):void => {
          resolvePromise1 = resolve;
        });
        let resolvePromise2: ((value: string) => void) | undefined;
        const promise2: Promise<string> = new Promise<string>((resolve):void => {
          resolvePromise2 = resolve;
        });
        const allPromises: Promise<Array<String>> = Promise.all<String>([promise1, promise2]);
        taskPromises.push(allPromises);
        arr.push(2);
        setTimeout(() => {
          arr.push(3);
          resolvePromise1!('Promise 1 Resolved');
        }, 100);
        allPromises
          .then((res:Array<string>) => {
            results = res;
            arr.push(4);
            console.log('All promises are resolved:', results);
            successMessage = `All promises are resolved: ${JSON.stringify(results)}`;
          })
          .catch((error: Error) => {
            arr.push(5);
            errorMessage = `At least one promise in all is rejected: ${error.message}`;
            console.error(errorMessage);
          });
        arr.push(6);
        promise2.then((result:string) => {
          arr.push(7);
          console.log('Promise 2 then:', result);
        });
        setTimeout(() => {
          arr.push(8);
          resolvePromise2!('Promise 2 Resolved');
        }, 200);
        try {
          await Promise.all(taskPromises);
        } catch (error) {
          error = error as Error;
          console.log('Caught error in Promise.all:', (error as Error).message);
        }
        await sleep(300);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,2,3,5,6,8,7]');
          expect(errorMessage).assertEqual('At least one promise in all is rejected');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,2,6,3,8,7,4]');
          expect(successMessage).assertEqual('All promises are resolved: ["Promise 1 Resolved","Promise 2 Resolved"]');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_ALL_TEST_4500
     * @tc.name PromiseAllTest4500
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'PromiseAllTest4500';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        const taskPromises: Promise<Array<String>>[] = [];
        let results: string[] = [];
        arr.push(1);
        let resolvePromise1: ((value: string) => void) | undefined;
        const promise1: Promise<string> = new Promise<string>((resolve):void => {
          resolvePromise1 = resolve;
        });
        let rejectPromise2: ((reason: Error) => void) | undefined;
        const promise2: Promise<string> = new Promise<string>((_, reject):void => {
          rejectPromise2 = reject;
        });
        const allPromises: Promise<Array<String>> = Promise.all<String>([promise1, promise2]);
        taskPromises.push(allPromises);
        arr.push(2);
        allPromises
          .then((res:Array<string>) => {
            results = res;
            arr.push(3);
            console.log('All promises are resolved:', results);
            successMessage = `All promises are resolved: ${JSON.stringify(results)}`;
          })
          .catch((error: Error) => {
            arr.push(4);
            errorMessage = `At least one promise in all is rejected: ${error.message}`;
            console.error(errorMessage);
          });
        arr.push(5);
        promise1.then((result:String) => {
          arr.push(6);
          console.log('Promise 1 then:', result);
        });
        promise2.catch((error: Error) => {
          arr.push(7);
          console.error('Promise 2 catch:', error.message);
        });
        setTimeout(() => {
          arr.push(8);
          resolvePromise1!('Promise 1 Resolved');
        }, 100);
        setTimeout(() => {
          arr.push(9);
          rejectPromise2!(new Error('Promise 2 Rejected'));
        }, 200);
        try {
          await Promise.all(taskPromises);
        } catch (error) {
          error = error as Error;
          console.log('Caught error in Promise.all:', (error as Error).message);
        }
        await sleep(300);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,2,5,8,6,9,7,4]');
          expect(errorMessage).assertEqual('At least one promise in all is rejected: Promise 2 Rejected');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,2,5,8,6,9,3]');
          expect(successMessage).assertEqual('All promises are resolved: ["Promise 1 Resolved", "Promise 2 Resolved"]');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_ALL_TEST_4600
     * @tc.name PromiseAllTest4600
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'PromiseAllTest4600';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        const taskPromises: Promise<Array<String>>[] = [];
        let results: string[] = [];
        arr.push(1);
        let resolvePromise1: ((value: string) => void) | undefined;
        const promise1: Promise<string> = new Promise<string>((resolve):void => {
          resolvePromise1 = resolve;
        });
        let rejectPromise2: ((reason: Error) => void) | undefined;
        const promise2: Promise<string> = new Promise<string>((_, reject):void => {
          rejectPromise2 = reject;
        });
        const allPromises: Promise<Array<String>> = Promise.all<String>([promise1, promise2]);
        taskPromises.push(allPromises);
        arr.push(2);
        allPromises
          .then((res:Array<string>) => {
            results = res;
            arr.push(3);
            console.log('All promises are resolved:', results);
            successMessage = `All promises are resolved: ${JSON.stringify(results)}`;
          })
          .catch((error: Error) => {
            arr.push(4);
            errorMessage = `At least one promise in all is rejected: ${error.message}`;
            console.error(errorMessage);
          });
        arr.push(5);
        promise1.then((result:string) => {
          arr.push(6);
          console.log('Promise 1 then:', result);
        });
        promise2.catch((error: Error) => {
          arr.push(7);
          console.error('Promise 2 catch:', error.message);
        });
        setTimeout(() => {
          arr.push(8);
          resolvePromise1!('Promise 1 Resolved');
        }, 100);
        setTimeout(() => {
          arr.push(9);
          rejectPromise2!(new Error('Promise 2 Rejected'));
        }, 200);
        try {
          await Promise.all(taskPromises);
        } catch (error) {
          error = error as Error;
          console.log('Caught error in Promise.all:', (error as Error).message);
        }
        await sleep(300);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,2,5,8,6,9,7,4]');
          expect(errorMessage).assertEqual('At least one promise in all is rejected: Promise 2 Rejected');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,2,5,8,6,9,3]');
          expect(successMessage).assertEqual('All promises are resolved: ["Promise 1 Resolved", "Promise 2 Resolved"]');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_ALL_TEST_4700
     * @tc.name PromiseAllTest4700
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'PromiseAllTest4700';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        const taskPromises: Promise<Array<String>>[] = [];
        let results: string[] = [];
        arr.push(1);
        let resolvePromise1: ((value: string) => void) | undefined;
        let rejectPromise1: ((reason: Error) => void) | undefined;
        const promise1: Promise<string> = new Promise<string>((resolve, reject) => {
          resolvePromise1 = resolve;
          rejectPromise1 = reject;
        });
        let resolvePromise2: ((value: string) => void) | undefined;
        const promise2: Promise<string> = new Promise<string>((resolve):void => {
          resolvePromise2 = resolve;
        });
        const allPromises: Promise<Array<String>> = Promise.all<String>([promise1, promise2]);
        taskPromises.push(allPromises);
        arr.push(2);
        promise1.catch((error: Error) => {
          arr.push(3);
          console.error('Promise 1 catch:', error.message);
        });
        allPromises
          .then((res:Array<string>) => {
            results = res;
            arr.push(4);
            console.log('All promises are resolved:', results);
            successMessage = `All promises are resolved: ${JSON.stringify(results)}`;
          })
          .catch((error: Error) => {
            arr.push(5);
            errorMessage = `At least one promise in all is rejected: ${error.message}`;
            console.error(errorMessage);
          });
        arr.push(6);
        promise2.then((result:string) => {
          arr.push(7);
          console.log('Promise 2 then:', result);
        });
        setTimeout(() => {
          arr.push(8);
          rejectPromise1!(new Error('Promise 1 Rejected'));
        }, 100);
        setTimeout(() => {
          arr.push(9);
          resolvePromise2!('Promise 2 Resolved');
        }, 200);
        try {
          await Promise.all(taskPromises);
        } catch (error) {
          error = error as Error;
          console.log('Caught error in Promise.all:', (error as Error).message);
        }
        await sleep(300);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,2,6,8,3,5,9,7]');
          expect(errorMessage).assertEqual('At least one promise in all is rejected: Promise 1 Rejected');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,2,8,9,7,4]');
          expect(successMessage).assertEqual('All promises are resolved: ["Promise 1 Resolved", "Promise 2 Resolved"]');
        }
        console.info(`${caseName} test end`);
        Done();
      });

  })
}