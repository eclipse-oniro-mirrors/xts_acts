/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";

class TestData {
    value: int = 0;
    name: string = "";
}

class ResultData {
    sum: int = 0;
    count: int = 0;
}

class SharedData {
    value: int = 0;
}

class InnerData {
    value: int = 0;
}

class OuterData {
    inner: InnerData = new InnerData();
    name: string = "";
}

export default function EAWorkerPostToMainTest(): void {
    describe("EAWorkerPostToMainTest", (): void => {

        /**
         * @tc.number SUB_COMMONLIBRARY_EAWORKER_POSTTOMAIN_BASIC_0100
         * @tc.name testPostToMainBasicFunction
         * @tc.desc Test EAWorker.postToMain basic function with simple task
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level0
         */
        it("testPostToMainBasicFunction", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testPostToMainBasicFunction';
                console.info(`${TAG} test start`);
                const worker = new EAWorker();
                let mainThreadId: int = -1;
                let executedInMainThread: boolean = false;

                try {
                    worker.start();
                    mainThreadId = EAWorker.main()!.getWorkerId() as int;

                    let resolver: ((val: Any)=>void) | undefined = undefined;
                    let waiter = new Promise<Any>((resolve)=>{
                        resolver = resolve;
                    })
                    worker.run<void>((): void => {
                        EAWorker.postToMain<void>((): void => {
                            const currentId = EAWorker.current()!.getWorkerId() as int;
                            if (currentId === mainThreadId) {
                                executedInMainThread = true;
                                resolver!(undefined);
                            }
                        });
                    });
                    await waiter
                    expect(executedInMainThread).assertTrue();
                } catch (error) {
                    console.error(`${TAG} catch error: ${error.message}`);
                    expect(false).assertFail();
                } finally {
                    try {
                        worker.quit();
                    } catch (error) {
                        console.warn(`${TAG} catch quit error: ${error.message}`);
                    }
                    console.info(`${TAG} test end`);
                    done();
                }
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_EAWORKER_POSTTOMAIN_BASIC_0200
         * @tc.name testPostToMainWithReturnType
         * @tc.desc Test EAWorker.postToMain with return value
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level0
         */
        it("testPostToMainWithReturnType", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testPostToMainWithReturnType';
                console.info(`${TAG} test start`);
                const worker = new EAWorker();
                let result: int = 0;

                try {
                    worker.start();
                    let resolver: ((val: Any)=>void) | undefined = undefined;
                    let waiter = new Promise<Any>((resolve)=>{
                        resolver = resolve;
                    })
                    worker.run<void>((): void => {
                        EAWorker.postToMain<int>((): int => {
                            return 42;
                        }).then((workerresult: int): void => {
                            result = workerresult;
                            resolver!(undefined);
                        })
                    });
                    await waiter
                    expect(result).assertEqual(42);
                } catch (error) {
                    console.error(`${TAG} catch error: ${error.message}`);
                    expect(false).assertFail();
                } finally {
                    try {
                        worker.quit();
                    } catch (error) {
                        console.warn(`${TAG} catch quit error: ${error.message}`);
                    }
                    console.info(`${TAG} test end`);
                    done();
                }
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_EAWORKER_POSTTOMAIN_BASIC_0300
         * @tc.name testPostToMainWithSingleArg
         * @tc.desc Test EAWorker.postToMain with single argument
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level0
         */
        it("testPostToMainWithSingleArg", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testPostToMainWithSingleArg';
                console.info(`${TAG} test start`);
                const worker = new EAWorker();
                let result: int = 0;

                try {
                    worker.start();

                    let resolver: ((val: Any)=>void) | undefined = undefined;
                    let waiter = new Promise<Any>((resolve)=>{
                        resolver = resolve;
                    })
                    worker.run<void>((): void => {
                        EAWorker.postToMain<int>((arg: int): int => {
                            return arg * 2;
                        }, 21).then((workerresult: int): void => {
                            result = workerresult;
                            resolver!(undefined);
                        });
                    });
                    await waiter

                    expect(result).assertEqual(42);
                } catch (error) {
                    console.error(`${TAG} catch error: ${error.message}`);
                    expect(false).assertFail();
                } finally {
                    try {
                        worker.quit();
                    } catch (error) {
                        console.warn(`${TAG} catch quit error: ${error.message}`);
                    }
                    console.info(`${TAG} test end`);
                    done();
                }
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_EAWORKER_POSTTOMAIN_BASIC_0400
         * @tc.name testPostToMainWithMultipleArgs
         * @tc.desc Test EAWorker.postToMain with multiple arguments
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level0
         */
        it("testPostToMainWithMultipleArgs", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testPostToMainWithMultipleArgs';
                console.info(`${TAG} test start`);
                const worker = new EAWorker();
                let result: int = 0;

                try {
                    worker.start();

                    let resolver: ((val: Any)=>void) | undefined = undefined;
                    let waiter = new Promise<Any>((resolve)=>{
                        resolver = resolve;
                    })
                    worker.run<void>((): void => {
                        EAWorker.postToMain<int>((a: int, b: int, c: int): int => {
                            return a + b + c;
                        }, 10, 20, 30).then((workerresult: int): void => {
                            result = workerresult;
                            resolver!(undefined);
                        });
                    });
                    await waiter

                    expect(result).assertEqual(60);
                } catch (error) {
                    console.error(`${TAG} catch error: ${error.message}`);
                    expect(false).assertFail();
                } finally {
                    try {
                        worker.quit();
                    } catch (error) {
                        console.warn(`${TAG} catch quit error: ${error.message}`);
                    }
                    console.info(`${TAG} test end`);
                    done();
                }
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_EAWORKER_POSTTOMAIN_BASIC_0500
         * @tc.name testPostToMainWithStringArg
         * @tc.desc Test EAWorker.postToMain with string argument
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level1
         */
        it("testPostToMainWithStringArg", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testPostToMainWithStringArg';
                console.info(`${TAG} test start`);
                const worker = new EAWorker();
                let result: string = "";

                try {
                    worker.start();
                    let resolver: ((val: Any)=>void) | undefined = undefined;
                    let waiter = new Promise<Any>((resolve)=>{
                        resolver = resolve;
                    })
                    worker.run<void>((): void => {
                        EAWorker.postToMain<string>((str: string): string => {
                            return "Hello " + str;
                        }, "World").then((workerresult: string): void => {
                            result = workerresult;
                            resolver!(undefined);
                        });
                    });
                    await waiter
                    expect(result).assertEqual("Hello World");
                } catch (error) {
                    console.error(`${TAG} catch error: ${error.message}`);
                    expect(false).assertFail();
                } finally {
                    try {
                        worker.quit();
                    } catch (error) {
                        console.warn(`${TAG} catch quit error: ${error.message}`);
                    }
                    console.info(`${TAG} test end`);
                    done();
                }
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_EAWORKER_POSTTOMAIN_BASIC_0600
         * @tc.name testPostToMainWithBooleanArg
         * @tc.desc Test EAWorker.postToMain with boolean argument
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level1
         */
        it("testPostToMainWithBooleanArg", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testPostToMainWithBooleanArg';
                console.info(`${TAG} test start`);
                const worker = new EAWorker();
                let result: boolean = false;

                try {
                    worker.start();

                    let resolver: ((val: Any)=>void) | undefined = undefined;
                    let waiter = new Promise<Any>((resolve)=>{
                        resolver = resolve;
                    })
                    worker.run<void>((): void => {
                        EAWorker.postToMain<boolean>((flag: boolean): boolean => {
                            return !flag;
                        }, false).then((workerresult: boolean): void => {
                            result = workerresult;
                            resolver!(undefined);
                        });
                    });
                    await waiter
                    expect(result).assertTrue();
                } catch (error) {
                    console.error(`${TAG} catch error: ${error.message}`);
                    expect(false).assertFail();
                } finally {
                    try {
                        worker.quit();
                    } catch (error) {
                        console.warn(`${TAG} catch quit error: ${error.message}`);
                    }
                    console.info(`${TAG} test end`);
                    done();
                }
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_EAWORKER_POSTTOMAIN_BASIC_0700
         * @tc.name testPostToMainWithObjectArg
         * @tc.desc Test EAWorker.postToMain with object argument
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level1
         */
        it("testPostToMainWithObjectArg", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testPostToMainWithObjectArg';
                console.info(`${TAG} test start`);
                const worker = new EAWorker();
                let result: TestData = new TestData();

                try {
                    worker.start();

                    let resolver: ((val: Any)=>void) | undefined = undefined;
                    let waiter = new Promise<Any>((resolve)=>{
                        resolver = resolve;
                    })
                    worker.run<void>((): void => {
                        const input = new TestData();
                        input.value = 10;
                        input.name = "test";

                        EAWorker.postToMain<TestData>((data: TestData): TestData => {
                            data.value = data.value * 2;
                            data.name = data.name + "_modified";
                            return data;
                        }, input).then((workerresult: TestData): void => {
                            result = workerresult;
                            resolver!(undefined);
                        });
                    });
                    await waiter
                    expect(result.value).assertEqual(20);
                    expect(result.name).assertEqual("test_modified");
                } catch (error) {
                    console.error(`${TAG} catch error: ${error.message}`);
                    expect(false).assertFail();
                } finally {
                    try {
                        worker.quit();
                    } catch (error) {
                        console.warn(`${TAG} catch quit error: ${error.message}`);
                    }
                    console.info(`${TAG} test end`);
                    done();
                }
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_EAWORKER_POSTTOMAIN_BASIC_0800
         * @tc.name testPostToMainWithArrayArg
         * @tc.desc Test EAWorker.postToMain with array argument
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level1
         */
        it("testPostToMainWithArrayArg", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testPostToMainWithArrayArg';
                console.info(`${TAG} test start`);
                const worker = new EAWorker();
                let result: int = 0;

                try {
                    worker.start();

                    let resolver: ((val: Any)=>void) | undefined = undefined;
                    let waiter = new Promise<Any>((resolve)=>{
                        resolver = resolve;
                    })
                    worker.run<void>((): void => {
                        const arr: Array<int> = [1, 2, 3, 4, 5];

                        EAWorker.postToMain<int>((data: Array<int>): int => {
                            let sum: int = 0;
                            for (let i = 0; i < data.length; i++) {
                                sum += data[i];
                            }
                            return sum;
                        }, arr).then((workerresult: int): void => {
                            result = workerresult;
                            resolver!(undefined);
                        });
                    });
                    await waiter
                    expect(result).assertEqual(15);
                } catch (error) {
                    console.error(`${TAG} catch error: ${error.message}`);
                    expect(false).assertFail();
                } finally {
                    try {
                        worker.quit();
                    } catch (error) {
                        console.warn(`${TAG} catch quit error: ${error.message}`);
                    }
                    console.info(`${TAG} test end`);
                    done();
                }
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_EAWORKER_POSTTOMAIN_BASIC_0900
         * @tc.name testPostToMainReturnObject
         * @tc.desc Test EAWorker.postToMain return object
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level1
         */
        it("testPostToMainReturnObject", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testPostToMainReturnObject';
                console.info(`${TAG} test start`);
                const worker = new EAWorker();
                let result: ResultData = new ResultData();

                try {
                    worker.start();

                    let resolver: ((val: Any)=>void) | undefined = undefined;
                    let waiter = new Promise<Any>((resolve)=>{
                        resolver = resolve;
                    })
                    worker.run<void>((): void => {
                        EAWorker.postToMain<ResultData>((): ResultData => {
                            const r = new ResultData();
                            r.sum = 100;
                            r.count = 10;
                            return r;
                        }).then((workerresult: ResultData): void => {
                            result = workerresult;
                            resolver!(undefined);
                        });
                    });
                    await waiter
                    expect(result.sum).assertEqual(100);
                    expect(result.count).assertEqual(10);
                } catch (error) {
                    console.error(`${TAG} catch error: ${error.message}`);
                    expect(false).assertFail();
                } finally {
                    try {
                        worker.quit();
                    } catch (error) {
                        console.warn(`${TAG} catch quit error: ${error.message}`);
                    }
                    console.info(`${TAG} test end`);
                    done();
                }
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_EAWORKER_POSTTOMAIN_BASIC_1000
         * @tc.name testPostToMainReturnArray
         * @tc.desc Test EAWorker.postToMain return array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level1
         */
        it("testPostToMainReturnArray", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testPostToMainReturnArray';
                console.info(`${TAG} test start`);
                const worker = new EAWorker();
                let result: Array<int> = new Array<int>();

                try {
                    worker.start();
                    let resolver: ((val: Any)=>void) | undefined = undefined;
                    let waiter = new Promise<Any>((resolve)=>{
                        resolver = resolve;
                    })
                    worker.run<void>((): void => {
                        EAWorker.postToMain<Array<int>>((): Array<int> => {
                            const arr: Array<int> = [10, 20, 30, 40, 50];
                            return arr;
                        }).then((workerresult: Array<int>): void => {
                            result = workerresult;
                            resolver!(undefined);
                        });
                    });
                    await waiter
                    expect(result.length).assertEqual(5);
                    expect(result[0]).assertEqual(10);
                    expect(result[4]).assertEqual(50);
                } catch (error) {
                    console.error(`${TAG} catch error: ${error.message}`);
                    expect(false).assertFail();
                } finally {
                    try {
                        worker.quit();
                    } catch (error) {
                        console.warn(`${TAG} catch quit error: ${error.message}`);
                    }
                    console.info(`${TAG} test end`);
                    done();
                }
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_EAWORKER_POSTTOMAIN_EXCEPTION_0100
         * @tc.name testPostToMainExceptionHandling
         * @tc.desc Test EAWorker.postToMain exception handling
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level1
         */
        it("testPostToMainExceptionHandling", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testPostToMainExceptionHandling';
                console.info(`${TAG} test start`);
                const worker = new EAWorker();
                let exceptionCaught: boolean = false;

                try {
                    worker.start();

                    let resolver: ((val: Any)=>void) | undefined = undefined;
                    let waiter = new Promise<Any>((resolve)=>{
                        resolver = resolve;
                    })
                    await worker.run<void>(async (): void => {
                        try {
                            await EAWorker.postToMain<int>((): int => {
                                throw new Error("Test exception in postToMain");
                            })
                        } catch (e) {
                            exceptionCaught = true;
                            resolver!(undefined);
                        }
                    });
                    await waiter
                    expect(exceptionCaught).assertTrue();
                } catch (error) {
                    console.error(`${TAG} catch error: ${error.message}`);
                } finally {
                    try {
                        worker.quit();
                    } catch (error) {
                        console.warn(`${TAG} catch quit error: ${error.message}`);
                    }
                    console.info(`${TAG} test end`);
                    done();
                }
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_EAWORKER_POSTTOMAIN_CONCURRENT_0100
         * @tc.name testPostToMainMultipleCalls
         * @tc.desc Test EAWorker.postToMain multiple calls in same worker
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level1
         */
        it("testPostToMainMultipleCalls", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testPostToMainMultipleCalls';
                console.info(`${TAG} test start`);
                const worker = new EAWorker();
                let result: int = 0;

                try {
                    worker.start();

                    let resolver: ((val: Any)=>void) | undefined = undefined;
                    let waiter = new Promise<Any>((resolve)=>{
                        resolver = resolve;
                    })
                    worker.run<void>((): void => {
                        EAWorker.postToMain<int>((): int => {
                            return 10;
                        }).then((workerresult: int): void => {
                            result += workerresult;
                        });
                        EAWorker.postToMain<int>((): int => {
                            return 20;
                        }).then((workerresult: int): void => {
                            result += workerresult;
                        });
                        EAWorker.postToMain<int>((): int => {
                            return 30;
                        }).then((workerresult: int): void => {
                            result += workerresult;
                            resolver!(undefined);
                        });
                    });
                    await waiter
                    expect(result).assertEqual(60);
                } catch (error) {
                    console.error(`${TAG} catch error: ${error.message}`);
                    expect(false).assertFail();
                } finally {
                    try {
                        worker.quit();
                    } catch (error) {
                        console.warn(`${TAG} catch quit error: ${error.message}`);
                    }
                    console.info(`${TAG} test end`);
                    done();
                }
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_EAWORKER_POSTTOMAIN_CONCURRENT_0200
         * @tc.name testPostToMainFromMultipleWorkers
         * @tc.desc Test EAWorker.postToMain from multiple workers
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level2
         */
        it("testPostToMainFromMultipleWorkers", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testPostToMainFromMultipleWorkers';
                console.info(`${TAG} test start`);
                const numWorkers: int = 3;
                const workers = Array.create<EAWorker | undefined>(numWorkers, undefined);
                const jobs = Array.create<Promise<void> | undefined>(numWorkers, undefined);
                let counter: int = 0;

                try {
                    for (let i = 0; i < numWorkers; i++) {
                        workers[i] = new EAWorker();
                        workers[i]!.start();
                    }

                    let resolver: ((val: Any)=>void) | undefined = undefined;
                    let waiter = new Promise<Any>((resolve)=>{
                        resolver = resolve;
                    })
                    for (let i = 0; i < numWorkers; i++) {
                        const workerId = i;
                        jobs[i] = workers[i]!.run<void>((): void => {
                            const jobInMain = EAWorker.postToMain<void>((): void => {
                                counter++;
                                if (counter === numWorkers) {
                                    resolver!(undefined);
                                }
                            });
                        })
                    }

                    for (let i = 0; i < numWorkers; i++) {
                        await jobs[i]!;
                    }
                    await waiter
                    expect(counter).assertEqual(3);
                } catch (error) {
                    console.error(`${TAG} catch error: ${error.message}`);
                    expect(false).assertFail();
                } finally {
                    for (let i = 0; i < numWorkers; i++) {
                        try {
                            workers[i]!.quit();
                        } catch (error) {
                            console.warn(`${TAG} catch quit error for worker ${i}: ${error.message}`);
                        }
                    }
                    console.info(`${TAG} test end`);
                    done();
                }
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_EAWORKER_POSTTOMAIN_CONCURRENT_0300
         * @tc.name testPostToMainSequentialExecution
         * @tc.desc Test EAWorker.postToMain tasks execute sequentially
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level2
         */
        it("testPostToMainSequentialExecution", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testPostToMainSequentialExecution';
                console.info(`${TAG} test start`);
                const worker = new EAWorker();
                const executionOrder: Array<int> = new Array<int>();

                try {
                    worker.start();

                    let resolver: ((val: Any)=>void) | undefined = undefined;
                    let waiter = new Promise<Any>((resolve)=>{
                        resolver = resolve;
                    })
                    await worker.run<void>((): void => {
                        EAWorker.postToMain<void>((): void => {
                            executionOrder.push(1);
                        });
                        EAWorker.postToMain<void>((): void => {
                            executionOrder.push(2);
                        });
                        EAWorker.postToMain<void>((): void => {
                            executionOrder.push(3);
                            resolver!(undefined);
                        });
                    });
                    await waiter
                    expect(executionOrder.length).assertEqual(3);
                    expect(executionOrder[0]).assertEqual(1);
                    expect(executionOrder[1]).assertEqual(2);
                    expect(executionOrder[2]).assertEqual(3);
                } catch (error) {
                    console.error(`${TAG} catch error: ${error.message}`);
                    expect(false).assertFail();
                } finally {
                    try {
                        worker.quit();
                    } catch (error) {
                        console.warn(`${TAG} catch quit error: ${error.message}`);
                    }
                    console.info(`${TAG} test end`);
                    done();
                }
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_EAWORKER_POSTTOMAIN_CONCURRENT_0400
         * @tc.name testPostToMainWithDataSharing
         * @tc.desc Test EAWorker.postToMain with shared data modification
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level2
         */
        it("testPostToMainWithDataSharing", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testPostToMainWithDataSharing';
                console.info(`${TAG} test start`);
                const worker = new EAWorker();
                const sharedData = new SharedData();
                let result: int = 0;

                try {
                    worker.start();
                    
                    let resolver: ((val: Any)=>void) | undefined = undefined;
                    let waiter = new Promise<Any>((resolve)=>{
                        resolver = resolve;
                    })
                    worker.run<void>((): void => {
                        EAWorker.postToMain<void>((): void => {
                            sharedData.value = 100;
                        });

                        EAWorker.postToMain<int>((): int => {
                            return sharedData.value * 2;
                        }).then((workerresult: int): void => {
                            result = workerresult;
                            resolver!(undefined);
                        });
                    });
                    await waiter
                    expect(result).assertEqual(200);
                    expect(sharedData.value).assertEqual(100);
                } catch (error) {
                    console.error(`${TAG} catch error: ${error.message}`);
                    expect(false).assertFail();
                } finally {
                    try {
                        worker.quit();
                    } catch (error) {
                        console.warn(`${TAG} catch quit error: ${error.message}`);
                    }
                    console.info(`${TAG} test end`);
                    done();
                }
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_EAWORKER_POSTTOMAIN_EDGE_0100
         * @tc.name testPostToMainWithNullArg
         * @tc.desc Test EAWorker.postToMain with null argument
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level2
         */
        it("testPostToMainWithNullArg", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testPostToMainWithNullArg';
                console.info(`${TAG} test start`);
                const worker = new EAWorker();
                let result: int | null = 0;

                try {
                    worker.start();

                    let resolver: ((val: Any)=>void) | undefined = undefined;
                    let waiter = new Promise<Any>((resolve)=>{
                        resolver = resolve;
                    })
                    worker.run<void>((): void => {
                        EAWorker.postToMain<int | null>((arg: int | null): int | null => {
                            return arg;
                        }, null).then((workerresult: int | null): void => {
                            result = workerresult;
                            resolver!(undefined);
                        });
                    });
                    await waiter

                    expect(result).assertNull();
                } catch (error) {
                    console.error(`${TAG} catch error: ${error.message}`);
                    expect(false).assertFail();
                } finally {
                    try {
                        worker.quit();
                    } catch (error) {
                        console.warn(`${TAG} catch quit error: ${error.message}`);
                    }
                    console.info(`${TAG} test end`);
                    done();
                }
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_EAWORKER_POSTTOMAIN_EDGE_0200
         * @tc.name testPostToMainWithUndefinedArg
         * @tc.desc Test EAWorker.postToMain with undefined argument
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level2
         */
        it("testPostToMainWithUndefinedArg", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testPostToMainWithUndefinedArg';
                console.info(`${TAG} test start`);
                const worker = new EAWorker();
                let result: int | undefined = 0;

                try {
                    worker.start();

                    let resolver: ((val: Any)=>void) | undefined = undefined;
                    let waiter = new Promise<Any>((resolve)=>{
                        resolver = resolve;
                    })
                    worker.run<void>((): void => {
                        EAWorker.postToMain<int | undefined>((arg: int | undefined): int | undefined => {
                            return arg;
                        }, undefined).then((workerresult: int | undefined): void => {
                            result = workerresult;
                            resolver!(undefined);
                        });
                    });
                    await waiter
                    expect(result).assertUndefined();
                } catch (error) {
                    console.error(`${TAG} catch error: ${error.message}`);
                    expect(false).assertFail();
                } finally {
                    try {
                        worker.quit();
                    } catch (error) {
                        console.warn(`${TAG} catch quit error: ${error.message}`);
                    }
                    console.info(`${TAG} test end`);
                    done();
                }
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_EAWORKER_POSTTOMAIN_EDGE_0300
         * @tc.name testPostToMainNoArgs
         * @tc.desc Test EAWorker.postToMain with no arguments
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level1
         */
        it("testPostToMainNoArgs", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testPostToMainNoArgs';
                console.info(`${TAG} test start`);
                const worker = new EAWorker();
                let result: string = "";

                try {
                    worker.start();

                    let resolver: ((val: Any)=>void) | undefined = undefined;
                    let waiter = new Promise<Any>((resolve)=>{
                        resolver = resolve;
                    })
                    worker.run<void>((): void => {
                        EAWorker.postToMain<string>((): string => {
                            return "No arguments";
                        }).then((workerresult: string): void => {
                            result = workerresult;
                            resolver!(undefined);
                        });
                    });
                    await waiter
                    expect(result).assertEqual("No arguments");
                } catch (error) {
                    console.error(`${TAG} catch error: ${error.message}`);
                    expect(false).assertFail();
                } finally {
                    try {
                        worker.quit();
                    } catch (error) {
                        console.warn(`${TAG} catch quit error: ${error.message}`);
                    }
                    console.info(`${TAG} test end`);
                    done();
                }
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_EAWORKER_POSTTOMAIN_EDGE_0400
         * @tc.name testPostToMainReturnVoid
         * @tc.desc Test EAWorker.postToMain with void return type
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level1
         */
        it("testPostToMainReturnVoid", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testPostToMainReturnVoid';
                console.info(`${TAG} test start`);
                const worker = new EAWorker();
                let executed: boolean = false;

                try {
                    worker.start();

                    let resolver: ((val: Any)=>void) | undefined = undefined;
                    let waiter = new Promise<Any>((resolve)=>{
                        resolver = resolve;
                    })
                    worker.run<void>((): void => {
                        EAWorker.postToMain<void>((): void => {
                            executed = true;
                            resolver!(undefined);
                        })
                    });
                    await waiter
                    expect(executed).assertTrue();
                } catch (error) {
                    console.error(`${TAG} catch error: ${error.message}`);
                    expect(false).assertFail();
                } finally {
                    try {
                        worker.quit();
                    } catch (error) {
                        console.warn(`${TAG} catch quit error: ${error.message}`);
                    }
                    console.info(`${TAG} test end`);
                    done();
                }
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_EAWORKER_POSTTOMAIN_COMPLEX_0100
         * @tc.name testPostToMainNestedCalls
         * @tc.desc Test EAWorker.postToMain with nested postToMain calls
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level2
         */
        it("testPostToMainNestedCalls", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testPostToMainNestedCalls';
                console.info(`${TAG} test start`);
                const worker = new EAWorker();
                let result: int = 0;

                try {
                    worker.start();

                    let resolver: ((val: Any)=>void) | undefined = undefined;
                    let waiter = new Promise<Any>((resolve)=>{
                        resolver = resolve;
                    })
                    worker.run<void>((): void => {
                        EAWorker.postToMain<int>((): int => {
                            return 42;
                        }).then((workerresult: int): void => {
                            result = workerresult;
                            resolver!(undefined);
                        });
                    });
                    await waiter

                    expect(result).assertEqual(42);
                } catch (error) {
                    console.error(`${TAG} catch error: ${error.message}`);
                    expect(false).assertFail();
                } finally {
                    try {
                        worker.quit();
                    } catch (error) {
                        console.warn(`${TAG} catch quit error: ${error.message}`);
                    }
                    console.info(`${TAG} test end`);
                    done();
                }
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_EAWORKER_POSTTOMAIN_COMPLEX_0200
         * @tc.name testPostToMainWithComplexObject
         * @tc.desc Test EAWorker.postToMain with complex nested object
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level2
         */
        it("testPostToMainWithComplexObject", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testPostToMainWithComplexObject';
                console.info(`${TAG} test start`);
                const worker = new EAWorker();
                let result: OuterData = new OuterData();

                try {
                    worker.start();

                    let resolver: ((val: Any)=>void) | undefined = undefined;
                    let waiter = new Promise<Any>((resolve)=>{
                        resolver = resolve;
                    })
                    worker.run<void>((): void => {
                        const input = new OuterData();
                        input.inner.value = 10;
                        input.name = "test";

                        EAWorker.postToMain<OuterData>((data: OuterData): OuterData => {
                            data.inner.value = data.inner.value * 3;
                            data.name = data.name + "_processed";
                            return data;
                        }, input).then((workerresult: OuterData): void => {
                            result = workerresult;
                            resolver!(undefined);
                        });
                    });
                    await waiter
                    expect(result.inner.value).assertEqual(30);
                    expect(result.name).assertEqual("test_processed");
                } catch (error) {
                    console.error(`${TAG} catch error: ${error.message}`);
                    expect(false).assertFail();
                } finally {
                    try {
                        worker.quit();
                    } catch (error) {
                        console.warn(`${TAG} catch quit error: ${error.message}`);
                    }
                    console.info(`${TAG} test end`);
                    done();
                }
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_EAWORKER_POSTTOMAIN_STRESS_0100
         * @tc.name testPostToMainHighFrequency
         * @tc.desc Test EAWorker.postToMain with high frequency calls
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level2
         */
        it("testPostToMainHighFrequency", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
                const TAG: string = 'testPostToMainHighFrequency';
                console.info(`${TAG} test start`);
                const worker = new EAWorker();
                const iterations: int = 100;
                let result: int = 0;
                let sum: int = 0;

                try {
                    worker.start();

                    let resolver: ((val: Any)=>void) | undefined = undefined;
                    let waiter = new Promise<Any>((resolve)=>{
                        resolver = resolve;
                    })
                    worker.run<void>((): void => {
                        const jobs = Array.create<Promise<int> | undefined>(iterations, undefined);
                        for (let i = 0; i < iterations; i++) {
                            jobs.push(EAWorker.postToMain<int>((): int => {
                                return 1;
                            }));
                            jobs[i]!.then((workerresult: int): void => {
                                sum += workerresult;
                                if (sum == 100) {
                                    result = sum;
                                    resolver!(undefined);
                                }
                            });
                        }

                    });
                    await waiter
                    expect(result).assertEqual(100);
                } catch (error) {
                    console.error(`${TAG} catch error: ${error.message}`);
                    expect(false).assertFail();
                } finally {
                    try {
                        worker.quit();
                    } catch (error) {
                        console.warn(`${TAG} catch quit error: ${error.message}`);
                    }
                    console.info(`${TAG} test end`);
                    done();
                }
            });
    })
}
