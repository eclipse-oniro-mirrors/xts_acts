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

export default function PromiseAllTest() {
  describe('PromiseAllTest', () => {
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
     * @tc.name   PromiseAllTest0100
     * @tc.number SUB_PROMISE_ALL_TEST_0100
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllTest0100';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<string>[] = [];
        arr.push(1);
        const stringArray: string[] = ['apple', 'banana', 'cherry'];
        const asyncOperations = stringArray.map((str) => {
          return new Promise<string>((resolve) => {
            setTimeout(() => {
              resolve(str.toUpperCase());
            }, 200);
          });
        });
        for (const promise of asyncOperations) {
          taskPromises.push(promise);
        }
        arr.push(2);
        Promise.all(taskPromises)
          .then((results) => {
            arr.push(3);
            console.log('All promises are resolved, results:', results);
            successMessage = `All promises are resolved: ${JSON.stringify(results)}`;
            return results;
          })
          .then((results) => {
            if (results.every((result) => typeof result === 'string')) {
              arr.push(4);
              console.log('All results are strings');
            } else {
              arr.push(5);
              console.log('Not all results are strings');
            }
          })
          .catch((error: Error) => {
            arr.push(6);
            errorMessage = 'At least one promise is rejected';
            console.error('At least one promise is rejected:', error.message);
          });
        arr.push(7);
        await sleep(200);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,2,7,6]');
          expect(errorMessage).assertEqual('At least one promise is rejected');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,2,7,3,4]');
          expect(successMessage).assertEqual('All promises are resolved: ["APPLE","BANANA","CHERRY"]');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseAllTest0200
     * @tc.number SUB_PROMISE_ALL_TEST_0200
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllTest0200';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<number>[] = [];
        arr.push(1);
        const numberArray: number[] = [1, 2, 3];
        const asyncOperations = numberArray.map((num) => {
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              resolve(num * num);
            }, 200);
          });
        });
        for (const promise of asyncOperations) {
          taskPromises.push(promise);
        }
        arr.push(2);
        Promise.all(taskPromises)
          .then((results) => {
            arr.push(3);
            console.log('All promises are resolved, results:', results);
            successMessage = `All promises are resolved: ${JSON.stringify(results)}`;
            return results;
          })
          .then((results) => {
            if (results.every((result) => typeof result === 'number')) {
              arr.push(4);
              console.log('All results are numbers');
            } else {
              arr.push(5);
              console.log('Not all results are numbers');
            }
          })
          .catch((error: Error) => {
            arr.push(6);
            errorMessage = 'At least one promise is rejected';
            console.error('At least one promise is rejected:', error.message);
          });
        arr.push(7);
        await sleep(200);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,2,7,6]');
          expect(errorMessage).assertEqual('At least one promise is rejected');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,2,7,3,4]');
          expect(successMessage).assertEqual('All promises are resolved: [1,4,9]');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseAllTest0300
     * @tc.number SUB_PROMISE_ALL_TEST_0300
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllTest0300';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<boolean>[] = [];
        arr.push(1);
        const booleanArray: boolean[] = [true, false, true];
        const asyncOperations = booleanArray.map((bool) => {
          return new Promise<boolean>((resolve) => {
            setTimeout(() => {
              resolve(bool);
            }, 200);
          });
        });
        for (const promise of asyncOperations) {
          taskPromises.push(promise);
        }
        arr.push(2);
        Promise.all(taskPromises)
          .then((results) => {
            arr.push(3);
            console.log('All promises are resolved, results:', results);
            successMessage = `All promises are resolved: ${JSON.stringify(results)}`;
            return results;
          })
          .then((results) => {
            if (results.every((result) => typeof result === 'boolean')) {
              arr.push(4);
              console.log('All results are booleans');
            } else {
              arr.push(5);
              console.log('Not all results are booleans');
            }
          })
          .catch((error: Error) => {
            arr.push(6);
            errorMessage = 'At least one promise is rejected';
            console.error('At least one promise is rejected:', error.message);
          });
        arr.push(7);
        await sleep(200);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,2,7,6]');
          expect(errorMessage).assertEqual('At least one promise is rejected');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,2,7,3,4]');
          expect(successMessage).assertEqual('All promises are resolved: [true,false,true]');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseAllTest0400
     * @tc.number SUB_PROMISE_ALL_TEST_0400
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllTest0400';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<bigint>[] = [];
        arr.push(1);
        const bigintArray: bigint[] = [100n, 200n, 300n];
        const asyncOperations = bigintArray.map((bigInt) => {
          return new Promise<bigint>((resolve) => {
            setTimeout(() => {
              resolve(bigInt * 2n);
            }, 200);
          });
        });
        for (const promise of asyncOperations) {
          taskPromises.push(promise);
        }
        arr.push(2);
        Promise.all(taskPromises)
          .then((results) => {
            arr.push(3);
            console.log('All promises are resolved, results:', results);
            successMessage = `All promises are resolved: ${JSON.stringify(results.map(String))}`;
            return results;
          })
          .then((results) => {
            if (results.every((result) => typeof result === 'bigint')) {
              arr.push(4);
              console.log('All results are bigints');
            } else {
              arr.push(5);
              console.log('Not all results are bigints');
            }
          })
          .catch((error: Error) => {
            arr.push(6);
            errorMessage = 'At least one promise is rejected';
            console.error('At least one promise is rejected:', error.message);
          });
        arr.push(7);
        await sleep(200);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,2,7,6]');
          expect(errorMessage).assertEqual('At least one promise is rejected');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,2,7,3,4]');
          expect(successMessage).assertEqual('All promises are resolved: ["200","400","600"]');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseAllTest0500
     * @tc.number SUB_PROMISE_ALL_TEST_0500
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllTest0500';
        console.info(`${caseName} test start`);

        interface Person {
          name: string;
          age: number;
        }

        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<Person>[] = [];
        arr.push(1);
        const objectArray: Person[] = [
          {
            name: 'Alice', age: 25
          },
          {
            name: 'Bob', age: 30
          },
          {
            name: 'Charlie', age: 35
          }
        ];
        const asyncOperations = objectArray.map((obj) => {
          return new Promise<Person>((resolve) => {
            setTimeout(() => {
              const newObj: Person = {
                name: obj.name,
                age: obj.age + 1
              };
              resolve(newObj);
            }, 200);
          });
        });
        for (const promise of asyncOperations) {
          taskPromises.push(promise);
        }
        arr.push(2);
        Promise.all(taskPromises)
          .then((results) => {
            arr.push(3);
            console.log('All promises are resolved, results:', results);
            successMessage = `All promises are resolved: ${JSON.stringify(results)}`;
            return results;
          })
          .then((results) => {
            if (results.every((result) => typeof result === 'object' && result !== null)) {
              arr.push(4);
              console.log('All results are objects');
            } else {
              arr.push(5);
              console.log('Not all results are objects');
            }
          })
          .catch((error: Error) => {
            arr.push(6);
            errorMessage = 'At least one promise is rejected';
            console.error('At least one promise is rejected:', error.message);
          });
        arr.push(7);
        await sleep(200);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,2,7,6]');
          expect(errorMessage).assertEqual('At least one promise is rejected');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,2,7,3,4]');
          expect(successMessage)
            .assertEqual('All promises are resolved: [{"name":"Alice","age":26},{"name":"Bob","age":31},{"name":"Charlie","age":36}]');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseAllTest0600
     * @tc.number SUB_PROMISE_ALL_TEST_0600
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllTest0600';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<number>[] = [];
        arr.push(1);
        const promise1 = new Promise<number>((resolve) => {
          setTimeout(() => {
            resolve(10);
          }, 200);
        });
        const promise2 = new Promise<number>((resolve) => {
          setTimeout(() => {
            resolve(20);
          }, 300);
        });
        const promise3 = new Promise<number>((resolve) => {
          setTimeout(() => {
            resolve(30);
          }, 100);
        });
        taskPromises.push(promise1);
        taskPromises.push(promise2);
        taskPromises.push(promise3);
        arr.push(2);
        Promise.all(taskPromises)
          .then((results) => {
            arr.push(3);
            console.log('All promises are resolved, results:', results);
            successMessage = `All promises are resolved: ${JSON.stringify(results)}`;
            return results;
          })
          .then((results) => {
            if (results.every((result) => typeof result === 'number')) {
              arr.push(4);
              console.log('All results are numbers');
            } else {
              arr.push(5);
              console.log('Not all results are numbers');
            }
          })
          .catch((error: Error) => {
            arr.push(6);
            errorMessage = 'At least one promise is rejected';
            console.error('At least one promise is rejected:', error.message);
          });
        arr.push(7);
        await sleep(500);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,2,7,6]');
          expect(errorMessage).assertEqual('At least one promise is rejected');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,2,7,3,4]');
          expect(successMessage).assertEqual('All promises are resolved: [10,20,30]');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseAllTest0700
     * @tc.number SUB_PROMISE_ALL_TEST_0700
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllTest0700';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        arr.push(1);
        const taskPromises: Promise<void>[] = [];
        arr.push(2);
        Promise.all(taskPromises)
          .then((results) => {
            arr.push(3);
            console.log('All promises are resolved, results:', results);
            successMessage = `All promises are resolved: ${JSON.stringify(results)}`;
            return results;
          })
          .then((results) => {
            if (results.every((results) => typeof results === 'number')) {
              arr.push(4);
              console.log('All results are numbers');
            } else {
              arr.push(5);
              console.log('Not all results are numbers');
            }
          })
          .catch((error: Error) => {
            arr.push(6);
            errorMessage = 'At least one promise is rejected';
            console.error('At least one promise is rejected:', error.message);
          });
        arr.push(7);
        await sleep(200);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,2,7,6]');
          expect(errorMessage).assertEqual('At least one promise is rejected');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,2,7,3,4]');
          expect(successMessage).assertEqual('All promises are resolved: []');
        }
        console.info(`${caseName} test end`);
        Done();
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseAllTest0800
     * @tc.number SUB_PROMISE_ALL_TEST_0800
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllTest0800';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        arr.push(1);
        const taskPromises: (Promise<number> | string | number)[] = [
          new Promise<number>((resolve) => setTimeout(() => {
            resolve(10);
          }, 200)),
          'hello',
          20
        ];
        arr.push(2);
        Promise.all(taskPromises)
          .then((results) => {
            arr.push(3);
            console.log('All promises are resolved, results:', results);
            successMessage = `All promises are resolved: ${JSON.stringify(results)}`;
            return results;
          })
          .then((results) => {
            if (results.every((results) => typeof results === 'number')) {
              arr.push(4);
              console.log('All results are numbers');
            } else {
              arr.push(5);
              console.log('Not all results are numbers');
            }
          })
          .catch((error: Error) => {
            arr.push(6);
            errorMessage = 'At least one promise is rejected';
            console.error('At least one promise is rejected:', error.message);
          });
        arr.push(7);
        await sleep(200);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,2,7,6]');
          expect(errorMessage).assertEqual('At least one promise is rejected');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,2,7,3,5]');
          expect(successMessage).assertEqual('All promises are resolved: [10,"hello",20]');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseAllTest0900
     * @tc.number SUB_PROMISE_ALL_TEST_0900
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllTest0900';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        arr.push(1);
        const taskPromises: (Promise<number> | string | number)[] = [
          new Promise<number>((resolve) => setTimeout(() => {
            resolve(10);
          }, 200)),
          new Promise<number>((_, reject) => setTimeout(() => {
            reject(new Error('This promise is rejected'));
          }, 100)),
          'hello',
          20
        ];
        arr.push(2);
        Promise.all(taskPromises)
          .then((results) => {
            arr.push(3);
            console.log('All promises are resolved, results:', results);
            successMessage = `All promises are resolved: ${JSON.stringify(results)}`;
            return results;
          })
          .then((results) => {
            if (results.every((result) => typeof result === 'number')) {
              arr.push(4);
              console.log('All results are numbers');
            } else {
              arr.push(5);
              console.log('Not all results are numbers');
            }
          })
          .catch((error: Error) => {
            arr.push(6);
            errorMessage = 'At least one promise is rejected';
            console.error('At least one promise is rejected:', error.message);
          });
        arr.push(7);
        await sleep(300);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,2,7,6]');
          expect(errorMessage).assertEqual('At least one promise is rejected');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,2,7,3,5]');
          expect(successMessage).assertEqual('All promises are resolved: [10,"hello",20]');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseAllTest1000
     * @tc.number SUB_PROMISE_ALL_TEST_1000
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllTest1000';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        arr.push(1);
        const taskPromises: Promise<number>[] = [];
        const promise1 = new Promise<number>((resolve) => {
          setTimeout(() => {
            resolve(10);
          }, 200)
        })
        const promise2 = new Promise<number>((_, reject) => {
          setTimeout(() => {
            reject(new Error('Second promise failed'));
          }, 200)
        })
        const promise3 = new Promise<number>((resolve) => {
          setTimeout(() => {
            resolve(30);
          }, 300)
        })
        taskPromises.push(promise1);
        taskPromises.push(promise2);
        taskPromises.push(promise3);
        arr.push(2);
        Promise.all(taskPromises)
          .then((results) => {
            arr.push(3);
            console.log('All promises are resolved, results:', results);
            successMessage = `All promises are resolved: ${JSON.stringify(results)}`;
            return results;
          })
          .catch((error: Error) => {
            arr.push(6);
            errorMessage = 'At least one promise is rejected';
            console.error('At least one promise is rejected:', error.message);
          });
        arr.push(7);
        await sleep(400);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,2,7,6]');
          expect(errorMessage).assertEqual('At least one promise is rejected');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,2,7,3]');
          expect(successMessage).assertEqual('All promises are resolved: [10,30]');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseAllTest1100
     * @tc.number SUB_PROMISE_ALL_TEST_1100
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllTest1100';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        arr.push(1);
        const taskPromises: Promise<number>[] = [];
        const promise1 = new Promise<number>((_, reject) => {
          setTimeout(() => {
            reject(new Error('First promise failed'));
          }, 100)
        })
        const promise2 = new Promise<number>((_, reject) => {
          setTimeout(() => {
            reject(new Error('Second promise failed'));
          }, 200)
        })
        const promise3 = new Promise<number>((_, reject) => {
          setTimeout(() => {
            reject(new Error('Third promise failed'));
          }, 300)
        })
        taskPromises.push(promise1);
        taskPromises.push(promise2);
        taskPromises.push(promise3);
        arr.push(2);
        Promise.all(taskPromises)
          .then((results) => {
            arr.push(3);
            console.log('All promises are resolved, results:', results);
            successMessage = `All promises are resolved: ${JSON.stringify(results)}`;
            return results;
          })
          .catch((error: Error) => {
            arr.push(6);
            errorMessage = 'At least one promise is rejected';
            console.error('At least one promise is rejected:', error.message);
          });
        arr.push(7);
        await sleep(400);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,2,7,6]');
          expect(errorMessage).assertEqual('At least one promise is rejected');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,2,7,3]');
          expect(successMessage).assertEqual('All promises are resolved: []');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseAllTest1200
     * @tc.number SUB_PROMISE_ALL_TEST_1200
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllTest1200';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        arr.push(1);
        const taskPromises: Promise<number>[] = [];
        const promise1 = new Promise<number>((_, reject) => {
          arr.push(4);
          throw new Error('Promise 1 throws an error during construction');
        });
        const promise2 = new Promise<number>((resolve) => {
          setTimeout(() => {
            arr.push(5);
            resolve(20);
          }, 200);
        });
        taskPromises.push(promise1);
        taskPromises.push(promise2);
        arr.push(2);
        Promise.all(taskPromises)
          .then((results) => {
            arr.push(3);
            console.log('All promises are resolved, results:', results);
            successMessage = `All promises are resolved: ${JSON.stringify(results)}`;
            return results;
          })
          .catch((error: Error) => {
            arr.push(6);
            errorMessage = 'At least one promise is rejected';
            console.error('At least one promise is rejected:', error.message);
          });
        arr.push(7);
        await sleep(300);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,4,2,7,6,5]');
          expect(errorMessage).assertEqual('At least one promise is rejected');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,2,7,3]');
          expect(successMessage).assertEqual('All promises are resolved: [20]');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseAllTest1300
     * @tc.number SUB_PROMISE_ALL_TEST_1300
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllTest1300';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        arr.push(1);
        const promise = new Promise<number>((resolve) => {
          resolve(42);
        });
        arr.push(2);
        Promise.all([promise])
          .then((results) => {
            arr.push(3);
            console.log('All promises are resolved, results:', results);
            successMessage = `All promises are resolved: ${JSON.stringify(results)}`;
          })
          .catch((error: Error) => {
            arr.push(6);
            errorMessage = 'At least one promise is rejected';
            console.error('At least one promise is rejected:', error.message);
          });
        arr.push(7);
        await sleep(100);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,2,7,6]');
          expect(errorMessage).assertEqual('At least one promise is rejected');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,2,7,3]');
          expect(successMessage).assertEqual('All promises are resolved: [42]');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseAllTest1400
     * @tc.number SUB_PROMISE_ALL_TEST_1400
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllTest1400';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        arr.push(1);
        const taskPromises: Promise<number>[] = [];
        const resolvedPromise = new Promise<number>((resolve) => {
          resolve(10);
        });
        const rejectedPromise = new Promise<number>((_, reject) => {
          reject(new Error('This promise is rejected during construction'));
        });
        taskPromises.push(resolvedPromise);
        taskPromises.push(rejectedPromise);
        arr.push(2);
        Promise.all(taskPromises)
          .then((results) => {
            arr.push(3);
            console.log('All promises are resolved, results:', results);
            successMessage = `All promises are resolved: ${JSON.stringify(results)}`;
            return results;
          })
          .catch((error: Error) => {
            arr.push(6);
            errorMessage = 'At least one promise is rejected';
            console.error('At least one promise is rejected:', error.message);
          });
        arr.push(7);
        await sleep(200);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,2,7,6]');
          expect(errorMessage).assertEqual('At least one promise is rejected');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,2,7,3]');
          expect(successMessage).assertEqual('All promises are resolved: [10]');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseAllTest1500
     * @tc.number SUB_PROMISE_ALL_TEST_1500
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllTest1500';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        arr.push(1);
        const rejectedPromise = new Promise<number>((_, reject) => {
          reject(new Error('Promise is rejected during construction'));
        });
        arr.push(2);
        Promise.all([rejectedPromise])
          .then((results) => {
            arr.push(3);
            console.log('All promises are resolved, results:', results);
            successMessage = `All promises are resolved: ${JSON.stringify(results)}`;
          })
          .catch((error: Error) => {
            arr.push(6);
            errorMessage = 'At least one promise is rejected';
            console.error('At least one promise is rejected:', error.message);
          });
        arr.push(7);
        await sleep(100);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,2,7,6]');
          expect(errorMessage).assertEqual('At least one promise is rejected');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,2,7,3]');
          expect(successMessage).assertEqual('All promises are resolved: []');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseAllTest1600
     * @tc.number SUB_PROMISE_ALL_TEST_1600
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllTest1600';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        arr.push(1);
        const taskPromises: Promise<number>[] = [];
        const promise1 = new Promise<number>((resolve) => {
          setTimeout(() => {
            resolve(10);
          }, 100);
        });
        const promise2 = new Promise<number>((resolve) => {
          setTimeout(() => {
            resolve(20);
          }, 200);
        });
        const promise3 = new Promise<number>((resolve) => {
          setTimeout(() => {
            resolve(30);
          }, 300);
        });
        taskPromises.push(promise1);
        taskPromises.push(promise2);
        taskPromises.push(promise3);
        arr.push(2);
        Promise.all(taskPromises)
          .then((results) => {
            arr.push(3);
            console.log('All promises are resolved, results:', results);
            successMessage = `All promises are resolved: ${JSON.stringify(results)}`;
            return results;
          })
          .then((results) => {
            if (results.every((result) => typeof result === 'number')) {
              arr.push(4);
              console.log('All results are numbers');
            } else {
              arr.push(5);
              console.log('Not all results are numbers');
            }
          })
          .catch((error: Error) => {
            arr.push(6);
            errorMessage = 'At least one promise is rejected';
            console.error('At least one promise is rejected:', error.message);
          });
        arr.push(7);
        await sleep(400);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,2,7,6]');
          expect(errorMessage).assertEqual('At least one promise is rejected');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,2,7,3,4]');
          expect(successMessage).assertEqual('All promises are resolved: [10,20,30]');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseAllTest1700
     * @tc.number SUB_PROMISE_ALL_TEST_1700
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllTest1700';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        arr.push(1);
        const taskPromises: Promise<number>[] = [];
        const promise1 = new Promise<number>((resolve) => {
          setTimeout(() => {
            resolve(10);
          }, 2000);
        });
        const promise2 = new Promise<number>((_, reject) => {
          setTimeout(() => {
            reject(new Error('Second promise failed after 100 ms'));
          }, 1000);
        });
        taskPromises.push(promise1);
        taskPromises.push(promise2);
        arr.push(2);
        Promise.all(taskPromises)
          .then((results) => {
            arr.push(3);
            console.log('All promises are resolved, results:', results);
            successMessage = `All promises are resolved: ${JSON.stringify(results)}`;
            return results;
          })
          .catch((error: Error) => {
            arr.push(6);
            errorMessage = 'At least one promise is rejected';
            console.error('At least one promise is rejected:', error.message);
          });
        arr.push(7);
        await sleep(3000);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,2,7,6]');
          expect(errorMessage).assertEqual('At least one promise is rejected');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,2,7,3]');
          expect(successMessage).assertEqual('All promises are resolved: [10]');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseAllTest1800
     * @tc.number SUB_PROMISE_ALL_TEST_1800
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllTest1800';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        arr.push(1);
        const promise1 = new Promise<number>((resolve) => {
          setTimeout(() => {
            resolve(10);
          }, 1000);
        });
        const promise2 = new Promise<number>((_, reject) => {
          setTimeout(() => {
            reject(new Error('Second promise failed after 2 seconds'));
          }, 2000);
        });
        const taskPromises = [promise1, promise2];
        arr.push(2);
        Promise.all(taskPromises)
          .then((results) => {
            arr.push(3);
            console.log('All promises are resolved, results:', results);
            successMessage = `All promises are resolved: ${JSON.stringify(results)}`;
          })
          .catch((error: Error) => {
            arr.push(6);
            errorMessage = 'At least one promise is rejected';
            console.error('At least one promise is rejected:', error.message);
          });
        arr.push(7);
        await sleep(3000);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,2,7,6]');
          expect(errorMessage).assertEqual('At least one promise is rejected');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,2,7,3]');
          expect(successMessage).assertEqual('All promises are resolved: [10]');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseAllTest1900
     * @tc.number SUB_PROMISE_ALL_TEST_1900
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllTest1900';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        arr.push(1);
        const basicType = 10;
        const iterableObj = [
          new Promise<number>((resolve) => {
            setTimeout(() => {
              resolve(20);
            }, 100);
          }),
          new Promise<number>((resolve) => {
            setTimeout(() => {
              resolve(30);
            }, 200);
          })
        ];
        const exceptionIterable = [
          new Promise<number>((resolve) => {
            setTimeout(() => {
              resolve(40);
            }, 100);
          }),
          () => {
            throw new Error('This is a test error from iterable');
          },
          new Promise<number>((resolve) => {
            setTimeout(() => {
              resolve(50);
            }, 200);
          })
        ];
        const taskPromises = [basicType, iterableObj, exceptionIterable];
        arr.push(2);
        Promise.all(taskPromises.map(promise => {
          if (Array.isArray(promise)) {
            return Promise.all(promise.map(item => {
              if (typeof item === 'function') {
                try {
                  item();
                } catch (error) {
                  return Promise.reject(error);
                }
              }
              return item;
            }));
          }
          return promise;
        }))
          .then((results) => {
            arr.push(3);
            console.log('All promises are resolved, results:', results);
            successMessage = `All promises are resolved: ${JSON.stringify(results)}`;
            return results;
          })
          .catch((error: Error) => {
            arr.push(6);
            errorMessage = 'At least one promise is rejected';
            console.error('At least one promise is rejected:', error.message);
          });
        arr.push(7);
        await sleep(300);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,2,7,6]');
          expect(errorMessage).assertEqual('At least one promise is rejected');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,2,7,3]');
          expect(successMessage).assertEqual('All promises are resolved: [10,[20,30],[]]');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseAllTest2000
     * @tc.number SUB_PROMISE_ALL_TEST_2000
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllTest2000';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        const taskPromises: Promise<string>[] = [];
        arr.push(1);
        const successPromise: Promise<string> = new Promise((resolve) => {
          setTimeout(() => {
            resolve('Success');
          }, 100);
        });
        const failurePromise: Promise<string> = new Promise((_, reject) => {
          setTimeout(() => {
            reject(new Error('Failure'));
          }, 100);
        });
        const nestedPromiseAny = Promise.any([Promise.any([successPromise, failurePromise]), failurePromise]);
        taskPromises.push(successPromise);
        taskPromises.push(failurePromise);
        taskPromises.push(nestedPromiseAny);
        arr.push(2);
        Promise.all(taskPromises)
          .then((results) => {
            arr.push(3);
            console.log('All promises are resolved:', results);
            successMessage = `All promises are resolved: ${JSON.stringify(results)}`;
          })
          .catch((error: Error) => {
            arr.push(6);
            errorMessage = 'At least one promise is rejected';
            console.error('At least one promise is rejected:', error.message);
          });
        arr.push(7);
        await sleep(200);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,2,7,6]');
          expect(errorMessage).assertEqual('At least one promise is rejected');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,2,7,3]');
          expect(successMessage).assertEqual('All promises are resolved: ["Success"]');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseAllTest2100
     * @tc.number SUB_PROMISE_ALL_TEST_2100
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllTest2100';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        const taskPromises: Promise<string>[] = [];
        arr.push(1);
        const successPromise1: Promise<string> = new Promise((resolve) => {
          setTimeout(() => {
            resolve('Success 1');
          }, 150);
        });
        const successPromise2: Promise<string> = new Promise((resolve) => {
          setTimeout(() => {
            resolve('Success 2');
          }, 200);
        });
        const failurePromise1: Promise<string> = new Promise((_, reject) => {
          setTimeout(() => {
            reject(new Error('Failure 1'));
          }, 120);
        });
        const failurePromise2: Promise<string> = new Promise((_, reject) => {
          setTimeout(() => {
            reject(new Error('Failure 2'));
          }, 180);
        });
        const nestedPromiseAny1 = Promise.any([Promise.any([successPromise1, failurePromise1]), failurePromise2]);
        const nestedPromiseAny2 = Promise.any([Promise.any([successPromise2, failurePromise2]), failurePromise1]);
        taskPromises.push(successPromise1);
        taskPromises.push(successPromise2);
        taskPromises.push(nestedPromiseAny1);
        taskPromises.push(nestedPromiseAny2);
        arr.push(2);
        Promise.all(taskPromises)
          .then((results) => {
            arr.push(3);
            console.log('All promises are resolved:', results);
            successMessage = `All promises are resolved: ${JSON.stringify(results)}`;
          })
          .catch((error: Error) => {
            arr.push(6);
            errorMessage = 'At least one promise is rejected';
            console.error('At least one promise is rejected:', error.message);
          });
        arr.push(7);
        await sleep(300);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,2,7,6]');
          expect(errorMessage).assertEqual('At least one promise is rejected');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,2,7,3]');
          expect(successMessage)
            .assertEqual('All promises are resolved: ["Success 1","Success 2","Success 1","Success 2"]');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseAllTest2200
     * @tc.number SUB_PROMISE_ALL_TEST_2200
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllTest2200';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        const taskPromises: (Promise<string | string[]>)[] = [];
        arr.push(1);

        const successPromise: Promise<string> = new Promise((resolve) => {
          setTimeout(() => {
            resolve('Success');
          }, 150);
        });
        const failurePromise: Promise<string> = new Promise((_, reject) => {
          setTimeout(() => {
            reject(new Error('Failure'));
          }, 120);
        });
        const nestedPromiseAll = Promise.all([successPromise, failurePromise]);
        const outerPromiseAny = Promise.any([nestedPromiseAll, successPromise]);
        taskPromises.push(outerPromiseAny);
        arr.push(2);
        Promise.all(taskPromises)
          .then((results) => {
            arr.push(3);
            console.log('All promises are resolved:', results);
            successMessage = `All promises are resolved: ${JSON.stringify(results)}`;
          })
          .catch((error: Error) => {
            arr.push(6);
            errorMessage = 'At least one promise is rejected';
            console.error('At least one promise is rejected:', error.message);
          });
        arr.push(7);
        await sleep(300);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,2,7,6]');
          expect(errorMessage).assertEqual('At least one promise is rejected');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,2,7,3]');
          expect(successMessage).assertEqual('All promises are resolved: ["Success"]');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseAllTest2300
     * @tc.number SUB_PROMISE_ALL_TEST_2300
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllTest2300';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        const taskPromises: (Promise<string | string[]>)[] = [];
        arr.push(1);
        const successPromise: Promise<string> = new Promise((resolve) => {
          setTimeout(() => {
            arr.push(4);
            resolve('Success');
          }, 100);
        });
        const failurePromise1: Promise<string> = new Promise((_, reject) => {
          setTimeout(() => {
            arr.push(5);
            reject(new Error('Failure 1'));
          }, 100);
        });
        const failurePromise2: Promise<string> = new Promise((_, reject) => {
          setTimeout(() => {
            reject(new Error('Failure 2'));
          }, 100);
        });
        const nestedPromiseAll = Promise.all([successPromise, failurePromise1]);
        const outerPromiseAny = Promise.any([nestedPromiseAll, failurePromise2]);
        taskPromises.push(outerPromiseAny);
        arr.push(2);
        Promise.all(taskPromises)
          .then((results) => {
            arr.push(3);
            console.log('All promises are resolved:', results);
            successMessage = `All promises are resolved: ${JSON.stringify(results)}`;
          })
          .catch((error: Error) => {
            arr.push(6);
            errorMessage = 'At least one promise is rejected';
            console.error('At least one promise is rejected:', error.message);
          });
        arr.push(7);
        await sleep(200);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,2,7,4,5,6]');
          expect(errorMessage).assertEqual('At least one promise is rejected');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,2,7,3]');
          expect(successMessage).assertEqual('All promises are resolved: ["Success"]');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseAllTest2400
     * @tc.number SUB_PROMISE_ALL_TEST_2400
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllTest2400';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        const taskPromises: Array<Promise<string | string[]>> = [];
        arr.push(1);
        const successfulPromise: Promise<string> = new Promise((resolve) => {
          setTimeout(() => {
            arr.push(4);
            resolve('Successful Promise');
          }, 100);
        });
        const failingPromise: Promise<string> = new Promise((_, reject) => {
          setTimeout(() => {
            arr.push(5);
            reject(new Error('Failing Promise'));
          }, 200);
        });
        const nestedPromiseRace: Promise<string> = Promise.race([successfulPromise, failingPromise]);
        const outerPromiseAny: Promise<string> = Promise.any([nestedPromiseRace, successfulPromise]);
        taskPromises.push(outerPromiseAny);
        arr.push(2);
        Promise.all(taskPromises)
          .then((results) => {
            arr.push(3);
            console.log('All promises are resolved:', results);
            successMessage = `All promises are resolved: ${JSON.stringify(results)}`;
          })
          .catch((error: Error) => {
            arr.push(6);
            errorMessage = 'At least one promise is rejected';
            console.error('At least one promise is rejected:', error.message);
          });
        arr.push(7);
        await sleep(300);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,2,7,4,5,6]');
          expect(errorMessage).assertEqual('At least one promise is rejected');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,2,7,4,3,5]');
          expect(successMessage).assertEqual('All promises are resolved: ["Successful Promise"]');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseAllTest2500
     * @tc.number SUB_PROMISE_ALL_TEST_2500
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllTest2500';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        const taskPromises: Array<Promise<string | string[]>> = [];
        arr.push(1);
        const successfulPromise: Promise<string> = new Promise((resolve) => {
          setTimeout(() => {
            arr.push(4);
            resolve('Success');
          }, 100);
        });
        const failingPromise1: Promise<string> = new Promise((_, reject) => {
          setTimeout(() => {
            arr.push(5);
            reject(new Error('Failure 1'));
          }, 100);
        });
        const failingPromise2: Promise<string> = new Promise((_, reject) => {
          setTimeout(() => {
            arr.push(6);
            reject(new Error('Failure 2'));
          }, 100);
        });
        const nestedPromiseRace: Promise<string> = Promise.race([successfulPromise, failingPromise1]);
        const outerPromiseAny: Promise<string> = Promise.any([nestedPromiseRace, failingPromise2]);
        taskPromises.push(outerPromiseAny);
        arr.push(2);
        Promise.all(taskPromises)
          .then((results) => {
            arr.push(3);
            console.log('All promises are resolved:', results);
            successMessage = `All promises are resolved: ${JSON.stringify(results)}`;
          })
          .catch((error: Error) => {
            arr.push(7);
            errorMessage = 'At least one promise is rejected';
            console.error('At least one promise is rejected:', error.message);
          });
        arr.push(8);
        await sleep(200);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,2,8,4,5,6,7]');
          expect(errorMessage).assertEqual('At least one promise is rejected');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,2,8,4,3,5,6]');
          expect(successMessage).assertEqual('All promises are resolved: ["Success"]');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseAllTest2600
     * @tc.number SUB_PROMISE_ALL_TEST_2600
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllTest2600';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        const taskPromises: Array<Promise<(PromiseSettledResult<string>)[] | string>> = [];
        let results: ((PromiseSettledResult<string>)[] | string)[] = [];
        arr.push(1);
        const successfulPromise: Promise<string> = new Promise((resolve) => {
          setTimeout(() => {
            arr.push(4);
            resolve('Success');
          }, 100);
        });
        const failingPromise: Promise<string> = new Promise((_, reject) => {
          setTimeout(() => {
            arr.push(5);
            reject(new Error('Failure'));
          }, 100);
        });
        const nestedAllSettled: Promise<PromiseSettledResult<string>[]> =
          Promise.allSettled([successfulPromise, failingPromise]);
        const outerPromiseAny: Promise<(PromiseSettledResult<string>)[] | string> =
          Promise.any([nestedAllSettled, successfulPromise]);
        taskPromises.push(outerPromiseAny);
        arr.push(2);
        Promise.all(taskPromises)
          .then((res) => {
            results = res;
            arr.push(3);
            console.log('All promises are resolved:', results);
            successMessage = `All promises are resolved: ${JSON.stringify(results)}`;
          })
          .catch((error: Error) => {
            arr.push(6);
            errorMessage = 'At least one promise is rejected';
            console.error('At least one promise is rejected:', error.message);
          });
        arr.push(7);
        await sleep(200);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,2,7,4,5,6]');
          expect(errorMessage).assertEqual('At least one promise is rejected');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,2,7,4,3,5]');
          expect(successMessage).assertEqual('All promises are resolved: ["Success"]');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseAllTest2700
     * @tc.number SUB_PROMISE_ALL_TEST_2700
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllTest2700';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        const taskPromises: Array<Promise<(PromiseSettledResult<string>)[] | string>> = [];
        let results: ((PromiseSettledResult<string>)[] | string)[] = [];
        arr.push(1);
        const successfulPromise: Promise<string> = new Promise((resolve) => {
          setTimeout(() => {
            arr.push(4);
            resolve('Success');
          }, 100);
        });
        const failingPromise1: Promise<string> = new Promise((_, reject) => {
          setTimeout(() => {
            arr.push(5);
            reject(new Error('Failure 1'));
          }, 100);
        });
        const failingPromise2: Promise<string> = new Promise((_, reject) => {
          setTimeout(() => {
            arr.push(6);
            reject(new Error('Failure 2'));
          }, 100);
        });
        const nestedAllSettled: Promise<PromiseSettledResult<string>[]> =
          Promise.allSettled([successfulPromise, failingPromise1]);
        const outerPromiseAny: Promise<(PromiseSettledResult<string>)[] | string> =
          Promise.any([nestedAllSettled, failingPromise2]);
        taskPromises.push(outerPromiseAny);
        arr.push(2);
        Promise.all(taskPromises)
          .then((res) => {
            results = res;
            arr.push(3);
            console.log('All promises are resolved:', results);
            successMessage = `All promises are resolved: ${JSON.stringify(results)}`;
          })
          .catch((error: Error) => {
            arr.push(7);
            errorMessage = 'At least one promise is rejected';
            console.error('At least one promise is rejected:', error.message);
          });
        arr.push(8);
        await sleep(200);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,2,8,4,5,6,7]');
          expect(errorMessage).assertEqual('At least one promise is rejected');
        } else {
          if (Array.isArray(results[0])) {
            expect(JSON.stringify(arr)).assertEqual('[1,2,8,4,5,3,6]');
            const settledResult = results[0] as PromiseSettledResult<string>[];
            const successCount = settledResult.filter(result => result.status === 'fulfilled').length;
            const failCount = settledResult.filter(result => result.status === 'rejected').length;
            expect(successCount).assertEqual(1);
            expect(failCount).assertEqual(1);
          }
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseAllTest2800
     * @tc.number SUB_PROMISE_ALL_TEST_2800
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllTest2800';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Array<Promise<string | string[]>> = [];
        let results: string[] = [];
        arr.push(1);
        const promise1: Promise<string> = new Promise((resolve) => {
          setTimeout(() => {
            arr.push(4);
            resolve('Promise 1 Resolved');
          }, 100);
        });
        const promise2: Promise<string> = new Promise((resolve) => {
          setTimeout(() => {
            arr.push(5);
            resolve('Promise 2 Resolved');
          }, 200);
        });
        const allPromises = Promise.all([promise1, promise2]);
        taskPromises.push(allPromises);
        arr.push(2);
        promise1.then((result) => {
          arr.push(6);
          console.log('Promise 1 then:', result);
        });
        promise2.then((result) => {
          arr.push(7);
          console.log('Promise 2 then:', result);
        });
        allPromises.then((res) => {
          results = res;
          arr.push(3);
          console.log('All promises are resolved:', results);
          successMessage = `All promises are resolved: ${JSON.stringify(results)}`;
        }).catch((error: Error) => {
          arr.push(8);
          errorMessage = 'At least one promise is rejected';
          console.error('At least one promise is rejected:', error.message);
        });
        arr.push(9);
        await sleep(300);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,2,9,4,5,8]');
          expect(errorMessage).assertEqual('At least one promise is rejected');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,2,9,4,6,5,7,3]');
          expect(successMessage).assertEqual('All promises are resolved: ["Promise 1 Resolved","Promise 2 Resolved"]');
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseAllTest2900
     * @tc.number SUB_PROMISE_ALL_TEST_2900
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseAllTest2900';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let results: string[] = [];
        let taskPromises: Array<Promise<string | string[]>> = [];
        arr.push(1);
        const promise1: Promise<string> = new Promise((resolve) => {
          setTimeout(() => {
            arr.push(4);
            resolve('Promise 1 Resolved');
          }, 100);
        });
        const promise2: Promise<string> = new Promise((resolve) => {
          setTimeout(() => {
            arr.push(5);
            resolve('Promise 2 Resolved');
          }, 200);
        });
        const allPromises = Promise.all([promise1, promise2]);
        taskPromises.push(allPromises);
        arr.push(2);
        allPromises.then((res) => {
          results = res;
          arr.push(3);
          console.log('All promises are resolved:', results);
          successMessage = `All promises are resolved: ${JSON.stringify(results)}`;
        }).catch((error: Error) => {
          arr.push(6);
          errorMessage = 'At least one promise is rejected';
          console.error('At least one promise is rejected:', error.message);
        });
        arr.push(7);
        promise1.then((result) => {
          arr.push(8);
          console.log('Promise 1 then:', result);
        });
        promise2.then((result) => {
          arr.push(9);
          console.log('Promise 2 then:', result);
        });
        Promise.all(taskPromises);
        await sleep(300);
        if (errorMessage) {
          expect(JSON.stringify(arr)).assertEqual('[1,2,7,4,5,6]');
          expect(errorMessage).assertEqual('At least one promise is rejected');
        } else {
          expect(JSON.stringify(arr)).assertEqual('[1,2,7,4,8,5,9,3]');
          expect(successMessage).assertEqual('All promises are resolved: ["Promise 1 Resolved","Promise 2 Resolved"]');
        }
        console.info(`${caseName} test end`);
        Done();
      });

  })
}