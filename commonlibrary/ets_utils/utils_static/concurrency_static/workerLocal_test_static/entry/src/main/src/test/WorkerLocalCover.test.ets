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

import { describe, it, expect, TestType, Size, Level, beforeEach} from '../../../hypium/index';
import Utils from './Util.test';

// ========== 类定义（最外层）==========
class MyClass {
    public value: int;

    constructor(value: int) {
        this.value = value;
    }
}

interface IMyInterface {
    id: int;
    name: string;
}

// ========== 类型别名（最外层）==========
type NullableString = string | null;
type StringOrUndefined = string | undefined;
type ThreeState = string | null | undefined;
type UnionIntString = int | string;

// ========== 辅助函数（最外层）==========
function createWorkerLocalInt(): WorkerLocal<int> {
    let wl: WorkerLocal<int> = new WorkerLocal<int>();
    return wl;
}

function createWorkerLocalString(): WorkerLocal<string> {
    let wl: WorkerLocal<string> = new WorkerLocal<string>();
    return wl;
}

// ========== 主导出函数 ==========
export default function WorkerLocalCoverTest() {
    describe('WorkerLocalCoverTest', () => {
        beforeEach(async () => {
            await Utils.msSleep(20);
        });

        // ==================== A. constructor() 无参构造测试 ====================

        /**
         * @tc.number SUB_UTILS_WORKERLOCAL_CONSTRUCTOR_0100
         * @tc.name ConstructorBasicNumericTypes001
         * @tc.desc Test WorkerLocal constructor with basic numeric types (byte, short, int)
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ConstructorBasicNumericTypes001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: () => void): void => {
            let wlByte: WorkerLocal<byte> = new WorkerLocal<byte>();
            let wlShort: WorkerLocal<short> = new WorkerLocal<short>();
            let wlInt: WorkerLocal<int> = new WorkerLocal<int>();

            wlByte.set(100);
            wlShort.set(1000);
            wlInt.set(10000);

            expect(wlByte.get()).assertEqual(100);
            expect(wlShort.get()).assertEqual(1000);
            expect(wlInt.get()).assertEqual(10000);
            done();
        });

        /**
         * @tc.number SUB_UTILS_WORKERLOCAL_CONSTRUCTOR_0200
         * @tc.name ConstructorNumericTypes002
         * @tc.desc Test WorkerLocal constructor with numeric types (long, float, double, bigint)
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ConstructorNumericTypes002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: () => void): void => {
            let wlLong: WorkerLocal<long> = new WorkerLocal<long>();
            let wlFloat: WorkerLocal<float> = new WorkerLocal<float>();
            let wlDouble: WorkerLocal<double> = new WorkerLocal<double>();
            let wlBigint: WorkerLocal<bigint> = new WorkerLocal<bigint>();

            // Use values that fit in the types without requiring suffixes
            wlLong.set(100000);
            wlFloat.set(3.14f);
            wlDouble.set(2.718);
            wlBigint.set(9007199254740991n);

            expect(wlLong.get()).assertEqual(100000);
            expect(wlFloat.get().toString().indexOf("3.14") >= 0).assertTrue();
            expect(wlDouble.get()).assertEqual(2.718);
            expect(wlBigint.get()).assertEqual(9007199254740991n);
            done();
        });

        /**
         * @tc.number SUB_UTILS_WORKERLOCAL_CONSTRUCTOR_0300
         * @tc.name ConstructorBooleanAndChar003
         * @tc.desc Test WorkerLocal constructor with boolean and char types
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ConstructorBooleanAndChar003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: () => void): void => {
            let wlBoolean: WorkerLocal<boolean> = new WorkerLocal<boolean>();
            let wlString: WorkerLocal<string> = new WorkerLocal<string>();
            let wlChar: WorkerLocal<char> = new WorkerLocal<char>();

            wlBoolean.set(true);
            wlString.set("hello");
            wlChar.set(c'q');

            expect(wlBoolean.get()).assertTrue();
            expect(wlString.get()).assertEqual("hello");
            expect(wlChar.get()).assertEqual(c'q');

            done();
        });

        /**
         * @tc.number SUB_UTILS_WORKERLOCAL_CONSTRUCTOR_0400
         * @tc.name ConstructorComplexTypes004
         * @tc.desc Test WorkerLocal constructor with complex types (array, class, interface, union)
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ConstructorComplexTypes004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: () => void): void => {
            let wlArray: WorkerLocal<int[]> = new WorkerLocal<int[]>();
            let wlClass: WorkerLocal<MyClass> = new WorkerLocal<MyClass>();
            let wlInterface: WorkerLocal<IMyInterface> = new WorkerLocal<IMyInterface>();
            let wlUnion: WorkerLocal<UnionIntString> = new WorkerLocal<UnionIntString>();

            wlArray.set([1, 2, 3]);
            wlClass.set(new MyClass(42));
            wlInterface.set({ id: 1, name: "test" });
            wlUnion.set(100);

            expect(wlArray.get().length).assertEqual(3);
            expect(wlClass.get().value).assertEqual(42);
            expect(wlInterface.get().id).assertEqual(1);
            expect(wlUnion.get()).assertEqual(100);
            done();
        });

        /**
         * @tc.number SUB_UTILS_WORKERLOCAL_CONSTRUCTOR_0500
         * @tc.name ConstructorNullableTypes005
         * @tc.desc Test WorkerLocal constructor with nullable and undefined types
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ConstructorNullableTypes005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: () => void): void => {
            let wlNullable: WorkerLocal<NullableString> = new WorkerLocal<NullableString>();
            let wlUndefined: WorkerLocal<StringOrUndefined> = new WorkerLocal<StringOrUndefined>();
            let wlThreeState: WorkerLocal<ThreeState> = new WorkerLocal<ThreeState>();

            wlNullable.set(null);
            wlUndefined.set(undefined);
            wlThreeState.set("test");

            expect(wlNullable.get()).assertNull();
            expect(wlUndefined.get()).assertUndefined();
            expect(wlThreeState.get()).assertEqual("test");
            done();
        });

        // ==================== B. constructor(init: () => T) 带参构造测试 ====================

        /**
         * @tc.number SUB_UTILS_WORKERLOCAL_INIT_0100
         * @tc.name InitBasicTypes001
         * @tc.desc Test WorkerLocal constructor with init function for basic types
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('InitBasicTypes001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: () => void): void => {
            let wlInt: WorkerLocal<int> = new WorkerLocal<int>(() => {
                return 42;
            });
            let wlDouble: WorkerLocal<double> = new WorkerLocal<double>(() => {
                return 3.14;
            });
            let wlString: WorkerLocal<string> = new WorkerLocal<string>(() => {
                return "hello";
            });
            let wlBoolean: WorkerLocal<boolean> = new WorkerLocal<boolean>(() => {
                return true;
            });
            let wlArray: WorkerLocal<int[]> = new WorkerLocal<int[]>(() => {
                return [1, 2, 3];
            });

            expect(wlInt.get()).assertEqual(42);
            expect(wlDouble.get()).assertEqual(3.14);
            expect(wlString.get()).assertEqual("hello");
            expect(wlBoolean.get()).assertTrue();
            expect(wlArray.get().length).assertEqual(3);
            done();
        });

        /**
         * @tc.number SUB_UTILS_WORKERLOCAL_INIT_0200
         * @tc.name InitClosureCapture002
         * @tc.desc Test WorkerLocal init function capturing variables
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('InitClosureCapture002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: () => void): void => {
            let str: string = "test";
            let wl: WorkerLocal<string> = new WorkerLocal<string>(() => {
                return str;
            });
            expect(wl.get()).assertEqual("test");
            done();
        });

        /**
         * @tc.number SUB_UTILS_WORKERLOCAL_INIT_0300
         * @tc.name InitExecutionTiming003
         * @tc.desc Test WorkerLocal init function execution timing
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('InitExecutionTiming003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: () => void): void => {
            let wl: WorkerLocal<int> = new WorkerLocal<int>(() => {
                return 100;
            });

            // First get should trigger init
            let first: int = wl.get();
            expect(first).assertEqual(100);

            // Second get should return cached value, not re-execute init
            let second: int = wl.get();
            expect(second).assertEqual(100);

            // After set, get should return set value, not re-init
            wl.set(200);
            let third: int = wl.get();
            expect(third).assertEqual(200);
            done();
        });

        /**
         * @tc.number SUB_UTILS_WORKERLOCAL_INIT_0400
         * @tc.name InitComplexLogic004
         * @tc.desc Test WorkerLocal init function with complex logic
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('InitComplexLogic004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: () => void): void => {
            let wlCalculated: WorkerLocal<int> = new WorkerLocal<int>(() => {
                let x: int = 1;
                x += 10;
                return x;
            });
            expect(wlCalculated.get()).assertEqual(11);

            let wlObject: WorkerLocal<MyClass> = new WorkerLocal<MyClass>(() => {
                return new MyClass(42);
            });
            expect(wlObject.get().value).assertEqual(42);

            let wlNull: WorkerLocal<NullableString> = new WorkerLocal<NullableString>(() => {
                return null;
            });
            expect(wlNull.get()).assertNull();

            let wlUndefined: WorkerLocal<StringOrUndefined> = new WorkerLocal<StringOrUndefined>(() => {
                return undefined;
            });
            expect(wlUndefined.get()).assertUndefined();
            done();
        });

        /**
         * @tc.number SUB_UTILS_WORKERLOCAL_INIT_0500
         * @tc.name InitUndefinedType005
         * @tc.desc Test WorkerLocal init function with undefined type
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('InitUndefinedType005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: () => void): void => {
            let wlUndefined: WorkerLocal<StringOrUndefined> = new WorkerLocal<StringOrUndefined>(() => {
                return undefined;
            });
            expect(wlUndefined.get()).assertUndefined();

            let wlThreeState: WorkerLocal<ThreeState> = new WorkerLocal<ThreeState>(() => {
                return null;
            });
            expect(wlThreeState.get()).assertNull();

            // Test setting to undefined and null
            wlThreeState.set(undefined);
            expect(wlThreeState.get()).assertUndefined();

            wlThreeState.set(null);
            expect(wlThreeState.get()).assertNull();
            done();
        });

        // ==================== C. get() 方法测试 ====================

        /**
         * @tc.number SUB_UTILS_WORKERLOCAL_GET_0100
         * @tc.name GetNormalValue001
         * @tc.desc Test get() returns set value and init value correctly
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('GetNormalValue001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: () => void): void => {
            let wl: WorkerLocal<int> = new WorkerLocal<int>();

            wl.set(42);
            expect(wl.get()).assertEqual(42);

            let wlInit: WorkerLocal<string> = new WorkerLocal<string>(() => {
                return "initialized";
            });
            expect(wlInit.get()).assertEqual("initialized");
            done();
        });

        /**
         * @tc.number SUB_UTILS_WORKERLOCAL_GET_0200
         * @tc.name GetConsistency002
         * @tc.desc Test get() returns consistent value across multiple calls
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('GetConsistency002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: () => void): void => {
            let wl: WorkerLocal<int> = new WorkerLocal<int>();
            wl.set(42);

            expect(wl.get()).assertEqual(42);
            expect(wl.get()).assertEqual(42);
            expect(wl.get()).assertEqual(42);
            done();
        });

        /**
         * @tc.number SUB_UTILS_WORKERLOCAL_GET_0300
         * @tc.name GetBoundaryValues003
         * @tc.desc Test get() with boundary values (max, min, empty, null, undefined)
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('GetBoundaryValues003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: () => void): void => {
            let wlMax: WorkerLocal<int> = new WorkerLocal<int>();
            wlMax.set(Int.MAX_VALUE);
            expect(wlMax.get()).assertEqual(Int.MAX_VALUE);

            let wlMin: WorkerLocal<int> = new WorkerLocal<int>();
            wlMin.set(Int.MIN_VALUE);
            expect(wlMin.get()).assertEqual(Int.MIN_VALUE);

            let wlEmpty: WorkerLocal<string> = new WorkerLocal<string>();
            wlEmpty.set("");
            expect(wlEmpty.get()).assertEqual("");

            let wlNull: WorkerLocal<NullableString> = new WorkerLocal<NullableString>();
            wlNull.set(null);
            expect(wlNull.get()).assertNull();

            let wlUndefined: WorkerLocal<StringOrUndefined> = new WorkerLocal<StringOrUndefined>();
            wlUndefined.set(undefined);
            expect(wlUndefined.get()).assertUndefined();
            done();
        });

        // ==================== D. set() 方法测试 ====================

        /**
         * @tc.number SUB_UTILS_WORKERLOCAL_SET_0100
         * @tc.name SetBasicTypes001
         * @tc.desc Test set() with basic types (int, double, string, boolean)
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('SetBasicTypes001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: () => void): void => {
            let wlInt: WorkerLocal<int> = new WorkerLocal<int>();
            let wlDouble: WorkerLocal<double> = new WorkerLocal<double>();
            let wlString: WorkerLocal<string> = new WorkerLocal<string>();
            let wlBoolean: WorkerLocal<boolean> = new WorkerLocal<boolean>();

            wlInt.set(42);
            wlDouble.set(3.14);
            wlString.set("test");
            wlBoolean.set(true);

            expect(wlInt.get()).assertEqual(42);
            expect(wlDouble.get()).assertEqual(3.14);
            expect(wlString.get()).assertEqual("test");
            expect(wlBoolean.get()).assertTrue();
            done();
        });

        /**
         * @tc.number SUB_UTILS_WORKERLOCAL_SET_0200
         * @tc.name SetOverride002
         * @tc.desc Test set() overriding init value and previous set value
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('SetOverride002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: () => void): void => {
            let wl: WorkerLocal<int> = new WorkerLocal<int>(() => {
                return 100;
            });

            // Override init value
            wl.set(200);
            expect(wl.get()).assertEqual(200);

            // Override previous set value
            wl.set(300);
            expect(wl.get()).assertEqual(300);
            done();
        });

        /**
         * @tc.number SUB_UTILS_WORKERLOCAL_SET_0300
         * @tc.name SetOverrideSpecialValues003
         * @tc.desc Test set() overriding with null, undefined, and empty values
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('SetOverrideSpecialValues003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: () => void): void => {
            let wl: WorkerLocal<NullableString> = new WorkerLocal<NullableString>();
            wl.set("test");
            expect(wl.get()).assertEqual("test");

            wl.set(null);
            expect(wl.get()).assertNull();

            wl.set("test2");
            expect(wl.get()).assertEqual("test2");

            wl.set("");
            expect(wl.get()).assertEqual("");
            done();
        });

        /**
         * @tc.number SUB_UTILS_WORKERLOCAL_SET_0400
         * @tc.name SetComplexTypes004
         * @tc.desc Test set() with complex types (array, class, union, undefined)
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('SetComplexTypes004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: () => void): void => {
            let wlArray: WorkerLocal<int[]> = new WorkerLocal<int[]>();
            wlArray.set([1, 2, 3]);
            expect(wlArray.get().length).assertEqual(3);

            let wlClass: WorkerLocal<MyClass> = new WorkerLocal<MyClass>();
            wlClass.set(new MyClass(42));
            expect(wlClass.get().value).assertEqual(42);

            let wlUnion: WorkerLocal<UnionIntString> = new WorkerLocal<UnionIntString>();
            wlUnion.set(100);
            expect(wlUnion.get()).assertEqual(100);

            wlUnion.set("string");
            expect(wlUnion.get()).assertEqual("string");

            let wlUndefined: WorkerLocal<StringOrUndefined> = new WorkerLocal<StringOrUndefined>();
            wlUndefined.set("valid");
            expect(wlUndefined.get()).assertEqual("valid");

            wlUndefined.set(undefined);
            expect(wlUndefined.get()).assertUndefined();
            done();
        });

        // ==================== E. delete() 方法测试 ====================

        /**
         * @tc.number SUB_UTILS_WORKERLOCAL_DELETE_0100
         * @tc.name DeleteSetValue001
         * @tc.desc Test delete() removes set value
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('DeleteSetValue001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: () => void): void => {
            let wl: WorkerLocal<int> = new WorkerLocal<int>();
            wl.set(42);
            wl.delete();

            // After delete, get should throw exception for non-init WorkerLocal
            let exceptionThrown: boolean = false;
            try {
                wl.get();
            } catch (e) {
                exceptionThrown = true;
            }
            expect(exceptionThrown).assertTrue();
            done();
        });

        /**
         * @tc.number SUB_UTILS_WORKERLOCAL_DELETE_0200
         * @tc.name DeleteInitValue002
         * @tc.desc Test delete() with init function re-executes on next get
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('DeleteInitValue002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: () => void): void => {
            let wl: WorkerLocal<int> = new WorkerLocal<int>(() => {
                return 100;
            });

            expect(wl.get()).assertEqual(100);
            wl.delete();

            // After delete, get should re-execute init
            let value: int = wl.get();
            expect(value).assertEqual(100);
            done();
        });

        /**
         * @tc.number SUB_UTILS_WORKERLOCAL_DELETE_0300
         * @tc.name DeleteThenSet003
         * @tc.desc Test delete() then set() works correctly
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('DeleteThenSet003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: () => void): void => {
            let wl: WorkerLocal<int> = new WorkerLocal<int>();
            wl.set(42);
            wl.delete();
            wl.set(100);

            expect(wl.get()).assertEqual(100);
            done();
        });

        /**
         * @tc.number SUB_UTILS_WORKERLOCAL_DELETE_0400
         * @tc.name DeleteMultiple004
         * @tc.desc Test multiple delete() calls
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('DeleteMultiple004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: () => void): void => {
            let wl: WorkerLocal<int> = new WorkerLocal<int>();
            wl.set(42);
            wl.delete();
            wl.delete(); // Second delete should not throw

            let exceptionThrown: boolean = false;
            try {
                wl.get();
            } catch (e) {
                exceptionThrown = true;
            }
            expect(exceptionThrown).assertTrue();
            done();
        });

        /**
         * @tc.number SUB_UTILS_WORKERLOCAL_DELETE_0500
         * @tc.name DeleteNoValue005
         * @tc.desc Test delete() when no value set
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('DeleteNoValue005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: () => void): void => {
            let wl: WorkerLocal<int> = new WorkerLocal<int>();
            wl.delete(); // Should not throw

            let exceptionThrown: boolean = false;
            try {
                wl.get();
            } catch (e) {
                exceptionThrown = true;
            }
            expect(exceptionThrown).assertTrue();
            done();
        });

        // ==================== F. 多线程场景测试 ====================

        /**
         * @tc.number SUB_UTILS_WORKERLOCAL_MULTITHREAD_0100
         * @tc.name MultiThreadIsolation001
         * @tc.desc test WorkerLocal thread isolation with taskpool
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('MultiThreadIsolation001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let wl: WorkerLocal<string> = new WorkerLocal<string>(() => {
                return "default";
            });

            // Main thread sets value
            wl.set("main-thread");
            expect(wl.get()).assertEqual("main-thread");

            // Worker thread should get default value
            let task: taskpool.Task = new taskpool.Task(() => {
                let workerWl: WorkerLocal<string> = new WorkerLocal<string>(() => {
                    return "default";
                });
                return workerWl.get();
            });

            let result: string = await taskpool.execute(task) as string;
            expect(result).assertEqual("default");

            // Main thread value should not be affected
            expect(wl.get()).assertEqual("main-thread");
            done();
        });

        /**
         * @tc.number SUB_UTILS_WORKERLOCAL_MULTITHREAD_0200
         * @tc.name MultiThreadIndependentInit002
         * @tc.desc test each thread independently executes init function
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('MultiThreadIndependentInit002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let wl: WorkerLocal<int> = new WorkerLocal<int>(() => {
                return 100;
            });

            // Main thread gets init value
            let mainValue: int = wl.get();
            expect(mainValue).assertEqual(100);

            // Worker thread should independently execute init
            let task: taskpool.Task = new taskpool.Task(() => {
                let workerWl: WorkerLocal<int> = new WorkerLocal<int>(() => {
                    return 100;
                });
                return workerWl.get();
            });

            let workerValue: int = await taskpool.execute(task) as int;
            expect(workerValue).assertEqual(100);
            done();
        });

        // ==================== G. 错误码覆盖测试 ====================

        /**
         * @tc.number SUB_UTILS_WORKERLOCAL_ERROR_0100
         * @tc.name ErrorNoInitGet001
         * @tc.desc test get() throws exception when WorkerLocal has no init and value not set
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ErrorNoInitGet001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: () => void): void => {
            let wl: WorkerLocal<int> = new WorkerLocal<int>();

            let exceptionThrown: boolean = false;
            try {
                wl.get();
            } catch (e) {
                exceptionThrown = true;
            }

            expect(exceptionThrown).assertTrue();
            done();
        });

        /**
         * @tc.number SUB_UTILS_WORKERLOCAL_ERROR_0200
         * @tc.name ErrorDeleteThenGet002
         * @tc.desc test get() throws exception after delete() when no init
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ErrorDeleteThenGet002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: () => void): void => {
            let wl: WorkerLocal<int> = new WorkerLocal<int>();
            wl.set(42);
            wl.delete();

            let exceptionThrown: boolean = false;
            try {
                wl.get();
            } catch (e) {
                exceptionThrown = true;
            }

            expect(exceptionThrown).assertTrue();
            done();
        });

        /**
         * @tc.number SUB_UTILS_WORKERLOCAL_ERROR_0300
         * @tc.name ErrorMultipleDeleteThenGet003
         * @tc.desc test get() throws exception after multiple delete() when no init
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ErrorMultipleDeleteThenGet003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: () => void): void => {
            let wl: WorkerLocal<int> = new WorkerLocal<int>();
            wl.set(42);
            wl.delete();
            wl.delete();

            let exceptionThrown: boolean = false;
            try {
                wl.get();
            } catch (e) {
                exceptionThrown = true;
            }

            expect(exceptionThrown).assertTrue();
            done();
        });

        // ==================== H. 覆盖设置测试 ====================

        /**
         * @tc.number SUB_UTILS_WORKERLOCAL_OVERRIDE_0100
         * @tc.name OverrideInitWithSet001
         * @tc.desc test overriding init value with set
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('OverrideInitWithSet001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: () => void): void => {
            let wl: WorkerLocal<int> = new WorkerLocal<int>(() => {
                return 100;
            });

            expect(wl.get()).assertEqual(100);
            wl.set(200);
            expect(wl.get()).assertEqual(200);
            done();
        });

        /**
         * @tc.number SUB_UTILS_WORKERLOCAL_OVERRIDE_0200
         * @tc.name OverrideWithNullUndefined002
         * @tc.desc test overriding with null and undefined
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('OverrideWithNullUndefined002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: () => void): void => {
            let wl: WorkerLocal<ThreeState> = new WorkerLocal<ThreeState>();
            wl.set("test");
            expect(wl.get()).assertEqual("test");

            wl.set(null);
            expect(wl.get()).assertNull();

            wl.set(undefined);
            expect(wl.get()).assertUndefined();

            wl.set("test2");
            expect(wl.get()).assertEqual("test2");
            done();
        });

        // ==================== I. 边界和特殊值测试 ====================

        /**
         * @tc.number SUB_UTILS_WORKERLOCAL_BOUNDARY_0100
         * @tc.name BoundaryNumericValues001
         * @tc.desc test WorkerLocal with numeric boundary values
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('BoundaryNumericValues001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: () => void): void => {
            let wlByte: WorkerLocal<byte> = new WorkerLocal<byte>();
            wlByte.set(Byte.MIN_VALUE);
            expect(wlByte.get()).assertEqual(Byte.MIN_VALUE);

            wlByte.set(Byte.MAX_VALUE);
            expect(wlByte.get()).assertEqual(Byte.MAX_VALUE);

            let wlInt: WorkerLocal<int> = new WorkerLocal<int>();
            wlInt.set(Int.MIN_VALUE);
            expect(wlInt.get()).assertEqual(Int.MIN_VALUE);

            wlInt.set(Int.MAX_VALUE);
            expect(wlInt.get()).assertEqual(Int.MAX_VALUE);

            done();
        });

        /**
         * @tc.number SUB_UTILS_WORKERLOCAL_BOUNDARY_0200
         * @tc.name BoundaryZeroAndEmpty002
         * @tc.desc test WorkerLocal with zero and empty values
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('BoundaryZeroAndEmpty002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: () => void): void => {
            let wlInt: WorkerLocal<int> = new WorkerLocal<int>();
            wlInt.set(0);
            expect(wlInt.get()).assertEqual(0);

            let wlString: WorkerLocal<string> = new WorkerLocal<string>();
            wlString.set("");
            expect(wlString.get()).assertEqual("");

            let wlArray: WorkerLocal<int[]> = new WorkerLocal<int[]>();
            wlArray.set([]);
            expect(wlArray.get().length).assertEqual(0);

            let wlBoolean: WorkerLocal<boolean> = new WorkerLocal<boolean>();
            wlBoolean.set(false);
            expect(wlBoolean.get()).assertFalse();

            done();
        });

        /**
         * @tc.number SUB_UTILS_WORKERLOCAL_BOUNDARY_0300
         * @tc.name BoundaryArrayEmpty003
         * @tc.desc test WorkerLocal with empty array
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('BoundaryArrayEmpty003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: () => void): void => {
            let wlArray: WorkerLocal<int[]> = new WorkerLocal<int[]>(() => {
                return [];
            });

            expect(wlArray.get().length).assertEqual(0);
            done();
        });

        // ==================== J. 类型匹配测试 ====================

        /**
         * @tc.number SUB_UTILS_WORKERLOCAL_TYPE_0100
         * @tc.name TypeInference001
         * @tc.desc test WorkerLocal type inference with get()
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('TypeInference001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: () => void): void => {
            let wlInt: WorkerLocal<int> = new WorkerLocal<int>();
            wlInt.set(42);
            let val: int = wlInt.get();
            expect(val).assertEqual(42);

            let wlString: WorkerLocal<string> = new WorkerLocal<string>();
            wlString.set("hello");
            let str: string = wlString.get();
            expect(str).assertEqual("hello");
            done();
        });

        /**
         * @tc.number SUB_UTILS_WORKERLOCAL_TYPE_0200
         * @tc.name TypeUnion002
         * @tc.desc test WorkerLocal with union type get()
         * @tc.size SmallTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('TypeUnion002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: () => void): void => {
            let wlUnion: WorkerLocal<UnionIntString> = new WorkerLocal<UnionIntString>();
            wlUnion.set(100);
            let val1: UnionIntString = wlUnion.get();
            expect(val1).assertEqual(100);

            wlUnion.set("string");
            let val2: UnionIntString = wlUnion.get();
            expect(val2).assertEqual("string");
            done();
        });

    });
}
