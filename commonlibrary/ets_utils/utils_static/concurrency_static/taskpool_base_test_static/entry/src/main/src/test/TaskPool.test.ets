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

type TestLiteral = 'A' | 'B' | 'C';

class TestObject {
  id: int;
  name: string;

  constructor(id: int, name: string) {
    this.id = id;
    this.name = name;
  }

  static create(id: int, name: string): Promise<TestObject> {
    return new Promise<TestObject>((resolve) => {
      resolve(new TestObject(id, name));
    });
  }

  getId(): number {
    return this.id;
  }

  getName(): string {
    return this.name;
  }

  getInfo(): string {
    return `${this.id}_${this.name}`;
  }
}

interface TaskParam {
  name: string;
}

function voidFunction(): void {
  executedFlag = true;
}

function taskPoolArgs(): String {
  return '20';
}

function taskPoolArgObj(args: TaskParam): void {
}

function taskPoolArgNumber(num: int): int {
  return num + 1;
}

function taskPoolArgTuple(args: [number, string]): [number, string] {
  return [args[0] * 2, args[1] + 'processed'];
}


function taskPoolArgFun(callback: () => void): () => Promise<void> {
  return () => {
    return new Promise<void>((resolve) => {
      setTimeout(() => {
        callback();
        resolve(undefined)
      }, 1000);
    });
  };
}

function simpleCallback() {
}

export class SendableA {
  state: Number = 0;
}

function sendableAFunc(sendAble: SendableA): Promise<Number> {
  sendAble.state = sendAble.state + 20;
  return new Promise<Number>((res) => {
    res(sendAble.state);
  });
}

export class MySendAbleClass {
  booleanItem: boolean;
  static numberItem1: number;
  stringItem: string;
  bigint1: bigint;
  null1: null;

  constructor(booleanItem: boolean, numberItem1: number, stringItem: string, bigint1: bigint, null1: null) {
    this.booleanItem = booleanItem;
    MySendAbleClass.numberItem1 = numberItem1;
    this.stringItem = stringItem;
    this.bigint1 = bigint1;
    this.null1 = null1;
  }

  static add(name?: string): number {
    console.log('aaaaaa')
    return ++MySendAbleClass.numberItem1;
  }
}

class SendAbleClassB extends MySendAbleClass {
  constructor() {
    super(true, 20, "test case", BigInt("9007199254740991"), null);
  }
}

let executedFlag = false;

async function noParamNoReturnTask(): Promise<void> {
  await new Promise<string>((resolve) => {
    resolve('success')
  });
  throw new Error("Intentionally thrown error from task");
}

async function noParamReturnUndefinedTask(): Promise<undefined> {
  return new Promise<undefined>((resolve) => {
    console.log("Task executing - will return undefined");
    resolve(undefined);
  });
};

let nullParam: boolean = false;

async function nullParamNoReturnTask(param: null): Promise<void> {
  await new Promise<string>((resolve) => {
    console.info("Task executing with null parameter: " + param);
    nullParam = true;
    resolve('1');
  });
}

async function processLongValue(input: long): Promise<long> {
  return new Promise<long>((resolve) => {
    console.info("Processing long value: " + input);
    const result = input * 2 + 1;
    resolve(result);
  });
}

class ParamConstructor {
  id: number;
  name: string;

  constructor(id: number, name: string) {
    this.id = id;
    this.name = name;
  }

  async getId(): Promise<number> {
    return this.id;
  }

  async getName(): Promise<string> {
    return this.name;
  }

  getInfo(): string {
    return `${this.id}_${this.name}`;
  }
}

const createParamInstance = async (id: number, name: string): Promise<ParamConstructor> => {
  await new Promise<void>((resolve) => {
    setTimeout(() => {
      resolve(undefined)
    }, 10);
  });
  return new ParamConstructor(id, name);
};

async function asyncTask(input: String): Promise<String> {
  return new Promise<String>((resolve) => {
    setTimeout(() => {
      resolve(input);
    }, 100);
  });
}

async function taskWrapper(args: Promise<String>): Promise<String> {
  const resolvedValue = await args;
  return asyncTask(resolvedValue);
}

class MyTask {
  private value: number;

  constructor(value: number) {
    this.value = value;
  }

  execute(): Promise<string> {
    return new Promise<string>((resolve) => {
      setTimeout(() => {
        resolve(`TaskResult_${this.value}`);
      }, 100);
    });
  }
}

function executeTaskAndReturnPromise(task: MyTask): Promise<string> {
  return task.execute().then((result: string) => {
    console.info("Task execution result: " + result);
    return result;
  });
}

class NoParamConstructor {
  private value: number;

  constructor() {
    this.value = 100;
  }

  getValue(): number {
    return this.value;
  }
}

function createNoParamInstance(): NoParamConstructor {
  return new NoParamConstructor();
}

class ParamTestClass {
  private name: string;

  constructor(name: string) {
    this.name = name;
  }

  getName(): string {
    return this.name;
  }
}

function createParamTestClass(name: string): ParamTestClass {
  return new ParamTestClass(name);
}

let taskPool010: boolean = false

class StaticClass {
  public static staticMethodWithoutReturn(): void {
    taskPool010 = true;
    console.info("Static method without parameters and return called");
  }
}

class StaticClass11 {
  public static async staticMethodWithParamsAndReturn(input: string): Promise<string> {
    console.info(`Static method called with input: ${input}`);
    return `Processed: ${input}`;
  }
}

let taskPool012: boolean = false

class TestClass {
  methodWithoutParams(): void {
    taskPool012 = true;
    console.info("methodWithoutParams called");
  }
}

class TestClass1 {
  methodWithParams(args: Number): string {
    console.info("methodWithParams args: " + args);
    return (args as Number).toString();
  }
}

let taskPool014: boolean = false

function noParamNoReturnFunc(): void {
  taskPool014 = true;
  console.info("Executing noParamNoReturnFunc");
}


function taskPool(args: Number): String {
  console.info("printArgs: " + args);
  return args.toString();
}

function taskPool1(args: string): string {
  console.info("printArgs: " + args);
  return args;
}

enum Status {
  PENDING = 'pending',
  ACTIVE = 'active'
}

interface TaskResult {
  originalByte: number;
  processedValue: number;
  timestamp: string;
  isValid: boolean;
}

class TestClass3 {
  private _status: Status;

  constructor(initialStatus: Status) {
    this._status = initialStatus;
  }

  public set status(value: Status) {
    this._status = value;
  }

  public get status(): Status {
    return this._status;
  }
}

class MyClass {
  name: string = '';

  setName(name: string): void {
    this.name = name;
  }
}

enum TaskStatus {
  PENDING,
  RUNNING,
  COMPLETED
}

class Task {
  status: TaskStatus;

  constructor(status: TaskStatus) {
    this.status = status;
  }
}


class TestData {
  private count: number = 0;

  public increment(): void {
    this.count++;
  }

  public getCount(): number {
    return this.count;
  }
}

function taskArgTuple(args: [number, string]): [number, string] {
  return [args[0] * 2, 'processed'];
}


export default function taskPoolTest() {
  describe('taskPoolTest', (): void => {
    /**
     * @tc.number SUB_TASKPOOL_TEST_0100
     * @tc.name TaskPoolTest001
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('TaskPoolTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskPoolTest001';
        console.info(`${TAG} test start`);
        try {
          await taskpool.execute(voidFunction);
          expect(executedFlag).assertEqual(true);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });
    /**
     * @tc.number SUB_TASKPOOL_TEST_0200
     * @tc.name TaskPoolTest002
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('TaskPoolTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskPoolTest002';
        console.info(`${TAG} test start`);
        try {
          await taskpool.execute(taskPoolArgs).then((value: Any) => {
            expect(value as string).assertEqual('20');
          });
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });
    /**
     * @tc.number SUB_TASKPOOL_TEST_0300
     * @tc.name TaskPoolTest003
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('TaskPoolTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskPoolTest003';
        console.info(`${TAG} test start`);
        try {
          const _obj: TaskParam = {
            name: 'testName'
          }
          let taskFlag = false;
          await taskpool.execute(taskPoolArgObj, _obj).then((value: Any) => {
            taskFlag = true;
          });
          expect(taskFlag).assertTrue();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });
    /**
     * @tc.number SUB_TASKPOOL_TEST_0400
     * @tc.name TaskPoolTest004
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('TaskPoolTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskPoolTest004';
        console.info(`${TAG} test start`);
        try {
          await taskpool.execute(taskPoolArgNumber, 20).then((value: Any) => {
            expect(value as int).assertEqual(21);
          });
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });
    /**
     * @tc.number SUB_TASKPOOL_TEST_0500
     * @tc.name TaskPoolTest005
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('TaskPoolTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskPoolTest005';
        console.info(`${TAG} test start`);
        try {
          let inputTuple: [number, string] = [10, 'Hello'];
          const task = new taskpool.Task(taskPoolArgTuple, inputTuple);
          await taskpool.execute(task).then((value: Any) => {
            expect(`[${value as [number, string]}]`).assertEqual('[20,Helloprocessed]');
          });
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });
    /**
     * @tc.number SUB_TASKPOOL_TEST_0600
     * @tc.name TaskPoolTest006
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('TaskPoolTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskPoolTest006';
        console.info(`${TAG} test start`);
        let taskFlag = false;
        try {
          await taskpool.execute(taskPoolArgFun, simpleCallback).then((value: Any) => {
            taskFlag = true;
          });
          expect(taskFlag).assertTrue();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });
    /**
     * @tc.number SUB_TASKPOOL_TEST_0700
     * @tc.name TaskPoolTest007
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('TaskPoolTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG: string = "TaskPoolTest007";
        console.info(`${TAG} test start`);
        let sendableA1: SendableA = new SendableA();
        try {
          let task1: taskpool.Task = new taskpool.Task(sendableAFunc, sendableA1);
          await taskpool.execute(task1).then((value: Any) => {
            expect(value as number).assertEqual(20);
          })
        } catch (error) {
          error = error as Error;
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });
    /**
     * @tc.number SUB_TASKPOOL_TEST_0800
     * @tc.name TaskPoolTest008
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('TaskPoolTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG: string = "TaskPoolTest008";
        console.info(`${TAG} test start`);
        let sendAble: SendAbleClassB = new SendAbleClassB();
        try {
          let task1: taskpool.Task = new taskpool.Task(SendAbleClassB.add, 'test');
          await taskpool.execute(task1).then((value: Any) => {
            expect(value as number).assertEqual(21);
          })
        } catch (error) {
          error = error as Error;
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_TASKPOOL_TEST_0900
     * @tc.name TaskPoolTest009
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("TaskPoolTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskPoolTest009';
        console.info(`${TAG} test start`);
        try {
          const task: taskpool.Task = new taskpool.Task(noParamNoReturnTask);
          await taskpool.execute(task);
          expect(false).assertFail();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(err.message).assertEqual("Intentionally thrown error from task");
        }
        console.info(`${TAG} test end`);
        done();
      })

    /**
     * @tc.number SUB_TASKPOOL_TEST_1000
     * @tc.name TaskPoolTest010
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("TaskPoolTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskPoolTest010';
        console.info(`${TAG} test start`);
        try {
          const task = new taskpool.Task(noParamReturnUndefinedTask);
          await taskpool.execute(task).then((value: Any) => {
            expect(value as undefined).assertEqual(undefined);
          })
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      })

    /**
     * @tc.number SUB_TASKPOOL_TEST_1100
     * @tc.name TaskPoolTest011
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("TaskPoolTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskPoolTest011';
        console.info(`${TAG} test start`);
        try {
          const task = new taskpool.Task(nullParamNoReturnTask, null);
          await taskpool.execute(task)
          expect(nullParam).assertEqual(true);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      })

    /**
     * @tc.number SUB_TASKPOOL_TEST_1200
     * @tc.name TaskPoolTest012
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("TaskPoolTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskPoolTest012';
        console.info(`${TAG} test start`);
        const inputValue: long = 20;
        const expectedValue: long = 41;
        console.info(TAG, 'test begin with input: ' + inputValue);
        try {
          const task = new taskpool.Task(processLongValue, inputValue);
          await taskpool.execute(task).then((value: Any) => {
            expect(value as long).assertEqual(expectedValue);
          })
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TEST_1300
     * @tc.name TaskPoolTest013
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("TaskPoolTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskPoolTest013';
        console.info(`${TAG} test start`);
        try {
          const testId: int = 1005;
          const testName: string = "TestObject";
          const task = new taskpool.Task(
            (id: int, name: string) => {
              return TestObject.create(id, name);
            },
            testId,
            testName
          );
          const instance = await taskpool.execute(task) as TestObject;
          expect(instance.getId()).assertEqual(testId);
          expect(instance.getName()).assertEqual(testName);
          expect(instance.getInfo()).assertEqual(`${testId}_${testName}`);
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
     * @tc.number SUB_TASKPOOL_TEST_1400
     * @tc.name TaskPoolTest014
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("TaskPoolTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskPoolTest014';
        console.info(`${TAG} test start`);
        try {
          let task1: taskpool.Task = new taskpool.Task(
            taskWrapper,
            Promise.resolve('success')
          );
          await taskpool.execute(task1)
            .then((value: Any) => {
              console.info("Async task result: " + value);
              expect(value as string).assertEqual('success');
            })
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TEST_1500
     * @tc.name TaskPoolTest015
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('TaskPoolTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskPoolTest015';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        worker.start();
        const containerOperation = (): void => {
          console.log(`${TAG}: Container operation executed`);
        };
        try {
          const task = new taskpool.Task(containerOperation);
          const executePromise = worker.run<Promise<Any>>(() => {
            return taskpool.execute(task);
          });
          await executePromise.Await();
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
     * @tc.number SUB_TASKPOOL_TEST_1600
     * @tc.name TaskPoolTest016
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("TaskPoolTest016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskPoolTest016';
        console.info(`${TAG} test start`);
        try {
          await taskpool.execute(createNoParamInstance).then((instance: Any) => {
            expect((instance as NoParamConstructor).getValue()).assertEqual(100);
          })
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TEST_1700
     * @tc.name TaskPoolTest017
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("TaskPoolTest017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskPoolTest017';
        console.info(`${TAG} test start`);
        try {
          await taskpool.execute(createParamTestClass, 'TestName')
            .then((instance: Any) => {
              const instanceTask = (instance as ParamTestClass).getName();
              expect(instanceTask).assertEqual('TestName');
            })
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done()
      });

    /**
     * @tc.number SUB_TASKPOOL_TEST_1800
     * @tc.name TaskPoolTest018
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("TaskPoolTest018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskPoolTest018';
        console.info(`${TAG} test start`);
        try {
          await taskpool.execute(StaticClass.staticMethodWithoutReturn).then(() => {
            console.info("Static method execution completed");
            expect(taskPool010).assertTrue();
          })
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TEST_1900
     * @tc.name TaskPoolTest019
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("TaskPoolTest019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskPoolTest019';
        console.info(`${TAG} test start`);
        const inputValue = "testInput";
        const expectedOutput = "Processed: testInput";
        try {
          const result = await taskpool.execute(StaticClass11.staticMethodWithParamsAndReturn, inputValue) as string;
          console.info(`Static method returned: ${result}`);
          expect(result).assertEqual(expectedOutput);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TEST_2000
     * @tc.name TaskPoolTest020
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("TaskPoolTest020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskPoolTest020';
        console.info(`${TAG} test start`);
        try {
          const testInstance = new TestClass();
          await taskpool.execute(testInstance.methodWithoutParams);
          console.info("methodWithoutParams executed successfully");
          expect(taskPool012).assertTrue();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TEST_2100
     * @tc.name TaskPoolTest021
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("TaskPoolTest021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskPoolTest021';
        console.info(`${TAG} test start`);
        try {
          const testInstance = new TestClass1();
          const result = await taskpool.execute(testInstance.methodWithParams, 50.0) as string;
          console.info("methodWithParams result: " + result);
          expect(result).assertEqual('50');
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TEST_2200
     * @tc.name TaskPoolTest022
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("TaskPoolTest022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskPoolTest022';
        console.info(`${TAG} test start`);
        try {
          const task = new taskpool.Task(noParamNoReturnFunc);
          await taskpool.execute(task).then(() => {
            console.info("Constructed task execution completed");
            expect(taskPool014).assertTrue();
          });
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
     * @tc.number SUB_TASKPOOL_TEST_2300
     * @tc.name TaskPoolTest023
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("TaskPoolTest023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskPoolTest023';
        console.info(`${TAG} test start`);
        try {
          const task = new taskpool.Task(() => {
            console.info("Boolean Task executed");
            return true;
          }, 'BooleanTask');

          const result = await taskpool.execute(task, taskpool.Priority.MEDIUM) as Boolean;
          console.info("Single execution task completed");
          expect(result).assertTrue();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TEST_2400
     * @tc.name TaskPoolTest024
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("TaskPoolTest024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskPoolTest024';
        console.info(`${TAG} test start`);
        const ResultTuple: [bigint, number] = [10n, 20];
        try {
          const processValues = (value: bigint, count: number): [bigint, number] => {
            console.info(`Processing with value=${value}, count=${count}`);
            ResultTuple[0] = value;
            ResultTuple[1] = count;
            return ResultTuple;
          };
          hilog.info(0x0000, TAG, '%{public}s', "====>JZL currentTime: " + processValues);
          const task = new taskpool.Task(
            processValues,
            32767n,
            Number(5)
          );
          const result = await taskpool.execute(task, taskpool.Priority.MEDIUM) as [bigint, number];
          expect(result[0]).assertEqual(32767n);
          expect(result[1]).assertEqual(5);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TASKPOOL_TEST_2500
     * @tc.name TaskPoolTest025
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("TaskPoolTest025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'taskPoolAsyncTest025';
        console.info(`${TAG} test start`);
        try {
          const byteFunc = (): number => {
            console.info("Byte function executed");
            return 0x7F;
          };
          const task = new taskpool.Task(byteFunc);
          const rawResult = await taskpool.execute(task, taskpool.Priority.MEDIUM) as number;
          const numericResult = rawResult;
          console.info(`Byte task completed with result: ${numericResult}`);
          expect(numericResult).assertEqual(127);

        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TOSTRING_TEST_2600
     * @tc.name TaskPoolTest026
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('TaskPoolTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskPoolTest026';
        console.info(`${TAG} test start`);
        let executedFlag = false;
        const voidFunction = (): void => {
          executedFlag = true;
        };
        try {
          await taskpool.execute(voidFunction);
          expect(executedFlag).assertEqual(true);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });
    /**
     * @tc.number SUB_TOSTRING_TEST_2700
     * @tc.name TaskPoolTest027
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('TaskPoolTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskPoolTest027';
        console.info(`${TAG} test start`);
        const bigIntFunction = (): BigInt => {
          return BigInt(1234567890n);
        };
        try {
          const result = await taskpool.execute(bigIntFunction) as bigint;
          expect(result).assertEqual(BigInt(1234567890n));
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });
    /**
     * @tc.number SUB_TOSTRING_TEST_2800
     * @tc.name TaskPoolTest028
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('TaskPoolTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskPoolTest028';
        console.info(`${TAG} test start`);
        let executedFlag = false;
        let receivedChar: string | null = null;
        const charConsumer = (charParam: string): void => {
          executedFlag = true;
          receivedChar = charParam;
        };
        try {
          const testChar = 'A';
          await taskpool.execute(() => {
            charConsumer(testChar)
          });
          expect(executedFlag).assertEqual(true);
          expect(receivedChar).assertEqual(testChar);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });
    /**
     * @tc.number SUB_TOSTRING_TEST_2900
     * @tc.name TaskPoolTest029
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('TaskPoolTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskPoolTest029';
        console.info(`${TAG} test start`);
        const inputLiteral: TestLiteral = 'A';
        const processLiteral = (literal: TestLiteral): TestLiteral => {
          return literal === 'A' ? 'B' : literal;
        };
        try {
          const result = await taskpool.execute(processLiteral, inputLiteral) as TestLiteral;
          expect(result).assertEqual('B');
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });
    /**
     * @tc.number SUB_TOSTRING_TEST_3000
     * @tc.name TaskPoolTest030
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('TaskPoolTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskPoolTest030';
        console.info(`${TAG} test start`);
        let executedFlag = false;
        const voidFunction = (): void => {
          executedFlag = true;
        };
        try {
          const returnedFunc = await taskpool.execute(voidFunction);
          expect(executedFlag).assertTrue();
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });

    /**
     * @tc.number SUB_TOSTRING_TEST_3100
     * @tc.name TaskPoolTest031
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('TaskPoolTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskPoolTest031';
        console.info(`${TAG} test start`);
        let executedFlag = false;
        let callbackExecuted = false;
        const voidFunction = (callback: () => void): void => {
          executedFlag = true;
          callback();
        };
        const testCallback = (): void => {
          callbackExecuted = true;
        };
        try {
          const taskFunction = () => {
            voidFunction(testCallback);
            return 'Task completed';
          };
          const executionResult = await taskpool.execute(taskFunction) as string;
          expect(executedFlag).assertTrue();
          expect(callbackExecuted).assertTrue();
          expect(executionResult).assertEqual('Task completed');
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
     * @tc.number SUB_TOSTRING_TEST_3200
     * @tc.name TaskPoolTest032
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('TaskPoolTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskPoolTest032';
        console.info(`${TAG} test start`);
        const obj = new MyClass();
        const optionalParam = 'testName';
        const voidFunction = (target: MyClass, optionalParam?: string): MyClass => {
          target.setName(optionalParam ? optionalParam : 'default');
          return target;
        };
        try {
          const result = await taskpool.execute(voidFunction, obj, optionalParam);
          expect(obj.name).assertEqual(optionalParam);
          const defaultResult = await taskpool.execute(voidFunction, new MyClass(), 'default').catch((err: Error) => {
            console.error(`${TAG} catch: code =>  message => ${err.message}`);
          });
          expect((defaultResult as MyClass).name).assertEqual('default');
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });


    /**
     * @tc.number SUB_TOSTRING_TEST_3300
     * @tc.name TaskPoolTest033
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('TaskPoolTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskPoolTest033';
        console.info(`${TAG} test start`);
        const statusFunction = (task: Task): TaskStatus => {
          return task.status;
        };
        try {
          const testTask = new Task(TaskStatus.RUNNING);
          const result = await taskpool.execute(statusFunction, testTask) as TaskStatus;
          expect(result).assertEqual(TaskStatus.RUNNING);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });


    /**
     * @tc.number SUB_TOSTRING_TEST_3400
     * @tc.name TaskPoolTest034
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('TaskPoolTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskPoolTest034';
        console.info(`${TAG} test start`);
        let executedFlag1 = false;
        let executedFlag2 = false;
        try {
          const worker = new EAWorker();
          worker.start();
          const workerPromise = taskpool.execute(async (worker: EAWorker): Promise<EAWorker> => {
            worker.run<void>((): void => {
              executedFlag1 = true;
            }).Await();
            return worker;
          }, worker);
          await workerPromise.then((value: Any): void => {
            const returnedWorker: EAWorker = value as EAWorker;
            returnedWorker.run<EAWorker>((): EAWorker => {
              executedFlag2 = true;
              return returnedWorker;
            }).Await();
          })
          worker.join()
          expect(executedFlag1).assertEqual(true);
          expect(executedFlag2).assertEqual(true);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });


    /**
     * @tc.number SUB_TOSTRING_TEST_3500
     * @tc.name TaskPoolTest035
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('TaskPoolTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskPoolTest035';
        console.info(`${TAG} test start`);
        try {
          const taskFunc = (param?: int): taskpool.Task => {
            return new taskpool.Task((value: int) => {
              console.info(`Task executed with param: ${value}`);
              return value;
            }, param ?? 20 as int);
          };
          const task = taskFunc();
          await taskpool.execute(task).then((value: Any) => {
            expect(value as int).assertEqual(20);
          });
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
     * @tc.number SUB_TOSTRING_TEST_3600
     * @tc.name TaskPoolTest036
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('TaskPoolTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskPoolTest036';
        console.info(`${TAG} test start`);
        try {
          const result = await taskpool.execute((param: Object | undefined): Object | null => {
            if (param === undefined) {
              return null;
            }
            return param;
          }, undefined) as null;
          console.info("taskPoolValue result: " + result);
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
     * @tc.number SUB_TOSTRING_TEST_3700
     * @tc.name TaskPoolTest037
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('TaskPoolTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskPoolTest037';
        console.info(`${TAG} test start`);
        let task1 = true;
        try {
          const task = new taskpool.Task(() => {
            task1 = false;
            console.info("Task executed after delay");
          });
          taskpool.executePeriodically(
            100 as Int,
            task,
            taskpool.Priority.MEDIUM
          );
          console.info("Delayed task completed");
          await new Promise<void>((resolve) => {
            setTimeout(() => {
              resolve(undefined)
            }, 50);
          });
          expect(task1).assertEqual(true);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });


    /**
     * @tc.number SUB_TOSTRING_TEST_3800
     * @tc.name TaskPoolTest038
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('TaskPoolTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskPoolTest038';
        console.info(`${TAG} test start`);
        let task1 = true;
        try {
          const task = new taskpool.Task(() => {
            task1 = false;
            console.info("Task executed after delay");
          });
          taskpool.executePeriodically(
            100 as Int,
            task,
            taskpool.Priority.MEDIUM
          );
          await new Promise<void>((resolve) => {
            setTimeout(() => {
              resolve(undefined);
            }, 150);
          });
          expect(task1).assertEqual(false);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });


    /**
     * @tc.number SUB_TOSTRING_TEST_3900
     * @tc.name TaskPoolTest039
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('TaskPoolTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskPoolTest039';
        console.info(`${TAG} test start`);
        let taskValue: boolean = false;
        try {
          const task = new taskpool.Task(async (byteValue: Byte): Promise<Object> => {
            return new Promise<Object>((resolve) => {
              setTimeout(() => {
                taskValue = true;
                resolve(byteValue * 2);
              }, 10);
            });
          });
          taskpool.executePeriodically(
            -100 as Int,
            task
          );
          expect(false).assertEqual(true);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
        } finally {
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_TOSTRING_TEST_4000
     * @tc.name TaskPoolTest040
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('TaskPoolTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskPoolTest040';
        console.info(`${TAG} test start`);
        let executedFlag = false;
        const longTaskFunction = async (input: long): Promise<long> => {
          executedFlag = true;
          return new Promise<long>((resolve) => {
            setTimeout(() => {
              const result = input * 2;
              console.log(`${TAG}: Task completed with result ${result}`);
              resolve(result);
            }, 100);
          });
        };
        try {
          const inputValue: long = 42;
          const expectedResult: long = inputValue * 2;
          const result = await taskpool.execute(longTaskFunction, inputValue) as long;
          console.log(`${TAG}: Got result ${result}`);
          expect(executedFlag).assertTrue();
          expect(result).assertEqual(expectedResult);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      });


    /**
     * @tc.number SUB_TOSTRING_TEST_4100
     * @tc.name TaskPoolTest041
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('TaskPoolTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskPoolTest041';
        console.info(`${TAG} test start`);
        let executedFlag = false;
        const voidFunction = (): void => {
          executedFlag = true;
        };
        try {
          const task: taskpool.Task = new taskpool.Task(voidFunction);
          await taskpool.execute(task, taskpool.Priority.HIGH);
          expect(executedFlag).assertEqual(true);
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      })
    /**
     * @tc.number SUB_TOSTRING_TEST_4200
     * @tc.name TaskPoolTest042
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('TaskPoolTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskPoolTest042';
        console.info(`${TAG} test start`);
        let taskName: string = "taskName";
        try {
          const task: taskpool.Task = new taskpool.Task(taskName,
            () => {
              console.info("GenericsTask with no parameters and no return executed");
            });

          const result = await taskpool.execute(task, taskpool.Priority.MEDIUM);
          console.info(`Task "${task.name}" execution completed`);
          expect(task.name).assertEqual('taskName');
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      })

    /**
     * @tc.number SUB_TOSTRING_TEST_4300
     * @tc.name TaskPoolTest043
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('TaskPoolTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskPoolTest043';
        console.info(`${TAG} test start`);
        let testTuple: [number, string] = [10, 'Hello'];
        try {
          const task = new taskpool.Task(taskArgTuple, testTuple);
          await taskpool.execute(task, taskpool.Priority.HIGH).then((value: Any) => {
            expect(`[${value as [number, string]}]`).assertEqual('[20,processed]');
          })
        } catch (err) {
          err = err as Error;
          console.error(`${TAG} catch error: code =>  message => ${err.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`);
          done();
        }
      })
  })
}