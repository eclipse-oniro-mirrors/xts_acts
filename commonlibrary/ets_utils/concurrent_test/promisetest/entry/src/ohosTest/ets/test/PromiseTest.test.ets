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


export default function PromiseTest() {
  describe('PromiseTest', () => {
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
     * @tc.number SUB_PROMISE_TEST_0100
     * @tc.name PromiseTest0100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseTest0100';
        console.info(`${caseName} test start`);
        let taskPromises: Promise<void>[] = [];
        let arr: number[] = [];
        let voidResult: void;
        const promiseVoid: Promise<void> = new Promise((resolve, reject) => {
          setTimeout(() => {
            arr.push(3);
            console.log('Promise Done');
            resolve();
          }, 200);
        });
        arr.push(1);
        promiseVoid.then((res) => {
          arr.push(2);
          voidResult = res;
          console.log('resolve:' + res);
        }).catch((error: void) => {
          voidResult = error
          console.log('promise error:', error);
        });
        arr.push(4);
        taskPromises.push(promiseVoid);
        await Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,4,3,2]');
        console.info(`${caseName} test end`)
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_TEST_0200
     * @tc.name PromiseTest0200
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseTest0200';
        console.info(`${caseName} test start`);
        let taskPromises: Promise<string>[] = [];
        let arr: number[] = [];
        let stringResult: string = '';
        const promiseString: Promise<string> = new Promise((resolve, reject) => {
          setTimeout(() => {
            arr.push(3);
            console.log('Promise Done');
            resolve('haha');
          }, 200);
        });
        arr.push(1);
        promiseString.then((res) => {
          arr.push(2);
          stringResult = res;
          console.log('resolve:' + res);
        }).catch((error: string) => {
          stringResult = 'failed'
          console.log('promise error:', error);
        });
        arr.push(4);
        taskPromises.push(promiseString);
        await Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,4,3,2]');
        expect(stringResult).assertEqual('haha');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_TEST_0300
     * @tc.name PromiseTest0300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseTest0300';
        console.info(`${caseName} test start`);
        let taskPromises: Promise<number>[] = [];
        let arr: number[] = [];
        let numberResult: number = 0;
        const promiseNumber: Promise<number> = new Promise((resolve, reject) => {
          setTimeout(() => {
            arr.push(3);
            console.log('Promise Done');
            resolve(10);
          }, 200);
        });
        arr.push(1);
        promiseNumber.then((res) => {
          arr.push(2);
          numberResult = res;
          console.log('resolve:' + res);
        }).catch((error: number) => {
          numberResult = 5
          console.log('promise error:', error);
        });
        arr.push(4);
        taskPromises.push(promiseNumber);
        await Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,4,3,2]');
        expect(numberResult).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_TEST_0400
     * @tc.name PromiseTest0400
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseTest0400';
        console.info(`${caseName} test start`);
        let taskPromises: Promise<boolean>[] = [];
        let arr: number[] = [];
        let booleanResult: boolean = false;
        const promiseBoolean: Promise<boolean> = new Promise((resolve, reject) => {
          setTimeout(() => {
            arr.push(3);
            console.log('Promise Done');
            resolve(true);
          }, 200);
        });
        arr.push(1);
        promiseBoolean.then((res) => {
          arr.push(2);
          booleanResult = res;
          console.log('resolve:' + res);
        }).catch((error: boolean) => {
          booleanResult = false
          console.log('promise error:', error);
        });
        arr.push(4);
        taskPromises.push(promiseBoolean);
        await Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,4,3,2]');
        expect(booleanResult).assertTrue();
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_TEST_0500
     * @tc.name PromiseTest0500
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseTest0500';
        console.info(`${caseName} test start`);
        let taskPromises: Promise<bigint>[] = [];
        let arr: number[] = [];
        let bigintResult: bigint = 12n;
        const promiseBigint: Promise<bigint> = new Promise((resolve, reject) => {
          setTimeout(() => {
            arr.push(3);
            console.log('Promise Done');
            resolve(1234n);
          }, 200);
        });
        arr.push(1);
        promiseBigint.then((res) => {
          arr.push(2);
          bigintResult = res;
          console.log('resolve:' + res);
        }).catch((error: bigint) => {
          bigintResult = 123n
          console.log('promise error:', error);
        });
        arr.push(4);
        taskPromises.push(promiseBigint);
        await Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,4,3,2]');
        expect(bigintResult).assertEqual(1234n);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_TEST_0600
     * @tc.name PromiseTest0600
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseTest0600';
        console.info(`${caseName} test start`);

        interface SuccessResponse {
          success: string;
        }

        let taskPromises: Promise<object>[] = [];
        let arr: number[] = [];
        let objectResult: object | string = 'null';
        const promiseObject: Promise<SuccessResponse> = new Promise((resolve, reject) => {
          setTimeout(() => {
            arr.push(3);
            console.log('Promise Done');
            resolve({
              success: 'Object Promise success'
            });
          }, 200);
        });
        arr.push(1);
        promiseObject.then((res) => {
          arr.push(2);
          objectResult = res.success;
          console.log('resolve:' + res);
        }).catch((error: object) => {
          objectResult = error
          console.log('promise error:', error);
        });
        arr.push(4);
        taskPromises.push(promiseObject);
        await Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,4,3,2]');
        expect(objectResult).assertEqual('Object Promise success');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_TEST_0700
     * @tc.name PromiseTest0700
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseTest0700';
        console.info(`${caseName} test start`);
        let taskPromises: Promise<object>[] = [];
        let promiseOfPromiseResult: string | null = null;
        let promiseOfPromiseError: string | null = null;
        let arr: number[] = [];
        const innerPromise: Promise<string> = new Promise((resolve, reject) => {
          setTimeout(() => {
            arr.push(2);
            resolve('Inner Promise success');
          }, 200);
        });
        arr.push(1)
        const promiseOfPromise: Promise<Promise<string>> = new Promise((resolve, reject) => {
          setTimeout(() => {
            arr.push(3);
            resolve(innerPromise);
          }, 200);
        });
        promiseOfPromise
          .then((inner) => {
            arr.push(6);
            return inner;
          })
          .then((result) => {
            arr.push(4);
            promiseOfPromiseResult = result;
            console.log('Promise of Promise success:', result);
          })
          .catch((error: string) => {
            promiseOfPromiseError = error;
            console.log('Promise of Promise fail:', error);
          });
        arr.push(5);
        taskPromises.push(promiseOfPromise);
        await Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,5,2,3,6,4]');
        expect(promiseOfPromiseResult).assertEqual('Inner Promise success');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_TEST_0800
     * @tc.name PromiseTest0800
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseTest0800';
        console.info(`${caseName} test start`);
        let taskPromises: Promise<object>[] = [];
        let errorResult: Error | null = null;
        let errorError: Error | null = null;
        let arr: number[] = [];
        arr.push(1);
        const promiseError: Promise<Error> = new Promise((resolve, reject) => {
          setTimeout(() => {
            arr.push(2);
            resolve(new Error('Error Promise success'));
          }, 200);
        });
        arr.push(3);
        promiseError
          .then((result) => {
            arr.push(4);
            errorResult = result;
            console.log('Error Promise success:', result.message);
          })
          .catch((error: Error) => {
            errorError = error;
            console.log('Error Promise error:', error.message);
          });
        arr.push(5);
        taskPromises.push(promiseError);
        await Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,3,5,2,4]');
        expect(typeof errorResult).assertEqual('object');
        console.info(`${caseName} test end`);
        Done();
      })


    /**
     * @tc.number SUB_PROMISE_TEST_0900
     * @tc.name PromiseTest0900
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseTest0900';
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
          result = error
          console.log('promise error:', error);
        });
        arr.push(4);
        taskPromises.push(promiseTest);
        await Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,4,3,2]');
        expect(result).assertEqual('success');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_TEST_1000
     * @tc.name PromiseTest1000
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseTest1000';
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
     * @tc.number SUB_PROMISE_TEST_1100
     * @tc.name PromiseTest1100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseTest1100';
        console.info(`${caseName} test start`);
        let taskPromises: Promise<string>[] = [];
        let arr: number[] = [];
        let result: string = '';
        const promiseTest: Promise<string> = new Promise((resolve, reject) => {
          setTimeout(() => {
            arr.push(3);
            console.log('Promise Done');
            try {
              throw new Error('throw new Error');
            } catch (error) {
              reject(error);
            }
          }, 200);
        });
        arr.push(1);
        promiseTest.then((res) => {
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
        expect(result).assertEqual('throw new Error');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_TEST_1200
     * @tc.name PromiseTest1200
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseTest1200'
        console.info(`${caseName} test start`)
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
     * @tc.number SUB_PROMISE_TEST_1300
     * @tc.name PromiseTest1300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseTest1300';
        console.info(`${caseName} test start`);
        let taskPromises: Promise<string>[] = [];
        let arr: number[] = [];
        let result: string = '';
        const promiseFunction = (param: null | string): Promise<string> => {
          return new Promise((resolve, reject) => {
            if (param === null) {
              arr.push(2);
              resolve('param is null');
            } else {
              reject(new Error('param is not null'));
            }
          });
        };
        arr.push(1);
        promiseFunction(null)
          .then((data: string) => {
            result = data;
            console.log("result:" + result);
          })
          .catch((error: Error) => {
            arr.push(3);
            result = error.message;
            console.error('error:' + result);
          });
        arr.push(4);
        taskPromises.push(promiseFunction(null));
        await Promise.allSettled(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,2,4,2]');
        expect(result).assertEqual('param is null');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_TEST_1400
     * @tc.name PromiseTest1400
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseTest1400';
        console.info(`${caseName} test start`);
        let taskPromises: Promise<string>[] = [];
        let arr: number[] = [];
        let result: string = '';
        const promiseFunction = (param: undefined | string): Promise<string> => {
          return new Promise((resolve, reject) => {
            if (param === undefined) {
              arr.push(2);
              resolve('param is undefined');
            } else {
              reject(new Error('param is not undefined'));
            }
          });
        };
        arr.push(1);
        promiseFunction(undefined)
          .then((data: string) => {
            result = data;
            console.log("result:" + result);
          })
          .catch((error: Error) => {
            arr.push(3);
            result = error.message;
            console.error('error:' + result);
          });
        arr.push(4);
        taskPromises.push(promiseFunction(undefined));
        await Promise.allSettled(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,2,4,2]');
        expect(result).assertEqual('param is undefined');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_TEST_1500
     * @tc.name PromiseTest1500
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseTest1500';
        console.info(`${caseName} test start`);
        let taskPromises: Promise<string>[] = [];
        let arr: number[] = [];
        let result: string = '';
        const promiseFunction = (param: undefined | string): Promise<string> => {
          return new Promise((resolve, reject) => {
            if (param === 'success') {
              arr.push(2);
              resolve('success');
            } else {
              reject(new Error('failed'));
            }
          });
        };
        arr.push(1);
        promiseFunction('success')
          .then((data: string) => {
            arr.push(5);
            result = data;
            console.log("result:" + result);
          })
          .catch((error: Error) => {
            arr.push(3);
            result = error.message;
            console.error('error:' + result);
          });
        arr.push(4);
        taskPromises.push(promiseFunction('success'));
        await Promise.allSettled(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,2,4,2,5]');
        expect(result).assertEqual('success');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_TEST_1600
     * @tc.name PromiseTest1600
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseTest1600';
        console.info(`${caseName} test start`);
        let taskPromises: Promise<number>[] = [];
        let arr: number[] = [];
        let result: number = 0;
        const promiseFunction = (param: undefined | number): Promise<number> => {
          return new Promise((resolve, reject) => {
            if (typeof param === 'number') {
              arr.push(2);
              resolve(10);
            } else {
              reject(5);
            }
          });
        };
        arr.push(1);
        promiseFunction(10)
          .then((data: number) => {
            arr.push(5);
            result = data;
            console.log("result:" + result);
          })
          .catch((error: number) => {
            arr.push(3);
            result = error;
            console.error('error:' + result);
          });
        arr.push(4);
        taskPromises.push(promiseFunction(10));
        await Promise.allSettled(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,2,4,2,5]');
        expect(result).assertEqual(10);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_TEST_1700
     * @tc.name PromiseTest1700
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseTest1700';
        console.info(`${caseName} test start`);
        let taskPromises: Promise<boolean>[] = [];
        let arr: number[] = [];
        let result: boolean = false;
        const promiseFunction = (param: boolean): Promise<boolean> => {
          return new Promise((resolve, reject) => {
            if (typeof param === 'boolean') {
              arr.push(2);
              resolve(true);
            } else {
              reject(false);
            }
          });
        };
        arr.push(1);
        promiseFunction(true)
          .then((data: boolean) => {
            arr.push(5);
            result = data;
            console.log("result:" + result);
          })
          .catch((error: boolean) => {
            arr.push(3);
            result = error;
            console.error('error:' + result);
          });
        arr.push(4);
        taskPromises.push(promiseFunction(true));
        await Promise.allSettled(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,2,4,2,5]');
        expect(result).assertEqual(true);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_TEST_1800
     * @tc.name PromiseTest1800
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseTest1800';
        console.info(`${caseName} test start`);
        let taskPromises: Promise<bigint>[] = [];
        let arr: number[] = [];
        let result: bigint = 0n;
        const promiseFunction = (param: bigint | number): Promise<bigint> => {
          return new Promise((resolve, reject) => {
            if (typeof param === 'bigint') {
              arr.push(2);
              resolve(10n);
            } else {
              reject(5n);
            }
          });
        };
        arr.push(1);
        promiseFunction(10n)
          .then((data: bigint) => {
            arr.push(5);
            result = data;
            console.log("result:" + result);
          })
          .catch((error: bigint) => {
            arr.push(3);
            result = error;
            console.error('error:' + result);
          });
        arr.push(4);
        taskPromises.push(promiseFunction(10n));
        await Promise.allSettled(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,2,4,2,5]');
        expect(result).assertEqual(10n);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_TEST_1900
     * @tc.name PromiseTest1900
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseTest1900';
        console.info(`${caseName} test start`);

        interface SuccessResponse {
          msg: string;
        }

        let taskPromises: Promise<SuccessResponse>[] = [];
        let arr: number[] = [];
        let result: string = '';
        const promiseFunction = (param: SuccessResponse | string): Promise<SuccessResponse> => {
          return new Promise((resolve, reject) => {
            if (typeof param === 'string') {
              arr.push(2);
              resolve({
                msg: 'success'
              });
            } else {
              reject('failed');
            }
          });
        };
        arr.push(1);
        promiseFunction('success')
          .then((data: SuccessResponse) => {
            arr.push(5);
            result = data.msg;
            console.log("result:" + result);
          })
          .catch((error: SuccessResponse) => {
            arr.push(3);
            result = error.msg;
            console.error('error:' + result);
          });
        arr.push(4);
        taskPromises.push(promiseFunction({
          msg: 'success'
        }));
        await Promise.allSettled(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,2,4,5]');
        expect(result).assertEqual('success');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_TEST_2000
     * @tc.name PromiseTest2000
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'PromiseTest2000';
        console.info(`${caseName} test start`);
        let taskPromises: Promise<string>[] = [];
        let arr: number[] = [];
        let result: string = '';
        const promiseFunction = (param: null | string): Promise<string> => {
          return new Promise((resolve, reject) => {
            if (param === null) {
              arr.push(2);
              resolve('param is null');
            } else {
              reject(new Error('param is not null'));
            }
          });
        };
        arr.push(1);
        const handlePromise = async (promise: Promise<string>) => {
          try {
            const data = await promise;
            result = data;
            console.log("result:" + result);
          } catch (error) {
            arr.push(3);
            if (error instanceof Error) {
              result = error.message;
            }
            console.error('error:' + result);
          }
        };
        arr.push(4);
        const promiseInstance = promiseFunction(null);
        taskPromises.push(promiseInstance);
        handlePromise(promiseInstance);
        await Promise.allSettled(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,4,2]');
        expect(result).assertEqual('param is null');
        console.info(`${caseName} test end`);
        Done();
      });

  })
}