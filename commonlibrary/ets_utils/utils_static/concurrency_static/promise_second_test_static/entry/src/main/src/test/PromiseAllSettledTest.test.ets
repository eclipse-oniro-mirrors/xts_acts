/*
* Copyright (C) 2025-2026 HiHope Open Source Organization.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Size, Level, TestType } from "../../../hypium/index";
import { sleep } from "../testability/pages/TestUtils";

interface CustomObject {
  id: number;
  isValid: boolean;
}

export default function PromiseAllSettledTest() {
  describe('PromiseAllSettledTest', (): void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll((): void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (): Promise<void> => {
      await sleep(100);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach((): void => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll((): void => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })


    /**
     * @tc.number SUB_PROMISE_ALLSETTLED_TEST_0100
     * @tc.name PromiseAllSettledTest0100
     * @tc.desc test string[]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllSettledTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'PromiseAllSettledTest0100';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<string>[] = [];
        arr.push(1);
        const stringArray: string[] = ['dog', 'elephant', 'cat'];
        const asyncOperations = stringArray.map((str : string) => {
          arr.push(2);
          return new Promise<string>((resolve, reject) => {
            setTimeout(() => {
              if (str.length > 3) {
                arr.push(3);
                resolve(str.toUpperCase());
              } else {
                arr.push(3);
                reject(new Error(`String "${str}" is too short`));
              }
            }, 200);
          });
        });
        taskPromises.push(...asyncOperations);
        arr.push(4);
        Promise.allSettled<string>(asyncOperations)
          .then((results: PromiseSettledResult<string>[]) => {
            arr.push(5);
            results.forEach((result:PromiseSettledResult<string>) => {
              if (result.status === 'fulfilled') {
                let result1 = result as PromiseFulfilledResult<string>;
                successMessage += `${result1.value} `;
                console.log('All promises are settled, fulfilled results:', successMessage);
              } else {
                let result1 = result as PromiseRejectedResult;
                errorMessage += `${result1.reason.message } `;
                console.log('All promises are settled, rejected reasons:', errorMessage);
              }
            });
          })
          .catch((error: Error) => {
            arr.push(6);
            console.error('An error occurred while using Promise.allSettled:', error.message);
          });
        arr.push(7);
        await sleep(300);
        try {
          await Promise.all(taskPromises);
        } catch (e) {
          console.log('e:' + e);
        }
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,2,2,2,4,7,3,3,3,5]');
          expect(errorMessage).assertEqual('String "dog" is too short String "cat" is too short ');
        } else {
          const expectedSuccess =
            stringArray.filter((str: string) => str.length > 3).map((str: string) => str.toUpperCase()).join(' ') + ' ';
          expect(JSON.stringify(arr)).assertEqual('[1,2,3,2,3,2,3,4,5,7]');
          expect(successMessage).assertEqual(expectedSuccess);
        }
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.number SUB_PROMISE_ALLSETTLED_TEST_0500
     * @tc.name PromiseAllSettledTest0500
     * @tc.desc test object[]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllSettledTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'PromiseAllSettledTest0500';
        console.info(`${caseName} test start`);

        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<CustomObject>[] = [];
        arr.push(1);
        const objectArray: CustomObject[] = [
          {
            id: 1, isValid: true
          }as CustomObject,
          {
            id: 2, isValid: false
          }as CustomObject,
          {
            id: 3, isValid: true
          }as CustomObject
        ];
        const asyncOperations: Promise<CustomObject>[] = objectArray.map((obj:CustomObject) => {
          arr.push(2);
          return new Promise<CustomObject>((resolve, reject) => {
            setTimeout(() => {
              if (obj.isValid) {
                arr.push(3);
                resolve(obj);
              } else {
                arr.push(4);
                reject(new Error(`Object with id ${obj.id} is not valid`));
              }
            }, 200);
          });
        });
        taskPromises.push(...asyncOperations);
        arr.push(5);
        Promise.allSettled<CustomObject>(asyncOperations)
          .then((results: PromiseSettledResult<CustomObject>[]) => {
            arr.push(6);
            results.forEach((result:PromiseSettledResult<CustomObject>) => {
              if (result.status === 'fulfilled') {
                let result1 = result as PromiseFulfilledResult<CustomObject>;
                successMessage += `${result1.value} `;
                console.log('All promises are settled, fulfilled results:', successMessage);
              } else {
                let result1 = result as PromiseRejectedResult;
                errorMessage += `${result1.reason.message } `;
                console.log('All promises are settled, rejected reasons:', errorMessage);
              }
            });
          })
          .catch((error: Error): void => {
            arr.push(7);
            console.error('An error occurred while using Promise.allSettled:', error.message);
          });

        arr.push(8);
        try {
          await Promise.all<Promise<CustomObject>>(taskPromises);
        } catch (e) {
          console.log('e:' + (e as Error).message);
        }
        await sleep(300);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,2,2,2,5,8,3,4,3,6]');
          expect(errorMessage).assertEqual('Object with id 2 is not valid ');
        } else {
          const expectedSuccess =
            objectArray.filter((obj:CustomObject) => obj.isValid).map((obj:CustomObject) => JSON.stringify(obj)).join(' ') + ' ';
          expect(JSON.stringify(arr)).assertEqual('[1,2,2,2,5,8,3,4,3,6]');
          expect(successMessage).assertEqual(expectedSuccess);
        }
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.number SUB_PROMISE_ALLSETTLED_TEST_0700
     * @tc.name PromiseAllSettledTest0700
     * @tc.desc test []
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllSettledTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'PromiseAllSettledTest0700';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<null>[] = [];
        arr.push(1);
        const emptyArray: Array<null> = [];
        const asyncOperations = emptyArray.map(() => {
          arr.push(2);
          return new Promise<null>((resolve) => {
            setTimeout(() => {
              arr.push(3);
              resolve(null);
            }, 200);
          });
        });
        taskPromises.push(...asyncOperations);
        arr.push(5);
        Promise.allSettled(asyncOperations)
          .then((results: Array<PromiseSettledResult<null>>) => {
            arr.push(6);
            results.forEach((result) => {
              if (result.status === 'fulfilled') {
                let result1 = result as PromiseFulfilledResult<null>;
                successMessage += `${result1.value} `;
                console.log('All promises are settled, fulfilled results:', successMessage);
              } else {
                let result1 = result as PromiseRejectedResult;
                errorMessage += `${result1.reason.message } `;
                console.log('All promises are settled, rejected reasons:', errorMessage);
              }
            });
          })
          .catch((error: Error) => {
            arr.push(7);
            console.error('An error occurred while using Promise.allSettled:', error.message);
          });
        arr.push(8);
        try {
          await Promise.all(taskPromises);
        } catch (e) {
          console.log('e:' + (e as Error).message);
        }
        await sleep(300);
        expect(JSON.stringify(arr)).assertEqual('[1,5,8,6]');
        expect(successMessage).assertEqual('');
        expect(errorMessage).assertEqual('');
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.number SUB_PROMISE_ALLSETTLED_TEST_1000
     * @tc.name PromiseAllSettledTest1000
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllSettledTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'PromiseAllSettledTest1000';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<number>[] = [];
        arr.push(1);
        const firstPromise = new Promise<number>((resolve) => {
          setTimeout(() => {
            arr.push(3);
            resolve(1);
          }, 200);
        });
        const secondPromise = new Promise<number>((_, reject) => {
          setTimeout(() => {
            arr.push(4);
            reject(new Error('Second promise failed'));
          }, 200);
        });
        const thirdPromise = new Promise<number>((resolve) => {
          setTimeout(() => {
            arr.push(3);
            resolve(3);
          }, 200);
        });
        const asyncOperations = [firstPromise, secondPromise, thirdPromise];
        taskPromises.push(...asyncOperations);
        arr.push(5);
        Promise.allSettled<number>(asyncOperations)
          .then((results: PromiseSettledResult<number>[]) => {
            arr.push(6);
            results.forEach((result) => {
              if (result.status === 'fulfilled') {
                let result1 = result as PromiseFulfilledResult<number>;
                successMessage += `${result1.value} `;
                console.log('All promises are settled, fulfilled results:', successMessage);
              } else {
                let result1 = result as PromiseRejectedResult;
                errorMessage += `${result1.reason.message } `;
                console.log('All promises are settled, rejected reasons:', errorMessage);
              }
            });
          })
          .catch((error: Error) => {
            arr.push(7);
            console.error('An error occurred while using Promise.allSettled:', error.message);
          });
        arr.push(8);
        try {
          await Promise.all(taskPromises);
        } catch (e) {
          console.log('e:' + (e as Error).message);
        }
        await sleep(300);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,5,8,3,4,3,6]');
          expect(errorMessage).assertEqual('Second promise failed ');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,5,8,3,3,3,6]');
          expect(successMessage).assertEqual('1 3 ');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_ALLSETTLED_TEST_1100
     * @tc.name PromiseAllSettledTest1100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllSettledTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'PromiseAllSettledTest1100';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<number>[] = [];
        arr.push(1);
        const firstPromise = new Promise<number>((_, reject) => {
          setTimeout(() => {
            arr.push(4);
            reject(new Error('First promise failed'));
          }, 200);
        });
        const secondPromise = new Promise<number>((_, reject) => {
          setTimeout(() => {
            arr.push(4);
            reject(new Error('Second promise failed'));
          }, 200);
        });
        const thirdPromise = new Promise<number>((_, reject) => {
          setTimeout(() => {
            arr.push(4);
            reject(new Error('Third promise failed'));
          }, 200);
        });
        const asyncOperations = [firstPromise, secondPromise, thirdPromise];
        taskPromises.push(...asyncOperations);
        arr.push(5);
        Promise.allSettled<number>(asyncOperations)
          .then((results: PromiseSettledResult<number>[]) => {
            arr.push(6);
            results.forEach((result) => {
              if (result.status === 'fulfilled') {
                let result1 = result as PromiseFulfilledResult<number>;
                successMessage += `${result1.value} `;
                console.log('All promises are settled, fulfilled results:', successMessage);
              } else {
                let result1 = result as PromiseRejectedResult;
                errorMessage += `${result1.reason.message } `;
                console.log('All promises are settled, rejected reasons:', errorMessage);
              }
            });
          })
          .catch((error: Error) => {
            arr.push(7);
            console.error('An error occurred while using Promise.allSettled:', error.message);
          });
        arr.push(8);
        try {
          await Promise.all(taskPromises);
        } catch (e) {
          console.log('e:' + (e as Error).message);
        }
        await sleep(300);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,5,8,4,4,4,6]');
          expect(errorMessage).assertEqual('First promise failed Second promise failed Third promise failed ');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,5,8,3,3,3,6]');
          expect(successMessage).assertEqual('1 2 3 ');
        }
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.number SUB_PROMISE_ALLSETTLED_TEST_1500
     * @tc.name PromiseAllSettledTest1500
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllSettledTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'PromiseAllSettledTest1500';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<number>[] = [];
        arr.push(1);
        const rejectedPromise = new Promise<number>((_, reject) => {
          reject(new Error('Promise was rejected during construction'));
        });
        const asyncOperations = [rejectedPromise];
        taskPromises.push(...asyncOperations);
        arr.push(5);
        Promise.allSettled<number>(asyncOperations)
          .then((results: PromiseSettledResult<number>[]) => {
            arr.push(6);
            results.forEach((result) => {
              if (result.status === 'fulfilled') {
                let result1 = result as PromiseFulfilledResult<number>;
                successMessage += `${result1.value} `;
                console.log('All promises are settled, fulfilled results:', successMessage);
              }
            });
          })
          .catch((error: Error) => {
            arr.push(7);
            errorMessage = error.message;
            console.log('All promises are settled, rejected reasons:', errorMessage);
          });
        arr.push(8);
        try {
          await Promise.all(taskPromises);
        } catch (e) {
          console.log('e:' + (e as Error).message);
        }
        await sleep(300);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,5,8,7]');
          expect(errorMessage).assertEqual('Promise was rejected during construction');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,5,8,6]');
          expect(successMessage).assertEqual('');
        }
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.number SUB_PROMISE_ALLSETTLED_TEST_2100
     * @tc.name PromiseAllSettledTest2100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllSettledTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'PromiseAllSettledTest2100';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<string>[] = [];
        arr.push(1);
        const innerFailurePromise1 = new Promise<string>((_, reject) => {
          setTimeout(() => {
            reject(new Error('Inner promise 1 failed'));
          }, 500);
        });
        const innerFailurePromise2 = new Promise<string>((_, reject) => {
          setTimeout(() => {
            reject(new Error('Inner promise 2 failed'));
          }, 600);
        });
        const outerFailurePromise = new Promise<string>((_, reject) => {
          setTimeout(() => {
            reject(new Error('Outer promise failed'));
          }, 700);
        });
        taskPromises.push(innerFailurePromise1);
        taskPromises.push(innerFailurePromise2);
        taskPromises.push(outerFailurePromise);
        arr.push(5);
        Promise.allSettled(taskPromises)
          .then((value) => {
            arr.push(6);
            successMessage = 'success';
            console.log('Promise.any result:', successMessage);
          })
          .catch((error: Error) => {
            arr.push(7);
            errorMessage = error.message;
            console.log('Promise.any error:', errorMessage);
          });
        arr.push(8);
        Promise.all(taskPromises);
        await sleep(1000);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,5,8,7]');
          expect(errorMessage).assertEqual('All promises were rejected');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,5,8,6]');
          expect(successMessage).assertEqual('success');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_ALLSETTLED_TEST_2200
     * @tc.name PromiseAllSettledTest2200
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseAllSettledTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'PromiseAllSettledTest2200';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: (Promise<string> | Promise<PromiseSettledResult<string>[]>)[]= [];
        arr.push(1);
        const innerSuccessPromise: Promise<string> = new Promise<string>((resolve: (value: string) => void):void => {
          setTimeout(() => {
            resolve('Inner success');
          }, 200);
        });
        const innerFailurePromise: Promise<string> =
          new Promise<string>((_: (value: string) => void, reject: (reason: Error) => void):void => {
            setTimeout(() => {
              reject(new Error('Inner failure'));
            }, 300);
          });
        const outerSuccessPromise: Promise<string> = new Promise<string>((resolve: (value: string) => void):void => {
          setTimeout(() => {
            resolve('Outer success');
          }, 400);
        });
        const innerAllSettled: Promise<PromiseSettledResult<string>[]> =
          Promise.allSettled([innerSuccessPromise, innerFailurePromise]);
        taskPromises.push(innerAllSettled);
        taskPromises.push(outerSuccessPromise);
        arr.push(5);
        Promise.allSettled(taskPromises)
          .then((value) => {
            arr.push(6);
            successMessage = 'success';
            console.log('Promise.allSettled result:', successMessage);
          })
          .catch((error: Error) => {
            arr.push(7);
            errorMessage = error.message;
            console.log('Promise.allSettled error:', errorMessage);
          });
        arr.push(8);
        await Promise.all(taskPromises);
        await sleep(1000);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,5,8,7]');
          expect(errorMessage).assertEqual('All promises were rejected');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,5,8,6]');
          expect(successMessage).assertEqual('success');
        }
        console.info(`${caseName} test end`);
        Done();
      });

  })
}