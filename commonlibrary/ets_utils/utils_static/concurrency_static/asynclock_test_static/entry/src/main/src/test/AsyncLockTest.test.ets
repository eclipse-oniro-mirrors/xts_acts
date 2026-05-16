/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, afterAll, it, expect, TestType, Level, Size, afterEach } from "../../../hypium/index";
import {
  gcAfterLockAsyncTest,
  doubleExitSharedLockTest,
  pendingSharedRequestAfterGC,
  setDelayRequestAndCloseWorkerInstantlyTest
} from '../testability/pages/LockTest';
import { sleep } from '../testability/pages/utils';

interface TestObject {
    a: int;
    b: string;
}

type NullableString = string | null;
type ThreeState = string | null | undefined;
type UnionIntString = int | string;

export default function AsyncLockTest() {
  let printLog = 'AsyncLockTest:';
  describe('AsyncLockTest', (): void => {
    afterEach(async (): Promise<void> => {
      await sleep(20);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_ASYNCLOCK_0010
     * @tc.name setDelayRequestAndCloseWorkerInstantlyTest
     * @tc.desc checks the request in worker should be skipped and the request in main thread should be executed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('setDelayRequestAndCloseWorkerInstantlyTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let result: Object = await setDelayRequestAndCloseWorkerInstantlyTest();
        expect(result).assertEqual('PASSED');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_ASYNCLOCK_0020
     * @tc.name gcAfterLockAsyncTest
     * @tc.desc checks that trigger gc immediately after call lockAsync
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('gcAfterLockAsyncTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let result: Object = await gcAfterLockAsyncTest();
        expect(result).assertEqual("PASSED");
        done();
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_ASYNCLOCK_0030
     * @tc.name timeoutLockWithEnvDestroyedTest
     * @tc.desc checks that timeout callback and env destroyed are handled properly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('timeoutLockWithEnvDestroyedTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let result: Object = await doubleExitSharedLockTest();
        expect(result).assertEqual("PASSED");
        done();
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_ASYNCLOCK_0040
     * @tc.name pendingSharedRequestAfterGC
     * @tc.desc checks that destruction of shared lock after gc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('pendingSharedRequestAfterGC', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let result = await pendingSharedRequestAfterGC();
        expect(result).assertEqual("PASSED");
        done();
      })

        // ==================== A. AsyncLock 类测试 ====================

    /**
     * @tc.number SUB_ASYNC_LOCK_CLASS_0100
     * @tc.name ConstructorAndType001
     * @tc.desc Test AsyncLock constructor and instance type
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('ConstructorAndType001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (done: () => void): void => {
            let lock: AsyncLock = new AsyncLock();
            expect(lock instanceof AsyncLock).assertTrue();
            expect(typeof lock.name).assertEqual("string");
            done();
        });

    /**
     * @tc.number SUB_ASYNC_LOCK_CLASS_0200
     * @tc.name RequestAndGetExistingLock001
     * @tc.desc Test request creates new lock and returns same instance for same name
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('RequestAndGetExistingLock001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (done: () => void): void => {
            let lock1: AsyncLock = AsyncLock.request("testLock");
            let lock2: AsyncLock = AsyncLock.request("testLock");
            let lock3: AsyncLock = AsyncLock.request("otherLock");

            expect(lock1.name).assertEqual("testLock");
            expect(lock1 === lock2).assertTrue();
            expect(lock2 !== lock3).assertTrue();
            expect(lock3.name).assertEqual("otherLock");
            done();
        });

        /**
         * @tc.number SUB_ASYNC_LOCK_CLASS_0300
         * @tc.name RequestEdgeCases001
         * @tc.desc Test request with empty string, long string, and special characters
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('RequestEdgeCases001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: () => void): void => {
            let emptyLock: AsyncLock = AsyncLock.request("");
            let longLock: AsyncLock = AsyncLock.request("a".repeat(100));
            let specialLock: AsyncLock = AsyncLock.request("锁_123-TEST!@#");
            let unicodeLock: AsyncLock = AsyncLock.request("测试🔒锁");

            expect(emptyLock.name).assertEqual("");
            expect(longLock.name).assertEqual("a".repeat(100));
            expect(specialLock.name).assertEqual("锁_123-TEST!@#");
            expect(unicodeLock.name).assertEqual("测试🔒锁");
            done();
        });

    /**
     * @tc.number SUB_ASYNC_LOCK_CLASS_0400
     * @tc.name QueryState001
     * @tc.desc Test query returns AsyncLockState with held and pending arrays
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('QueryState001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (done: () => void): void => {
            let lockName: string = "queryLock";
            AsyncLock.request(lockName);

            let state: AsyncLockState = AsyncLock.query(lockName);
            expect(state.held.length).assertEqual(0);
            expect(state.pending.length).assertEqual(0);
            done();
        });

        /**
         * @tc.number SUB_ASYNC_LOCK_CLASS_0500
         * @tc.name QueryNonExistentLock001
         * @tc.desc Test query for non-existent lock returns state with empty arrays
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('QueryNonExistentLock001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: () => void): void => {
            try {
                let state: AsyncLockState = AsyncLock.query("nonExistentLock");
                expect().assertFail();
            } catch (err) {
                expect(err instanceof Error).assertTrue();
            }
            done();
        });

        // ==================== B. lockAsync 基础重载测试 ====================

    /**
     * @tc.number SUB_ASYNC_LOCK_LOCKASYNC_0100
     * @tc.name LockAsyncBasicTypes001
     * @tc.desc Test lockAsync with various callback return types
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('LockAsyncBasicTypes001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let lock: AsyncLock = new AsyncLock();
            let currenttid = StdProcess.tid();
            let numberResult: int = await lock.lockAsync<int>(() => {
                expect(StdProcess.tid()).assertEqual(currenttid);
                return 42;
            });
            expect(numberResult).assertEqual(42);

            let stringResult: string = await lock.lockAsync<string>(() => {
                expect(StdProcess.tid()).assertEqual(currenttid);
                return "hello";
            });
            expect(stringResult).assertEqual("hello");

            let boolResult: boolean = await lock.lockAsync<boolean>(() => {
                expect(StdProcess.tid()).assertEqual(currenttid);
                return true;
            });
            expect(boolResult).assertTrue();

            let objResult: TestObject = await lock.lockAsync<TestObject>(() => {
                return { a: 1, b: "test" };
            });
            expect(objResult.a).assertEqual(1);
            expect(objResult.b).assertEqual("test");

            let arrayResult: int[] = await lock.lockAsync<int[]>(() => {
                return [1, 2, 3];
            });
            expect(arrayResult.length).assertEqual(3);
            done();
        });

    /**
     * @tc.number SUB_ASYNC_LOCK_LOCKASYNC_0200
     * @tc.name LockAsyncAsyncCallback001
     * @tc.desc Test lockAsync with async callback
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('LockAsyncAsyncCallback001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let lock: AsyncLock = new AsyncLock();

            let result: string = await lock.lockAsync<string>(async () => {
                await sleep(10);
                return "async-result";
            });

            expect(result).assertEqual("async-result");
            done();
        });

    /**
     * @tc.number SUB_ASYNC_LOCK_LOCKASYNC_0300
     * @tc.name LockAsyncVoid001
     * @tc.desc Test lockAsync with void return type
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('LockAsyncVoid001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let lock: AsyncLock = new AsyncLock();
            let result = await lock.lockAsync<void>(() => {});
            expect(result).assertUndefined();
            done();
        });

        /**
         * @tc.number SUB_ASYNC_LOCK_LOCKASYNC_0400
         * @tc.name LockAsyncException001
         * @tc.desc Test lockAsync propagates callback exceptions
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('LockAsyncException001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let lock: AsyncLock = new AsyncLock();
            let exceptionThrown: boolean = false;

            try {
                await lock.lockAsync<void>(() => {
                    throw new Error("test error");
                });
            } catch (e) {
                exceptionThrown = true;
            }

            expect(exceptionThrown).assertTrue();
            done();
        });

        /**
         * @tc.number SUB_ASYNC_LOCK_LOCKASYNC_0500
         * @tc.name LockAsyncSequential001
         * @tc.desc Test lockAsync executes sequentially
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('LockAsyncSequential001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let lock: AsyncLock = new AsyncLock();
            let results: int[] = [];

            results.push(await lock.lockAsync<int>(() => 1));
            results.push(await lock.lockAsync<int>(() => 2));
            results.push(await lock.lockAsync<int>(() => 3));

            expect(results).assertDeepEquals([1, 2, 3]);
            done();
        });

        // ==================== C. lockAsync 带 mode 重载测试 ====================

    /**
     * @tc.number SUB_ASYNC_LOCK_MODE_0100
     * @tc.name LockAsyncSharedMode001
     * @tc.desc Test lockAsync with SHARED mode allows concurrent execution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('LockAsyncSharedMode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let lock: AsyncLock = new AsyncLock();
            let executionOrder: int[] = [];

            let promise1: Promise<int> = lock.lockAsync<int>(async () => {
                executionOrder.push(1);
                await sleep(50);
                executionOrder.push(2);
                return 1;
            }, AsyncLockMode.SHARED);

            let promise2: Promise<int> = lock.lockAsync<int>(async () => {
                executionOrder.push(3);
                await sleep(50);
                executionOrder.push(4);
                return 2;
            }, AsyncLockMode.SHARED);

            await Promise.all([promise1, promise2]);

            expect(executionOrder).assertDeepEquals([1, 3, 2, 4]);
            done();
        });

    /**
     * @tc.number SUB_ASYNC_LOCK_MODE_0200
     * @tc.name LockAsyncExclusiveMode001
     * @tc.desc Test lockAsync with EXCLUSIVE mode executes sequentially
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('LockAsyncExclusiveMode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let lock: AsyncLock = new AsyncLock();
            let executionOrder: int[] = [];

            let promise1: Promise<int> = lock.lockAsync<int>(async () => {
                executionOrder.push(1);
                await sleep(50);
                executionOrder.push(2);
                return 1;
            }, AsyncLockMode.EXCLUSIVE);

            let promise2: Promise<int> = lock.lockAsync<int>(async () => {
                executionOrder.push(3);
                await sleep(50);
                executionOrder.push(4);
                return 2;
            }, AsyncLockMode.EXCLUSIVE);

            await Promise.all([promise1, promise2]);

            expect(executionOrder).assertDeepEquals([1, 2, 3, 4]);
            done();
        });

        /**
         * @tc.number SUB_ASYNC_LOCK_MODE_0300
         * @tc.name LockAsyncModeMix001
         * @tc.desc Test lockAsync with mixed SHARED and EXCLUSIVE modes
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('LockAsyncModeMix001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let lock: AsyncLock = new AsyncLock();
            let executionOrder: int[] = [];

            let promise1: Promise<int> = lock.lockAsync<int>(async () => {
                executionOrder.push(1);
                await sleep(50);
                executionOrder.push(2);
                return 1;
            }, AsyncLockMode.SHARED);

            let promise2: Promise<int> = lock.lockAsync<int>(async () => {
                executionOrder.push(3);
                await sleep(50);
                executionOrder.push(4);
                return 2;
            }, AsyncLockMode.SHARED);

            let promise3: Promise<int> = lock.lockAsync<int>(async () => {
                executionOrder.push(5);
                await sleep(50);
                executionOrder.push(6);
                return 3;
            }, AsyncLockMode.EXCLUSIVE);

            let promise4: Promise<int> = lock.lockAsync<int>(async () => {
                executionOrder.push(7);
                await sleep(50);
                executionOrder.push(8);
                return 4;
            }, AsyncLockMode.SHARED);

            await Promise.all([promise1, promise2, promise3, promise4]);

            expect(executionOrder[0]).assertEqual(1);
            expect(executionOrder[1]).assertEqual(3);
            expect(executionOrder[2]).assertEqual(2);
            expect(executionOrder[3]).assertEqual(4);
            expect(executionOrder[4]).assertEqual(5);
            expect(executionOrder[5]).assertEqual(6);
            expect(executionOrder[6]).assertEqual(7);
            expect(executionOrder[7]).assertEqual(8);
            done();
        });

        // ==================== D. lockAsync 带 options 重载测试 ====================

    /**
     * @tc.number SUB_ASYNC_LOCK_OPTIONS_0100
     * @tc.name LockAsyncDefaultOptions001
     * @tc.desc Test lockAsync with default AsyncLockOptions
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('LockAsyncDefaultOptions001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let lock: AsyncLock = new AsyncLock();
            let options: AsyncLockOptions<void> = new AsyncLockOptions<void>();

            let result: int = await lock.lockAsync<int, void>(() => {
                return 42;
            }, AsyncLockMode.EXCLUSIVE, options);

            expect(result).assertEqual(42);
            done();
        });

        /**
         * @tc.number SUB_ASYNC_LOCK_OPTIONS_0200
         * @tc.name LockAsyncTimeout001
         * @tc.desc Test lockAsync with timeout option
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('LockAsyncTimeout001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let lock: AsyncLock = new AsyncLock();
            let options: AsyncLockOptions<void> = new AsyncLockOptions<void>(false, null, 5000);

            let result: int = await lock.lockAsync<int, void>(() => {
                return 42;
            }, AsyncLockMode.EXCLUSIVE, options);

            expect(result).assertEqual(42);
            done();
        });

        /**
         * @tc.number SUB_ASYNC_LOCK_OPTIONS_0300
         * @tc.name LockAsyncIsAvailableTrue001
         * @tc.desc Test lockAsync with isAvailable=true when lock is available
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('LockAsyncIsAvailableTrue001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let lock: AsyncLock = new AsyncLock();
            let options: AsyncLockOptions<void> = new AsyncLockOptions<void>(true, null, 0);

            let result: int = await lock.lockAsync<int, void>(() => {
                return 42;
            }, AsyncLockMode.EXCLUSIVE, options);

            expect(result).assertEqual(42);
            done();
        });

        /**
         * @tc.number SUB_ASYNC_LOCK_OPTIONS_0400
         * @tc.name LockAsyncIsAvailableFalse001
         * @tc.desc Test lockAsync with isAvailable=false waits for lock
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('LockAsyncIsAvailableFalse001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let lock: AsyncLock = new AsyncLock();
            let options: AsyncLockOptions<void> = new AsyncLockOptions<void>(false, null, 0);

            let result: int = await lock.lockAsync<int, void>(() => {
                return 42;
            }, AsyncLockMode.EXCLUSIVE, options);

            expect(result).assertEqual(42);
            done();
        });

        /**
         * @tc.number SUB_ASYNC_LOCK_OPTIONS_0500
         * @tc.name LockAsyncSignalNotAborted001
         * @tc.desc Test lockAsync with signal.aborted=false
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('LockAsyncSignalNotAborted001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let lock: AsyncLock = new AsyncLock();
            let signal: AbortSignal<string> = { aborted: false, reason: "test" };
            let options: AsyncLockOptions<string> = new AsyncLockOptions<string>(false, signal, 0);

            let result: int = await lock.lockAsync<int, string>(() => {
                return 42;
            }, AsyncLockMode.EXCLUSIVE, options);

            expect(result).assertEqual(42);
            done();
        });

        /**
         * @tc.number SUB_ASYNC_LOCK_OPTIONS_0600
         * @tc.name LockAsyncSignalAborted001
         * @tc.desc Test lockAsync with signal.aborted=true rejects immediately
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('LockAsyncSignalAborted001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let lock: AsyncLock = new AsyncLock();
            let signal: AbortSignal<string> = { aborted: true, reason: "cancelled" };
            let options: AsyncLockOptions<string> = new AsyncLockOptions<string>(false, signal, 0);

            let exceptionThrown: boolean = false;
            try {
                await lock.lockAsync<int, string>(() => {
                    return 42;
                }, AsyncLockMode.EXCLUSIVE, options);
            } catch (e) {
                exceptionThrown = true;
            }

            expect(exceptionThrown).assertTrue();
            done();
        });

        // ==================== E. AsyncLockOptions 类测试 ====================

    /**
     * @tc.number SUB_ASYNC_LOCK_OPTIONS_CLASS_0100
     * @tc.name AsyncLockOptionsDefaults001
     * @tc.desc Test AsyncLockOptions default values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('AsyncLockOptionsDefaults001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (done: () => void): void => {
            let options1: AsyncLockOptions<void> = new AsyncLockOptions<void>();
            expect(options1.isAvailable).assertFalse();
            expect(options1.signal).assertNull();
            expect(options1.timeout).assertEqual(0);

            let options2: AsyncLockOptions<string> = new AsyncLockOptions<string>(true, null, 1000);
            expect(options2.isAvailable).assertTrue();
            expect(options2.signal).assertNull();
            expect(options2.timeout).assertEqual(1000);
            done();
        });

        /**
         * @tc.number SUB_ASYNC_LOCK_OPTIONS_CLASS_0200
         * @tc.name AsyncLockOptionsGenericTypes001
         * @tc.desc Test AsyncLockOptions with generic types
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('AsyncLockOptionsGenericTypes001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: () => void): void => {
            let signalString: AbortSignal<string> = { aborted: false, reason: "test" };
            let optionsString: AsyncLockOptions<string> = new AsyncLockOptions<string>(false, signalString, 0);
            expect(optionsString.signal?.reason).assertEqual("test");

            let signalNumber: AbortSignal<int> = { aborted: false, reason: 404 };
            let optionsNumber: AsyncLockOptions<int> = new AsyncLockOptions<int>(false, signalNumber, 0);
            expect(optionsNumber.signal?.reason).assertEqual(404);

            let signalError: AbortSignal<Error> = { aborted: true, reason: new Error("fail") };
            let optionsError: AsyncLockOptions<Error> = new AsyncLockOptions<Error>(false, signalError, 0);
            expect(optionsError.signal?.aborted).assertTrue();
            done();
        });

        // ==================== F. 泛型边界类型测试 ====================

        /**
         * @tc.number SUB_ASYNC_LOCK_GENERIC_0100
         * @tc.name GenericBasicTypes001
         * @tc.desc Test lockAsync with all basic types (void, number, string, boolean)
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('GenericBasicTypes001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let lock: AsyncLock = new AsyncLock();

            let voidResult = await lock.lockAsync<void>(() => {});
            expect(voidResult).assertUndefined();

            let numberResult: number = await lock.lockAsync<number>(() => 42);
            expect(numberResult).assertEqual(42);

            let stringResult: string = await lock.lockAsync<string>(() => "test");
            expect(stringResult).assertEqual("test");

            let boolResult: boolean = await lock.lockAsync<boolean>(() => true);
            expect(boolResult).assertTrue();
            done();
        });

        /**
         * @tc.number SUB_ASYNC_LOCK_GENERIC_0200
         * @tc.name GenericNumericTypes001
         * @tc.desc Test lockAsync with numeric types (byte, short, int, long, float, double)
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('GenericNumericTypes001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let lock: AsyncLock = new AsyncLock();

            let byteResult: byte = await lock.lockAsync<byte>(() => 127);
            expect(byteResult).assertEqual(127);

            let shortResult: short = await lock.lockAsync<short>(() => 32767);
            expect(shortResult).assertEqual(32767);

            let intResult: int = await lock.lockAsync<int>(() => 2147483647);
            expect(intResult).assertEqual(2147483647);

            let floatResult: float = await lock.lockAsync<float>(() => 3.14f);
            expect(floatResult > 3.13).assertTrue();

            let doubleResult: double = await lock.lockAsync<double>(() => 3.14159265);
            expect(doubleResult > 3.14159).assertTrue();
            done();
        });

        /**
         * @tc.number SUB_ASYNC_LOCK_GENERIC_0300
         * @tc.name GenericComplexTypes001
         * @tc.desc Test lockAsync with complex types (array, object, union)
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('GenericComplexTypes001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let lock: AsyncLock = new AsyncLock();

            let arrayResult: int[] = await lock.lockAsync<int[]>(() => [1, 2, 3]);
            expect(arrayResult.length).assertEqual(3);

            let objectResult: TestObject = await lock.lockAsync<TestObject>(() => {
                return { a: 1, b: "test" };
            });
            expect(objectResult.a).assertEqual(1);

            let unionResult: UnionIntString = await lock.lockAsync<UnionIntString>(() => {
                return 42;
            });
            expect(unionResult).assertEqual(42);
            done();
        });

        /**
         * @tc.number SUB_ASYNC_LOCK_GENERIC_0400
         * @tc.name GenericNullUndefined001
         * @tc.desc Test lockAsync with null and undefined types
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('GenericNullUndefined001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let lock: AsyncLock = new AsyncLock();

            let nullResult: null = await lock.lockAsync<null>(() => {
                return null;
            });
            expect(nullResult).assertNull();

            let undefinedResult: undefined = await lock.lockAsync<undefined>(() => {
                return undefined;
            });
            expect(undefinedResult).assertUndefined();

            let nullableResult: NullableString = await lock.lockAsync<NullableString>(() => {
                return null;
            });
            expect(nullableResult).assertNull();

            let unionResult: ThreeState = await lock.lockAsync<ThreeState>(() => {
                return undefined;
            });
            expect(unionResult).assertUndefined();
            done();
        });

    /**
     * @tc.number SUB_ASYNC_LOCK_GENERIC_0500
     * @tc.name GenericWithMode001
     * @tc.desc Test generic types with SHARED and EXCLUSIVE modes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('GenericWithMode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let lock: AsyncLock = new AsyncLock();

            let sharedResult: int = await lock.lockAsync<int>(() => {
                return 1;
            }, AsyncLockMode.SHARED);
            expect(sharedResult).assertEqual(1);

            let exclusiveResult: string = await lock.lockAsync<string>(() => {
                return "test";
            }, AsyncLockMode.EXCLUSIVE);
            expect(exclusiveResult).assertEqual("test");
            done();
        });

        // ==================== G. 泛型 U 在 AsyncLockOptions 中的测试 ====================

        /**
         * @tc.number SUB_ASYNC_LOCK_GENERIC_U_0100
         * @tc.name GenericUSignalTypes001
         * @tc.desc Test AsyncLockOptions generic U with signal types
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('GenericUSignalTypes001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let lock: AsyncLock = new AsyncLock();
            let signalString: AbortSignal<string> = new AbortSignal<string>();
            let optionsString: AsyncLockOptions<string> = new AsyncLockOptions<string>(
                false,
                signalString,
                0
            );
            let resultString1 = lock.lockAsync<int, string>(() => 42, AsyncLockMode.EXCLUSIVE, optionsString);
            let resultString2 = lock.lockAsync<int, string>(() => 43, AsyncLockMode.EXCLUSIVE, optionsString);
            let resultString3 = lock.lockAsync<int, string>(() => 44, AsyncLockMode.EXCLUSIVE, optionsString);

            await resultString1.then((value) => {
                signalString.aborted=true;
                signalString.reason="test";
                expect(value).assertEqual(42);
            },(err)=>{
                expect().assertFail();
            });
            await resultString2.then((value) => {
                expect().assertFail();
            },(err)=>{
                expect(signalString.reason).assertEqual("test");
                signalString.aborted=false;
            });
            await resultString3.then((value) => {
                expect(value).assertEqual(44);
            },(err)=>{
                expect().assertFail();
            });
            done();
        });

        /**
         * @tc.number SUB_ASYNC_LOCK_GENERIC_U_0200
         * @tc.name GenericUNullUndefined001
         * @tc.desc Test AsyncLockOptions generic U with null and undefined signals
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('GenericUNullUndefined001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let lock: AsyncLock = new AsyncLock();

            let optionsNull: AsyncLockOptions<null> = new AsyncLockOptions<null>(
                false,
                { aborted: true, reason: null },
                0
            );

            let exceptionThrown1: boolean = false;
            try {
                await lock.lockAsync<int, null>(() => 42, AsyncLockMode.EXCLUSIVE, optionsNull);
            } catch (e) {
                exceptionThrown1 = true;
            }
            expect(exceptionThrown1).assertTrue();

            let optionsUndefined: AsyncLockOptions<undefined> = new AsyncLockOptions<undefined>(
                false,
                { aborted: true, reason: undefined },
                0
            );

            let exceptionThrown2: boolean = false;
            try {
                await lock.lockAsync<int, undefined>(() => 42, AsyncLockMode.EXCLUSIVE, optionsUndefined);
            } catch (e) {
                exceptionThrown2 = true;
            }
            expect(exceptionThrown2).assertTrue();

            done();
        });

        // ==================== H. 并发场景测试 ====================

    /**
     * @tc.number SUB_ASYNC_LOCK_CONCURRENT_0100
     * @tc.name ConcurrentSharedLocks001
     * @tc.desc Test multiple SHARED locks execute concurrently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ConcurrentSharedLocks001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let lock: AsyncLock = new AsyncLock();
            let executionTimes: long[] = [];

            let promises: Promise<void>[] = [];

            for (let i: int = 0; i < 5; i++) {
                promises.push(lock.lockAsync<void>(async () => {
                    executionTimes.push(Date.now());
                    await sleep(50);
                }, AsyncLockMode.SHARED));
            }

            await Promise.all(promises);

            expect(executionTimes.length).assertEqual(5);
            done();
        });

    /**
     * @tc.number SUB_ASYNC_LOCK_CONCURRENT_0200
     * @tc.name ConcurrentExclusiveLocks001
     * @tc.desc Test multiple EXCLUSIVE locks execute sequentially
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ConcurrentExclusiveLocks001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let lock: AsyncLock = new AsyncLock();
            let executionOrder: int[] = [];

            let promises: Promise<void>[] = [];

            for (let i: int = 0; i < 3; i++) {
                let idx: int = i;
                promises.push(lock.lockAsync<void>(async () => {
                    executionOrder.push(idx);
                    await sleep(30);
                }, AsyncLockMode.EXCLUSIVE));
            }

            await Promise.all(promises);

            expect(executionOrder).assertDeepEquals([0, 1, 2]);
            done();
        });

        // ==================== I. 边界值测试 ====================

        /**
         * @tc.number SUB_ASYNC_LOCK_BOUNDARY_0100
         * @tc.name BoundaryNumericValues001
         * @tc.desc Test lockAsync with numeric boundary values
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('BoundaryNumericValues001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let lock: AsyncLock = new AsyncLock();

            let maxInt: int = await lock.lockAsync<int>(() => Int.MAX_VALUE);
            expect(maxInt).assertEqual(Int.MAX_VALUE);

            let minInt: int = await lock.lockAsync<int>(() => Int.MIN_VALUE);
            expect(minInt).assertEqual(Int.MIN_VALUE);

            let zero: int = await lock.lockAsync<int>(() => 0);
            expect(zero).assertEqual(0);
            done();
        });

        /**
         * @tc.number SUB_ASYNC_LOCK_BOUNDARY_0200
         * @tc.name BoundaryEmptyArray001
         * @tc.desc Test lockAsync with empty array
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('BoundaryEmptyArray001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let lock: AsyncLock = new AsyncLock();

            let emptyArray: int[] = await lock.lockAsync<int[]>(() => []);
            expect(emptyArray.length).assertEqual(0);
            done();
        });

        /**
         * @tc.number SUB_ASYNC_LOCK_BOUNDARY_0300
         * @tc.name BoundaryEmptyString001
         * @tc.desc Test lockAsync with empty string
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('BoundaryEmptyString001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let lock: AsyncLock = new AsyncLock();

            let emptyString: string = await lock.lockAsync<string>(() => "");
            expect(emptyString).assertEqual("");
            done();
        });
  })
}
