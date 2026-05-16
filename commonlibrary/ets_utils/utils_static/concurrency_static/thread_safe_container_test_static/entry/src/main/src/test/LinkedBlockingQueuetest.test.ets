import { describe, it, xit, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'

let domain: number = 0x0000;
let tag: string = 'testTag';

class TestClass {
}

function createAddTask(queueTemp: containers.LinkedBlockingQueue<int>, data: int): taskpool.Task {
  return new taskpool.Task((queue: containers.LinkedBlockingQueue<int>, v: int) => {
    queue.add(v);
  }, queueTemp, data);
}

function createPushTask(queueTemp: containers.LinkedBlockingQueue<int>, data: int): taskpool.Task {
  return new taskpool.Task((queue: containers.LinkedBlockingQueue<int>, v: int) => {
    queue.push(v);
  }, queueTemp, data);
}

function createPushTaskStart(queueTemp: containers.LinkedBlockingQueue<int>, start: int): taskpool.Task {
  return new taskpool.Task((queue: containers.LinkedBlockingQueue<int>, s: int) => {
    for (let i:int = 0; i < s; i++) {
      queue.push(i);
    }
  }, queueTemp, start);
}

function createPushTaskStartLoopTen(queueTemp: containers.LinkedBlockingQueue<int>, start: int): taskpool.Task {
  return new taskpool.Task((queue: containers.LinkedBlockingQueue<int>, s: int) => {
    for (let i:int = s; i < s + 10; i++) {
      queue.push(i);
    }
  }, queueTemp, start);
}

function createPopTaskStart(queueTemp: containers.LinkedBlockingQueue<int>, start: int): taskpool.Task {
  return new taskpool.Task((queue: containers.LinkedBlockingQueue<int>, s: int) => {
    for (let i:int = 0; i < s; i++) {
      queue.pop();
    }
  }, queueTemp, start);
}

function createPollTask(queueTemp: containers.LinkedBlockingQueue<int>): taskpool.Task {
  return new taskpool.Task((queue: containers.LinkedBlockingQueue<int>) => {
    queue.poll();
  }, queueTemp);
}

function createPollTaskHundred(queueTemp: containers.LinkedBlockingQueue<int>, start: int): taskpool.Task {
  return new taskpool.Task((queue: containers.LinkedBlockingQueue<int>, s: int) => {
    for (let i: int = s; i < s + hundredTimes; i++) {
      queue.poll();
    }
  }, queueTemp, start);
}

function createAddTaskHundred(queueTemp: containers.LinkedBlockingQueue<int>, start: int): taskpool.Task {
  return new taskpool.Task((queue: containers.LinkedBlockingQueue<int>, s: int) => {
    for (let i: int = s; i < s + hundredTimes; i++) {
      queue.add(i);
    }
  }, queueTemp, start);
}

function createPopTask(queueTemp: containers.LinkedBlockingQueue<int>): taskpool.Task {
  return new taskpool.Task((queue: containers.LinkedBlockingQueue<int>) => {
    queue.pop();
  }, queueTemp);
}

function createPopTaskHundred(queueTemp: containers.LinkedBlockingQueue<int>, start: int): taskpool.Task {
  return new taskpool.Task((queue: containers.LinkedBlockingQueue<int>, s: int) => {
    for (let i: int = s; i < s + hundredTimes; i++) {
      queue.pop();
    }
  }, queueTemp, start);
}

function createPushTaskHundred(queueTemp: containers.LinkedBlockingQueue<int>, start: int): taskpool.Task {
  return new taskpool.Task((queue: containers.LinkedBlockingQueue<int>, s: int) => {
    for (let i: int = s; i < s + hundredTimes; i++) {
      queue.push(i);
    }
  }, queueTemp, start);
}

function createLinkedBlockingQueueFromIterTask(iterTemp: IterableIterator<int>): taskpool.Task {
  return new taskpool.Task(async (iter: IterableIterator<int>): Promise<containers.LinkedBlockingQueue<int>> => {
    return new containers.LinkedBlockingQueue<int>(iter)
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

export default function LinkedBlockingQueuetest() {
  describe("linked_Blocking_Queue_", (): void => {
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueNoParameterTest_0100
     * @tc.name linked_Blocking_Queue_NoParameterTest_static_001
     * @tc.desc Test LinkedBlockingQueue constructor with capacity 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_NoParameterTest_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      try {
        let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(0);
      }
      catch (error) {
        expect(error instanceof Error).assertTrue();
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueIsEmptyTest_0101
     * @tc.name linked_Blocking_Queue_IsEmptyTest
     * @tc.desc Test isEmpty() on newly created empty queue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_IsEmptyTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      let res = queueIntPop1.isEmpty();
      expect(String(res)).assertEqual('true');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueIsNoEmptyTest_0102
     * @tc.name linked_Blocking_Queue_IsNoEmptyTest
     * @tc.desc Test isEmpty() on queue with capacity but no elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_IsNoEmptyTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(66);
      let res = queueIntPop1.isEmpty();
      expect(String(res)).assertEqual('true');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueAddIsOrEmptyTest_0103
     * @tc.name linked_Blocking_Queue_AddIsOrEmptyTest
     * @tc.desc Test isEmpty() after adding element to queue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_AddIsOrEmptyTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      queueIntPop1.add(1);
      let res = queueIntPop1.isEmpty();
      expect(String(res)).assertEqual('false');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueRemoveIsOrEmptyTest_0104
     * @tc.name linked_Blocking_Queue_RemoveIsOrEmptyTest
     * @tc.desc Test isEmpty() after polling from queue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_RemoveIsOrEmptyTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(1);
      queueIntPop1.poll();
      let res = queueIntPop1.isEmpty();
      expect(String(res)).assertEqual('true');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueuePushIsOrEmptyTest_0105
     * @tc.name linked_Blocking_Queue_PushIsOrEmptyTest
     * @tc.desc Test isEmpty() after pushing multiple elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_PushIsOrEmptyTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      for (let i:int = 0; i < 10; i++) {
        queueIntPop1.push(i);
      }
      let res = queueIntPop1.isEmpty();
      expect(String(res)).assertEqual('false');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueuePopIsOrEmptyTest_0106
     * @tc.name linked_Blocking_Queue_PopIsOrEmptyTest
     * @tc.desc Test isEmpty() after popping element from queue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_PopIsOrEmptyTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(1);
      queueIntPop1.push(1);
      let res = queueIntPop1.pop();
      expect(String(res)).assertEqual('1');
      let res1 = queueIntPop1.isEmpty();
      expect(String(res1)).assertEqual('true');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueGetSizeFullQueueTest_0107
     * @tc.name linked_Blocking_Queue_GetSizeFullQueueTest
     * @tc.desc Test size() on full queue with 10 elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_GetSizeFullQueueTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      for (let i:int = 0; i < 10; i++) {
        queueIntPop1.push(i);
      }
      let res = queueIntPop1.size;
      expect(String(res)).assertEqual('10');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueGetSizeNullQueueAddTest_0108
     * @tc.name linked_Blocking_Queue_GetSizeNullQueueAddTest
     * @tc.desc Test remainingCapacity() on newly created queue with capacity 10.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_GetSizeNullQueueAddTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      queueIntPop1.add(1);
      let res = queueIntPop1.size;
      expect(String(res)).assertEqual('1');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueGetSizeNullQueueRemoveTest_0109
     * @tc.name linked_Blocking_Queue_GetSizeNullQueueRemoveTest
     * @tc.desc Verify the size of empty queue after poll operation should be 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_GetSizeNullQueueRemoveTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
        queueIntPop1.poll();
        let res = queueIntPop1.size;
        expect(String(res)).assertEqual('0');
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueGetSizeNullQueuePushTest_0110
     * @tc.name linked_Blocking_Queue_GetSizeNullQueuePushTest
     * @tc.desc Verify the size of queue after pushing one element should be 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_GetSizeNullQueuePushTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      queueIntPop1.push(1);
      let res = queueIntPop1.size;
      expect(String(res)).assertEqual('1');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueGetSizeNullQueuePopTest_0111
     * @tc.name linked_Blocking_Queue_GetSizeNullQueuePopTest
     * @tc.desc Verify the size of queue after pushing 10 elements and popping one should be 9.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_GetSizeNullQueuePopTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      for (let i:int = 0; i < 10; i++) {
        queueIntPop1.push(i);
      }
      queueIntPop1.pop();
      let res = queueIntPop1.size;
      expect(String(res)).assertEqual('9');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueGetSizeQueuePopAddTest_0112
     * @tc.name linked_Blocking_Queue_GetSizeQueuePopAddTest
     * @tc.desc Verify that when a value is pushed into a queue with a capacity of 1, the size of the queue is 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_GetSizeQueuePopAddTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(1);
      queueIntPop1.push(1);
      let res = queueIntPop1.size;
      expect(String(res)).assertEqual('1');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueRemainingCapacityFullQueuePopTest_0113
     * @tc.name linked_Blocking_Queue_RemainingCapacityFullQueuePopTest
     * @tc.desc Verify that the remaining capacity of a newly created queue with a capacity of 10 is 10.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_RemainingCapacityFullQueuePopTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
        let res = queueIntPop1.remainingCapacity();
        expect(String(res)).assertEqual('10');
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueRemainingCapacityNullQueuePopTest_0115
     * @tc.name linked_Blocking_Queue_RemainingCapacityNullQueuePopTest
     * @tc.desc Verify that the remaining capacity of a queue with a capacity of 50 is 50 and its size is 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_RemainingCapacityNullQueuePopTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(50);
        let res = queueIntPop1.remainingCapacity();
        let res1 = queueIntPop1.size;
        expect(String(res)).assertEqual('50');
        expect(String(res1)).assertEqual('0');
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueRemainingCapacityNullQueuePopTest_0116
     * @tc.name linked_Blocking_Queue_RemainingCapacityNullQueuePopTest001
     * @tc.desc Verify that the remaining capacity and capacity of a queue with a capacity of 1 are both 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_RemainingCapacityNullQueuePopTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(1);
        let res = queueIntPop1.remainingCapacity();
        let res1 = queueIntPop1.capacity;
        expect(String(res)).assertEqual('1');
        expect(String(res1)).assertEqual('1');
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueRemainingCapacityNullQueuePopTest_0117
     * @tc.name linked_Blocking_Queue_RemainingCapacityNullQueuePopTest01
     * @tc.desc Verify that the remaining capacity of a queue with a capacity.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_RemainingCapacityNullQueuePopTest01", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(1);
        let res = queueIntPop1.remainingCapacity();
        let res1 = queueIntPop1.size;
        expect(String(res)).assertEqual('1');
        expect(String(res1)).assertEqual('0');
        queueIntPop1.poll();
        expect(String(queueIntPop1.size)).assertEqual('0');
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueRemainingCapacityNullQueuePopTest_0118
     * @tc.name linked_Blocking_Queue_RemainingCapacityNullQueuePopTest0001
     * @tc.desc Verify that for a queue with an initial capacity.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_RemainingCapacityNullQueuePopTest0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(2);
        for (let i:int = 0; i < 2; i++) {
          queueIntPop1.push(i);
        }
        queueIntPop1.pop();
        let res = queueIntPop1.remainingCapacity();
        let res1 = queueIntPop1.capacity;
        expect(String(res)).assertEqual('1');
        expect(String(res1)).assertEqual('2');
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueGetCapacityTest_0121
     * @tc.name linked_Blocking_Queue_GetCapacityTest_static_002
     * @tc.desc Verify the capacity behavior of a queue initialized with 5 during poll and add operations.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_GetCapacityTest_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(5);
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueGetCapacityTest_0122
     * @tc.name linked_Blocking_Queue_GetCapacityTest_static_003
     * @tc.desc Verify the capacity behavior of a queue initialized with 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_GetCapacityTest_static_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(1);
      let res1 = queueIntPop1.capacity;
      expect(String(res1)).assertEqual('1');
      queueIntPop1.push(1);
      let res = queueIntPop1.capacity;
      expect(String(res)).assertEqual('1');
      queueIntPop1.pop();
      let res2 = queueIntPop1.capacity;
      expect(String(res2)).assertEqual('1');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueGetCapacityTest_0123
     * @tc.name linked_Blocking_Queue_GetCapacityTest_static_004
     * @tc.desc Verify the capacity behavior of a queue initialized with 3 during poll and add operations.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_GetCapacityTest_static_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(3);
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueGetCapacityTest_0124
     * @tc.name linked_Blocking_Queue_GetCapacityTest_static_005
     * @tc.desc Verify capacity remains 1 after push/pop operations on queue with initial capacity 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_GetCapacityTest_static_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(1);
      let res1 = queueIntPop1.capacity;
      expect(String(res1)).assertEqual('1');
      queueIntPop1.push(1);
      let res = queueIntPop1.capacity;
      expect(String(res)).assertEqual('1');
      queueIntPop1.pop();
      let res2 = queueIntPop1.capacity;
      expect(String(res2)).assertEqual('1');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueGetCapacityTest_0125
     * @tc.name linked_Blocking_Queue_GetCapacityTest_static_006
     * @tc.desc Verify capacity remains 1 after poll/add operations on queue with initial capacity 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_GetCapacityTest_static_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(1);
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueGetCapacityTest_00126
     * @tc.name linked_Blocking_Queue_GetCapacityTest_static_007
     * @tc.desc Verify capacity equals Int.MAX_VALUE after push/pop operations on max capacity queue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_GetCapacityTest_static_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(Int.MAX_VALUE);
      let res1 = queueIntPop1.capacity;
      expect(res1).assertEqual(Int.MAX_VALUE);
      queueIntPop1.push(1);
      let res = queueIntPop1.capacity;
      expect(res).assertEqual(Int.MAX_VALUE);
      queueIntPop1.pop();
      let res2 = queueIntPop1.capacity;
      expect(res2).assertEqual(Int.MAX_VALUE);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueGetCapacityTest_0001260
     * @tc.name linked_Blocking_Queue_GetCapacityTest_static_008
     * @tc.desc Verify capacity equals Int.MAX_VALUE after add/poll operations on max capacity queue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_GetCapacityTest_static_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(Int.MAX_VALUE);
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueGetCapacityTest_0126
     * @tc.name linked_Blocking_Queue_GetCapacityTest_static_009
     * @tc.desc Verify capacity equals Int.MAX_VALUE after push/pop operations on max capacity queue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_GetCapacityTest_static_009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(Int.MAX_VALUE);
      let res1 = queueIntPop1.capacity;
      expect(res1).assertEqual(Int.MAX_VALUE);

      queueIntPop1.push(1);
      let res = queueIntPop1.capacity;
      expect(res).assertEqual(Int.MAX_VALUE);

      queueIntPop1.pop();
      let res2 = queueIntPop1.capacity;
      expect(res2).assertEqual(Int.MAX_VALUE);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueGetCapacityTest_000126
     * @tc.name linkedBlockingQueueGetCapacityTest_000126
     * @tc.desc Verify capacity equals Int.MAX_VALUE after poll/add operations on max capacity queue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linkedBlockingQueueGetCapacityTest_000126", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(Int.MAX_VALUE);
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0127
     * @tc.name linked_Blocking_Queue_Test_static_001
     * @tc.desc Verify getFirst() returns correct first element after pushing 10 elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_Test_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      for (let i:int = 0; i < 10; i++) {
        queueIntPop1.push(i);
      }
      let res = queueIntPop1.getFirst();
      expect(String(res)).assertEqual('0');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0128
     * @tc.name linked_Blocking_Queue_Test_static_002
     * @tc.desc Verify getFirst() returns empty string when adding empty string to queue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_Test_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1 = new containers.LinkedBlockingQueue<int | string>(1);
      queueIntPop1.add("");
      let res = queueIntPop1.getFirst();
      expect(String(res)).assertEqual("");
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0129
     * @tc.name linked_Blocking_Queue_Test_static_003
     * @tc.desc Verify getFirst() returns null when adding null to queue with mixed int|null type.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_Test_static_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1 = new containers.LinkedBlockingQueue<int | null>(1);
      queueIntPop1.add(null);
      let res = queueIntPop1.getFirst();
      expect(String(res)).assertEqual('null');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0130
     * @tc.name linked_Blocking_Queue_Test_static_004
     * @tc.desc Verify getFirst() returns undefined when adding undefined to queue with mixed int|undefined type.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_Test_static_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1 = new containers.LinkedBlockingQueue<int | undefined>(1);
      queueIntPop1.add(undefined);
      let res = queueIntPop1.getFirst();
      expect(String(res)).assertEqual('undefined');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0131
     * @tc.name linked_Blocking_Queue_Test_static_005
     * @tc.desc Verify getFirst() returns null when called on empty queue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_Test_static_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1 = new containers.LinkedBlockingQueue<int>();
      let res = queueIntPop1.getFirst();
      expect(String(res)).assertEqual('undefined');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0132
     * @tc.name linked_Blocking_Queue_Test_static_006
     * @tc.desc Verify getFirst() returns 0 after pushing single element to capacity-1 queue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_Test_static_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1 = new containers.LinkedBlockingQueue<int>(1);
      queueIntPop1.push(0);
      let res = queueIntPop1.getFirst();
      expect(String(res)).assertEqual('0');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0133
     * @tc.name linked_Blocking_Queue_Test_static_007
     * @tc.desc Verify getFirst() returns correct element after pop operation on full queue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_Test_static_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      for (let i:int = 0; i < 10; i++) {
        queueIntPop1.push(i);
      }
      queueIntPop1.pop();
      let res = queueIntPop1.getFirst();
      expect(String(res)).assertEqual('1');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0134
     * @tc.name linked_Blocking_Queue_Test_static_008
     * @tc.desc Verify poll() reduces size to 9 after removing one element from full queue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_Test_static_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      for (let i:int = 0; i < 10; i++) {
        queueIntPop1.push(i);
      }
      let res = queueIntPop1.poll();
      let res1 = queueIntPop1.size;
      expect(String(res1)).assertEqual('9');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0135
     * @tc.name linked_Blocking_Queue_Test_static_009
     * @tc.desc Verify poll() returns null when called on empty queue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_Test_static_009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      let res = queueIntPop1.poll();
      expect(String(res)).assertEqual('undefined');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0136
     * @tc.name linked_Blocking_Queue_Test_static_010
     * @tc.desc Verify poll() returns empty string when removing the only element (empty string) from queue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_Test_static_010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1 = new containers.LinkedBlockingQueue<int | string>(1);
      queueIntPop1.add("");
      let res = queueIntPop1.poll();
      expect(String(res)).assertEqual("");
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0137
     * @tc.name linked_Blocking_Queue_Test_static_011
     * @tc.desc Verify poll() returns null when removing the only element (null) from queue with mixed int|null type.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_Test_static_011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1 = new containers.LinkedBlockingQueue<int | null>(1);
      queueIntPop1.add(null);
      let res = queueIntPop1.poll();
      expect(String(res)).assertEqual('null');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0138
     * @tc.name linked_Blocking_Queue_Test_static_012
     * @tc.desc Verify poll() returns undefined when removing the only element (undefined) from queue with mixed int|undefined type.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_Test_static_012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1 = new containers.LinkedBlockingQueue<int | undefined>(1);
      queueIntPop1.add(undefined);
      let res = queueIntPop1.poll();
      expect(String(res)).assertEqual('undefined');
    })


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_00139
     * @tc.name linked_Blocking_Queue_Test_static_014
     * @tc.desc Verify queue size becomes 0 after add-poll sequence on capacity-1 queue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_Test_static_014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1 = new containers.LinkedBlockingQueue<int>(1);
      queueIntPop1.add(0);
      queueIntPop1.poll();
      let res = queueIntPop1.size;
      expect(String(res)).assertEqual('0');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0140
     * @tc.name linked_Blocking_Queue_Test_static_015
     * @tc.desc Verify queue size becomes 0 after push-pop sequence on under-capacity queue (capacity-1).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_Test_static_015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(2);
      queueIntPop1.push(0);
      queueIntPop1.pop();
      let res1 = queueIntPop1.size;
      expect(String(res1)).assertEqual('0');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0141
     * @tc.name linked_Blocking_Queue_Test_static_016
     * @tc.desc Verify add() returns false when attempting to exceed queue capacity (full queue scenario).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_Test_static_016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      for (let i:int = 0; i < 10; i++) {
        queueIntPop1.push(i);
      }
      let res1 = queueIntPop1.add(11);
      expect(String(res1)).assertEqual('false');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0142
     * @tc.name linked_Blocking_Queue_Test_static_017
     * @tc.desc Verify queue reaches full capacity (size=10) after adding mixed int|string elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_Test_static_017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1 = new containers.LinkedBlockingQueue<int | string>(10);
      for (let i:int = 0; i < 9; i++) {
        queueIntPop1.push(i);
      }
      queueIntPop1.add("");
      let res1 = queueIntPop1.size;
      expect(String(res1)).assertEqual('10');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0143
     * @tc.name linked_Blocking_Queue_Test_static_018
     * @tc.desc Verify queue accepts null element and reaches full capacity (size=10) with mixed int|null elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_Test_static_018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1 = new containers.LinkedBlockingQueue<int | null>(10);
      for (let i:int = 0; i < 9; i++) {
        queueIntPop1.push(i);
      }
      queueIntPop1.add(null);
      let res1 = queueIntPop1.size;
      expect(String(res1)).assertEqual('10');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0144
     * @tc.name linked_Blocking_Queue_Test_static_019
     * @tc.desc Verify queue accepts undefined element and reaches full capacity (size=10) with mixed int|undefined elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_Test_static_019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1 = new containers.LinkedBlockingQueue<int | undefined>(10);
      for (let i:int = 0; i < 9; i++) {
        queueIntPop1.push(i);
      }
      queueIntPop1.add(undefined);
      let res1 = queueIntPop1.size;
      expect(String(res1)).assertEqual('10');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0145
     * @tc.name linked_Blocking_Queue_Test_static_020
     * @tc.desc Verify standard integer element addition makes queue reach full capacity (size=10)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_Test_static_020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      for (let i:int = 0; i < 9; i++) {
        queueIntPop1.push(i);
      }
      queueIntPop1.add(10);
      let res1 = queueIntPop1.size;
      expect(String(res1)).assertEqual('10');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0146
     * @tc.name linked_Blocking_Queue_Test_static_021
     * @tc.desc Verify string element addition makes queue reach full capacity with mixed int|string elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_Test_static_021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1 = new containers.LinkedBlockingQueue<int | string>(10);
      for (let i:int = 0; i < 9; i++) {
        queueIntPop1.push(i);
      }
      queueIntPop1.add("hello");
      let res1 = queueIntPop1.size;
      expect(String(res1)).assertEqual('10');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0147
     * @tc.name linked_Blocking_Queue_Test_static_022
     * @tc.desc Verify bigint element addition makes queue reach full capacity with mixed int|bigint elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_Test_static_022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1 = new containers.LinkedBlockingQueue<int | bigint>(10);
      for (let i:int = 0; i < 9; i++) {
        queueIntPop1.push(i);
      }
      let big1: bigint = 123456789012345678901234567890n;
      queueIntPop1.add(big1);
      let res1 = queueIntPop1.size;
      expect(String(res1)).assertEqual('10');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0148
     * @tc.name linked_Blocking_Queue_Test_static_023
     * @tc.desc Verify boolean element addition makes queue reach full capacity (size=10) with mixed int|boolean elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_Test_static_023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1 = new containers.LinkedBlockingQueue<int | boolean>(10);
      for (let i:int = 0; i < 9; i++) {
        queueIntPop1.push(i);
      }
      queueIntPop1.add(true);
      let res1 = queueIntPop1.size;
      expect(String(res1)).assertEqual('10');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0149
     * @tc.name linked_Blocking_Queue_Test_static_024
     * @tc.desc Verify custom class instance can be added and retrieved from generic queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_Test_static_024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queue: containers.LinkedBlockingQueue<TestClass> = new containers.LinkedBlockingQueue<TestClass>();
      const obj = new TestClass();
      queue.add(obj);
      expect(queue.pop()).assertEqual(obj);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0150
     * @tc.name linked_Blocking_Queue_Test_static_025
     * @tc.desc Verify array element addition maintains correct queue size (size=1) with array<int> element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_Test_static_025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1 = new containers.LinkedBlockingQueue<int | Array<int>>(10);
      let arr = new Array<int>(10);
      for (let i:int = 0; i < 10; i++) {
        arr[i] = i;
      }
      queueIntPop1.add(arr);
      let res1 = queueIntPop1.size;
      expect(String(res1)).assertEqual('1');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0151
     * @tc.name linked_Blocking_Queue_Test_static_026
     * @tc.desc Verify complex object addition makes queue reach full capacity (size=10) with mixed property objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_Test_static_026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueObjPop1: containers.LinkedBlockingQueue<QueueItem> = new containers.LinkedBlockingQueue<QueueItem>(10);

      for (let i:int = 0; i < 9; i++) {
        queueObjPop1.push({
          value: i, type: "number"
        });
      }
      queueObjPop1.add({
        flag: true, type: "boolean"
      });
      let res1 = queueObjPop1.size;
      expect(String(res1)).assertEqual('10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0152
     * @tc.name linked_Blocking_Queue_Test_static_027
     * @tc.desc Verify single element addition in default-sized queue updates size correctly (size=1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_Test_static_027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      queueIntPop1.add(0);
      let res1 = queueIntPop1.size;
      expect(String(res1)).assertEqual('1');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0153
     * @tc.name linked_Blocking_Queue_Test_static_028
     * @tc.desc Verify fixed-capacity queue (capacity=2) reaches full size with push+add operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_Test_static_028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(2);
      queueIntPop1.push(0);
      queueIntPop1.add(1);
      let res1 = queueIntPop1.size;
      expect(String(res1)).assertEqual('2');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0154
     * @tc.name linked_Blocking_Queue_Test_static_029
     * @tc.desc Verify element removal reduces queue size correctly (size=8) after initial 9 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_Test_static_029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      for (let i:int = 0; i < 9; i++) {
        queueIntPop1.push(i);
      }
      queueIntPop1.pop();
      let res1 = queueIntPop1.size;
      expect(String(res1)).assertEqual('8');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_00154
     * @tc.name linked_Blocking_Queue_Test_static_030
     * @tc.desc Create a task to operate on a LinkedBlockingQueue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_Test_static_030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let queueInt: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      let t = new taskpool.Task((queueIntTemp: containers.LinkedBlockingQueue<int>) => {
        for (let i:int = 0; i < 10; i++) {
          queueInt.push(i);
        }
      }, queueInt);
      await taskpool.execute(t);
      expect(String(queueInt.size)).assertEqual('10');
      queueInt.push(10);
      expect(String(queueInt.size)).assertEqual('11');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0155
     * @tc.name linked_Blocking_Queue_Test_static_031
     * @tc.desc Verify string element removal results in empty queue (size=0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_Test_static_031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1 = new containers.LinkedBlockingQueue<int | string>(10);
      queueIntPop1.push("");
      queueIntPop1.pop();
      let res1 = queueIntPop1.size;
      expect(String(res1)).assertEqual('0');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0156
     * @tc.name linked_Blocking_Queue_Test_static_032
     * @tc.desc Verify null element removal results in empty queue (size=0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_Test_static_032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1 = new containers.LinkedBlockingQueue<int | null>(10);
      queueIntPop1.push(null);
      queueIntPop1.pop();
      let res1 = queueIntPop1.size;
      expect(String(res1)).assertEqual('0');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0157
     * @tc.name linked_Blocking_Queue_Test_static_033
     * @tc.desc Verify undefined element removal results in empty queue (size=0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_Test_static_033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1 = new containers.LinkedBlockingQueue<int | undefined>(10);
      queueIntPop1.push(undefined);
      queueIntPop1.pop();
      let res1 = queueIntPop1.size;
      expect(String(res1)).assertEqual('0');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0158
     * @tc.name linked_Blocking_Queue_Test_static_034
     * @tc.desc Verify single element queue becomes empty after pop operation (size=0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_Test_static_034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1 = new containers.LinkedBlockingQueue<int>(1);
      queueIntPop1.push(0);
      queueIntPop1.pop();
      let res1 = queueIntPop1.size;
      expect(String(res1)).assertEqual('0');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0159
     * @tc.name linked_Blocking_Queue_Test_static_035
     * @tc.desc Verify under-capacity operation maintains correct size (capacity=2, size=0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_Test_static_035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(2);
      queueIntPop1.push(0);
      queueIntPop1.pop();
      let res1 = queueIntPop1.size;
      expect(String(res1)).assertEqual('0');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0160
     * @tc.name linked_Blocking_Queue_Test_static_036
     * @tc.desc Verify under-capacity operation maintains correct size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_Test_static_036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      for (let i:int = 0; i < 10; i++) {
        queueIntPop1.push(i);
      }
      queueIntPop1.pop();
      let res1 = queueIntPop1.size;
      expect(String(res1)).assertEqual('9');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0161
     * @tc.name linked_Blocking_Queue_Test_static_037
     * @tc.desc Verify under-capacity operation maintains correct size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_Test_static_037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      for (let i:int = 0; i < 10; i++) {
        queueIntPop1.push(i);
      }
      for (let i:int = 0; i < 9; i++) {
        queueIntPop1.pop();
      }
      let res1 = queueIntPop1.size;
      expect(String(res1)).assertEqual('1');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_linkedBlockingQueueTest_0162
     * @tc.name linked_Blocking_Queue_Test_static_038
     * @tc.desc Verify under-capacity operation maintains correct size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_Test_static_038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
      for (let i:int = 0; i < 10; i++) {
        queueIntPop1.push(i);
      }
      for (let i:int = 0; i < 10; i++) {
        queueIntPop1.pop();
      }
      let res1 = queueIntPop1.size;
      expect(String(res1)).assertEqual('0');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedBlockingQueueNoParameterTest_0163
     * @tc.name linked_Blocking_Queue_NoParameterTest_static_0001
     * @tc.desc Test LinkedBlockingQueue constructor with capacity 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_NoParameterTest_static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {

      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      let res = queueIntPop1.size;
      expect(String(res)).assertEqual('0');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedBlockingQueueNoParameterTest_0164
     * @tc.name linked_Blocking_Queue_NoParameterTest_static_002
     * @tc.desc Test adding single element to empty LinkedBlockingQueue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_NoParameterTest_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      queueIntPop1.add(1);
      let res = queueIntPop1.size;
      expect(String(res)).assertEqual('1');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedBlockingQueueNoParameterTest_0165
     * @tc.name linked_Blocking_Queue_NoParameterTest_static_005
     * @tc.desc Test LinkedBlockingQueue constructor with empty array iterable and capacity 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_NoParameterTest_static_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arr = new Array<int>(0);
      let iter = arr.values();
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10, iter)
      let res = queueIntPop1.capacity;
      expect(String(res)).assertEqual('10');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedBlockingQueueNoParameterTest_0166
     * @tc.name linked_Blocking_Queue_NoParameterTest_static_006
     * @tc.desc Test LinkedBlockingQueue constructor with empty array iterable.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_NoParameterTest_static_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arr = new Array<int>(0);
      let iter = arr.values();
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(iter);
      let res = queueIntPop1.size;
      expect(String(res)).assertEqual('0');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedBlockingQueueNoParameterTest_0167
     * @tc.name linked_Blocking_Queue_NoParameterTest_static_007
     * @tc.desc Test isEmpty() with empty LinkedBlockingQueue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_NoParameterTest_static_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arr = new Array<int>(0);
      let iter = arr.values();
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(iter);
      let res = queueIntPop1.isEmpty();
      expect(String(res)).assertEqual('true');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedBlockingQueueNoParameterTest_0168
     * @tc.name linked_Blocking_Queue_NoParameterTest_static_008
     * @tc.desc Test LinkedBlockingQueue constructor with empty Set iterable and capacity 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_NoParameterTest_static_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let emptySet = new Set<int>();
      let iter = emptySet.values();
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10, iter)
      let res = queueIntPop1.capacity;
      expect(String(res)).assertEqual(`10`);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedBlockingQueueNoParameterTest_0169
     * @tc.name linked_Blocking_Queue_NoParameterTest_static_009
     * @tc.desc Test LinkedBlockingQueue constructor with single-element array iterable and capacity 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_NoParameterTest_static_009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let emptySet = new Set<int>();
      let iter = emptySet.values();
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(iter);
      let res = queueIntPop1.size;
      expect(String(res)).assertEqual('0');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedBlockingQueueNoParameterTest_0170
     * @tc.name linked_Blocking_Queue_NoParameterTest_static_010
     * @tc.desc Test LinkedBlockingQueue constructor with single-element array iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_NoParameterTest_static_010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let emptySet = new Set<int>();
      let iter = emptySet.values();
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(iter);
      let res = queueIntPop1.isEmpty();
      expect(String(res)).assertEqual('true');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedBlockingQueueNoParameterTest_0171
     * @tc.name linked_Blocking_Queue_NoParameterTest_static_011
     * @tc.desc Test LinkedBlockingQueue constructor with single-element array iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_NoParameterTest_static_011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arr = new Array<int>(1);
      arr[0] = 0;
      let iter = arr.values();
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10, iter)
      let res = queueIntPop1.capacity;
      expect(String(res)).assertEqual('10');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedBlockingQueueNoParameterTest_0172
     * @tc.name linked_Blocking_Queue_NoParameterTest_static_012
     * @tc.desc Test LinkedBlockingQueue constructor with single-element array iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_NoParameterTest_static_012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arr = new Array<int>(1);
      arr[0] = 0;
      let iter = arr.values();
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(iter);
      let res = queueIntPop1.size;
      expect(String(res)).assertEqual('1');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedBlockingQueueNoParameterTest_0173
     * @tc.name linked_Blocking_Queue_NoParameterTest_static_013
     * @tc.desc Test LinkedBlockingQueue constructor with single-element array iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_NoParameterTest_static_013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arr = new Array<int>(1);
      arr[0] = 0;
      let iter = arr.values();
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(iter);
      let res = queueIntPop1.isEmpty();
      expect(String(res)).assertEqual('false');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedBlockingQueueNoParameterTest_0174
     * @tc.name linked_Blocking_Queue_NoParameterTest_static_014
     * @tc.desc Test getFirst() with single-element LinkedBlockingQueue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_NoParameterTest_static_014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arr = new Array<int>(1);
      arr[0] = 0;
      let iter = arr.values();
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(iter);
      let res = queueIntPop1.getFirst();
      expect(String(res)).assertEqual('0');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedBlockingQueueNoParameterTest_0175
     * @tc.name linked_Blocking_Queue_NoParameterTest_static_015
     * @tc.desc Test poll() removes element from single-element LinkedBlockingQueue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_NoParameterTest_static_015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arr = new Array<int>(1);
      arr[0] = 0;
      let iter = arr.values();
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(iter);
      queueIntPop1.poll();
      let res = queueIntPop1.isEmpty();
      expect(String(res)).assertEqual('true');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedBlockingQueueNoParameterTest_0176
     * @tc.name linked_Blocking_Queue_NoParameterTest_static_016
     * @tc.desc Test LinkedBlockingQueue constructor with 1000-element array iterable and capacity 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_NoParameterTest_static_016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arr = new Array<int>(1000);
      for (let i:int = 0; i < 1000; i++) {
        arr[i] = i;
      }
      let iter = arr.values();
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(1000, iter)
      let res = queueIntPop1.capacity;
      expect(String(res)).assertEqual('1000');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedBlockingQueueNoParameterTest_0177
     * @tc.name linked_Blocking_Queue_NoParameterTest_static_017
     * @tc.desc Test LinkedBlockingQueue constructor with 1000-element array iterable and capacity 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_NoParameterTest_static_017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arr = new Array<int>(1000);
      for (let i:int = 0; i < 1000; i++) {
        arr[i] = i;
      }
      let iter = arr.values();
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(iter);
      let res = queueIntPop1.size;
      expect(String(res)).assertEqual('1000');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedBlockingQueueNoParameterTest_0178
     * @tc.name linked_Blocking_Queue_NoParameterTest_static_018
     * @tc.desc Test LinkedBlockingQueue constructor with array iterable and capacity 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_NoParameterTest_static_018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arr = new Array<null>(0);
      let queueIntPop1 = new containers.LinkedBlockingQueue<null>(arr);
      let res = queueIntPop1.size;
      expect(String(res)).assertEqual('0');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedBlockingQueueNoParameterUndefinedTest_0180
     * @tc.name linked_Blocking_Queue_NoParameterUndefinedTest_static_018
     * @tc.desc Test LinkedBlockingQueue constructor with empty undefined array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_NoParameterUndefinedTest_static_018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arr = new Array<undefined>(0);
      let queueIntPop1 = new containers.LinkedBlockingQueue<undefined>(arr);
      let res = queueIntPop1.size;
      expect(String(res)).assertEqual('0');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedBlockingQueueNoParameterTest_0186
     * @tc.name linked_Blocking_Queue_NoParameterTest_static_024
     * @tc.desc Test LinkedBlockingQueue constructor with empty Map values iterable.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_NoParameterTest_static_024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arr = new Map<string, int>();
      let iter = arr.values();
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(iter);
      let res = queueIntPop1.size;
      expect(String(res)).assertEqual('0');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedBlockingQueueNoParameterTest_0187
     * @tc.name linked_Blocking_Queue_NoParameterTest_static_025
     * @tc.desc Test LinkedBlockingQueue constructor with empty Map values iterable and capacity 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_NoParameterTest_static_025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arr = new Map<string, int>();
      let iter = arr.values();
      let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10, iter);
      let res = queueIntPop1.capacity;
      expect(String(res)).assertEqual('10');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_linkedBlockingQueueNoParameterTest_0189
     * @tc.name linked_Blocking_Queue_NoParameterTest_static_027
     * @tc.desc Test LinkedBlockingQueue constructor with empty nested array iterable.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_NoParameterTest_static_027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arr = new Array<Array<int>>();
      let iter = arr.values();
      let queueIntPop1 = new containers.LinkedBlockingQueue<Array<int>>(iter);
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
        const queue = new containers.LinkedBlockingQueue<number>(-1);
        const actualCapacity = queue.capacity;
        expect(String(actualCapacity)).assertEqual('0');
        queue.add(1);
        const actualSize = queue.size;
        expect(String(actualSize)).assertEqual('1');
      } catch (error) {
        expect(error instanceof Error).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_setCapacityWithTest_0191
     * @tc.name setCapacityWithTest_static_002
     * @tc.desc A queue with a capacity of0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("setCapacityWithTest_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const queue = new containers.LinkedBlockingQueue<number>(0);
        const actualCapacity = queue.capacity;
        expect(String(actualCapacity)).assertEqual('0');
        queue.add(1);
        const actualSize = queue.size;
        expect(String(actualSize)).assertEqual('1');
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
      try {
        const queue = new containers.LinkedBlockingQueue<number>(1);
        const actualCapacity = queue.capacity;
        expect(String(actualCapacity)).assertEqual('1');
        queue.add(1);
        const actualSize = queue.size;
        expect(String(actualSize)).assertEqual('1');
        try {
          queue.add(2);
        } catch (error) {
          expect(error instanceof Error).assertTrue();
        }
      } catch (error) {
        expect(error instanceof Error).assertTrue();
      }
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
      try {
        const queue: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(2147483647);
        const actualCapacity = queue.capacity;
        expect(String(actualCapacity)).assertEqual(String(Integer.MAX_VALUE));
        for (let i:int = 0; i < 100; i++) {
          queue.add(i);
        }
        const actualSize = queue.size;
        expect(String(actualSize)).assertEqual('100');
      } catch (error) {
        expect(error instanceof Error).assertTrue();
      }
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
        let intMax = 2147483647;
        const queue: containers.LinkedBlockingQueue<number> = new containers.LinkedBlockingQueue<number>(intMax + 1);
        const actualCapacity = queue.capacity;
        expect(String(actualCapacity)).assertEqual(String(Integer.MAX_VALUE));
        for (let i:int = 0; i < 100; i++) {
          queue.add(i);
        }
        const actualSize = queue.size;
        expect(String(actualSize)).assertEqual('100');
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
      try {
        const queue = new containers.LinkedBlockingQueue<number>(10);
        const actualSize = queue.size;
        expect(String(actualSize)).assertEqual('0');
      } catch (error) {
        expect(error instanceof Error).assertTrue();
      }
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
      try {
        const queue = new containers.LinkedBlockingQueue<number>(100);
        for (let i:int = 0; i < 100; i++) {
          queue.add(i);
        }
        let actualSize = queue.size;
        expect(String(actualSize)).assertEqual('100');
      } catch (error) {
        expect(error instanceof Error).assertTrue();
      }
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
      try {
        const queue = new containers.LinkedBlockingQueue<number>(100);
        for (let i:int = 0; i < 100; i++) {
          queue.push(i);
        }
        let actualSize = queue.size;
        expect(String(actualSize)).assertEqual('100');
        for (let i:int = 0; i < 50; i++) {
          queue.pop();
        }
        actualSize = queue.size;
        expect(String(actualSize)).assertEqual('50');
      } catch (error) {
        expect(error instanceof Error).assertTrue();
      }
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
      try {
        const queue = new containers.LinkedBlockingQueue<number>(100);
        for (let i:int = 0; i < 100; i++) {
          queue.add(i);
        }
        let actualSize = queue.size;
        expect(String(actualSize)).assertEqual('100');
        for (let i:int = 0; i < 50; i++) {
          queue.poll();
        }
        actualSize = queue.size;
        expect(String(actualSize)).assertEqual('50');
      } catch (error) {
        expect(error instanceof Error).assertTrue();
      }
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
      try {
        const queue = new containers.LinkedBlockingQueue<number>(1);
        queue.add(1);
        const actualSize = queue.size;
        expect(String(actualSize)).assertEqual('1');
      } catch (error) {
        expect(error instanceof Error).assertTrue();
      }
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
      try {
        const queue = new containers.LinkedBlockingQueue<number>(2);
        queue.push(1);
        queue.push(2);
        setTimeout(() => {
          queue.poll();
        }, 1000);
        console.log("Attempting to push to a full queue...");
        queue.push(3);
        const actualSize = queue.size;
        expect(String(actualSize)).assertEqual('2');
      } catch (error) {
        expect(error instanceof Error).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_pushWithTest_0201
     * @tc.name pushWithTest_static_002
     * @tc.desc Test the insertion of empty strings, null, and undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("pushWithTest_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const queue = new containers.LinkedBlockingQueue<int | undefined | null | string>(4);
        queue.push("");
        queue.push(null);
        queue.push(undefined);
        queue.push(42);
        const actualSize = queue.size;
        expect(String(actualSize)).assertEqual('4');
        expect(queue.poll()).assertEqual("");
        expect(JSON.stringify(queue.poll())).assertEqual('null');
        expect(queue.poll()).assertUndefined();
        expect(String(queue.poll())).assertEqual('42');
      } catch (error) {
        expect(error instanceof Error).assertTrue();
      }
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
      try {
        const queue = new containers.LinkedBlockingQueue<string>(1);
        queue.push("Hello, World!");
        const actualSize = queue.size;
        expect(String(actualSize)).assertEqual('1');
        expect(queue.poll()).assertEqual("Hello, World!");
      } catch (error) {
        expect(error instanceof Error).assertTrue();
      }
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
      try {
        const queue = new containers.LinkedBlockingQueue<BigInt>(1);
        const bigIntValue = BigInt(9007199254740991);
        queue.push(bigIntValue);
        const actualSize = queue.size;
        expect(String(actualSize)).assertEqual('1');
        expect(String(queue.poll())).assertEqual(String(bigIntValue));
      } catch (error) {
        expect(error instanceof Error).assertTrue();
      }
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
      try {
        const queue = new containers.LinkedBlockingQueue<boolean>(1);
        queue.push(true);
        const actualSize = queue.size;
        expect(String(actualSize)).assertEqual('1');
        expect(queue.poll()).assertTrue();
      } catch (error) {
        expect(error instanceof Error).assertTrue();
      }
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
      try {
        const queue = new containers.LinkedBlockingQueue<CustomClass1>(1);
        const customInstance = new CustomClass1("TestInstance");
        queue.push(customInstance);
        const actualSize = queue.size;
        expect(String(actualSize)).assertEqual('1');
        const polledValue = queue.poll();
        expect(polledValue!.name).assertEqual("TestInstance");
      } catch (error) {
        expect(error instanceof Error).assertTrue();
      }
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
      try {
        const queue = new containers.LinkedBlockingQueue<int[]>(1);
        queue.push([1, 2, 3]);
        const actualSize = queue.size;
        expect(String(actualSize)).assertEqual('1');
        expect(JSON.stringify(queue.poll())).assertEqual(JSON.stringify([1, 2, 3]));
      } catch (error) {
        expect(error instanceof Error).assertTrue();
      }
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
      try {
        const queue = new containers.LinkedBlockingQueue<object>(1);

        const objectValue: objectValueType = {
          key: "value"
        };
        queue.push(objectValue);
        const actualSize = queue.size;
        expect(String(actualSize)).assertEqual('1');
      } catch (error) {
        expect(error instanceof Error).assertTrue();
      }
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
      try {
        const queue = new containers.LinkedBlockingQueue<number>(5);
        queue.push(42);
        const actualSize = queue.size;
        expect(String(actualSize)).assertEqual('1');
      } catch (error) {
        expect(error instanceof Error).assertTrue();
      }
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
      try {
        const queue = new containers.LinkedBlockingQueue<number>(1);
        queue.push(42);
        const actualSize = queue.size;
        expect(String(actualSize)).assertEqual('1');
      } catch (error) {
        expect(error instanceof Error).assertTrue();
      }
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
      try {
        const capacity = 5;
        const queue = new containers.LinkedBlockingQueue<number>(capacity);
        for (let i:int = 0; i < capacity - 1; i++) {
          queue.push(i);
        }
        const actualSize = queue.size;
        expect(String(actualSize)).assertEqual(String(capacity - 1));
      } catch (error) {
        expect(error instanceof Error).assertTrue();
      }
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
      try {
        const queue = new containers.LinkedBlockingQueue<number>(10);
        queue.push(42);
        const actualSize = queue.size;
        expect(String(actualSize)).assertEqual('1');
      } catch (error) {
        expect(error instanceof Error).assertTrue();
      }
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
      try {
        const capacity = 10;
        const queue = new containers.LinkedBlockingQueue<number>(capacity);
        for (let i:int = 0; i < capacity - 1; i++) {
          queue.push(i);
        }
        const actualSize = queue.size;
        expect(String(actualSize)).assertEqual(String(capacity - 1));
      } catch (error) {
        expect(error instanceof Error).assertTrue();
      }
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
      try {
        const capacity = 10;
        const queue = new containers.LinkedBlockingQueue<number>(capacity);
        for (let i:int = 0; i < capacity; i++) {
          queue.push(i);
        }
        const actualSize = queue.size;
        expect(String(actualSize)).assertEqual(String(capacity));
      } catch (error) {
        expect(error instanceof Error).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_linkedBLockingQueuePerformanceTest_0214
     * @tc.name linked_Blocking_Queue_PerformanceTest_static_001
     * @tc.desc 10 concurrent operations simultaneously add elements to the container.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_PerformanceTest_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const threadCount = loopTenTimes;
      const taskGroup = new taskpool.TaskGroup();
      let queueInt: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(threadCount);
      for (let i: int = 0; i < threadCount; i++) {
        taskGroup.addTask(createAddTask(queueInt, i));
      }
      await taskpool.execute(taskGroup);
      expect(JSON.stringify(queueInt.size)).assertEqual(JSON.stringify(threadCount));
      expect(queueInt.isEmpty()).assertFalse();
      done();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_linkedBLockingQueuePerformanceTest_0215
     * @tc.name linked_Blocking_Queue_PerformanceTest_static_002
     * @tc.desc Initial container 100 elements, 10 concurrent simultaneous operation of the container to delete and remove elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_PerformanceTest_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const totalCount: int = 100;
      const numbers: Array<int> = new Array<int>(100);
      for (let i:int = 0; i < totalCount; i++) {
        numbers.push(i);
      }
      const threadCount = 10;
      const taskGroup = new taskpool.TaskGroup();
      let iter = numbers.values();
      let queueInt: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(totalCount, iter);
      for (let i: int = 0; i < threadCount; i++) {
        taskGroup.addTask(createPopTask(queueInt));
      }
      await taskpool.execute(taskGroup);
      expect(JSON.stringify(queueInt.size)).assertEqual(JSON.stringify(totalCount - threadCount));
      expect(queueInt.isEmpty()).assertFalse();
      done();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_linkedBLockingQueuePerformanceTest_0216
     * @tc.name linked_Blocking_Queue_PerformanceTest_static_003
     * @tc.desc Initial container with 100 elements. Ten concurrent operations simultaneously operate on the container to perform element deletion (poll operation).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_PerformanceTest_static_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const totalCount: int = 100;
      const numbers: Array<int> = new Array<int>(100);
      for (let i:int = 0; i < totalCount; i++) {
        numbers.push(i);
      }
      const threadCount = 10;
      const taskGroup = new taskpool.TaskGroup();
      let iter = numbers.values();
      let queueInt: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(totalCount, iter);
      for (let i: int = 0; i < threadCount; i++) {
        taskGroup.addTask(createPollTask(queueInt));
      }
      await taskpool.execute(taskGroup);
      expect(JSON.stringify(queueInt.size)).assertEqual(JSON.stringify(totalCount - threadCount));
      expect(queueInt.isEmpty()).assertFalse();
      done();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_linkedBLockingQueueTest_0217
     * @tc.name linked_Blocking_Queue_PerformanceTest_static_004
     * @tc.desc Push 100 data, poll 100 data.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_PerformanceTest_static_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const totalCount: int = 100;
      let queueInt: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(totalCount);
      for (let i: int = 0; i < totalCount; i++) {
        queueInt.push(i);
      }
      for (let i: int = 0; i < totalCount; i++) {
        queueInt.poll();
      }
      expect(JSON.stringify(queueInt.size)).assertEqual('0');
      expect(queueInt.isEmpty()).assertTrue();
      done();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_linkedBLockingQueuePerformanceTest_0218
     * @tc.name linked_Blocking_Queue_PerformanceTest_static_005
     * @tc.desc add 100 pieces of data, pop 100 pieces of data.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_PerformanceTest_static_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const totalCount: int = 100;
      let queueInt: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(totalCount);
      for (let i: int = 0; i < totalCount; i++) {
        queueInt.add(i);
      }
      for (let i: int = 0; i < totalCount; i++) {
        queueInt.pop();
      }
      expect(JSON.stringify(queueInt.size)).assertEqual('0');
      expect(queueInt.isEmpty()).assertTrue();
      done();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_linkedBLockingQueueAsyncTest_0219
     * @tc.name linked_Blocking_Queue_AsyncTest_static_001
     * @tc.desc The host thread adds 1000 pieces of data, and 10 threads poll out the data at the same time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_AsyncTest_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const totalCount: int = thousandTimes;
      const taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      let queueInt: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(totalCount);
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_linkedBLockingQueueAsyncTest_0220
     * @tc.name linked_Blocking_Queue_AsyncTest_static_002
     * @tc.desc Multi-thread (10) push inserts a total of 1000 data, and the host thread pops out the data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_AsyncTest_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const totalCount: int = thousandTimes;
      const taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      let queueInt: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(totalCount);
      for (let i: int = 0; i < totalCount; i++) {
        queueInt.push(i);
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_linkedBLockingQueueAsyncTest_0221
     * @tc.name linked_Blocking_Queue_AsyncTest_static_003
     * @tc.desc Multi-threaded operation. Thread A inserts data, and thread B takes out data.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_AsyncTest_static_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const totalCount: int = 100;
      const taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      let queueInt: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(totalCount);
      taskGroup.addTask(createPushTaskStart(queueInt, totalCount));
      taskGroup.addTask(createPopTaskStart(queueInt, totalCount));
      await taskpool.execute(taskGroup);
      expect(JSON.stringify(queueInt.size)).assertEqual('0');
      expect(queueInt.isEmpty()).assertTrue();
      done();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_linkedBLockingQueueAsyncTest_0222
     * @tc.name linked_Blocking_Queue_AsyncTest_static_004
     * @tc.desc Threads add elements simultaneously to verify the thread safety of the queue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_AsyncTest_static_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      let queueInt: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(100);
      for (let i:int = 0; i < loopTenTimes; i++) {
        taskGroup.addTask(createPushTaskStartLoopTen(queueInt, i));
      }
      await taskpool.execute(taskGroup);
      expect(JSON.stringify(queueInt.size)).assertEqual(JSON.stringify(loopTenTimes * 10));
      expect(queueInt.isEmpty()).assertFalse();
      done();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_linkedBLockingQueueAsyncTest_0223
     * @tc.name linked_Blocking_Queue_AsyncTest_static_005
     * @tc.desc:Preset 1000 pieces of data, 10 threads remove elements at the same time, verify the thread safety of the queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_AsyncTest_static_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const totalCount: int = thousandTimes;
      const taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      let queueInt: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(totalCount);
      for (let i:int = 0; i < totalCount; i++) {
        queueInt.add(i);
      }
      expect(JSON.stringify(queueInt.size)).assertEqual(JSON.stringify(totalCount));
      for (let i:int = 0; i < 10; i++) {
        taskGroup.addTask(createPollTaskHundred(queueInt, i * hundredTimes));
      }
      await taskpool.execute(taskGroup);
      expect(JSON.stringify(queueInt.size)).assertEqual('0');
      expect(queueInt.isEmpty()).assertTrue();
      done();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_linkedBLockingQueueAsyncTest_0225
     * @tc.name linked_Blocking_Queue_AsyncTest_static_007
     * @tc.desc 10 thread A and 10 thread B. Each thread calls add(element) or poll() 1,000 times.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_AsyncTest_static_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const totalCount: int = thousandTimes;
      const taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      const taskGroupPoll: taskpool.TaskGroup = new taskpool.TaskGroup();
      let queueInt: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(totalCount);

      for (let i:int = 0; i < loopTenTimes; i++) {
        taskGroup.addTask(createAddTaskHundred(queueInt, i * hundredTimes));
      }
      await taskpool.execute(taskGroup);
      expect(JSON.stringify(queueInt.size)).assertEqual(JSON.stringify(loopTenTimes * hundredTimes));
      for (let i:int = 0; i < loopTenTimes; i++) {
        taskGroupPoll.addTask(createPollTaskHundred(queueInt, i * hundredTimes));
      }
      await taskpool.execute(taskGroupPoll);
      expect(JSON.stringify(queueInt.size)).assertEqual('0');
      done();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_linkedBLockingQueueAsyncTest_0226
     * @tc.name linked_Blocking_Queue_AsyncTest_static_008
     * @tc.desc 10 threads A and 10 threads B, each calling push (element) or pop () 1,000 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_AsyncTest_static_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const totalCount: int = thousandTimes;
      const taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      const taskPopGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      let queueInt: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(totalCount);

      for (let i:int = 0; i < loopTenTimes; i++) {
        taskGroup.addTask(createPushTaskHundred(queueInt, i * hundredTimes));
      }
      await taskpool.execute(taskGroup);
      expect(JSON.stringify(queueInt.size)).assertEqual(JSON.stringify(loopTenTimes * hundredTimes));
      for (let i:int= 0; i < loopTenTimes; i++) {
        taskPopGroup.addTask(createPopTaskHundred(queueInt, i * hundredTimes));
      }
      await taskpool.execute(taskPopGroup);
      expect(JSON.stringify(queueInt.size)).assertEqual('0');
      done();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_linkedBLockingQueueAsyncTest_0227
     * @tc.name linked_Blocking_Queue_AsyncTest_static_009
     * @tc.desc Start multiple threads, each thread initializing the queue with a different iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_AsyncTest_static_009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      const iterArrays: Array<IterableIterator<int>> = new Array<IterableIterator<int>>();
      const set: Set<int> = new Set<int>();
      const arrays: Array<Set<int>> = new Array<Set<int>>();
      for (let i:int = 0; i < 10; i++) {
        set.add(i);
        arrays.push(set);
      }
      for (let i:int = 0; i < arrays.length; i++) {
        let iter = arrays[i].values();
        taskGroup.addTask(createLinkedBlockingQueueFromIterTask(iter));
      }
      const linkedBlockingQueues = await taskpool.execute(taskGroup);
      expect(JSON.stringify(linkedBlockingQueues.length)).assertEqual('10');
      done();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LinkedBlockingQueueGetEndTest_0228
     * @tc.name linked_Blocking_Queue_GetEndTest_static_001
     * @tc.desc Query to obtain the tail element without changing the queue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_GetEndTest_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
        let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
        for (let i:int = 0; i < 10; i++) {
            queueIntPop1.push(i);
        }
        let res = queueIntPop1.getEnd();
        let res1 = queueIntPop1.size;
        expect(JSON.stringify(res)).assertEqual('9');
        expect(JSON.stringify(res1)).assertEqual('10');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LinkedBlockingQueueGetEndTest_0229
     * @tc.name linked_Blocking_Queue_GetEndTest_static_002
     * @tc.desc Elements are "" special characters..
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_GetEndTest_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
        let queueIntPop1: containers.LinkedBlockingQueue<int| string> = new containers.LinkedBlockingQueue<int | string>(10);
        queueIntPop1.add("");
        let res = queueIntPop1.getEnd();
        let res1 = queueIntPop1.size;
        expect(res).assertEqual("");
        expect(JSON.stringify(res1)).assertEqual('1');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LinkedBlockingQueueGetEndTest_0230
     * @tc.name linked_Blocking_Queue_GetEndTest_static_003
     * @tc.desc Elements are null special characters.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_GetEndTest_static_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
        let queueIntPop1: containers.LinkedBlockingQueue<int | null> = new containers.LinkedBlockingQueue<int | null>(10);
        queueIntPop1.add(null);
        let res = queueIntPop1.getEnd();
        let res1 = queueIntPop1.size;
        expect(JSON.stringify(res)).assertEqual('null');
        expect(JSON.stringify(res1)).assertEqual('1');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LinkedBlockingQueueGetEndTest_0231
     * @tc.name linked_Blocking_Queue_GetEndTest_static_004
     * @tc.desc Elements are undefined special characters.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_GetEndTest_static_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
        let queueIntPop1: containers.LinkedBlockingQueue<int | undefined> = new containers.LinkedBlockingQueue<int | undefined>(10);
        queueIntPop1.add(undefined);
        let res = queueIntPop1.getEnd();
        let res1 = queueIntPop1.size;
        expect(JSON.stringify(res)).assertEqual('undefined');
        expect(JSON.stringify(res1)).assertEqual('1');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LinkedBlockingQueueGetEndTest_0232
     * @tc.name linked_Blocking_Queue_GetEndTest_static_005
     * @tc.desc empty queue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_GetEndTest_static_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
        let queueIntPop1: containers.LinkedBlockingQueue<int | undefined> = new containers.LinkedBlockingQueue<int | undefined>(10);
        let res = queueIntPop1.getEnd();
        let res1 = queueIntPop1.size;
        expect(JSON.stringify(res)).assertEqual('undefined');
        expect(JSON.stringify(res1)).assertEqual('0');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LinkedBlockingQueueGetEndTest_0233
     * @tc.name linked_Blocking_Queue_GetEndTest_static_006
     * @tc.desc Queue with capacity 1,Query to obtain the tail element without changing the queue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_GetEndTest_static_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
        let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(1);
        queueIntPop1.add(1);
        let res = queueIntPop1.getEnd();
        let res1 = queueIntPop1.size;
        expect(JSON.stringify(res)).assertEqual('1');
        expect(JSON.stringify(res1)).assertEqual('1');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LinkedBlockingQueueGetEndTest_0234
     * @tc.name linked_Blocking_Queue_GetEndTest_static_007
     * @tc.desc Queue with capacity -1,Query to obtain the tail element without changing the queue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_GetEndTest_static_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
        let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(2);
        queueIntPop1.add(1);
        let res = queueIntPop1.getEnd();
        let res1 = queueIntPop1.size;
        expect(JSON.stringify(res)).assertEqual('1');
        expect(JSON.stringify(res1)).assertEqual('1');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LinkedBlockingQueueGetEndTest_0235
     * @tc.name linked_Blocking_Queue_GetEndTest_static_008
     * @tc.desc Queue with capacity -1,Query to obtain the tail element without changing the queue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_GetEndTest_static_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
        let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
        queueIntPop1.add(1);
        let res1 = queueIntPop1.size;
        expect(JSON.stringify(res1)).assertEqual('1');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LinkedBlockingQueueGetEndTest_0236
     * @tc.name linked_Blocking_Queue_GetEndTest_static_009
     * @tc.desc Queue with capacity 10,Add one element and obtain the actualSize assertion.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_GetEndTest_static_009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
        let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
        queueIntPop1.add(1);
        let res1 = queueIntPop1.size;
        expect(JSON.stringify(res1)).assertEqual('1');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LinkedBlockingQueueGetEndTest_0237
     * @tc.name linked_Blocking_Queue_GetEndTest_static_010
     * @tc.desc Queue with capacity 10 ,Add capacity-1 elements and obtain the actualSize assertion.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */0
    it("linked_Blocking_Queue_GetEndTest_static_010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
        let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
        for (let i:int = 0; i < 9; i++) {
            queueIntPop1.add(i);
        }
        let res1 = queueIntPop1.size;
        expect(JSON.stringify(res1)).assertEqual('9');
    })

    /**9
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LinkedBlockingQueueGetEndTest_0238
     * @tc.name linked_Blocking_Queue_GetEndTest_static_011
     * @tc.desc Queue with capacity 10 ,Add capacity elements and obtain the actualSize assertion.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("linked_Blocking_Queue_GetEndTest_static_011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, ():void => {
        let queueIntPop1: containers.LinkedBlockingQueue<int> = new containers.LinkedBlockingQueue<int>(10);
        for (let i:int = 0; i < 10; i++) {i
            queueIntPop1.add(i);
        }
        let res1 = queueIntPop1.size;
        expect(JSON.stringify(res1)).assertEqual('10');
    })
  })
}