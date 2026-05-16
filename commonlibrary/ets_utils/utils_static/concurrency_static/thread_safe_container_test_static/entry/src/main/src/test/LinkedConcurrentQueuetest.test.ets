import { describe, it, expect, TestType, Size, Level, beforeEach, beforeAll } from '../../../hypium/index';
import Utils from './Util.test';

let domain: number = 0x0000;
let tag: string = 'testTag';

class TestClass {
}

function createAddTask(queueTemp: containers.stackless.LinkedConcurrentQueue<int>, data: int): taskpool.Task {
    return new taskpool.Task((queue: containers.stackless.LinkedConcurrentQueue<int>, v: int) => {
        queue.add(v);
    }, queueTemp, data);
}

function createPushTask(queueTemp: containers.stackless.LinkedConcurrentQueue<int>, data: int): taskpool.Task {
    return new taskpool.Task(async (queue: containers.stackless.LinkedConcurrentQueue<int>, v: int) => {
        await queue.push(v);
    }, queueTemp, data);
}

function createPushTaskStart(queueTemp: containers.stackless.LinkedConcurrentQueue<int>, start: int): taskpool.Task {
    return new taskpool.Task(async (queue: containers.stackless.LinkedConcurrentQueue<int>, s: int) => {
        for (let i: int = 0; i < s; i++) {
            await queue.push(i);
        }
    }, queueTemp, start);
}

function createPushTaskStartLoopTen(queueTemp: containers.stackless.LinkedConcurrentQueue<int>, start: int): taskpool.Task {
    return new taskpool.Task(async (queue: containers.stackless.LinkedConcurrentQueue<int>, s: int) => {
        for (let i: int = s; i < s + 10; i++) {
            await queue.push(i);
        }
    }, queueTemp, start);
}

function createPopTaskStart(queueTemp: containers.stackless.LinkedConcurrentQueue<int>, start: int): taskpool.Task {
    return new taskpool.Task(async (queue: containers.stackless.LinkedConcurrentQueue<int>, s: int) => {
        for (let i: int = 0; i < s; i++) {
            await queue.pop();
        }
    }, queueTemp, start);
}

function createPollTask(queueTemp: containers.stackless.LinkedConcurrentQueue<int>): taskpool.Task {
    return new taskpool.Task((queue: containers.stackless.LinkedConcurrentQueue<int>) => {
        queue.poll();
    }, queueTemp);
}

function createPollTaskHundred(queueTemp: containers.stackless.LinkedConcurrentQueue<int>, start: int): taskpool.Task {
    return new taskpool.Task((queue: containers.stackless.LinkedConcurrentQueue<int>, s: int) => {
        for (let i: int = s; i < s + hundredTimes; i++) {
            queue.poll();
        }
    }, queueTemp, start);
}

function createAddTaskHundred(queueTemp: containers.stackless.LinkedConcurrentQueue<int>, start: int): taskpool.Task {
    return new taskpool.Task((queue: containers.stackless.LinkedConcurrentQueue<int>, s: int) => {
        for (let i: int = s; i < s + hundredTimes; i++) {
            queue.add(i);
        }
    }, queueTemp, start);
}

function createPopTask(queueTemp: containers.stackless.LinkedConcurrentQueue<int>): taskpool.Task {
    return new taskpool.Task(async (queue: containers.stackless.LinkedConcurrentQueue<int>) => {
        await queue.pop();
    }, queueTemp);
}

function createPopTaskHundred(queueTemp: containers.stackless.LinkedConcurrentQueue<int>, start: int): taskpool.Task {
    return new taskpool.Task(async (queue: containers.stackless.LinkedConcurrentQueue<int>, s: int) => {
        for (let i: int = s; i < s + hundredTimes; i++) {
            await queue.pop();
        }
    }, queueTemp, start);
}

function createPushTaskHundred(queueTemp: containers.stackless.LinkedConcurrentQueue<int>, start: int): taskpool.Task {
    return new taskpool.Task(async (queue: containers.stackless.LinkedConcurrentQueue<int>, s: int) => {
        for (let i: int = s; i < s + hundredTimes; i++) {
            await queue.push(i);
        }
    }, queueTemp, start);
}

function createLinkedConcurrentQueueFromIterTask(iterTemp: IterableIterator<int>): taskpool.Task {
    return new taskpool.Task(async (iter: IterableIterator<int>): Promise<containers.stackless.LinkedConcurrentQueue<int>> => {
        return new containers.stackless.LinkedConcurrentQueue<int>(iter)
    }, iterTemp);
}

// The expected value is 100 and to prevent runtime timeout, change the value to 10.
const hundredTimes: int = 10;
// The expected value is 1000 and to prevent runtime timeout, change the value to 100.
const thousandTimes: int = 100;
// The expected value is 10 and to prevent runtime timeout, change the value to 2.
const loopTenTimes: int = 2;

class CustomClass1 {
    name: string;

    constructor(name: string) {
        this.name = name;
    }
}

interface IntegerType {
    MAX_VALUE: number
}

interface QueueItem {
    value?: number,
    flag?: boolean,
    type: string
};

interface objectValueType {
    key: string;
}

let Integer: IntegerType = {
    MAX_VALUE: 2147483647
};

export default function LinkedConcurrentQueuetest() {
    describe("linked_Concurrent_Queue_", (): void => {
        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueueNoParameterTest_0100
         * @tc.name linked_Concurrent_Queue_NoParameterTest_static_001
         * @tc.desc Test LinkedConcurrentQueue constructor with capacity 0.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_NoParameterTest_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
            try {
                let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(0);
                expect().assertFail();
            } catch (error) {
                expect(error instanceof Error).assertTrue();
            }
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueueIsEmptyTest_0101
         * @tc.name linked_Concurrent_Queue_IsEmptyTest
         * @tc.desc Test isEmpty() on newly created empty queue.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_IsEmptyTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
            let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>();
            let res = queueIntPop1.isEmpty();
            expect(res).assertEqual(true);
            expect(queueIntPop1.capacity).assertEqual(Int.MAX_VALUE);
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueueIsNoEmptyTest_0102
         * @tc.name linked_Concurrent_Queue_IsNoEmptyTest
         * @tc.desc Test isEmpty() on queue with capacity but no elements.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_IsNoEmptyTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
            let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(66);
            let res = queueIntPop1.isEmpty();
            expect(String(res)).assertEqual('true');
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueueAddIsOrEmptyTest_0103
         * @tc.name linked_Concurrent_Queue_AddIsOrEmptyTest
         * @tc.desc Test isEmpty() after adding element to queue.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_AddIsOrEmptyTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
            let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>();
            queueIntPop1.add(1);
            let res = queueIntPop1.isEmpty();
            expect(String(res)).assertEqual('false');
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueueRemoveIsOrEmptyTest_0104
         * @tc.name linked_Concurrent_Queue_RemoveIsOrEmptyTest
         * @tc.desc Test isEmpty() after polling from queue.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_RemoveIsOrEmptyTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
            let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(1);
            queueIntPop1.poll();
            let res = queueIntPop1.isEmpty();
            expect(String(res)).assertEqual('true');
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueuePushIsOrEmptyTest_0105
         * @tc.name linked_Concurrent_Queue_PushIsOrEmptyTest
         * @tc.desc Test isEmpty() after pushing multiple elements.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_PushIsOrEmptyTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>();
            for (let i: int = 0; i < 10; i++) {
                await queueIntPop1.push(i);
            }
            let res = queueIntPop1.isEmpty();
            expect(String(res)).assertEqual('false');
            done();
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueuePopIsOrEmptyTest_0106
         * @tc.name linked_Concurrent_Queue_PopIsOrEmptyTest
         * @tc.desc Test isEmpty() after popping element from queue.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_PopIsOrEmptyTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(1);
            await queueIntPop1.push(1);
            let res = await queueIntPop1.pop();
            expect(String(res)).assertEqual('1');
            let res1 = queueIntPop1.isEmpty();
            expect(String(res1)).assertEqual('true');
            done();
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueueGetSizeFullQueueTest_0107
         * @tc.name linked_Concurrent_Queue_GetSizeFullQueueTest
         * @tc.desc Test size() on full queue with 10 elements.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_GetSizeFullQueueTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>();
            for (let i: int = 0; i < 10; i++) {
                await queueIntPop1.push(i);
            }
            let res = queueIntPop1.size;
            expect(String(res)).assertEqual('10');
            done();
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueueGetSizeNullQueueAddTest_0108
         * @tc.name linked_Concurrent_Queue_GetSizeNullQueueAddTest
         * @tc.desc Test remainingCapacity() on newly created queue with capacity 10.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_GetSizeNullQueueAddTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
            let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>();
            let result = queueIntPop1.add(1);
            expect(result).assertTrue();
            let res = queueIntPop1.size;
            expect(res).assertEqual(1);
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueueGetSizeNullQueueRemoveTest_0109
         * @tc.name linked_Concurrent_Queue_GetSizeNullQueueRemoveTest
         * @tc.desc Verify the size of empty queue after poll operation should be 0.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_GetSizeNullQueueRemoveTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            (): void => {
                let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>();
                queueIntPop1.poll();
                let res = queueIntPop1.size;
                expect(String(res)).assertEqual('0');
            })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueueGetSizeNullQueuePushTest_0110
         * @tc.name linked_Concurrent_Queue_GetSizeNullQueuePushTest
         * @tc.desc Verify the size of queue after pushing one element should be 1.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_GetSizeNullQueuePushTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>();
            await queueIntPop1.push(1);
            let res = queueIntPop1.size;
            expect(String(res)).assertEqual('1');
            done();
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueueGetSizeNullQueuePopTest_0111
         * @tc.name linked_Concurrent_Queue_GetSizeNullQueuePopTest
         * @tc.desc Verify the size of queue after pushing 10 elements and popping one should be 9.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_GetSizeNullQueuePopTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>();
            for (let i: int = 0; i < 10; i++) {
                await queueIntPop1.push(i);
            }
            await queueIntPop1.pop();
            let res = queueIntPop1.size;
            expect(String(res)).assertEqual('9');
            done();
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueueGetSizeQueuePopAddTest_0112
         * @tc.name linked_Concurrent_Queue_GetSizeQueuePopAddTest
         * @tc.desc Verify that when a value is pushed into a queue with a capacity of 1, the size of the queue is 1.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_GetSizeQueuePopAddTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(1);
            await queueIntPop1.push(1);
            let res = queueIntPop1.size;
            expect(String(res)).assertEqual('1');
            done();
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueueRemainingCapacityFullQueuePopTest_0113
         * @tc.name linked_Concurrent_Queue_RemainingCapacityFullQueuePopTest
         * @tc.desc Verify that the remaining capacity of a newly created queue with a capacity of 10 is 10.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_RemainingCapacityFullQueuePopTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            (): void => {
                let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(10);
                let res = queueIntPop1.remainingCapacity();
                expect(String(res)).assertEqual('10');
            })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueueRemainingCapacityNullQueuePopTest_0115
         * @tc.name linked_Concurrent_Queue_RemainingCapacityNullQueuePopTest
         * @tc.desc Verify that the remaining capacity of a queue with a capacity of 50 is 50 and its size is 0.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_RemainingCapacityNullQueuePopTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            (): void => {
                let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(50);
                let res = queueIntPop1.remainingCapacity();
                let res1 = queueIntPop1.size;
                expect(String(res)).assertEqual('50');
                expect(String(res1)).assertEqual('0');
            })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueueRemainingCapacityNullQueuePopTest_0116
         * @tc.name linked_Concurrent_Queue_RemainingCapacityNullQueuePopTest001
         * @tc.desc Verify that the remaining capacity and capacity of a queue with a capacity of 1 are both 1.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_RemainingCapacityNullQueuePopTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            (): void => {
                let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(1);
                let res = queueIntPop1.remainingCapacity();
                let res1 = queueIntPop1.capacity;
                expect(String(res)).assertEqual('1');
                expect(String(res1)).assertEqual('1');
            })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueueRemainingCapacityNullQueuePopTest_0117
         * @tc.name linked_Concurrent_Queue_RemainingCapacityNullQueuePopTest01
         * @tc.desc Verify that the remaining capacity of a queue with a capacity.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_RemainingCapacityNullQueuePopTest01", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            (): void => {
                let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(1);
                let res = queueIntPop1.remainingCapacity();
                let res1 = queueIntPop1.size;
                expect(String(res)).assertEqual('1');
                expect(String(res1)).assertEqual('0');
                queueIntPop1.poll();
                expect(String(queueIntPop1.size)).assertEqual('0');
            })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueueRemainingCapacityNullQueuePopTest_0118
         * @tc.name linked_Concurrent_Queue_RemainingCapacityNullQueuePopTest0001
         * @tc.desc Verify that for a queue with an initial capacity.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_RemainingCapacityNullQueuePopTest0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(2);
                for (let i: int = 0; i < 2; i++) {
                    await queueIntPop1.push(i);
                }
                await queueIntPop1.pop();
                let res = queueIntPop1.remainingCapacity();
                let res1 = queueIntPop1.capacity;
                expect(String(res)).assertEqual('1');
                expect(String(res1)).assertEqual('2');
                done();
            })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueueGetCapacityTest_0121
         * @tc.name linked_Concurrent_Queue_GetCapacityTest_static_002
         * @tc.desc Verify the capacity behavior of a queue initialized with 5 during poll and add operations.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_GetCapacityTest_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
            let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(5);
            let res1 = queueIntPop1.capacity;
            expect(String(res1)).assertEqual('5');
            queueIntPop1.poll();
            let res = queueIntPop1.capacity;
            expect(String(res)).assertEqual('5');
            queueIntPop1.add(0);
            let res2 = queueIntPop1.capacity;
            expect(String(res2)).assertEqual('5');
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueueGetCapacityTest_0122
         * @tc.name linked_Concurrent_Queue_GetCapacityTest_static_003
         * @tc.desc Verify the capacity behavior of a queue initialized with 0.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_GetCapacityTest_static_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(1);
            let res1 = queueIntPop1.capacity;
            expect(String(res1)).assertEqual('1');
            await queueIntPop1.push(1);
            let res = queueIntPop1.capacity;
            expect(String(res)).assertEqual('1');
            await queueIntPop1.pop();
            let res2 = queueIntPop1.capacity;
            expect(String(res2)).assertEqual('1');
            done();
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueueGetCapacityTest_0123
         * @tc.name linked_Concurrent_Queue_GetCapacityTest_static_004
         * @tc.desc Verify the capacity behavior of a queue initialized with 3 during poll and add operations.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_GetCapacityTest_static_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
            let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(3);
            let res1 = queueIntPop1.capacity;
            expect(String(res1)).assertEqual('3');
            queueIntPop1.poll();
            let res = queueIntPop1.capacity;
            expect(String(res)).assertEqual('3');
            queueIntPop1.add(0);
            let res2 = queueIntPop1.capacity;
            expect(String(res2)).assertEqual('3');
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueueGetCapacityTest_0124
         * @tc.name linked_Concurrent_Queue_GetCapacityTest_static_005
         * @tc.desc Verify capacity remains 1 after push/pop operations on queue with initial capacity 1.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_GetCapacityTest_static_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(1);
            let res1 = queueIntPop1.capacity;
            expect(String(res1)).assertEqual('1');
            await queueIntPop1.push(1);
            let res = queueIntPop1.capacity;
            expect(String(res)).assertEqual('1');
            await queueIntPop1.pop();
            let res2 = queueIntPop1.capacity;
            expect(String(res2)).assertEqual('1');
            done();
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueueGetCapacityTest_0125
         * @tc.name linked_Concurrent_Queue_GetCapacityTest_static_006
         * @tc.desc Verify capacity remains 1 after poll/add operations on queue with initial capacity 1.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_GetCapacityTest_static_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
            let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(1);
            let res1 = queueIntPop1.capacity;
            expect(String(res1)).assertEqual('1');
            queueIntPop1.poll();
            let res = queueIntPop1.capacity;
            expect(String(res)).assertEqual('1');
            queueIntPop1.add(1);
            let res2 = queueIntPop1.capacity;
            expect(String(res2)).assertEqual('1');
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueueGetCapacityTest_00126
         * @tc.name linked_Concurrent_Queue_GetCapacityTest_static_007
         * @tc.desc Verify capacity equals Int.MAX_VALUE after push/pop operations on max capacity queue.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_GetCapacityTest_static_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(Int.MAX_VALUE);
            let res1 = queueIntPop1.capacity;
            expect(res1).assertEqual(Int.MAX_VALUE);
            await queueIntPop1.push(1);
            let res = queueIntPop1.capacity;
            expect(res).assertEqual(Int.MAX_VALUE);
            await queueIntPop1.pop();
            let res2 = queueIntPop1.capacity;
            expect(res2).assertEqual(Int.MAX_VALUE);
            done();
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueueGetCapacityTest_0001260
         * @tc.name linked_Concurrent_Queue_GetCapacityTest_static_008
         * @tc.desc Verify capacity equals Int.MAX_VALUE after add/poll operations on max capacity queue.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_GetCapacityTest_static_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
            let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(Int.MAX_VALUE);
            let res1 = queueIntPop1.capacity;
            expect(res1).assertEqual(Int.MAX_VALUE);

            queueIntPop1.poll();
            let res = queueIntPop1.capacity;
            expect(res).assertEqual(Int.MAX_VALUE);

            queueIntPop1.add(1);
            let res2 = queueIntPop1.capacity;
            expect(res2).assertEqual(Int.MAX_VALUE);
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueueGetCapacityTest_0126
         * @tc.name linked_Concurrent_Queue_GetCapacityTest_static_009
         * @tc.desc Verify capacity equals Int.MAX_VALUE after push/pop operations on max capacity queue.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_GetCapacityTest_static_009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(Int.MAX_VALUE);
            let res1 = queueIntPop1.capacity;
            expect(res1).assertEqual(Int.MAX_VALUE);

            await queueIntPop1.push(1);
            let res = queueIntPop1.capacity;
            expect(res).assertEqual(Int.MAX_VALUE);

            await queueIntPop1.pop();
            let res2 = queueIntPop1.capacity;
            expect(res2).assertEqual(Int.MAX_VALUE);
            done();
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueueGetCapacityTest_000126
         * @tc.name linkedConcurrentQueueGetCapacityTest_000126
         * @tc.desc Verify capacity equals Int.MAX_VALUE after poll/add operations on max capacity queue.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linkedConcurrentQueueGetCapacityTest_000126", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
            let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(Int.MAX_VALUE);
            let res1 = queueIntPop1.capacity;
            expect(res1).assertEqual(Int.MAX_VALUE);

            queueIntPop1.poll();
            let res = queueIntPop1.capacity;
            expect(res).assertEqual(Int.MAX_VALUE);

            queueIntPop1.add(1);
            let res2 = queueIntPop1.capacity;
            expect(res2).assertEqual(Int.MAX_VALUE);
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueueTest_0127
         * @tc.name linked_Concurrent_Queue_Test_static_001
         * @tc.desc Verify getFirst() returns correct first element after pushing 10 elements.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_Test_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(10);
            for (let i: int = 0; i < 10; i++) {
                await queueIntPop1.push(i);
            }
            let res = queueIntPop1.getFirst();
            expect(String(res)).assertEqual('0');
            done();
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueueTest_0128
         * @tc.name linked_Concurrent_Queue_Test_static_002
         * @tc.desc Verify getFirst() returns empty string when adding empty string to queue.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_Test_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
            let queueIntPop1 = new containers.stackless.LinkedConcurrentQueue<int | string>(1);
            queueIntPop1.add("");
            let res = queueIntPop1.getFirst();
            expect(String(res)).assertEqual("");
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueueTest_0129
         * @tc.name linked_Concurrent_Queue_Test_static_003
         * @tc.desc Verify getFirst() returns the string marker when adding a non-null placeholder.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_Test_static_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
            let queueIntPop1 = new containers.stackless.LinkedConcurrentQueue<string>(1);
            queueIntPop1.add('null');
            let res = queueIntPop1.getFirst();
            expect(String(res)).assertEqual('null');
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueueTest_0130
         * @tc.name linked_Concurrent_Queue_Test_static_004
         * @tc.desc Verify getFirst() returns the string marker when adding a non-null placeholder.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_Test_static_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
            let queueIntPop1 = new containers.stackless.LinkedConcurrentQueue<string>(1);
            queueIntPop1.add('undefined');
            let res = queueIntPop1.getFirst();
            expect(res).assertEqual('undefined');
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueueTest_0131
         * @tc.name linked_Concurrent_Queue_Test_static_005
         * @tc.desc Verify getFirst() returns null when called on empty queue.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_Test_static_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
            let queueIntPop1 = new containers.stackless.LinkedConcurrentQueue<int>();
            let res = queueIntPop1.getFirst();
            expect(res).assertEqual(undefined);
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueueTest_0132
         * @tc.name linked_Concurrent_Queue_Test_static_006
         * @tc.desc Verify getFirst() returns 0 after pushing single element to capacity-1 queue.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_Test_static_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let queueIntPop1 = new containers.stackless.LinkedConcurrentQueue<int>(1);
            await queueIntPop1.push(0);
            let res = queueIntPop1.getFirst();
            expect(String(res)).assertEqual('0');
            done();
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueueTest_0133
         * @tc.name linked_Concurrent_Queue_Test_static_007
         * @tc.desc Verify getFirst() returns correct element after pop operation on full queue.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_Test_static_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(10);
            for (let i: int = 0; i < 10; i++) {
                await queueIntPop1.push(i);
            }
            await queueIntPop1.pop();
            let res = queueIntPop1.getFirst();
            expect(String(res)).assertEqual('1');
            done();
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueueTest_0134
         * @tc.name linked_Concurrent_Queue_Test_static_008
         * @tc.desc Verify poll() reduces size to 9 after removing one element from full queue.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_Test_static_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(10);
            for (let i: int = 0; i < 10; i++) {
                await queueIntPop1.push(i);
            }
            let res = queueIntPop1.poll();
            expect(res).assertEqual(0);
            let res1 = queueIntPop1.size;
            expect(res1).assertEqual(9);
            done();
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueueTest_0135
         * @tc.name linked_Concurrent_Queue_Test_static_009
         * @tc.desc Verify poll() returns null when called on empty queue.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_Test_static_009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
            let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>();
            let res = queueIntPop1.poll();
            expect(res).assertUndefined();
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueueTest_0136
         * @tc.name linked_Concurrent_Queue_Test_static_010
         * @tc.desc Verify poll() returns empty string when removing the only element (empty string) from queue.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_Test_static_010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
            let queueIntPop1 = new containers.stackless.LinkedConcurrentQueue<int | string>(1);
            queueIntPop1.add("");
            let res = queueIntPop1.poll();
            expect(String(res)).assertEqual("");
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueueTest_0137
         * @tc.name linked_Concurrent_Queue_Test_static_011
         * @tc.desc Verify poll() returns the string marker when removing the only placeholder element.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_Test_static_011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
            let queueIntPop1 = new containers.stackless.LinkedConcurrentQueue<string>(1);
            queueIntPop1.add('null');
            let res = queueIntPop1.poll();
            expect(String(res)).assertEqual('null');
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueueTest_0138
         * @tc.name linked_Concurrent_Queue_Test_static_012
         * @tc.desc Verify poll() returns the string marker when removing the only placeholder element.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_Test_static_012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
            let queueIntPop1 = new containers.stackless.LinkedConcurrentQueue<string>(1);
            queueIntPop1.add('undefined');
            let res = queueIntPop1.poll();
            expect(String(res)).assertEqual('undefined');
        })


        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueueTest_00139
         * @tc.name linked_Concurrent_Queue_Test_static_014
         * @tc.desc Verify queue size becomes 0 after add-poll sequence on capacity-1 queue.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_Test_static_014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
            let queueIntPop1 = new containers.stackless.LinkedConcurrentQueue<int>(1);
            queueIntPop1.add(0);
            queueIntPop1.poll();
            let res = queueIntPop1.size;
            expect(String(res)).assertEqual('0');
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueueTest_0140
         * @tc.name linked_Concurrent_Queue_Test_static_015
         * @tc.desc Verify queue size becomes 0 after push-pop sequence on under-capacity queue (capacity-1).
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_Test_static_015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(2);
            await queueIntPop1.push(0);
            await queueIntPop1.pop();
            let res1 = queueIntPop1.size;
            expect(String(res1)).assertEqual('0');
            done();
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueueTest_0141
         * @tc.name linked_Concurrent_Queue_Test_static_016
         * @tc.desc Verify add() returns false when attempting to exceed queue capacity (full queue scenario).
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_Test_static_016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(10);
            for (let i: int = 0; i < 10; i++) {
                await queueIntPop1.push(i);
            }
            let res1 = queueIntPop1.add(11);
            expect(res1).assertEqual(false);
            done();
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueueTest_0142
         * @tc.name linked_Concurrent_Queue_Test_static_017
         * @tc.desc Verify queue reaches full capacity (size=10) after adding mixed int|string elements
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_Test_static_017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let queueIntPop1 = new containers.stackless.LinkedConcurrentQueue<int | string>(10);
            for (let i: int = 0; i < 9; i++) {
                await queueIntPop1.push(i);
            }
            queueIntPop1.add("");
            let res1 = queueIntPop1.size;
            expect(String(res1)).assertEqual('10');
            done();
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueueTest_0143
         * @tc.name linked_Concurrent_Queue_Test_static_018
         * @tc.desc Verify queue accepts a placeholder string and reaches full capacity (size=10)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_Test_static_018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let queueIntPop1 = new containers.stackless.LinkedConcurrentQueue<int | string>(10);
            for (let i: int = 0; i < 9; i++) {
                await queueIntPop1.push(i);
            }
            queueIntPop1.add('null');
            let res1 = queueIntPop1.size;
            expect(String(res1)).assertEqual('10');
            done();
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueueTest_0144
         * @tc.name linked_Concurrent_Queue_Test_static_019
         * @tc.desc Verify queue accepts a placeholder string and reaches full capacity (size=10)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_Test_static_019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let queueIntPop1 = new containers.stackless.LinkedConcurrentQueue<int | string>(10);
            for (let i: int = 0; i < 9; i++) {
                await queueIntPop1.push(i);
            }
            queueIntPop1.add('undefined');
            let res1 = queueIntPop1.size;
            expect(String(res1)).assertEqual('10');
            done();
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueueTest_0145
         * @tc.name linked_Concurrent_Queue_Test_static_020
         * @tc.desc Verify standard integer element addition makes queue reach full capacity (size=10)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_Test_static_020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(10);
            for (let i: int = 0; i < 9; i++) {
                await queueIntPop1.push(i);
            }
            queueIntPop1.add(10);
            let res1 = queueIntPop1.size;
            expect(String(res1)).assertEqual('10');
            done();
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueueTest_0146
         * @tc.name linked_Concurrent_Queue_Test_static_021
         * @tc.desc Verify string element addition makes queue reach full capacity with mixed int|string elements
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_Test_static_021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let queueIntPop1 = new containers.stackless.LinkedConcurrentQueue<int | string>(10);
            for (let i: int = 0; i < 9; i++) {
                await queueIntPop1.push(i);
            }
            queueIntPop1.add("hello");
            let res1 = queueIntPop1.size;
            expect(String(res1)).assertEqual('10');
            done();
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueueTest_0147
         * @tc.name linked_Concurrent_Queue_Test_static_022
         * @tc.desc Verify bigint element addition makes queue reach full capacity with mixed int|bigint elements
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_Test_static_022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let queueIntPop1 = new containers.stackless.LinkedConcurrentQueue<int | bigint>(10);
            for (let i: int = 0; i < 9; i++) {
                await queueIntPop1.push(i);
            }
            let big1: bigint = 123456789012345678901234567890n;
            queueIntPop1.add(big1);
            let res1 = queueIntPop1.size;
            expect(String(res1)).assertEqual('10');
            done();
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueueTest_0148
         * @tc.name linked_Concurrent_Queue_Test_static_023
         * @tc.desc Verify boolean element addition makes queue reach full capacity (size=10) with mixed int|boolean elements
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_Test_static_023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let queueIntPop1 = new containers.stackless.LinkedConcurrentQueue<int | boolean>(10);
            for (let i: int = 0; i < 9; i++) {
                await queueIntPop1.push(i);
            }
            queueIntPop1.add(true);
            let res1 = queueIntPop1.size;
            expect(String(res1)).assertEqual('10');
            done();
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueueTest_0149
         * @tc.name linked_Concurrent_Queue_Test_static_024
         * @tc.desc Verify custom class instance can be added and retrieved from generic queue
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_Test_static_024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let queue: containers.stackless.LinkedConcurrentQueue<TestClass> = new containers.stackless.LinkedConcurrentQueue<TestClass>();
            const obj = new TestClass();
            queue.add(obj);
            expect(await queue.pop()).assertEqual(obj);
            done();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueueTest_0150
         * @tc.name linked_Concurrent_Queue_Test_static_025
         * @tc.desc Verify array element addition maintains correct queue size (size=1) with array<int> element
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_Test_static_025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
            let queueIntPop1 = new containers.stackless.LinkedConcurrentQueue<int | Array<int>>(10);
            let arr = new Array<int>(10, (i: int) => i);
            queueIntPop1.add(arr);
            let res1 = queueIntPop1.size;
            expect(String(res1)).assertEqual('1');
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueueTest_0151
         * @tc.name linked_Concurrent_Queue_Test_static_026
         * @tc.desc Verify complex object addition makes queue reach full capacity (size=10) with mixed property objects
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_Test_static_026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let queueObjPop1: containers.stackless.LinkedConcurrentQueue<QueueItem> = new containers.stackless.LinkedConcurrentQueue<QueueItem>(10);

            for (let i: int = 0; i < 9; i++) {
                await queueObjPop1.push({
                    value: i, type: "number"
                });
            }
            queueObjPop1.add({
                flag: true, type: "boolean"
            });
            let res1 = queueObjPop1.size;
            expect(String(res1)).assertEqual('10');
            done();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueueTest_0152
         * @tc.name linked_Concurrent_Queue_Test_static_027
         * @tc.desc Verify single element addition in default-sized queue updates size correctly (size=1)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_Test_static_027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
            let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>();
            queueIntPop1.add(0);
            let res1 = queueIntPop1.size;
            expect(String(res1)).assertEqual('1');
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueueTest_0153
         * @tc.name linked_Concurrent_Queue_Test_static_028
         * @tc.desc Verify fixed-capacity queue (capacity=2) reaches full size with push+add operations
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_Test_static_028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(2);
            await queueIntPop1.push(0);
            queueIntPop1.add(1);
            let res1 = queueIntPop1.size;
            expect(String(res1)).assertEqual('2');
            done();
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueueTest_0154
         * @tc.name linked_Concurrent_Queue_Test_static_029
         * @tc.desc Verify element removal reduces queue size correctly (size=8) after initial 9 elements
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_Test_static_029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(10);
            for (let i: int = 0; i < 9; i++) {
                await queueIntPop1.push(i);
            }
            await queueIntPop1.pop();
            let res1 = queueIntPop1.size;
            expect(String(res1)).assertEqual('8');
            done();
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueueTest_00154
         * @tc.name linked_Concurrent_Queue_Test_static_030
         * @tc.desc Create a task to operate on a LinkedConcurrentQueue.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_Test_static_030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let queueInt: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>();
            let t = new taskpool.Task(async (queueIntTemp: containers.stackless.LinkedConcurrentQueue<int>) => {
                for (let i: int = 0; i < 10; i++) {
                    await queueInt.push(i);
                }
            }, queueInt);
            await taskpool.execute(t);
            expect(String(queueInt.size)).assertEqual('10');
            await queueInt.push(10);
            expect(String(queueInt.size)).assertEqual('11');
            done();
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueueTest_0155
         * @tc.name linked_Concurrent_Queue_Test_static_031
         * @tc.desc Verify string element removal results in empty queue (size=0)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_Test_static_031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let queueIntPop1 = new containers.stackless.LinkedConcurrentQueue<int | string>(10);
            await queueIntPop1.push("");
            await queueIntPop1.pop();
            let res1 = queueIntPop1.size;
            expect(String(res1)).assertEqual('0');
            done();
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueueTest_0156
         * @tc.name linked_Concurrent_Queue_Test_static_032
         * @tc.desc Verify placeholder string removal results in empty queue (size=0)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_Test_static_032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let queueIntPop1 = new containers.stackless.LinkedConcurrentQueue<string>(10);
            await queueIntPop1.push('null');
            await queueIntPop1.pop();
            let res1 = queueIntPop1.size;
            expect(String(res1)).assertEqual('0');
            done();
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueueTest_0157
         * @tc.name linked_Concurrent_Queue_Test_static_033
         * @tc.desc Verify placeholder string removal results in empty queue (size=0)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_Test_static_033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let queueIntPop1 = new containers.stackless.LinkedConcurrentQueue<string>(10);
            await queueIntPop1.push('undefined');
            await queueIntPop1.pop();
            let res1 = queueIntPop1.size;
            expect(String(res1)).assertEqual('0');
            done();
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueueTest_0158
         * @tc.name linked_Concurrent_Queue_Test_static_034
         * @tc.desc Verify single element queue becomes empty after pop operation (size=0)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_Test_static_034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let queueIntPop1 = new containers.stackless.LinkedConcurrentQueue<int>(1);
            await queueIntPop1.push(0);
            await queueIntPop1.pop();
            let res1 = queueIntPop1.size;
            expect(String(res1)).assertEqual('0');
            done();
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueueTest_0159
         * @tc.name linked_Concurrent_Queue_Test_static_035
         * @tc.desc Verify under-capacity operation maintains correct size (capacity=2, size=0)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_Test_static_035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(2);
            await queueIntPop1.push(0);
            await queueIntPop1.pop();
            let res1 = queueIntPop1.size;
            expect(String(res1)).assertEqual('0');
            done();
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueueTest_0160
         * @tc.name linked_Concurrent_Queue_Test_static_036
         * @tc.desc Verify under-capacity operation maintains correct size
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_Test_static_036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(10);
            for (let i: int = 0; i < 10; i++) {
                await queueIntPop1.push(i);
            }
            await queueIntPop1.pop();
            let res1 = queueIntPop1.size;
            expect(String(res1)).assertEqual('9');
            done();
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueueTest_0161
         * @tc.name linked_Concurrent_Queue_Test_static_037
         * @tc.desc Verify under-capacity operation maintains correct size
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_Test_static_037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(10);
            for (let i: int = 0; i < 10; i++) {
                await queueIntPop1.push(i);
            }
            for (let i: int = 0; i < 9; i++) {
                await queueIntPop1.pop();
            }
            let res1 = queueIntPop1.size;
            expect(String(res1)).assertEqual('1');
            done();
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedConcurrentQueueTest_0162
         * @tc.name linked_Concurrent_Queue_Test_static_038
         * @tc.desc Verify under-capacity operation maintains correct size
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_Test_static_038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(10);
            for (let i: int = 0; i < 10; i++) {
                await queueIntPop1.push(i);
            }
            for (let i: int = 0; i < 10; i++) {
                await queueIntPop1.pop();
            }
            let res1 = queueIntPop1.size;
            expect(String(res1)).assertEqual('0');
            done();
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedConcurrentQueueNoParameterTest_0163
         * @tc.name linked_Concurrent_Queue_NoParameterTest_static_0001
         * @tc.desc Test LinkedConcurrentQueue constructor with capacity 0.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_NoParameterTest_static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {

            let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>();
            let res = queueIntPop1.size;
            expect(String(res)).assertEqual('0');
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedConcurrentQueueNoParameterTest_0164
         * @tc.name linked_Concurrent_Queue_NoParameterTest_static_002
         * @tc.desc Test adding single element to empty LinkedConcurrentQueue.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_NoParameterTest_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
            let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>();
            queueIntPop1.add(1);
            let res = queueIntPop1.size;
            expect(String(res)).assertEqual('1');
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedConcurrentQueueNoParameterTest_0165
         * @tc.name linked_Concurrent_Queue_NoParameterTest_static_005
         * @tc.desc Test LinkedConcurrentQueue constructor with empty array iterable and capacity 0.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_NoParameterTest_static_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
            let arr = new Array<int>();
            let iter = arr.values();
            let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(10, iter)
            let res = queueIntPop1.capacity;
            expect(String(res)).assertEqual('10');
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedConcurrentQueueNoParameterTest_0166
         * @tc.name linked_Concurrent_Queue_NoParameterTest_static_006
         * @tc.desc Test LinkedConcurrentQueue constructor with empty array iterable.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_NoParameterTest_static_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
            let arr = new Array<int>();
            let iter = arr.values();
            let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(iter);
            let res = queueIntPop1.size;
            expect(String(res)).assertEqual('0');
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedConcurrentQueueNoParameterTest_0167
         * @tc.name linked_Concurrent_Queue_NoParameterTest_static_007
         * @tc.desc Test isEmpty() with empty LinkedConcurrentQueue.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_NoParameterTest_static_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
            let arr = new Array<int>();
            let iter = arr.values();
            let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(iter);
            let res = queueIntPop1.isEmpty();
            expect(res).assertEqual(true);
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedConcurrentQueueNoParameterTest_0168
         * @tc.name linked_Concurrent_Queue_NoParameterTest_static_008
         * @tc.desc Test LinkedConcurrentQueue constructor with empty Set iterable and capacity 0.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_NoParameterTest_static_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
            let emptySet = new Set<int>();
            let iter = emptySet.values();
            let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(10, iter)
            let res = queueIntPop1.capacity;
            expect(String(res)).assertEqual(`10`);
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedConcurrentQueueNoParameterTest_0169
         * @tc.name linked_Concurrent_Queue_NoParameterTest_static_009
         * @tc.desc Test LinkedConcurrentQueue constructor with single-element array iterable and capacity 0.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_NoParameterTest_static_009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
            let emptySet = new Set<int>();
            let iter = emptySet.values();
            let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(iter);
            let res = queueIntPop1.size;
            expect(String(res)).assertEqual('0');
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedConcurrentQueueNoParameterTest_0170
         * @tc.name linked_Concurrent_Queue_NoParameterTest_static_010
         * @tc.desc Test LinkedConcurrentQueue constructor with single-element array iterable
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_NoParameterTest_static_010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
            let emptySet = new Set<int>();
            let iter = emptySet.values();
            let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(iter);
            let res = queueIntPop1.isEmpty();
            expect(String(res)).assertEqual('true');
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedConcurrentQueueNoParameterTest_0171
         * @tc.name linked_Concurrent_Queue_NoParameterTest_static_011
         * @tc.desc Test LinkedConcurrentQueue constructor with single-element array iterable
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_NoParameterTest_static_011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
            let arr = new Array<int>(1, (i) => 0);
            let iter = arr.values();
            let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(10, iter)
            let res = queueIntPop1.capacity;
            expect(String(res)).assertEqual('10');
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedConcurrentQueueNoParameterTest_0172
         * @tc.name linked_Concurrent_Queue_NoParameterTest_static_012
         * @tc.desc Test LinkedConcurrentQueue constructor with single-element array iterable
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_NoParameterTest_static_012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
            let arr = new Array<int>(1, (i) => 0);
            let iter = arr.values();
            let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(iter);
            let res = queueIntPop1.size;
            expect(String(res)).assertEqual('1');
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedConcurrentQueueNoParameterTest_0173
         * @tc.name linked_Concurrent_Queue_NoParameterTest_static_013
         * @tc.desc Test LinkedConcurrentQueue constructor with single-element array iterable
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_NoParameterTest_static_013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
            let arr = new Array<int>(1, (i) => 0);
            let iter = arr.values();
            let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(iter);
            let res = queueIntPop1.isEmpty();
            expect(res).assertEqual(false);
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedConcurrentQueueNoParameterTest_0174
         * @tc.name linked_Concurrent_Queue_NoParameterTest_static_014
         * @tc.desc Test getFirst() with single-element LinkedConcurrentQueue.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_NoParameterTest_static_014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
            let arr = new Array<int>(1, (i) => 0);
            let iter = arr.values();
            let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(iter);
            let res = queueIntPop1.getFirst();
            expect(String(res)).assertEqual('0');
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedConcurrentQueueNoParameterTest_0175
         * @tc.name linked_Concurrent_Queue_NoParameterTest_static_015
         * @tc.desc Test poll() removes element from single-element LinkedConcurrentQueue.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_NoParameterTest_static_015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
            let arr = new Array<int>(1, (i) => 0);
            let iter = arr.values();
            let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(iter);
            queueIntPop1.poll();
            let res = queueIntPop1.isEmpty();
            expect(String(res)).assertEqual('true');
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedConcurrentQueueNoParameterTest_0176
         * @tc.name linked_Concurrent_Queue_NoParameterTest_static_016
         * @tc.desc Test LinkedConcurrentQueue constructor with 1000-element array iterable and capacity 0.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_NoParameterTest_static_016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
            let arr = new Array<int>(1000, (i: int) => i);
            let iter = arr.values();
            let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(1000, iter)
            let res = queueIntPop1.capacity;
            expect(String(res)).assertEqual('1000');
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedConcurrentQueueNoParameterTest_0177
         * @tc.name linked_Concurrent_Queue_NoParameterTest_static_017
         * @tc.desc Test LinkedConcurrentQueue constructor with 1000-element array iterable and capacity 0.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_NoParameterTest_static_017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
            let arr = new Array<int>(1000, (i: int) => i);
            let iter = arr.values();
            let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(iter);
            let res = queueIntPop1.size;
            expect(String(res)).assertEqual('1000');
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedConcurrentQueueNoParameterTest_0178
         * @tc.name linked_Concurrent_Queue_NoParameterTest_static_018
         * @tc.desc Test LinkedConcurrentQueue constructor with array iterable and capacity 0.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_NoParameterTest_static_018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
            let arr = new Array<string>();
            let queueIntPop1 = new containers.stackless.LinkedConcurrentQueue<string>(arr);
            let res = queueIntPop1.size;
            expect(String(res)).assertEqual('0');
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedConcurrentQueueNoParameterUndefinedTest_0180
         * @tc.name linked_Concurrent_Queue_NoParameterUndefinedTest_static_018
         * @tc.desc Test LinkedConcurrentQueue constructor with empty undefined array.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_NoParameterUndefinedTest_static_018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
            let arr = new Array<string>();
            let queueIntPop1 = new containers.stackless.LinkedConcurrentQueue<string>(arr);
            let res = queueIntPop1.size;
            expect(String(res)).assertEqual('0');
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedConcurrentQueueNoParameterTest_0186
         * @tc.name linked_Concurrent_Queue_NoParameterTest_static_024
         * @tc.desc Test LinkedConcurrentQueue constructor with empty Map values iterable.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_NoParameterTest_static_024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
            let arr = new Map<string, int>();
            let iter = arr.values();
            let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(iter);
            let res = queueIntPop1.size;
            expect(String(res)).assertEqual('0');
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedConcurrentQueueNoParameterTest_0187
         * @tc.name linked_Concurrent_Queue_NoParameterTest_static_025
         * @tc.desc Test LinkedConcurrentQueue constructor with empty Map values iterable and capacity 0.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_NoParameterTest_static_025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
            let arr = new Map<string, int>();
            let iter = arr.values();
            let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(10, iter);
            let res = queueIntPop1.capacity;
            expect(String(res)).assertEqual('10');
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedConcurrentQueueNoParameterTest_0189
         * @tc.name linked_Concurrent_Queue_NoParameterTest_static_027
         * @tc.desc Test LinkedConcurrentQueue constructor with empty nested array iterable.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_NoParameterTest_static_027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
            let arr = new Array<Array<int>>();
            let iter = arr.values();
            let queueIntPop1 = new containers.stackless.LinkedConcurrentQueue<Array<int>>(iter);
            let res = queueIntPop1.size;
            expect(String(res)).assertEqual('0');
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_setCapacityWithTest_0190
         * @tc.name setCapacityWithTest_static_001
         * @tc.desc A queue with a capacity of-1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("setCapacityWithTest_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                const queue = new containers.stackless.LinkedConcurrentQueue<number>(-1);
                expect().assertFail();
            } catch (error) {
                expect(error instanceof Error).assertTrue();
            }
            done();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_setCapacityWithTest_0192
         * @tc.name setCapacityWithTest_static_003
         * @tc.desc A queue with a capacity of1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("setCapacityWithTest_static_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const queue = new containers.stackless.LinkedConcurrentQueue<number>(1);
            const actualCapacity = queue.capacity;
            expect(String(actualCapacity)).assertEqual('1');
            queue.add(1);
            const actualSize = queue.size;
            expect(String(actualSize)).assertEqual('1');
            done();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_setCapacityWithTest_0193
         * @tc.name setCapacityWithTest_static_004
         * @tc.desc A queue with a capacity of Integer.MAX_VALUE
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("setCapacityWithTest_static_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const queue: containers.stackless.LinkedConcurrentQueue<number> = new containers.stackless.LinkedConcurrentQueue<number>(2147483647);
            const actualCapacity = queue.capacity;
            expect(String(actualCapacity)).assertEqual(String(Integer.MAX_VALUE));
            for (let i: int = 0; i < 100; i++) {
                queue.add(i);
            }
            const actualSize = queue.size;
            expect(String(actualSize)).assertEqual('100');
            done();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_setCapacityWithTest_0194
         * @tc.name setCapacityWithTest_static_005
         * @tc.desc A queue with a capacity of Integer.MAX_VALUE+1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("setCapacityWithTest_static_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                const queue: containers.stackless.LinkedConcurrentQueue<number> = new containers.stackless.LinkedConcurrentQueue<number>(Int.MAX_VALUE + 1);
                expect().assertFail();
            } catch (error) {
                expect(error instanceof Error).assertTrue();
            }
            done();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_spropertyWithTest_0195
         * @tc.name propertyWithTest_static_001
         * @tc.desc Test the actual size of the empty queue
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("propertyWithTest_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const queue = new containers.stackless.LinkedConcurrentQueue<number>(10);
            const actualSize = queue.size;
            expect(String(actualSize)).assertEqual('0');
            done();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_spropertyWithTest_0196
         * @tc.name propertyWithTest_static_002
         * @tc.desc Test the actual size of the non-empty queue (add/remove operation)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("propertyWithTest_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const queue = new containers.stackless.LinkedConcurrentQueue<number>(100);
            for (let i: int = 0; i < 100; i++) {
                queue.add(i);
            }
            let actualSize = queue.size;
            expect(String(actualSize)).assertEqual('100');
            done();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_spropertyWithTest_0197
         * @tc.name propertyWithTest_static_003
         * @tc.desc Test the actual size of the non-empty queue (push/pop operation)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("propertyWithTest_static_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const queue = new containers.stackless.LinkedConcurrentQueue<number>(100);
            for (let i: int = 0; i < 100; i++) {
                await queue.push(i);
            }
            let actualSize = queue.size;
            expect(String(actualSize)).assertEqual('100');
            for (let i: int = 0; i < 50; i++) {
                await queue.pop();
            }
            actualSize = queue.size;
            expect(String(actualSize)).assertEqual('50');
            done();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_spropertyWithTest_0198
         * @tc.name propertyWithTest_static_004
         * @tc.desc Test the actual size of the non-empty queue (add/poll operation)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("propertyWithTest_static_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const queue = new containers.stackless.LinkedConcurrentQueue<number>(100);
            for (let i: int = 0; i < 100; i++) {
                queue.add(i);
            }
            let actualSize = queue.size;
            expect(String(actualSize)).assertEqual('100');
            for (let i: int = 0; i < 50; i++) {
                queue.poll();
            }
            actualSize = queue.size;
            expect(String(actualSize)).assertEqual('50');
            done();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_spropertyWithTest_0199
         * @tc.name propertyWithTest_static_005
         * @tc.desc Test the actual size of the queue with a capacity of 1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("propertyWithTest_static_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const queue = new containers.stackless.LinkedConcurrentQueue<number>(1);
            queue.add(1);
            const actualSize = queue.size;
            expect(String(actualSize)).assertEqual('1');
            done();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_pushWithTest_0200
         * @tc.name pushWithTest_static_001
         * @tc.desc Test the blocking behavior of push when the queue is full
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("pushWithTest_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const queue = new containers.stackless.LinkedConcurrentQueue<number>(2);
            await queue.push(1);
            await queue.push(2);
            setTimeout(() => {
                queue.poll();
            }, 1000);
            console.log("Attempting to push to a full queue...");
            await queue.push(3);
            const actualSize = queue.size;
            expect(String(actualSize)).assertEqual('2');
            done();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_pushWithTest_0201
         * @tc.name pushWithTest_static_002
         * @tc.desc Test the insertion of empty strings and placeholder markers
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("pushWithTest_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const queue = new containers.stackless.LinkedConcurrentQueue<int | string>(4);
            await queue.push("");
            await queue.push('null');
            await queue.push('undefined');
            await queue.push(42);
            const actualSize = queue.size;
            expect(String(actualSize)).assertEqual('4');
            expect(queue.poll()).assertEqual("");
            expect(JSON.stringify(queue.poll())).assertEqual('"null"');
            expect(String(queue.poll())).assertEqual('undefined');
            expect(String(queue.poll())).assertEqual('42');
            done();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_pushWithTest_0202
         * @tc.name pushWithTest_static_003
         * @tc.desc To test the insertion of data of the String type
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("pushWithTest_static_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const queue = new containers.stackless.LinkedConcurrentQueue<string>(1);
            await queue.push("Hello, World!");
            const actualSize = queue.size;
            expect(String(actualSize)).assertEqual('1');
            expect(queue.poll()).assertEqual("Hello, World!");
            done();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_pushWithTest_0203
         * @tc.name pushWithTest_static_004
         * @tc.desc To test the insertion of data of the BigInt type
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("pushWithTest_static_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const queue = new containers.stackless.LinkedConcurrentQueue<BigInt>(1);
            const bigIntValue = BigInt(9007199254740991);
            await queue.push(bigIntValue);
            const actualSize = queue.size;
            expect(String(actualSize)).assertEqual('1');
            expect(String(queue.poll())).assertEqual(String(bigIntValue));
            done();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_pushWithTest_0204
         * @tc.name pushWithTest_static_005
         * @tc.desc Test the insertion of Boolean data
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("pushWithTest_static_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const queue = new containers.stackless.LinkedConcurrentQueue<boolean>(1);
            await queue.push(true);
            const actualSize = queue.size;
            expect(String(actualSize)).assertEqual('1');
            expect(queue.poll()).assertTrue();
            done();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_pushWithTest_0205
         * @tc.name pushWithTest_static_006
         * @tc.desc Test the insertion of a custom class instance
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("pushWithTest_static_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const queue = new containers.stackless.LinkedConcurrentQueue<CustomClass1>(1);
            const customInstance = new CustomClass1("TestInstance");
            await queue.push(customInstance);
            const actualSize = queue.size;
            expect(String(actualSize)).assertEqual('1');
            const polledValue = queue.poll();
            expect(polledValue!.name).assertEqual("TestInstance");
            done();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_pushWithTest_0206
         * @tc.name pushWithTest_static_007
         * @tc.desc To test the insertion of array type data
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("pushWithTest_static_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const queue = new containers.stackless.LinkedConcurrentQueue<int[]>(1);
            await queue.push([1, 2, 3]);
            const actualSize = queue.size;
            expect(String(actualSize)).assertEqual('1');
            expect(JSON.stringify(queue.poll())).assertEqual(JSON.stringify([1, 2, 3]));
            done();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_pushWithTest_0207
         * @tc.name pushWithTest_static_008
         * @tc.desc To test the insertion of data of the object type
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("pushWithTest_static_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const queue = new containers.stackless.LinkedConcurrentQueue<object>(1);

            const objectValue: objectValueType = {
                key: "value"
            };
            await queue.push(objectValue);
            const actualSize = queue.size;
            expect(String(actualSize)).assertEqual('1');
            done();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_pushWithTest_0208
         * @tc.name pushWithTest_static_009
         * @tc.desc Test the actual size of the empty queue after the element is added
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("pushWithTest_static_009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const queue = new containers.stackless.LinkedConcurrentQueue<number>(5);
            await queue.push(42);
            const actualSize = queue.size;
            expect(String(actualSize)).assertEqual('1');
            done();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_pushWithTest_0209
         * @tc.name pushWithTest_static_011
         * @tc.desc Test the actual size of a queue with a capacity of 1 after the element is added
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("pushWithTest_static_011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const queue = new containers.stackless.LinkedConcurrentQueue<number>(1);
            await queue.push(42);
            const actualSize = queue.size;
            expect(String(actualSize)).assertEqual('1');
            done();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_pushWithTest_0210
         * @tc.name pushWithTest_static_0011
         * @tc.desc Test the actual size of the queue with capacity-1 after the element is added
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("pushWithTest_static_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const capacity = 5;
            const queue = new containers.stackless.LinkedConcurrentQueue<number>(capacity);
            for (let i: int = 0; i < capacity - 1; i++) {
                await queue.push(i);
            }
            const actualSize = queue.size;
            expect(String(actualSize)).assertEqual(String(capacity - 1));
            done();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_pushWithTest_0211
         * @tc.name pushWithTest_static_012
         * @tc.desc Test the actual size of a queue with a capacity of 10 after one element is added
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("pushWithTest_static_012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const queue = new containers.stackless.LinkedConcurrentQueue<number>(10);
            await queue.push(42);
            const actualSize = queue.size;
            expect(String(actualSize)).assertEqual('1');
            done();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_pushWithTest_0212
         * @tc.name pushWithTest_static_013
         * @tc.desc Test the actual size of a queue with capacity of 10 after capacity-1 elements are added
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("pushWithTest_static_013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const capacity = 10;
            const queue = new containers.stackless.LinkedConcurrentQueue<number>(capacity);
            for (let i: int = 0; i < capacity - 1; i++) {
                await queue.push(i);
            }
            const actualSize = queue.size;
            expect(String(actualSize)).assertEqual(String(capacity - 1));
            done();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_pushWithTest_0213
         * @tc.name pushWithTest_static_014
         * @tc.desc Test the actual size of a queue with capacity of 10 after capacity elements are added
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("pushWithTest_static_014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const capacity = 10;
            const queue = new containers.stackless.LinkedConcurrentQueue<number>(capacity);
            for (let i: int = 0; i < capacity; i++) {
                await queue.push(i);
            }
            const actualSize = queue.size;
            expect(String(actualSize)).assertEqual(String(capacity));
            done();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_ETSUTILS_linkedConcurrentQueuePerformanceTest_0214
         * @tc.name linked_Concurrent_Queue_PerformanceTest_static_001
         * @tc.desc 10 concurrent operations simultaneously add elements to the container.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_PerformanceTest_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const threadCount = loopTenTimes;
            const taskGroup = new taskpool.TaskGroup();
            let queueInt: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(threadCount);
            for (let i: int = 0; i < threadCount; i++) {
                taskGroup.addTask(createAddTask(queueInt, i));
            }
            await taskpool.execute(taskGroup);
            expect(JSON.stringify(queueInt.size)).assertEqual(JSON.stringify(threadCount));
            expect(queueInt.isEmpty()).assertFalse();
            done();
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_ETSUTILS_linkedConcurrentQueuePerformanceTest_0215
         * @tc.name linked_Concurrent_Queue_PerformanceTest_static_002
         * @tc.desc Initial container 100 elements, 10 concurrent simultaneous operation of the container to delete and remove elements
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_PerformanceTest_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const totalCount: int = 100;
            const numbers: Array<int> = new Array<int>();
            for (let i: int = 0; i < totalCount; i++) {
                numbers.push(i);
            }
            const threadCount = 10;
            const taskGroup = new taskpool.TaskGroup();
            let iter = numbers.values();
            let queueInt: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(totalCount, iter);
            for (let i: int = 0; i < threadCount; i++) {
                taskGroup.addTask(createPopTask(queueInt));
            }
            await taskpool.execute(taskGroup);
            expect(JSON.stringify(queueInt.size)).assertEqual(JSON.stringify(totalCount - threadCount));
            expect(queueInt.isEmpty()).assertFalse();
            done();
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_ETSUTILS_linkedConcurrentQueuePerformanceTest_0216
         * @tc.name linked_Concurrent_Queue_PerformanceTest_static_003
         * @tc.desc Initial container with 100 elements. Ten concurrent operations simultaneously operate on the container to perform element deletion (poll operation).
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_PerformanceTest_static_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const totalCount: int = 100;
            const numbers: Array<int> = new Array<int>();
            for (let i: int = 0; i < totalCount; i++) {
                numbers.push(i);
            }
            const threadCount = 10;
            const taskGroup = new taskpool.TaskGroup();
            let iter = numbers.values();
            let queueInt: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(totalCount, iter);
            for (let i: int = 0; i < threadCount; i++) {
                taskGroup.addTask(createPollTask(queueInt));
            }
            await taskpool.execute(taskGroup);
            expect(JSON.stringify(queueInt.size)).assertEqual(JSON.stringify(totalCount - threadCount));
            expect(queueInt.isEmpty()).assertFalse();
            done();
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_ETSUTILS_linkedConcurrentQueueTest_0217
         * @tc.name linked_Concurrent_Queue_PerformanceTest_static_004
         * @tc.desc Push 100 data, poll 100 data.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_PerformanceTest_static_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const totalCount: int = 100;
            let queueInt: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(totalCount);
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
         * @tc.number SUB_COMMONLIBRARY_ETSUTILS_linkedConcurrentQueuePerformanceTest_0218
         * @tc.name linked_Concurrent_Queue_PerformanceTest_static_005
         * @tc.desc add 100 pieces of data, pop 100 pieces of data.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_PerformanceTest_static_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const totalCount: int = 100;
            let queueInt: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(totalCount);
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
         * @tc.number SUB_COMMONLIBRARY_ETSUTILS_linkedConcurrentQueueAsyncTest_0219
         * @tc.name linked_Concurrent_Queue_AsyncTest_static_001
         * @tc.desc The host thread adds 1000 pieces of data, and 10 threads poll out the data at the same time
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_AsyncTest_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const totalCount: int = thousandTimes;
            const taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
            let queueInt: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(totalCount);
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
         * @tc.number SUB_COMMONLIBRARY_ETSUTILS_linkedConcurrentQueueAsyncTest_0220
         * @tc.name linked_Concurrent_Queue_AsyncTest_static_002
         * @tc.desc Multi-thread (10) push inserts a total of 1000 data, and the host thread pops out the data
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_AsyncTest_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const totalCount: int = thousandTimes;
            const taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
            let queueInt: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(totalCount);
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
         * @tc.number SUB_COMMONLIBRARY_ETSUTILS_linkedConcurrentQueueAsyncTest_0221
         * @tc.name linked_Concurrent_Queue_AsyncTest_static_003
         * @tc.desc Multi-threaded operation. Thread A inserts data, and thread B takes out data.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_AsyncTest_static_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const totalCount: int = 100;
            const taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
            let queueInt: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(totalCount);
            taskGroup.addTask(createPushTaskStart(queueInt, totalCount));
            taskGroup.addTask(createPopTaskStart(queueInt, totalCount));
            await taskpool.execute(taskGroup);
            expect(JSON.stringify(queueInt.size)).assertEqual('0');
            expect(queueInt.isEmpty()).assertTrue();
            done();
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_ETSUTILS_linkedConcurrentQueueAsyncTest_0222
         * @tc.name linked_Concurrent_Queue_AsyncTest_static_004
         * @tc.desc Threads add elements simultaneously to verify the thread safety of the queue.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_AsyncTest_static_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
            let queueInt: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(100);
            for (let i: int = 0; i < loopTenTimes; i++) {
                taskGroup.addTask(createPushTaskStartLoopTen(queueInt, i));
            }
            await taskpool.execute(taskGroup);
            expect(JSON.stringify(queueInt.size)).assertEqual(JSON.stringify(loopTenTimes * 10));
            expect(queueInt.isEmpty()).assertFalse();
            done();
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_ETSUTILS_linkedConcurrentQueueAsyncTest_0223
         * @tc.name linked_Concurrent_Queue_AsyncTest_static_005
         * @tc.desc:Preset 1000 pieces of data, 10 threads remove elements at the same time, verify the thread safety of the queue
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_AsyncTest_static_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const totalCount: int = thousandTimes;
            const taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
            let queueInt: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(totalCount);
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
         * @tc.number SUB_COMMONLIBRARY_ETSUTILS_linkedConcurrentQueueAsyncTest_0225
         * @tc.name linked_Concurrent_Queue_AsyncTest_static_007
         * @tc.desc 10 thread A and 10 thread B. Each thread calls add(element) or poll() 1,000 times.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_AsyncTest_static_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const totalCount: int = thousandTimes;
            const taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
            const taskGroupPoll: taskpool.TaskGroup = new taskpool.TaskGroup();
            let queueInt: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(totalCount);

            for (let i: int = 0; i < loopTenTimes; i++) {
                taskGroup.addTask(createAddTaskHundred(queueInt, i * hundredTimes));
            }
            await taskpool.execute(taskGroup);
            expect(JSON.stringify(queueInt.size)).assertEqual(JSON.stringify(loopTenTimes * hundredTimes));
            for (let i: int = 0; i < loopTenTimes; i++) {
                taskGroupPoll.addTask(createPollTaskHundred(queueInt, i * hundredTimes));
            }
            await taskpool.execute(taskGroupPoll);
            expect(JSON.stringify(queueInt.size)).assertEqual('0');
            done();
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_ETSUTILS_linkedConcurrentQueueAsyncTest_0226
         * @tc.name linked_Concurrent_Queue_AsyncTest_static_008
         * @tc.desc 10 threads A and 10 threads B, each calling push (element) or pop () 1,000 times
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_AsyncTest_static_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const totalCount: int = thousandTimes;
            const taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
            const taskPopGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
            let queueInt: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(totalCount);

            for (let i: int = 0; i < loopTenTimes; i++) {
                taskGroup.addTask(createPushTaskHundred(queueInt, i * hundredTimes));
            }
            await taskpool.execute(taskGroup);
            expect(JSON.stringify(queueInt.size)).assertEqual(JSON.stringify(loopTenTimes * hundredTimes));
            for (let i: int = 0; i < loopTenTimes; i++) {
                taskPopGroup.addTask(createPopTaskHundred(queueInt, i * hundredTimes));
            }
            await taskpool.execute(taskPopGroup);
            expect(JSON.stringify(queueInt.size)).assertEqual('0');
            done();
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_ETSUTILS_linkedConcurrentQueueAsyncTest_0227
         * @tc.name linked_Concurrent_Queue_AsyncTest_static_009
         * @tc.desc Start multiple threads, each thread initializing the queue with a different iterable
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_AsyncTest_static_009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
            const iterArrays: Array<IterableIterator<int>> = new Array<IterableIterator<int>>();
            const set: Set<int> = new Set<int>();
            const arrays: Array<Set<int>> = new Array<Set<int>>();
            for (let i: int = 0; i < 10; i++) {
                set.add(i);
                arrays.push(set);
            }
            for (let i: int = 0; i < arrays.length; i++) {
                let iter = arrays[i].values();
                taskGroup.addTask(createLinkedConcurrentQueueFromIterTask(iter));
            }
            const linkedConcurrentQueues = await taskpool.execute(taskGroup);
            expect(JSON.stringify(linkedConcurrentQueues.length)).assertEqual('10');
            done();
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LinkedConcurrentQueueGetEndTest_0228
         * @tc.name linked_Concurrent_Queue_GetEndTest_static_001
         * @tc.desc Query to obtain the tail element without changing the queue.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_GetEndTest_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(10);
            for (let i: int = 0; i < 10; i++) {
                await queueIntPop1.push(i);
            }
            let res = queueIntPop1.getEnd();
            let res1 = queueIntPop1.size;
            expect(res).assertEqual(9);
            expect(res1).assertEqual(10);
            done();
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LinkedConcurrentQueueGetEndTest_0229
         * @tc.name linked_Concurrent_Queue_GetEndTest_static_002
         * @tc.desc Elements are "" special characters..
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_GetEndTest_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
            let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int | string> = new containers.stackless.LinkedConcurrentQueue<int | string>(10);
            queueIntPop1.add("");
            let res = queueIntPop1.getEnd();
            let res1 = queueIntPop1.size;
            expect(res).assertEqual("");
            expect(JSON.stringify(res1)).assertEqual('1');
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LinkedConcurrentQueueGetEndTest_0230
         * @tc.name linked_Concurrent_Queue_GetEndTest_static_003
         * @tc.desc Elements use a string marker for the special null-like case.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_GetEndTest_static_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
            let queueIntPop1: containers.stackless.LinkedConcurrentQueue<string> = new containers.stackless.LinkedConcurrentQueue<string>(10);
            queueIntPop1.add('null');
            let res = queueIntPop1.getEnd();
            let res1 = queueIntPop1.size;
            expect(JSON.stringify(res)).assertEqual('"null"');
            expect(JSON.stringify(res1)).assertEqual('1');
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LinkedConcurrentQueueGetEndTest_0231
         * @tc.name linked_Concurrent_Queue_GetEndTest_static_004
         * @tc.desc Elements use a string marker for the special undefined-like case.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_GetEndTest_static_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
            let queueIntPop1: containers.stackless.LinkedConcurrentQueue<string> = new containers.stackless.LinkedConcurrentQueue<string>(10);
            queueIntPop1.add('undefined');
            let res = queueIntPop1.getEnd();
            let res1 = queueIntPop1.size;
            expect(res).assertEqual('undefined');
            expect(res1).assertEqual(1);
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LinkedConcurrentQueueGetEndTest_0232
         * @tc.name linked_Concurrent_Queue_GetEndTest_static_005
         * @tc.desc empty queue.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_GetEndTest_static_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
            let queueIntPop1: containers.stackless.LinkedConcurrentQueue<string> = new containers.stackless.LinkedConcurrentQueue<string>(10);
            let res = queueIntPop1.getEnd();
            let res1 = queueIntPop1.size;
            expect(JSON.stringify(res)).assertEqual('');
            expect(JSON.stringify(res1)).assertEqual('0');
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LinkedConcurrentQueueGetEndTest_0233
         * @tc.name linked_Concurrent_Queue_GetEndTest_static_006
         * @tc.desc Queue with capacity 1,Query to obtain the tail element without changing the queue.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_GetEndTest_static_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
            let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(1);
            queueIntPop1.add(1);
            let res = queueIntPop1.getEnd();
            let res1 = queueIntPop1.size;
            expect(JSON.stringify(res)).assertEqual('1');
            expect(JSON.stringify(res1)).assertEqual('1');
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LinkedConcurrentQueueGetEndTest_0234
         * @tc.name linked_Concurrent_Queue_GetEndTest_static_007
         * @tc.desc Queue with capacity -1,Query to obtain the tail element without changing the queue.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_GetEndTest_static_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
            let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(2);
            queueIntPop1.add(1);
            let res = queueIntPop1.getEnd();
            let res1 = queueIntPop1.size;
            expect(JSON.stringify(res)).assertEqual('1');
            expect(JSON.stringify(res1)).assertEqual('1');
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LinkedConcurrentQueueGetEndTest_0235
         * @tc.name linked_Concurrent_Queue_GetEndTest_static_008
         * @tc.desc Queue with capacity -1,Query to obtain the tail element without changing the queue.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_GetEndTest_static_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
            let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(10);
            queueIntPop1.add(1);
            let res1 = queueIntPop1.size;
            expect(JSON.stringify(res1)).assertEqual('1');
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LinkedConcurrentQueueGetEndTest_0236
         * @tc.name linked_Concurrent_Queue_GetEndTest_static_009
         * @tc.desc Queue with capacity 10,Add one element and obtain the actualSize assertion.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_GetEndTest_static_009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
            let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(10);
            queueIntPop1.add(1);
            let res1 = queueIntPop1.size;
            expect(JSON.stringify(res1)).assertEqual('1');
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LinkedConcurrentQueueGetEndTest_0237
         * @tc.name linked_Concurrent_Queue_GetEndTest_static_010
         * @tc.desc Queue with capacity 10 ,Add capacity-1 elements and obtain the actualSize assertion.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_GetEndTest_static_010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
            let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(10);
            for (let i: int = 0; i < 9; i++) {
                queueIntPop1.add(i);
            }
            let res1 = queueIntPop1.size;
            expect(JSON.stringify(res1)).assertEqual('9');
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LinkedConcurrentQueueGetEndTest_0238
         * @tc.name linked_Concurrent_Queue_GetEndTest_static_011
         * @tc.desc Queue with capacity 10 ,Add capacity elements and obtain the actualSize assertion.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it("linked_Concurrent_Queue_GetEndTest_static_011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
            let queueIntPop1: containers.stackless.LinkedConcurrentQueue<int> = new containers.stackless.LinkedConcurrentQueue<int>(10);
            for (let i: int = 0; i < 10; i++) {
                i
                queueIntPop1.add(i);
            }
            let res1 = queueIntPop1.size;
            expect(JSON.stringify(res1)).assertEqual('10');
        })

        /**
         * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LinkedConcurrentQueuePropertyPushSpecialValues_0239
         * @tc.name property_Push_SpecialValues_static
         * @tc.desc Verify pushing and popping special string marker values
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 0
         */
        it('property_Push_SpecialValues_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let queue: containers.stackless.LinkedConcurrentQueue<string> =
                new containers.stackless.LinkedConcurrentQueue<string>(4);
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

    })
}
