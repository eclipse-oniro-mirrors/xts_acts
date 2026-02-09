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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Size, Level, TestType } from '@ohos/hypium';
import { sleep } from '../testability/pages/TestUtils';


export default function PromiseAnyPortTest() {
  describe('PromiseAnyPortTest', () => {
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
     * @tc.name   TaskpoolPromiseAnyTest0100
     * @tc.number SUB_TASKPOOL_PROMISE_ANY_TEST_0100
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolPromiseAnyTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolPromiseAnyTest0100';
        console.info(`${caseName} test start`);
        let stringArray: string[] = [];
        stringArray.push('string 1');
        stringArray.push('string 2');
        stringArray.push('string 3');
        const stringPromises = stringArray.map(value => Promise.resolve(value));
        const stringResult = await Promise.any(stringPromises);
        console.log('String result:', stringResult);
        console.log(`${stringPromises}`);
        expect('string 1').assertEqual(stringResult);
        console.info(`${caseName} test end`);
        Done();
      });



    /**
     * @tc.name   TaskpoolPromiseAnyTest0200
     * @tc.number SUB_TASKPOOL_PROMISE_ANY_TEST_0200
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolPromiseAnyTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolPromiseAnyTest0200';
        console.info(`${caseName} test start`);
        let numberArray: number[] = [];
        numberArray.push(1);
        numberArray.push(2);
        numberArray.push(3);
        const numberPromises = numberArray.map(value => Promise.resolve(value));
        const numberResult = await Promise.any(numberPromises);
        console.log('result:', numberResult);
        console.log(`${numberPromises}`);
        expect(1).assertEqual(numberResult);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   TaskpoolPromiseAnyTest0300
     * @tc.number SUB_TASKPOOL_PROMISE_ANY_TEST_0300
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolPromiseAnyTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolPromiseAnyTest0300';
        console.info(`${caseName} test start`);
        let booleanArray: boolean[] = [];
        booleanArray.push(true);
        booleanArray.push(false);
        booleanArray.push(true);
        const booleanPromises = booleanArray.map(value => Promise.resolve(value));
        const booleanResult = await Promise.any(booleanPromises);
        console.log('result:', booleanResult);
        console.log(`${booleanPromises}`);
        expect(true).assertEqual(booleanResult);
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   TaskpoolPromiseAnyTest0400
     * @tc.number SUB_TASKPOOL_PROMISE_ANY_TEST_0400
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolPromiseAnyTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolPromiseAnyTest0400';
        console.info(`${caseName} test start`);
        let bigIntArray: bigint[] = [];
        bigIntArray.push(BigInt(1));
        bigIntArray.push(BigInt(2));
        bigIntArray.push(BigInt(3));
        const bigIntPromises = bigIntArray.map(value => Promise.resolve(value));
        const bigIntResult = await Promise.any(bigIntPromises);
        console.log('result:', bigIntResult);
        console.log(`${bigIntPromises}`);
        expect(1n).assertEqual(bigIntResult);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   TaskpoolPromiseAnyTest0500
     * @tc.number SUB_TASKPOOL_PROMISE_ANY_TEST_0500
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolPromiseAnyTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolPromiseAnyTest0500';
        console.info(`${caseName} test start`);
        interface Obj{
          key:string
        }
        let objectArray: Obj[] = [];
        objectArray.push({ key: 'value1' });
        objectArray.push({ key: 'value2' });
        objectArray.push({ key: 'value3' });
        const objectPromises = objectArray.map(value => Promise.resolve(value));
        const objectResult = await Promise.any(objectPromises);
        console.log('result:', objectResult);
        console.log(`${objectPromises}`);
        expect(JSON.stringify('value1')).assertEqual(JSON.stringify(objectResult.key))
        console.info(`${caseName} test end`);
        Done();
      });



    /**
     * @tc.name   TaskpoolPromiseAnyTest0600
     * @tc.number SUB_TASKPOOL_PROMISE_ANY_TEST_0600
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolPromiseAnyTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolPromiseAnyTest0600';
        console.info(`${caseName} test start`);
        let promiseArray: Promise<string>[] = [];
        const promise1 = new Promise<string>((resolve) => {
          setTimeout(() => {
            resolve('Promise 1');
          });
        });
        const promise2 = new Promise<string>((reject) => {
          setTimeout(() => {
            reject('Promise 2');
          });
        });
        const promise3 = new Promise<string>((resolve) => {
          setTimeout(() => {
            resolve('Promise 3');
          });
        });
        promiseArray.push(promise1);
        promiseArray.push(promise2);
        promiseArray.push(promise3);
        const promiseResult = await Promise.any(promiseArray);
        console.log('result:', promiseResult);
        console.log(`${promiseArray}`);
        expect('Promise 1').assertEqual(promiseResult)
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   TaskpoolPromiseAnyTest0700
     * @tc.number SUB_TASKPOOL_PROMISE_ANY_TEST_0700
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolPromiseAnyTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolPromiseAnyTest0700';
        console.info(`${caseName} test start`);
        interface Obj{
          message:string
        }
        const stringValue = 'Hello, World!';
        const numberValue = 42;
        const booleanValue = false;
        const bigIntValue = BigInt(123456789);
        const objectValue:Obj = { message: 'This is an object' };
        const promiseValue = new Promise<string>((resolve) => {
          setTimeout(() => {
            resolve('Promise resolved');
          }, 100);
        });
        const promiseArray = [
          Promise.resolve(stringValue),
          Promise.resolve(numberValue),
          Promise.resolve(booleanValue),
          Promise.resolve(bigIntValue),
          Promise.resolve(objectValue),
          promiseValue
        ];
        const result = await Promise.any(promiseArray);
        console.log('The first successful Promise result:', result);
        expect('Hello, World!').assertEqual(result);
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   TaskpoolPromiseAnyTest0800
     * @tc.number SUB_TASKPOOL_PROMISE_ANY_TEST_0800
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolPromiseAnyTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolPromiseAnyTest0800';
        console.info(`${caseName} test start`);
        interface Obj1 {
          value: Promise<string>;
          done: boolean;
        }

        interface Obj2 {
          value: undefined;
          done: boolean;
        }
        class PromiseGenerator {
          private index = 0;
          private promises: Promise<string>[] = [
            new Promise<string>((resolve) => {
              setTimeout(() => {
                resolve('Promise 1');
              });
            }),
            new Promise<string>((resolve) => {
              setTimeout(() => {
                resolve('Promise 2');
              });
            }),
            new Promise<string>((resolve) => {
              setTimeout(() => {
                resolve('Promise 3');
              });
            })
          ];
          next() {
            if (this.index < this.promises.length) {
              return ({
                value: this.promises[this.index++], done: false
              } as Obj1);
            }
            return ({
              value: undefined, done: true
            } as Obj2);
          }
          [Symbol.iterator]() {
            return this;
          }
        }
        const generator = new PromiseGenerator();
        const result = await Promise.any(generator);
        console.log('Promise result:', result);
        expect('Promise 1').assertEqual(result);
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   TaskpoolPromiseAnyTest0900
     * @tc.number SUB_TASKPOOL_PROMISE_ANY_TEST_0900
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolPromiseAnyTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolPromiseAnyTest0900';
        console.info(`${caseName} test start`);
        let arr = []
        try {
          await Promise.any(arr);
        } catch (error) {
          if (error instanceof AggregateError) {
            console.log('Caught AggregateError:', error);
            console.log('Error message:', error.message);
            console.log('All rejection reasons:', error.errors);
            expect(error instanceof AggregateError).assertEqual(true);
          } else {
            console.log('Caught a non-AggregateError type error:', error);
          }
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   TaskpoolPromiseAnyTest1000
     * @tc.number SUB_TASKPOOL_PROMISE_ANY_TEST_1000
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolPromiseAnyTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolPromiseAnyTest1000';
        console.info(`${caseName} test start`);
        const arr = ['hello', 123, true];
        try {
          await Promise.any(arr);
        } catch (error) {
          if (error instanceof TypeError) {
            console.log('Caught TypeError as expected:', error.message);
            expect(error instanceof TypeError).assertEqual(true);
          } else {
            console.log('Caught an unexpected error:', error);
          }
        }
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   TaskpoolPromiseAnyTest1100
     * @tc.number SUB_TASKPOOL_PROMISE_ANY_TEST_1100
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolPromiseAnyTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolPromiseAnyTest1100';
        console.info(`${caseName} test start`);
        interface Obj2 {
          value: undefined;
          done: boolean;
        }
        class ExceptionGenerator {
          private index = 0;
          next() {
            if (this.index === 0) {
              this.index++;
              throw new Error('This is a generated exception');
            }
            return { value: undefined, done: true } as Obj2;
          }

          [Symbol.iterator]() {
            return this;
          }
        }
        const generator = new ExceptionGenerator();
        try {
          await Promise.any(generator);
        } catch (error) {
          console.log('Caught the expected rejection:', error.message);
          expect('This is a generated exception').assertEqual(error.message);
        }
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   TaskpoolPromiseAnyTest1200
     * @tc.number SUB_TASKPOOL_PROMISE_ANY_TEST_1200
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolPromiseAnyTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolPromiseAnyTest1200';
        console.info(`${caseName} test start`);
        let arr:number[] =[]
        const promise1 = new Promise<string>((resolve) => {
          setTimeout(() => {
            arr.push(1);
            resolve('First promise succeeded');
          });
        });

        const promise2 = new Promise<string>((_, reject) => {
          setTimeout(() => {
            arr.push(2);
            reject(new Error('Second promise failed'));
          });
        });

        const promise3 = new Promise<string>((resolve) => {
          setTimeout(() => {
            arr.push(3);
            resolve('Third promise succeeded');
          });
        });
        arr.push(4);
        const result = await Promise.any([promise1, promise2, promise3]);
        console.log('The result of the first successful promise:', result);
        expect('First promise succeeded').assertEqual(result);
        expect(JSON.stringify(arr)).assertEqual('[4,1]');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   TaskpoolPromiseAnyTest1300
     * @tc.number SUB_TASKPOOL_PROMISE_ANY_TEST_1300
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolPromiseAnyTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolPromiseAnyTest1300';
        console.info(`${caseName} test start`);
        let arr:number[] = [];
        const promise1 = new Promise<string>((_, reject) => {
          setTimeout(() => {
            arr.push(1);
            reject(new Error('First promise failed'));
          });
        });

        const promise2 = new Promise<string>((_, reject) => {
          setTimeout(() => {
            arr.push(2);
            reject(new Error('Second promise failed'));
          });
        });

        const promise3 = new Promise<string>((_, reject) => {
          setTimeout(() => {
            arr.push(3);
            reject(new Error('Third promise failed'));
          });
        });

        try {
          arr.push(4);
          await Promise.any([promise1, promise2, promise3]);
        } catch (error) {
          if (error instanceof AggregateError) {
            arr.push(5);
            console.log('All promises failed, AggregateError caught:', error);
            console.log('Error message:', error.message);
            console.log('All rejection reasons:', error.errors);
            expect(error instanceof AggregateError).assertEqual(true);
          } else {
            console.log('Caught a non-AggregateError type error:', error);
          }
        }
        expect(JSON.stringify(arr)).assertEqual('[4,1,2,3,5]');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   TaskpoolPromiseAnyTest1400
     * @tc.number SUB_TASKPOOL_PROMISE_ANY_TEST_1400
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolPromiseAnyTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolPromiseAnyTest1400';
        console.info(`${caseName} test start`);
        let arr :number[]=[];
        const promiseWithError = new Promise<string>((_, reject) => {
          arr.push(1);
          throw new Error('Error thrown during promise construction');
        });

        const normalPromise = new Promise<string>((resolve) => {
          setTimeout(() => {
            arr.push(2);
            resolve('Normal promise resolved');
          });
        });

        try {
          arr.push(3);
          const result = await Promise.any([promiseWithError, normalPromise]);
          console.log(result)
          expect('Normal promise resolved').assertEqual(result);
        } catch (error) {
          arr.push(4);
          console.log('A failed promise value is returned with the thrown error:', error);
        }
        expect(JSON.stringify(arr)).assertEqual('[1,3,2]');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   TaskpoolPromiseAnyTest1500
     * @tc.number SUB_TASKPOOL_PROMISE_ANY_TEST_1500
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolPromiseAnyTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolPromiseAnyTest1500';
        console.info(`${caseName} test start`);
        let arr:number[] = [];
        const promise1 = new Promise<string>((resolve) => {
          setTimeout(() => {
            arr.push(1);
            resolve('Promise 1 succeeded');
          });
        });

        const promise2 = new Promise<string>((resolve) => {
          setTimeout(() => {
            arr.push(2);
            resolve('Promise 2 succeeded');
          });
        });

        const promise3 = new Promise<string>((resolve) => {
          setTimeout(() => {
            arr.push(3);
            resolve('Promise 3 succeeded');
          });
        });
        arr.push(4);
        const result = await Promise.any([promise1, promise2, promise3]);
        console.log('The value of the first successful Promise:', result);
        expect('Promise 1 succeeded').assertEqual(result);
        expect(JSON.stringify(arr)).assertEqual('[4,1]');
        console.info(`${caseName} test end`);
        Done();
      });

    /**
     * @tc.name   TaskpoolPromiseAnyTest1600
     * @tc.number SUB_TASKPOOL_PROMISE_ANY_TEST_1600
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolPromiseAnyTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolPromiseAnyTest1600';
        console.info(`${caseName} test start`);
        let arr:number[] = [];
        const promise1 = new Promise<string>((resolve) => {
          setTimeout(() => {
            arr.push(1);
            resolve('First promise succeeded after 2 seconds');
          }, 200);
        });

        const promise2 = new Promise<string>((_, reject) => {
          setTimeout(() => {
            arr.push(2);
            reject(new Error('Second promise failed after 1 second'));
          }, 100);
        });

        try {
          arr.push(3);
          const result = await Promise.any([promise1, promise2]);
          console.log('The value of the first successful Promise:', result);
          expect('First promise succeeded after 2 seconds').assertEqual(result)
        } catch (error) {
          if (error instanceof AggregateError) {
            arr.push(4);
            console.log('All promises were rejected:', error.errors);
            expect(error instanceof AggregateError).assertEqual(true)
          } else {
            arr.push(5);
            console.log('An unexpected error occurred:', error);
          }
        }
        expect(JSON.stringify(arr)).assertEqual('[3,2,1]');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   TaskpoolPromiseAnyTest1700
     * @tc.number SUB_TASKPOOL_PROMISE_ANY_TEST_1700
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolPromiseAnyTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolPromiseAnyTest1700';
        console.info(`${caseName} test start`);
        let arr:number[] =[];
        const promise1 = new Promise<string>((resolve) => {
          setTimeout(() => {
            arr.push(1);
            resolve('First promise succeeded after 1 second');
          }, 100);
        });

        const promise2 = new Promise<string>((_, reject) => {
          setTimeout(() => {
            arr.push(2);
            reject(new Error('Second promise failed after 2 seconds'));
          }, 200);
        });
        arr.push(3);
        const result = await Promise.any([promise1, promise2]);
        console.log('The value of the first successful Promise:', result);
        expect('First promise succeeded after 1 second').assertEqual(result);
        expect(JSON.stringify(arr)).assertEqual('[3,1]');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   TaskpoolPromiseAnyTest1800
     * @tc.number SUB_TASKPOOL_PROMISE_ANY_TEST_1800
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolPromiseAnyTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolPromiseAnyTest1800';
        console.info(`${caseName} test start`);
        let arr:number[] = [];
        const innerSuccessPromise = new Promise<string>((resolve) => {
          setTimeout(() => {
            arr.push(1);
            resolve('Inner success promise value');
          }, 100);
        });

        const innerFailurePromise = new Promise<string>((_, reject) => {
          setTimeout(() => {
            arr.push(2);
            reject(new Error('Inner failure promise'));
          }, 200);
        });

        const outerFailurePromise = new Promise<string>((_, reject) => {
          setTimeout(() => {
            arr.push(4);
            reject(new Error('Outer failure promise'));
          }, 300);
        });
        arr.push(3);
        const result = await Promise.any([
          Promise.any([innerSuccessPromise, innerFailurePromise]),
          outerFailurePromise
        ]);
        console.log('The value of the first successful Promise:', result);
        expect('Inner success promise value').assertEqual(result);
        expect(JSON.stringify(arr)).assertEqual('[3,1]');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   TaskpoolPromiseAnyTest1900
     * @tc.number SUB_TASKPOOL_PROMISE_ANY_TEST_1900
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolPromiseAnyTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolPromiseAnyTest1900';
        console.info(`${caseName} test start`);
        let arr:number[] = [];
        const innerFailurePromise1 = new Promise<string>((_, reject) => {
          setTimeout(() => {
            arr.push(1);
            reject(new Error('Inner first failure promise'));
          });
        });

        const innerFailurePromise2 = new Promise<string>((_, reject) => {
          setTimeout(() => {
            arr.push(2);
            reject(new Error('Inner second failure promise'));
          });
        });

        const outerFailurePromise = new Promise<string>((_, reject) => {
          setTimeout(() => {
            arr.push(3);
            reject(new Error('Outer failure promise'));
          });
        });

        try {
          arr.push(4);
          await Promise.any([
            Promise.any([innerFailurePromise1, innerFailurePromise2]),
            outerFailurePromise
          ]);
        } catch (error) {
          arr.push(5);
          console.log('All promises were rejected. AggregateError caught:', error);
          console.log('Error message:', error.message);
          console.log('All rejection reasons:', error.errors);
          expect(error instanceof AggregateError).assertEqual(true)
        }
        expect(JSON.stringify(arr)).assertEqual('[4,1,2,3,5]');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   TaskpoolPromiseAnyTest2000
     * @tc.number SUB_TASKPOOL_PROMISE_ANY_TEST_2000
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolPromiseAnyTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolPromiseAnyTest2000';
        console.info(`${caseName} test start`);
        let arr:number[] =[];
        const innerSuccessPromise = new Promise<string>((resolve) => {
          setTimeout(() => {
            arr.push(1);
            resolve('Inner success promise value');
          });
        });

        const innerFailurePromise = new Promise<string>((_, reject) => {
          setTimeout(() => {
            arr.push(2);
            reject(new Error('Inner failure promise'));
          });
        });

        const outerSuccessPromise = new Promise<string>((resolve) => {
          setTimeout(() => {
            arr.push(3);
            resolve('Outer success promise value');
          });
        });
        arr.push(4);
        const result = await Promise.any([
          Promise.all([innerSuccessPromise, innerFailurePromise]),
          outerSuccessPromise
        ]);
        console.log('The value of the first successful Promise:', result);
        expect('Outer success promise value').assertEqual(result);
        expect(JSON.stringify(arr)).assertEqual('[4,1,2,3]');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   TaskpoolPromiseAnyTest2100
     * @tc.number SUB_TASKPOOL_PROMISE_ANY_TEST_2100
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolPromiseAnyTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolPromiseAnyTest2100';
        console.info(`${caseName} test start`);
        let arr:number[] = [];
        const innerSuccessPromise = new Promise<string>((resolve) => {
          setTimeout(() => {
            arr.push(1);
            resolve('Inner success value');
          });
        });

        const innerFailurePromise = new Promise<string>((_, reject) => {
          setTimeout(() => {
            arr.push(2);
            reject(new Error('Inner failure error'));
          });
        });

        const outerFailurePromise = new Promise<string>((_, reject) => {
          setTimeout(() => {
            arr.push(3);
            reject(new Error('Outer failure error'));
          });
        });
        try {
          arr.push(4);
          await Promise.any([
            Promise.all([innerSuccessPromise, innerFailurePromise]),
            outerFailurePromise
          ]);
        } catch (error) {
          arr.push(5);
          console.log('All promises were rejected. AggregateError caught:', error);
          console.log('Error message:', error.message);
          console.log('All rejection reasons:', error.errors);
          expect(error instanceof AggregateError).assertEqual(true)
        }
        expect(JSON.stringify(arr)).assertEqual('[4,1,2,3,5]');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   TaskpoolPromiseAnyTest2200
     * @tc.number SUB_TASKPOOL_PROMISE_ANY_TEST_2200
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolPromiseAnyTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolPromiseAnyTest2200';
        console.info(`${caseName} test start`);
        let arr:number[] =[];
        const innerSuccessPromise = new Promise<string>((resolve) => {
          setTimeout(() => {
            arr.push(1);
            resolve('Inner success value');
          },100);
        });

        const innerFailurePromise = new Promise<string>((_, reject) => {
          setTimeout(() => {
            arr.push(2);
            reject(new Error('Inner failure error'));
          },200);
        });

        const outerSuccessPromise = new Promise<string>((resolve) => {
          setTimeout(() => {
            arr.push(3);
            resolve('Outer success value');
          },300);
        });
        arr.push(4);
        const result = await Promise.any([
          Promise.race([innerSuccessPromise, innerFailurePromise]),
          outerSuccessPromise
        ]);
        console.log('The value of the first successful Promise:', result);
        expect('Inner success value').assertEqual(result);
        expect(JSON.stringify(arr)).assertEqual('[4,1]');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   TaskpoolPromiseAnyTest2300
     * @tc.number SUB_TASKPOOL_PROMISE_ANY_TEST_2300
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolPromiseAnyTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolPromiseAnyTest2300';
        console.info(`${caseName} test start`);
        let arr:number[] =[];
        const innerSuccessPromise = new Promise<string>((resolve) => {
          setTimeout(() => {
            arr.push(1);
            resolve('Inner success value');
          },100);
        });

        const innerFailurePromise = new Promise<string>((_, reject) => {
          setTimeout(() => {
            arr.push(2);
            reject(new Error('Inner failure error'));
          });
        });

        const outerFailurePromise = new Promise<string>((_, reject) => {
          setTimeout(() => {
            arr.push(3);
            reject(new Error('Outer failure error'));
          });
        });

        try {
          arr.push(4);
          await Promise.any([
            Promise.race([innerSuccessPromise, innerFailurePromise]),
            outerFailurePromise
          ]);
        } catch (error) {
          arr.push(5);
          console.log('All promises were rejected. AggregateError caught:', error);
          console.log('Error message:', error.message);
          console.log('All rejection reasons:', error.errors);
          expect(error instanceof AggregateError).assertEqual(true)
        }
        expect(JSON.stringify(arr)).assertEqual('[4,2,3,5]');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   TaskpoolPromiseAnyTest2400
     * @tc.number SUB_TASKPOOL_PROMISE_ANY_TEST_2400
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolPromiseAnyTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolPromiseAnyTest2400';
        console.info(`${caseName} test start`);
        let arr:number[]=[];
        const innerSuccessPromise = new Promise<string>((resolve) => {
          setTimeout(() => {
            arr.push(1);
            resolve('Inner success value');
          }, 100);
        });

        const innerFailurePromise = new Promise<string>((_, reject) => {
          setTimeout(() => {
            arr.push(2);
            reject(new Error('Inner failure error'));
          });
        });

        const outerSuccessPromise = new Promise<string>((resolve) => {
          setTimeout(() => {
            arr.push(3);
            resolve('Outer success value');
          });
        });
        arr.push(4);
        const result = await Promise.any([
          Promise.allSettled([innerSuccessPromise, innerFailurePromise]),
          outerSuccessPromise
        ]);
        console.log('The value of the first successful Promise:', result);
        expect('Outer success value').assertEqual(result);
        expect(JSON.stringify(arr)).assertEqual('[4,2,3]');
        console.info(`${caseName} test end`);
        Done();
      });


    /**
     * @tc.name   TaskpoolPromiseAnyTest2500
     * @tc.number SUB_TASKPOOL_PROMISE_ANY_TEST_2500
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolPromiseAnyTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'TaskpoolPromiseAnyTest2500';
        console.info(`${caseName} test start`);
        let arr:number[] = [];
        const innerSuccessPromise = new Promise<string>((resolve) => {
          setTimeout(() => {
            arr.push(1);
            resolve('Inner success value');
          }, 100);
        });

        const innerFailurePromise = new Promise<string>((_, reject) => {
          setTimeout(() => {
            arr.push(2);
            reject(new Error('Inner failure error'));
          }, 150);
        });

        const outerFailurePromise = new Promise<string>((_, reject) => {
          setTimeout(() => {
            arr.push(3);
            reject(new Error('Outer failure error'));
          });
        });
        arr.push(4);
        const result = await Promise.any([
            Promise.allSettled([innerSuccessPromise, innerFailurePromise]),
            outerFailurePromise
          ]);
        console.log('The value of the first successful Promise:', result);
        expect(2).assertEqual(result.length);
        expect(JSON.stringify(arr)).assertEqual('[4,3,1,2]');
        console.info(`${caseName} test end`);
        Done();
      });

  })
}