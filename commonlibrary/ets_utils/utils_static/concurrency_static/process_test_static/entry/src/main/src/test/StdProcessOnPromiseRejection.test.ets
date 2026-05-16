/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
    TestType,
    Level,
    Size
} from "../../../hypium/index";

import Utils from './Util.test';

interface CapturedError {
    reason: Error | null;
    promise: Object | null;
}

export default function stdProcessOnUnhandledPromiseRejectionTest(): void {
    describe("stdProcessOnUnhandledPromiseRejectionTest", (): void => {
        let capturedError: CapturedError = {
            reason : null,
            promise: null
        };

        beforeEach((): void => {
            capturedError = {
                reason: null,
                promise: null
            };
        });

        afterEach(async (): Promise<void> => {
            StdProcess.off("unhandledPromiseRejection");
            await Utils.msSleep(30);
        });

        /**
         * @tc.number SUB_STD_PROCESS_ON_0100
         * @tc.name testRegisterListenerAndCapturePromiseRejection
         * @tc.desc Register listener and capture unhandled promise rejection
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it('testRegisterListenerAndCapturePromiseRejection', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testRegisterListenerAndCapturePromiseRejection';
                console.info(`${TAG} test start`);
                const listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object): void => {
                    console.info(`${TAG} listener triggered`);
                    capturedError.reason = reason;
                    capturedError.promise = obj;
                    expect(capturedError.reason).not().assertNull();
                    expect(capturedError.reason!.message).assertEqual("test rejection");
                    expect(capturedError.promise).not().assertNull();
                    console.info(`${TAG} test passed`);
                    done();
                };

                StdProcess.on("unhandledPromiseRejection", listener);

                const testError: Error = new Error("test rejection");
                new Promise<void>((resolve, reject): void => {
                    reject(testError);
                });

            });

        /**
         * @tc.number SUB_STD_PROCESS_ON_0200
         * @tc.name testListenerReceivesErrorObjectProperties
         * @tc.desc Verify listener receives complete Error object properties
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it('testListenerReceivesErrorObjectProperties', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testListenerReceivesErrorObjectProperties';
                console.info(`${TAG} test start`);

                const listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object): void => {
                    console.info(`${TAG} listener triggered`);
                    capturedError.reason = reason;
                    capturedError.promise = obj;
                    expect(capturedError.reason).not().assertNull();
                    expect(capturedError.reason!.name).assertEqual("CustomError");
                    expect(capturedError.reason!.message).assertEqual("custom error message");
                    expect(capturedError.reason!.stack).not().assertNull();
                    expect(capturedError.promise).not().assertNull();
                    console.info(`${TAG} test passed`);
                    done();
                };

                StdProcess.on("unhandledPromiseRejection", listener);

                const customError: Error = new Error("custom error message");
                customError.name = "CustomError";

                new Promise<void>((resolve, reject): void => {
                    reject(customError);
                });
            });

        /**
         * @tc.number SUB_STD_PROCESS_ON_0300
         * @tc.name testCaptureUnhandledRejectionInAsyncFunction
         * @tc.desc Capture unhandled rejection in async function
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it('testCaptureUnhandledRejectionInAsyncFunction', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testCaptureUnhandledRejectionInAsyncFunction';
                console.info(`${TAG} test start`);

                const listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object): void => {
                    console.info(`${TAG} listener triggered`);
                    capturedError.reason = reason;
                    capturedError.promise = obj;
                    expect(capturedError.reason).not().assertNull();
                    expect(capturedError.reason!.message).assertEqual("async function error");
                    expect(capturedError.promise).not().assertNull();
                    console.info(`${TAG} test passed`);
                    done();
                };
                StdProcess.on("unhandledPromiseRejection", listener);
                const asyncFunction = async (): Promise<void> => {
                    throw new Error("async function error");
                };
                asyncFunction();
            });

        /**
         * @tc.number SUB_STD_PROCESS_ON_0400
         * @tc.name testRegisterMultipleDifferentListeners
         * @tc.desc Register multiple different listeners and verify all are called
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it('testRegisterMultipleDifferentListeners', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testRegisterMultipleDifferentListeners';
                console.info(`${TAG} test start`);

                let listener1Called: boolean = false;
                let listener2Called: boolean = false;
                let listener1Reason: Error | null = null;
                let listener2Reason: Error | null = null;

                const listener1: StdProcess.RejectedObjectListener = (reason: Error, obj: Object): void => {
                    console.info(`${TAG} listener1 triggered`);
                    listener1Called = true;
                    listener1Reason = reason;
                };

                const listener2: StdProcess.RejectedObjectListener = (reason: Error, obj: Object): void => {
                    console.info(`${TAG} listener2 triggered`);
                    listener2Called = true;
                    listener2Reason = reason;
                };

                StdProcess.on("unhandledPromiseRejection", listener1);
                StdProcess.on("unhandledPromiseRejection", listener2);

                const testError: Error = new Error("multiple listeners test");
                new Promise<void>((resolve, reject): void => {
                    reject(testError);
                });
                await Utils.msSleep(30);

                expect(listener1Called).assertTrue();
                expect(listener2Called).assertTrue();
                expect(listener1Reason).not().assertNull();
                expect(listener2Reason).not().assertNull();
                expect(listener1Reason!.message).assertEqual("multiple listeners test");
                expect(listener2Reason!.message).assertEqual("multiple listeners test");
                console.info(`${TAG} test passed`);
                done();
            });

        /**
         * @tc.number SUB_STD_PROCESS_ON_0500
         * @tc.name testRegisterSameListenerTwice
         * @tc.desc Register the same listener twice and verify behavior
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it('testRegisterSameListenerTwice', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testRegisterSameListenerTwice';
                console.info(`${TAG} test start`);

                let callCount: number = 0;
                let capturedReason: Error | null = null;


                const listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object): void => {
                    console.info(`${TAG} listener triggered, call count: ${callCount}`);
                    callCount++;
                    capturedReason = reason;
                };

                StdProcess.on("unhandledPromiseRejection", listener);
                StdProcess.on("unhandledPromiseRejection", listener);

                const testError: Error = new Error("same listener test");
                new Promise<void>((resolve, reject): void => {
                    reject(testError);
                });

                await Utils.msSleep(30);

                expect(callCount).assertEqual(1);
                expect(capturedReason).not().assertNull();
                expect(capturedReason!.message).assertEqual("same listener test");
                console.info(`${TAG} listener called ${callCount} times`);
                console.info(`${TAG} test passed`);
                done();

            });
            

        /**
         * @tc.number SUB_STD_PROCESS_ON_0700
         * @tc.name testUnhandledRejectionInPromiseChain
         * @tc.desc Capture unhandled rejection in promise chain
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('testUnhandledRejectionInPromiseChain', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testUnhandledRejectionInPromiseChain';
                console.info(`${TAG} test start`);

                let capturedReason: Error | null = null;

                const listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object): void => {
                    console.info(`${TAG} listener triggered`);
                    capturedReason = reason;
                    expect(capturedReason).not().assertNull();
                    expect(capturedReason!.message).assertEqual("chain error");
                    console.info(`${TAG} test passed`);
                    done();
                };

                StdProcess.on("unhandledPromiseRejection", listener);

                Promise.resolve()
                    .then((): void => {
                        console.info(`${TAG} first then`);
                    })
                    .then((): void => {
                        console.info(`${TAG} second then`);
                        throw new Error("chain error");
                    })
                    .then((): void => {
                        console.info(`${TAG} third then`);
                    });
            });

        /**
         * @tc.number SUB_STD_PROCESS_ON_0800
         * @tc.name testUnhandledRejectionInPromiseAll
         * @tc.desc Capture unhandled rejection in Promise.all
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('testUnhandledRejectionInPromiseAll', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testUnhandledRejectionInPromiseAll';
                console.info(`${TAG} test start`);
                let capturedReason: Error | null = null;

                const listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object): void => {
                    console.info(`${TAG} listener triggered`);
                    capturedReason = reason;
                    expect(capturedReason).not().assertNull();
                    expect(capturedReason!.message).assertEqual("promise.all error");
                    console.info(`${TAG} test passed`);
                    done();
                };

                StdProcess.on("unhandledPromiseRejection", listener);

                const promise1: Promise<void> = Promise.resolve();
                const promise2: Promise<void> = new Promise<void>((resolve, reject): void => {
                    reject(new Error("promise.all error"));
                });
                const promise3: Promise<void> = Promise.resolve();

                Promise.all([promise1, promise2, promise3]);
            });

        /**
         * @tc.number SUB_STD_PROCESS_ON_0900
         * @tc.name testUnhandledRejectionInPromiseRace
         * @tc.desc Capture unhandled rejection in Promise.race
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('testUnhandledRejectionInPromiseRace', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testUnhandledRejectionInPromiseRace';
                console.info(`${TAG} test start`);
                let capturedReason: Error | null = null;
                const listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object): void => {
                    console.info(`${TAG} listener triggered`);
                    capturedReason = reason;
                    expect(capturedReason).not().assertNull();
                    expect(capturedReason!.message).assertEqual("promise.race error");
                    console.info(`${TAG} test passed`);

                    done();
                };

                StdProcess.on("unhandledPromiseRejection", listener);
                const promise1: Promise<void> = new Promise<void>((resolve): void => {
                    setTimeout((): void => {
                        resolve(undefined);
                    }, 100);
                });
                const promise2: Promise<void> = new Promise<void>((resolve, reject): void => {
                    reject(new Error("promise.race error"));
                });

                Promise.race([promise1, promise2]);
            });

        /**
         * @tc.number SUB_STD_PROCESS_ON_1000
         * @tc.name testRegisterListenerInEAWorkerAndTriggerRejection
         * @tc.desc Register listener in EAWorker thread and trigger promise rejection
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('testRegisterListenerInEAWorkerAndTriggerRejection', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testRegisterListenerInEAWorkerAndTriggerRejection';
                console.info(`${TAG} test start`);
                let workerListenerTriggered: boolean = false;
                let workerCapturedReason: Error | null = null;
                const eaw: EAWorker = new EAWorker();
                eaw.start();
                eaw.run<void>((): void => {
                    console.info(`${TAG} running in EAWorker thread`);

                    const listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object): void => {
                        console.info(`${TAG} EAWorker listener triggered`);
                        workerListenerTriggered = true;
                        workerCapturedReason = reason;
                        expect(workerListenerTriggered).assertTrue();
                        expect(workerCapturedReason).not().assertNull();
                        expect(workerCapturedReason!.message).assertEqual("EAWorker promise error");
                        console.info(`${TAG} test passed`);
                        done();
                    };

                    StdProcess.on("unhandledPromiseRejection", listener);

                    new Promise<void>((resolve, reject): void => {
                        reject(new Error("EAWorker promise error"));
                    });
                });
                eaw.join();

            });

        /**
         * @tc.number SUB_STD_PROCESS_ON_1100
         * @tc.name testMainThreadListenerCaptureEAWorkerRejection
         * @tc.desc Main thread listener captures EAWorker thread promise rejection
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('testMainThreadListenerCaptureEAWorkerRejection', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testMainThreadListenerCaptureEAWorkerRejection';
                console.info(`${TAG} test start`);

                let mainThreadListenerTriggered: boolean = false;
                let mainThreadCapturedReason: Error | null = null;

                const listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object): void => {
                    console.info(`${TAG} main thread listener triggered`);
                    mainThreadListenerTriggered = true;
                    mainThreadCapturedReason = reason;
                    console.info(`${TAG} main thread listener triggered: ${mainThreadListenerTriggered}`);
                    expect(mainThreadListenerTriggered).assertTrue();
                    expect(mainThreadCapturedReason!.message).assertEqual("EAWorker rejection");
                    console.info(`${TAG} test passed`);
                    done();
                };

                StdProcess.on("unhandledPromiseRejection", listener);

                const eaw: EAWorker = new EAWorker();
                eaw.start();

                eaw.run<void>((): void => {
                    console.info(`${TAG} triggering rejection in EAWorker thread`);
                    new Promise<void>((resolve, reject): void => {
                        reject(new Error("EAWorker rejection"));
                    });
                });
                eaw.join();
            });

       /**
         * @tc.number SUB_STD_PROCESS_ON_1300
         * @tc.name testMultipleEAWorkersTriggerRejectionSimultaneously
         * @tc.desc Multiple EAWorker threads trigger promise rejection simultaneously
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('testMultipleEAWorkersTriggerRejectionSimultaneously', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testMultipleEAWorkersTriggerRejectionSimultaneously';
                console.info(`${TAG} test start`);
                let concurrentSet: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>();
                const listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object): void => {
                    concurrentSet.add(reason.message);//avoid data race in multiple thread
                };

                StdProcess.on("unhandledPromiseRejection", listener);

                const workers: EAWorker[] = [];
                for (let i: number = 0; i < 3; i++) {
                    const eaw: EAWorker = new EAWorker();
                    eaw.start();
                    workers.push(eaw);

                    const errorMsg: string = `Worker ${i} error`;
                    eaw.run<void>((): void => {
                        console.info(`${TAG} EAWorker ${i} triggering rejection`);
                        new Promise<void>((resolve, reject): void => {
                            reject(new Error(errorMsg));
                        });
                    });
                }
                for (const eaw of workers) {
                    eaw.quit();
                }
                await Utils.msSleep(200);
                expect(concurrentSet.has("Worker 0 error")).assertTrue();
                expect(concurrentSet.has("Worker 1 error")).assertTrue();
                expect(concurrentSet.has("Worker 2 error")).assertTrue();
                console.info(`${TAG} test passed`);
                done();
            });            

        /**
         * @tc.number SUB_STD_PROCESS_ON_1400
         * @tc.name testEAWorkerDestroyWithUnhandledRejection
         * @tc.desc EAWorker thread destruction with unhandled promise rejection
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('testEAWorkerDestroyWithUnhandledRejection', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testEAWorkerDestroyWithUnhandledRejection';
                console.info(`${TAG} test start`);

                let listenerCalled: boolean = false;
                let capturedReason: Error | null = null;
                let workerTerminated: boolean = false;
                
                const listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object): void => {
                    console.info(`${TAG} listener triggered`);
                    listenerCalled = true;
                    capturedReason = reason;
                };

                StdProcess.on("unhandledPromiseRejection", listener);

                const eaw: EAWorker = new EAWorker();
                eaw.start();

                eaw.run<void>((): void => {
                    console.info(`${TAG} creating rejection in EAWorker`);
                    
                    StdProcess.on("unhandledPromiseRejection", (reason: Error, obj: Object): void => {
                        console.info(`${TAG} worker listener triggered`);
                    });

                    new Promise<void>((resolve, reject): void => {
                        reject(new Error("EAWorker destruction error"));
                    });
                });
                eaw.quit();

                await Utils.msSleep(30);

                console.info(`${TAG} listener called: ${listenerCalled}`);
                expect(listenerCalled).assertEqual(true);
                expect(capturedReason!.message).assertEqual("EAWorker destruction error");
                console.info(`${TAG} test passed`);
                done();
            });

        /**
         * @tc.number SUB_STD_PROCESS_ON_1500
         * @tc.name testRegisterListenerInTaskPoolTask
         * @tc.desc Register listener in TaskPool task and trigger promise rejection
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('testRegisterListenerInTaskPoolTask', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testRegisterListenerInTaskPoolTask';
                console.info(`${TAG} test start`);

                let taskListenerTriggered: boolean = false;
                let taskCapturedReason: Error | null = null;

                const taskFunc = (): void => {
                    console.info(`${TAG} running in TaskPool task`);

                    const listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object): void => {
                        console.info(`${TAG} TaskPool listener triggered`);
                        taskListenerTriggered = true;
                        taskCapturedReason = reason;
                    };

                    StdProcess.on("unhandledPromiseRejection", listener);

                    new Promise<void>((resolve, reject): void => {
                        reject(new Error("TaskPool promise error"));
                    });
                };

                const task: taskpool.Task = new taskpool.Task(taskFunc);
                await taskpool.execute(task);

                await Utils.msSleep(30);

                console.info(`${TAG} task listener triggered: ${taskListenerTriggered}`);
                expect(taskListenerTriggered).assertTrue();
                expect((taskCapturedReason!).message).assertEqual("TaskPool promise error");
                console.info(`${TAG} test passed`);
                done();
            });

        /**
         * @tc.number SUB_STD_PROCESS_ON_1600
         * @tc.name testMainThreadListenerCaptureTaskPoolRejection
         * @tc.desc Main thread listener captures TaskPool task promise rejection
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('testMainThreadListenerCaptureTaskPoolRejection', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testMainThreadListenerCaptureTaskPoolRejection';
                console.info(`${TAG} test start`);

                let mainThreadListenerTriggered: boolean = false;
                let mainThreadCapturedReason: Error | null = null;


                const listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object): void => {
                    console.info(`${TAG} main thread listener triggered`);
                    mainThreadListenerTriggered = true;
                    mainThreadCapturedReason = reason;
                };

                StdProcess.on("unhandledPromiseRejection", listener);

                const taskFunc = (): void => {
                    console.info(`${TAG} triggering rejection in TaskPool task`);
                    new Promise<void>((resolve, reject): void => {
                        reject(new Error("TaskPool rejection"));
                    });
                };

                const task: taskpool.Task = new taskpool.Task(taskFunc);
                await taskpool.execute(task);

                await Utils.msSleep(30);

                console.info(`${TAG} main thread listener triggered: ${mainThreadListenerTriggered}`);
                expect(mainThreadListenerTriggered).assertTrue();
                expect((mainThreadCapturedReason!).message).assertEqual("TaskPool rejection");
                console.info(`${TAG} test passed`);
                done();
            });

        /**
         * @tc.number SUB_STD_PROCESS_ON_1700
         * @tc.name testTaskGroupMultipleTasksRejection
         * @tc.desc TaskGroup with multiple tasks triggering promise rejection
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('testTaskGroupMultipleTasksRejection', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testTaskGroupMultipleTasksRejection';
                console.info(`${TAG} test start`);

                let concurrentSet: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>();
                const listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object): void => {
                    concurrentSet.add(reason.message);
                };

                StdProcess.on("unhandledPromiseRejection", listener);

                const taskFunc1 = (): void => {
                    console.info(`${TAG} TaskGroup task 1`);
                    new Promise<void>((resolve, reject): void => {
                        reject(new Error("TaskGroup task 1 error"));
                    });
                };

                const taskFunc2 = (): void => {
                    console.info(`${TAG} TaskGroup task 2`);
                    new Promise<void>((resolve, reject): void => {
                        reject(new Error("TaskGroup task 2 error"));
                    });
                };

                const taskFunc3 = (): void => {
                    console.info(`${TAG} TaskGroup task 3`);
                    new Promise<void>((resolve, reject): void => {
                        reject(new Error("TaskGroup task 3 error"));
                    });
                };

                const taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
                taskGroup.addTask(taskFunc1);
                taskGroup.addTask(taskFunc2);
                taskGroup.addTask(taskFunc3);

                await taskpool.execute(taskGroup);

                await Utils.msSleep(50);
                expect(concurrentSet.has("TaskGroup task 1 error")).assertTrue();
                expect(concurrentSet.has("TaskGroup task 2 error")).assertTrue();
                expect(concurrentSet.has("TaskGroup task 3 error")).assertTrue();
                console.info(`${TAG} test passed`);
                done();
            });

        /**
         * @tc.number SUB_STD_PROCESS_ON_1800
         * @tc.name testTaskPoolTaskCancelWithRejection
         * @tc.desc TaskPool task cancellation with pending promise rejection
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('testTaskPoolTaskCancelWithRejection', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testTaskPoolTaskCancelWithRejection';
                console.info(`${TAG} test start`);

                let listenerTriggered: boolean = false;
                let capturedReason: Error | null = null;
                const listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object): void => {
                    console.info(`${TAG} listener triggered`);
                    listenerTriggered = true;
                    capturedReason = reason;
                };

                StdProcess.on("unhandledPromiseRejection", listener);

                const taskFunc = (): void => {
                    console.info(`${TAG} TaskPool task started`);

                    setTimeout((): void => {
                        console.info(`${TAG} creating delayed rejection`);
                        new Promise<void>((resolve, reject): void => {
                            reject(new Error("Delayed rejection"));
                        });
                    }, 200);
                };

                const task: taskpool.Task = new taskpool.Task(taskFunc);
                const executePromise = taskpool.execute(task);
                taskpool.cancel(task);

                await Utils.msSleep(30);

                console.info(`${TAG} listener triggered: ${listenerTriggered}`);
                expect(listenerTriggered).assertTrue();
                expect((capturedReason!).message).assertContain("task has been canceled");
                console.info(`${TAG} test passed`);
                done();
            });

        /**
         * @tc.number SUB_STD_PROCESS_ON_1900
         * @tc.name testTaskPoolDifferentPriorityTasksRejection
         * @tc.desc TaskPool tasks with different priorities triggering promise rejection
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('testTaskPoolDifferentPriorityTasksRejection', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testTaskPoolDifferentPriorityTasksRejection';
                console.info(`${TAG} test start`);

                let concurrentSet: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>();

                const listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object): void => {
                    concurrentSet.add(reason.message);
                };

                StdProcess.on("unhandledPromiseRejection", listener);

                const highPriorityTask = (): void => {
                    console.info(`${TAG} High priority task`);
                    new Promise<void>((resolve, reject): void => {
                        reject(new Error("High priority error"));
                    });
                };

                const mediumPriorityTask = (): void => {
                    console.info(`${TAG} Medium priority task`);
                    new Promise<void>((resolve, reject): void => {
                        reject(new Error("Medium priority error"));
                    });
                };

                const lowPriorityTask = (): void => {
                    console.info(`${TAG} Low priority task`);
                    new Promise<void>((resolve, reject): void => {
                        reject(new Error("Low priority error"));
                    });
                };

                const task1: taskpool.Task = new taskpool.Task(highPriorityTask);
                const task2: taskpool.Task = new taskpool.Task(mediumPriorityTask);
                const task3: taskpool.Task = new taskpool.Task(lowPriorityTask);

                const promise1 = taskpool.execute(task1, taskpool.Priority.HIGH);
                const promise2 = taskpool.execute(task2, taskpool.Priority.MEDIUM);
                const promise3 = taskpool.execute(task3, taskpool.Priority.LOW);

                await Promise.all([promise1, promise2, promise3]);

                await Utils.msSleep(50);
                expect(concurrentSet.has("High priority error")).assertTrue();
                expect(concurrentSet.has("Medium priority error")).assertTrue();
                expect(concurrentSet.has("Low priority error")).assertTrue();
                console.info(`${TAG} test passed`);
                done();
            });
    });
}
