import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import hilog from '@ohos.hilog'

class TestClass {
}

interface QueueItem {
    key: string;
    value: number;
}

interface QueueItem2 {
    key: string;
}

function createAddTask(queueTemp: containers.stackless.ArrayConcurrentQueue<int>, data: int): taskpool.Task {
    return new taskpool.Task((queue: containers.stackless.ArrayConcurrentQueue<int>, v: int) => {
        queue.add(v);
    }, queueTemp, data);
}

function createPushTask(queueTemp: containers.stackless.ArrayConcurrentQueue<int>, data: int): taskpool.Task {
    return new taskpool.Task(async (queue: containers.stackless.ArrayConcurrentQueue<int>, v: int) => {
        await queue.push(v);
    }, queueTemp, data);
}

function createPushTaskStart(queueTemp: containers.stackless.ArrayConcurrentQueue<int>, start: int): taskpool.Task {
    return new taskpool.Task(async (queue: containers.stackless.ArrayConcurrentQueue<int>, s: int) => {
        for (let i = 0; i < s; i++) {
            await queue.push(i);
        }
    }, queueTemp, start);
}

function createPushTaskStartLoopTen(queueTemp: containers.stackless.ArrayConcurrentQueue<int>, start: int): taskpool.Task {
    return new taskpool.Task(async (queue: containers.stackless.ArrayConcurrentQueue<int>, s: int) => {
        for (let i = s; i < s + 10; i++) {
            await queue.push(i);
        }
    }, queueTemp, start);
}

function createPopTaskStart(queueTemp: containers.stackless.ArrayConcurrentQueue<int>, start: int): taskpool.Task {
    return new taskpool.Task(async (queue: containers.stackless.ArrayConcurrentQueue<int>, s: int) => {
        for (let i: int = 0; i < s; i++) {
            await queue.pop();
        }
    }, queueTemp, start);
}

function createPollTask(queueTemp: containers.stackless.ArrayConcurrentQueue<int>): taskpool.Task {
    return new taskpool.Task((queue: containers.stackless.ArrayConcurrentQueue<int>) => {
        queue.poll();
    }, queueTemp);
}

function createPollTaskHundred(queueTemp: containers.stackless.ArrayConcurrentQueue<int>, start: int): taskpool.Task {
    return new taskpool.Task((queue: containers.stackless.ArrayConcurrentQueue<int>, s: int) => {
        for (let i: int = s; i < s + hundredTimes; i++) {
            queue.poll();
        }
    }, queueTemp, start);
}

function createAddTaskHundred(queueTemp: containers.stackless.ArrayConcurrentQueue<int>, start: int): taskpool.Task {
    return new taskpool.Task((queue: containers.stackless.ArrayConcurrentQueue<int>, s: int) => {
        for (let i: int = s; i < s + hundredTimes; i++) {
            queue.add(i);
        }
    }, queueTemp, start);
}

function createPopTask(queueTemp: containers.stackless.ArrayConcurrentQueue<int>): taskpool.Task {
    return new taskpool.Task(async (queue: containers.stackless.ArrayConcurrentQueue<int>) => {
        await queue.pop();
    }, queueTemp);
}

function createPopTaskHundred(queueTemp: containers.stackless.ArrayConcurrentQueue<int>, start: int): taskpool.Task {
    return new taskpool.Task(async (queue: containers.stackless.ArrayConcurrentQueue<int>, s: int) => {
        for (let i: int = s; i < s + hundredTimes; i++) {
            await queue.pop();
        }
    }, queueTemp, start);
}

function createPushTaskHundred(queueTemp: containers.stackless.ArrayConcurrentQueue<int>, start: int): taskpool.Task {
    return new taskpool.Task(async (queue: containers.stackless.ArrayConcurrentQueue<int>, s: int) => {
        for (let i: int = s; i < s + hundredTimes; i++) {
            await queue.push(i);
        }
    }, queueTemp, start);
}

// The expected value is 100 and to prevent runtime timeout, change the value to 10.
const hundredTimes: int = 10;
// The expected value is 1000 and to prevent runtime timeout, change the value to 100.
const thousandTimes: int = 100;
// The expected value is 10 and to prevent runtime timeout, change the value to 2.
const loopTenTimes: int = 2;

export default function ArrayConcurrentQueuetest() {

    const thousandElementsArray = new Array<Int>()

    describe("ArrayConcurrentQueue", (): void => {

        beforeAll((): void => {
            // Presets an action, which is performed only once before all test cases of the test suite start.
            // This API supports only one parameter: preset action function.
            for (let i = 0; i < 1000; i++) {
                thousandElementsArray.push(i);
            }
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_ACTUALCAPACITYTEST_0100
         * @tc.name actual_Capacity_Test_static
         * @tc.desc Verify queue capacity initialization
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("actual_Capacity_Test_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
            const initialCapacity = 10;
            const queue = new containers.stackless.ArrayConcurrentQueue<number>(initialCapacity);
            expect(queue.capacity).assertEqual(initialCapacity);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_PROPERTYINITIALIZATIONTEST_0105
         * @tc.name property_Initialization_Test_static_0105
         * @tc.desc Verify queue property initialization
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("property_Initialization_Test_static_0105", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
            const queue = new containers.stackless.ArrayConcurrentQueue<number>(10);
            expect(String(queue.capacity)).assertEqual('10');
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_PROPERTY_CAPACITYSINGLEELEMENT_0108
         * @tc.name property_Capacity_Single_Element_Test_static_0108
         * @tc.desc Verify queue with single element capacity
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it('property_Capacity_Single_Element_Test_static_0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const queue = new containers.stackless.ArrayConcurrentQueue<number>(1);
                expect(String(queue.capacity)).assertEqual('1');
                try {
                    await queue.push(1);
                } catch (error) {
                    expect(false).assertEqual(true);
                }
                expect(String(queue.size)).assertEqual('1');
                done();
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_PROPERTYCAPACITYOVERFLOW_0110
         * @tc.name property_Capacity_Overflow_Test_static_0110
         * @tc.desc Verify queue creation with overflow capacity throws error
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it('property_Capacity_Overflow_Test_static_0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            (): void => {
                const TAG = 'propertyCapacityOverflow';
                try {
                    const queue = new containers.stackless.ArrayConcurrentQueue<number>(Int.MAX_VALUE + 1);
                    expect().assertFail();
                } catch (error) {
                    expect(error instanceof Error).assertTrue();
                    console.error(`${TAG} failed, error: ${JSON.stringify(error)}`);
                }
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_EMPTYQUEUETEST_0111
         * @tc.name empty_Queue_Test_static_011
         * @tc.desc Verify empty queue size
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("empty_Queue_Test_static_011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
            const queue = new containers.stackless.ArrayConcurrentQueue<number>(10);
            expect(String(queue.size)).assertEqual('0');
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueuePUSHFILLTEST_0112
         * @tc.name Array_Concurrent_Queue_PushFill_Test_static_001
         * @tc.desc Verify blocking behavior when pushing to full queue
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("Array_Concurrent_Queue_PushFill_Test_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const queue = new containers.stackless.ArrayConcurrentQueue<number>(1);
                await queue.push(1);

                let isBlocked = false;
                setTimeout(async () => {
                    await queue.push(2);
                    isBlocked = true;
                }, 10);

                expect(isBlocked).assertFalse();
                await queue.pop();
                setTimeout(() => {
                    expect(isBlocked).assertTrue();
                    done();
                }, 20);
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueuePUSHMANYTEST_0113
         * @tc.name Array_Concurrent_Queue_PushMany_Test_static_002
         * @tc.desc Verify pushing multiple non-empty-compatible string values
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("Array_Concurrent_Queue_PushMany_Test_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const queue = new containers.stackless.ArrayConcurrentQueue<string>(5);
                await queue.push("");
                await queue.push("@@");

                expect(String(queue.size)).assertEqual('2');
                expect(await queue.pop()).assertEqual("");
                done();
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueuePUSHSTRINGTEST_0114
         * @tc.name Array_Concurrent_Queue_PushString_Test_static_003
         * @tc.desc Verify pushing and popping string values
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("Array_Concurrent_Queue_PushString_Test_static_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const queue = new containers.stackless.ArrayConcurrentQueue<string>(3);
                await queue.push("hello");
                expect(await queue.pop()).assertEqual("hello");
                done();
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueuePUSHBIGINTTEST_0115
         * @tc.name Array_Concurrent_Queue_PushString_Test_static_004
         * @tc.desc Verify pushing and popping bigint values
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("Array_Concurrent_Queue_PushString_Test_static_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const queue = new containers.stackless.ArrayConcurrentQueue<bigint>(2);
                const bigIntNum = BigInt(9007199254740991);
                await queue.push(bigIntNum);
                expect(String(await queue.pop())).assertEqual('9007199254740991');
                done();
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueuePUSHBOOLEANTEST_0116
         * @tc.name Array_Concurrent_Queue_PushString_Test_static_005
         * @tc.desc Verify pushing and popping boolean values
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("Array_Concurrent_Queue_PushString_Test_static_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const queue = new containers.stackless.ArrayConcurrentQueue<boolean>(1);
                await queue.push(true);
                expect(await queue.pop()).assertTrue();
                done();
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueuePUSHCLASSTEST_0117
         * @tc.name Array_Concurrent_Queue_Push_Class_Test_static_006
         * @tc.desc Verify pushing and popping class instances
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("Array_Concurrent_Queue_Push_Class_Test_static_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const queue = new containers.stackless.ArrayConcurrentQueue<TestClass>(1);
                const obj = new TestClass();
                await queue.push(obj);
                expect(await queue.pop()).assertEqual(obj);
                done();
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueuePUSHEMPTYTEST_0118
         * @tc.name Array_Concurrent_Queue_Push_Empty_Test_static_007
         * @tc.desc Verify pushing single element to empty queue
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("Array_Concurrent_Queue_Push_Empty_Test_static_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const queue = new containers.stackless.ArrayConcurrentQueue<number>(10);
                await queue.push(1);
                expect(String(queue.size)).assertEqual('1');
                done();
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueuePUSHEMPTYTEST_0119
         * @tc.name Array_Concurrent_Queue_Push_Only_One_Test_static_008
         * @tc.desc Verify pushing single element to queue with capacity 1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("Array_Concurrent_Queue_Push_Only_One_Test_static_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const queue = new containers.stackless.ArrayConcurrentQueue<string>(1);
                await queue.push("single");
                expect(String(queue.size)).assertEqual('1');
                done();
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueuePUSHTENTEST_0120
         * @tc.name Array_Concurrent_Queue_Push_Ten_Test_static_009
         * @tc.desc Verify pushing multiple elements to fill queue capacity
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("Array_Concurrent_Queue_Push_Ten_Test_static_009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const capacity = 10;
                const queue = new containers.stackless.ArrayConcurrentQueue<number>(capacity);
                await queue.push(1);
                expect(String(queue.size)).assertEqual('1');
                for (let i = 2; i <= capacity; i++) {
                    await queue.push(i);
                }
                expect(String(queue.size)).assertEqual(String(capacity));
                done();
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_PROPERTYPUSHSPECIALVALUES_0121
         * @tc.name property_Push_SpecialValues_static
         * @tc.desc Verify pushing and popping special string marker values
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it('property_Push_SpecialValues_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let queue: containers.stackless.ArrayConcurrentQueue<string> =
                new containers.stackless.ArrayConcurrentQueue<string>(4);
            let initialCapacity = queue.capacity;
            expect(String(initialCapacity)).assertEqual('4');

            await queue.push("");
            let sizeAfterEmptyString = queue.size;
            expect(String(sizeAfterEmptyString)).assertEqual('1');

            await queue.push('null');
            let sizeAfterNull = queue.size;
            expect(String(sizeAfterNull)).assertEqual('2');

            await queue.push('undefined');
            let sizeAfterUndefined = queue.size;
            expect(String(sizeAfterUndefined)).assertEqual('3');

            const specialChar = '!@#$%^&*';
            await queue.push(specialChar);
            let sizeAfterSpecialChar = queue.size;
            expect(String(sizeAfterSpecialChar)).assertEqual('4');

            let poppedEmptyString = await queue.pop();
            expect(String(poppedEmptyString)).assertEqual("");

            let poppedNull = await queue.pop();
            expect(String(poppedNull)).assertEqual('null');

            let poppedUndefined = await queue.pop();
            expect(String(poppedUndefined)).assertEqual('undefined');

            let poppedSpecialChar = await queue.pop();
            expect(String(poppedSpecialChar)).assertEqual(String(specialChar));
            done();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_PROPERTYPUSHNUMBER_0122
         * @tc.name property_Push_Number_static
         * @tc.desc Verify pushing and popping number values
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it('property_Push_Number_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let queue: containers.stackless.ArrayConcurrentQueue<number> = new containers.stackless.ArrayConcurrentQueue<number>(1);
            let initialCapacity = queue.capacity;
            expect(String(initialCapacity)).assertEqual('1');

            const num = 123;
            await queue.push(num);
            let sizeAfterPush = queue.size;
            expect(String(sizeAfterPush)).assertEqual('1');
            done();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_PROPERTYPUSHSTRING_0123
         * @tc.name property_Push_String_static
         * @tc.desc Verify pushing and popping string values
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it('property_Push_String_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let queue: containers.stackless.ArrayConcurrentQueue<string> = new containers.stackless.ArrayConcurrentQueue<string>(1);
            let initialCapacity = queue.capacity;
            expect(String(initialCapacity)).assertEqual('1');

            const str = "Hello, World!";
            await queue.push(str);
            let sizeAfterPush = queue.size;
            expect(String(sizeAfterPush)).assertEqual('1');

            let poppedString = await queue.pop();
            expect(String(poppedString)).assertEqual(String(str));
            done();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_PROPERTYPUSHBIGINT_0124
         * @tc.name property_Push_Bigint_static
         * @tc.desc Verify pushing and popping bigint values
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it('property_Push_Bigint_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let queue: containers.stackless.ArrayConcurrentQueue<bigint> = new containers.stackless.ArrayConcurrentQueue<bigint>(1);
            let initialCapacity = queue.capacity;
            expect(String(initialCapacity)).assertEqual('1');

            const bigIntNum = BigInt(9007199254740991);
            await queue.push(bigIntNum);
            let sizeAfterPush = queue.size;
            expect(String(sizeAfterPush)).assertEqual('1');

            let poppedBigInt = await queue.pop();
            expect(String(poppedBigInt)).assertEqual(String(bigIntNum));
            done();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_PROPERTYPUSHBOOLEAN_0125
         * @tc.name property_Push_Boolean_static
         * @tc.desc Verify pushing and popping boolean values
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it('property_Push_Boolean_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let queue: containers.stackless.ArrayConcurrentQueue<boolean> = new containers.stackless.ArrayConcurrentQueue<boolean>(1);
            let initialCapacity = queue.capacity;
            expect(String(initialCapacity)).assertEqual('1');

            const bool = true;
            await queue.push(bool);
            let sizeAfterPush = queue.size;
            expect(String(sizeAfterPush)).assertEqual('1');

            let poppedBoolean = await queue.pop();
            expect(String(poppedBoolean)).assertEqual(String(bool));
            done();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_PROPERTYPUSHARRAY_0126
         * @tc.name property_Push_Array_static
         * @tc.desc Verify pushing and popping array values
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it('property_Push_Array_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let queue: containers.stackless.ArrayConcurrentQueue<number[]> = new containers.stackless.ArrayConcurrentQueue<number[]>(1);
            let initialCapacity = queue.capacity;
            expect(String(initialCapacity)).assertEqual('1');

            const arr: number[] = [1, 2, 3];
            await queue.push(arr);
            let sizeAfterPush = queue.size;
            expect(String(sizeAfterPush)).assertEqual('1');

            let poppedArray = await queue.pop();
            expect(String(poppedArray)).assertEqual(String(arr));
            done();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_PROPERTYPUSHCLASS_0127
         * @tc.name property_Push_Class_static
         * @tc.desc Verify pushing and popping class instances
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it('property_Push_Class_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let queue: containers.stackless.ArrayConcurrentQueue<Date> = new containers.stackless.ArrayConcurrentQueue<Date>(1);
            let initialCapacity = queue.capacity;
            expect(String(initialCapacity)).assertEqual('1');

            const dateInstance = new Date();
            await queue.push(dateInstance);
            let sizeAfterPush = queue.size;
            expect(String(sizeAfterPush)).assertEqual('1');

            let poppedDate = await queue.pop();
            expect(String(poppedDate.getTime())).assertEqual(String(dateInstance.getTime()));
            done();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_PROPERTYPUSHOBJECT_0128
         * @tc.name property_Push_Object_static
         * @tc.desc Verify pushing and popping object values
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it('property_Push_Object_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let queue: containers.stackless.ArrayConcurrentQueue<QueueItem> = new containers.stackless.ArrayConcurrentQueue<QueueItem>(1);
            let initialCapacity = queue.capacity;
            expect(String(initialCapacity)).assertEqual('1');
            const obj: QueueItem = {
                key: 'testKey', value: 123
            };
            await queue.push(obj);
            let sizeAfterPush = queue.size;
            expect(String(sizeAfterPush)).assertEqual('1');

            let poppedObject = await queue.pop();
            expect(String(poppedObject.key)).assertEqual(String(obj.key));
            expect(String(poppedObject.value)).assertEqual(String(obj.value));
            done();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueueWITHPUSHTEST_0129
         * @tc.name Array_Concurrent_Queue_With_Push_Test_static_001
         * @tc.desc Verify initial size of empty queue
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("Array_Concurrent_Queue_With_Push_Test_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            (): void => {
                const queue = new containers.stackless.ArrayConcurrentQueue<number>(1);
                expect(String(queue.size)).assertEqual('0');
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueueWITHPUSHTEST_0130
         * @tc.name Array_Concurrent_Queue_With_Push_Test_static_002
         * @tc.desc Verify size after pushing single element
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("Array_Concurrent_Queue_With_Push_Test_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const queue = new containers.stackless.ArrayConcurrentQueue<number>(1);
                await queue.push(1);
                expect(String(queue.size)).assertEqual('1');
                done();
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueueWITHPUSHTEST_0131
         * @tc.name Array_Concurrent_Queue_With_Push_Test_static_003
         * @tc.desc Verify size after pushing multiple elements
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("Array_Concurrent_Queue_With_Push_Test_static_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const capacity = 10;
                const queue = new containers.stackless.ArrayConcurrentQueue<number>(capacity);
                for (let i = 0; i < capacity - 1; i++) {
                    await queue.push(i);
                }
                expect(String(queue.size)).assertEqual(String(capacity - 1));
                done();
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueueWITHPUSHTEST_0132
         * @tc.name Array_Concurrent_Queue_With_Push_Test_static_004
         * @tc.desc Verify size after pushing single element to empty queue
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("Array_Concurrent_Queue_With_Push_Test_static_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const queue = new containers.stackless.ArrayConcurrentQueue<number>(10);
                await queue.push(1);
                expect(String(queue.size)).assertEqual('1');
                done();
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueueWITHPUSHTEST_0133
         * @tc.name Array_Concurrent_Queue_With_Push_Test_static_005
         * @tc.desc Verify size after pushing multiple elements to queue
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("Array_Concurrent_Queue_With_Push_Test_static_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const capacity = 10;
                const queue = new containers.stackless.ArrayConcurrentQueue<number>(capacity);
                for (let i = 0; i < capacity - 1; i++) {
                    await queue.push(i);
                }
                expect(String(queue.size)).assertEqual(String(capacity - 1));
                done();
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueueWITHPUSHTEST_0134
         * @tc.name Array_Concurrent_Queue_With_Push_Test_static_006
         * @tc.desc Verify size after filling queue to capacity
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("Array_Concurrent_Queue_With_Push_Test_static_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const capacity = 10;
                const queue = new containers.stackless.ArrayConcurrentQueue<number>(capacity);
                for (let i = 0; i < capacity; i++) {
                    await queue.push(i);
                }
                expect(String(queue.size)).assertEqual(String(capacity));
                done();
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueueWITHPOPTEST_0135
         * @tc.name Array_Concurrent_Queue_With_Pop_Test_static_001
         * @tc.desc Verify popping element from filled queue
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("Array_Concurrent_Queue_With_Pop_Test_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const capacity = 10;
                const queue = new containers.stackless.ArrayConcurrentQueue<number>(capacity);
                for (let i = 0; i < capacity; i++) {
                    await queue.push(i);
                }
                const firstElement = await queue.pop();
                expect(String(firstElement)).assertEqual('0');
                expect(String(queue.size)).assertEqual(String(capacity - 1));
                done();
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueueWITHPOPTEST_0136
         * @tc.name Array_Concurrent_Queue_With_Pop_Test_static_002
         * @tc.desc Verify popping element from filled queue
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("Array_Concurrent_Queue_With_Pop_Test_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const capacity = 10;
                const queue = new containers.stackless.ArrayConcurrentQueue<number>(capacity);
                for (let i = 0; i < capacity; i++) {
                    await queue.push(i);
                }
                const firstElement = await queue.pop();
                const secondElement = await queue.pop();
                expect(String(secondElement)).assertEqual('1');
                expect(String(queue.size)).assertEqual(String(capacity - 2));
                done();
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueueWITHPOPTEST_0137
         * @tc.name Array_Concurrent_Queue_With_Pop_Test_static_003
         * @tc.desc Verify popping special values (empty string, null)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("Array_Concurrent_Queue_With_Pop_Test_static_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const capacity = 10;
                const queue = new containers.stackless.ArrayConcurrentQueue<string>(capacity);
                await queue.push("");
                await queue.push("null");
                await queue.push("@@@");
                expect(await queue.pop()).assertEqual("");
                expect(String(await queue.pop())).assertEqual("null");
                expect(await queue.pop()).assertEqual("@@@");
                done();
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueueWITHPOPTEST_0138
         * @tc.name Array_Concurrent_Queue_With_Pop_Test_static_004
         * @tc.desc Verify popping string values including "undefined"
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("Array_Concurrent_Queue_With_Pop_Test_static_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const capacity = 10;
                const queue = new containers.stackless.ArrayConcurrentQueue<string>(capacity);
                await queue.push("");
                await queue.push("undefined");
                expect(await queue.pop()).assertEqual("");
                expect(String(await queue.pop())).assertEqual("undefined");
                done();
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueueWITHPOPTEST_0139
         * @tc.name Array_Concurrent_Queue_With_Pop_Test_static_005
         * @tc.desc Verify popping single element from queue
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("Array_Concurrent_Queue_With_Pop_Test_static_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const queue = new containers.stackless.ArrayConcurrentQueue<number>(1);
                await queue.push(100);
                expect(String(await queue.pop())).assertEqual('100');
                expect(String(queue.size)).assertEqual('0');
                done();
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueueWITHPOPTEST_0140
         * @tc.name Array_Concurrent_Queue_With_Pop_Test_static_006
         * @tc.desc Verify popping all elements from queue
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("Array_Concurrent_Queue_With_Pop_Test_static_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const capacity = 10;
                const queue = new containers.stackless.ArrayConcurrentQueue<number>(capacity);
                for (let i = 0; i < capacity - 1; i++) {
                    await queue.push(i);
                }
                expect(String(queue.size)).assertEqual(String(capacity - 1));
                const firstElement = await queue.pop();
                expect(String(firstElement)).assertEqual('0');
                expect(String(queue.size)).assertEqual(String(capacity - 2));
                for (let i = 1; i < capacity - 1; i++) {
                    expect(String(await queue.pop())).assertEqual(String(i));
                    expect(String(queue.size)).assertEqual(String(capacity - 2 - i));
                }
                expect(String(queue.size)).assertEqual('0');
                done();
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueueWITHADDTEST_0141
         * @tc.name Array_Concurrent_Queue_With_Add_Test_static_001
         * @tc.desc Verify add operation when queue is full
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("Array_Concurrent_Queue_With_Add_Test_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            (): void => {
                const capacity = 10;
                const queue = new containers.stackless.ArrayConcurrentQueue<number>(10);
                for (let i = 0; i < capacity; i++) {
                    queue.add(i);
                }
                expect(String(queue.add(11))).assertEqual('false');
                expect(String(queue.size)).assertEqual(String(capacity));
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueueWITHADDTEST_0142
         * @tc.name Array_Concurrent_Queue_With_Add_Test_static_002
         * @tc.desc Verify adding special string values
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("Array_Concurrent_Queue_With_Add_Test_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            (): void => {
                const capacity = 5;
                const queue = new containers.stackless.ArrayConcurrentQueue<string>(5);
                expect(String(queue.add(""))).assertEqual('true');
                expect(queue.add('null')).assertTrue();
                expect(queue.add('undefined')).assertTrue();
                expect(String(queue.add("381yeqwhe239847qkedq4971"))).assertEqual('true');
                expect(String(queue.size)).assertEqual('4');
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueueWITHADDTEST_0143
         * @tc.name Array_Concurrent_Queue_With_Add_Test_static_003
         * @tc.desc Verify adding single element to queue
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("Array_Concurrent_Queue_With_Add_Test_static_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            (): void => {
                const queue = new containers.stackless.ArrayConcurrentQueue<string>(1);
                expect(String(queue.add('hello'))).assertEqual('true');
                expect(String(queue.size)).assertEqual('1');
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueueWITHADDTEST_0144
         * @tc.name Array_Concurrent_Queue_With_Add_Test_static_004
         * @tc.desc Verify adding bigint value to queue
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("Array_Concurrent_Queue_With_Add_Test_static_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            (): void => {
                const queue = new containers.stackless.ArrayConcurrentQueue<bigint>(1);
                let initialCapacity = queue.capacity;
                expect(String(initialCapacity)).assertEqual('1');
                const bigIntNum = BigInt(9007199254740991);
                expect(String(queue.add(bigIntNum))).assertEqual('true');
                expect(String(queue.size)).assertEqual('1');
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueueWITHADDTEST_0145
         * @tc.name Array_Concurrent_Queue_With_Add_Test_static_005
         * @tc.desc Verify adding boolean value to queue
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("Array_Concurrent_Queue_With_Add_Test_static_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            (): void => {
                const queue = new containers.stackless.ArrayConcurrentQueue<boolean>(1);
                let initialCapacity = queue.capacity;
                expect(String(initialCapacity)).assertEqual('1');
                expect(String(queue.add(false))).assertEqual('true');
                expect(String(queue.size)).assertEqual('1');
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueueWITHADDTEST_0146
         * @tc.name Array_Concurrent_Queue_With_Add_Test_static_006
         * @tc.desc Verify adding array to queue
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("Array_Concurrent_Queue_With_Add_Test_static_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            (): void => {
                const queue = new containers.stackless.ArrayConcurrentQueue<number[]>(1);
                let initialCapacity = queue.capacity;
                expect(String(initialCapacity)).assertEqual('1');

                const arr: number[] = [1, 2, 3];
                expect(String(queue.add(arr))).assertEqual('true');
                expect(String(queue.size)).assertEqual('1');
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueueWITHADDTEST_0147
         * @tc.name Array_Concurrent_Queue_With_Add_Test_static_007
         * @tc.desc Verify adding and popping array from queue
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("Array_Concurrent_Queue_With_Add_Test_static_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                let queue: containers.stackless.ArrayConcurrentQueue<number[]> = new containers.stackless.ArrayConcurrentQueue<number[]>(1);
                let initialCapacity = queue.capacity;
                expect(String(initialCapacity)).assertEqual('1');
                const arr: number[] = [1, 2, 3];
                queue.add(arr);
                let sizeAfterPush = queue.size;
                expect(String(sizeAfterPush)).assertEqual('1');

                let poppedArray = await queue.pop();
                expect(String(poppedArray)).assertEqual(String(arr));
                done();
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueueWITHADDTEST_0148
         * @tc.name Array_Concurrent_Queue_With_Add_Test_static_008
         * @tc.desc Verify adding and popping Date object from queue
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("Array_Concurrent_Queue_With_Add_Test_static_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                let queue: containers.stackless.ArrayConcurrentQueue<Date> = new containers.stackless.ArrayConcurrentQueue<Date>(1);
                let initialCapacity = queue.capacity;
                expect(String(initialCapacity)).assertEqual('1');

                const dateInstance = new Date();
                queue.add(dateInstance);
                let sizeAfterPush = queue.size;
                expect(String(sizeAfterPush)).assertEqual('1');

                let poppedDate = await queue.pop();
                expect(String(poppedDate.getTime())).assertEqual(String(dateInstance.getTime()));
                done();
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueueWITHADDTEST_0149
         * @tc.name Array_Concurrent_Queue_With_Add_Test_static_0009
         * @tc.desc Verify adding object with key-value pair to queue
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("Array_Concurrent_Queue_With_Add_Test_static_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            (): void => {

                let queue: containers.stackless.ArrayConcurrentQueue<QueueItem2> = new containers.stackless.ArrayConcurrentQueue<QueueItem2>(1);
                let initialCapacity = queue.capacity;
                expect(String(initialCapacity)).assertEqual('1');

                let addKey = queue.add({
                    key: "value"
                });
                expect(String(addKey)).assertEqual('true');
                expect(String(queue.size)).assertEqual('1');
            });


        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueueWITHADDTEST_0151
         * @tc.name Array_Concurrent_Queue_With_Add_Test_static_0011
         * @tc.desc Verify adding elements to full queue
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("Array_Concurrent_Queue_With_Add_Test_static_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            (): void => {
                const queue = new containers.stackless.ArrayConcurrentQueue<number>(1);
                expect(queue.add(1)).assertTrue();
                expect(String(queue.size)).assertEqual('1');
                expect(queue.add(2)).assertFalse();
                expect(String(queue.size)).assertEqual('1');
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueueWITHADDTEST_0152
         * @tc.name Array_Concurrent_Queue_With_Add_Test_static_0012
         * @tc.desc Verify adding multiple elements to queue
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("Array_Concurrent_Queue_With_Add_Test_static_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            (): void => {
                const capacity = 5;
                const queue = new containers.stackless.ArrayConcurrentQueue<number>(capacity);
                for (let i = 0; i < capacity - 1; i++) {
                    expect(queue.add(i)).assertTrue();
                }
                expect(String(queue.size)).assertEqual(String(capacity - 1));
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueueWITHADDTEST_0153
         * @tc.name Array_Concurrent_Queue_With_Add_Test_static_0013
         * @tc.desc Verify adding elements to fill queue capacity
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("Array_Concurrent_Queue_With_Add_Test_static_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            (): void => {
                const capacity = 10;
                const queue = new containers.stackless.ArrayConcurrentQueue<number>(capacity);
                expect(queue.add(1)).assertTrue();
                expect(String(queue.size)).assertEqual('1');
                for (let i = 0; i < capacity - 1; i++) {
                    expect(queue.add(i)).assertTrue();
                }
                expect(String(queue.size)).assertEqual(String(capacity));
                expect(queue.add(11)).assertFalse();
                expect(String(queue.size)).assertEqual(String(capacity));
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueueWITHPOLLTEST_0155
         * @tc.name Array_Concurrent_Queue_With_Poll_Test_static_0002
         * @tc.desc Verify polling from single element queue
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("Array_Concurrent_Queue_With_Poll_Test_static_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            (): void => {
                const queue = new containers.stackless.ArrayConcurrentQueue<number>(1);
                queue.add(100);
                expect(queue.poll()).assertEqual(100);
                expect(String(queue.size)).assertEqual('0');
                expect(queue.poll()).assertUndefined();
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueueWITHPOLLTEST_0156
         * @tc.name Array_Concurrent_Queue_With_Poll_Test_static_0003
         * @tc.desc Verify polling special string values from queue
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("Array_Concurrent_Queue_With_Poll_Test_static_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            (): void => {
                const queue = new containers.stackless.ArrayConcurrentQueue<string>(5);
                queue.add("");
                queue.add('null');
                queue.add('undefined');
                queue.add("huiafyef23@y8#");
                expect(queue.poll()).assertEqual("");
                expect(String(queue.poll())).assertEqual("null");
                expect(String(queue.poll())).assertEqual("undefined");
                expect(String(queue.size)).assertEqual('1');
                expect(queue.poll()).assertEqual("huiafyef23@y8#");
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueueWITHPOLLTEST_0157
         * @tc.name Array_Concurrent_Queue_With_Poll_Test_static_0004
         * @tc.desc Verify polling and adding elements dynamically
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("Array_Concurrent_Queue_With_Poll_Test_static_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            (): void => {
                const capacity = 5;
                const queue = new containers.stackless.ArrayConcurrentQueue<number>(capacity);
                for (let i = 0; i < capacity - 1; i++) {
                    queue.add(i);
                }
                expect(String(queue.poll())).assertEqual('0');
                expect(String(queue.size)).assertEqual(String(capacity - 2));
                expect(queue.add(99)).assertTrue();
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueueWITHPOLLTEST_0158
         * @tc.name Array_Concurrent_Queue_With_Poll_Test_static_0005
         * @tc.desc Verify polling all elements from filled queue
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("Array_Concurrent_Queue_With_Poll_Test_static_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            (): void => {
                const capacity = 10;
                const queue = new containers.stackless.ArrayConcurrentQueue<number>(capacity);
                for (let i = 0; i < capacity; i++) {
                    queue.add(i * 10);
                }
                expect(String(queue.poll())).assertEqual('0');
                expect(String(queue.size)).assertEqual(String(capacity - 1));

                for (let i = 1; i < capacity - 1; i++) {
                    expect(String(queue.poll())).assertEqual(String(i * 10));
                }
                expect(String(queue.size)).assertEqual('1');
                expect(queue.add(99)).assertTrue();

                expect(String(queue.poll())).assertEqual('90');
                expect(String(queue.size)).assertEqual('1');
                expect(String(queue.poll())).assertEqual('99');
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueueWITHPOLLTEST_0159
         * @tc.name Array_Concurrent_Queue_With_Poll_Test_static_0006
         * @tc.desc Verify polling elements in FIFO order
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("Array_Concurrent_Queue_With_Poll_Test_static_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            (): void => {
                const queue = new containers.stackless.ArrayConcurrentQueue<string>(3);
                queue.add("first");
                queue.add("second");

                expect(queue.poll()).assertEqual("first");
                expect(String(queue.size)).assertEqual('1');
                expect(queue.poll()).assertEqual("second");
                expect(String(queue.size)).assertEqual('0');
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueueWITHGETFIRSTTEST_016
         * @tc.name Array_Concurrent_Queue_With_GetFirst_Test_static_0001
         * @tc.desc Verify getting first element from filled queue
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("Array_Concurrent_Queue_With_GetFirst_Test_static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            (): void => {
                const queue = new containers.stackless.ArrayConcurrentQueue<number>(3);
                queue.add(10);
                queue.add(20);
                queue.add(30);
                expect(queue.getFirst()).assertEqual(10);
                expect(queue.size).assertEqual(3);
                expect(queue.add(40)).assertFalse();
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueueWITHGETFIRSTTEST_0161
         * @tc.name Array_Concurrent_Queue_With_GetFirst_Test_static_0002
         * @tc.desc Verify getting first element with special string values
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("Array_Concurrent_Queue_With_GetFirst_Test_static_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            (): void => {
                const queue = new containers.stackless.ArrayConcurrentQueue<string>(5);
                queue.add("");
                queue.add('null');
                queue.add('undefined');
                queue.add("yihahah111");
                expect(queue.getFirst()).assertEqual("");
                expect(queue.size).assertEqual(4);
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueueWITHGETFIRSTTEST_0163
         * @tc.name Array_Concurrent_Queue_With_GetFirst_Test_static_0004
         * @tc.desc Verify getting first element from single element queue
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("Array_Concurrent_Queue_With_GetFirst_Test_static_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            (): void => {
                const queue = new containers.stackless.ArrayConcurrentQueue<string>(1);
                queue.add("1");
                expect(String(queue.getFirst())).assertEqual("1");
                expect(String(queue.size)).assertEqual('1');
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueueWITHGETFIRSTTEST_0164
         * @tc.name Array_Concurrent_Queue_With_GetFirst_Test_static_0005
         * @tc.desc Verify getting first element after adding elements
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("Array_Concurrent_Queue_With_GetFirst_Test_static_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            (): void => {
                const capacity = 5;
                const queue = new containers.stackless.ArrayConcurrentQueue<number>(capacity);
                for (let i = 0; i < capacity - 1; i++) {
                    queue.add(i);
                }
                expect(String(queue.getFirst())).assertEqual('0');
                expect(String(queue.size)).assertEqual(String(capacity - 1));
                queue.add(123);
                expect(String(queue.getFirst())).assertEqual('0');
                expect(String(queue.size)).assertEqual(String(capacity));
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueueWITHGETFIRSTTEST_0165
         * @tc.name Array_Concurrent_Queue_With_GetFirst_Test_static_0006
         * @tc.desc Verify getting first boolean element from queue
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("Array_Concurrent_Queue_With_GetFirst_Test_static_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            (): void => {
                const queue = new containers.stackless.ArrayConcurrentQueue<boolean>(1);
                queue.add(true);
                expect(queue.getFirst()).assertTrue();
                expect(String(queue.size)).assertEqual('1');
                expect(queue.getFirst()).assertTrue();
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueueWITHGETFIRSTTEST_0166
         * @tc.name Array_Concurrent_Queue_With_GetFirst_Test_static_0007
         * @tc.desc Verify getting first element after filling queue
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("Array_Concurrent_Queue_With_GetFirst_Test_static_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            (): void => {
                const capacity = 10;
                const queue = new containers.stackless.ArrayConcurrentQueue<number>(capacity);
                queue.add(111);
                expect(String(queue.getFirst())).assertEqual('111');
                expect(String(queue.size)).assertEqual('1');
                for (let i = 1; i < capacity; i++) {
                    queue.add(100 + i);
                }
                expect(String(queue.getFirst())).assertEqual('111');
                expect(String(queue.size)).assertEqual(String(capacity));
                expect(queue.add(200)).assertFalse();
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueueWITHCAPACITYTEST_0169
         * @tc.name Array_Concurrent_Queue_With_Capacity_Test_static_0003
         * @tc.desc Verify single capacity queue behavior
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("Array_Concurrent_Queue_With_Capacity_Test_static_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            (): void => {
                const capacity = 1;
                const queue = new containers.stackless.ArrayConcurrentQueue<number>(capacity);
                queue.add(123);
                expect(String(queue.capacity)).assertEqual('1');
                expect(String(queue.size)).assertEqual('1');
                expect(String(queue.poll())).assertEqual('123');
                expect(String(queue.capacity)).assertEqual('1');
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueueWITHREMAININGCAPACITYTEST_0170
         * @tc.name Array_Concurrent_Queue_With_RemainingCapacity_Test_static_0001
         * @tc.desc Verify remaining capacity of full queue
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("Array_Concurrent_Queue_With_RemainingCapacity_Test_static_0001",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            (): void => {
                const capacity = 3;
                const queue = new containers.stackless.ArrayConcurrentQueue<number>(capacity);
                queue.add(123);
                queue.add(456);
                queue.add(789);
                expect(String(queue.remainingCapacity())).assertEqual('0');
                expect(queue.add(4)).assertFalse();
                expect(String(queue.remainingCapacity())).assertEqual('0');
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BBASE_containers.stackless.ArrayConcurrentQueueWITHREMAININGCAPACITYTEST_0171
         * @tc.name Array_Concurrent_Queue_With_RemainingCapacity_Test_static_0002
         * @tc.desc Verify remaining capacity after adding elements
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("Array_Concurrent_Queue_With_RemainingCapacity_Test_static_0002",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            (): void => {
                const capacity = 5;
                const queue = new containers.stackless.ArrayConcurrentQueue<number>(capacity);
                expect(queue.remainingCapacity()).assertEqual(capacity);
                expect(queue.add(1)).assertTrue();
                expect(queue.remainingCapacity()).assertEqual(capacity - 1);
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueueWITHREMAININGCAPACITYTEST_0172
         * @tc.name Array_Concurrent_Queue_With_RemainingCapacity_Test_static_0003
         * @tc.desc Verify remaining capacity changes after operations
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("Array_Concurrent_Queue_With_RemainingCapacity_Test_static_0003",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            (): void => {
                const queue = new containers.stackless.ArrayConcurrentQueue<boolean>(1);
                expect(String(queue.remainingCapacity())).assertEqual('1');
                queue.add(true);
                expect(String(queue.remainingCapacity())).assertEqual('0');
                queue.poll();
                expect(String(queue.remainingCapacity())).assertEqual('1');
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueueWITHREMAININGCAPACITYTEST_0173
         * @tc.name Array_Concurrent_Queue_With_RemainingCapacity_Test_static_0004
         * @tc.desc Verify remaining capacity when nearly full
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("Array_Concurrent_Queue_With_RemainingCapacity_Test_static_0004",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            (): void => {
                const capacity = 4;
                const queue = new containers.stackless.ArrayConcurrentQueue<number>(capacity);
                queue.add(10);
                queue.add(20);
                queue.add(30);
                expect(String(queue.remainingCapacity())).assertEqual('1');
                queue.add(40);
                expect(String(queue.remainingCapacity())).assertEqual('0');
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueueREMAININGCAPACITYTENTEST_0174
         * @tc.name ArrayConcurrentQueueRemainingCapacityTen_Test_static_005
         * @tc.desc Verify remaining capacity changes in large queue
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("ArrayConcurrentQueueRemainingCapacityTen_Test_static_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            (): void => {
                const capacity = 10;
                const queue = new containers.stackless.ArrayConcurrentQueue<string>(capacity);
                queue.add("A");
                expect(String(queue.remainingCapacity())).assertEqual(String(capacity - 1));
                for (let i = 1; i < capacity; i++) {
                    queue.add(`item${i}`);
                }
                expect(String(queue.remainingCapacity())).assertEqual('0');
                queue.poll();
                expect(String(queue.remainingCapacity())).assertEqual('1');
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueueREMAININGCAPACITYTENTEST_0175
         * @tc.name ArrayConcurrentQueueRemainingCapacityDynamic_Test_static_006
         * @tc.desc Verify dynamic remaining capacity changes
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("ArrayConcurrentQueueRemainingCapacityDynamic_Test_static_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            (): void => {
                const capacity = 5;
                const queue = new containers.stackless.ArrayConcurrentQueue<number>(capacity);
                expect(String(queue.remainingCapacity())).assertEqual(String(capacity));
                queue.add(1);
                queue.add(2);
                queue.add(3);
                expect(String(queue.remainingCapacity())).assertEqual('2');
                queue.poll();
                queue.poll();
                expect(String(queue.remainingCapacity())).assertEqual('4');
                queue.add(4);
                queue.add(5);
                queue.add(6);
                queue.add(7);
                expect(String(queue.remainingCapacity())).assertEqual('0');
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueueGETSIZEDYNAMICTEST_0176
         * @tc.name ArrayConcurrentQueueGetSizeDynamic_Test_static_001
         * @tc.desc Verify size after filling queue
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("ArrayConcurrentQueueGetSizeDynamic_Test_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const capacity = 3;
                const queue = new containers.stackless.ArrayConcurrentQueue<number>(capacity);
                await queue.push(1);
                await queue.push(2);
                await queue.push(3);

                expect(String(queue.size)).assertEqual('3');
                expect(String(queue.capacity)).assertEqual(String(capacity));
                done();
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueueGETSIZEDYNAMICTEST_0179
         * @tc.name ArrayConcurrentQueueGetSizeOne_Test_static_004
         * @tc.desc Verify size changes in single capacity queue
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("ArrayConcurrentQueueGetSizeOne_Test_static_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const queue = new containers.stackless.ArrayConcurrentQueue<boolean>(1);
            expect(String(queue.size)).assertEqual('0');
            await queue.push(true);
            expect(String(queue.size)).assertEqual('1');
            await queue.pop();
            expect(String(queue.size)).assertEqual('0');
            done();
        });


        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueueISEMPTYTRUETEST_0181
         * @tc.name ArrayConcurrentQueueIsEmptyFalse_Test_static_002
         * @tc.desc Verify isEmpty on non-empty queue
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("ArrayConcurrentQueueIsEmptyFalse_Test_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const queue = new containers.stackless.ArrayConcurrentQueue<string>(2);
                await queue.push("data");
                expect(String(queue.isEmpty())).assertEqual('false');
                expect(String(queue.size)).assertEqual('1');
                done();
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueueISEMPTYCHANGETEST_0183
         * @tc.name ArrayConcurrentQueueIsEmptyBoundary_Test_static_004
         * @tc.desc Verify isEmpty on single capacity queue
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("ArrayConcurrentQueueIsEmptyBoundary_Test_static_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const queue = new containers.stackless.ArrayConcurrentQueue<number>(1);
                expect(queue.isEmpty()).assertEqual(true);
                await queue.push(1);
                expect(queue.isEmpty()).assertEqual(false);
                await queue.pop();
                expect(queue.isEmpty()).assertEqual(true);
                done();
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueueISEMPTYCHANGETEST_0184
         * @tc.name ArrayConcurrentQueueIsEmptyMixed_Test_static_005
         * @tc.desc Verify isEmpty with mixed operations
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("ArrayConcurrentQueueIsEmptyMixed_Test_static_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const queue = new containers.stackless.ArrayConcurrentQueue<string>(3);
                await queue.push("a");
                await queue.pop();
                expect(String(queue.isEmpty())).assertEqual('true');

                queue.add("b");
                await queue.pop();
                expect(String(queue.isEmpty())).assertEqual('true');
                done();
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueueISEMPTYCHANGETEST_0185
         * @tc.name ArrayConcurrentQueueIsEmptyConcurrent_Test_static_006
         * @tc.desc Verify isEmpty with concurrent operations
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("ArrayConcurrentQueueIsEmptyConcurrent_Test_static_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const queue = new containers.stackless.ArrayConcurrentQueue<number>(10);
                await queue.push(1);
                await queue.pop();
                await queue.push(2);
                expect(String(queue.isEmpty())).assertEqual('false');
                await queue.pop();
                expect(String(queue.isEmpty())).assertEqual('true');
                done();
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueueGETENDCONCURRENTTEST_0186
         * @tc.name ArrayConcurrentQueueGetEndConcurrent_Test_static_001
         * @tc.desc Verify getEnd on filled queue
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("ArrayConcurrentQueueGetEndConcurrent_Test_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            (): void => {
                const capacity = 10;
                const queue = new containers.stackless.ArrayConcurrentQueue<number>(capacity);
                for (let i = 0; i < capacity; i++) {
                    queue.add(i);
                }
                expect(queue.getEnd()).assertEqual(9);
                expect(queue.size).assertEqual(10);
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueueGETENDCONCURRENTTEST_0187
         * @tc.name ArrayConcurrentQueueGetEndConcurrent_Test_static_002
         * @tc.desc Verify getEnd with special string marker values
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("ArrayConcurrentQueueGetEndConcurrent_Test_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            (): void => {
                const capacity = 5;
                const queue = new containers.stackless.ArrayConcurrentQueue<string>(capacity);
                queue.add("");
                queue.add('null');
                queue.add('undefined');
                queue.add("@#$");

                expect(String(queue.getEnd())).assertEqual('@#$');
                expect(queue.size).assertEqual(4);

                queue.poll();
                queue.add('null');
                expect(queue.getEnd()).assertEqual('null');

                queue.poll();
                queue.add('undefined');
                expect(queue.getEnd()).assertEqual('undefined');

                queue.poll();
                queue.add("");
                expect(String(queue.getEnd())).assertEqual("");
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueueGETENDCONCURRENTTEST_0188
         * @tc.name ArrayConcurrentQueueGetEndConcurrent_Test_static_003
         * @tc.desc Verify getEnd on empty queue
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("ArrayConcurrentQueueGetEndConcurrent_Test_static_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            (): void => {
                const capacity = 10;
                const queue = new containers.stackless.ArrayConcurrentQueue<number>(capacity);
                expect(String(queue.getEnd()).toString()).assertEqual('undefined');
                expect(String(queue.size)).assertEqual('0');
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueueGETENDCONCURRENTTEST_0189
         * @tc.name ArrayConcurrentQueueGetEndConcurrent_Test_static_004
         * @tc.desc Verify getEnd on single element queue
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("ArrayConcurrentQueueGetEndConcurrent_Test_static_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            (): void => {
                const capacity = 1;
                const queue = new containers.stackless.ArrayConcurrentQueue<number>(capacity);
                queue.add(100)
                expect(String(queue.getEnd())).assertEqual('100');
                expect(String(queue.size)).assertEqual('1');
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueueGETENDCONCURRENTTEST_0190
         * @tc.name ArrayConcurrentQueueGetEndConcurrent_Test_static_005
         * @tc.desc Verify getEnd on single element queue
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("ArrayConcurrentQueueGetEndConcurrent_Test_static_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            (): void => {
                const capacity = 1;
                const queue = new containers.stackless.ArrayConcurrentQueue<number>(capacity);
                queue.add(100)
                expect(String(queue.getEnd())).assertEqual('100');
                expect(String(queue.size)).assertEqual('1');
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueueGETENDCONCURRENTTEST_0191
         * @tc.name ArrayConcurrentQueueGetEndConcurrent_Test_static_006
         * @tc.desc Verify getEnd after filling queue
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("ArrayConcurrentQueueGetEndConcurrent_Test_static_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            (): void => {
                const capacity = 10;
                const queue = new containers.stackless.ArrayConcurrentQueue<number>(capacity);
                for (let i = 0; i < capacity - 1; i++) {
                    queue.add(i)
                }
                expect(String(queue.getEnd())).assertEqual('8');
                expect(String(queue.size)).assertEqual('9');
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueueGETENDCONCURRENTTEST_0192
         * @tc.name ArrayConcurrentQueueGetEndConcurrent_Test_static_007
         * @tc.desc Verify getEnd after filling queue
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("ArrayConcurrentQueueGetEndConcurrent_Test_static_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            (): void => {
                const capacity = 10;
                const queue = new containers.stackless.ArrayConcurrentQueue<number>(capacity);

                queue.add(1);
                expect(String(queue.size)).assertEqual('1');
                expect(String(queue.getEnd())).assertEqual('1');

                for (let i = 2; i < capacity; i++) {
                    queue.add(i);
                }
                expect(String(queue.size)).assertEqual('9');
                expect(String(queue.getEnd())).assertEqual('9');

                queue.add(10);
                expect(String(queue.size)).assertEqual('10');
                expect(String(queue.getEnd())).assertEqual('10');
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueueGETENDCONCURRENTTEST_0193
         * @tc.name ArrayConcurrentQueueGetEndConcurrent_Test_static_008
         * @tc.desc Verify getEnd with string value
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("ArrayConcurrentQueueGetEndConcurrent_Test_static_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            (): void => {
                const capacity = 1;
                const queue = new containers.stackless.ArrayConcurrentQueue<string>(capacity);
                queue.add('hahah')
                expect(String(queue.getEnd())).assertEqual('hahah');
                expect(String(queue.size)).assertEqual('1');
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueueGETENDCONCURRENTTEST_0194
         * @tc.name ArrayConcurrentQueueGetEndConcurrent_Test_static_009
         * @tc.desc Verify getEnd with multiple string values
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("ArrayConcurrentQueueGetEndConcurrent_Test_static_009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            (): void => {
                const queue = new containers.stackless.ArrayConcurrentQueue<string>(5);
                queue.add('hahah')
                queue.add('xixixi')
                expect(String(queue.getEnd())).assertEqual('xixixi');
                expect(String(queue.size)).assertEqual('2');
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueueGETENDCONCURRENTTEST_0195
         * @tc.name ArrayConcurrentQueueGetEndConcurrent_Test_static_0010
         * @tc.desc Verify getEnd with duplicate string values
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("ArrayConcurrentQueueGetEndConcurrent_Test_static_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            (): void => {
                const queue = new containers.stackless.ArrayConcurrentQueue<string>(5);
                queue.add('hahah')
                queue.add('hahah')
                expect(String(queue.getEnd())).assertEqual('hahah');
                expect(String(queue.size)).assertEqual('2');
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueueGETENDCONCURRENTTEST_0196
         * @tc.name ArrayConcurrentQueueGetEndConcurrent_Test_static_011
         * @tc.desc Verify getEnd with MAX_SAFE_INTEGER value
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("ArrayConcurrentQueueGetEndConcurrent_Test_static_011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            (): void => {
                const queue = new containers.stackless.ArrayConcurrentQueue<number>(5);
                queue.add(Number.MAX_SAFE_INTEGER);
                expect(String(queue.getEnd())).assertEqual(String(Number.MAX_SAFE_INTEGER));
                expect(String(queue.size)).assertEqual('1');
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueueGETENDCONCURRENTTEST_0197
         * @tc.name ArrayConcurrentQueueGetEndConcurrent_Test_static_012
         * @tc.desc Verify getEnd with MIN_SAFE_INTEGER value
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("ArrayConcurrentQueueGetEndConcurrent_Test_static_012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            (): void => {
                const queue = new containers.stackless.ArrayConcurrentQueue<number>(5);
                queue.add(Number.MIN_SAFE_INTEGER);
                expect(String(queue.getEnd())).assertEqual(String(Number.MIN_SAFE_INTEGER));
                expect(String(queue.size)).assertEqual('1');
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.stackless.ArrayConcurrentQueueCONSTRUCTORCONCURRENTTEST_0199
         * @tc.name ArrayConcurrentQueueConstructorConcurrent_Test_static_002
         * @tc.desc Verify constructor with empty array and single capacity
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("ArrayConcurrentQueueConstructorConcurrent_Test_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            (): void => {
                const queue = new containers.stackless.ArrayConcurrentQueue<number>(1, new Array<number>());
                expect(queue.isEmpty()).assertTrue();
                expect(String(queue.size)).assertEqual('0');
                expect(String(queue.capacity)).assertEqual('1');
            });

        /**
         * @tc.number SUB_COMMON_LIBRARY_UTIL_BASE_containers.stackless.ArrayConcurrentQueueCONSTRUCTORWITHSETTEST_200
         * @tc.name ArrayConcurrentQueueConstructorWith_Test_static_001
         * @tc.desc The test uses an empty array to initialize the queue (capacity = 0)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("ArrayConcurrentQueueConstructorWith_Test_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                try {
                    const emptyArray = new Array<Int>();
                    const queue = new containers.stackless.ArrayConcurrentQueue<int>(0, emptyArray);
                    expect().assertFail();
                } catch (error) {
                    expect(error instanceof Error).assertTrue();
                }
                done();
            });

        /**
         * @tc.number SUB_COMMON_LIBRARY_UTIL_BASE_containers.stackless.ArrayConcurrentQueueCONSTRUCTORWITHSETTEST_201
         * @tc.name ArrayConcurrentQueueConstructorWith_Test_static_002
         * @tc.desc The test uses an empty array to initialize the queue (capacity = 1)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("ArrayConcurrentQueueConstructorWith_Test_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const emptyArray = new Array<Int>();
                const queue = new containers.stackless.ArrayConcurrentQueue<int>(1, emptyArray);
                expect(queue.isEmpty()).assertTrue();
                expect(String(queue.size)).assertEqual('0');
                expect(String(queue.capacity)).assertEqual('1');
                done();
            });

        /**
         * @tc.number SUB_COMMON_LIBRARY_UTIL_BASE_containers.stackless.ArrayConcurrentQueueCONSTRUCTORWITHSETTEST_203
         * @tc.name ArrayConcurrentQueueConstructorWith_Test_static_004
         * @tc.desc The test initializes the queue with a single integer element (capacity = 1)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("ArrayConcurrentQueueConstructorWith_Test_static_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const oneElementArray = Array.create<Int>(1, 42);
                const queue = new containers.stackless.ArrayConcurrentQueue<int>(1, oneElementArray);
                expect(queue.isEmpty()).assertFalse();
                expect(queue.size).assertEqual(1);
                expect(queue.getFirst()).assertEqual(42);
                expect(queue.poll()).assertEqual(42);
                expect(queue.isEmpty()).assertTrue();
                expect(queue.capacity).assertEqual(1);
                done();
            });

        /**
         * @tc.number SUB_COMMON_LIBRARY_UTIL_BASE_containers.stackless.ArrayConcurrentQueueCONSTRUCTORWITHSETTEST_206
         * @tc.name ArrayConcurrentQueueConstructorWith_Test_static_007
         * @tc.desc The test uses an array with 1000 elements to initialize the queue (capacity = 0)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("ArrayConcurrentQueueConstructorWith_Test_static_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                try {
                    const queue: containers.stackless.ArrayConcurrentQueue<int> =
                        new containers.stackless.ArrayConcurrentQueue<int>(0, thousandElementsArray);
                    expect().assertFail();
                } catch (error) {
                    expect(error instanceof Error).assertTrue();
                }
                done();
            });

        /**
         * @tc.number SUB_COMMON_LIBRARY_UTIL_BASE_containers.stackless.ArrayConcurrentQueueCONSTRUCTORWITHSETTEST_207
         * @tc.name ArrayConcurrentQueueConstructorWith_Test_static_008
         * @tc.desc The test uses an array with 1000 elements to initialize the queue (capacity = 1)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("ArrayConcurrentQueueConstructorWith_Test_static_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                try {
                    const queue: containers.stackless.ArrayConcurrentQueue<int> =
                        new containers.stackless.ArrayConcurrentQueue<int>(1, thousandElementsArray);
                    expect().assertFail();
                } catch (error) {
                    expect(error instanceof RangeError).assertTrue();
                }
                done();
            });

        /**
         * @tc.number SUB_COMMON_LIBRARY_UTIL_BASE_containers.stackless.ArrayConcurrentQueueCONSTRUCTORWITHSETTEST_208
         * @tc.name ArrayConcurrentQueueConstructorWith_Test_static_009
         * @tc.desc The test uses an array with 1000 elements to initialize the queue (capacity = 1000)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("ArrayConcurrentQueueConstructorWith_Test_static_009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const queue: containers.stackless.ArrayConcurrentQueue<int> =
                    new containers.stackless.ArrayConcurrentQueue<int>(1000, thousandElementsArray);
                expect(String(queue.capacity)).assertEqual('1000');
                done();
            });

        /**
         * @tc.number SUB_COMMON_LIBRARY_UTIL_BASE_containers.stackless.ArrayConcurrentQueueCONSTRUCTORWITHSETTEST_210
         * @tc.name ArrayConcurrentQueueConstructorWith_Test_static_011
         * @tc.desc The test uses an empty set to initialize the queue (capacity = 1)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("ArrayConcurrentQueueConstructorWith_Test_static_011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const emptySet = new Set<int>();
                const queue: containers.stackless.ArrayConcurrentQueue<int> =
                    new containers.stackless.ArrayConcurrentQueue<int>(1, emptySet.values());
                expect(queue.isEmpty()).assertTrue();
                expect(String(queue.size)).assertEqual('0');
                expect(String(queue.capacity)).assertEqual('1');
                done();
            });

        /**
         * @tc.number SUB_COMMON_LIBRARY_UTIL_BASE_containers.stackless.ArrayConcurrentQueueCONSTRUCTORWITHSETTEST_212
         * @tc.name ArrayConcurrentQueueConstructorWith_Test_static_013
         * @tc.desc The test uses undefined as the iterable object to initialize the queue (capacity = 1)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("ArrayConcurrentQueueConstructorWith_Test_static_013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const map = new Set<int>()
                const queue: containers.stackless.ArrayConcurrentQueue<int> =
                    new containers.stackless.ArrayConcurrentQueue<int>(1, map.values());
                expect(String(queue.size)).assertEqual('0');
                expect(String(queue.capacity)).assertEqual('1');
                done();
            });

        /**
         * @tc.number SUB_COMMON_LIBRARY_UTIL_BASE_containers.stackless.ArrayConcurrentQueueCONSTRUCTORWITHSETTEST_213
         * @tc.name ArrayConcurrentQueueConstructorWith_Test_static_014
         * @tc.desc The test uses a non-empty integer array to initialize the queue (capacity = 0)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("ArrayConcurrentQueueConstructorWith_Test_static_014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                try {
                    const integerArray = new Array<Int>(1, 2, 3)
                    const queue: containers.stackless.ArrayConcurrentQueue<int> =
                        new containers.stackless.ArrayConcurrentQueue<int>(0, integerArray);
                    expect().assertFail();
                } catch (error) {
                    expect(error instanceof Error).assertTrue();
                }
                done();
            });

        /**
         * @tc.number SUB_COMMON_LIBRARY_UTIL_BASE_containers.stackless.ArrayConcurrentQueueCONSTRUCTORWITHSETTEST_214
         * @tc.name ArrayConcurrentQueueConstructorWith_Test_static_015
         * @tc.desc The test uses an integer array to initialize the queue
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("ArrayConcurrentQueueConstructorWith_Test_static_015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const integerArray = new Array<Int>(1, 2, 3)
                const queue: containers.stackless.ArrayConcurrentQueue<int> =
                    new containers.stackless.ArrayConcurrentQueue<int>(10, integerArray);
                expect(queue.size).assertEqual(3);
                expect(queue.capacity).assertEqual(10);
                done();
            });

        /**
         * @tc.number SUB_COMMON_LIBRARY_UTIL_BASE_containers.stackless.ArrayConcurrentQueueCONSTRUCTORWITHSETTEST_215
         * @tc.name ArrayConcurrentQueueConstructorWith_Test_static_016
         * @tc.desc Tests initializing the queue using an iterable object with Int.MAX_VALUE elements
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("ArrayConcurrentQueueConstructorWith_Test_static_016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                try {
                    const arr = new Map<int, int>();
                    let maxCapacity = Int.MAX_VALUE
                    const queue: containers.stackless.ArrayConcurrentQueue<int> =
                        new containers.stackless.ArrayConcurrentQueue<int>(maxCapacity, arr.values());
                    expect().assertFail();
                } catch (error) {
                    expect(error instanceof Error).assertTrue();
                }
                done();
            });

        /**
         * @tc.number SUB_COMMON_LIBRARY_UTIL_BASE_containers.stackless.ArrayConcurrentQueueCONSTRUCTORWITHSETTEST_216
         * @tc.name ArrayConcurrentQueueConstructorWith_Test_static_017
         * @tc.desc To test the use of Map to initialize the queue
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("ArrayConcurrentQueueConstructorWith_Test_static_017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const map = new Map<int, int>();
                map.set(1, 100);
                map.set(2, 200);
                map.set(3, 300);
                const queue: containers.stackless.ArrayConcurrentQueue<int> = new containers.stackless.ArrayConcurrentQueue<int>(3, map.values());
                expect(String(queue.size)).assertEqual('3');
                expect(String(queue.capacity)).assertEqual('3');
                done();
            });

        /**
         * @tc.number SUB_COMMON_LIBRARY_UTIL_BASE_containers.stackless.ArrayConcurrentQueueCONSTRUCTORWITHSETTEST_217
         * @tc.name ArrayConcurrentQueueConstructorWith_Test_static_018
         * @tc.desc To test initializing queues using nested arrays
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("ArrayConcurrentQueueConstructorWith_Test_static_018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const nestedArray = new Map<int, int[]>();
                nestedArray.set(1, [1, 2]);
                nestedArray.set(2, [3, 4]);
                nestedArray.set(3, [5, 6]);
                const queue: containers.stackless.ArrayConcurrentQueue<int> =
                    new containers.stackless.ArrayConcurrentQueue<int>(3, nestedArray.keys());
                expect(String(queue.size)).assertEqual('3');
                expect(String(queue.capacity)).assertEqual('3');
                done();
            });

        /**
         * @tc.number SUB_COMMONLIBRARY_ETSUTILS_containers.stackless.ArrayConcurrentQueuePerformanceTest_218
         * @tc.name ArrayConcurrentQueuePerformance_Test_static_001
         * @tc.desc 10 concurrent operations simultaneously add elements to the container.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("ArrayConcurrentQueuePerformance_Test_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const threadCount = 10;
                const taskGroup = new taskpool.TaskGroup();
                let queueInt: containers.stackless.ArrayConcurrentQueue<int> = new containers.stackless.ArrayConcurrentQueue<int>(threadCount);
                for (let i: int = 0; i < threadCount; i++) {
                    taskGroup.addTask(createAddTask(queueInt, i));
                }
                await taskpool.execute(taskGroup);
                expect(JSON.stringify(queueInt.size)).assertEqual(JSON.stringify(threadCount));
                expect(queueInt.isEmpty()).assertFalse();
                done();
            })

        /**
         * @tc.number SUB_COMMONLIBRARY_ETSUTILS_containers.stackless.ArrayConcurrentQueuePerformanceTest_219
         * @tc.name ArrayConcurrentQueuePerformance_Test_static_002
         * @tc.desc Initial container 100 elements, 10 concurrent simultaneous operation of the container to delete and remove elements
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("ArrayConcurrentQueuePerformance_Test_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const totalCount: int = 100;
                const numbers: Array<int> = new Array<int>();
                for (let i: int = 0; i < totalCount; i++) {
                    numbers.push(i);
                }
                const threadCount = 10;
                const taskGroup = new taskpool.TaskGroup();
                let iter = numbers.values();
                let queueInt: containers.stackless.ArrayConcurrentQueue<int> = new containers.stackless.ArrayConcurrentQueue<int>(totalCount, iter);
                for (let i: int = 0; i < threadCount; i++) {
                    taskGroup.addTask(createPopTask(queueInt));
                }
                await taskpool.execute(taskGroup);
                expect(JSON.stringify(queueInt.size)).assertEqual(JSON.stringify(totalCount - threadCount));
                expect(queueInt.isEmpty()).assertFalse();
                done();
            })

        /**
         * @tc.number SUB_COMMONLIBRARY_ETSUTILS_containers.stackless.ArrayConcurrentQueuePerformanceTest_220
         * @tc.name ArrayConcurrentQueuePerformance_Test_static_003
         * @tc.desc Initial container with 100 elements. Ten concurrent operations simultaneously operate on the container to perform element deletion (poll operation).
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("ArrayConcurrentQueuePerformance_Test_static_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const totalCount: int = 100;
                const numbers: Array<int> = new Array<int>();
                for (let i: int = 0; i < totalCount; i++) {
                    numbers.push(i);
                }
                const threadCount = 10;
                const taskGroup = new taskpool.TaskGroup();
                let iter = numbers.values();
                let queueInt: containers.stackless.ArrayConcurrentQueue<int> = new containers.stackless.ArrayConcurrentQueue<int>(totalCount, iter);
                for (let i: int = 0; i < threadCount; i++) {
                    taskGroup.addTask(createPollTask(queueInt));
                }
                await taskpool.execute(taskGroup);
                expect(JSON.stringify(queueInt.size)).assertEqual(JSON.stringify(totalCount - threadCount));
                expect(queueInt.isEmpty()).assertFalse();
                done();
            })

        /**
         * @tc.number SUB_COMMONLIBRARY_ETSUTILS_containers.stackless.ArrayConcurrentQueuePerformanceTest_221
         * @tc.name ArrayConcurrentQueuePerformance_Test_static_004
         * @tc.desc Push 100 data, poll 100 data.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("ArrayConcurrentQueuePerformance_Test_static_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const totalCount: int = 100;
                let queueInt: containers.stackless.ArrayConcurrentQueue<int> = new containers.stackless.ArrayConcurrentQueue<int>(totalCount);
                for (let i: int = 0; i < totalCount; i++) {
                    await queueInt.push(i);
                }
                for (let i: int = 0; i < totalCount; i++) {
                    queueInt.poll();
                }
                expect(JSON.stringify(queueInt.size)).assertEqual('0');
                expect(queueInt.isEmpty()).assertTrue();
                done();
            })

        /**
         * @tc.number SUB_COMMONLIBRARY_ETSUTILS_containers.stackless.ArrayConcurrentQueuePerformanceTest_222
         * @tc.name ArrayConcurrentQueuePerformance_Test_static_005
         * @tc.desc add 100 pieces of data, pop 100 pieces of data.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("ArrayConcurrentQueuePerformance_Test_static_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const totalCount: int = 100;
                let queueInt: containers.stackless.ArrayConcurrentQueue<int> = new containers.stackless.ArrayConcurrentQueue<int>(totalCount);
                for (let i: int = 0; i < totalCount; i++) {
                    queueInt.add(i);
                }
                for (let i: int = 0; i < totalCount; i++) {
                    await queueInt.pop();
                }
                expect(JSON.stringify(queueInt.size)).assertEqual('0');
                expect(queueInt.isEmpty()).assertTrue();
                done();
            })

        /**
         * @tc.number SUB_COMMONLIBRARY_ETSUTILS_containers.stackless.ArrayConcurrentQueueAsyncTest_223
         * @tc.name ArrayConcurrentQueueAsync_Test_static_001
         * @tc.desc The host thread adds 1000 pieces of data, and 10 threads poll out the data at the same time
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("ArrayConcurrentQueueAsync_Test_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const totalCount: int = thousandTimes;
                const taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
                let queueInt: containers.stackless.ArrayConcurrentQueue<int> = new containers.stackless.ArrayConcurrentQueue<int>(totalCount);
                for (let i: int = 0; i < totalCount; i++) {
                    queueInt.add(i);
                }
                expect(JSON.stringify(queueInt.size)).assertEqual(JSON.stringify(totalCount));
                for (let i: int = 0; i < 10; i++) {
                    taskGroup.addTask(createPollTaskHundred(queueInt, i * hundredTimes));
                }
                await taskpool.execute(taskGroup);
                expect(JSON.stringify(queueInt.size)).assertEqual('0');
                expect(queueInt.isEmpty()).assertTrue();
                done();
            })

        /**
         * @tc.number SUB_COMMONLIBRARY_ETSUTILS_containers.stackless.ArrayConcurrentQueueAsyncTest_224
         * @tc.name ArrayConcurrentQueueAsync_Test_static_002
         * @tc.desc Multi-thread (10) push inserts a total of 1000 data, and the host thread pops out the data
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("ArrayConcurrentQueueAsync_Test_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const totalCount: int = thousandTimes;
                const taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
                let queueInt: containers.stackless.ArrayConcurrentQueue<int> = new containers.stackless.ArrayConcurrentQueue<int>(totalCount);
                for (let i: int = 0; i < totalCount; i++) {
                    await queueInt.push(i);
                }
                expect(JSON.stringify(queueInt.size)).assertEqual(JSON.stringify(totalCount));
                for (let i: int = 0; i < 10; i++) {
                    taskGroup.addTask(createPopTaskHundred(queueInt, i * hundredTimes));
                }
                await taskpool.execute(taskGroup);
                expect(JSON.stringify(queueInt.size)).assertEqual('0');
                expect(queueInt.isEmpty()).assertTrue();
                done();
            })

        /**
         * @tc.number SUB_COMMONLIBRARY_ETSUTILS_containers.stackless.ArrayConcurrentQueueAsyncTest_225
         * @tc.name ArrayConcurrentQueueAsync_Test_static_003
         * @tc.desc Multi-threaded operation. Thread A inserts data, and thread B takes out data.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("ArrayConcurrentQueueAsync_Test_static_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const totalCount: int = 100;
                const taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
                let queueInt: containers.stackless.ArrayConcurrentQueue<int> = new containers.stackless.ArrayConcurrentQueue<int>(totalCount);
                taskGroup.addTask(createPushTaskStart(queueInt, totalCount));
                taskGroup.addTask(createPopTaskStart(queueInt, totalCount));
                await taskpool.execute(taskGroup);
                expect(JSON.stringify(queueInt.size)).assertEqual('0');
                expect(queueInt.isEmpty()).assertTrue();
                done();
            })

        /**
         * @tc.number SUB_COMMONLIBRARY_ETSUTILS_containers.stackless.ArrayConcurrentQueueAsyncTest_226
         * @tc.name ArrayConcurrentQueueAsync_Test_static_004
         * @tc.desc Threads add elements simultaneously to verify the thread safety of the queue.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("ArrayConcurrentQueueAsync_Test_static_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
                let queueInt: containers.stackless.ArrayConcurrentQueue<int> = new containers.stackless.ArrayConcurrentQueue<int>(100);
                for (let i = 0; i < 10; i++) {
                    taskGroup.addTask(createPushTaskStartLoopTen(queueInt, i));
                }
                await taskpool.execute(taskGroup);
                expect(JSON.stringify(queueInt.size)).assertEqual('100');
                expect(queueInt.isEmpty()).assertFalse();
                done();
            })

        /**
         * @tc.number SUB_COMMONLIBRARY_ETSUTILS_containers.stackless.ArrayConcurrentQueueAsyncTest_227
         * @tc.name ArrayConcurrentQueueAsync_Test_static_005
         * @tc.desc Preset 1000 pieces of data, 10 threads remove elements at the same time, verify the thread safety of the queue
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("ArrayConcurrentQueueAsync_Test_static_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const totalCount: int = thousandTimes;
                const taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
                let queueInt: containers.stackless.ArrayConcurrentQueue<int> = new containers.stackless.ArrayConcurrentQueue<int>(totalCount);
                for (let i = 0; i < totalCount; i++) {
                    queueInt.add(i);
                }
                expect(JSON.stringify(queueInt.size)).assertEqual(JSON.stringify(totalCount));
                for (let i = 0; i < 10; i++) {
                    taskGroup.addTask(createPollTaskHundred(queueInt, i * hundredTimes));
                }
                await taskpool.execute(taskGroup);
                expect(JSON.stringify(queueInt.size)).assertEqual('0');
                expect(queueInt.isEmpty()).assertTrue();
                done();
            })

        /**
         * @tc.number SUB_COMMONLIBRARY_ETSUTILS_containers.stackless.ArrayConcurrentQueueAsyncTest_228
         * @tc.name ArrayConcurrentQueueAsync_Test_static_006
         * @tc.desc 10 threads at the same time: loop 1000 times, after add getFirst, isEmpty, get size, push, pop, remove, remainingCapacity combined call
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("ArrayConcurrentQueueAsync_Test_static_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const totalCount: int = thousandTimes;
                const taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
                let queueInt: containers.stackless.ArrayConcurrentQueue<int> = new containers.stackless.ArrayConcurrentQueue<int>(totalCount);
                for (let i = 0; i < totalCount; i++) {
                    queueInt.add(i);
                }
                expect(JSON.stringify(queueInt.size)).assertEqual(JSON.stringify(totalCount));
                for (let i = 0; i < 10; i++) {
                    taskGroup.addTask(createPollTaskHundred(queueInt, i * hundredTimes));
                }
                await taskpool.execute(taskGroup);
                expect(JSON.stringify(queueInt.remainingCapacity())).assertEqual(JSON.stringify(totalCount));
                expect(queueInt.size).assertEqual(0);
                expect(queueInt.getFirst()).assertEqual(undefined);
                expect(queueInt.isEmpty()).assertTrue();
                done();
            })

        /**
         * @tc.number SUB_COMMONLIBRARY_ETSUTILS_containers.stackless.ArrayConcurrentQueueAsyncTest_229
         * @tc.name ArrayConcurrentQueueAsync_Test_static_007
         * @tc.desc 10 thread A and 10 thread B. Each thread calls add(element) or poll() 1,000 times.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("ArrayConcurrentQueueAsync_Test_static_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const totalCount: int = thousandTimes;
                const taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
                const taskGroupPoll: taskpool.TaskGroup = new taskpool.TaskGroup();
                let queueInt: containers.stackless.ArrayConcurrentQueue<int> = new containers.stackless.ArrayConcurrentQueue<int>(totalCount);

                for (let i = 0; i < loopTenTimes; i++) {
                    taskGroup.addTask(createAddTaskHundred(queueInt, i * hundredTimes));
                }
                await taskpool.execute(taskGroup);
                expect(JSON.stringify(queueInt.size)).assertEqual(JSON.stringify(loopTenTimes * hundredTimes));
                for (let i = 0; i < loopTenTimes; i++) {
                    taskGroupPoll.addTask(createPollTaskHundred(queueInt, i * hundredTimes));
                }
                await taskpool.execute(taskGroupPoll);
                expect(JSON.stringify(queueInt.size)).assertEqual('0');
                done();
            })

        /**
         * @tc.number SUB_COMMONLIBRARY_ETSUTILS_containers.stackless.ArrayConcurrentQueueAsyncTest_230
         * @tc.name ArrayConcurrentQueueAsync_Test_static_008
         * @tc.desc 10 threads A and 10 threads B, each calling push (element) or pop () 1,000 times
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("ArrayConcurrentQueueAsync_Test_static_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const totalCount: int = thousandTimes;
                const taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
                const taskPopGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
                let queueInt: containers.stackless.ArrayConcurrentQueue<int> = new containers.stackless.ArrayConcurrentQueue<int>(totalCount);

                for (let i = 0; i < loopTenTimes; i++) {
                    taskGroup.addTask(createPushTaskHundred(queueInt, i * hundredTimes));
                }
                await taskpool.execute(taskGroup);
                expect(JSON.stringify(queueInt.size)).assertEqual(JSON.stringify(loopTenTimes * hundredTimes));
                for (let i = 0; i < loopTenTimes; i++) {
                    taskPopGroup.addTask(createPopTaskHundred(queueInt, i * hundredTimes));
                }
                await taskpool.execute(taskPopGroup);
                expect(JSON.stringify(queueInt.size)).assertEqual('0');
                done();
            })

        /**
         * @tc.number SUB_COMMON_LIBRARY_UTIL_BASE_containers.stackless.ArrayConcurrentQueueCONSTRUCTOR_WITH_SET_TEST_234
         * @tc.name ArrayConcurrentQueueConstructorWith_Test_static_003
         * @tc.desc Blocks until the queue has an element to take out
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("ArrayConcurrentQueueConstructorWith_Test_static_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const queue = new containers.stackless.ArrayConcurrentQueue<number>(10);
                let popCompleted = false;
                let popResult: number = 0;
                const popTask = new taskpool.Task(async () => {
                    popResult = await queue.pop();
                    popCompleted = true;
                });
                const pushTask = new taskpool.Task(async () => {
                    setTimeout(async () => {
                        await queue.push(42);
                    }, 5);
                });
                let p1 = taskpool.execute(popTask);
                let p2 = taskpool.execute(pushTask);
                await Promise.all([
                    p1, p2
                ]);
                expect(popCompleted).assertTrue();
                expect(String(popResult)).assertEqual('42');
                expect(String(queue.size)).assertEqual('0');
                done();
            });

    });
}