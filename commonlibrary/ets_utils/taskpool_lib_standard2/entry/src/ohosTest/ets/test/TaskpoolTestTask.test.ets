/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { describe, it, expect, afterEach, TestType, Size, Level} from '@ohos/hypium';
import taskpool from '@ohos.taskpool';
import { BusinessError } from '@ohos.base';
import { additionF, printArgs } from '../utils';

const asyncSleep: Function = (time: number): Promise<Object> => {
  return new Promise(resolve => setTimeout(resolve, time));
}
const promiseCase: Function = () => {
  let p: Promise<void | Object> = new Promise((resolve: Function, reject: Function) => {
    setTimeout(() => {
      resolve(0);
    }, 100);
  });
  return p;
}

export default function TaskpoolTestTask() {
  describe('ActsTaskPoolTaskTest', () => {

    afterEach(async () => {
      await asyncSleep(1000);
    })
    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_4600
     * @tc.name      : testTaskpoolTask001
     * @tc.desc      : Perform serial tasks
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testTaskpoolTask001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testTaskpoolTask001';
      console.info(`${caseName} test start`);
      try {
        let isTerminate1: boolean = false;
        let isTerminate2: boolean = false;
        let testTask1: taskpool.Task = new taskpool.Task(printArgs, 100);
        let testTask2: taskpool.Task = new taskpool.Task(printArgs, 200);
        let taskgroup1: taskpool.TaskGroup = new taskpool.TaskGroup('name');
        taskgroup1.addTask(testTask2);
        taskpool.execute(testTask1).then((res: Object) => {
          console.info(`${caseName}: testTask1 return value: ${JSON.stringify(res)}`);
          isTerminate1 = true;
        });
        taskpool.execute(taskgroup1).then((res: Object) => {
          console.info(`${caseName}: testTask2 return value: ${JSON.stringify(res)}`);
          isTerminate2 = true;
        });
        while (!(isTerminate1 && isTerminate2)) {
          await promiseCase();
        }
        console.info(`${caseName}: ${JSON.stringify(typeof (testTask1.function))}`);
        expect(typeof (testTask1.function) == 'function').assertTrue();
        expect(testTask1.arguments).assertDeepEquals([100]);
        expect(typeof (testTask1.name) == 'string').assertTrue();
        expect(typeof (testTask1.totalDuration) == 'number').assertTrue();
        expect(testTask1.totalDuration != -1).assertTrue();
        expect(typeof (testTask1.ioDuration) == 'number').assertTrue();
        expect(testTask1.ioDuration != -1).assertTrue();
        expect(typeof (testTask1.cpuDuration) == 'number').assertTrue();
        expect(testTask1.cpuDuration != -1).assertTrue();
        console.info(`${caseName}: ${JSON.stringify(typeof (taskgroup1.name))}`);
        expect(typeof (taskgroup1.name) == 'string').assertTrue();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      try {
        let isTerminate1: boolean = false;
        let isTerminate2: boolean = false;
        let isTerminate3: boolean = false;
        let testTask1: taskpool.Task = new taskpool.Task(printArgs, 100);
        let testTask2: taskpool.Task = new taskpool.Task(printArgs, 200);
        let testTask3: taskpool.Task = new taskpool.Task(printArgs, 300);
        taskpool.execute(testTask1).then((res: Object) => {
          console.info(`${caseName}: testTask1 return value: ${JSON.stringify(res)}`);
          isTerminate1 = true;
        });
        taskpool.execute(testTask2).then((res: Object) => {
          console.info(`${caseName}: testTask2 return value: ${JSON.stringify(res)}`);
          isTerminate2 = true;
        });
        taskpool.execute(testTask3).then((res: Object) => {
          isTerminate3 = true;
        });
        const taskInfo_0: taskpool.TaskInfo = taskpool.getTaskPoolInfo().taskInfos[0];
        while (!(isTerminate1 && isTerminate2 || isTerminate3)) {
          await promiseCase();
        }
        const type_taskId: string = typeof (taskInfo_0.taskId);
        console.info(`${caseName}: result1 taskId: ${JSON.stringify(type_taskId)}`);
        expect(type_taskId == 'number').assertTrue();
        const type_state: string = typeof (taskInfo_0.state);
        console.info(`${caseName}: result1 state: ${JSON.stringify(type_state)}`);
        expect(type_state == 'number').assertTrue();
        const type_duration: string = typeof (taskInfo_0.duration);
        expect(type_duration == 'number').assertTrue();
        const type_name: string = typeof (taskInfo_0.name);
        expect(type_name == 'string').assertTrue();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      try {
        let isTerminate1: boolean = false;
        let isTerminate2: boolean = false;
        let isTerminate3: boolean = false;
        let testTask1: taskpool.Task = new taskpool.Task(printArgs, 100);
        let testTask2: taskpool.Task = new taskpool.Task(printArgs, 200);
        let testTask3: taskpool.Task = new taskpool.Task(printArgs, 300);
        taskpool.execute(testTask1).then((res: Object) => {
          console.info(`${caseName}: testTask1 return value: ${JSON.stringify(res)}`);
          isTerminate1 = true;
        });
        taskpool.execute(testTask2).then((res: Object) => {
          console.info(`${caseName}: testTask2 return value: ${JSON.stringify(res)}`);
          isTerminate2 = true;
        });
        taskpool.execute(testTask3).then((res: Object) => {
          console.info(`${caseName}: testTask3 return value: ${JSON.stringify(res)}`);
          isTerminate3 = true;
        });
        while (!(isTerminate1 && isTerminate2 || isTerminate3)) {
          await promiseCase();
        }
        const threadInfos: taskpool.ThreadInfo = taskpool.getTaskPoolInfo().threadInfos[0];
        const type_tid: string = typeof (threadInfos.tid);
        const type_priority: string = typeof (threadInfos.priority)
        expect(type_tid === 'number').assertTrue();
        expect(Array.isArray(threadInfos.taskIds)).assertTrue();
        expect(type_priority === 'number').assertTrue();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      try {
        let isTerminate1: boolean = false;
        let testTask1: taskpool.Task = new taskpool.Task(printArgs, 100);
        let testTask2: taskpool.Task = new taskpool.Task(printArgs, 200);
        let testTask3: taskpool.Task = new taskpool.Task(printArgs, 300);
        taskpool.execute(testTask1).then((res: Object) => {
          console.info(`${caseName}: testTask1 return value: ${JSON.stringify(res)}`);
          isTerminate1 = true;
        });
        taskpool.execute(testTask2).then((res: Object) => {
          console.info(`${caseName}: testTask2 return value: ${JSON.stringify(res)}`);
        });
        taskpool.execute(testTask3).then((res: Object) => {
          console.info(`${caseName}: testTask3 return value: ${JSON.stringify(res)}`);
        });
        const taskPoolInfo: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        while (!(isTerminate1)) {
          await promiseCase();
        }
        expect(Array.isArray(taskPoolInfo.threadInfos)).assertTrue();
        expect((taskPoolInfo.threadInfos).length != 0).assertTrue();
        expect(Array.isArray(taskPoolInfo.taskInfos)).assertTrue();
        expect((taskPoolInfo.taskInfos).length != 0).assertTrue();
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });
  });
}