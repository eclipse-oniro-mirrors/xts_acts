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

export default function PromiseRejectSecondTest() {
  describe('PromiseRejectSecondTest', () => {
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
     * @tc.name   PromiseRejectTest2100
     * @tc.number SUB_PROMISE_REJECT_TEST_2100
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseRejectTest2100';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<string>[] = [];
        arr.push(1);

        interface Thenable {
          then: (resolve: (value: string) => void, reject: (reason: Error) => void) => void;
        }

        const innerThenable: Thenable = {
          then: (resolve: (value: string) => void, reject: (reason: Error) => void) => {
            new Promise<string>((_, innerReject) => {
              innerReject(new Error('Rejected from inner thenable'));
            }).then(resolve, reject);
          }
        };
        const outerThenable: Thenable = {
          then: (resolve: (value: string) => void, reject: (reason: Error) => void) => {
            innerThenable.then(resolve, reject);
          }
        };
        const myPromise: Promise<string> = Promise.reject(outerThenable);
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
     * @tc.name   PromiseRejectTest2200
     * @tc.number SUB_PROMISE_REJECT_TEST_2200
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseRejectTest2200';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<string>[] = [];
        arr.push(1);

        interface Thenable {
          then: (resolve: (value: string) => void, reject: (reason: Error) => void) => void;
        }

        const createNestedThenable = (level: number): Thenable => {
          if (level === 1) {
            return {
              then: (resolve, reject) => {
                new Promise<string>((innerResolve, _) => {
                  innerResolve('Resolved at level 1');
                }).then(resolve, reject);
              }
            };
          }
          return {
            then: (resolve, reject) => {
              const nextThenable = createNestedThenable(level - 1);
              new Promise<string>((innerResolve, innerReject) => {
                if (level % 2 === 0) {
                  innerReject(new Error(`Rejected at level ${level}`));
                } else {
                  nextThenable.then(innerResolve, innerReject);
                }
              }).then(resolve, reject);
            }
          };
        };
        const tenLevelThenable = createNestedThenable(10);
        const myPromise: Promise<string> = Promise.reject(tenLevelThenable);
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
     * @tc.name   PromiseRejectTest2300
     * @tc.number SUB_PROMISE_REJECT_TEST_2300
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseRejectTest2300';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<string>[] = [];
        arr.push(1);
        const myPromise: Promise<string> = Promise.resolve('Initial resolved value');
        myPromise
          .then((value) => {
            arr.push(2);
            console.log('Received value in first then:', value);
            throw new Error('Error thrown inside then');
          })
          .then(() => {
            arr.push(3);
            successMessage = 'The second then was executed';
            console.log(successMessage);
          })
          .catch((error: Error) => {
            arr.push(6);
            errorMessage = 'The Promise is rejected';
            console.error('Caught error:', error.message);
          });
        taskPromises.push(myPromise);
        arr.push(7);
        Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,7,2,6]');
        expect(errorMessage).assertEqual('The Promise is rejected');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseRejectTest2400
     * @tc.number SUB_PROMISE_REJECT_TEST_2400
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseRejectTest2400';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<string>[] = [];
        arr.push(1);
        const myPromise = Promise.reject(new Error('Initial rejection error'));
        myPromise
          .then((value) => {
            arr.push(2);
            console.log('This should not be executed:', value);
          })
          .catch((error: Error) => {
            arr.push(3);
            console.error('Caught initial error:', error.message);
            throw new Error('Error thrown inside catch');
          })
          .catch((newError: Error) => {
            arr.push(6);
            errorMessage = 'The Promise is rejected again';
            console.error('Caught new error:', newError.message);
          });
        taskPromises.push(myPromise);
        arr.push(7);
        Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,7,3,6]');
        expect(errorMessage).assertEqual('The Promise is rejected again');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseRejectTest2500
     * @tc.number SUB_PROMISE_REJECT_TEST_2500
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseRejectTest2500';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<string>[] = [];
        arr.push(1);
        const myPromise = Promise.reject(new Error('Initial rejection'));
        myPromise
          .then(() => {
            arr.push(2);
            return new Promise<string>((resolve) => {
              setTimeout(() => {
                resolve('Inner promise resolved');
              }, 100);
            });
          })
          .then((innerValue: string) => {
            arr.push(3);
            successMessage = `Inner promise success: ${innerValue}`;
            console.log(successMessage);
          })
          .catch((error: Error) => {
            arr.push(4);
            errorMessage = `Rejected: ${error.message}`;
            console.error('Caught error:', error.message);
          });
        taskPromises.push(myPromise);
        arr.push(5);
        Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,5,4]');
        expect(errorMessage).assertEqual('Rejected: Initial rejection');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseRejectTest2600
     * @tc.number SUB_PROMISE_REJECT_TEST_2600
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseRejectTest2600';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<string>[] = [];
        arr.push(1);
        const myPromise = Promise.reject(new Error('Initial rejection'));
        let currentPromise: Promise<string | void> = myPromise;
        for (let i = 0; i < 10; i++) {
          currentPromise = currentPromise.then(() => {
            arr.push(i + 2);
            return new Promise<string>((resolve) => {
              setTimeout(() => {
                resolve(`Inner promise resolved at step ${i + 1}`);
              }, 100);
            });
          }).then((innerValue: string) => {
            arr.push(i + 12);
            successMessage = `Inner promise success at step ${i + 1}: ${innerValue}`;
            console.log(successMessage);
            return successMessage;
          });
        }
        currentPromise.catch((error: Error) => {
          arr.push(22);
          errorMessage = `Rejected: ${error.message}`;
          console.error('Caught error:', error.message);
        });
        arr.push(23);
        taskPromises.push(myPromise);
        await sleep(200);
        Promise.all(taskPromises);
        expect(JSON.stringify(arr)).assertEqual('[1,23,22]');
        expect(errorMessage).assertEqual('Rejected: Initial rejection');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseRejectTest2700
     * @tc.number SUB_PROMISE_REJECT_TEST_2700
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseRejectTest2700';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<string>[] = [];
        arr.push(1);
        const myPromise: Promise<string> = Promise.reject(new Error('Initial rejection'));
        let currentPromise: Promise<string | void> = myPromise;
        for (let i: number = 0; i < 10; i++) {
          currentPromise = currentPromise.catch((error: Error): Promise<string> => {
            arr.push(i + 2);
            return Promise.reject(error);
          });
        }
        currentPromise.catch((error: Error): void => {
          arr.push(22);
          errorMessage = `Rejected: ${error.message}`;
          console.error('Caught error:', error.message);
        });
        arr.push(23);
        taskPromises.push(myPromise);
        await sleep(200);
        Promise.all(taskPromises);
        expect(JSON.stringify(arr)).assertEqual('[1,23,2,3,4,5,6,7,8,9,10,11,22]');
        expect(errorMessage).assertEqual('Rejected: Initial rejection');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseRejectTest2800
     * @tc.number SUB_PROMISE_REJECT_TEST_2800
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseRejectTest2800';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<string>[] = [];
        arr.push(1);
        const myPromise: Promise<string> = Promise.reject(new Error('Initial rejection'));
        let currentPromise: Promise<string | void> = myPromise;
        for (let i: number = 0; i < 5; i++) {
          currentPromise = currentPromise.then(() => {
            arr.push(i + 1);
            return new Promise<string>((resolve) => {
              setTimeout(() => {
                resolve(`Inner promise resolved at step ${i + 1}`);
              }, 100);
            });
          }).then((innerValue: string) => {
            arr.push(i + 1);
            successMessage = `Inner promise success at step ${i + 1}: ${innerValue}`;
            console.log(successMessage);
            return successMessage;
          });
          currentPromise = currentPromise.catch((error: Error) => {
            arr.push(i + 2);
            errorMessage = `Rejected at step ${i + 1}: ${error.message}`;
            console.error(errorMessage);
            return Promise.reject(error);
          });
        }
        currentPromise.catch((error: Error): void => {
          arr.push(7);
          errorMessage = `Final Rejected: ${error.message}`;
          console.error(errorMessage);
        });
        arr.push(8);
        taskPromises.push(myPromise);
        await sleep(1000);
        Promise.all(taskPromises);
        expect(JSON.stringify(arr)).assertEqual('[1,8,2,3,4,5,6,7]');
        expect(errorMessage).assertEqual('Final Rejected: Initial rejection');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseRejectTest2900
     * @tc.number SUB_PROMISE_REJECT_TEST_2900
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseRejectTest2900';
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
            setTimeout(() => {
              arr.push(2);
              resolve('Thenable resolved after delay');
            }, 200);
          }
        };
        const rejectedPromise: Promise<string> = Promise.reject(thenable);
        rejectedPromise
          .then((value: string) => {
            arr.push(3);
            successMessage = `Thenable resolved: ${value}`;
            console.log(successMessage);
            return successMessage;
          })
          .catch((error: Thenable) => {
            arr.push(4);
            errorMessage = 'Caught the thenable object as rejection reason';
            console.error(errorMessage);
          });
        arr.push(5);
        taskPromises.push(rejectedPromise);
        await sleep(1000);
        Promise.all(taskPromises);
        expect(JSON.stringify(arr)).assertEqual('[1,5,4]');
        expect(errorMessage).assertEqual('Caught the thenable object as rejection reason');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseRejectTest3000
     * @tc.number SUB_PROMISE_REJECT_TEST_3000
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseRejectTest3000';
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
            setTimeout(() => {
              arr.push(2);
              reject(new Error('Thenable rejected after delay'));
            }, 200);
          }
        };
        const rejectedPromise: Promise<string> = Promise.reject(thenable);
        rejectedPromise
          .then((value: string) => {
            arr.push(3);
            successMessage = `Thenable resolved: ${value}`;
            console.log(successMessage);
            return successMessage;
          })
          .catch((error: Thenable) => {
            arr.push(4);
            errorMessage = `Caught the thenable rejection: ${error}`;
            console.error(errorMessage);
          });
        arr.push(5);
        taskPromises.push(rejectedPromise);
        await sleep(1000);
        Promise.all(taskPromises);
        expect(JSON.stringify(arr)).assertEqual('[1,5,4]');
        expect(errorMessage).assertEqual('Caught the thenable rejection: [object Object]');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseRejectTest3100
     * @tc.number SUB_PROMISE_REJECT_TEST_3100
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseRejectTest3100';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<string>[][] = [];
        arr.push(1);
        const innerPromises: Promise<string>[] = [
          new Promise((resolve) => {
            setTimeout(() => {
              arr.push(2);
              resolve('Inner promise 1 resolved');
            }, 100);
          }),
          Promise.reject(new Error('Inner promise 2 rejected')),
          new Promise((resolve) => {
            setTimeout(() => {
              arr.push(3);
              resolve('Inner promise 3 resolved');
            }, 200);
          })
        ];
        const outerPromises: Promise<string[]>[] = [
          Promise.all(innerPromises),
          new Promise((resolve) => {
            setTimeout(() => {
              arr.push(4);
              resolve(['Outer promise resolved']);
            }, 300);
          })
        ];
        const finalPromise = Promise.all(outerPromises);
        finalPromise
          .then((values: string[][]) => {
            arr.push(5);
            successMessage = `All promises resolved: ${JSON.stringify(values)}`;
            console.log(successMessage);
          })
          .catch((error: Error) => {
            arr.push(6);
            errorMessage = `Caught error: ${error.message}`;
            console.error(errorMessage);
          });
        arr.push(7);
        taskPromises.push(innerPromises);
        await sleep(1000);
        Promise.all(taskPromises);
        expect(JSON.stringify(arr)).assertEqual('[1,7,6,2,3,4]');
        expect(errorMessage).assertEqual('Caught error: Inner promise 2 rejected');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseRejectTest3200
     * @tc.number SUB_PROMISE_REJECT_TEST_3200
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseRejectTest3200';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<PromiseSettledResult<PromiseSettledResult<string>[]>[]>[] = [];
        arr.push(1);
        const innerPromises1: Promise<string>[] = [
          new Promise((resolve) => {
            setTimeout(() => {
              arr.push(2);
              resolve('Inner 1 Promise 1 resolved');
            }, 100);
          }),
          Promise.reject(new Error('Inner 1 Promise 2 rejected')),
          new Promise((resolve) => {
            setTimeout(() => {
              arr.push(3);
              resolve('Inner 1 Promise 3 resolved');
            }, 200);
          })
        ];
        const innerPromises2: Promise<string>[] = [
          new Promise((resolve) => {
            setTimeout(() => {
              arr.push(4);
              resolve('Inner 2 Promise 1 resolved');
            }, 150);
          }),
          new Promise((resolve) => {
            setTimeout(() => {
              arr.push(5);
              resolve('Inner 2 Promise 2 resolved');
            }, 250);
          }),
          Promise.reject(new Error('Inner 2 Promise 3 rejected'))
        ];
        const innerAllSettled1 = Promise.allSettled(innerPromises1);
        const innerAllSettled2 = Promise.allSettled(innerPromises2);
        const outerPromises: Promise<PromiseSettledResult<string>[]>[] = [
          innerAllSettled1,
          innerAllSettled2
        ];
        const outerAllSettled = Promise.allSettled(outerPromises);
        outerAllSettled
          .then((outerResults: PromiseSettledResult<PromiseSettledResult<string>[]>[]) => {
            arr.push(6);
            successMessage = 'All promises settled:';
            outerResults.forEach((outerResult, outerIndex) => {
              if (outerResult.status === 'fulfilled') {
                outerResult.value.forEach((innerResult, innerIndex) => {
                  if (innerResult.status === 'fulfilled') {
                    successMessage += ` Outer ${outerIndex + 1} Inner ${innerIndex + 1}: ${innerResult.value};`;
                  } else {
                    successMessage += ` Outer ${outerIndex + 1} Inner ${innerIndex +
                      1}: ${innerResult.reason.message};`;
                  }
                });
              }
            });
            console.log(successMessage);
          })
          .catch((error: Error) => {
            arr.push(7);
            errorMessage = `Caught unexpected error: ${error.message}`;
            console.error(errorMessage);
          });
        arr.push(8);
        taskPromises.push(outerAllSettled);
        await sleep(1000);
        await Promise.all(taskPromises);
        expect(JSON.stringify(arr)).assertEqual('[1,8,2,4,3,5,6]');
        expect(successMessage.includes('Outer 1 Inner 2: Inner 1 Promise 2 rejected')).assertEqual(true);
        expect(successMessage.includes('Outer 2 Inner 3: Inner 2 Promise 3 rejected')).assertEqual(true);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseRejectTest3300
     * @tc.number SUB_PROMISE_REJECT_TEST_3300
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseRejectTest3300';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<string>[] = [];
        arr.push(1);
        const innerPromises1: Promise<string>[] = [
          Promise.reject(new Error('Inner 1 Promise 1 rejected')),
          new Promise((resolve) => {
            setTimeout(() => {
              arr.push(2);
              resolve('Inner 1 Promise 2 resolved');
            }, 100);
          }),
          Promise.reject(new Error('Inner 1 Promise 3 rejected'))
        ];
        const innerPromises2: Promise<string>[] = [
          new Promise((resolve) => {
            setTimeout(() => {
              arr.push(3);
              resolve('Inner 2 Promise 1 resolved');
            }, 150);
          }),
          Promise.reject(new Error('Inner 2 Promise 2 rejected')),
          Promise.reject(new Error('Inner 2 Promise 3 rejected'))
        ];
        const innerAny1 = Promise.any(innerPromises1);
        const innerAny2 = Promise.any(innerPromises2);
        const outerPromises: Promise<string>[] = [
          innerAny1,
          innerAny2
        ];
        const outerAny = Promise.any(outerPromises);
        outerAny
          .then((value: string) => {
            arr.push(4);
            successMessage = `First resolved value: ${value}`;
            console.log(successMessage);
          })
          .catch((error: AggregateError) => {
            arr.push(5);
            errorMessage =
              `All promises were rejected: ${error.errors.map((err: Error): string => err.message).join(', ')}`;
            console.error(errorMessage);
          });
        arr.push(6);
        taskPromises.push(outerAny);
        await sleep(1000);
        Promise.all(taskPromises);
        expect(JSON.stringify(arr)).assertEqual('[1,6,2,4,3]');
        expect(successMessage).assertEqual('First resolved value: Inner 1 Promise 2 resolved');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseRejectTest3400
     * @tc.number SUB_PROMISE_REJECT_TEST_3400
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseRejectTest3400';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<string>[] = [];
        arr.push(1);
        const innerPromises1: Promise<string>[] = [
          new Promise((resolve) => {
            setTimeout(() => {
              arr.push(2);
              resolve('Inner 1 Promise 1 resolved');
            }, 200);
          }),
          Promise.reject(new Error('Inner 1 Promise 2 rejected')),
          new Promise((resolve) => {
            setTimeout(() => {
              arr.push(3);
              resolve('Inner 1 Promise 3 resolved');
            }, 300);
          })
        ];
        const innerPromises2: Promise<string>[] = [
          new Promise((resolve) => {
            setTimeout(() => {
              arr.push(4);
              resolve('Inner 2 Promise 1 resolved');
            }, 150);
          }),
          Promise.reject(new Error('Inner 2 Promise 2 rejected')),
          new Promise((resolve) => {
            setTimeout(() => {
              arr.push(5);
              resolve('Inner 2 Promise 3 resolved');
            }, 250);
          })
        ];
        const innerRace1 = Promise.race(innerPromises1);
        const innerRace2 = Promise.race(innerPromises2);
        const outerPromises: Promise<string>[] = [
          innerRace1,
          innerRace2
        ];
        const outerRace = Promise.race(outerPromises);
        outerRace
          .then((value: string) => {
            arr.push(6);
            successMessage = `Winner value: ${value}`;
            console.log(successMessage);
          })
          .catch((error: Error) => {
            arr.push(7);
            errorMessage = `Caught error: ${error.message}`;
            console.error(errorMessage);
          });
        arr.push(8);
        taskPromises.push(outerRace);
        await sleep(1000);
        Promise.all(taskPromises);
        expect(JSON.stringify(arr)).assertEqual('[1,8,7,4,2,5,3]');
        expect(errorMessage).assertEqual('Caught error: Inner 1 Promise 2 rejected');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseRejectTest3500
     * @tc.number SUB_PROMISE_REJECT_TEST_3500
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseRejectTest3500';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<string[]>[] = [];
        arr.push(1);
        const innerPromises: Promise<string>[] = [
          Promise.resolve('Inner Promise 1 resolved'),
          Promise.reject(new Error('Inner Promise 2 rejected')),
          Promise.resolve('Inner Promise 3 resolved')
        ];
        const innerResolved = Promise.resolve(Promise.all(innerPromises));
        const outerResolved = Promise.resolve(innerResolved);
        outerResolved
          .then((values: string[]) => {
            arr.push(2);
            successMessage = `All inner promises results: ${values}`;
            console.log(successMessage);
          })
          .catch((error: Error) => {
            arr.push(3);
            errorMessage = `Caught error: ${error.message}`;
            console.error(errorMessage);
          });
        arr.push(4);
        taskPromises.push(outerResolved);
        await sleep(1000);
        Promise.all(taskPromises);
        expect(JSON.stringify(arr)).assertEqual('[1,4,3]');
        expect(errorMessage).assertEqual('Caught error: Inner Promise 2 rejected');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   PromiseRejectTest3600
     * @tc.number SUB_PROMISE_REJECT_TEST_3600
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseRejectTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseRejectTest3600';
        console.info(`${caseName} test start`);
        let arr: number[] = [];
        let successMessage: string = '';
        let errorMessage: string = '';
        let taskPromises: Promise<string>[] = [];
        arr.push(1);
        const innerRejected = Promise.reject<string>(new Error('Inner Promise rejected'));
        const outerRejected = Promise.reject<string>(innerRejected);
        outerRejected
          .then((value: string) => {
            arr.push(2);
            successMessage = `Resolved value: ${value}`;
            console.log("successMessage:" + successMessage);
          })
          .catch((error: Error) => {
            arr.push(3);
            errorMessage = 'Caught rejection';
            console.error("errorMessage:" + errorMessage);
          });
        arr.push(4);
        taskPromises.push(outerRejected);
        await sleep(1000);
        Promise.all(taskPromises);
        expect(JSON.stringify(arr)).assertEqual('[1,4,3]');
        expect(errorMessage).assertEqual('Caught rejection');
        console.info(`${caseName} test end`);
        Done();
      });

  })
}