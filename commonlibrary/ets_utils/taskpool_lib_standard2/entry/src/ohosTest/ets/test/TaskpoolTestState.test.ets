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
import { describe, it, expect, afterEach } from '@ohos/hypium';
import taskpool from '@ohos.taskpool';
import { BusinessError } from '@ohos.base';
import { printLang, AdditionDelay } from '../utils';

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

export default function TaskpoolTestState() {
  describe('ActsTaskPoolStateTest', () => {

    afterEach(async () => {
      await asyncSleep(1000);
    })
    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_4500
     * @tc.name      : testTaskpoolState001
     * @tc.desc      : Perform serial tasks
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolState001', 0, async (done: Function) => {
      const caseName: string = 'testTaskpoolState001';
      console.info(`${caseName} test start`);
      try {
        let testTask1: taskpool.Task = new taskpool.Task("task1", AdditionDelay, 100);
        await taskpool.execute(testTask1);
        const taskInfo1: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        console.info(`${caseName}: testTask1 taskInfo1: ${JSON.stringify(taskInfo1)}`);
        const state1: taskpool.State = taskInfo1.taskInfos[0]?.state;
        console.info(`${caseName}: state1: ${state1}`);
        expect(state1).assertEqual(6);

        let testTask2: taskpool.Task = new taskpool.Task("task2", AdditionDelay, 100);
        await taskpool.execute(testTask2);
        const taskInfo2: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        console.info(`${caseName}: testTask2 taskInfo2: ${JSON.stringify(taskInfo2)}`);
        const state2: taskpool.State = taskInfo2.taskInfos[0]?.state;
        console.info(`${caseName}: state2: ${state2}`);
        expect(state2).assertEqual(6);

        let testTask3: taskpool.Task = new taskpool.Task("task3", AdditionDelay, 100);
        await taskpool.execute(testTask3);
        const taskInfo3: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        console.info(`${caseName}: testTask3 taskInfo3: ${JSON.stringify(taskInfo3)}`);
        const state3: taskpool.State = taskInfo3.taskInfos[0]?.state;
        console.info(`${caseName}: state3: ${state3}`);
        expect(state3).assertEqual(6);
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_Runtime_Language_Backend_TaskpoolConcurrency_4500
     * @tc.name      : testTaskpoolState002
     * @tc.desc      : Perform serial tasks
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testTaskpoolState002', 0, async (done: Function) => {
      const caseName: string = 'testTaskpoolState002';
      console.info(`${caseName} test start`);
      try {
        let testTask: taskpool.Task = new taskpool.Task("task1", AdditionDelay, 100);
        taskpool.execute(testTask);
        let taskInfo: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        console.info(`${caseName}: stateing taskInfo: ${JSON.stringify(taskInfo)}`);
        const state: taskpool.State = taskInfo.taskInfos[0]?.state;
        console.info(`${caseName}: state: ${state}`);
        expect(state == 1 || state == 2).assertTrue();
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