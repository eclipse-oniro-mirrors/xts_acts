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
    error: Object | null;
}

class CustomError extends Error {
    public errorCode: number;

    constructor(message: string, errorCode: number) {
        super(message);
        this.name = "CustomError";
        this.errorCode = errorCode;
    }

    public getErrorCode(): number {
        return this.errorCode;
    }
}

interface EventTarget {
    listeners: Map<string, Function>

    addEventListener(eventType: string, callback: Function): void

    dispatchEvent(eventType: string): void
};

export default function stdProcessOnUncaughtErrorTest(): void {
    describe("stdProcessOnUncaughtErrorTest", (): void => {
        let capturedError: CapturedError = {
            error: null
        };

        beforeEach((): void => {
            capturedError = {
                error: null
            };
        });

        afterEach(async (): Promise<void> => {
            StdProcess.off("uncaughtError");
            await Utils.msSleep(30);
        });

        /**
         * @tc.number SUB_STD_PROCESS_ON_UNCAUGHT_ERROR_0100
         * @tc.name testRegisterListenerAndCaptureUncaughtError
         * @tc.desc Register listener and capture uncaught error
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it('testRegisterListenerAndCaptureUncaughtError', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testRegisterListenerAndCaptureUncaughtError';
                console.info(`${TAG} test start`);

                const listener: StdProcess.UncaughtErrorListener = (error: Object): void => {
                    console.info(`${TAG} listener triggered`);
                    capturedError.error = error;
                    expect(capturedError.error).not().assertNull();
                    const errorObj: Error = capturedError.error as Error;
                    expect(errorObj.message).assertEqual("uncaught error test");
                    console.info(`${TAG} test passed`);
                    done();
                };

                StdProcess.on("uncaughtError", listener);

                setTimeout((): void => {
                    throw new Error("uncaught error test");
                }, 100);
            });

        /**
         * @tc.number SUB_STD_PROCESS_ON_UNCAUGHT_ERROR_0200
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

                const listener: StdProcess.UncaughtErrorListener = (error: Object): void => {
                    console.info(`${TAG} listener triggered`);
                    capturedError.error = error;
                    expect(capturedError.error).not().assertNull();
                    const errorObj: Error = capturedError.error as Error;
                    expect(errorObj.name).assertEqual("CustomError");
                    expect(errorObj.message).assertEqual("custom error message");
                    expect(errorObj.stack).not().assertNull();
                    console.info(`${TAG} test passed`);
                    done();
                };

                StdProcess.on("uncaughtError", listener);

                const customError: Error = new Error("custom error message");
                customError.name = "CustomError";

                setTimeout((): void => {
                    throw customError;
                }, 100);
            });

        /**
         * @tc.number SUB_STD_PROCESS_ON_UNCAUGHT_ERROR_0300
         * @tc.name testCaptureDifferentErrorTypes
         * @tc.desc Capture different types of Error objects
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it('testCaptureDifferentErrorTypes', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testCaptureDifferentErrorTypes';
                console.info(`${TAG} test start`);

                let typeErrorCaptured: boolean = false;
                let rangeErrorCaptured: boolean = false;
                let syntaxErrorCaptured: boolean = false;

                const listener: StdProcess.UncaughtErrorListener = (error: Object): void => {
                    console.info(`${TAG} listener triggered`);
                    const errorObj: Error = error as Error;
                    if (errorObj instanceof TypeError) {
                        typeErrorCaptured = true;
                        expect(errorObj.name).assertEqual("TypeError");
                    } else if (errorObj instanceof RangeError) {
                        rangeErrorCaptured = true;
                        expect(errorObj.name).assertEqual("RangeError");
                    } else if (errorObj instanceof SyntaxError) {
                        syntaxErrorCaptured = true;
                        expect(errorObj.name).assertEqual("SyntaxError");
                    }
                };

                StdProcess.on("uncaughtError", listener);

                setTimeout((): void => {
                    throw new TypeError("type error");
                }, 50);

                await Utils.msSleep(100);

                setTimeout((): void => {
                    throw new RangeError("range error");
                }, 50);

                await Utils.msSleep(100);

                setTimeout((): void => {
                    throw new SyntaxError("syntax error");
                }, 50);

                await Utils.msSleep(100);

                expect(typeErrorCaptured).assertTrue();
                expect(rangeErrorCaptured).assertTrue();
                expect(syntaxErrorCaptured).assertTrue();
                console.info(`${TAG} test passed`);
                done();
            });

        /**
         * @tc.number SUB_STD_PROCESS_ON_UNCAUGHT_ERROR_0400
         * @tc.name testCaptureCustomErrorSubclass
         * @tc.desc Capture custom Error subclass
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('testCaptureCustomErrorSubclass', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testCaptureCustomErrorSubclass';
                console.info(`${TAG} test start`);
                const listener: StdProcess.UncaughtErrorListener = (error: Object): void => {
                    console.info(`${TAG} listener triggered`);
                    capturedError.error = error;
                };

                StdProcess.on("uncaughtError", listener);

                const customError: CustomError = new CustomError("custom error with code", 404);

                setTimeout((): void => {
                    throw customError;
                }, 50);

                await Utils.msSleep(100);

                expect(capturedError.error).not().assertNull();
                const errorObj: CustomError = capturedError.error as CustomError;
                expect(errorObj.name).assertEqual("CustomError");
                expect(errorObj.message).assertEqual("custom error with code");
                expect(errorObj.errorCode).assertEqual(404);
                expect(errorObj.getErrorCode()).assertEqual(404);
                console.info(`${TAG} test passed`);
                done();
            });

        /**
         * @tc.number SUB_STD_PROCESS_ON_UNCAUGHT_ERROR_0500
         * @tc.name testCaptureErrorInFunctionCallStack
         * @tc.desc Capture error in function call stack
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('testCaptureErrorInFunctionCallStack', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testCaptureErrorInFunctionCallStack';
                console.info(`${TAG} test start`);
                const listener: StdProcess.UncaughtErrorListener = (error: Object): void => {
                    console.info(`${TAG} listener triggered`);
                    capturedError.error = error;
                };

                StdProcess.on("uncaughtError", listener);

                const funcC = (): void => {
                    throw new Error("error in funcC");
                };

                const funcB = (): void => {
                    funcC();
                };

                const funcA = (): void => {
                    funcB();
                };

                setTimeout((): void => {
                    funcA();
                }, 50);

                await Utils.msSleep(100);
                expect(capturedError.error).not().assertNull();
                const errorObj: Error = capturedError.error as Error;
                expect(errorObj.message).assertEqual("error in funcC");
                expect(errorObj.stack).not().assertNull();
                console.info(`${TAG} stack trace: ${errorObj.stack}`);
                console.info(`${TAG} test passed`);

                done();
            });

        /**
         * @tc.number SUB_STD_PROCESS_ON_UNCAUGHT_ERROR_0600
         * @tc.name testRegisterMultipleDifferentListeners
         * @tc.desc Register multiple different listeners and verify the new listener cover the old
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('testRegisterMultipleDifferentListeners', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testRegisterMultipleDifferentListeners';
                console.info(`${TAG} test start`);

                let listener1Called: boolean = false;
                let listener2Called: boolean = false;
                let listener1Error: Object | null = null;
                let listener2Error: Object | null = null;

                const listener1: StdProcess.UncaughtErrorListener = (error: Object): void => {
                    console.info(`${TAG} listener1 triggered`);
                    listener1Called = true;
                    listener1Error = error;
                };

                const listener2: StdProcess.UncaughtErrorListener = (error: Object): void => {
                    console.info(`${TAG} listener2 triggered`);
                    listener2Called = true;
                    listener2Error = error;
                };

                StdProcess.on("uncaughtError", listener1);
                StdProcess.on("uncaughtError", listener2);

                setTimeout((): void => {
                    throw new Error("multiple listeners test");
                }, 20);

                await Utils.msSleep(50);

                expect(listener1Called).assertFalse();
                expect(listener2Called).assertTrue();
                expect(listener1Error).assertNull();
                expect(listener2Error).not().assertNull();
                const errorObj2: Error = listener2Error as Error;
                expect(errorObj2.message).assertEqual("multiple listeners test");
                console.info(`${TAG} test passed`);
                done();
            });

        /**
         * @tc.number SUB_STD_PROCESS_ON_UNCAUGHT_ERROR_0700
         * @tc.name testRegisterSameListenerTwice
         * @tc.desc Register the same listener twice and verify behavior
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('testRegisterSameListenerTwice', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testRegisterSameListenerTwice';
                console.info(`${TAG} test start`);

                let callCount: number = 0;
                let capturedErrorObj: Object | null = null;


                const listener: StdProcess.UncaughtErrorListener = (error: Object): void => {
                    console.info(`${TAG} listener triggered, call count: ${callCount}`);
                    callCount++;
                    capturedErrorObj = error;
                };

                StdProcess.on("uncaughtError", listener);
                StdProcess.on("uncaughtError", listener);

                setTimeout((): void => {
                    throw new Error("same listener test");
                }, 20);

                await Utils.msSleep(100);

                expect(callCount).assertEqual(1);
                expect(capturedErrorObj).not().assertNull();
                const errorObj: Error = capturedErrorObj as Error;
                expect(errorObj.message).assertEqual("same listener test");
                console.info(`${TAG} listener called ${callCount} times`);
                console.info(`${TAG} test passed`);
                done();
            });

        /**
         * @tc.number SUB_STD_PROCESS_ON_UNCAUGHT_ERROR_0800
         * @tc.name testMultipleErrorsThrownSimultaneously
         * @tc.desc Handle multiple errors thrown simultaneously
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('testMultipleErrorsThrownSimultaneously', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testMultipleErrorsThrownSimultaneously';
                console.info(`${TAG} test start`);

                let callCount: number = 0;
                const capturedMessages: string[] = [];

                const listener: StdProcess.UncaughtErrorListener = (error: Object): void => {
                    console.info(`${TAG} listener triggered, call count: ${callCount}`);
                    callCount++;
                    const errorObj: Error = error as Error;
                    capturedMessages.push(errorObj.message);
                };

                StdProcess.on("uncaughtError", listener);

                setTimeout((): void => {
                    throw new Error("error 1");
                }, 10);

                setTimeout((): void => {
                    throw new Error("error 2");
                }, 30);

                setTimeout((): void => {
                    throw new Error("error 3");
                }, 50);

                await Utils.msSleep(100);

                expect(callCount).assertEqual(3);
                expect(capturedMessages.length).assertEqual(3);
                expect(capturedMessages).assertContain("error 1");
                expect(capturedMessages).assertContain("error 2");
                expect(capturedMessages).assertContain("error 3");
                console.info(`${TAG} test passed`);
                done();
            });

        /**
         * @tc.number SUB_STD_PROCESS_ON_UNCAUGHT_ERROR_0900
         * @tc.name testCaptureErrorInSetTimeout
         * @tc.desc Capture error thrown in setTimeout
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('testCaptureErrorInSetTimeout', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testCaptureErrorInSetTimeout';
                console.info(`${TAG} test start`);
                const listener: StdProcess.UncaughtErrorListener = (error: Object): void => {
                    console.info(`${TAG} listener triggered`);
                    capturedError.error = error;
                };

                StdProcess.on("uncaughtError", listener);

                setTimeout((): void => {
                    console.info(`${TAG} throwing error in setTimeout`);
                    throw new Error("setTimeout error");
                }, 10);

                await Utils.msSleep(30);

                expect(capturedError.error).not().assertNull();
                const errorObj: Error = capturedError.error as Error;
                expect(errorObj.message).assertEqual("setTimeout error");
                console.info(`${TAG} test passed`);
                done();
            });

        /**
         * @tc.number SUB_STD_PROCESS_ON_UNCAUGHT_ERROR_1000
         * @tc.name testCaptureErrorInSetInterval
         * @tc.desc Capture error thrown in setInterval
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('testCaptureErrorInSetInterval', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testCaptureErrorInSetInterval';
                console.info(`${TAG} test start`);

                let intervalId: int = 0;
                let errorCaptured: boolean = false;
                const listener: StdProcess.UncaughtErrorListener = (error: Object): void => {
                    console.info(`${TAG} listener triggered`);
                    if (!errorCaptured) {
                        errorCaptured = true;
                        capturedError.error = error;
                    }
                };

                StdProcess.on("uncaughtError", listener);

                let counter: number = 0;
                intervalId = setInterval((): void => {
                    console.info(`${TAG} setInterval callback, counter: ${counter}`);
                    counter++;
                    if (counter === 2) {
                        throw new Error("setInterval error");
                    }
                }, 50);
                await Utils.msSleep(500);
                clearInterval(intervalId);//only clear Intercal, Interval's coroutine can handle the uncaught Error(TBD...)
                await Utils.msSleep(200);
                expect(errorCaptured).assertTrue();
                expect(capturedError.error).not().assertNull();
                const errorObj: Error = capturedError.error as Error;
                expect(errorObj.message).assertEqual("setInterval error");
                console.info(`${TAG} test passed`);

                done();
            });

        /**
         * @tc.number SUB_STD_PROCESS_ON_UNCAUGHT_ERROR_1100
         * @tc.name testCaptureErrorInEventCallback
         * @tc.desc Capture error thrown in event callback
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('testCaptureErrorInEventCallback', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testCaptureErrorInEventCallback';
                console.info(`${TAG} test start`);

                const listener: StdProcess.UncaughtErrorListener = (error: Object): void => {
                    console.info(`${TAG} listener triggered`);
                    capturedError.error = error;
                };

                StdProcess.on("uncaughtError", listener);

                const customEventTarget = {
                    listeners: new Map<string, Function>(),

                    addEventListener(eventType: string, callback: Function): void {
                        this.listeners.set(eventType, callback);
                    },

                    dispatchEvent(eventType: string): void {
                        const callback = this.listeners.get(eventType);
                        if (callback) {
                            callback.unsafeCall();
                        }
                    }
                } as EventTarget;

                customEventTarget.addEventListener("customEvent", (): void => {
                    console.info(`${TAG} event callback triggered`);
                    throw new Error("event callback error");
                });

                setTimeout((): void => {
                    customEventTarget.dispatchEvent("customEvent");
                }, 20);

                await Utils.msSleep(50);

                expect(capturedError.error).not().assertNull();
                const errorObj: Error = capturedError.error as Error;
                expect(errorObj.message).assertEqual("event callback error");
                console.info(`${TAG} test passed`);

                done();
            });

        /**
         * @tc.number SUB_STD_PROCESS_ON_UNCAUGHT_ERROR_1200
         * @tc.name testRegisterListenerInEAWorkerAndThrowError
         * @tc.desc Register listener in EAWorker thread and throw error
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('testRegisterListenerInEAWorkerAndThrowError', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testRegisterListenerInEAWorkerAndThrowError';
                console.info(`${TAG} test start`);

                let workerListenerTriggered: boolean = false;
                let workerCapturedError: Object | null = null;

                const eaw: EAWorker = new EAWorker();
                eaw.start();

                eaw.run<void>((): void => {
                    console.info(`${TAG} running in EAWorker thread`);

                    const listener: StdProcess.UncaughtErrorListener = (error: Object): void => {
                        console.info(`${TAG} EAWorker listener triggered`);
                        workerListenerTriggered = true;
                        workerCapturedError = error;
                    };

                    StdProcess.on("uncaughtError", listener);

                    setTimeout((): void => {
                        throw new Error("EAWorker uncaught error");
                    }, 20);
                });

                await Utils.msSleep(100);
                eaw.join();

                console.info(`${TAG} worker listener triggered: ${workerListenerTriggered}`);
                expect(workerListenerTriggered).assertTrue();
                expect((workerCapturedError! as Error).message).assertEqual("EAWorker uncaught error");
                console.info(`${TAG} test passed`);

                done();
            });

        /**
         * @tc.number SUB_STD_PROCESS_ON_UNCAUGHT_ERROR_1300
         * @tc.name testMainThreadListenerCaptureEAWorkerError
         * @tc.desc Main thread listener captures EAWorker thread error
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('testMainThreadListenerCaptureEAWorkerError', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testMainThreadListenerCaptureEAWorkerError';
                console.info(`${TAG} test start`);

                let mainThreadListenerTriggered: boolean = false;
                let mainThreadCapturedError: Object | null = null;

                const listener: StdProcess.UncaughtErrorListener = (error: Object): void => {
                    console.info(`${TAG} main thread listener triggered`);
                    mainThreadListenerTriggered = true;
                    mainThreadCapturedError = error;
                };

                StdProcess.on("uncaughtError", listener);

                const eaw: EAWorker = new EAWorker();
                eaw.start();

                eaw.run<void>((): void => {
                    console.info(`${TAG} throwing error in EAWorker thread`);
                    setTimeout((): void => {
                        throw new Error("EAWorker thread error");
                    }, 20);
                });

                await Utils.msSleep(50);
                eaw.join();

                console.info(`${TAG} main thread listener triggered: ${mainThreadListenerTriggered}`);
                expect(mainThreadListenerTriggered).assertEqual(true);
                expect((mainThreadCapturedError! as Error).message).assertEqual("EAWorker thread error")
                console.info(`${TAG} test passed`);

                done();
            });

        /**
         * @tc.number SUB_STD_PROCESS_ON_UNCAUGHT_ERROR_1400
         * @tc.name testSeparateListenersInMainThreadAndEAWorker
         * @tc.desc EAWorker and main thread register separate listeners
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('testSeparateListenersInMainThreadAndEAWorker', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testSeparateListenersInMainThreadAndEAWorker';
                console.info(`${TAG} test start`);

                let mainListenerCalled: boolean = false;
                let mainListenerError: Object | null = null;
                let workerListenerCalled: boolean = false;
                let workerListenerError: Object | null = null;

                const mainListener: StdProcess.UncaughtErrorListener = (error: Object): void => {
                    console.info(`${TAG} main listener triggered`);
                    mainListenerCalled = true;
                    mainListenerError = error;
                };

                StdProcess.on("uncaughtError", mainListener);

                const eaw: EAWorker = new EAWorker();
                eaw.start();

                eaw.run<void>((): void => {
                    console.info(`${TAG} registering listener in EAWorker`);

                    const workerListener: StdProcess.UncaughtErrorListener = (error: Object): void => {
                        console.info(`${TAG} worker listener triggered`);
                        workerListenerCalled = true;
                        workerListenerError = error;
                    };

                    StdProcess.on("uncaughtError", workerListener);

                    setTimeout((): void => {
                        throw new Error("EAWorker thread error");
                    }, 50);
                });

                setTimeout((): void => {
                    throw new Error("Main thread error");
                }, 50);

                await Utils.msSleep(200);
                eaw.join();

                console.info(`${TAG} main listener called: ${mainListenerCalled}`);
                console.info(`${TAG} worker listener called: ${workerListenerCalled}`);
                expect(mainListenerCalled).assertFalse();
                expect(workerListenerCalled).assertTrue();
                console.info(`${TAG} test passed`);

                done();
            });

        /**
         * @tc.number SUB_STD_PROCESS_ON_UNCAUGHT_ERROR_1500
         * @tc.name testMultipleEAWorkersThrowErrorSimultaneously
         * @tc.desc Multiple EAWorker threads throw errors simultaneously
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('testMultipleEAWorkersThrowErrorSimultaneously', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testMultipleEAWorkersThrowErrorSimultaneously';
                console.info(`${TAG} test start`);

                let callCount: number = 0;
                const capturedMessages: string[] = [];
                const listener: StdProcess.UncaughtErrorListener = (error: Object): void => {
                    console.info(`${TAG} listener triggered, count: ${callCount}`);
                    callCount++;
                    const errorObj: Error = error as Error;
                    capturedMessages.push(errorObj.message);
                };

                StdProcess.on("uncaughtError", listener);

                const workers: EAWorker[] = [];

                for (let i: number = 0; i < 3; i++) {
                    const eaw: EAWorker = new EAWorker();
                    eaw.start();
                    workers.push(eaw);

                    const errorMsg: string = `Worker ${i} error`;
                    eaw.run<void>((): void => {
                        console.info(`${TAG} EAWorker ${i} throwing error`);
                        setTimeout((): void => {
                            throw new Error(errorMsg);
                        }, 50);
                    });
                }

                await Utils.msSleep(200);

                for (const eaw of workers) {
                    eaw.join();
                }

                console.info(`${TAG} total calls: ${callCount}`);
                console.info(`${TAG} captured messages: ${capturedMessages}`);
                expect(callCount).assertEqual(3);
                expect(capturedMessages.length).assertEqual(3);
                expect(capturedMessages).assertContain("Worker 0 error");
                expect(capturedMessages).assertContain("Worker 1 error");
                expect(capturedMessages).assertContain("Worker 2 error");

                console.info(`${TAG} test passed`);
                done();
            });

        /**
         * @tc.number SUB_STD_PROCESS_ON_UNCAUGHT_ERROR_1600
         * @tc.name testEAWorkerDestroyWithUncaughtError
         * @tc.desc EAWorker thread destruction with uncaught error
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('testEAWorkerDestroyWithUncaughtError', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testEAWorkerDestroyWithUncaughtError';
                console.info(`${TAG} test start`);

                let listenerCalled: boolean = false;
                let capturedErrorObj: Object | null = null;
                let workerTerminated: boolean = false;

                const listener: StdProcess.UncaughtErrorListener = (error: Object): void => {
                    console.info(`${TAG} listener triggered`);
                    listenerCalled = true;
                    capturedErrorObj = error;
                };

                StdProcess.on("uncaughtError", listener);

                const eaw: EAWorker = new EAWorker();
                eaw.start();

                eaw.run<void>((): void => {
                    console.info(`${TAG} creating error in EAWorker`);
                    setTimeout((): void => {
                        throw new Error("EAWorker destruction error");
                    }, 20);
                });

                await Utils.msSleep(50);

                eaw.quit();

                expect(listenerCalled).assertTrue();
                expect((capturedErrorObj! as Error).message).assertEqual("EAWorker destruction error");

                console.info(`${TAG} listener called: ${listenerCalled}`);
                console.info(`${TAG} test passed`);
                done();
            });

        /**
         * @tc.number SUB_STD_PROCESS_ON_UNCAUGHT_ERROR_1700
         * @tc.name testRegisterListenerInTaskPoolTask
         * @tc.desc Register listener in TaskPool task and throw error
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('testRegisterListenerInTaskPoolTask', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testRegisterListenerInTaskPoolTask';
                console.info(`${TAG} test start`);

                let taskListenerTriggered: boolean = false;
                let taskCapturedError: Object | null = null;

                const taskFunc = (): void => {
                    console.info(`${TAG} running in TaskPool task`);

                    const listener: StdProcess.UncaughtErrorListener = (error: Object): void => {
                        console.info(`${TAG} TaskPool listener triggered`);
                        taskListenerTriggered = true;
                        taskCapturedError = error;
                    };

                    StdProcess.on("uncaughtError", listener);

                    setTimeout((): void => {
                        throw new Error("TaskPool uncaught error");
                    }, 20);
                };

                const task: taskpool.Task = new taskpool.Task(taskFunc);
                await taskpool.execute(task);

                await Utils.msSleep(50);

                console.info(`${TAG} task listener triggered: ${taskListenerTriggered}`);
                expect(taskListenerTriggered).assertEqual(true);
                expect((taskCapturedError! as Error).message).assertEqual("TaskPool uncaught error");
                console.info(`${TAG} test passed`);
                done();
            });

        /**
         * @tc.number SUB_STD_PROCESS_ON_UNCAUGHT_ERROR_1800
         * @tc.name testMainThreadListenerCaptureTaskPoolError
         * @tc.desc Main thread listener captures TaskPool task error
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('testMainThreadListenerCaptureTaskPoolError', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testMainThreadListenerCaptureTaskPoolError';
                console.info(`${TAG} test start`);

                let mainThreadListenerTriggered: boolean = false;
                let mainThreadCapturedError: Object | null = null;

                const listener: StdProcess.UncaughtErrorListener = (error: Object): void => {
                    console.info(`${TAG} main thread listener triggered`);
                    mainThreadListenerTriggered = true;
                    mainThreadCapturedError = error;
                };

                StdProcess.on("uncaughtError", listener);

                const taskFunc = (): void => {
                    console.info(`${TAG} throwing error in TaskPool task`);
                    setTimeout((): void => {
                        throw new Error("TaskPool task error");
                    }, 30);
                };

                const task: taskpool.Task = new taskpool.Task(taskFunc);
                await taskpool.execute(task);

                await Utils.msSleep(100);

                console.info(`${TAG} main thread listener triggered: ${mainThreadListenerTriggered}`);
                expect(mainThreadListenerTriggered).assertTrue();
                expect((mainThreadCapturedError as Error)!.message).assertEqual("TaskPool task error");
                console.info(`${TAG} test passed`);
                done();
            });

        /**
         * @tc.number SUB_STD_PROCESS_ON_UNCAUGHT_ERROR_1900
         * @tc.name testTaskGroupMultipleTasksError
         * @tc.desc TaskGroup with multiple tasks throwing errors
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('testTaskGroupMultipleTasksError', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testTaskGroupMultipleTasksError';
                console.info(`${TAG} test start`);

                let callCount: number = 0;
                const capturedMessages: string[] = [];

                const listener: StdProcess.UncaughtErrorListener = (error: Object): void => {
                    console.info(`${TAG} listener triggered, count: ${callCount}`);
                    callCount++;
                    const errorObj: Error = error as Error;
                    capturedMessages.push(errorObj.message);
                };

                StdProcess.on("uncaughtError", listener);

                const taskFunc1 = (): void => {
                    console.info(`${TAG} TaskGroup task 1`);
                    setTimeout((): void => {
                        throw new Error("TaskGroup task 1 error");
                    }, 50);
                };

                const taskFunc2 = (): void => {
                    console.info(`${TAG} TaskGroup task 2`);
                    setTimeout((): void => {
                        throw new Error("TaskGroup task 2 error");
                    }, 50);
                };

                const taskFunc3 = (): void => {
                    console.info(`${TAG} TaskGroup task 3`);
                    setTimeout((): void => {
                        throw new Error("TaskGroup task 3 error");
                    }, 50);
                };

                const taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
                taskGroup.addTask(taskFunc1);
                taskGroup.addTask(taskFunc2);
                taskGroup.addTask(taskFunc3);

                await taskpool.execute(taskGroup);

                await Utils.msSleep(200);

                console.info(`${TAG} total calls: ${callCount}`);
                console.info(`${TAG} captured messages: ${capturedMessages}`);
                expect(callCount).assertEqual(3);
                expect(capturedMessages.length).assertEqual(3);
                expect(capturedMessages).assertContain("TaskGroup task 1 error");
                expect(capturedMessages).assertContain("TaskGroup task 2 error");
                expect(capturedMessages).assertContain("TaskGroup task 3 error");
                console.info(`${TAG} test passed`);

                done();
            });

        /**
         * @tc.number SUB_STD_PROCESS_ON_UNCAUGHT_ERROR_2100
         * @tc.name testTaskPoolDifferentPriorityTasksError
         * @tc.desc TaskPool tasks with different priorities throwing errors
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('testTaskPoolDifferentPriorityTasksError', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testTaskPoolDifferentPriorityTasksError';
                console.info(`${TAG} test start`);

                let callCount: number = 0;
                const capturedMessages: string[] = [];

                const listener: StdProcess.UncaughtErrorListener = (error: Object): void => {
                    console.info(`${TAG} listener triggered, count: ${callCount}`);
                    callCount++;
                    const errorObj: Error = error as Error;
                    capturedMessages.push(errorObj.message);
                };

                StdProcess.on("uncaughtError", listener);

                const highPriorityTask = (): void => {
                    console.info(`${TAG} High priority task`);
                    setTimeout((): void => {
                        throw new Error("High priority error");
                    }, 30);
                };

                const mediumPriorityTask = (): void => {
                    console.info(`${TAG} Medium priority task`);
                    setTimeout((): void => {
                        throw new Error("Medium priority error");
                    }, 30);
                };

                const lowPriorityTask = (): void => {
                    console.info(`${TAG} Low priority task`);
                    setTimeout((): void => {
                        throw new Error("Low priority error");
                    }, 30);
                };

                const task1: taskpool.Task = new taskpool.Task(highPriorityTask);
                const task2: taskpool.Task = new taskpool.Task(mediumPriorityTask);
                const task3: taskpool.Task = new taskpool.Task(lowPriorityTask);

                const promise1 = taskpool.execute(task1, taskpool.Priority.HIGH);
                const promise2 = taskpool.execute(task2, taskpool.Priority.MEDIUM);
                const promise3 = taskpool.execute(task3, taskpool.Priority.LOW);

                await Promise.all([promise1, promise2, promise3]);

                await Utils.msSleep(200);

                console.info(`${TAG} total calls: ${callCount}`);
                console.info(`${TAG} captured messages: ${capturedMessages}`);
                expect(callCount).assertEqual(3);
                expect(capturedMessages.length).assertEqual(3);
                expect(capturedMessages).assertContain("High priority error");
                expect(capturedMessages).assertContain("Medium priority error");
                expect(capturedMessages).assertContain("Low priority error");
                console.info(`${TAG} test passed`);
                done();
            });
    });
}
