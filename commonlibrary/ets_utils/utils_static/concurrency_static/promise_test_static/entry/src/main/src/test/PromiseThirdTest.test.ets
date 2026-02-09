/*
* Copyright (C) 2025 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the 'License');
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an 'AS IS' BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Size, Level, TestType } from '../../../hypium/index';

import { sleep } from '../testability/pages/TestUtils';


export default function PromiseThirdTest() {
  describe('PromiseThirdTest', (): void => {
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
     * @tc.number SUB_PROMISE_THIRD_TEST_0100
     * @tc.name PromiseThirdTest0100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseThirdTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'PromiseThirdTest0100';
        console.info(`${caseName} test start`);
        let taskPromises: Promise<void>[] = [];
        let arr: number[] = [];
        let voidResult:Promise<void>[] = [];
        const promiseVoid: Promise<void> = new Promise<void>((resolve, reject) => {
          setTimeout(() => {
            arr.push(3);
            console.log('Promise Done');
            resolve(undefined);
          }, 200);
        });
        arr.push(1);
        promiseVoid.then((x?: string):void => {
          arr.push(2);
        }).catch((error: Error):void => {
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
     * @tc.number SUB_PROMISE_THIRD_TEST_0200
     * @tc.name PromiseThirdTest0200
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseThirdTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'PromiseThirdTest0200';
        console.info(`${caseName} test start`);
        let taskPromises: Promise<string>[] = [];
        let arr: number[] = [];
        let stringResult: string = '';
        const promiseString: Promise<string> = new Promise<string>((resolve, reject) => {
          setTimeout(() => {
            arr.push(3);
            console.log('Promise Done');
            resolve(stringResult);
          }, 200);
        });
        arr.push(1);
        promiseString.then((res:string):void => {
          arr.push(2);
          stringResult = res;
          console.log('resolve:' + res);
        }).catch((error: Error):void => {
          stringResult = 'failed'
          console.log('promise error:', error);
        });
        arr.push(4);
        taskPromises.push(promiseString);
        await Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,4,3,2]');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_THIRD_TEST_0300
     * @tc.name PromiseThirdTest0300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseThirdTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'PromiseThirdTest0300';
        console.info(`${caseName} test start`);
        let taskPromises: Promise<number>[] = [];
        let arr: number[] = [];
        let numberResult: number = 0;
        const promiseNumber: Promise<number> = new Promise<number>((resolve, reject) => {
          setTimeout(() => {
            arr.push(3);
            console.log('Promise Done');
            resolve(10);
          }, 200);
        });
        arr.push(1);
        promiseNumber.then((res:number):void => {
          arr.push(2);
          numberResult = res;
          console.log('resolve:' + res);
        }).catch((error: Error):void => {
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
     * @tc.number SUB_PROMISE_THIRD_TEST_0400
     * @tc.name PromiseThirdTest0400
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseThirdTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'PromiseThirdTest0400';
        console.info(`${caseName} test start`);
        let taskPromises: Promise<boolean>[] = [];
        let arr: number[] = [];
        let booleanResult: boolean = false;
        const promiseBoolean: Promise<boolean> = new Promise<boolean>((resolve, reject) => {
          setTimeout(() => {
            arr.push(3);
            console.log('Promise Done');
            resolve(true);
          }, 200);
        });
        arr.push(1);
        promiseBoolean.then((res:boolean):void => {
          arr.push(2);
          booleanResult = res;
          console.log('resolve:' + res);
        }).catch((error: Error):void => {
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
     * @tc.number SUB_PROMISE_THIRD_TEST_0500
     * @tc.name PromiseThirdTest0500
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseThirdTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'PromiseThirdTest0500';
        console.info(`${caseName} test start`);
        let taskPromises: Promise<bigint>[] = [];
        let arr: number[] = [];
        let bigintResult: bigint = 12n;
        const promiseBigint: Promise<bigint> = new Promise<bigint>((resolve, reject) => {
          setTimeout(() => {
            arr.push(3);
            console.log('Promise Done');
            resolve(1234n);
          }, 200);
        });
        arr.push(1);
        promiseBigint.then((res: bigint):void => {
          arr.push(2);
          bigintResult = res;
          console.log('resolve:' + res);
        }).catch((error: Error):void => {
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
     * @tc.number SUB_PROMISE_THIRD_TEST_0700
     * @tc.name PromiseThirdTest0700
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseThirdTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'PromiseThirdTest0700';
        console.info(`${caseName} test start`);
        let taskPromises: Promise<object>[] = [];
        let promiseOfPromiseResult: string | null = null;
        let promiseOfPromiseError: string | null = null;
        let arr: number[] = [];
        const innerPromise: Promise<string> = new Promise<string>((resolve, reject) => {
          setTimeout(() => {
            arr.push(2);
            resolve('Inner Promise success');
          }, 200);
        });
        arr.push(1)
        const promiseOfPromise: Promise<Promise<string>> = new Promise<Promise<string>>((resolve, reject) => {
          setTimeout(() => {
            arr.push(3);
            resolve(innerPromise);
          }, 200);
        });
        promiseOfPromise
          .then((inner:String|PromiseLike<String>):String|PromiseLike<String> => {
            arr.push(6);
            return inner;
          })
          .then((result:string):void => {
            arr.push(4);
            promiseOfPromiseResult = result;
            console.log('Promise of Promise success:', result);
          })
          .catch((error: Error):void=> {
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
     * @tc.number SUB_PROMISE_THIRD_TEST_0800
     * @tc.name PromiseThirdTest0800
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseThirdTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'PromiseThirdTest0800';
        console.info(`${caseName} test start`);
        let taskPromises: Promise<object>[] = [];
        let errorResult: Error | null = null;
        let errorError: Error | null = null;
        let arr: number[] = [];
        arr.push(1);
        const promiseError: Promise<Error> = new Promise<Error>((resolve, reject) => {
          setTimeout(() => {
            arr.push(2);
            resolve(new Error('Error Promise success'));
          }, 200);
        });
        arr.push(3);
        promiseError
          .then((result:Error):void => {
            arr.push(4);
            errorResult = result;
            console.log('Error Promise success:', result.message);
          })
          .catch((error: Error):void => {
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
     * @tc.number SUB_PROMISE_THIRD_TEST_0900
     * @tc.name PromiseThirdTest0900
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseThirdTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'PromiseThirdTest0900';
        console.info(`${caseName} test start`);
        let taskPromises: Promise<string>[] = [];
        let arr: number[] = [];
        let result: string = '';
        const PromiseThirdTest: Promise<string> = new Promise<string>((resolve, reject) => {
          setTimeout(() => {
            arr.push(3);
            console.log('Promise Done');
            resolve('success');
          }, 200);
        });
        arr.push(1);
        PromiseThirdTest.then((res:string):void => {
          arr.push(2);
          result = res;
          console.log('resolve:' + res);
        }).catch((error: Error):void => {
          console.log('promise error:', error);
        });
        arr.push(4);
        taskPromises.push(PromiseThirdTest);
        await Promise.all(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,4,3,2]');
        expect(result).assertEqual('success');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_THIRD_TEST_1000
     * @tc.name PromiseThirdTest1000
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseThirdTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'PromiseThirdTest1000';
        console.info(`${caseName} test start`);
        let taskPromises: Promise<string>[] = [];
        let arr: number[] = [];
        let result: string = '';
        const PromiseThirdTest: Promise<string> = new Promise<string>((resolve, reject) => {
          setTimeout(() => {
            arr.push(3);
            console.log('Promise Done');
            reject(new Error('failed'));
          }, 200);
        });
        arr.push(1);
        PromiseThirdTest.then((res:string):void => {
          result = res;
          console.log('resolve:' + res);
        }).catch((error: Error):void => {
          arr.push(2);
          result = error.message;
          console.log('promise error:', error.message);
        });
        arr.push(4);
        taskPromises.push(PromiseThirdTest);
        await Promise.allSettled(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,4,3,2]');
        expect(result).assertEqual('failed');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_THIRD_TEST_1100
     * @tc.name PromiseThirdTest1100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseThirdTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'PromiseThirdTest1100';
        console.info(`${caseName} test start`);
        let taskPromises: Promise<string>[] = [];
        let arr: number[] = [];
        let result: string = '';
        const PromiseThirdTest: Promise<string> = new Promise<string>((resolve, reject) => {
          setTimeout(() => {
            arr.push(3);
            console.log('Promise Done');
            try {
              throw new Error('throw new Error');
            } catch (error) {
              error = error as Error;
              reject(error);
            }
          }, 200);
        });
        arr.push(1);
        PromiseThirdTest.then((res:string):void => {
          result = res;
          console.log('resolve:' + res);
        }).catch((error: Error):void => {
          arr.push(2);
          result = error.message;
          console.log('promise error:', error.message);
        });
        arr.push(4);
        taskPromises.push(PromiseThirdTest);
        await Promise.allSettled(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,4,3,2]');
        expect(result).assertEqual('throw new Error');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_THIRD_TEST_1200
     * @tc.name PromiseThirdTest1200
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseThirdTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'PromiseThirdTest1200'
        console.info(`${caseName} test start`)
        let taskPromises: Promise<string>[] = [];
        let arr: number[] = [];
        let result: string = '';
        const PromiseThirdTest: Promise<string> = new Promise<string>((resolve, reject) => {
          setTimeout(() => {
            arr.push(3);
            console.log('Promise Done');
            reject(new Error('failed'));
          }, 200);
        });
        arr.push(1);
        PromiseThirdTest.then((res:string):void => {
          result = res;
          console.log('resolve:' + res);
        }).catch((error: Error):void => {
          arr.push(2);
          result = error.message;
          console.log('promise error:', error.message);
        });
        arr.push(4);
        taskPromises.push(PromiseThirdTest);
        await Promise.allSettled(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,4,3,2]');
        expect(result).assertEqual('failed');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_THIRD_TEST_1300
     * @tc.name PromiseThirdTest1300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseThirdTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'PromiseThirdTest1300';
        console.info(`${caseName} test start`);
        let taskPromises: Promise<string>[] = [];
        let arr: number[] = [];
        let result: string = '';
        const promiseFunction = (param: null | string): Promise<string> => {
          return new Promise<string>((resolve, reject) => {
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
          .then((data: string):void => {
            result = data;
            console.log('result:' + result);
          })
          .catch((error: Error):void => {
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
     * @tc.number SUB_PROMISE_THIRD_TEST_1400
     * @tc.name PromiseThirdTest1400
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseThirdTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'PromiseThirdTest1400';
        console.info(`${caseName} test start`);
        let taskPromises: Promise<string>[] = [];
        let arr: number[] = [];
        let result: string = '';
        const promiseFunction = (param: undefined | string): Promise<string> => {
          return new Promise<string>((resolve, reject) => {
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
            console.log('result:' + result);
          })
          .catch((error: Error):void => {
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
     * @tc.number SUB_PROMISE_THIRD_TEST_1500
     * @tc.name PromiseThirdTest1500
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseThirdTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'PromiseThirdTest1500';
        console.info(`${caseName} test start`);
        let taskPromises: Promise<string>[] = [];
        let arr: number[] = [];
        let result: string = '';
        const promiseFunction = (param: undefined | string): Promise<string> => {
          return new Promise<string>((resolve, reject) => {
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
            console.log('result:' + result);
          })
          .catch((error: Error):void => {
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
     * @tc.number SUB_PROMISE_THIRD_TEST_1600
     * @tc.name PromiseThirdTest1600
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseThirdTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'PromiseThirdTest1600';
        console.info(`${caseName} test start`);
        let taskPromises: Promise<number>[] = [];
        let arr: number[] = [];
        let result: number = 0;
        const promiseFunction = (param: undefined | number): Promise<number> => {
          return new Promise<Double>((resolve, reject) => {
            if (typeof param === 'number') {
              arr.push(2);
              resolve(result);
            } else {
              reject(new Error('5'));
            }
          });
        };
        arr.push(1);
        promiseFunction(10)
          .then((data: number):void => {
            arr.push(5);
            result = data;
            console.log('result:' + result);
          })
          .catch((error: Error):void => {
            arr.push(3);
            console.error('error:' + error);
          });
        arr.push(4);
        taskPromises.push(promiseFunction(10));
        await Promise.allSettled(taskPromises);
        await sleep(200);
        expect(JSON.stringify(arr)).assertEqual('[1,2,4,2,5]');
        expect(result).assertEqual(0);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.number SUB_PROMISE_THIRD_TEST_1700
     * @tc.name PromiseThirdTest1700
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseThirdTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'PromiseThirdTest1700';
        console.info(`${caseName} test start`);
        let taskPromises: Promise<boolean>[] = [];
        let arr: number[] = [];
        let result: boolean = false;
        const promiseFunction = (param: boolean): Promise<boolean> => {
          return new Promise<boolean>((resolve, reject) => {
            if (typeof param === 'boolean') {
              arr.push(2);
              resolve(true);
            } else {
              reject(new Error('1'));
            }
          });
        };
        arr.push(1);
        promiseFunction(true)
          .then((data: boolean) :void=> {
            arr.push(5);
            result = data;
            console.log('result:' + result);
          })
          .catch((error: Error) :void=> {
            arr.push(3);
            console.error('error:' + error);
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
     * @tc.number SUB_PROMISE_THIRD_TEST_1800
     * @tc.name PromiseThirdTest1800
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseThirdTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'PromiseThirdTest1800';
        console.info(`${caseName} test start`);
        let taskPromises: Promise<bigint>[] = [];
        let arr: number[] = [];
        let result: bigint = 0n;
        const promiseFunction = (param: bigint | number): Promise<bigint> => {
          return new Promise<bigint>((resolve, reject) => {
            if (typeof param === 'bigint') {
              arr.push(2);
              resolve(10n);
            } else {
              reject(new Error('5'));
            }
          });
        };
        arr.push(1);
        promiseFunction(10n)
          .then((data: bigint):void => {
            arr.push(5);
            result = data;
            console.log('result:' + result);
          })
          .catch((error: Error):void => {
            arr.push(3);
            console.error('error:' + error);
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
     * @tc.number SUB_PROMISE_THIRD_TEST_2000
     * @tc.name PromiseThirdTest2000
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PromiseThirdTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'PromiseThirdTest2000';
        console.info(`${caseName} test start`);
        let taskPromises: Promise<string>[] = [];
        let arr: number[] = [];
        let result: string = '';
        const promiseFunction = (param: null | string): Promise<string> => {
          return new Promise<string>((resolve, reject) => {
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
            console.log('result:' + result);
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