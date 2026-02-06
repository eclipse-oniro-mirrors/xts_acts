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
import { BusinessError } from "@kit.BasicServicesKit";
import { sleep } from "../testability/pages/TestUtils";

export default function PromiseSecondTest() {
  describe('PromiseSecondTest', () => {
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
     * @tc.name   PromiseSecondTest0100
     * @tc.number SUB_PROMISE_SECOND_TEST_0100
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSecondTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseSecondTest0100';
        console.info(`${caseName} test start`);
        let taskPromises: Promise<string>[] = [];
        let arr: number[] = [];
        let result: string = '';
        const promiseTest: Promise<string> = new Promise((resolve, reject) => {
          setTimeout(() => {
            arr.push(3);
            console.log('Promise Done');
            resolve('success');
          }, 200);
        });
        arr.push(1);
        promiseTest.then((res) => {
          arr.push(2);
          result = res;
          console.log('resolve:' + res);
        }).catch((error: string) => {
          arr.push(5);
          result = error
          console.log('promise error:', error);
        });
        arr.push(4);
        taskPromises.push(promiseTest);
        await Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,4,3,2]');
        expect(result).assertContain('success');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseSecondTest0200
     * @tc.number SUB_PROMISE_SECOND_TEST_0200
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSecondTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseSecondTest0200';
        console.info(`${caseName} test start`);
        let taskPromises: Promise<string>[] = [];
        let arr: number[] = [];
        let result: string = '';
        const promiseTest: Promise<string> = new Promise((resolve, reject) => {
          setTimeout(() => {
            arr.push(3);
            console.log('Promise Done');
            reject(new Error('failed'));
          }, 200);
        });
        arr.push(1);
        promiseTest.then((res) => {
          arr.push(5);
          result = res;
          console.log('resolve:' + res);
        }).catch((error: BusinessError) => {
          arr.push(2);
          result = error.message;
          console.log('promise error:', error.message);
        });
        arr.push(4);
        taskPromises.push(promiseTest);
        await Promise.allSettled(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,4,3,2]');
        expect(result).assertEqual('failed');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseSecondTest0300
     * @tc.number SUB_PROMISE_SECOND_TEST_0300
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSecondTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseSecondTest0300';
        console.info(`${caseName} test start`);
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<string>[] = [];
        let arr: number[] = [];
        const testPromise = (): Promise<string> => {
          return new Promise((resolve, reject) => {
            const innerPromise = Promise.resolve('Result of inner Promise');
            arr.push(2);
            innerPromise
              .then((result: string) => {
                arr.push(5);
                resolve(result);
              })
              .catch((error: Error) => {
                arr.push(6);
                reject(error);
              });
          });
        };
        arr.push(1);
        let promiseResult: Promise<string> = testPromise();
        promiseResult
          .then((successResult: string) => {
            arr.push(3);
            successMessage = `Success: ${successResult}`;
            console.log("successMessage:" + successMessage);
          })
          .catch((errorResult: Error) => {
            arr.push(7);
            errorMessage = `Failure: ${errorResult.message}`;
            console.log("errorMessage:" + errorMessage);
          });
        arr.push(4);
        taskPromises.push(promiseResult);
        await Promise.allSettled(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,2,4,5,3]');
        expect(successMessage).assertEqual('Success: Result of inner Promise');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseSecondTest0400
     * @tc.number SUB_PROMISE_SECOND_TEST_0400
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSecondTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseSecondTest0400';
        console.info(`${caseName} test start`);
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<string>[] = [];
        let arr: number[] = [];
        const testPromise = (): Promise<string> => {
          return new Promise((resolve, reject) => {
            const innerPromise = Promise.reject(new Error('Failed'));
            arr.push(2);
            innerPromise
              .then((result: string) => {
                arr.push(6);
                resolve(result);
              })
              .catch((error: Error) => {
                arr.push(7);
                reject(error);
              });
          });
        };
        arr.push(1);
        let promiseResult: Promise<string> = testPromise();
        promiseResult
          .then((successResult: string) => {
            arr.push(3);
            successMessage = `Success: ${successResult}`;
            console.log("successMessage:" + successMessage);
          })
          .catch((errorResult: Error) => {
            arr.push(5);
            errorMessage = `Failure: ${errorResult.message}`;
            console.log("errorMessage:" + errorMessage);
          });
        arr.push(4);
        taskPromises.push(promiseResult);
        await Promise.allSettled(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,2,4,7,5]');
        expect(errorMessage).assertEqual('Failure: Failed');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseSecondTest0500
     * @tc.number SUB_PROMISE_SECOND_TEST_0500
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSecondTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseSecondTest0500';
        console.info(`${caseName} test start`);
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<string>[] = [];
        let arr: number[] = [];
        const testPromise = (): Promise<string> => {
          return new Promise((resolve, reject) => {
            setTimeout(() => {
              arr.push(2);
              resolve('successfully');
            }, 200);
          });
        };
        arr.push(1);
        let promiseResult: Promise<string> = testPromise();
        promiseResult
          .then((successResult: string) => {
            arr.push(3);
            successMessage = `Success: ${successResult}`;
            console.log("successMessage:" + successMessage);
          })
          .catch((errorResult: Error) => {
            arr.push(5);
            errorMessage = `Failure: ${errorResult.message}`;
            console.log("errorMessage:" + errorMessage);
          });
        arr.push(4);
        taskPromises.push(promiseResult);
        await Promise.allSettled(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,4,2,3]');
        expect(successMessage).assertEqual('Success: successfully');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseSecondTest0600
     * @tc.number SUB_PROMISE_SECOND_TEST_0600
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSecondTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseSecondTest0600';
        console.info(`${caseName} test start`);
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<number>[] = [];
        let arr: number[] = [];
        const testPromise = (): Promise<number> => {
          return new Promise((resolve, reject) => {
            setTimeout(() => {
              arr.push(2);
              const num = 10;
              resolve(num);
            }, 200);
          });
        };
        arr.push(1);
        let promiseResult: Promise<number> = testPromise();
        promiseResult
          .then((result: number) => {
            arr.push(3);
            console.log(`First then: Received number ${result}`);
            return result * 2;
          })
          .then((newResult: number) => {
            arr.push(5);
            console.log(`Second then: The number multiplied by 2 is ${newResult}`);
            return newResult + 5;
          })
          .then((finalResult: number) => {
            arr.push(6);
            successMessage = `Final result: ${finalResult}`;
            console.log(successMessage);
          })
          .catch((error: Error) => {
            arr.push(7);
            errorMessage = `Failure: ${error.message}`;
            console.log(errorMessage);
          });
        arr.push(4);
        taskPromises.push(promiseResult);
        await Promise.allSettled(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,4,2,3,5,6]');
        expect(successMessage).assertEqual('Final result: 25');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseSecondTest0700
     * @tc.number SUB_PROMISE_SECOND_TEST_0700
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSecondTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseSecondTest0700';
        console.info(`${caseName} test start`);
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<string>[] = [];
        let arr: number[] = [];
        const testPromise = (): Promise<string> => {
          return new Promise((resolve, reject) => {
            arr.push(2);
            resolve('First call to resolve');
            resolve('Second call to resolve');
          });
        };
        arr.push(1);
        let promiseResult: Promise<string> = testPromise();
        promiseResult
          .then((result: string) => {
            arr.push(3);
            successMessage = `Success: ${result}`;
            console.log("successMessage:" + successMessage);
          })
          .catch((error: Error) => {
            arr.push(5);
            errorMessage = `Failure: ${error.message}`;
            console.log("errorMessage:" + errorMessage);
          });
        arr.push(4);
        taskPromises.push(promiseResult);
        await Promise.allSettled(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,2,4,3]');
        expect(successMessage).assertEqual('Success: First call to resolve');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseSecondTest0800
     * @tc.number SUB_PROMISE_SECOND_TEST_0800
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSecondTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseSecondTest0800';
        console.info(`${caseName} test start`);
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<string>[] = [];
        let arr: number[] = [];
        const testPromise = (): Promise<string> => {
          return new Promise((resolve, reject) => {
            arr.push(2);
            reject(new Error('First call to reject'));
            reject(new Error('Second call to reject'));
          });
        };
        arr.push(1);
        let promiseResult: Promise<string> = testPromise();
        promiseResult
          .then((result: string) => {
            arr.push(3);
            successMessage = `Success: ${result}`;
            console.log("successMessage:" + successMessage);
          })
          .catch((error: Error) => {
            arr.push(5);
            errorMessage = `Failure: ${error.message}`;
            console.log("errorMessage:" + errorMessage);
          });
        arr.push(4);
        taskPromises.push(promiseResult);
        await Promise.allSettled(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,2,4,5]');
        expect(errorMessage).assertEqual('Failure: First call to reject');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseSecondTest0900
     * @tc.number SUB_PROMISE_SECOND_TEST_0900
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSecondTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseSecondTest0900';
        console.info(`${caseName} test start`);
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<string>[] = [];
        let arr: number[] = [];
        const testPromise = (): Promise<string> => {
          return new Promise((resolve, reject) => {
            arr.push(2);
            resolve('First call to resolve');
            reject(new Error('First call to reject'));
          });
        };
        arr.push(1);
        let promiseResult: Promise<string> = testPromise();
        promiseResult
          .then((result: string) => {
            arr.push(3);
            successMessage = `Success: ${result}`;
            console.log("successMessage:" + successMessage);
          })
          .catch((error: Error) => {
            arr.push(5);
            errorMessage = `Failure: ${error.message}`;
            console.log("errorMessage:" + errorMessage);
          });
        arr.push(4);
        taskPromises.push(promiseResult);
        await Promise.allSettled(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,2,4,3]');
        expect(successMessage).assertEqual('Success: First call to resolve');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseSecondTest1000
     * @tc.number SUB_PROMISE_SECOND_TEST_1000
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSecondTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseSecondTest1000';
        console.info(`${caseName} test start`);
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<string>[] = [];
        let arr: number[] = [];
        const testPromise = (): Promise<string> => {
          return new Promise((resolve, reject) => {
            arr.push(2);
            reject(new Error('First call to reject'));
            resolve('First call to resolve');
          });
        };
        arr.push(1);
        let promiseResult: Promise<string> = testPromise();
        promiseResult
          .then((result: string) => {
            arr.push(3);
            successMessage = `Success: ${result}`;
            console.log("successMessage:" + successMessage);
          })
          .catch((error: Error) => {
            arr.push(5);
            errorMessage = `Failure: ${error.message}`;
            console.log("errorMessage:" + errorMessage);
          });
        arr.push(4);
        taskPromises.push(promiseResult);
        await Promise.allSettled(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,2,4,5]');
        expect(errorMessage).assertEqual('Failure: First call to reject');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseSecondTest1100
     * @tc.number SUB_PROMISE_SECOND_TEST_1100
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSecondTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseSecondTest1100';
        console.info(`${caseName} test start`);
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<number>[] = [];
        let arr: number[] = [];
        const testPromise = (): Promise<number> => {
          return new Promise((resolve, reject) => {
            setTimeout(() => {
              arr.push(2);
              resolve(10);
            }, 200);
          });
        };
        arr.push(1);
        let promiseResult: Promise<number> = testPromise();
        promiseResult
          .then((result: number) => {
            console.log(`Received result: ${result}`);
            if (result > 5) {
              arr.push(3);
              throw new Error('The result is greater than 5, throwing an error!');
            }
            return result * 2;
          })
          .then((newResult: number) => {
            arr.push(5);
            successMessage = `New result: ${newResult}`;
            console.log("successMessage:" + successMessage);
          })
          .catch((error: Error) => {
            arr.push(6);
            errorMessage = `Error caught: ${error.message}`;
            console.log("errorMessage:" + errorMessage);
          });
        arr.push(4);
        taskPromises.push(promiseResult);
        await Promise.allSettled(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,4,2,3,6]');
        expect(errorMessage).assertEqual('Error caught: The result is greater than 5, throwing an error!');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseSecondTest1200
     * @tc.number SUB_PROMISE_SECOND_TEST_1200
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSecondTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseSecondTest1200';
        console.info(`${caseName} test start`);
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<number>[] = [];
        let arr: number[] = [];
        const testPromise = (): Promise<number> => {
          return new Promise((resolve, reject) => {
            setTimeout(() => {
              arr.push(2);
              reject(10);
            }, 200);
          });
        };
        arr.push(1);
        let promiseResult: Promise<number> = testPromise();
        promiseResult
          .then((result: number) => {
            console.log(`Received result: ${result}`);
            if (result > 5) {
              arr.push(3);
              throw new Error('The result is greater than 5, throwing an error!');
            }
            return result * 2;
          })
          .then((newResult: number) => {
            arr.push(5);
            successMessage = `New result: ${newResult}`;
            console.log("successMessage:" + successMessage);
          })
          .catch((error: Error) => {
            arr.push(6);
            errorMessage = `First error caught: ${error.message}`;
            console.log("errorMessage:" + errorMessage);
            throw new Error('An error occurred while handling the previous error!');
          })
          .catch((newError: Error) => {
            console.log(`Final error caught: ${newError.message}`);
          });
        arr.push(4);
        taskPromises.push(promiseResult);
        await Promise.allSettled(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,4,2,6]');
        expect(errorMessage).assertEqual('First error caught: undefined');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseSecondTest1300
     * @tc.number SUB_PROMISE_SECOND_TEST_1300
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSecondTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseSecondTest1300';
        console.info(`${caseName} test start`);
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<number>[] = [];
        let arr: number[] = [];
        const testPromise = (): Promise<number> => {
          return new Promise((resolve, reject) => {
            setTimeout(() => {
              arr.push(2);
              reject(10);
            }, 200);
          });
        };
        arr.push(1);
        let promiseResult: Promise<number> = testPromise();
        promiseResult
          .then((result: number) => {
            console.log(`Received result: ${result}`);
            if (result > 5) {
              throw new Error('The result is greater than 5, throwing an error!');
            }
            return result * 2;
          })
          .then((newResult: number) => {
            arr.push(6)
            successMessage = `New result: ${newResult}`;
            console.log("successMessage:" + successMessage);
          })
          .catch((error: Error) => {
            arr.push(7);
            errorMessage = `Error caught: ${error.message}`;
            console.log("errorMessage:" + errorMessage);
          })
          .finally(() => {
            arr.push(3);
            console.log('Executing finally block');
            throw new Error('An error occurred in the finally block!');
          })
          .catch((finalError: Error) => {
            arr.push(5);
            console.log(`Final error caught: ${finalError.message}`);
          });
        arr.push(4);
        taskPromises.push(promiseResult);
        await Promise.allSettled(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,4,2,7,3,5]');
        expect(errorMessage).assertEqual('Error caught: undefined');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseSecondTest1400
     * @tc.number SUB_PROMISE_SECOND_TEST_1400
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSecondTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseSecondTest1400';
        console.info(`${caseName} test start`);
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<number>[] = [];
        let arr: number[] = [];
        const testPromise = (): Promise<number> => {
          return new Promise((resolve, reject) => {
            setTimeout(() => {
              const innerPromise = new Promise<number>((innerResolve, innerReject) => {
                arr.push(2);
                innerReject(new Error('Inner promise is rejected!'));
              });
              innerPromise
                .then((value) => {
                  arr.push(6);
                  resolve(value);
                })
                .catch((err: Error) => {
                  arr.push(7);
                  reject(err);
                });
            }, 200);
          });
        };
        arr.push(1);
        let promiseResult: Promise<number> = testPromise();
        promiseResult
          .then((result: number) => {
            arr.push(3);
            successMessage = `Success: ${result}`;
            console.log("successMessage:" + successMessage);
          })
          .catch((error: Error) => {
            arr.push(5);
            errorMessage = `Error caught: ${error.message}`;
            console.log("errorMessage:" + errorMessage);
          });
        arr.push(4);
        taskPromises.push(promiseResult);
        await Promise.allSettled(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,4,2,7,5]');
        expect(errorMessage).assertEqual('Error caught: Inner promise is rejected!');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseSecondTest1500
     * @tc.number SUB_PROMISE_SECOND_TEST_1500
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSecondTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseSecondTest1500';
        console.info(`${caseName} test start`);
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<number>[] = [];
        let arr: number[] = [];
        const testPromise = (): Promise<number> => {
          return new Promise((resolve, reject) => {
            setTimeout(() => {
              const innerPromise = new Promise<number>((innerResolve, innerReject) => {
                arr.push(0);
                innerReject(new Error('Inner promise is rejected!'));
              });
              innerPromise
                .then((value) => {
                  arr.push(22);
                  resolve(value);
                })
                .catch((err: Error) => {
                  arr.push(23);
                  reject(err);
                });
            }, 200);
          });
        };
        let promiseResult: Promise<number> = testPromise();
        promiseResult
          .then((result: number) => {
            arr.push(1);
            console.log(`Then 1: ${result}`);
            return result + 1;
          })
          .catch((error: Error) => {
            arr.push(2);
            errorMessage = `Catch 1: ${error.message}`;
            console.log("errorMessage: " + errorMessage);
            throw error;
          })
          .then((result: number) => {
            arr.push(3);
            console.log(`Then 2: ${result}`);
            return result + 1;
          })
          .catch((error: Error) => {
            arr.push(4);
            errorMessage = `Catch 2: ${error.message}`;
            console.log("errorMessage: " + errorMessage);
            throw error;
          })
          .then((result: number) => {
            arr.push(5);
            console.log(`Then 3: ${result}`);
            return result + 1;
          })
          .catch((error: Error) => {
            arr.push(6);
            errorMessage = `Catch 3: ${error.message}`;
            console.log("errorMessage: " + errorMessage);
            throw error;
          })
          .then((result: number) => {
            arr.push(7);
            console.log(`Then 4: ${result}`);
            return result + 1;
          })
          .catch((error: Error) => {
            arr.push(8);
            errorMessage = `Catch 4: ${error.message}`;
            console.log("errorMessage: " + errorMessage);
            throw error;
          })
          .then((result: number) => {
            arr.push(9);
            console.log(`Then 5: ${result}`);
            return result + 1;
          })
          .catch((error: Error) => {
            arr.push(10);
            errorMessage = `Catch 5: ${error.message}`;
            console.log("errorMessage: " + errorMessage);
            throw error;
          })
          .then((result: number) => {
            arr.push(11);
            console.log(`Then 6: ${result}`);
            return result + 1;
          })
          .catch((error: Error) => {
            arr.push(12);
            errorMessage = `Catch 6: ${error.message}`;
            console.log("errorMessage: " + errorMessage);
            throw error;
          })
          .then((result: number) => {
            arr.push(13);
            console.log(`Then 7: ${result}`);
            return result + 1;
          })
          .catch((error: Error) => {
            arr.push(14);
            errorMessage = `Catch 7: ${error.message}`;
            console.log("errorMessage: " + errorMessage);
            throw error;
          })
          .then((result: number) => {
            arr.push(15);
            console.log(`Then 8: ${result}`);
            return result + 1;
          })
          .catch((error: Error) => {
            arr.push(16);
            errorMessage = `Catch 8: ${error.message}`;
            console.log("errorMessage: " + errorMessage);
            throw error;
          })
          .then((result: number) => {
            arr.push(17);
            console.log(`Then 9: ${result}`);
            return result + 1;
          })
          .catch((error: Error) => {
            arr.push(18);
            errorMessage = `Catch 9: ${error.message}`;
            console.log("errorMessage: " + errorMessage);
            throw error;
          })
          .then((result: number) => {
            arr.push(19);
            console.log(`Then 10: ${result}`);
            return result + 1;
          })
          .catch((error: Error) => {
            arr.push(20);
            errorMessage = `Final error caught: ${error.message}`;
            console.log("errorMessage: " + errorMessage);
          });
        arr.push(21);
        taskPromises.push(promiseResult);
        await Promise.allSettled(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[21,0,23,2,4,6,8,10,12,14,16,18,20]');
        expect(errorMessage).assertEqual('Final error caught: Inner promise is rejected!');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseSecondTest1600
     * @tc.number SUB_PROMISE_SECOND_TEST_1600
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSecondTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseSecondTest1600';
        console.info(`${caseName} test start`);
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<number>[] = [];
        let arr: number[] = [];
        const testPromise = (): Promise<number> => {
          return new Promise((resolve, reject) => {
            setTimeout(() => {
              const innerPromise = new Promise<number>((innerResolve, innerReject) => {
                arr.push(0);
                innerReject(new Error('Inner promise is rejected!'));
              });
              innerPromise
                .then((value) => {
                  arr.push(12);
                  resolve(value);
                })
                .catch((err: Error) => {
                  arr.push(13);
                  reject(err);
                });
            }, 200);
          });
        };
        let promiseResult: Promise<number> = testPromise();
        promiseResult
          .then((result: number) => {
            arr.push(1);
            successMessage = `Then 1: ${result}`;
            console.log("successMessage:" + successMessage);
            return result + 1;
          })
          .catch((error: Error) => {
            arr.push(2);
            errorMessage = `Catch 1: ${error.message}`;
            console.log("errorMessage: " + errorMessage);
            throw error;
          })
          .then((result: number) => {
            arr.push(3);
            successMessage = `Then 2: ${result}`;
            console.log("successMessage:" + successMessage);
            return result + 1;
          })
          .catch((error: Error) => {
            arr.push(4);
            errorMessage = `Catch 2: ${error.message}`;
            console.log("errorMessage: " + errorMessage);
            throw error;
          })
          .then((result: number) => {
            arr.push(5);
            successMessage = `Then 3: ${result}`;
            console.log("successMessage:" + successMessage);
            return result + 1;
          })
          .catch((error: Error) => {
            arr.push(6);
            errorMessage = `Catch 3: ${error.message}`;
            console.log("errorMessage: " + errorMessage);
            throw error;
          })
          .then((result: number) => {
            arr.push(7);
            successMessage = `Then 4: ${result}`;
            console.log("successMessage:" + successMessage);
            return result + 1;
          })
          .catch((error: Error) => {
            arr.push(8);
            errorMessage = `Catch 4: ${error.message}`;
            console.log("errorMessage: " + errorMessage);
            throw error;
          })
          .then((result: number) => {
            arr.push(9);
            successMessage = `Then 5: ${result}`;
            console.log("successMessage:" + successMessage);
            return result + 1;
          })
          .catch((error: Error) => {
            arr.push(10);
            errorMessage = `Final error caught: ${error.message}`;
            console.log("errorMessage: " + errorMessage);
          });
        arr.push(11);
        taskPromises.push(promiseResult);
        await Promise.allSettled(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[11,0,13,2,4,6,8,10]');
        expect(errorMessage).assertEqual('Final error caught: Inner promise is rejected!');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseSecondTest1700
     * @tc.number SUB_PROMISE_SECOND_TEST_1700
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseSecondTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseSecondTest1700';
        console.info(`${caseName} test start`);
        let taskPromises: Promise<string>[] = [];
        let arr: number[] = [];
        let currentPromise: Promise<string> = new Promise((resolve) => {
          arr.push(1);
          resolve('Initial value');
        });
        for (let i = 2; i <= 11; i++) {
          currentPromise = currentPromise.then((value) => {
            return new Promise<string>((resolve, reject) => {
              if (i % 2 === 0) {
                arr.push(i);
                console.log(`Promise ${i} resolved`);
                resolve(`${value} -> Resolved at level ${i - 1}`);
              } else {
                arr.push(i);
                console.log(`Promise ${i} rejected`);
                reject(new Error(`${value} -> Rejected at level ${i - 1}`));
              }
            });
          }).catch((error: Error) => {
            return new Promise<string>((resolve, reject) => {
              if (i % 2 === 0) {
                arr.push(i);
                console.log(`Promise ${i} rejected in catch`);
                reject(new Error(`${error.message} -> Rejected at level ${i - 1}`));
              } else {
                arr.push(i);
                console.log(`Promise ${i} resolved in catch`);
                resolve(`${error.message} -> Resolved at level ${i - 1}`);
              }
            });
          });
        }
        taskPromises.push(currentPromise);
        await Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,2,3,3,4,5,5,6,7,7,8,9,9,10,11,11]');
        console.info(`${caseName} test end`);
        Done();
      });

  })
}