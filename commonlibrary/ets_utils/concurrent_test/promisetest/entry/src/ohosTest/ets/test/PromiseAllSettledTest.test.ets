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

export default function PromiseAllSettledTest() {
  describe('PromiseAllSettledTest', () => {
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
     * @tc.name   PromiseAllSettledTest0100
     * @tc.number SUB_PROMISE_ALLSETTLED_TEST_0100
     * @tc.desc   test string[]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllSettledTest0100';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<string>[] = [];
        arr.push(1);
        const stringArray: string[] = ['dog', 'elephant', 'cat'];
        const asyncOperations = stringArray.map((str) => {
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
        Promise.allSettled(asyncOperations)
          .then((results) => {
            arr.push(5);
            results.forEach((result) => {
              if (result.status === 'fulfilled') {
                successMessage += `${result.value} `;
                console.log('All promises are settled, fulfilled results:', successMessage);
              } else {
                errorMessage += `${result.reason.message} `;
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
            stringArray.filter(str => str.length > 3).map(str => str.toUpperCase()).join(' ') + ' ';
          expect(JSON.stringify(arr)).assertEqual('[1,2,3,2,3,2,3,4,5,7]');
          expect(successMessage).assertEqual(expectedSuccess);
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseAllSettledTest0200
     * @tc.number SUB_PROMISE_ALLSETTLED_TEST_0200
     * @tc.desc   test number[]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllSettledTest0200';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<number>[] = [];
        arr.push(1);
        const numberArray: number[] = [1, 2, 3];
        const asyncOperations = numberArray.map((num) => {
          arr.push(2);
          return new Promise<number>((resolve, reject) => {
            setTimeout(() => {
              if (num % 2 === 0) {
                arr.push(3);
                resolve(num * 2);
              } else {
                arr.push(3);
                reject(new Error(`Number ${num} is not an even number`));
              }
            }, 200);
          });
        });
        taskPromises.push(...asyncOperations);
        arr.push(4);
        Promise.allSettled(asyncOperations)
          .then((results) => {
            arr.push(5);
            results.forEach((result) => {
              if (result.status === 'fulfilled') {
                successMessage += `${result.value} `;
                console.log('All promises are settled, fulfilled results:', successMessage);
              } else {
                errorMessage += `${result.reason.message} `;
                console.log('All promises are settled, rejected reasons:', errorMessage);
              }
            });
          })
          .catch((error: Error) => {
            arr.push(6);
            console.error('An error occurred while using Promise.allSettled:', error.message);
          });
        arr.push(7);
        try {
          await Promise.all(taskPromises);
        } catch (e) {
          console.log('e:' + e);
        }
        await sleep(300);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,2,2,2,4,7,3,3,3,5]');
          expect(errorMessage).assertEqual('Number 1 is not an even number Number 3 is not an even number ');
        } else {
          const expectedSuccess = numberArray.filter(num => num % 2 === 0).map(num => num * 2).join(' ') + ' ';
          expect(JSON.stringify(arr)).assertEqual('[1,2,3,2,3,2,3,4,5,7]');
          expect(successMessage).assertEqual(expectedSuccess);
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseAllSettledTest0300
     * @tc.number SUB_PROMISE_ALLSETTLED_TEST_0300
     * @tc.desc   test boolean[]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllSettledTest0300';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<boolean>[] = [];
        arr.push(1);
        const booleanArray: boolean[] = [true, false, true];
        const asyncOperations = booleanArray.map((bool) => {
          arr.push(2);
          return new Promise<boolean>((resolve, reject) => {
            setTimeout(() => {
              if (bool) {
                arr.push(3);
                resolve(bool);
              } else {
                arr.push(4);
                reject(new Error(`Boolean value is false`));
              }
            }, 200);
          });
        });
        taskPromises.push(...asyncOperations);
        arr.push(5);
        Promise.allSettled(asyncOperations)
          .then((results) => {
            arr.push(6);
            results.forEach((result) => {
              if (result.status === 'fulfilled') {
                successMessage += `${result.value} `;
                console.log('All promises are settled, fulfilled results:', successMessage);
              } else {
                errorMessage += `${result.reason.message} `;
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
          console.log('e:' + e);
        }
        await sleep(300);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,2,2,2,5,8,3,4,3,6]');
          expect(errorMessage).assertEqual('Boolean value is false ');
        } else {
          const expectedSuccess = booleanArray.filter(bool => bool).join(' ') + ' ';
          expect(JSON.stringify(arr)).assertEqual('[1,2,2,2,5,8,3,4,3,6]');
          expect(successMessage).assertEqual(expectedSuccess);
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseAllSettledTest0400
     * @tc.number SUB_PROMISE_ALLSETTLED_TEST_0400
     * @tc.desc   test bigint[]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllSettledTest0400';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<bigint>[] = [];
        arr.push(1);
        const bigIntArray: bigint[] = [1n, 2n, 3n];
        const asyncOperations = bigIntArray.map((bigIntValue) => {
          arr.push(2);
          return new Promise<bigint>((resolve, reject) => {
            setTimeout(() => {
              if (bigIntValue % 2n === 0n) {
                arr.push(3);
                resolve(bigIntValue * 2n);
              } else {
                arr.push(4);
                reject(new Error(`BigInt value ${bigIntValue} is not an even number`));
              }
            }, 200);
          });
        });
        taskPromises.push(...asyncOperations);
        arr.push(5);
        Promise.allSettled(asyncOperations)
          .then((results) => {
            arr.push(6);
            results.forEach((result) => {
              if (result.status === 'fulfilled') {
                successMessage += `${result.value} `;
                console.log('All promises are settled, fulfilled results:', successMessage);
              } else {
                errorMessage += `${result.reason.message} `;
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
          console.log('e:' + e);
        }
        await sleep(300);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,2,2,2,5,8,4,3,4,6]');
          expect(errorMessage)
            .assertEqual('BigInt value 1 is not an even number BigInt value 3 is not an even number ');
        } else {
          const expectedSuccess =
            bigIntArray.filter(bigIntValue => bigIntValue % 2n === 0n).map(bigIntValue => bigIntValue * 2n).join(' ') +
              ' ';
          expect(JSON.stringify(arr)).assertEqual('[1,2,2,2,5,8,3,4,3,6]');
          expect(successMessage).assertEqual(expectedSuccess);
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseAllSettledTest0500
     * @tc.number SUB_PROMISE_ALLSETTLED_TEST_0500
     * @tc.desc   test object[]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllSettledTest0500';
        console.info(`${caseName} test start`);

        interface CustomObject {
          id: number;
          isValid: boolean;
        }

        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<CustomObject>[] = [];
        arr.push(1);
        const objectArray: CustomObject[] = [
          {
            id: 1, isValid: true
          },
          {
            id: 2, isValid: false
          },
          {
            id: 3, isValid: true
          }
        ];
        const asyncOperations: Promise<CustomObject>[] = objectArray.map((obj: CustomObject): Promise<CustomObject> => {
          arr.push(2);
          return new Promise((resolve: (value: CustomObject) => void, reject: (reason: Error) => void): void => {
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
        Promise.allSettled(asyncOperations)
          .then((results: PromiseSettledResult<CustomObject>[]): void => {
            arr.push(6);
            results.forEach((result: PromiseSettledResult<CustomObject>): void => {
              if (result.status === 'fulfilled') {
                successMessage += `${JSON.stringify(result.value)} `;
                console.log('All promises are settled, fulfilled results:', successMessage);
              } else {
                errorMessage += `${result.reason.message} `;
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
          await Promise.all(taskPromises);
        } catch (e) {
          console.log('e:' + (e as Error).message);
        }
        await sleep(300);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,2,2,2,5,8,3,4,3,6]');
          expect(errorMessage).assertEqual('Object with id 2 is not valid ');
        } else {
          const expectedSuccess =
            objectArray.filter((obj: CustomObject) => obj.isValid).map((obj) => JSON.stringify(obj)).join(' ') + ' ';
          expect(JSON.stringify(arr)).assertEqual('[1,2,2,2,5,8,3,4,3,6]');
          expect(successMessage).assertEqual(expectedSuccess);
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseAllSettledTest0600
     * @tc.number SUB_PROMISE_ALLSETTLED_TEST_0600
     * @tc.desc   test promise[]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllSettledTest0600';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<number>[] = [];
        arr.push(1);
        const createPromise = (value: number): Promise<number> => {
          return new Promise((resolve, reject) => {
            setTimeout(() => {
              if (value % 2 === 0) {
                arr.push(3);
                resolve(value * 2);
              } else {
                arr.push(4);
                reject(new Error(`Number ${value} is not an even number`));
              }
            }, 200);
          });
        };
        const promiseArray: Promise<number>[] = [
          createPromise(1),
          createPromise(2),
          createPromise(3)
        ];
        taskPromises.push(...promiseArray);
        arr.push(5);
        Promise.allSettled(promiseArray)
          .then((results: PromiseSettledResult<number>[]): void => {
            arr.push(6);
            results.forEach((result: PromiseSettledResult<number>): void => {
              if (result.status === 'fulfilled') {
                successMessage += `${result.value} `;
                console.log('All promises are settled, fulfilled results:', successMessage);
              } else {
                errorMessage += `${result.reason.message} `;
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
          await Promise.all(taskPromises);
        } catch (e) {
          console.log('e:' + (e as Error).message);
        }
        await sleep(300);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,5,8,4,3,4,6]');
          expect(errorMessage).assertEqual('Number 1 is not an even number Number 3 is not an even number ');
        } else {
          const expectedSuccess = [2].map(num => num * 2).join(' ') + ' ';
          expect(JSON.stringify(arr)).assertEqual('[1,5,8,3,4,3,6]');
          expect(successMessage).assertEqual(expectedSuccess);
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseAllSettledTest0700
     * @tc.number SUB_PROMISE_ALLSETTLED_TEST_0700
     * @tc.desc   test []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
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
                successMessage += `${JSON.stringify(result.value)} `;
                console.log('All promises are settled, fulfilled results:', successMessage);
              } else {
                errorMessage += `${result.reason.message} `;
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
          console.log('e:' + e.message);
        }
        await sleep(300);
        expect(JSON.stringify(arr)).assertEqual('[1,5,8,6]');
        expect(successMessage).assertEqual('');
        expect(errorMessage).assertEqual('');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseAllSettledTest0800
     * @tc.number SUB_PROMISE_ALLSETTLED_TEST_0800
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllSettledTest0800';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<string | number>[] = [];
        arr.push(1);
        const nonPromiseArray: (string | number)[] = ['hello', 123, 'world', 456];
        const asyncOperations = nonPromiseArray.map((item) => {
          arr.push(2);
          return new Promise<string | number>((resolve) => {
            setTimeout(() => {
              arr.push(3);
              resolve(item);
            }, 200);
          });
        });
        taskPromises.push(...asyncOperations);
        arr.push(5);
        Promise.allSettled(asyncOperations)
          .then((results: PromiseSettledResult<string | number>[]) => {
            arr.push(6);
            results.forEach((result) => {
              if (result.status === 'fulfilled') {
                successMessage += `${JSON.stringify(result.value)} `;
                console.log('All promises are settled, fulfilled results:', successMessage);
              } else {
                errorMessage += `${result.reason.message} `;
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
        expect(JSON.stringify(arr)).assertEqual('[1,2,2,2,2,5,8,3,3,3,3,6]');
        expect(successMessage).assertEqual('"hello" 123 "world" 456 ');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseAllSettledTest0900
     * @tc.number SUB_PROMISE_ALLSETTLED_TEST_0900
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllSettledTest0900';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<number>[] = [];
        arr.push(1);
        const exceptionalArray = [1, 2, -1, 3];
        const asyncOperations = exceptionalArray.map((value) => {
          arr.push(2);
          return new Promise<number>((resolve, reject) => {
            setTimeout(() => {
              try {
                if (value === -1) {
                  arr.push(4);
                  reject(new Error('Exception in generator'));
                } else if (value % 2 === 0) {
                  arr.push(3);
                  resolve(value * 2);
                } else {
                  arr.push(4);
                  reject(new Error(`Number ${value} is not an even number`));
                }
              } catch (error) {
                arr.push(4);
                reject(error);
              }
            }, 200);
          });
        });
        taskPromises.push(...asyncOperations);
        arr.push(5);
        const handleResults = (results: PromiseSettledResult<number>[]) => {
          arr.push(6);
          results.forEach((result) => {
            if (result.status === 'fulfilled') {
              successMessage += `${JSON.stringify(result.value)} `;
              console.log('All promises are settled, fulfilled results:', successMessage);
            } else {
              errorMessage += `${result.reason.message} `;
              console.log('All promises are settled, rejected reasons:', errorMessage);
            }
          });
        };
        const handleError = (error: Error) => {
          arr.push(7);
          console.error('An error occurred while using Promise.allSettled:', error.message);
        };
        Promise.allSettled(asyncOperations)
          .then(handleResults)
          .catch(handleError);
        arr.push(8);
        try {
          await Promise.all(taskPromises);
        } catch (e) {
          console.log('e:' + (e as Error).message);
        }
        await sleep(300);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,2,2,2,2,5,8,4,3,4,4,6]');
          expect(errorMessage)
            .assertEqual('Number 1 is not an even number Exception in generator Number 3 is not an even number ');
        } else {
          const expectedSuccess = [2].map(num => num * 2).join(' ') + ' ';
          expect(JSON.stringify(arr)).assertEqual('[1,2,3,2,3,2,3,5,8,6]');
          expect(successMessage).assertEqual(expectedSuccess);
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseAllSettledTest1000
     * @tc.number SUB_PROMISE_ALLSETTLED_TEST_1000
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
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
        Promise.allSettled(asyncOperations)
          .then((results: PromiseSettledResult<number>[]) => {
            arr.push(6);
            results.forEach((result) => {
              if (result.status === 'fulfilled') {
                successMessage += `${JSON.stringify(result.value)} `;
                console.log('All promises are settled, fulfilled results:', successMessage);
              } else {
                errorMessage += `${result.reason.message} `;
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
     * @tc.name   PromiseAllSettledTest1100
     * @tc.number SUB_PROMISE_ALLSETTLED_TEST_1100
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
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
        Promise.allSettled(asyncOperations)
          .then((results: PromiseSettledResult<number>[]) => {
            arr.push(6);
            results.forEach((result) => {
              if (result.status === 'fulfilled') {
                successMessage += `${JSON.stringify(result.value)} `;
                console.log('All promises are settled, fulfilled results:', successMessage);
              } else {
                errorMessage += `${result.reason.message} `;
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
     * @tc.name   PromiseAllSettledTest1200
     * @tc.number SUB_PROMISE_ALLSETTLED_TEST_1200
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllSettledTest1200';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<number>[] = [];
        arr.push(1);
        const errorPromise = new Promise<number>((_, reject) => {
          throw new Error('Promise construction error');
        });
        const normalPromise = new Promise<number>((resolve) => {
          setTimeout(() => {
            arr.push(3);
            resolve(2);
          }, 200);
        });
        const asyncOperations = [errorPromise, normalPromise];
        taskPromises.push(...asyncOperations);
        arr.push(5);
        Promise.allSettled(asyncOperations)
          .then((results: PromiseSettledResult<number>[]) => {
            arr.push(6);
            results.forEach((result) => {
              if (result.status === 'fulfilled') {
                successMessage += `${JSON.stringify(result.value)} `;
                console.log('All promises are settled, fulfilled results:', successMessage);
              } else {
                errorMessage += `${result.reason.message} `;
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
          expect(JSON.stringify(arr)).assertEqual('[1,5,8,3,6]');
          expect(errorMessage).assertEqual('Promise construction error ');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,5,8,3,3,6]');
          expect(successMessage).assertEqual('2 ');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseAllSettledTest1300
     * @tc.number SUB_PROMISE_ALLSETTLED_TEST_1300
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllSettledTest1300';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<number>[] = [];
        arr.push(1);
        const resolvedPromise = new Promise<number>((resolve) => {
          resolve(10);
        });
        const asyncOperations = [resolvedPromise];
        taskPromises.push(...asyncOperations);
        arr.push(5);
        Promise.allSettled(asyncOperations)
          .then((results: PromiseSettledResult<number>[]) => {
            arr.push(6);
            results.forEach((result) => {
              if (result.status === 'fulfilled') {
                successMessage += `${JSON.stringify(result.value)} `;
                console.log('All promises are settled, fulfilled results:', successMessage);
              } else {
                errorMessage += `${result.reason.message} `;
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
        expect(successMessage).assertEqual('10 ');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseAllSettledTest1400
     * @tc.number SUB_PROMISE_ALLSETTLED_TEST_1400
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllSettledTest1400';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<number>[] = [];
        arr.push(1);
        const resolvedPromise = new Promise<number>((resolve) => {
          resolve(10);
        });
        const rejectedPromise = new Promise<number>((_, reject) => {
          reject(new Error('Promise was rejected during construction'));
        });
        const asyncOperations = [resolvedPromise, rejectedPromise];
        taskPromises.push(...asyncOperations);
        arr.push(5);
        Promise.allSettled(asyncOperations)
          .then((results: PromiseSettledResult<number>[]) => {
            arr.push(6);
            results.forEach((result) => {
              if (result.status === 'fulfilled') {
                successMessage += `${JSON.stringify(result.value)} `;
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
          expect(successMessage).assertEqual('10 ');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseAllSettledTest1500
     * @tc.number SUB_PROMISE_ALLSETTLED_TEST_1500
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
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
        Promise.allSettled(asyncOperations)
          .then((results: PromiseSettledResult<number>[]) => {
            arr.push(6);
            results.forEach((result) => {
              if (result.status === 'fulfilled') {
                successMessage += `${JSON.stringify(result.value)} `;
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
     * @tc.name   PromiseAllSettledTest1600
     * @tc.number SUB_PROMISE_ALLSETTLED_TEST_1600
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllSettledTest1600';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<number>[] = [];
        arr.push(1);
        const promise1 = new Promise<number>((resolve) => {
          resolve(1);
        });
        const promise2 = new Promise<number>((resolve) => {
          resolve(2);
        });
        const promise3 = new Promise<number>((resolve) => {
          resolve(3);
        });
        const asyncOperations = [promise1, promise2, promise3];
        taskPromises.push(...asyncOperations);
        arr.push(5);
        Promise.allSettled(asyncOperations)
          .then((results: PromiseSettledResult<number>[]) => {
            arr.push(6);
            results.forEach((result) => {
              if (result.status === 'fulfilled') {
                successMessage += `${JSON.stringify(result.value)} `;
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
          expect(errorMessage).assertEqual('');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,5,8,6]');
          expect(successMessage).assertEqual('1 2 3 ');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseAllSettledTest1700
     * @tc.number SUB_PROMISE_ALLSETTLED_TEST_1700
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllSettledTest1700';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<number>[] = [];
        arr.push(1);
        const promise1 = new Promise<number>((resolve) => {
          setTimeout(() => {
            resolve(1);
          }, 2000);
        });
        const promise2 = new Promise<number>((_, reject) => {
          setTimeout(() => {
            reject(new Error('Second promise failed'));
          }, 1000);
        });
        const asyncOperations = [promise1, promise2];
        taskPromises.push(...asyncOperations);
        arr.push(5);
        Promise.allSettled(asyncOperations)
          .then((results: PromiseSettledResult<number>[]) => {
            arr.push(6);
            results.forEach((result) => {
              if (result.status === 'fulfilled') {
                successMessage += `${JSON.stringify(result.value)} `;
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
        await sleep(3000);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,5,8,7]');
          expect(errorMessage).assertEqual('Second promise failed');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,5,8,6]');
          expect(successMessage).assertEqual('1 ');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseAllSettledTest1800
     * @tc.number SUB_PROMISE_ALLSETTLED_TEST_1800
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllSettledTest1800';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<number>[] = [];
        arr.push(1);
        const promise1 = new Promise<number>((resolve) => {
          setTimeout(() => {
            resolve(1);
          }, 1000);
        });
        const promise2 = new Promise<number>((_, reject) => {
          setTimeout(() => {
            reject(new Error('Second promise failed'));
          }, 2000);
        });
        const asyncOperations = [promise1, promise2];
        taskPromises.push(...asyncOperations);
        arr.push(5);
        Promise.allSettled(asyncOperations)
          .then((results: PromiseSettledResult<number>[]) => {
            arr.push(6);
            results.forEach((result) => {
              if (result.status === 'fulfilled') {
                successMessage += `${JSON.stringify(result.value)} `;
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
        await sleep(3000);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,5,8,7]');
          expect(errorMessage).assertEqual('Second promise failed');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,5,8,6]');
          expect(successMessage).assertEqual('1 ');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseAllSettledTest1900
     * @tc.number SUB_PROMISE_ALLSETTLED_TEST_1900
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllSettledTest1900';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Array<Promise<number>> = [];
        arr.push(1);
        const basicType: number = 10;
        const iterableObject: Array<Promise<number>> = [1, 2, 3].map((val) => new Promise<number>((resolve) => {
          setTimeout(() => {
            resolve(val);
          }, 1000);
        }));
        const throwingIterableObject: Array<Promise<number>> = [
          new Promise<number>((_, reject) => {
            setTimeout(() => {
              reject(new Error('Exception in iterable object'));
            }, 1500);
          })
        ];
        const asyncOperations: Array<Promise<number>> = [
          Promise.resolve(basicType),
          ...iterableObject,
          ...throwingIterableObject
        ];
        taskPromises.push(...asyncOperations);
        arr.push(5);
        Promise.allSettled(asyncOperations)
          .then((results: Array<PromiseSettledResult<number>>) => {
            arr.push(6);
            results.forEach((result) => {
              if (result.status === 'fulfilled') {
                successMessage += `${JSON.stringify(result.value)} `;
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
        await sleep(2000);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,5,8,7]');
          expect(errorMessage).assertEqual('Exception in iterable object');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,5,8,6]');
          expect(successMessage).assertEqual('10 1 2 3 ');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseAllSettledTest2000
     * @tc.number SUB_PROMISE_ALLSETTLED_TEST_2000
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllSettledTest2000';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<number>[] = [];
        arr.push(1);
        const innerSuccessPromise = new Promise<number>((resolve) => {
          setTimeout(() => {
            resolve(1);
          }, 1000);
        });
        const innerFailurePromise = new Promise<number>((_, reject) => {
          setTimeout(() => {
            reject(new Error('Inner promise failed'));
          }, 500);
        });
        const outerFailurePromise = new Promise<number>((_, reject) => {
          setTimeout(() => {
            reject(new Error('Outer promise failed'));
          }, 800);
        });
        taskPromises.push(innerSuccessPromise);
        taskPromises.push(innerFailurePromise);
        taskPromises.push(outerFailurePromise);
        arr.push(5);
        Promise.allSettled(taskPromises)
          .then((value) => {
            arr.push(6);
            successMessage = JSON.stringify(value);
            console.log('Promise.any result:', successMessage);
          })
          .catch((error: Error) => {
            arr.push(7);
            errorMessage = error.message;
            console.log('Promise.any error:', errorMessage);
          });
        arr.push(8);
        try {
          await Promise.all(taskPromises);
        } catch (e) {
          console.log('e:' + (e as Error).message);
        }
        await sleep(1500);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,5,8,7]');
          expect(errorMessage).assertEqual('All promises were rejected');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,5,8,6]');
          expect(successMessage)
            .assertEqual('[{"status":"fulfilled","value":1},{"status":"rejected","reason":{}},{"status":"rejected","reason":{}}]');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseAllSettledTest2100
     * @tc.number SUB_PROMISE_ALLSETTLED_TEST_2100
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
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
     * @tc.name   PromiseAllSettledTest2200
     * @tc.number SUB_PROMISE_ALLSETTLED_TEST_2200
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllSettledTest2200';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: (Promise<string> | Promise<PromiseSettledResult<string>[]>)[] = [];
        arr.push(1);
        const innerSuccessPromise: Promise<string> = new Promise((resolve: (value: string) => void) => {
          setTimeout(() => {
            resolve('Inner success');
          }, 200);
        });
        const innerFailurePromise: Promise<string> =
          new Promise((_: (value: string) => void, reject: (reason: Error) => void) => {
            setTimeout(() => {
              reject(new Error('Inner failure'));
            }, 300);
          });
        const outerSuccessPromise: Promise<string> = new Promise((resolve: (value: string) => void) => {
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
          .then((value: PromiseSettledResult<string | PromiseSettledResult<string>[]>[]) => {
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


    /**
     * @tc.name   PromiseAllSettledTest2300
     * @tc.number SUB_PROMISE_ALLSETTLED_TEST_2300
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllSettledTest2300';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: (Promise<string> | Promise<PromiseSettledResult<string>[]>)[] = [];
        arr.push(1);
        const innerSuccessPromise: Promise<string> = new Promise((resolve: (value: string) => void) => {
          setTimeout(() => {
            resolve('Inner success');
          }, 200);
        });
        const innerFailurePromise: Promise<string> =
          new Promise((_: (value: string) => void, reject: (reason: Error) => void) => {
            setTimeout(() => {
              reject(new Error('Inner failure'));
            }, 300);
          });
        const outerFailurePromise: Promise<string> =
          new Promise((_: (value: string) => void, reject: (reason: Error) => void) => {
            setTimeout(() => {
              reject(new Error('Outer failure'));
            }, 400);
          });
        const innerAllSettled: Promise<PromiseSettledResult<string>[]> =
          Promise.allSettled([innerSuccessPromise, innerFailurePromise]);
        taskPromises.push(innerAllSettled);
        taskPromises.push(outerFailurePromise);
        arr.push(5);
        Promise.any(taskPromises)
          .then((value: string | PromiseSettledResult<string>[]) => {
            arr.push(6);
            successMessage = 'success';
            console.log('Promise.any result:', successMessage);
          })
          .catch((error: AggregateError) => {
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
     * @tc.name   PromiseAllSettledTest2400
     * @tc.number SUB_PROMISE_ALLSETTLED_TEST_2400
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllSettledTest2400';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<string | PromiseSettledResult<string>[]>[] = [];
        arr.push(1);
        const innerSuccessPromise: Promise<string> = new Promise((resolve) => {
          setTimeout(() => {
            resolve('Inner success');
          }, 200);
        });
        const innerFailurePromise: Promise<string> = new Promise((_, reject) => {
          setTimeout(() => {
            reject(new Error('Inner failure'));
          }, 300);
        });
        const outerSuccessPromise: Promise<string> = new Promise((resolve) => {
          setTimeout(() => {
            resolve('Outer success');
          }, 400);
        });
        const innerRacePromise = Promise.race([innerSuccessPromise, innerFailurePromise]);
        const anyPromise = Promise.any([innerRacePromise, outerSuccessPromise]);
        taskPromises.push(anyPromise);
        arr.push(5);
        const settledResults = await Promise.allSettled(taskPromises);
        const result = settledResults[0];
        if (result.status === 'fulfilled') {
          arr.push(6);
          successMessage = 'success';
          console.log('Promise.allSettled result:', successMessage);
        } else {
          arr.push(7);
          errorMessage = result.reason.message;
          console.log('Promise.allSettled error:', errorMessage);
        }
        arr.push(8);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,5,8,7]');
          expect(errorMessage).assertEqual('All promises were rejected');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,5,6,8]');
          expect(successMessage).assertEqual('success');
        }
        await Promise.all(taskPromises);
        await sleep(300);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseAllSettledTest2500
     * @tc.number SUB_PROMISE_ALLSETTLED_TEST_2500
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllSettledTest2500';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<string | PromiseSettledResult<string>[]>[] = [];
        arr.push(1);
        const successPromise: Promise<string> = new Promise((resolve) => {
          setTimeout(() => {
            resolve('success');
          }, 100);
        });
        const failurePromise1: Promise<string> = new Promise((_, reject) => {
          setTimeout(() => {
            reject(new Error('failed1'));
          }, 150);
        });
        const failurePromise2: Promise<string> = new Promise((_, reject) => {
          setTimeout(() => {
            reject(new Error('failed2'));
          }, 200);
        });
        const innerRacePromise = Promise.race([successPromise, failurePromise1]);
        const outerAnyPromise = Promise.any([innerRacePromise, failurePromise2]);
        taskPromises.push(outerAnyPromise);
        arr.push(5);
        const settledResults = await Promise.allSettled(taskPromises);
        const result = settledResults[0];
        if (result.status === 'fulfilled') {
          arr.push(6);
          successMessage = 'success';
          console.log('Promise.allSettled result:', successMessage);
        } else {
          arr.push(7);
          errorMessage = result.reason.message;
          console.log('Promise.allSettled error:', errorMessage);
        }
        arr.push(8);
        await Promise.all(taskPromises);
        await sleep(300);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,5,8,7]');
          expect(errorMessage).assertEqual('All promises were rejected');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,5,6,8]');
          expect(successMessage).assertEqual('success');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseAllSettledTest2600
     * @tc.number SUB_PROMISE_ALLSETTLED_TEST_2600
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllSettledTest2600';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<string | PromiseSettledResult<string>[]>[] = [];
        arr.push(1);
        const successPromise: Promise<string> = new Promise((resolve) => {
          setTimeout(() => {
            resolve('success');
          }, 100);
        });
        const failurePromise1: Promise<string> = new Promise((_, reject) => {
          setTimeout(() => {
            reject(new Error('failed1'));
          }, 150);
        });
        const failurePromise2: Promise<string> = new Promise((_, reject) => {
          setTimeout(() => {
            reject(new Error('failed2'));
          }, 200);
        });
        const innerRacePromise = Promise.race([successPromise, failurePromise1]);
        const outerAnyPromise = Promise.any([innerRacePromise, failurePromise2]);
        taskPromises.push(outerAnyPromise);
        arr.push(5);
        const settledResults = await Promise.allSettled(taskPromises);
        const result = settledResults[0];
        if (result.status === 'fulfilled') {
          arr.push(6);
          successMessage = 'success';
          console.log('Promise.allSettled result:', successMessage);
        } else {
          arr.push(7);
          errorMessage = result.reason.message;
          console.log('Promise.allSettled error:', errorMessage);
        }
        arr.push(8);
        await Promise.all(taskPromises);
        await sleep(300);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,5,8,7]');
          expect(errorMessage).assertEqual('All promises were rejected');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,5,6,8]');
          expect(successMessage).assertEqual('success');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseAllSettledTest2700
     * @tc.number SUB_PROMISE_ALLSETTLED_TEST_2700
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllSettledTest2700';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<string | PromiseSettledResult<string>[]>[] = [];
        const successPromise: Promise<string> = new Promise((resolve) => {
          setTimeout(() => {
            resolve('Success result');
            arr.push(1);
          }, 100);
        });
        const failurePromise: Promise<string> = new Promise((_, reject) => {
          setTimeout(() => {
            reject(new Error('Failure reason'));
            arr.push(2);
          }, 150);
        });
        const allSettledPromise = Promise.allSettled([successPromise, failurePromise]);
        taskPromises.push(allSettledPromise);
        allSettledPromise.then((results) => {
          arr.push(3);
          console.log('Promise.allSettled then executed, result:', results);
          return results;
        }).catch((error: Error) => {
          arr.push(4);
          errorMessage = error.message;
          console.log('Error occurred when executing then on Promise.allSettled, error message:', errorMessage);
        });
        successPromise.then((result) => {
          arr.push(5);
          console.log('Single Promise then executed, result:', result);
          successMessage = 'success';
          return result;
        }).catch((error: Error) => {
          arr.push(6);
          errorMessage = error.message;
          console.log('Error occurred when executing then on single Promise, error message:', errorMessage);
        });
        await Promise.all(taskPromises);
        await sleep(300);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,2,4,6]');
          expect(errorMessage).assertEqual('Failure reason');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,5,2,3]');
          expect(successMessage).assertEqual('success');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseAllSettledTest2800
     * @tc.number SUB_PROMISE_ALLSETTLED_TEST_2800
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllSettledTest2800';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<string | PromiseSettledResult<string>[]>[] = [];
        const successPromise: Promise<string> = new Promise((resolve) => {
          setTimeout(() => {
            resolve('Success result');
            arr.push(1);
          }, 1000);
        });
        const failurePromise: Promise<string> = new Promise((_, reject) => {
          setTimeout(() => {
            reject(new Error('Failure reason'));
            arr.push(2);
          }, 1500);
        });
        const successPromiseWithThen = successPromise.then((result) => {
          arr.push(3);
          console.log('Single Promise then executed, result:', result);
          return result;
        }).catch((error: Error) => {
          arr.push(4);
          errorMessage = error.message;
          console.log('Error occurred when executing then on single Promise, error message:', errorMessage);
          return Promise.reject(error);
        });
        const allSettledPromise = Promise.allSettled([successPromiseWithThen, failurePromise]);
        taskPromises.push(allSettledPromise);
        allSettledPromise.then((results) => {
          arr.push(5);
          console.log('Promise.allSettled then executed, result:', results);
          successMessage = 'success';
          return results;
        }).catch((error: Error) => {
          arr.push(6);
          errorMessage = error.message;
          console.log('Error occurred when executing then on Promise.allSettled, error message:', errorMessage);
        });
        await Promise.all(taskPromises);
        await sleep(300);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,2,4,6]');
          expect(errorMessage).assertEqual('Failure reason');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,3,2,5]');
          expect(successMessage).assertEqual('success');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseAllSettledTest2900
     * @tc.number SUB_PROMISE_ALLSETTLED_TEST_2900
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSettledTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllSettledTest2900';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<string | PromiseSettledResult<string>[]>[] = [];
        const successPromise: Promise<string> = new Promise((resolve) => {
          setTimeout(() => {
            resolve('Success result');
            arr.push(1);
          }, 1000);
        });
        const failurePromise: Promise<string> = new Promise((_, reject) => {
          setTimeout(() => {
            reject(new Error('Failure reason'));
            arr.push(2);
          }, 1500);
        });
        const successPromiseWithThrownError = successPromise.then((result) => {
          arr.push(3);
          console.log('Single Promise then executed, result:', result);
          throw new Error('Error thrown in then');
        }).catch((error:Error) => {
          arr.push(4);
          errorMessage = error.message;
          console.log('Error occurred when executing then on single Promise, error message:', errorMessage);
          return Promise.reject(error);
        });
        const allSettledPromise = Promise.allSettled([successPromiseWithThrownError, failurePromise]);
        taskPromises.push(allSettledPromise);
        allSettledPromise.then((results) => {
          arr.push(5);
          console.log('Promise.allSettled then executed, result:', results);
          if (results.every(result => result.status === 'rejected')) {
            errorMessage = 'All promises were rejected';
          } else {
            successMessage = 'success';
          }
          return results;
        }).catch((error:Error) => {
          arr.push(6);
          errorMessage = error.message;
          console.log('Error occurred when executing then on Promise.allSettled, error message:', errorMessage);
        });
        await sleep(300);
        await Promise.all(taskPromises)
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,3,4,2,5]');
          expect(errorMessage).assertEqual('All promises were rejected');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,2,3,5]');
          expect(successMessage).assertEqual('success');
        }
        console.info(`${caseName} test end`);
        Done();
      });

  })
}