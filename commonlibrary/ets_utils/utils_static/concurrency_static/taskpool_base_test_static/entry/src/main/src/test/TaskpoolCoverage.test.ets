import { describe, it, expect, TestType, Size, Level, beforeAll} from '../../../hypium/index';

// 测试函数定义

function simpleFunc(arg: int): int {
    return arg * 2;
}

function simpleFuncNull(arg: int | null | undefined): int | null | undefined {
    return arg;
}


function multiArgFunc(a: int, b: int, c: int): int {
    return a + b + c;
}


function noArgFunc(): int {
    return 42;
}


function send(arg: int): int {
    try {
        taskpool.Task.sendData(arg)
    } catch (error) {
    }
    return arg * 2;
}


function promiseTask(arg: int): Promise<int> {
    return new Promise<int>((resolve) => {
        setTimeout(() => {
            resolve(arg * 2);
        }, 100);
    });
}

export default function taskPoolCoverageTest() {
    describe('TaskPoolCoverageTest', () => {
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
                task.onReceiveData(undefined);
                const result = await taskpool.execute(task);
                expect(result as int).assertEqual(2);
                done.unsafeCall();
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
                done.unsafeCall();
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
            expect(result as int).assertEqual(10);
            done.unsafeCall();
        });


        /**
         * @tc.name   testExecuteFuncArgsWithNull
         * @tc.number SUB_CONCURRENCY_TASKPOOL_EXECUTE_PARAM_0031
         * @tc.desc   Test taskpool.execute with null args parameter.
         * @tc.type   FUNCTION
         * @tc.size   SMALLTEST
         * @tc.level  LEVEL1
         */
        it('testExecuteFuncArgsWithNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
            let tag = "testExecuteFuncArgsWithNull"
            console.log(`${tag} test start.`)
            try {
                let result = await taskpool.execute(simpleFuncNull, null)  as null;
                expect(result).assertEqual(null);
                done.unsafeCall();
            } catch (error) {
                console.log(`${tag} test catch: ${error.code}`)
            }
            done.unsafeCall();
        });

        /**
         * @tc.name   testExecuteFuncArgsWithUndefined
         * @tc.number SUB_CONCURRENCY_TASKPOOL_EXECUTE_PARAM_0041
         * @tc.desc   Test taskpool.execute with undefined args parameter.
         * @tc.type   FUNCTION
         * @tc.size   SMALLTEST
         * @tc.level  LEVEL1
         */
        it('testExecuteFuncArgsWithUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
            async (done: Function) => {
                let tag = "testExecuteFuncArgsWithUndefined"
                console.log(`${tag} test start.`)
                try {
                    let result = await taskpool.execute(simpleFuncNull, undefined)  as undefined;
                    expect(result).assertUndefined()
                    done.unsafeCall();
                } catch (error) {
                    console.log(`${tag} test catch: ${error.code}`)
                    done.unsafeCall();
                }
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
            const task = new taskpool.Task(simpleFunc, 5);
            const result = await taskpool.execute(task, taskpool.Priority.MEDIUM) as int;
            expect(result).assertEqual(10);
            done.unsafeCall();
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
            const result = await taskpool.execute(task, taskpool.Priority.LOW) as int;
            expect(result).assertEqual(10);
            done.unsafeCall();
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
                done.unsafeCall();
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
            done.unsafeCall();
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
            const result = await taskpool.executeDelayed(100, task) as int;
            expect(result).assertEqual(10);
            done.unsafeCall();
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
                done.unsafeCall();
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
                done.unsafeCall();
            }, 200);
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
                console.log(`${tag} test catch: ${error.code}`);
                expect(error instanceof Error).assertTrue();
            }
            done.unsafeCall();
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
                expect(error instanceof Error).assertTrue();
                done.unsafeCall();
            }
            done.unsafeCall();
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
            done.unsafeCall();
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
            if (info.taskInfos.length == 0) {
                expect(info.taskInfos.length).assertEqual(0);
            }
            if (info.taskInfos.length > 0) {
                expect(info.taskInfos[0].taskId).assertLarger(0);
            }
            done.unsafeCall();
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

            done.unsafeCall();
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

            done.unsafeCall();
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

            done.unsafeCall();
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
            done.unsafeCall();
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
            done.unsafeCall();
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
            done.unsafeCall();
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
                const task = new taskpool.Task(simpleFunc, 100);
                let result = await runner.execute(task) as int;
                expect(result).assertEqual(200);
                console.log(`${tag} test end.`);
                done.unsafeCall();
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
                let result = await runner.execute(task) as int;
                expect(result).assertEqual(200);
                done.unsafeCall()
            });
    });
}
