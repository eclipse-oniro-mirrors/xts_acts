/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../hypium/index';
import hilog from '@ohos.hilog';

interface User {
  username: string;
}

type funcType = () => number

class Person {
  name: string;

  constructor(name: string) {
    this.name = name;
  }
}

export default function PromiseTest() {
  describe('PromiseTest', (): void => {
    /**
     * @tc.number SUB_PROMISE_TEST_0100
     * @tc.name PromiseTest001
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'PromiseTest001';
        console.info(`${TAG} test start`);
        try {
          const promise1 = new Promise<Any>((resolve) => {
            setTimeout(() => resolve(null), 100);
          });
          const result = await promise1 as null;
          expect(result).assertEqual(null);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_PROMISE_TEST_0200
     * @tc.name PromiseTest002
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'PromiseTest002';
        console.info(`${TAG} test start`);
        let result: number | undefined;
        try {
          const promise1 = new Promise<Number>((resolve) => {
            setTimeout(() => resolve(10), 100);
          });
          result = await promise1;
          expect(result).assertEqual(10);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_PROMISE_TEST_0300
     * @tc.name PromiseTest003
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'PromiseTest003';
        console.info(`${TAG} test start`);
        try {
          const promise1 = new Promise<byte>((resolve) => {
            setTimeout(() => resolve(1 as byte), 100);
          });
          const result = await promise1;
          expect(result).assertEqual(1);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });


    /**
     * @tc.number SUB_PROMISE_TEST_0400
     * @tc.name PromiseTest004
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'PromiseTest004';
        console.info(`${TAG} test start`);
        try {
          const promise1 = new Promise<short>((resolve) => {
            setTimeout(() => resolve(1 as short), 100);
          });
          const result = await promise1;
          expect(result).assertEqual(1);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_PROMISE_TEST_0500
     * @tc.name PromiseTest005
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'PromiseTest005';
        console.info(`${TAG} test start`);
        try {
          const promise1 = new Promise<long>((resolve) => {
            setTimeout(() => resolve(10), 100);
          });
          const result = await promise1;
          expect(result).assertEqual(10);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_PROMISE_TEST_0600
     * @tc.name PromiseTest006
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'PromiseTest006';
        console.info(`${TAG} test start`);
        try {
          const promise1 = new Promise<[number, string]>((resolve) => {
            setTimeout(() => resolve([10, 'aaa']), 100);
          });
          const result = await promise1;
          expect(result[0]).assertEqual(10);
          expect(result[1]).assertEqual('aaa');
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_PROMISE_TEST_0700
     * @tc.name PromiseTest007
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'PromiseTest007';
        console.info(`${TAG} test start`);
        try {
          const promiseTest: Promise<number> = new Promise<number>((resolve) => {
            setTimeout(() => resolve(10), 100);
          });
          const promise1 = new Promise<Promise<number>>((resolve) => {
            setTimeout(() => resolve(promiseTest), 100);
          });
          const result = await promise1;
          expect(result).assertEqual(10);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });


    /**
     * @tc.number SUB_PROMISE_TEST_0800
     * @tc.name PromiseTest008
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'PromiseTest008';
        console.info(`${TAG} test start`);
        try {
          const func: () => number = () => {
            return 20
          };
          const promise1 = new Promise<() => number>((resolve) => {
            setTimeout(() => resolve(func), 100);
          });
          const result = await promise1;
          expect(result()).assertEqual(20);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_Promise_TEST_0900
     * @tc.name PromiseTest009
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'PromiseTest009';
        console.info(`${TAG} test start`);
        let result: number | undefined;
        try {
          const promise1 = new Promise<number>(() => {
            throw new Error("Intentional error for testing");
          });
          result = await promise1;
          expect(false).assertFail();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(err.message).assertEqual("Intentional error for testing");
        }
        console.info(`${TAG} test end`);
        done();
      });
    /**
     * @tc.number SUB_Promise_TEST_1000
     * @tc.name PromiseTest010
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'PromiseTest010';
        console.info(`${TAG} test start`);
        let result: string | undefined;
        try {
          const promise1 = new Promise<string>((resolve) => {
            resolve("Promise resolved immediately");
          });
          result = await promise1;
          expect(result).assertEqual("Promise resolved immediately");
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });
    /**
     * @tc.number SUB_Promise_TEST_1100
     * @tc.name PromiseTest011
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'PromiseTest011';
        console.info(`${TAG} test start`);
        let result: string | undefined;
        try {
          const promise1 = new Promise<string>((resolve) => {
            setTimeout(() => {
              resolve("Promise resolved successfully after delay");
            }, 100);
          });
          result = await promise1;
          expect(result).assertEqual("Promise resolved successfully after delay");
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_Promise_TEST_1200
     * @tc.name PromiseTest012
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'PromiseTest012';
        console.info(`${TAG} test start`);
        let result: Number = 20;
        try {
          const promise1 = new Promise<number>((resolve) => {
            const task = new taskpool.Task(() => {
              setTimeout(() => {
                resolve(10);
              }, 100);
            });
            await taskpool.execute(task)
          });
          result = await promise1;
          expect(result).assertEqual(10);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_Promise_TEST_1300
     * @tc.name PromiseTest013
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'PromiseTest013';
        console.info(`${TAG} test start`);
        try {
          const testValue = 42;
          const promise1 = new Promise<number>((resolve, reject) => {
            const worker = new EAWorker();
            worker.start()
            const job = worker.run<number>(() => {
              const processedValue = testValue * 2;
              reject(new Error("Worker intentionally rejected the promise"));
              return processedValue;
            });
            try {
              const result = job.Await();
              resolve(result);
            } catch (err) {
              err = err as Error;
              console.error(`${TAG} catch error: code =>  message => ${err.message}`);
              reject(new Error("Worker intentionally rejected the promise"));
            } finally {
              worker.join();
            }
          });
          try {
            const result = await promise1;
            console.log(`${TAG}: Success with result: ${result}`);
          } catch (err) {
            err = err as Error;
            console.log(`${TAG}: Expected rejection: ${err.message}`);
          }
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`);
          done();
        }
      });


    /**
     * @tc.number SUB_Promise_TEST_1400
     * @tc.name PromiseTest014
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'PromiseTest014';
        console.info(`${TAG} test start`);
        try {
          const promise1 = Promise.resolve<Any>(null);
          const result = await promise1 as null;
          expect(result).assertEqual(null);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });
    /**
     * @tc.number SUB_Promise_TEST_1500
     * @tc.name PromiseTest015
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'PromiseTest015';
        console.info(`${TAG} test start`);
        try {
          const promise1 = Promise.resolve<Float>(10);
          const result = await promise1;
          expect(result).assertEqual(10);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });
    /**
     * @tc.number SUB_Promise_TEST_1600
     * @tc.name PromiseTest016
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'PromiseTest016';
        console.info(`${TAG} test start`);
        let result: double | undefined;
        try {
          const promise1 = Promise.resolve<double>(10.5);
          result = await promise1;
          expect(result).assertEqual(10.5);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });
    /**
     * @tc.number SUB_Promise_TEST_1700
     * @tc.name PromiseTest017
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'PromiseTest017';
        console.info(`${TAG} test start`);
        try {
          const promise1 = Promise.resolve<Char>(Int.toChar(1));
          const result = await promise1 as Char;
          expect(result).assertEqual(1);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_Promise_TEST_1800
     * @tc.name PromiseTest018
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'PromiseTest018';
        console.info(`${TAG} test start`);
        try {
          const promise1 = Promise.resolve<[number, string]>([10, "success"]);
          const result = await promise1;
          expect(result[0]).assertEqual(10);
          expect(result[1]).assertEqual('success');
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });
    /**
     * @tc.number SUB_Promise_TEST_1900
     * @tc.name PromiseTest019
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'PromiseTest019';
        console.info(`${TAG} test start`);
        let result: number | undefined;
        try {
          const promise1: Promise<number> = Promise.resolve<Promise<number>>(
            new Promise<number>((resolve) => {
              setTimeout(() => resolve(10), 100);
            })
          );
          result = await promise1;
          expect(result).assertEqual(10);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_Promise_TEST_2000
     * @tc.name PromiseTest020
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'PromiseTest020';
        console.info(`${TAG} test start`);
        let result: number | undefined;
        try {
          const getNumber = (): number => 10;
          const promise1: Promise<() => number> = Promise.resolve<() => number>(getNumber);
          const numberFunction = await promise1;
          result = numberFunction();
          expect(result).assertEqual(10);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });
    /**
     * @tc.number SUB_Promise_TEST_2100
     * @tc.name PromiseTest021
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'PromiseTest021';
        console.info(`${TAG} test start`);
        try {
          const promise = Promise.reject<Any>(new Error(undefined));
          const result = await promise as undefined;
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(err.message).assertEqual('');
          // expect(err.message).assertEqual(undefined);
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_Promise_TEST_2200
     * @tc.name PromiseTest022
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'PromiseTest022';
        console.info(`${TAG} test start`);
        try {
          const promise = Promise.reject<String>(new Error('zxx'));
          await promise;
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(err.message).assertEqual('zxx');
        }
        console.info(`${TAG} test end`);
        done();
      });


    /**
     * @tc.number SUB_Promise_TEST_2300
     * @tc.name PromiseTest023
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'PromiseTest023';
        console.info(`${TAG} test start`);
        try {
          const promise1 = Promise.reject<bigint>(new Error('12345678901234567890n'));
          const result = await promise1 as bigint;
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(err.message).assertEqual('12345678901234567890n');
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_Promise_TEST_2400
     * @tc.name PromiseTest024
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'PromiseTest024';
        console.info(`${TAG} test start`);
        try {
          const promise1 = Promise.reject<Long>(new Error('1234567890123456789'));
          const result = await promise1 as Long;
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(err.message).assertEqual('1234567890123456789');
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_Promise_TEST_2500
     * @tc.name PromiseTest025
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'PromiseTest025';
        console.info(`${TAG} test start`);
        try {
          const promise1 = Promise.reject<[number, string]>(new Error("10"));
          const result = await promise1 as [number, string];
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(err.message).assertEqual('10');
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_Promise_TEST_2600
     * @tc.name PromiseTest026
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'PromiseTest026';
        console.info(`${TAG} test start`);
        let result: number | undefined;
        try {
          const promise1: Promise<number> = Promise.reject<Promise<number>>(Error('10'));
          result = await promise1 as number;
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(err.message).assertEqual('10');
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_Promise_TEST_2700
     * @tc.name PromiseTest027
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'PromiseTest027';
        console.info(`${TAG} test start`);
        let result: number | undefined;
        try {
          const getNumber = (): number => 10;
          const promise1: Promise<() => number> = Promise.reject<funcType>(new Error('10'));
          const numberFunction = await promise1;
          result = numberFunction();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(err.message).assertEqual('10');
        }
        console.info(`${TAG} test end`);
        done();
      });


    /**
     * @tc.number SUB_Promise_TEST_2800
     * @tc.name PromiseTest028
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'PromiseTest028';
        console.info(`${TAG} test start`);
        try {
          const promise1 = Promise.resolve<Any>(undefined);
          const promise2 = Promise.resolve<Double>(10);
          const promise3 = Promise.resolve<Boolean>(true);
          const promise4 = Promise.resolve<[number, string]>([1, 'tupleValue'])
          let results =
            await Promise.all<Any | Double | Boolean | [number, string]>([promise1, promise2, promise3,
              promise4]) as Array<Any | Double | Boolean | [number, string]>
          let resultNullish = results[0] as undefined;
          let resultNum = results[1] as number;
          let resultBoolean = results[2] as boolean;
          expect(resultNullish).assertEqual(undefined);
          expect(resultNum).assertEqual(10);
          expect(resultBoolean).assertEqual(true);
          const tuple = results[3] as [number, string]
          expect(tuple?.[0]).assertEqual(1);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`);
          Done();
        }
      })

    /**
     * @tc.number SUB_Promise_TEST_2900
     * @tc.name PromiseTest029
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'PromiseTest029';
        console.info(`${TAG} test start`);
        try {
          const func: () => number = () => {
            return 20
          };
          const promiseTest: Promise<number> = new Promise<number>((resolve) => resolve(30))
          const promise1 = Promise.resolve<Any>(null);
          const promise2 = Promise.resolve<() => number>(func);
          const promise3 = Promise.resolve<Promise<number>>(promiseTest);
          const promise4 = Promise.resolve<[number, string]>([1, 'tupleValue'])
          let results =
            await Promise.all<Any | (() => number) | Promise<number> | [number, string]>([promise1, promise2,
              promise3, promise4]) as Array<Any | (() => number) | number | [number, string]>
          let resultNullish = results[0] as null;
          const resultFun: () => number = results[1] as () => number;
          const tuple = results[3] as [number, string];
          let resultNum = results[2] as number;
          expect(resultNullish).assertEqual(null);
          expect(resultFun()).assertEqual(20);
          expect(resultNum).assertEqual(30);
          expect(tuple?.[1]).assertEqual('tupleValue');
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(err.message).assertEqual(30);
        } finally {
          console.info(`${TAG} test end`);
          Done();
        }
      })


    /**
     * @tc.number SUB_Promise_TEST_3000
     * @tc.name PromiseTest030
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'PromiseTest030';
        console.info(`${TAG} test start`);
        try {
          const promise1 = Promise.resolve<Any>(undefined);
          const promise2 = Promise.resolve<[number, string]>([1, 'tupleValue'])
          const promise3 = Promise.resolve<short>(10 as short);
          // const promise4 = Promise.resolve<void>();
          const promise5 = Promise.reject(new Error('Error occurred'));
          let results = await Promise.all<Any | short | char | [number, string]>([promise1, promise2, promise3,
            promise5]) as Array<Any | short | char | [number, string]>
          let resultNullish = results[0] as undefined;
          let tuple = results[1] as [number, string];
          let resultNum = results[2] as number;
          expect(resultNullish).assertEqual(undefined);
          expect(tuple?.[0]).assertEqual(1);
          expect(resultNum).assertEqual(10);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(err.message).assertEqual('Error occurred');
        } finally {
          console.info(`${TAG} test end`);
          Done();
        }
      })

    /**
     * @tc.number SUB_Promise_TEST_3100
     * @tc.name PromiseTest031
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'PromiseTest031';
        console.info(`${TAG} test start`);
        try {
          const func: () => number = () => {
            return 20
          };
          const promiseTest: Promise<number> = new Promise<number>((resolve) => resolve(30))
          const promise1 = Promise.resolve<Any>(null);
          const promise2 = Promise.resolve<() => number>(func);
          const promise3 = Promise.resolve<Promise<number>>(promiseTest);
          const promise4 = Promise.resolve<[number, string]>([1, 'tupleValue'])
          const promise5 = Promise.reject(new Error('Error occurred'));
          let results =
            await Promise.all<Any | number | char | [number, string]>([promise1, promise2, promise3, promise4,
              promise5]) as Array<Any | number | char | [number, string]>
          const resultNullish = results[0] as null;
          const resultNum = results[2] as number;
          const resultFun: () => number = results[1] as () => number;
          const tuple = results[3] as [number, string];
          expect(resultNullish).assertEqual(null);
          expect(resultFun()).assertEqual(20);
          expect(resultNum).assertEqual(30);
          expect(tuple?.[1]).assertEqual('tupleValue');
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(err.message).assertEqual('Error occurred');
        } finally {
          console.info(`${TAG} test end`);
          Done();
        }
      })


    /**
     * @tc.number SUB_Promise_TEST_3200
     * @tc.name PromiseTest032
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'PromiseTest032';
        console.info(`${TAG} test start`);
        try {
          const person: Person = new Person('aaa')
          const promise1 = Promise.resolve<Any>(undefined);
          const promise2 = Promise.resolve<Person>(person);
          const promise3 = Promise.resolve<[number, string]>([1, 'tupleValue'])
          // const promise4 = Promise.resolve<void>();
          let results = await Promise.allSettled<Any | Person | [number, string]>([promise1,
            promise2,
            promise3]) as Array<PromiseFulfilledResult<Any | Person | [number, string]> | PromiseRejectedResult>;
          const result1 = results[0] as PromiseFulfilledResult<Any | Person | [number, string]>;
          const result2 = result1.value as undefined;
          expect(result2).assertEqual(undefined);
          expect(((results[1] as PromiseFulfilledResult<Any | Person | [number, string]>).value as Person).name)
            .assertEqual('aaa');
          expect(((results[2] as PromiseFulfilledResult<Any | Person | [number, string]>).value as [number, string])[0])
            .assertEqual(1);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          Done();
        }
      })

    /**
     * @tc.number SUB_Promise_TEST_3300
     * @tc.name PromiseTest033
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'PromiseTest033';
        console.info(`${TAG} test start`);
        try {
          const func: () => number = () => {
            return 20
          };
          const promiseTest: Promise<number> = new Promise<number>((resolve) => resolve(30))
          const promise1 = Promise.resolve<Any>(null);
          const promise2 = Promise.resolve<() => number>(func);
          const promise3 = Promise.resolve<Promise<number>>(promiseTest);
          const promise4 = Promise.resolve<[number, string]>([1, 'tupleValue'])
          let results =
            await Promise.allSettled<Any | () => number | [number, string] | Promise<number>>([promise1,
              promise2,
              promise3,
              promise4]) as Array<PromiseFulfilledResult<Any | () => number | [number, string] | Promise<number>> | PromiseRejectedResult>;
          const result1 = results[0] as PromiseFulfilledResult<Any | () => number | [number, string] | Promise<number>>;
          const result2 = result1.value as null;
          const result3 =
            results[2] as PromiseFulfilledResult<Any | () => number | [number, string] | Promise<number>>;
          const result4 = result3.value as number;
          expect(result2).assertEqual(null);
          const result: () => number =
            (results[1] as PromiseFulfilledResult<Any | () => number | [number, string] | Promise<number>>).value as () => number;
          expect(result()).assertEqual(20);
          expect(result4).assertEqual(30);
          expect(((results[3] as PromiseFulfilledResult<Any | () => number | [number, string] | Promise<number>>).value as [number, string])[1])
            .assertEqual('tupleValue');
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`);
          Done();
        }
      })


    /**
     * @tc.number SUB_Promise_TEST_3400
     * @tc.name PromiseTest034
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'PromiseTest034';
        console.info(`${TAG} test start`);
        try {
          const promise1 = Promise.resolve<Any>(null);
          const promise2 = Promise.resolve<Byte>(1 as Byte);
          const promise3 = Promise.resolve<int>(1);
          const promise4 = Promise.resolve<[number, string]>([1, 'tupleValue'])
          const promise5 = Promise.reject(new Error('Error occurred'));
          let results = await Promise.allSettled<Any | Byte | int | [number, string]>([promise1, promise2, promise3, promise4,
            promise5]) as Array<PromiseFulfilledResult<Any | Byte | int | [number, string]> | PromiseRejectedResult>;
          let result1 = results[1] as PromiseFulfilledResult<Any | Byte | int | [number, string]>;
          let result2 = result1.value as Byte;
          let result3 = results[2] as PromiseFulfilledResult<Any | Byte | int | [number, string]>;
          let result4 = result3.value as int;
          let result5 = results[0] as PromiseFulfilledResult<Any | Byte | int | [number, string]>;
          let result6 = result5.value as null;
          expect(result6).assertEqual(null);
          expect(result2).assertEqual(1);
          expect(result4).assertEqual(1);
          expect(((results[3] as PromiseFulfilledResult<Any | Byte | int | [number, string]>).value as [number, string])[0])
            .assertEqual(1);
          expect((results[4] as PromiseRejectedResult).reason.message).assertEqual('Error occurred');
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`);
          Done();
        }
      })

    /**
     * @tc.number SUB_Promise_TEST_3500
     * @tc.name PromiseTest035
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'PromiseTest035';
        console.info(`${TAG} test start`);
        try {
          const func: () => number = () => {
            return 20
          };
          const promiseTest: Promise<number> = new Promise<number>((resolve) => resolve(30))
          const promise1 = Promise.resolve<Any>(null);
          const promise2 = Promise.resolve<() => number>(func);
          const promise3 = Promise.resolve<Promise<number>>(promiseTest);
          const promise4 = Promise.resolve<[number, string]>([1, 'tupleValue'])
          const promise5 = Promise.reject(new Error('Error occurred'));
          let results =
            await Promise.allSettled<Any | () => number | [number, string] | Promise<number>>([promise1,
              promise2,
              promise3,
              promise4,
              promise5]) as Array<PromiseFulfilledResult<Any | () => number | [number, string] | Promise<number>> | PromiseRejectedResult>;
          const result1 = results[0] as PromiseFulfilledResult<Any | () => number | [number, string] | Promise<number>>;
          const result2 = result1.value as null;
          const result3 =
            results[2] as PromiseFulfilledResult<Any | () => number | [number, string] | Promise<number>>;
          const result4 = result3.value as number;
          expect(result2).assertEqual(null);
          const result: () => number =
            (results[1] as PromiseFulfilledResult<Any | () => number | [number, string] | Promise<number>>).value as () => number;
          expect(result()).assertEqual(20);
          expect(result4)
            .assertEqual(30);
          expect(((results[3] as PromiseFulfilledResult<Any | () => number | [number, string] | Promise<number>>).value as [number, string])[1])
            .assertEqual('tupleValue');
          expect((results[4] as PromiseRejectedResult).reason.message).assertEqual('Error occurred');
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`);
          Done();
        }
      })


    /**
     * @tc.number SUB_Promise_TEST_3600
     * @tc.name PromiseTest036
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'PromiseTest036';
        console.info(`${TAG} test start`);
        try {
          const array: Array<number> = new Array<number>(10);
          array.push(10);
          const promise1 = Promise.resolve<Any>(undefined);
          const promise2 = Promise.resolve<null>(null);
          const promise3 = Promise.resolve<Array<number>>(array);
          const promise4 = Promise.resolve<[number, string]>([1, 'tupleValue'])
          let result = await Promise.any([promise1, promise2, promise3,
            promise4]) as undefined;
          expect(result).assertEqual(undefined);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`);
          Done();
        }
      })

    /**
     * @tc.number SUB_Promise_TEST_3700
     * @tc.name PromiseTest037
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'PromiseTest037';
        console.info(`${TAG} test start`);
        try {
          const func: () => number = () => {
            return 20
          };
          const promiseTest: Promise<number> = new Promise<number>((resolve) => resolve(30))
          const promise1 = Promise.resolve<Promise<number>>(promiseTest);
          const promise2 = Promise.resolve<() => number>(func);
          const promise3 = Promise.resolve<Any>(undefined);
          const promise4 = Promise.resolve<[number, string]>([1, 'tupleValue'])
          let result = await Promise.any([promise1, promise2, promise3,
            promise4]) as number;
          expect(result).assertEqual(30);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`);
          Done();
        }
      })


    /**
     * @tc.number SUB_Promise_TEST_3800
     * @tc.name PromiseTest038
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'PromiseTest038';
        console.info(`${TAG} test start`);
        try {
          const set: Set<number> = new Set<number>();
          set.add(2);

          const promise1 = Promise.resolve<Any>(undefined);
          const promise2 = Promise.resolve<Set<number>>(set);
          const promise3 = Promise.resolve<[number, string]>([1, 'tupleValue'])
          const promise4 = Promise.reject(new Error('Error occurred'));
          let result = await Promise.any([promise1, promise2, promise3,
            promise4]) as undefined;
          expect(result).assertEqual(undefined);
          Done();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`);
          Done();
        }
      })


    /**
     * @tc.number SUB_Promise_TEST_3900
     * @tc.name PromiseTest039
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'PromiseTest039';
        console.info(`${TAG} test start`);
        try {
          const func: () => number = () => {
            return 20
          };
          const promiseTest: Promise<number> = new Promise<number>((resolve) => resolve(30))
          const promise1 = Promise.resolve<Promise<number>>(promiseTest);
          const promise2 = Promise.resolve<Any>(null);
          const promise3 = Promise.resolve<() => number>(func);
          const promise4 = Promise.resolve<[number, string]>([1, 'tupleValue'])
          const promise5 = Promise.reject(new Error('Error occurred'));
          let result = await Promise.any([promise1, promise2, promise3, promise4,
            promise5]) as number;
          expect(result).assertEqual(30);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`);
          Done();
        }
      })


    /**
     * @tc.number SUB_Promise_TEST_4000
     * @tc.name PromiseTest040
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'PromiseTest040';
        console.info(`${TAG} test start`);
        try {
          const concurrentSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>();
          concurrentSet.add(2);
          const promise1 = new Promise<containers.ConcurrentSet<number>>((resolve) => {
            setTimeout(() => resolve(concurrentSet), 100);
          });
          const promise2 = Promise.resolve<Any>(undefined);
          const promise3 = Promise.resolve<[number, string]>([1, 'tupleValue'])
          let result = await Promise.race<Any | [number, string]>([promise1, promise2, promise3]) as undefined;
          expect(result).assertEqual(undefined);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`);
          Done();
        }
      })

    /**
     * @tc.number SUB_Promise_TEST_4100
     * @tc.name PromiseTest041
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'PromiseTest041';
        console.info(`${TAG} test start`);
        try {
          const func: () => number = () => {
            return 20
          };
          const promiseTest = new Promise<number>((resolve) => {
            setTimeout(() => resolve(10), 100);
          });
          const promise1 = Promise.reject(new Error('Error occurred'));
          const promise2 = Promise.resolve<Promise<number>>(promiseTest);
          const promise3 = Promise.resolve<Any>(null);
          const promise4 = Promise.resolve<() => number>(func);
          const promise5 = Promise.resolve<[number, string]>([1, 'tupleValue'])
          let result = await Promise.race([promise1, promise2, promise3, promise4]) as null;
          expect(result).assertEqual(null);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(err.message).assertEqual('Error occurred');
        } finally {
          console.info(`${TAG} test end`);
          Done();
        }
      }
    )
    /**
     * @tc.number SUB_Promise_TEST_4200
     * @tc.name PromiseTest042
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'PromiseTest042';
        console.info(`${TAG} test start`);
        try {
          const promise1 = new Promise<number>((_, reject) => {
            setTimeout(() => reject(new Error('Promise 1 Error occurred')), 100);
          });
          const promise2 = Promise.resolve<Any>(undefined);
          const promise3 = Promise.resolve<[number, string]>([1, 'tupleValue'])
          const queue: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>();
          queue.add(2);
          const promise4 = new Promise<containers.LinkedBlockingQueue<number>>((resolve) => {
            setTimeout(() => resolve(queue), 100);
          });
          let result =
            await Promise.race<number | Any | [number, string] | containers.LinkedBlockingQueue<number>>([promise1,
              promise2, promise3, promise4]) as undefined;
          expect(result).assertEqual(undefined);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`);
          Done();
        }
      })

    /**
     * @tc.number SUB_Promise_TEST_4300
     * @tc.name PromiseTest043
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('PromiseTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'PromiseTest043';
        console.info(`${TAG} test start`);
        try {
          const func: () => number = () => {
            return 20
          };
          const promiseTest: Promise<number> = new Promise<number>((resolve) => {
            setTimeout(() => resolve(30), 100)
          });
          const promise1 = Promise.resolve<Promise<number>>(promiseTest);

          const promise2 = Promise.resolve<Any>(null);
          const promise3 = Promise.resolve<() => number>(func);
          const promise4 = Promise.reject(new Error('Error occurred'));
          const promise5 = Promise.resolve<[number, string]>([1, 'tupleValue'])
          let result =
            await Promise.race<Any | () => number | [number, string]>([promise1, promise2, promise3, promise4,
              promise5]) as null;
          expect(result).assertEqual(null);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`);
          Done();
        }
      })
  })
}
