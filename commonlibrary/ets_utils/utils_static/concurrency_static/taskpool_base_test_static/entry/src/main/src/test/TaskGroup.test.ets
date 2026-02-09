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

function TaskGroup001(): void {
}

function TaskGroup002(): Promise<Char> {
  return new Promise<Char>(resolve => {
    setTimeout(() => {
      resolve(Int.toChar(2));
    }, 1000);
  })
}

export class MySendAbleClass {
  name: string;

  constructor(name: string) {
    this.name = name;
  }
}

let taskFlag1 = false;

function TaskGroup003(dataClass: MySendAbleClass, dataInt?: number) {
  taskFlag1 = true;
}

function TaskGroup004(data: number | null | undefined): Double {
  return 2 as Double;
}

function TaskGroup005(name: string): string {
  return name;
}

export default function taskPoolTest() {
  describe('taskGroupTest', (): void => {
    /**
     * @tc.number SUB_TASKGROUP_TEST_0100
     * @tc.name TaskGroupTest001
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("TaskGroupTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskGroupTest001';
        console.info(`${TAG} test start`);
        let taskFlag = false;
        try {
          let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
          let task: taskpool.Task = new taskpool.Task(TaskGroup001);
          taskGroup.addTask(task);
          await taskpool.execute(taskGroup).then((res:Any) => {
            taskFlag = true;
          });
          expect(taskFlag).assertEqual(true);
        } catch (error) {
          error = error as Error;
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      })
    /**
     * @tc.number SUB_TASKGROUP_TEST_0200
     * @tc.name TaskGroupTest002
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("TaskGroupTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskGroupTest002';
        console.info(`${TAG} test start`);
        try {
          let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
          let task: taskpool.Task = new taskpool.Task(TaskGroup002);
          taskGroup.addTask(task);
          await taskpool.execute(taskGroup).then((res:Any) => {
            expect((res as Array<Char>)[0]).assertEqual(2);
          });
        } catch (error) {
          error = error as Error;
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      })
    /**
     * @tc.number SUB_TASKGROUP_TEST_0300
     * @tc.name TaskGroupTest003
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("TaskGroupTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskGroupTest003';
        console.info(`${TAG} test start`);
        try {
          let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
          let task: taskpool.Task = new taskpool.Task(TaskGroup003, new MySendAbleClass("test"), Number(1));
          taskGroup.addTask(task);
          await taskpool.execute(taskGroup).catch((err:Error)=>{
            console.error(`${TAG} catch: code =>  message => ${err.message}`);
          });
          expect(taskFlag1).assertEqual(true);
        } catch (error) {
          error = error as Error;
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      })

    /**
     * @tc.number SUB_TASKGROUP_TEST_0400
     * @tc.name TaskGroupTest004
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("TaskGroupTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskGroupTest004';
        console.info(`${TAG} test start`);
        try {
          let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
          let task: taskpool.Task = new taskpool.Task(TaskGroup004, undefined);
          taskGroup.addTask(task);
          await taskpool.execute(taskGroup).then((res:Any) => {
            expect((res as Array<Double>)[0]).assertEqual(2);
          });
        } catch (error) {
          error = error as Error;
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      })
    /**
     * @tc.number SUB_TASKGROUP_TEST_0500
     * @tc.name TaskGroupTest005
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("TaskGroupTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'TaskGroupTest005';
        console.info(`${TAG} test start`);
        try {
          let taskName: string = "taskName";
          let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
          let task: taskpool.Task = new taskpool.Task(taskName, TaskGroup005, 'taskPoolName');
          let name = task.name as string;
          expect(name).assertEqual(taskName);
          taskGroup.addTask(task);
          await taskpool.execute(taskGroup, taskpool.Priority.LOW).then((res:Any) => {
            expect((res as Array<string>)[0]).assertEqual('taskPoolName');
          });
        } catch (error) {
          error = error as Error;
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        }
        console.info(`${TAG} test end`);
        done();
      })
  })
}