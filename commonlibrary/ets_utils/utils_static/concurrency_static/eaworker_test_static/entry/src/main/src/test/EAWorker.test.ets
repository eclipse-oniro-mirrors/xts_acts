/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
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
  TestType,
  Level,
  Size
} from "../../../hypium/index";
import hilog from '@ohos.hilog';
import Utils from './Util.test';
import {quitErrorMsg} from './Util.test';

type Literal = 'success' | 'failure' | 'pending';

let EAWorkerTest001: boolean = false;

function ThrowExceptionWorkerTest(): void {
  EAWorkerTest001 = true;
  throw new Error('Worker function exception');
}

function EAWorkerTestUn(): undefined {
  return undefined;
}

let EAWorkerTest003: boolean = false;

function EAWorkerTestWithNull(param: null): void {
  EAWorkerTest003 = true;
}

function EAWorkerTestWithLong(param: int): int {
  return param + 1;
}

class TestClass {
  private value: int;

  constructor(initialValue: int) {
    this.value = initialValue;
  }

  public increment(): void {
    this.value++;
  }

  public getValue(): int {
    return this.value;
  }
}

function EAWorkerTestWithClass(
  factory: (initialValue: int) => TestClass,
  initialValue: int,
  callback: (instance: TestClass) => void
): void {
  setTimeout(() => {
    const instance = factory(initialValue);
    instance.increment();
    callback(instance);
  }, 100);
}

async function EAWorkerTestWithPromise(
  inputPromise: Promise<number>
): Promise<number> {
  const value = await inputPromise;
  return new Promise<double>(resolve => {
    setTimeout(() => {
      resolve(value + 1);
    }, 500);
  });
}

class ErrorTask {
  private shouldFail: boolean;

  constructor(shouldFail: boolean) {
    this.shouldFail = shouldFail;
  }

  execute(): Promise<string> {
    return new Promise<string>((resolve, reject) => {
      setTimeout(() => {
        if (this.shouldFail) {
          reject(new Error("Task Fail"));
        } else {
          resolve("Task Success");
        }
      });
    });
  }
}

let EAWorkerTest010: boolean = false;

class TestUtils {
  static voidStaticTask(): void {
    EAWorkerTest010 = true;
    console.log('Static...');
  }
}

class MathUtils {
  static add(a: number, b: number): number {
    if (typeof a !== 'number' || typeof b !== 'number') {
      throw new Error('The parameters must be of numeric type');
    }
    return a + b;
  }
}

class MyClass {
  public throwError(): void {
    throw new Error('Class method exception');
  }
}

class Calculator {
  public add(a: number, b: number): number {
    if (typeof a !== 'number' || typeof b !== 'number') {
      throw new Error('The parameters must be of numeric type');
    }
    return a + b;
  }
}

function processData(input: string): string {
  if (!input) {
    throw new Error('The input cannot be empty');
  }
  if (input.length < 5) {
    throw new Error('length must be > 5');
  }
  return input.toUpperCase();
}

class SafeContainer<T> {
  private container: Map<string, T> = new Map<string, T>();

  public put(key: string, value: T): void {
    this.container.set(key, value);
  }

  public get(key: string): T | undefined {
    return this.container.get(key);
  }

  public clear(): void {
    this.container.clear();
  }
}

let EAWorkerTest015: boolean = false;

function SafeContainerOperation(): void {
  EAWorkerTest015 = true;
  const safeContainer = new SafeContainer<string>();
  safeContainer.put("key1", "value1");
  const value = safeContainer.get("key1");
  if (value !== "value1") {
    throw new Error("The operation of the safe container failed");
  }
  safeContainer.clear();
}

let EAWorkerTest016: boolean = false;

function promiseThrowException(): Promise<void> {
  return new Promise<void>((_, reject) => {
    reject(new Error('fail'));
  });
}

function processDataAsync(data: string): Promise<string> {
  return new Promise<String>((resolve) => {
    setTimeout(() => {
      resolve(`Processed: ${data}`);
    }, 100);
  });
}


enum Status {
  PENDING = 'pending',
  SUCCESS = 'success',
  FAILURE = 'failure'
}

class Person {
  age: number;
  status: Status = Status.PENDING;

  constructor(age: number) {
    this.age = age;
  }

  static getAge(age?: number): number {
    return age !== undefined ? age : 28;
  }
}

class TestWorker extends EAWorker {
  private joinCalled: boolean = false;
  private customData: string = 'Test';

  override start(): void{
    super.start();
  }
  override join(): Job<void> {
    this.joinCalled = true;
    return super.join();
  }

  override toString(): string {
    return `EAWorker[${this.customData}]`;
  }

  isJoinCalled(): boolean {
    return this.joinCalled;
  }
}


export default function EAWorkerTest() {
  describe('EAWorkerTest', (): void => {
    afterEach(() => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_0100
     * @tc.name EAWorkerTest001
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest001';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        worker.start()
        try {
          worker.run<void>(ThrowExceptionWorkerTest).Await();
          expect(EAWorkerTest001).assertTrue();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(err.message).assertEqual('Worker function exception');
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_0200
     * @tc.name EAWorkerTest002
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest002';
        console.info(`${TAG} test start`);
        let worker = new EAWorker();
        worker.start()
        try {
          let worker1 = worker.run<undefined>(EAWorkerTestUn).Await();
          expect(worker1).assertEqual(undefined);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          done();
        }

      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_0300
     * @tc.name EAWorkerTest003
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest003';
        console.info(`${TAG} test start`);
        let worker = new EAWorker()
        worker.start()
        try {
          worker.run<void>(EAWorkerTestWithNull, null).Await();
          expect(EAWorkerTest003).assertTrue();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          done();
        }

      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_0400
     * @tc.name EAWorkerTest004
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest004';
        console.info(`${TAG} test start`);
        const INITIAL_VALUE: int = 100;
        const EXPECTED_VALUE: int = 101;
        const worker = new EAWorker();
        worker.start()
        try {
          const result = worker.run<int>(EAWorkerTestWithLong, INITIAL_VALUE).Await();
          expect(result).assertEqual(EXPECTED_VALUE);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_0500
     * @tc.name EAWorkerTest005
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest005';
        console.info(`${TAG} test start`);
        const INITIAL_VALUE: int = 42;
        const EXPECTED_VALUE: int = 43;
        const worker = new EAWorker();
        worker.start()
        try {
          worker.run<void>(
            EAWorkerTestWithClass,
            (initialValue: int) => new TestClass(initialValue),
            INITIAL_VALUE, (instance: TestClass) => {
            expect(instance.getValue()).assertEqual(EXPECTED_VALUE);
          }
          ).Await();

        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_0600
     * @tc.name EAWorkerTest006
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest006';
        console.info(`${TAG} test start`);
        let worker = new EAWorker();
        worker.start()
        try {
          const failingTask = (): Promise<never> => {
            return Promise.reject(new Error("Intentional error"));
          };
          let job = worker.run<Promise<never>>(failingTask);
          await job.Await();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(err.message).assertEqual("Intentional error");
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          done();
        }

      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_0700
     * @tc.name EAWorkerTest007
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest007';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        worker.start()
        try {
          const taskFunc = (): string => {
            return '222';
          };
          const task: taskpool.Task = new taskpool.Task('taskName', taskFunc, taskpool.Priority.HIGH);
          const result = await worker.run<Promise<string>>(
            async (taskInstance: taskpool.Task): Promise<string> => {
              let taskStr: string = '';
              await taskpool.execute(taskInstance).then((res) => {
                taskStr = res;
              });
              return taskStr;
            },
            task
          ).Await();

          expect(result).assertEqual('222');
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_0800
     * @tc.name EAWorkerTest008
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest008';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        worker.start()
        try {
          expect(worker != null).assertTrue();
          expect(worker instanceof EAWorker).assertTrue();
          const result = worker.run<number>(() => 42.0).Await();
          expect(result).assertEqual(42.0);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_0900
     * @tc.name EAWorkerTest009
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest009';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        worker.start()
        try {
          expect(worker != null).assertTrue();
          expect(worker instanceof EAWorker).assertTrue();
          const testInput = 21.0;
          const result = worker.run<number>(
            (param: number) => param * 2,
            testInput
          ).Await();
          expect(result).assertEqual(42.0);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          done();
        }

      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_1000
     * @tc.name EAWorkerTest010
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest010';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        worker.start()
        try {
          worker.run<void>(TestUtils.voidStaticTask).Await();
          expect(EAWorkerTest010).assertTrue();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          done();
        }

      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_1100
     * @tc.name EAWorkerTest011
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest011';
        console.info(`${TAG} test start`);
        const TEST_PARAM_A = 10;
        const TEST_PARAM_B = 20;
        const EXPECTED_RESULT = 30;
        const worker = new EAWorker();
        worker.start()
        try {
          const result = worker.run<number>(() => {
            return MathUtils.add(TEST_PARAM_A, TEST_PARAM_B);
          }).Await();
          expect(result).assertEqual(EXPECTED_RESULT);
          expect(typeof result).assertEqual('number');
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_1200
     * @tc.name EAWorkerTest012
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest012';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        worker.start()
        try {
          worker.run<void>(() => {
            const instance = new MyClass();
            instance.throwError();
          }).Await();
          expect(false).assertFail();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(err.message).assertEqual('Class method exception');
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          done();
        }

      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_1300
     * @tc.name EAWorkerTest013
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest013';
        console.info(`${TAG} test start`);
        const TEST_PARAM_A = 10;
        const TEST_PARAM_B = 20;
        const EXPECTED_RESULT = 30;
        const worker = new EAWorker();
        worker.start()
        try {
          const result = worker.run<number>(() => {
            const calculator = new Calculator();
            return calculator.add(TEST_PARAM_A, TEST_PARAM_B);
          }).Await();
          expect(result).assertEqual(EXPECTED_RESULT);
          expect(typeof result).assertEqual('number');
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_1400
     * @tc.name EAWorkerTest014
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest014';
        console.info(`${TAG} test start`);
        const INVALID_INPUT = 'abc';
        const worker = new EAWorker();
        worker.start()
        try {
          worker.run<string>(() => {
            return processData(INVALID_INPUT);
          }).Await();
          expect(false).assertFail();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(err.message).assertEqual('length must be > 5');
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_1500
     * @tc.name EAWorkerTest015
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest015';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        worker.start()
        try {
          worker.run<void>(SafeContainerOperation).Await();
          expect(EAWorkerTest015).assertTrue();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          done();
        }

      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_1600
     * @tc.name EAWorkerTest016
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest016';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        worker.start()
        try {
          worker.run<void>(promiseThrowException).Await();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(err.message).assertEqual('fail');
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_1700
     * @tc.name EAWorkerTest017
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest017';
        console.info(`${TAG} test start`);
        const TEST_INPUT = 'test-data';
        const EXPECTED_RESULT = 'Processed: test-data';
        const worker = new EAWorker();
        worker.start()
        try {
          worker.run<void>(() => {
            return new Promise<void>((resolve, reject) => {
              processDataAsync(TEST_INPUT)
                .then((result: string) => {
                  expect(result).assertEqual(EXPECTED_RESULT);
                  expect(typeof result).assertEqual('string');
                  resolve(undefined);
                })
                .catch((err: Error) => {
                  expect(false).assertFail();
                  reject(err);
                });
            });
          }).Await();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_1800
     * @tc.name EAWorkerTest018
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest018';
        console.info(`${TAG} test start`);
        const TEST_INPUT = 'valid-data';
        const EXPECTED_ERROR_MSG = 'Thrown error';
        const worker = new EAWorker();
        worker.start()
        try {
          worker.run<void>(() => {
            return new Promise<void>((resolve, reject) => {
              processDataAsync(TEST_INPUT)
                .then((result: string) => {
                  throw new Error(EXPECTED_ERROR_MSG);
                })
                .catch((err: Error) => {
                  expect(err.message).assertEqual(EXPECTED_ERROR_MSG);
                });
            });
          }).Await();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_1900
     * @tc.name EAWorkerTest019
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest019';
        console.info(`${TAG} test start`);
        const EXPECTED_ERROR_MSG = 'TaskPool Error';
        const worker = new EAWorker();
        worker.start()

        try {
          await worker.run<Promise<void>>(() => {
            return new Promise<void>((resolve, reject) => {
              taskpool.execute(() => {
                throw new Error(EXPECTED_ERROR_MSG);
              }).then(() => {
                reject(new Error('TaskPool error'));
              }).catch((err: Error) => {
                try {
                  expect(err.message).assertEqual(EXPECTED_ERROR_MSG);
                  resolve(undefined);
                } catch (err) {
                  err = err as Error;
                  reject(new Error('fail'));
                }
              });
            });
          }).Await();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_2000
     * @tc.name EAWorkerTest020
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest020';
        console.info(`${TAG} test start`);
        const EXPECTED_ERROR_MSG = 'TaskPool ERROR';
        const worker = new EAWorker();
        worker.start()
        try {
          await worker.run<Promise<void>>(() => {
            return new Promise<void>((resolve, reject) => {
              taskpool.execute(() => {
                return 'success';
              }).then(() => {
                throw new Error(EXPECTED_ERROR_MSG);
              }).catch((err: Error) => {
                try {
                  expect(err.message).assertEqual(EXPECTED_ERROR_MSG);
                  resolve(undefined);
                } catch (err) {
                  err = err as Error;
                  reject(new Error('fail'));
                }
              });
            });
          }).Await();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_2100
     * @tc.name EAWorkerTest021
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest021';
        console.info(`${TAG} test start`);
        const SUCCESS_MSG = 'TaskPool Success';
        const worker = new EAWorker();
        worker.start()
        try {
          await worker.run<Promise<void>>(() => {
            return new Promise<void>((resolve, reject) => {
              taskpool.execute(() => {
                return SUCCESS_MSG;
              }).then((result) => {
                try {
                  expect(result).assertEqual(SUCCESS_MSG);
                  resolve(undefined);
                } catch (err) {
                  err = err as Error;
                  reject(new Error(err.message));
                }
              }).catch((err: Error) => {
                reject(new Error(err.message));
              });
            });
          }).Await();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_2200
     * @tc.name EAWorkerTest022
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest022';
        console.info(`${TAG} test start`);
        const SUCCESS_RESULT = 'Async Success';
        const worker = new EAWorker();
        worker.start()
        try {
          const result = await worker.run<Promise<string>>(async (): Promise<string> => {
            await Promise.resolve();
            return SUCCESS_RESULT;
          }).Await();
          expect(result).assertEqual(SUCCESS_RESULT);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_2300
     * @tc.name EAWorkerTest023
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest023';
        console.info(`${TAG} test start`);
        const ERROR_MESSAGE = 'Async Error Occurred';
        const worker = new EAWorker();
        worker.start()
        try {
          await worker.run<Promise<string>>(async (): Promise<string> => {
            await Promise.resolve();
            throw new Error(ERROR_MESSAGE);
          }).Await();
          expect(false).assertFail();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(err.message).assertEqual(ERROR_MESSAGE);
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_2400
     * @tc.name EAWorkerTest024
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest024';
        console.info(`${TAG} test start`);
        const SUCCESS_RESULT = 'Async Success';
        const worker = new EAWorker();
        worker.start()
        try {
          const result = await worker.run<Promise<string>>(async (): Promise<string> => {
            await Promise.resolve();
            return SUCCESS_RESULT;
          }).Await();
          expect(result).assertEqual(SUCCESS_RESULT);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          done()
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_2500
     * @tc.name EAWorkerTest025
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest025';
        console.info(`${TAG} test start`);
        const ERROR_MESSAGE = 'Async Error';
        const worker = new EAWorker();
        worker.start()
        try {
          const result = await worker.run<Promise<string>>(async (): Promise<string> => {
            await Promise.resolve();
            throw new Error(ERROR_MESSAGE);
          }).Await();
          expect(false).assertFail();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(err.message).assertEqual(ERROR_MESSAGE);
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_2600
     * @tc.name EAWorkerTest026
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest026';
        console.info(`${TAG} test start`);
        const SUCCESS_RESULT = 'Async Success';
        const DELAY_MS = 20;
        const worker = new EAWorker();
        worker.start()

        try {
          const startTime = Date.now();
          const result = await worker.run<Promise<string>>((): Promise<string> => {
            return new Promise<string>((resolve) => {
              setTimeout(() => {
                resolve(SUCCESS_RESULT);
              }, DELAY_MS);
            });
          }).Await();
          expect(result).assertEqual(SUCCESS_RESULT);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_2700
     * @tc.name EAWorkerTest027
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest027';
        console.info(`${TAG} test start`);
        const ERROR_MESSAGE = 'Async Failed';
        const worker = new EAWorker();
        worker.start()
        try {
          worker.run<Promise<string>>((): Promise<string> => {
            return new Promise<string>((resolve, reject) => {
              setTimeout(() => {
                reject(new Error(ERROR_MESSAGE))
              }, 50);
            });
          }).Await();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(err.message).assertEqual(ERROR_MESSAGE);
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_2800
     * @tc.name EAWorkerTest028
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest028';
        console.info(`${TAG} test start`);
        const SUCCESS_RESULT = 'Async Success';
        const TEST_COUNT = 100;
        const worker = new EAWorker();
        worker.start()
        let successCount = 0;

        try {
          for (let i = 0; i < TEST_COUNT; i++) {
            try {
              const result = await worker.run<Promise<string>>(async (): Promise<string> => {
                await Promise.resolve();
                return `${SUCCESS_RESULT}_${i}`;
              }).Await();
              expect(result).assertEqual(`${SUCCESS_RESULT}_${i}`);
              successCount++;
            } catch (err) {
              err = err as Error;
              console.error(`${TAG} [Iteration ${i}] : ${(err as Error).message}`);
              throw err;
            }
          }
          expect(successCount).assertEqual(TEST_COUNT);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_2900
     * @tc.name EAWorkerTest029
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest029';
        console.info(`${TAG} test start`);
        let executedFlag = false;
        let worker = new EAWorker();
        let work2 = new EAWorker();
        worker.start()
        work2.start()
        try {
          const task = worker.run<void>(async () => {
            executedFlag = true;
            await new Promise<void>((resolve) => {
              setTimeout(() => resolve(undefined), 3000);
            });
            const nestedTask = work2.run<void>(async () => {
              worker.join();

              await new Promise<void>((resolve) => {
                setTimeout(() => resolve(undefined), 1000);
              });
              executedFlag = true;
            });
            nestedTask.Await();
          });
          task.Await();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
          work2.join();
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_3000
     * @tc.name EAWorkerTest030
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest030';
        console.info(`${TAG} test start`);
        let executedFlag = false;
        let worker = new EAWorker();
        let work2 = new EAWorker();
        worker.start()
        work2.start()
        try {
          const task = worker.run<void>(async () => {
            executedFlag = true;
            await new Promise<void>((resolve) => {
              setTimeout(() => resolve(undefined), 3000);
            });
            const nestedTask = work2.run<void>(async () => {
              await new Promise<void>((resolve) => {
                worker.join();
                setTimeout(() => resolve(undefined), 1000);
              });
              executedFlag = true;
            });
            nestedTask.Await();
          });
          task.Await();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join()
          work2.join();
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_3100
     * @tc.name EAWorkerTest031
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest031';
        console.info(`${TAG} test start`);
        let executedFlag = false;
        let worker = new EAWorker();
        let work2 = new EAWorker();
        worker.start()
        work2.start()
        try {
          const task = worker.run<void>(async () => {
            executedFlag = true;

            await new Promise<void>((resolve) => {
              setTimeout(() => resolve(undefined), 3000);
            });
            const nestedTask = work2.run<void>(async () => {
              await new Promise<void>((resolve) => {
                setTimeout(() => resolve(undefined), 1000);
              });
              worker.join();
              executedFlag = true;
            });
            nestedTask.Await();
          });
          task.Await();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join()
          work2.join();
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_3300
     * @tc.name EAWorkerTest033
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest033';
        console.info(`${TAG} test start`);
        let worker = new EAWorker();
        worker.start()
        let executedFlag = false;
        worker.run<void>((): void => {
          executedFlag = true;
          console.log(`${TAG} Task started`);
          const start = Date.now();
          while (Date.now() - start < 1500) {
          }
        });
        setTimeout(() => {
          try {
            worker.join();
            console.log(`${TAG} Worker joined after 1s`);
            expect(executedFlag).assertTrue();
            console.info(`${TAG} test end`);
            done();
          } catch (err) {
            err = err as Error;
            console.error(`${TAG} catch error: code =>  message => ${err.message}`);
            expect(false).assertFail()
            console.info(`${TAG} test end`);
            done();
          }
        }, 1000);
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_3400
     * @tc.name EAWorkerTest034
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void): void => {
      const TAG: string = 'EAWorkerTest034';
      console.info(`${TAG} test start`);
      let worker = new EAWorker();
      worker.start()
      let executedFlag = false;
      worker.run<void>((): void => {
        executedFlag = true;
        console.log(`${TAG} Task started`);
        const start = Date.now();
        while (Date.now() - start < 7000) {
        }
      });
      setTimeout(() => {
        try {
          worker.join();
          console.log(`${TAG} Worker joined`);
          expect(executedFlag).assertTrue();
          console.info(`${TAG} test end`);
          done();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
          console.info(`${TAG} test end`);
          done();
        }
      }, 700);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_3500
     * @tc.name EAWorkerTest035
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest035';
        console.info(`${TAG} test start`);
        let worker = new EAWorker();
        worker.start()
        try {
          let worker1 = worker.run<undefined>(EAWorkerTest).Await();
          expect(worker1).assertEqual(undefined);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          done();
        }
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_3600
     * @tc.name EAWorkerTest036
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest036';
        console.info(`${TAG} test start`);
        let joinCalledInTask = false;
        let worker = new EAWorker();
        worker.start()
        try {
          const task = await worker.run<Promise<string>>(async (): Promise<string> => {
            worker.join();
            await Promise.resolve();
            joinCalledInTask = true;
            return "SUCCESS_RESULT";
          }).Await();
          expect(joinCalledInTask).assertTrue();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.join();
          } catch (err) {
            err = err as Error;
            console.error(`${TAG} catch quit error: code =>  message => ${err.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }

      });
    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_3700
     * @tc.name EAWorkerTest037
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest037';
        console.info(`${TAG} test start`);
        let joinCalledInTask = false;
        let worker = new EAWorker();
        worker.start()
        try {
          const task = await worker.run<Promise<string>>(async (): Promise<string> => {
            await Promise.resolve();
            joinCalledInTask = true;
            return "SUCCESS_RESULT";
          }).Await();
          expect(joinCalledInTask).assertTrue();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          done();
        }
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_3800
     * @tc.name EAWorkerTest038
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest038';
        console.info(`${TAG} test start`);
        const RUN_TIMES = 3;
        let successCount = 0;
        let worker: EAWorker | null = new EAWorker();
        worker.start()
        try {
          for (let i = 0; i < RUN_TIMES; i++) {
            const result = await worker.run<Promise<string>>(async (): Promise<string> => {
              await Promise.resolve();
              return `TASK_${i}_SUCCESS`;
            }).Await();
            successCount++;
          }
          worker.join();
          worker = null;
          worker = new EAWorker();
          worker.start()
          const finalResult = await worker.run<Promise<string>>(async (): Promise<string> => {
            await Promise.resolve();
            return `FINAL_TASK_SUCCESS`;
          }).Await();
          successCount++;
          expect(successCount).assertEqual(RUN_TIMES + 1);
        } catch (err) {
          err = err as Error;
          hilog.error(0x0000, TAG, `Execution failed: ${err.message}`);
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          if (worker) {
            worker.join();
          }
          console.info(`${TAG} test end`);
          done();
        }
      });
    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_3900
     * @tc.name EAWorkerTest039
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest039';
        console.info(`${TAG} test start`);
        const workerTest: string = '1';
        try {
          let worker = new EAWorker();
          worker.start()
          let worker1 = worker.run<undefined>(EAWorkerTest).Await();
          worker.join();
          worker.join();
          expect(worker1).assertEqual(undefined);
        } catch (err) {
          err = err as Error;
          expect(err.message).assertContain(quitErrorMsg);
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
        } finally {
          console.info(`${TAG} test end`);
          done();
        }
      });


    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_4000
     * @tc.name EAWorkerTest040
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest040';
        console.info(`${TAG} test start`);
        try {
          let worker = new EAWorker();
          worker.start()
          let workerThreadId: number = 0;
          const mainThreadId = StdProcess.tid;
          let worker1 = worker.run<undefined>((): undefined => {
            workerThreadId = StdProcess.tid();
            return undefined;
          }).Await();
          expect(worker1).assertEqual(undefined);
          expect(workerThreadId != mainThreadId).assertTrue();
          worker.join();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_4100
     * @tc.name EAWorkerTest041
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest041';
        console.info(`${TAG} test start`);
        let executedFlag = false;
        let worker: EAWorker | null = new EAWorker();
        let work2 = new EAWorker();
        worker.start()
        work2.start()
        try {
          let worker1ThreadId: number;
          let worker2ThreadId: number;
          const task = worker.run<number>((): number => {
            worker1ThreadId = StdProcess.tid();
            executedFlag = true;
            const nestedTask = work2.run<number>((): number => {
              worker2ThreadId = StdProcess.tid();
              executedFlag = true;
              return worker2ThreadId;
            });
            nestedTask.Await();
            return worker1ThreadId;
          });
          task.Await();
          expect(worker1ThreadId != worker2ThreadId).assertTrue();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          work2.join();
          worker.join();
          console.info(`${TAG} test end`);
          done();
        }
      });


    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_4200
     * @tc.name EAWorkerTest042
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest042';
        console.info(`${TAG} test start`);
        try {
          const worker1 = new EAWorker();
          const worker2 = new EAWorker();
          const worker3 = new EAWorker();
          worker1.start();
          worker2.start();
          worker3.start();
          worker1.join();
          worker2.join();
          worker3.join();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`);
          Done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_4300
     * @tc.name EAWorkerTest043
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest043';
        console.info(`${TAG} test start`);
        const worker1 = new EAWorker();
        const worker2 = new EAWorker();
        const worker3 = new EAWorker();
        worker1.start();
        worker2.start();
        worker3.start();
        try {
          const worker4 = new EAWorker();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(err.message).assertEqual('The limit of Exclusive Workers has been reached');
        } finally {
          worker1.join();
          worker2.join();
          worker3.join();
          console.info(`${TAG} test end`);
          Done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_4400
     * @tc.name EAWorkerTest044
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest044';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        worker.start()
        let person: Person = new Person(23);
        try {
          const workerPromise = new Promise<Person>((resolve, reject) => {
            worker.run(() => {
              try {
                person.age = 25;
                resolve(person)
              } catch (err) {
                err = err as Error;
                reject(err);
              }
            });
          });
          workerPromise
            .then((person: Person) => {
              expect(person.age).assertEqual(25);
            })
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          Done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_4500
     * @tc.name EAWorkerTest045
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest045';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        worker.start()
        try {
          const result = worker.run<String>((): String => {
            return String(0)
          }).Await();
          expect(result).assertEqual('0');
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          Done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_4600
     * @tc.name EAWorkerTest046
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest046';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        worker.start()
        let inputPerson = new Person(23);
        try {
          const result = worker.run((input: Person): void => {
            throw new Error('Custom worker error')
          }, inputPerson).Await();
          worker.join()
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(err.message).assertEqual('Custom worker error');
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          Done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_4700
     * @tc.name EAWorkerTest047
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest047';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        worker.start()
        let inputNum: int = 0;
        try {
          const result = worker.run<int>((input: int) => {
            return input + 2;
          }, inputNum).Await();
          expect(result).assertEqual(2);
          worker.join()
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.join();
          } catch (err) {
            err = err as Error;
            console.error(`${TAG} catch quit error: code =>  message => ${err.message}`);
          }
          console.info(`${TAG} test end`);
          Done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_4800
     * @tc.name EAWorkerTest048
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest048';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        worker.start()
        let inputTuple: [number, string] = [1, 'test'];
        try {
          const workerPromise = new Promise<[number, string]>((resolve, reject) => {
            worker.run((input: [number, string]) => {
              try {
                const result: [number, string] = [input[0] + 2, input[1].toUpperCase()];
                resolve(result);
              } catch (err) {
                err = err as Error;
                reject(err);
              }
            }, inputTuple);
          });
          workerPromise
            .then((result: [number, string]) => {
              expect(result[0]).assertEqual(3);
              expect(result[1]).assertEqual('TEST');
            })
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          Done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_4900
     * @tc.name EAWorkerTest049
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest049';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        worker.start()
        const inputFunction = async (): Promise<number> => {
          return new Promise<number>((resolve) => {
            resolve(5);
          });
        };

        try {
          const workerPromise = new Promise<() => Promise<number>>((resolve, reject) => {
            worker.run((input: () => Promise<number>) => {
              try {
                const value = await input();
                const additionalValue = await Promise.resolve(10);
                resolve((): Promise<number> => Promise.resolve(value + additionalValue))
              } catch (err) {
                err = err as Error;
                reject(err);
              }
            }, inputFunction);
          });
          const resultFunc = await workerPromise;
          const result = await resultFunc();
          expect(result).assertEqual(15);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          Done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_5000
     * @tc.name EAWorkerTest050
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest050';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        worker.start()
        let inputPerson = new Person(23);
        try {
          const workerPromise = new Promise<Person>((resolve, reject) => {
            worker.run((input: Person) => {
              try {
                input.age = 25;
                resolve(input);
              } catch (err) {
                err = err as Error;
                reject(err);
              }
            }, inputPerson);
          });
          workerPromise
            .then((input: Person) => {
              expect(input.age).assertEqual(25);
            })
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          Done();
        }
      });


    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_5200
     * @tc.name EAWorkerTest052
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest052';
        console.info(`${TAG} test start`);
        const count: number = 100;
        let timeTotal: number = 0;
        const status: number[] = [0]
        try {
          for (let i = 1; i <= count; i++) {
            const startTime = Date.now();
            const worker = new EAWorker();
            worker.start()
            worker.run<boolean>((): boolean => {
              const result = Math.sqrt(16);
              return result > 0;
            }).Await();
            worker.join();
            const endTime = Date.now();
            timeTotal += (endTime - startTime);
            status[0] = i;
          }
          console.log(`${TAG}: - Total time: ${timeTotal}ms`);
          console.log(`${TAG}: - Avg time: ${timeTotal / count}ms`);
          hilog.info(1, TAG, '%{public}s', 'Total time:' + timeTotal + ' Avg time:' + (timeTotal / count))
          expect(status[0]).assertEqual(100);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`);
          Done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_5300
     * @tc.name EAWorkerTest053
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest053';
        console.info(`${TAG} test start`);
        const count: number = 100;
        let timeTotal: number = 0;
        const status: number[] = [0]
        try {
          for (let i = 1; i <= count; i++) {
            const startTime = Date.now();
            const worker = new EAWorker();
            worker.start()
            worker.join();
            const endTime = Date.now();
            timeTotal += (endTime - startTime);
            status[0] = i;
          }
          console.log(`${TAG}: - Total time: ${timeTotal}ms`);
          console.log(`${TAG}: - Avg time: ${timeTotal / count}ms`);
          hilog.info(1, TAG, '%{public}s', 'Total time:' + timeTotal + ' Avg time:' + (timeTotal / count));
          expect(status[0]).assertEqual(100);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`);
          Done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_5400
     * @tc.name EAWorkerTest054
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest054';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        worker.start()
        const inputNum = 1;
        try {
          const workerPromise = new Promise<bigint>((resolve, reject) => {
            worker.run(async (): Promise<bigint> => {
              try {
                const result = BigInt(inputNum)
                resolve(result);
              } catch (err) {
                err = err as Error;
                reject(err);
              }
            });
          });
          workerPromise
            .then((result: bigint) => {
              expect(result).assertEqual(1n);
            })
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          Done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_5500
     * @tc.name EAWorkerTest055
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest055';
        const worker = new EAWorker();
        worker.start()
        const inputLiteral: Literal = 'pending';
        try {
          const workerPromise = new Promise<Literal>((resolve, reject) => {
            worker.run(async (input: Literal): Promise<Literal> => {
              try {
                if (input == 'pending') {
                  input = 'success';
                }
                resolve(input);
              } catch (err) {
                err = err as Error;
                reject(err);
              }
            }, inputLiteral);
          });
          const result = await workerPromise;
          expect(result).assertEqual('success');
        } catch (err) {
          err = err as Error;
          console.error(`${TAG}: Expected error caught: ${err.message}`);
        } finally {
          worker.join();
          Done();
        }
      });


    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_5600
     * @tc.name EAWorkerTest056
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest056';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        worker.start()
        let inputPerson = new Person(23);
        try {
          const workerPromise = new Promise<Person>((resolve, reject) => {
            worker.run(async (input: Person): Promise<Person> => {
              try {
                input.age = 25;
                resolve(input);
              } catch (err) {
                err = err as Error;
                reject(err);
              }
            }, inputPerson);
          });
          workerPromise
            .then((input: Person) => {
              expect(input.age).assertEqual(25);
            })

        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          Done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_5700
     * @tc.name EAWorkerTest057
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest057';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        worker.start()
        const inputUndefined = undefined;
        let inputDouble: Double = 0;
        try {
          const workerPromise = new Promise<null>((resolve, reject) => {
            worker.run(async (input: undefined): Promise<null> => {
              try {
                inputDouble = 1;
                resolve(null);
              } catch (err) {
                err = err as Error;
                reject(err);
              }
            }, inputUndefined);
          });

          const result = await workerPromise;
          expect(result).assertEqual(null);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          Done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_5800
     * @tc.name EAWorkerTest058
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest058';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        worker.start()
        let inputPerson = new Person(23);
        try {
          const workerPromise = new Promise<Status>((resolve, reject) => {
            worker.run(async (input: Status): Promise<Status> => {
              try {
                input = Status.SUCCESS;
                resolve(input);
              } catch (err) {
                err = err as Error;
                reject(err);
              }
            }, inputPerson.status);
          });

          const result = await workerPromise;
          expect(result).assertEqual(Status.SUCCESS);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          Done();
        }
      });


    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_5900
     * @tc.name EAWorkerTest059
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest059';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        worker.start()
        const inputFunction = async (): Promise<number> => {
          return new Promise<number>((resolve) => {
            resolve(5);
          });
        };
        try {
          const workerPromise = new Promise<() => Promise<number>>((resolve, reject) => {
            worker.run(async (input: () => Promise<number>): Promise<() => Promise<number>> => {
              try {
                const value = await input();
                const additionalValue = await Promise.resolve(10);
                resolve((): Promise<number> => Promise.resolve(value + additionalValue))
              } catch (err) {
                err = err as Error;
                reject(err);
              }
            }, inputFunction);
          });
          const resultFunc = await workerPromise;
          hilog.info(1, TAG, '%{public}s', 'BuiltinsEAWorkerTest015:' + 4);
          const result = await resultFunc();
          expect(result).assertEqual(15);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          Done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_6000
     * @tc.name EAWorkerTest060
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest060';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        worker.start()
        const taskName = 'taskName1'
        const array: Int32Array = new Int32Array(10);
        array[0] = 0;
        const taskFunc = (): void => {
          array[0] = 1;
        };
        try {
          const workerPromise = new Promise<taskpool.Task>((resolve, reject) => {
            worker.run(async (input?: string): Promise<taskpool.Task> => {
              try {
                const taskName: string = input !== undefined ? input : 'taskName';
                let task: taskpool.Task = new taskpool.Task(taskName, taskFunc, 20);
                resolve(task);
              } catch (err) {
                err = err as Error;
                reject(err);
              }
            }, taskName);
          });

          const taskInstance = await workerPromise;
          await taskpool.execute(taskInstance, taskpool.Priority.HIGH);
          expect(array[0]).assertEqual(1);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          Done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_6100
     * @tc.name EAWorkerTest061
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest061';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        worker.start()
        try {
          const workerPromise = new Promise<() => number>((resolve, reject) => {
            worker.run((input: () => number) => {
              try {
                const age: number = input();
                resolve((): number => age);
              } catch (err) {
                err = err as Error;
                reject(err);
              }
            }, Person.getAge);
          });
          const resultFunc = await workerPromise;
          expect(resultFunc()).assertEqual(28);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          Done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_6200
     * @tc.name EAWorkerTest062
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest062';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        worker.start()
        let person: Person = new Person(23);
        try {
          const workerPromise = new Promise<Person>((resolve, reject) => {
            worker.run(async (): Promise<void> => {
              try {
                person.age = 25;
                resolve(person);
              } catch (err) {
                err = err as Error;
                reject(err);
              }
            });
          });

          const result = await workerPromise;
          expect(person.age).assertEqual(25);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          Done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_6300
     * @tc.name EAWorkerTest063
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest063';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        worker.start()
        const arr: Char[] = [c'1', c'2', c'3']
        const inputChar: Char = c'4';
        try {
          const workerPromise = new Promise<Char[]>((resolve, reject) => {
            worker.run(async (input: Char): Promise<void> => {
              try {
                arr[2] = input;
                resolve(arr);
              } catch (err) {
                err = err as Error;
                reject(err);
              }
            }, inputChar);
          });
          workerPromise
            .then((res: Char[]) => {
              expect(res[2]).assertEqual(c'4');
            })
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          Done();
        }
      });


    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_6400
     * @tc.name EAWorkerTest064
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest064';
        console.info(`${TAG} test start`);
        const worker = new TestWorker();
        try {
          worker.start();
          const toStringResult: string = worker.toString();
          expect(toStringResult).assertEqual('EAWorker[Test]');
          worker.join();
          const joinResult: boolean = worker.isJoinCalled();
          expect(joinResult).assertEqual(true);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`);
          Done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_6500
     * @tc.name EAWorkerTest065
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest065';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        worker.start()
        const arrayBuffer = new ArrayBuffer(1024);
        const array: Int32Array = new Int32Array(arrayBuffer);
        array[0] = 0;
        array[1] = 0;
        try {
          const workerPromise = new Promise<Int32Array>((resolve, reject) => {
            worker.run(async (input: Int32Array): Promise<void> => {
              try {
                setTimeout(() => {
                  console.info('delay 1s');
                }, 1000);
                array[0] = 1;
              } catch (err) {
                err = err as Error;
                reject(err);
              }
              resolve(array);
            }, array);
          });
          await workerPromise.then(() => {
            setTimeout(() => {
              console.info('delay 2s');
            }, 2000);
            array[1] = 2;
          })
          expect(array[0]).assertEqual(1);
          expect(array[1]).assertEqual(2);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join()
          console.info(`${TAG} test end`);
          Done();
        }
      });


    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_6600
     * @tc.name EAWorkerTest066
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest066';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        worker.start()
        const arrayBuffer = new ArrayBuffer(1024);
        const array: Int32Array = new Int32Array(arrayBuffer);
        array[0] = 0;
        try {
          const taskFunc = (num: number): void => {
            array[0] = num;
          };
          const workerPromise = new Promise<Int32Array>((resolve, reject) => {
            worker.run(async (): Promise<void> => {
              try {
                setTimeout(() => {
                  console.info('delay 3s');
                }, 3000);
                worker.join();
                await taskpool.execute(taskFunc, 2.0);
              } catch (err) {
                err = err as Error;
                reject(err);
              }
              resolve(array);
            })
          });
          await workerPromise;
          expect(array[0]).assertEqual(2.0);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.join();
          } catch (err) {
            err = err as Error;
            console.error(`${TAG} catch quit error: code =>  message => ${err.message}`);
          }
          console.info(`${TAG} test end`);
          Done();
        }
      });


    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_6700
     * @tc.name EAWorkerTest067
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest067';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        worker.start()
        const arrayBuffer = new ArrayBuffer(1024);
        const array: Int32Array = new Int32Array(arrayBuffer);
        array[0] = 0;
        try {
          const taskFunc = (num: number): void => {
            worker.join();
            array[0] = num;
          };
          const workerPromise = new Promise<Int32Array>((resolve, reject) => {
            worker.run(async (): Promise<void> => {
              try {
                setTimeout(() => {
                  console.info('delay 3s');
                }, 3000);
                await taskpool.execute(taskFunc, 2.0);
              } catch (err) {
                err = err as Error;
                reject(err);
              }
              resolve(array);
            })
          });
          await workerPromise;
          expect(array[0]).assertEqual(2.0);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.join();
          } catch (err) {
            err = err as Error;
            console.error(`${TAG} catch quit error: code =>  message => ${err.message}`);
          }
          console.info(`${TAG} test end`);
          Done();
        }
      });


    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_TEST_6800
     * @tc.name EAWorkerTest068
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('EAWorkerTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: () => void): Promise<void> => {
        const TAG: string = 'EAWorkerTest068';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        worker.start()
        const arrayBuffer = new ArrayBuffer(1024);
        const array: Int32Array = new Int32Array(arrayBuffer);
        array[0] = 0;
        try {
          const taskFunc = (num: number): void => {
            array[0] = num;
          };
          const workerPromise = new Promise<Int32Array>((resolve, reject) => {
            worker.run(async (): Promise<void> => {
              try {
                setTimeout(() => {
                  console.info('delay 3s');
                }, 3000);
                await taskpool.execute(taskFunc, 2.0);
              } catch (err) {
                err = err as Error;
                reject(err);
              }
              resolve(array);
            })
          });
          await workerPromise;
          expect(array[0]).assertEqual(2.0);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          worker.join();
          console.info(`${TAG} test end`);
          Done();
        }
      });
  })
}
