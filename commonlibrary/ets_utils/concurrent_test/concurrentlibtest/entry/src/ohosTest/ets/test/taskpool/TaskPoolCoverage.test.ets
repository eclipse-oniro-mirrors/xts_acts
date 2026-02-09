/*
* Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { taskpool } from '@kit.ArkTS';
import assertNaN from '@ohos/hypium/src/main/module/assert/assertNaN';

// 测试函数定义
@Concurrent
function simpleFunc(arg: number): number {
  return arg * 2;
}

@Concurrent
function multiArgFunc(a: number, b: number, c: number): number {
  return a + b + c;
}

@Concurrent
function noArgFunc(): number {
  return 42;
}

@Concurrent
function send(arg: number): number {
  try {
    taskpool.Task.sendData(arg)
  } catch (error) {
  }
  return arg * 2;
}

@Concurrent
function promiseTask(arg: number): Promise<number> {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve(arg * 2);
    }, 100);
  });
}

export default function taskPoolCoverageTest() {
  describe('TaskPoolCoverageTest', () => {

    /**
     * @tc.name   testTaskSetTransferListWithNull
     * @tc.number SUB_CONCURRENCY_TASKPOOL_SETTRANSFERLIST_NULL_001
     * @tc.desc   Test Task.setTransferList with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTaskSetTransferListWithNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      let tag = "testTaskSetTransferListWithNull"
      console.log(`${tag} test start.`)
      const task = new taskpool.Task(simpleFunc, 1);
      try {
        task.setTransferList(null);
        const result = await taskpool.execute(task);
      } catch (error) {
        console.log(`${tag} test catch: ${error.code}`)
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   testTaskSetTransferListWithUndefined
     * @tc.number SUB_CONCURRENCY_TASKPOOL_SETTRANSFERLIST_PARAM_002
     * @tc.desc   Test Task.setTransferList with undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTaskSetTransferListWithUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        let tag = "testTaskSetTransferListWithUndefined"
        console.log(`${tag} test start.`)
        const task = new taskpool.Task(simpleFunc, 1);
        try {
          task.setTransferList(undefined);
          const result = await taskpool.execute(task);
        } catch (error) {
          console.log(`${tag} test catch: ${error.code}`)
          expect(error.code).assertEqual(401);
          done();
        }
      });

    /**
     * @tc.name   testTaskSetCloneListWithNull
     * @tc.number SUB_CONCURRENCY_TASKPOOL_SETCLONELIST_PARAM_001
     * @tc.desc   Test Task.setCloneList with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTaskSetCloneListWithNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      let tag = "testTaskSetCloneListWithNull"
      console.log(`${tag} test start.`)
      const task = new taskpool.Task(simpleFunc, 1);
      try {
        task.setCloneList(null);
        const result = await taskpool.execute(task);
      } catch (error) {
        console.log(`${tag} test catch: ${error.code}`)
        expect(error.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   testTaskSetCloneListWithUndefined
     * @tc.number SUB_CONCURRENCY_TASKPOOL_SETCLONELIST_PARAM_002
     * @tc.desc   Test Task.setCloneList with undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTaskSetCloneListWithUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        let tag = "testTaskSetCloneListWithUndefined"
        console.log(`${tag} test start.`)
        const task = new taskpool.Task(simpleFunc, 1);
        try {
          task.setCloneList(undefined);
          const result = await taskpool.execute(task);
        } catch (error) {
          console.log(`${tag} test catch: ${error.code}`)
          expect(error.code).assertEqual(401);
          done();
        }
      });

    /**
     * @tc.name   testTaskOnReceiveDataWithNull
     * @tc.number SUB_CONCURRENCY_TASKPOOL_ONRECEIVEDATA_PARAM_001
     * @tc.desc   Test Task.onReceiveData with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTaskOnReceiveDataWithNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      let tag = "testTaskOnReceiveDataWithNull"
      console.log(`${tag} test start.`)
      const task = new taskpool.Task(send, 1);
      try {
        task.onReceiveData(null);
        const result = await taskpool.execute(task);
      } catch (error) {
        console.log(`${tag} test catch: ${error.code}`)
        expect(error.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   testTaskOnReceiveDataWithUndefined
     * @tc.number SUB_CONCURRENCY_TASKPOOL_ONRECEIVEDATA_PARAM_002
     * @tc.desc   Test Task.onReceiveData with undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTaskOnReceiveDataWithUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        let tag = "testTaskOnReceiveDataWithUndefined"
        console.log(`${tag} test start.`)
        const task = new taskpool.Task(send, 1);
        try {
          task.onReceiveData(undefined);
          const result = await taskpool.execute(task);
        } catch (error) {
          console.log(`${tag} test catch: ${error.code}`)
          expect(error.code).assertEqual(401);
          done();
        }
      });

    /**
     * @tc.name   testTaskGroupAddDependencyWithNull
     * @tc.number SUB_CONCURRENCY_TASKGROUP_ADDDEPENDENCY_PARAM_001
     * @tc.desc   Test TaskGroup.addDependency with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTaskGroupAddDependencyWithNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        let tag = "testTaskGroupAddDependencyWithNull"
        console.log(`${tag} test start.`)
        const task1 = new taskpool.Task(simpleFunc, 1);
        try {
          task1.addDependency(null);
          await taskpool.execute(task1);
        } catch (error) {
          console.log(`${tag} test catch: ${error.code}`)
          expect(error.code).assertEqual(401);
          done();
        }
      });

    /**
     * @tc.name   testTaskGroupAddDependencyWithUndefined
     * @tc.number SUB_CONCURRENCY_TASKGROUP_ADDDEPENDENCY_PARAM_002
     * @tc.desc   Test TaskGroup.addDependency with undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTaskGroupAddDependencyWithUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        let tag = "testTaskGroupAddDependencyWithUndefined"
        console.log(`${tag} test start.`)
        const task1 = new taskpool.Task(simpleFunc, 1);
        try {
          task1.addDependency(undefined);
          await taskpool.execute(task1);
        } catch (error) {
          console.log(`${tag} test catch: ${error.code}`)
          expect(error.code).assertEqual(401);
          done();
        }
      });

    /**
     * @tc.name   testTaskGroupRemoveDependencyWithNull
     * @tc.number SUB_CONCURRENCY_TASKGROUP_REMOVEDEPENDENCY_PARAM_001
     * @tc.desc   Test TaskGroup.removeDependency with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTaskGroupRemoveDependencyWithNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        let tag = "testTaskGroupRemoveDependencyWithNull"
        console.log(`${tag} test start.`)
        const task1 = new taskpool.Task(simpleFunc, 1);
        try {
          task1.removeDependency(null);
          await taskpool.execute(task1);
        } catch (error) {
          console.log(`${tag} test catch: ${error.code}`)
          expect(error.code).assertEqual(10200027);
          done();
        }
      });

    /**
     * @tc.name   testTaskGroupRemoveDependencyWithUndefined
     * @tc.number SUB_CONCURRENCY_TASKGROUP_REMOVEDEPENDENCY_PARAM_002
     * @tc.desc   Test TaskGroup.removeDependency with undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTaskGroupRemoveDependencyWithUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        let tag = "testTaskGroupRemoveDependencyWithUndefined"
        console.log(`${tag} test start.`)
        const task1 = new taskpool.Task(simpleFunc, 1);
        try {
          task1.removeDependency(undefined);
          await taskpool.execute(task1);
        } catch (error) {
          console.log(`${tag} test catch: ${error.code}`)
          expect(error.code).assertEqual(10200027);
          done();
        }
      });

    /**
     * @tc.name   testTaskGroupAddTaskFuncWithNull
     * @tc.number SUB_CONCURRENCY_TASKGROUP_ADDTASK_PARAM_001
     * @tc.desc   Test TaskGroup.addTask with null function parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTaskGroupAddTaskFuncWithNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        let tag = "testTaskGroupAddTaskFuncWithNull"
        console.log(`${tag} test start.`)
        const group = new taskpool.TaskGroup();
        try {
          group.addTask(null);
          await taskpool.execute(group);
        } catch (error) {
          console.log(`${tag} test catch: ${error.code}`)
          expect(error.code).assertEqual(401);
          done();
        }
      });

    /**
     * @tc.name   testTaskGroupAddTaskFuncWithUndefined
     * @tc.number SUB_CONCURRENCY_TASKGROUP_ADDTASK_PARAM_002
     * @tc.desc   Test TaskGroup.addTask with undefined function parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTaskGroupAddTaskFuncWithUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        let tag = "testTaskGroupAddTaskFuncWithUndefined"
        console.log(`${tag} test start.`)
        const group = new taskpool.TaskGroup();
        try {
          group.addTask(undefined);
          await taskpool.execute(group);
        } catch (error) {
          console.log(`${tag} test catch: ${error.code}`)
          expect(error.code).assertEqual(401);
          done();
        }
      });

    /**
     * @tc.name   testTaskGroupAddTaskWithNull
     * @tc.number SUB_CONCURRENCY_TASKGROUP_ADDTASK_PARAM_003
     * @tc.desc   Test TaskGroup.addTask with null task parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTaskGroupAddTaskWithNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      let tag = "testTaskGroupAddTaskWithNull"
      console.log(`${tag} test start.`)
      const group = new taskpool.TaskGroup();
      try {
        group.addTask(null, 1);
        await taskpool.execute(group);
      } catch (error) {
        console.log(`${tag} test catch: ${error.code}`)
        expect(error.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   testTaskGroupAddTaskWithUndefined
     * @tc.number SUB_CONCURRENCY_TASKGROUP_ADDTASK_PARAM_004
     * @tc.desc   Test TaskGroup.addTask with undefined task parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTaskGroupAddTaskWithUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        let tag = "testTaskGroupAddTaskWithUndefined"
        console.log(`${tag} test start.`)
        const group = new taskpool.TaskGroup();
        try {
          group.addTask(undefined, 1);
          await taskpool.execute(group);
        } catch (error) {
          console.log(`${tag} test catch: ${error.code}`)
          expect(error.code).assertEqual(401);
          done();
        }
      });

    /**
     * @tc.name   testTaskGroupAddTaskWithEmptyArguments
     * @tc.number SUB_CONCURRENCY_TASKGROUP_ADDTASK_PARAM_005
     * @tc.desc   Test TaskGroup.addTask with empty arguments array.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTaskGroupAddTaskWithEmptyArguments', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const task = new taskpool.Task(simpleFunc, []);
        task.arguments = [];
        const group = new taskpool.TaskGroup();
        group.addTask(task);
        const results = await taskpool.execute(group);
        expect(results.length).assertEqual(1);
        done();
      });

    /**
     * @tc.name   testTaskGroupAddTaskWithNonEmptyArguments
     * @tc.number SUB_CONCURRENCY_TASKGROUP_ADDTASK_PARAM_006
     * @tc.desc   Test TaskGroup.addTask with non-empty arguments array.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTaskGroupAddTaskWithNonEmptyArguments', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const task = new taskpool.Task(multiArgFunc, [1, 2, 3]);
        const group = new taskpool.TaskGroup();
        group.addTask(task);
        const results = await taskpool.execute(group);
        expect(results.length).assertEqual(1);
        expect(results[0]).assertEqual('1,2,3undefinedundefined');
        done();
      });

    /**
     * @tc.name   testTaskGroupAddTaskWithEmptyName
     * @tc.number SUB_CONCURRENCY_TASKGROUP_ADDTASK_PARAM_007
     * @tc.desc   Test TaskGroup.addTask with empty name string.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTaskGroupAddTaskWithEmptyName', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const task = new taskpool.Task('', simpleFunc, 5);
        const group = new taskpool.TaskGroup();
        group.addTask(task);
        const results = await taskpool.execute(group);
        expect(results.length).assertEqual(1);
        done();
      });

    /**
     * @tc.name   testExecuteTaskWithNull
     * @tc.number SUB_CONCURRENCY_SEQUENCERUNNER_EXECUTE_PARAM_001
     * @tc.desc   Test SequenceRunner.execute with null task parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTaskWithNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      let tag = "testExecuteTaskWithNull"
      console.log(`${tag} test start.`)
      let runner = new taskpool.SequenceRunner()
      try {
        await runner.execute(null);
      } catch (error) {
        console.log(`${tag} test catch: ${error.code}`)
        expect(error.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   testExecuteTaskWithUndefined
     * @tc.number SUB_CONCURRENCY_SEQUENCERUNNER_EXECUTE_PARAM_002
     * @tc.desc   Test SequenceRunner.execute with undefined task parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTaskWithUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      let tag = "testExecuteTaskWithUndefined"
      console.log(`${tag} test start.`)
      let runner = new taskpool.SequenceRunner()
      try {
        await runner.execute(undefined);
      } catch (error) {
        console.log(`${tag} test catch: ${error.code}`)
        expect(error.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   testExecuteTaskWithEmptyArguments
     * @tc.number SUB_CONCURRENCY_SEQUENCERUNNER_EXECUTE_PARAM_003
     * @tc.desc   Test SequenceRunner.execute with empty arguments array.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTaskWithEmptyArguments', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        let runner = new taskpool.SequenceRunner()
        const task = new taskpool.Task(simpleFunc, []);
        const result = await runner.execute(task);
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testExecuteTaskWithNonEmptyArguments
     * @tc.number SUB_CONCURRENCY_SEQUENCERUNNER_EXECUTE_PARAM_004
     * @tc.desc   Test SequenceRunner.execute with non-empty arguments array.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTaskWithNonEmptyArguments', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        let runner = new taskpool.SequenceRunner()
        const task = new taskpool.Task(multiArgFunc, [1, 2, 3]);
        const result = await runner.execute(task);
        expect(result).assertEqual('1,2,3undefinedundefined');
        done();
      });

    /**
     * @tc.name   testExecuteTaskWithEmptyName
     * @tc.number SUB_CONCURRENCY_SEQUENCERUNNER_EXECUTE_PARAM_005
     * @tc.desc   Test SequenceRunner.execute with empty name string.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTaskWithEmptyName', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      let runner = new taskpool.SequenceRunner()
      const task = new taskpool.Task('', simpleFunc, 5);
      const result = await runner.execute(task);
      expect(result).assertEqual(10);
      done();
    });


    /**
     * @tc.name   testExecuteVerifyTaskWithNull
     * @tc.number SUB_CONCURRENCY_TASKPOOL_EXECUTE_PARAM_001
     * @tc.desc   Test taskpool.execute with null function parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteVerifyTaskWithNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      let tag = "testExecuteVerifyTaskWithNull"
      console.log(`${tag} test start.`)
      try {
        await taskpool.execute<Object[], null>(null);
      } catch (error) {
        console.log(`${tag} test catch: ${error.code}`)
        expect(error.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   testExecuteVerifyFuncWithUndefined
     * @tc.number SUB_CONCURRENCY_TASKPOOL_EXECUTE_PARAM_002
     * @tc.desc   Test taskpool.execute with undefined function parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteVerifyFuncWithUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        let tag = "testExecuteVerifyFuncWithUndefined"
        console.log(`${tag} test start.`)
        try {
          await taskpool.execute<Object[], undefined>(undefined);
        } catch (error) {
          console.log(`${tag} test catch: ${error.code}`)
          expect(error.code).assertEqual(401);
          done();
        }
      });

    /**
     * @tc.name   testExecuteVerifyArgsWithNull
     * @tc.number SUB_CONCURRENCY_TASKPOOL_EXECUTE_PARAM_003
     * @tc.desc   Test taskpool.execute with null args parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteVerifyArgsWithNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      let tag = "testExecuteVerifyArgsWithNull"
      console.log(`${tag} test start.`)
      try {
        let result = await taskpool.execute<number[], number>(simpleFunc, null);
        expect(result).assertEqual(0);
        done();
      } catch (error) {
        console.log(`${tag} test catch: ${error.code}`)
      }
    });

    /**
     * @tc.name   testExecuteVerifyArgsWithUndefined
     * @tc.number SUB_CONCURRENCY_TASKPOOL_EXECUTE_PARAM_004
     * @tc.desc   Test taskpool.execute with undefined args parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteVerifyArgsWithUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        let tag = "testExecuteVerifyArgsWithUndefined"
        console.log(`${tag} test start.`)
        try {
          let result = await taskpool.execute<number[], number>(simpleFunc, undefined);
          expect(result).assertNaN()
          done();
        } catch (error) {
          console.log(`${tag} test catch: ${error.code}`)
          done();
        }
      });

    /**
     * @tc.name   testExecuteTaskPriorityHIGH
     * @tc.number SUB_CONCURRENCY_TASKPOOL_EXECUTE_PARAM_005
     * @tc.desc   Test taskpool.execute with HIGH priority.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTaskPriorityHIGH', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      const task = new taskpool.Task(simpleFunc, []);
      const result = await taskpool.execute(task, taskpool.Priority.HIGH);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testExecuteTaskPriorityMEDIUM
     * @tc.number SUB_CONCURRENCY_TASKPOOL_EXECUTE_PARAM_006
     * @tc.desc   Test taskpool.execute with MEDIUM priority.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTaskPriorityMEDIUM', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      const task = new taskpool.Task(simpleFunc, [5]);
      const result = await taskpool.execute(task, taskpool.Priority.MEDIUM);
      expect(result).assertEqual(10);
      done();
    });

    /**
     * @tc.name   testExecuteTaskPriorityLOW
     * @tc.number SUB_CONCURRENCY_TASKPOOL_EXECUTE_PARAM_007
     * @tc.desc   Test taskpool.execute with LOW priority.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTaskPriorityLOW', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      const task = new taskpool.Task('', simpleFunc, 5);
      const result = await taskpool.execute(task, taskpool.Priority.LOW);
      expect(result).assertEqual(10);
      done();
    });

    /**
     * @tc.name   testExecuteTaskPriorityWithNull
     * @tc.number SUB_CONCURRENCY_TASKPOOL_EXECUTE_PARAM_008
     * @tc.desc   Test taskpool.execute with null task parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTaskPriorityWithNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      let tag = "testExecuteTaskPriorityWithNull"
      console.log(`${tag} test start.`)
      try {
        await taskpool.execute(null, taskpool.Priority.MEDIUM);
      } catch (error) {
        console.log(`${tag} test catch: ${error.code}`)
        expect(error.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   testExecuteTaskPriorityWithUndefined
     * @tc.number SUB_CONCURRENCY_TASKPOOL_EXECUTE_PARAM_009
     * @tc.desc   Test taskpool.execute with undefined task parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTaskPriorityWithUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        let tag = "testExecuteTaskPriorityWithUndefined"
        console.log(`${tag} test start.`)
        try {
          await taskpool.execute(undefined, taskpool.Priority.MEDIUM);
        } catch (error) {
          console.log(`${tag} test catch: ${error.code}`)
          expect(error.code).assertEqual(401);
          done();
        }
      });
    /**
     * @tc.name   testExecuteVerifyPriorityTaskWithNull
     * @tc.number SUB_CONCURRENCY_TASKPOOL_EXECUTE_PARAM_010
     * @tc.desc   Test taskpool.execute with null task and priority.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteVerifyPriorityTaskWithNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        let tag = "testExecuteVerifyPriorityTaskWithNull"
        console.log(`${tag} test start.`)
        try {
          await taskpool.execute<Object[], null>(null, taskpool.Priority.MEDIUM);
        } catch (error) {
          console.log(`${tag} test catch: ${error.code}`)
          expect(error.code).assertEqual(401);
          done();
        }
      });

    /**
     * @tc.name   testExecuteVerifyPriorityFuncWithUndefined
     * @tc.number SUB_CONCURRENCY_TASKPOOL_EXECUTE_PARAM_011
     * @tc.desc   Test taskpool.execute with undefined function and priority.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteVerifyPriorityFuncWithUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        let tag = "testExecuteVerifyPriorityFuncWithUndefined"
        console.log(`${tag} test start.`)
        try {
          await taskpool.execute<Object[], undefined>(undefined, taskpool.Priority.MEDIUM);
        } catch (error) {
          console.log(`${tag} test catch: ${error.code}`)
          expect(error.code).assertEqual(401);
          done();
        }
      });

    /**
     * @tc.name   testExecuteVerifyPriorityArgsWithNull
     * @tc.number SUB_CONCURRENCY_TASKPOOL_EXECUTE_PARAM_012
     * @tc.desc   Test taskpool.execute with null args and priority.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteVerifyPriorityArgsWithNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        let tag = "testExecuteVerifyPriorityArgsWithNull"
        console.log(`${tag} test start.`)
        try {
          let result = await taskpool.execute<number[], number>(simpleFunc, null, taskpool.Priority.MEDIUM);
          expect(result).assertEqual(0);
          done();
        } catch (error) {
          console.log(`${tag} test catch: ${error.code}`)
        }
      });

    /**
     * @tc.name   testExecuteVerifyPriorityArgsWithUndefined
     * @tc.number SUB_CONCURRENCY_TASKPOOL_EXECUTE_PARAM_013
     * @tc.desc   Test taskpool.execute with undefined args and priority.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteVerifyPriorityArgsWithUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        let tag = "testExecuteVerifyPriorityArgsWithUndefined"
        console.log(`${tag} test start.`)
        try {
          let result = await taskpool.execute<number[], number>(simpleFunc, undefined, taskpool.Priority.MEDIUM);
          expect(result).assertNaN()
          done();
        } catch (error) {
          console.log(`${tag} test catch: ${error.code}`)
          done();
        }
      });
    /**
     * @tc.name   testExecuteGroupWithNull
     * @tc.number SUB_CONCURRENCY_TASKPOOL_EXECUTE_PARAM_014
     * @tc.desc   Test taskpool.execute with null group parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteGroupWithNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      let tag = "testExecuteGroupWithNull"
      console.log(`${tag} test start.`)
      try {
        await taskpool.execute(null);
      } catch (error) {
        console.log(`${tag} test catch: ${error.code}`)
        expect(error.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   testExecuteGroupPriorityWithUndefined
     * @tc.number SUB_CONCURRENCY_TASKPOOL_EXECUTE_PARAM_015
     * @tc.desc   Test taskpool.execute with group and MEDIUM priority.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteGroupPriorityWithUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const group = new taskpool.TaskGroup('');
        group.addTask(noArgFunc);
        const results = await taskpool.execute(group, taskpool.Priority.MEDIUM);
        expect(results.length).assertEqual(1);
        done();
      });

    /**
     * @tc.name   testExecuteGroupWithEmptyName
     * @tc.number SUB_CONCURRENCY_TASKPOOL_EXECUTE_PARAM_016
     * @tc.desc   Test taskpool.execute group with empty name.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteGroupWithEmptyName', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      const group = new taskpool.TaskGroup('');
      group.addTask(noArgFunc);
      const results = await taskpool.execute(group);
      expect(results.length).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testExecuteDelayedWithEmptyArguments
     * @tc.number SUB_CONCURRENCY_TASKPOOL_EXECUTEDELAYED_PARAM_001
     * @tc.desc   Test taskpool.executeDelayed with empty arguments array.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteDelayedWithEmptyArguments', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const task = new taskpool.Task(simpleFunc, []);
        const result = await taskpool.executeDelayed(100, task);
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testExecuteDelayedWithNonEmptyArguments
     * @tc.number SUB_CONCURRENCY_TASKPOOL_EXECUTEDELAYED_PARAM_002
     * @tc.desc   Test taskpool.executeDelayed with non-empty arguments array.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteDelayedWithNonEmptyArguments', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const task = new taskpool.Task(multiArgFunc, [1, 2, 3]);
        const result = await taskpool.executeDelayed(100, task);
        expect(result).assertEqual('1,2,3undefinedundefined');
        done();
      });

    /**
     * @tc.name   testExecuteDelayedWithEmptyName
     * @tc.number SUB_CONCURRENCY_TASKPOOL_EXECUTEDELAYED_PARAM_003
     * @tc.desc   Test taskpool.executeDelayed with empty name.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteDelayedWithEmptyName', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      const task = new taskpool.Task('', simpleFunc, 5);
      const result = await taskpool.executeDelayed(100, task);
      expect(result).assertEqual(10);
      done();
    });

    /**
     * @tc.name   testExecutePeriodicallyWithEmptyArguments
     * @tc.number SUB_CONCURRENCY_TASKPOOL_EXECUTEPERIODICALLY_PARAM_001
     * @tc.desc   Test taskpool.executePeriodically with empty arguments array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecutePeriodicallyWithEmptyArguments', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        const task = new taskpool.Task(simpleFunc, []);
        taskpool.executePeriodically(100, task);
        setTimeout(() => {
          try {
            taskpool.cancel(task);
          } catch (e) {
            console.log(`test catch: ${e}`)
            expect().assertFail();
          }
          done();
        }, 200);
      });

    /**
     * @tc.name   testExecutePeriodicallyWithNonEmptyArguments
     * @tc.number SUB_CONCURRENCY_TASKPOOL_EXECUTEPERIODICALLY_PARAM_002
     * @tc.desc   Test taskpool.executePeriodically with non-empty arguments array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecutePeriodicallyWithNonEmptyArguments', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        const task = new taskpool.Task(multiArgFunc, [1, 2, 3]);
        taskpool.executePeriodically(100, task);
        setTimeout(() => {
          try {
            taskpool.cancel(task);
          } catch (e) {
            console.log(`test catch: ${e}`)
            expect().assertFail();
          }
          done();
        }, 200);
      });

    /**
     * @tc.name   testExecutePeriodicallyWithEmptyName
     * @tc.number SUB_CONCURRENCY_TASKPOOL_EXECUTEPERIODICALLY_PARAM_003
     * @tc.desc   Test taskpool.executePeriodically with empty name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecutePeriodicallyWithEmptyName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const task = new taskpool.Task('', noArgFunc);
      taskpool.executePeriodically(100, task);
      setTimeout(() => {
        try {
          taskpool.cancel(task);
        } catch (e) {
          console.log(`test catch: ${e}`)
          expect().assertFail();
        }
        done();
      }, 200);
    });

    /**
     * @tc.name   testExecutePeriodicallyWithIDLE
     * @tc.number SUB_CONCURRENCY_TASKPOOL_EXECUTEPERIODICALLY_PARAM_004
     * @tc.desc   Test taskpool.executePeriodically with IDLE priority.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecutePeriodicallyWithIDLE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const task = new taskpool.Task(noArgFunc);
      taskpool.executePeriodically(100, task, taskpool.Priority.IDLE);
      setTimeout(() => {
        try {
          taskpool.cancel(task);
        } catch (e) {
          console.log(`test catch: ${e}`)
          expect().assertFail();
        }
        done();
      }, 200);
    });
    /**
     * @tc.name   testExecuteVerifyPeriodicallyWithIDLE
     * @tc.number SUB_CONCURRENCY_TASKPOOL_EXECUTEPERIODICALLY_PARAM_005
     * @tc.desc   Test taskpool.executePeriodically verify with IDLE priority.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteVerifyPeriodicallyWithIDLE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        const task = new taskpool.Task(noArgFunc);
        taskpool.executePeriodically<Object[], number>(100, task, taskpool.Priority.IDLE);
        setTimeout(() => {
          taskpool.cancel(task);
          done();
        }, 200);
      });

    /**
     * @tc.name   testCancelTaskWithNull
     * @tc.number SUB_CONCURRENCY_TASKPOOL_CANCEL_PARAM_001
     * @tc.desc   Test taskpool.cancel with null task parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCancelTaskWithNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      let tag = "testCancelTaskWithNull"
      console.log(`${tag} test start.`)
      try {
        taskpool.cancel(null);
      } catch (error) {
        console.log(`${tag} test catch: ${error.code}`)
        expect(error.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   testCancelTaskWithUndefined
     * @tc.number SUB_CONCURRENCY_TASKPOOL_CANCEL_PARAM_002
     * @tc.desc   Test taskpool.cancel with undefined task parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCancelTaskWithUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      let tag = "testCancelTaskWithUndefined"
      console.log(`${tag} test start.`)
      try {
        taskpool.cancel(undefined);
      } catch (error) {
        console.log(`${tag} test catch: ${error.code}`)
        expect(error.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   testCancelTaskWithEmptyArguments
     * @tc.number SUB_CONCURRENCY_TASKPOOL_CANCEL_PARAM_003
     * @tc.desc   Test taskpool.cancel task with empty arguments array.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCancelTaskWithEmptyArguments', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      let tag = "testCancelTaskWithEmptyArguments"
      console.log(`${tag} test start.`)
      const task = new taskpool.Task(simpleFunc, []);
      try {
        taskpool.cancel(task);
      } catch (error) {
        console.log(`${tag} test catch: ${error.code}`)
        expect(error.code).assertEqual(10200015);
      }
      done();
    });

    /**
     * @tc.name   testCancelTaskWithNonEmptyArguments
     * @tc.number SUB_CONCURRENCY_TASKPOOL_CANCEL_PARAM_004
     * @tc.desc   Test taskpool.cancel task with non-empty arguments array.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCancelTaskWithNonEmptyArguments', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      let tag = "testCancelTaskWithNonEmptyArguments"
      console.log(`${tag} test start.`)
      const task = new taskpool.Task(multiArgFunc, [1, 2, 3]);
      try {
        taskpool.cancel(task);
      } catch (error) {
        console.log(`${tag} test catch: ${error.code}`)
        expect(error.code).assertEqual(10200015);
      }
      done();
    });

    /**
     * @tc.name   testCancelTaskWithEmptyName
     * @tc.number SUB_CONCURRENCY_TASKPOOL_CANCEL_PARAM_005
     * @tc.desc   Test taskpool.cancel task with empty name.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCancelTaskWithEmptyName', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      let tag = "testCancelTaskWithEmptyName"
      console.log(`${tag} test start.`)
      const task = new taskpool.Task('', simpleFunc, 5);
      try {
        taskpool.cancel(task);
      } catch (error) {
        console.log(`${tag} test catch: ${error.code}`)
        expect(error.code).assertEqual(10200015);
      }
      done();
    });


    /**
     * @tc.name   testCancelGroupWithNull
     * @tc.number SUB_CONCURRENCY_TASKPOOL_CANCEL_PARAM_006
     * @tc.desc   Test taskpool.cancel with null group parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCancelGroupWithNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      let tag = "testCancelGroupWithNull"
      console.log(`${tag} test start.`)
      try {
        taskpool.cancel(null);
      } catch (error) {
        console.log(`${tag} test catch: ${error.code}`)
        expect(error.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   testCancelGroupWithUndefined
     * @tc.number SUB_CONCURRENCY_TASKPOOL_CANCEL_PARAM_007
     * @tc.desc   Test taskpool.cancel with undefined group parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCancelGroupWithUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      let tag = "testCancelGroupWithUndefined"
      console.log(`${tag} test start.`)
      try {
        taskpool.cancel(undefined);
      } catch (error) {
        console.log(`${tag} test catch: ${error.code}`)
        expect(error.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   testCancelGroupWithEmptyName
     * @tc.number SUB_CONCURRENCY_TASKPOOL_CANCEL_PARAM_008
     * @tc.desc   Test taskpool.cancel group with empty name.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCancelGroupWithEmptyName', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      let tag = "testCancelGroupWithEmptyName"
      console.log(`${tag} test start.`)
      const group = new taskpool.TaskGroup('');
      group.addTask(noArgFunc);
      try {
        taskpool.cancel(group);
      } catch (error) {
        console.log(`${tag} test catch: ${error.code}`)
        expect(error.code).assertEqual(10200018);
        done();
      }
      done();
    });


    /**
     * @tc.name   testGetTaskPoolInfoThreadInfos
     * @tc.number SUB_CONCURRENCY_TASKPOOL_GETTASKPOOLINFO_RETURN_001
     * @tc.desc   Test taskpool.getTaskPoolInfo returns threadInfos array.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testGetTaskPoolInfoThreadInfos', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      const task = new taskpool.Task(simpleFunc, 1);
      await taskpool.execute(task);
      const info = taskpool.getTaskPoolInfo();
      expect(info.threadInfos.length).assertLarger(0);
      done();
    });

    /**
     * @tc.name   testGetTaskPoolInfoTaskInfos
     * @tc.number SUB_CONCURRENCY_TASKPOOL_GETTASKPOOLINFO_RETURN_002
     * @tc.desc   Test taskpool.getTaskPoolInfo returns taskInfos array.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testGetTaskPoolInfoTaskInfos', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      const task = new taskpool.Task(simpleFunc, 1);
      await taskpool.execute(task);
      const info = taskpool.getTaskPoolInfo();
      expect(info.taskInfos.length).assertLarger(0);
      if (info.taskInfos.length > 0) {
        expect(info.taskInfos[0].taskId).assertLarger(0);
      }
      done();
    });

    /**
     * @tc.name   testGetTaskPoolInfoTaskState
     * @tc.number SUB_CONCURRENCY_TASKPOOL_GETTASKPOOLINFO_RETURN_003
     * @tc.desc   Test taskpool.getTaskPoolInfo taskInfo state property.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testGetTaskPoolInfoTaskState', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      const task = new taskpool.Task(simpleFunc, 1);
      await taskpool.execute(task);
      const info = taskpool.getTaskPoolInfo();
      if (info.taskInfos.length > 0) {
        expect(info.taskInfos[0].state !== undefined).assertTrue();
      }

      done();
    });

    /**
     * @tc.name   testGetTaskPoolInfoTaskDuration
     * @tc.number SUB_CONCURRENCY_TASKPOOL_GETTASKPOOLINFO_RETURN_004
     * @tc.desc   Test taskpool.getTaskPoolInfo taskInfo duration property.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testGetTaskPoolInfoTaskDuration', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      const task = new taskpool.Task(simpleFunc, 1);
      await taskpool.execute(task);
      const info = taskpool.getTaskPoolInfo();
      if (info.taskInfos.length > 0) {
        expect(info.taskInfos[0].duration !== undefined).assertTrue();
      }

      done();
    });

    /**
     * @tc.name   testGetTaskPoolInfoTaskName
     * @tc.number SUB_CONCURRENCY_TASKPOOL_GETTASKPOOLINFO_RETURN_005
     * @tc.desc   Test taskpool.getTaskPoolInfo taskInfo name property.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testGetTaskPoolInfoTaskName', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      const task = new taskpool.Task(simpleFunc, 1);
      await taskpool.execute(task);
      const info = taskpool.getTaskPoolInfo();
      if (info.taskInfos.length > 0) {
        expect(info.taskInfos[0].name !== undefined).assertTrue();
      }

      done();
    });

    /**
     * @tc.name   testTerminateTaskWithNull
     * @tc.number SUB_CONCURRENCY_TASKPOOL_TERMINATETASK_PARAM_001
     * @tc.desc   Test taskpool.terminateTask with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTerminateTaskWithNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      let tag = "testTerminateTaskWithNull"
      console.log(`${tag} test start.`)
      try {
        taskpool.terminateTask(null);
      } catch (error) {
        console.log(`${tag} test catch: ${error.code}`)
        expect(error.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   testTerminateTaskWithUndefined
     * @tc.number SUB_CONCURRENCY_TASKPOOL_TERMINATETASK_PARAM_002
     * @tc.desc   Test taskpool.terminateTask with undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTerminateTaskWithUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      let tag = "testTerminateTaskWithUndefined"
      console.log(`${tag} test start.`)
      try {
        taskpool.terminateTask(undefined);
      } catch (error) {
        console.log(`${tag} test catch: ${error.code}`)
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   testIsConcurrentWithNull
     * @tc.number SUB_CONCURRENCY_TASKPOOL_ISCONCURRENT_PARAM_001
     * @tc.desc   Test taskpool.isConcurrent with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testIsConcurrentWithNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      let tag = "testIsConcurrentWithNull"
      console.log(`${tag} test start.`)
      try {
        const result = taskpool.isConcurrent(null);
        expect(result).assertFalse();
        done();
      } catch (error) {
        console.log(`${tag} catch error.code: ${error.code}`);
        expect(error.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   testIsConcurrentWithUndefined
     * @tc.number SUB_CONCURRENCY_TASKPOOL_ISCONCURRENT_PARAM_002
     * @tc.desc   Test taskpool.isConcurrent with undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testIsConcurrentWithUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      let tag = "testIsConcurrentWithUndefined"
      console.log(`${tag} test start.`)
      try {
        const result = taskpool.isConcurrent(undefined);
        expect(result).assertFalse();
        done();
      } catch (error) {
        console.log(`${tag} catch error.code: ${error.code}`);
        expect(error.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   testGetTaskById
     * @tc.number SUB_CONCURRENCY_TASKPOOL_GETTASK_RETURN_001
     * @tc.desc   Test taskpool.getTask by taskId.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testGetTaskById', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      const task = new taskpool.Task(simpleFunc, 1);
      const taskId = task.taskId;
      await taskpool.execute(task);
      const foundTask = taskpool.getTask(taskId);
      expect(foundTask !== undefined).assertTrue();
      if (foundTask !== undefined) {
        expect(foundTask.taskId).assertEqual(taskId);
      }
      done();
    });

    /**
     * @tc.name   testGetTaskByIdAndName
     * @tc.number SUB_CONCURRENCY_TASKPOOL_GETTASK_RETURN_002
     * @tc.desc   Test taskpool.getTask by taskId and name.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testGetTaskByIdAndName', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      const task = new taskpool.Task("testTask", simpleFunc, 1);
      const taskId = task.taskId;
      await taskpool.execute(task);
      const foundTask = taskpool.getTask(taskId, "testTask");
      expect(foundTask !== undefined).assertTrue();
      if (foundTask !== undefined) {
        expect(foundTask.taskId).assertEqual(taskId);
        expect(foundTask.name).assertEqual("testTask");
      }
      done();
    });

    /**
     * @tc.name   testGetTaskByIdNotFound
     * @tc.number SUB_CONCURRENCY_TASKPOOL_GETTASK_RETURN_003
     * @tc.desc   Test taskpool.getTask with non-existent taskId.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testGetTaskByIdNotFound', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      const foundTask = taskpool.getTask(999999);
      expect(foundTask === undefined).assertTrue();
      done();
    });

    /**
     * @tc.name   testGetTaskByIdAndNameNotFound
     * @tc.number SUB_CONCURRENCY_TASKPOOL_GETTASK_RETURN_004
     * @tc.desc   Test taskpool.getTask with mismatched name.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testGetTaskByIdAndNameNotFound', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      const task = new taskpool.Task("testTask", simpleFunc, 1);
      const taskId = task.taskId;
      const foundTask = taskpool.getTask(taskId, "wrongName");
      expect(foundTask === undefined).assertTrue();
      done();
    });

    /**
     * @tc.name   testGetTaskProperties
     * @tc.number SUB_CONCURRENCY_TASKPOOL_GETTASK_RETURN_005
     * @tc.desc   Test taskpool.getTask returns task with correct properties.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testGetTaskProperties', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      const task = new taskpool.Task("testProps", simpleFunc, 1);
      const taskId = task.taskId;
      await taskpool.execute(task);
      const foundTask = taskpool.getTask(taskId);
      if (foundTask !== undefined) {
        expect(foundTask.taskId).assertEqual(taskId);
        expect(foundTask.name).assertEqual("testProps");
      }
      done();
    });

    /**
     * @tc.name   testAsyncRunnerExecuteWithNullTask
     * @tc.number SUB_CONCURRENCY_ASYNCRUNNER_PARAM_0101
     * @tc.desc   test AsyncRunner.execute with null task parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testAsyncRunnerExecuteWithNullTask', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        const tag = "testAsyncRunnerExecuteWithNullTask";
        console.log(`${tag} test start.`);
        const runner = new taskpool.AsyncRunner(1);
        try {
          runner.execute(null);
          expect().assertFail();
        } catch (error) {
          console.log(`${tag} catch error.code: ${error.code}`);
          expect(error.code).assertEqual(401);
        }
        done();
      });

    /**
     * @tc.name   testAsyncRunnerExecuteWithUndefinedTask
     * @tc.number SUB_CONCURRENCY_ASYNCRUNNER_PARAM_0102
     * @tc.desc   test AsyncRunner.execute with undefined task parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testAsyncRunnerExecuteWithUndefinedTask', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        const tag = "testAsyncRunnerExecuteWithUndefinedTask";
        console.log(`${tag} test start.`);
        const runner = new taskpool.AsyncRunner(1);
        try {
          runner.execute(undefined);
          expect().assertFail();
        } catch (error) {
          console.log(`${tag} catch error.code: ${error.code}`);
          expect(error.code).assertEqual(401);
        }
        done();
      });

    /**
     * @tc.name   testAsyncRunnerConstructorNoParams
     * @tc.number SUB_CONCURRENCY_ASYNCRUNNER_PARAM_0201
     * @tc.desc   test AsyncRunner constructor without required parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAsyncRunnerConstructorNoParams', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const tag = "testAsyncRunnerConstructorNoParams";
        console.log(`${tag} test start.`);
        const runner = new taskpool.AsyncRunner(1);
        const task = new taskpool.Task(simpleFunc, []);
        let result = await runner.execute(task);
        expect(result).assertEqual(0);
        console.log(`${tag} test end.`);
        done();
      });

    /**
     * @tc.name   testAsyncRunnerConstructorWithEmptyName
     * @tc.number SUB_CONCURRENCY_ASYNCRUNNER_PARAM_0301
     * @tc.desc   test AsyncRunner constructor with empty name string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAsyncRunnerConstructorWithEmptyName', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const tag = "testAsyncRunnerConstructorWithEmptyName";
        console.log(`${tag} test start.`);
        const runner = new taskpool.AsyncRunner("", 1);
        const task = new taskpool.Task(simpleFunc, [100]);
        let result = await runner.execute(task);
        expect(result).assertEqual(200);
        console.log(`${tag} test end.`);
        done();
      });

    /**
     * @tc.name   testAsyncRunnerExecuteWithEmptyName
     * @tc.number SUB_CONCURRENCY_ASYNCRUNNER_RETURN_0101
     * @tc.desc   test AsyncRunner.execute with Promise task (return type not declared)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAsyncRunnerExecuteWithEmptyName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const tag = "testAsyncRunnerExecuteWithEmptyName";
        console.log(`${tag} test start.`);
        const runner = new taskpool.AsyncRunner("", 1);
        const task = new taskpool.Task('', simpleFunc, 100);
        let result = await runner.execute(task);
        expect(result).assertEqual(200);
        done()
      });
  });
}
