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

function createAddTask(queueTemp: containers.ArrayBlockingQueue<int>, data: int): taskpool.Task {
  return new taskpool.Task((queue: containers.ArrayBlockingQueue<int>, v: int) => {
    queue.add(v);
  }, queueTemp, data);
}

function createPushTask(queueTemp: containers.ArrayBlockingQueue<int>, data: int): taskpool.Task {
  return new taskpool.Task((queue: containers.ArrayBlockingQueue<int>, v: int) => {
    queue.push(v);
  }, queueTemp, data);
}

function createPushTaskStart(queueTemp: containers.ArrayBlockingQueue<int>, start: int): taskpool.Task {
  return new taskpool.Task((queue: containers.ArrayBlockingQueue<int>, s: int) => {
    for (let i = 0; i < s; i++) {
      queue.push(i);
    }
  }, queueTemp, start);
}

function createPushTaskStartLoopTen(queueTemp: containers.ArrayBlockingQueue<int>, start: int): taskpool.Task {
  return new taskpool.Task((queue: containers.ArrayBlockingQueue<int>, s: int) => {
    for (let i = s; i < s + 10; i++) {
      queue.push(i);
    }
  }, queueTemp, start);
}

function createPopTaskStart(queueTemp: containers.ArrayBlockingQueue<int>, start: int): taskpool.Task {
  return new taskpool.Task((queue: containers.ArrayBlockingQueue<int>, s: int) => {
    for (let i: int = 0; i < s; i++) {
      queue.pop();
    }
  }, queueTemp, start);
}

function createPollTask(queueTemp: containers.ArrayBlockingQueue<int>): taskpool.Task {
  return new taskpool.Task((queue: containers.ArrayBlockingQueue<int>) => {
    queue.poll();
  }, queueTemp);
}

function createPollTaskHundred(queueTemp: containers.ArrayBlockingQueue<int>, start: int): taskpool.Task {
  return new taskpool.Task((queue: containers.ArrayBlockingQueue<int>, s: int) => {
    for (let i: int = s; i < s + hundredTimes; i++) {
      queue.poll();
    }
  }, queueTemp, start);
}

function createAddTaskHundred(queueTemp: containers.ArrayBlockingQueue<int>, start: int): taskpool.Task {
  return new taskpool.Task((queue: containers.ArrayBlockingQueue<int>, s: int) => {
    for (let i: int = s; i < s + hundredTimes; i++) {
      queue.add(i);
    }
  }, queueTemp, start);
}

function createPopTask(queueTemp: containers.ArrayBlockingQueue<int>): taskpool.Task {
  return new taskpool.Task((queue: containers.ArrayBlockingQueue<int>) => {
    queue.pop();
  }, queueTemp);
}

function createPopTaskHundred(queueTemp: containers.ArrayBlockingQueue<int>, start: int): taskpool.Task {
  return new taskpool.Task((queue: containers.ArrayBlockingQueue<int>, s: int) => {
    for (let i: int = s; i < s + hundredTimes; i++) {
      queue.pop();
    }
  }, queueTemp, start);
}

function createPushTaskHundred(queueTemp: containers.ArrayBlockingQueue<int>, start: int): taskpool.Task {
  return new taskpool.Task((queue: containers.ArrayBlockingQueue<int>, s: int) => {
    for (let i: int = s; i < s + hundredTimes; i++) {
      queue.push(i);
    }
  }, queueTemp, start);
}

// The expected value is 100 and to prevent runtime timeout, change the value to 10.
const hundredTimes: int = 10;
// The expected value is 1000 and to prevent runtime timeout, change the value to 100.
const thousandTimes: int = 100;
// The expected value is 10 and to prevent runtime timeout, change the value to 2.
const loopTenTimes: int = 2;

const arrayWithNulls = new Array<Int | null | undefined>(1, null, 2, undefined, 3)

export default function ArrayBlockingQueuetest() {

  const thousandElementsArray = new Array<Int>()

  describe("ArrayBlockingQueue", (): void => {

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
      const queue = new containers.ArrayBlockingQueue<number>(initialCapacity);
      expect(String(queue.capacity)).assertEqual(String(initialCapacity));
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
      const queue = new containers.ArrayBlockingQueue<number>(10);
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
      (): void => {
        const queue = new containers.ArrayBlockingQueue<number>(1);
        expect(String(queue.capacity)).assertEqual('1');
        try {
          queue.push(1);
        } catch (error) {
          expect(false).assertEqual(true);
        }
        expect(String(queue.size)).assertEqual('1');
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
          const queue = new containers.ArrayBlockingQueue<number>(Int.MAX_VALUE + 1);
          throw new Error('Create queue with overflow capacity failed');
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
      const queue = new containers.ArrayBlockingQueue<number>(10);
      expect(String(queue.size)).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueuePUSHFILLTEST_0112
     * @tc.name Array_Blocking_Queue_PushFill_Test_static_001
     * @tc.desc Verify blocking behavior when pushing to full queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("Array_Blocking_Queue_PushFill_Test_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const queue = new containers.ArrayBlockingQueue<number>(1);
        queue.push(1);

        let isBlocked = false;
        setTimeout(() => {
          queue.push(2);
          isBlocked = true;
        }, 10);

        expect(isBlocked).assertFalse();
        queue.pop();
        setTimeout(() => {
          expect(isBlocked).assertTrue();
        }, 20);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueuePUSHMANYTEST_0113
     * @tc.name Array_Blocking_Queue_PushMany_Test_static_002
     * @tc.desc Verify pushing multiple values including null and undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("Array_Blocking_Queue_PushMany_Test_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const queue = new containers.ArrayBlockingQueue<string | null | undefined>(5);
        queue.push("");
        queue.push(null);
        queue.push(undefined);
        queue.push("@@");

        expect(String(queue.size)).assertEqual('4');
        expect(queue.pop()).assertEqual("");
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueuePUSHSTRINGTEST_0114
     * @tc.name Array_Blocking_Queue_PushString_Test_static_003
     * @tc.desc Verify pushing and popping string values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("Array_Blocking_Queue_PushString_Test_static_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const queue = new containers.ArrayBlockingQueue<string>(3);
        queue.push("hello");
        expect(queue.pop()).assertEqual("hello");
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueuePUSHBIGINTTEST_0115
     * @tc.name Array_Blocking_Queue_PushString_Test_static_004
     * @tc.desc Verify pushing and popping bigint values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("Array_Blocking_Queue_PushString_Test_static_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const queue = new containers.ArrayBlockingQueue<bigint>(2);
        const bigIntNum = BigInt(9007199254740991);
        queue.push(bigIntNum);
        expect(String(queue.pop())).assertEqual('9007199254740991');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueuePUSHBOOLEANTEST_0116
     * @tc.name Array_Blocking_Queue_PushString_Test_static_005
     * @tc.desc Verify pushing and popping boolean values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("Array_Blocking_Queue_PushString_Test_static_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const queue = new containers.ArrayBlockingQueue<boolean>(1);
        queue.push(true);
        expect(queue.pop()).assertTrue();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueuePUSHCLASSTEST_0117
     * @tc.name Array_Blocking_Queue_Push_Class_Test_static_006
     * @tc.desc Verify pushing and popping class instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("Array_Blocking_Queue_Push_Class_Test_static_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const queue = new containers.ArrayBlockingQueue<TestClass>(1);
        const obj = new TestClass();
        queue.push(obj);
        expect(queue.pop()).assertEqual(obj);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueuePUSHEMPTYTEST_0118
     * @tc.name Array_Blocking_Queue_Push_Empty_Test_static_007
     * @tc.desc Verify pushing single element to empty queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("Array_Blocking_Queue_Push_Empty_Test_static_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const queue = new containers.ArrayBlockingQueue<number>(10);
        queue.push(1);
        expect(String(queue.size)).assertEqual('1');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueuePUSHEMPTYTEST_0119
     * @tc.name Array_Blocking_Queue_Push_Only_One_Test_static_008
     * @tc.desc Verify pushing single element to queue with capacity 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("Array_Blocking_Queue_Push_Only_One_Test_static_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const queue = new containers.ArrayBlockingQueue<string>(1);
        queue.push("single");
        expect(String(queue.size)).assertEqual('1');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueuePUSHTENTEST_0120
     * @tc.name Array_Blocking_Queue_Push_Ten_Test_static_009
     * @tc.desc Verify pushing multiple elements to fill queue capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("Array_Blocking_Queue_Push_Ten_Test_static_009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const capacity = 10;
        const queue = new containers.ArrayBlockingQueue<number>(capacity);
        queue.push(1);
        expect(String(queue.size)).assertEqual('1');
        for (let i = 2; i <= capacity; i++) {
          queue.push(i);
        }
        expect(String(queue.size)).assertEqual(String(capacity));
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_PROPERTYPUSHSPECIALVALUES_0121
     * @tc.name property_Push_SpecialValues_static
     * @tc.desc Verify pushing and popping special values (empty string, null, undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('property_Push_SpecialValues_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queue: containers.ArrayBlockingQueue<string | null | undefined> =
        new containers.ArrayBlockingQueue<string | null | undefined>(4);
      let initialCapacity = queue.capacity;
      expect(String(initialCapacity)).assertEqual('4');

      queue.push("");
      let sizeAfterEmptyString = queue.size;
      expect(String(sizeAfterEmptyString)).assertEqual('1');

      queue.push(null);
      let sizeAfterNull = queue.size;
      expect(String(sizeAfterNull)).assertEqual('2');

      queue.push(undefined);
      let sizeAfterUndefined = queue.size;
      expect(String(sizeAfterUndefined)).assertEqual('3');

      const specialChar = '!@#$%^&*';
      queue.push(specialChar);
      let sizeAfterSpecialChar = queue.size;
      expect(String(sizeAfterSpecialChar)).assertEqual('4');

      let poppedEmptyString = queue.pop();
      expect(String(poppedEmptyString)).assertEqual("");

      let poppedNull = queue.pop();
      expect(String(poppedNull)).assertEqual('null');

      let poppedUndefined = queue.pop();
      expect(String(poppedUndefined)).assertEqual('undefined');

      let poppedSpecialChar = queue.pop();
      expect(String(poppedSpecialChar)).assertEqual(String(specialChar));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_PROPERTYPUSHNUMBER_0122
     * @tc.name property_Push_Number_static
     * @tc.desc Verify pushing and popping number values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('property_Push_Number_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queue: containers.ArrayBlockingQueue<number> = new containers.ArrayBlockingQueue<number>(1);
      let initialCapacity = queue.capacity;
      expect(String(initialCapacity)).assertEqual('1');

      const num = 123;
      queue.push(num);
      let sizeAfterPush = queue.size;
      expect(String(sizeAfterPush)).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_PROPERTYPUSHSTRING_0123
     * @tc.name property_Push_String_static
     * @tc.desc Verify pushing and popping string values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('property_Push_String_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queue: containers.ArrayBlockingQueue<string> = new containers.ArrayBlockingQueue<string>(1);
      let initialCapacity = queue.capacity;
      expect(String(initialCapacity)).assertEqual('1');

      const str = "Hello, World!";
      queue.push(str);
      let sizeAfterPush = queue.size;
      expect(String(sizeAfterPush)).assertEqual('1');

      let poppedString = queue.pop();
      expect(String(poppedString)).assertEqual(String(str));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_PROPERTYPUSHBIGINT_0124
     * @tc.name property_Push_Bigint_static
     * @tc.desc Verify pushing and popping bigint values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('property_Push_Bigint_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queue: containers.ArrayBlockingQueue<bigint> = new containers.ArrayBlockingQueue<bigint>(1);
      let initialCapacity = queue.capacity;
      expect(String(initialCapacity)).assertEqual('1');

      const bigIntNum = BigInt(9007199254740991);
      queue.push(bigIntNum);
      let sizeAfterPush = queue.size;
      expect(String(sizeAfterPush)).assertEqual('1');

      let poppedBigInt = queue.pop();
      expect(String(poppedBigInt)).assertEqual(String(bigIntNum));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_PROPERTYPUSHBOOLEAN_0125
     * @tc.name property_Push_Boolean_static
     * @tc.desc Verify pushing and popping boolean values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('property_Push_Boolean_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queue: containers.ArrayBlockingQueue<boolean> = new containers.ArrayBlockingQueue<boolean>(1);
      let initialCapacity = queue.capacity;
      expect(String(initialCapacity)).assertEqual('1');

      const bool = true;
      queue.push(bool);
      let sizeAfterPush = queue.size;
      expect(String(sizeAfterPush)).assertEqual('1');

      let poppedBoolean = queue.pop();
      expect(String(poppedBoolean)).assertEqual(String(bool));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_PROPERTYPUSHARRAY_0126
     * @tc.name property_Push_Array_static
     * @tc.desc Verify pushing and popping array values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('property_Push_Array_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queue: containers.ArrayBlockingQueue<number[]> = new containers.ArrayBlockingQueue<number[]>(1);
      let initialCapacity = queue.capacity;
      expect(String(initialCapacity)).assertEqual('1');

      const arr: number[] = [1, 2, 3];
      queue.push(arr);
      let sizeAfterPush = queue.size;
      expect(String(sizeAfterPush)).assertEqual('1');

      let poppedArray = queue.pop();
      expect(String(poppedArray)).assertEqual(String(arr));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_PROPERTYPUSHCLASS_0127
     * @tc.name property_Push_Class_static
     * @tc.desc Verify pushing and popping class instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('property_Push_Class_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queue: containers.ArrayBlockingQueue<Date> = new containers.ArrayBlockingQueue<Date>(1);
      let initialCapacity = queue.capacity;
      expect(String(initialCapacity)).assertEqual('1');

      const dateInstance = new Date();
      queue.push(dateInstance);
      let sizeAfterPush = queue.size;
      expect(String(sizeAfterPush)).assertEqual('1');

      let poppedDate = queue.pop();
      expect(String(poppedDate.getTime())).assertEqual(String(dateInstance.getTime()));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_PROPERTYPUSHOBJECT_0128
     * @tc.name property_Push_Object_static
     * @tc.desc Verify pushing and popping object values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('property_Push_Object_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let queue: containers.ArrayBlockingQueue<QueueItem> = new containers.ArrayBlockingQueue<QueueItem>(1);
      let initialCapacity = queue.capacity;
      expect(String(initialCapacity)).assertEqual('1');
      const obj: QueueItem = {
        key: 'testKey', value: 123
      };
      queue.push(obj);
      let sizeAfterPush = queue.size;
      expect(String(sizeAfterPush)).assertEqual('1');

      let poppedObject = queue.pop();
      expect(String(poppedObject.key)).assertEqual(String(obj.key));
      expect(String(poppedObject.value)).assertEqual(String(obj.value));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHPUSHTEST_0129
     * @tc.name Array_Blocking_Queue_With_Push_Test_static_001
     * @tc.desc Verify initial size of empty queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("Array_Blocking_Queue_With_Push_Test_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const queue = new containers.ArrayBlockingQueue<number>(1);
        expect(String(queue.size)).assertEqual('0');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHPUSHTEST_0130
     * @tc.name Array_Blocking_Queue_With_Push_Test_static_002
     * @tc.desc Verify size after pushing single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("Array_Blocking_Queue_With_Push_Test_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const queue = new containers.ArrayBlockingQueue<number>(1);
        queue.push(1);
        expect(String(queue.size)).assertEqual('1');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHPUSHTEST_0131
     * @tc.name Array_Blocking_Queue_With_Push_Test_static_003
     * @tc.desc Verify size after pushing multiple elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("Array_Blocking_Queue_With_Push_Test_static_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const capacity = 10;
        const queue = new containers.ArrayBlockingQueue<number>(capacity);
        for (let i = 0; i < capacity - 1; i++) {
          queue.push(i);
        }
        expect(String(queue.size)).assertEqual(String(capacity - 1));
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHPUSHTEST_0132
     * @tc.name Array_Blocking_Queue_With_Push_Test_static_004
     * @tc.desc Verify size after pushing single element to empty queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("Array_Blocking_Queue_With_Push_Test_static_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const queue = new containers.ArrayBlockingQueue<number>(10);
        queue.push(1);
        expect(String(queue.size)).assertEqual('1');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHPUSHTEST_0133
     * @tc.name Array_Blocking_Queue_With_Push_Test_static_005
     * @tc.desc Verify size after pushing multiple elements to queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("Array_Blocking_Queue_With_Push_Test_static_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const capacity = 10;
        const queue = new containers.ArrayBlockingQueue<number>(capacity);
        for (let i = 0; i < capacity - 1; i++) {
          queue.push(i);
        }
        expect(String(queue.size)).assertEqual(String(capacity - 1));
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHPUSHTEST_0134
     * @tc.name Array_Blocking_Queue_With_Push_Test_static_006
     * @tc.desc Verify size after filling queue to capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("Array_Blocking_Queue_With_Push_Test_static_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const capacity = 10;
        const queue = new containers.ArrayBlockingQueue<number>(capacity);
        for (let i = 0; i < capacity; i++) {
          queue.push(i);
        }
        expect(String(queue.size)).assertEqual(String(capacity));
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHPOPTEST_0135
     * @tc.name Array_Blocking_Queue_With_Pop_Test_static_001
     * @tc.desc Verify popping element from filled queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("Array_Blocking_Queue_With_Pop_Test_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const capacity = 10;
        const queue = new containers.ArrayBlockingQueue<number>(capacity);
        for (let i = 0; i < capacity; i++) {
          queue.push(i);
        }
        const firstElement = queue.pop();
        expect(String(firstElement)).assertEqual('0');
        expect(String(queue.size)).assertEqual(String(capacity - 1));
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHPOPTEST_0136
     * @tc.name Array_Blocking_Queue_With_Pop_Test_static_002
     * @tc.desc Verify popping element from filled queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("Array_Blocking_Queue_With_Pop_Test_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const capacity = 10;
        const queue = new containers.ArrayBlockingQueue<number>(capacity);
        for (let i = 0; i < capacity; i++) {
          queue.push(i);
        }
        const firstElement = queue.pop();
        const secondElement = queue.pop();
        expect(String(secondElement)).assertEqual('1');
        expect(String(queue.size)).assertEqual(String(capacity - 2));
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHPOPTEST_0137
     * @tc.name Array_Blocking_Queue_With_Pop_Test_static_003
     * @tc.desc Verify popping special values (empty string, null)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("Array_Blocking_Queue_With_Pop_Test_static_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const capacity = 10;
        const queue = new containers.ArrayBlockingQueue<string | null>(capacity);
        queue.push("");
        queue.push(null);
        queue.push("@@@");
        expect(queue.pop()).assertEqual("");
        expect(String(queue.pop())).assertEqual("null");
        expect(queue.pop()).assertEqual("@@@");
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHPOPTEST_0138
     * @tc.name Array_Blocking_Queue_With_Pop_Test_static_004
     * @tc.desc Verify popping string values including "undefined"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("Array_Blocking_Queue_With_Pop_Test_static_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const capacity = 10;
        const queue = new containers.ArrayBlockingQueue<string | undefined>(capacity);
        queue.push("");
        queue.push("undefined");
        expect(queue.pop()).assertEqual("");
        expect(String(queue.pop())).assertEqual("undefined");
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHPOPTEST_0139
     * @tc.name Array_Blocking_Queue_With_Pop_Test_static_005
     * @tc.desc Verify popping single element from queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("Array_Blocking_Queue_With_Pop_Test_static_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const queue = new containers.ArrayBlockingQueue<number>(1);
        queue.push(100);
        expect(String(queue.pop())).assertEqual('100');
        expect(String(queue.size)).assertEqual('0');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHPOPTEST_0140
     * @tc.name Array_Blocking_Queue_With_Pop_Test_static_006
     * @tc.desc Verify popping all elements from queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("Array_Blocking_Queue_With_Pop_Test_static_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const capacity = 10;
        const queue = new containers.ArrayBlockingQueue<number>(capacity);
        for (let i = 0; i < capacity - 1; i++) {
          queue.push(i);
        }
        expect(String(queue.size)).assertEqual(String(capacity - 1));
        const firstElement = queue.pop();
        expect(String(firstElement)).assertEqual('0');
        expect(String(queue.size)).assertEqual(String(capacity - 2));
        for (let i = 1; i < capacity - 1; i++) {
          expect(String(queue.pop())).assertEqual(String(i));
          expect(String(queue.size)).assertEqual(String(capacity - 2 - i));
        }
        expect(String(queue.size)).assertEqual('0');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHADDTEST_0141
     * @tc.name Array_Blocking_Queue_With_Add_Test_static_001
     * @tc.desc Verify add operation when queue is full
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("Array_Blocking_Queue_With_Add_Test_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const capacity = 10;
        const queue = new containers.ArrayBlockingQueue<number>(10);
        for (let i = 0; i < capacity; i++) {
          queue.add(i);
        }
        expect(String(queue.add(11))).assertEqual('false');
        expect(String(queue.size)).assertEqual(String(capacity));
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHADDTEST_0142
     * @tc.name Array_Blocking_Queue_With_Add_Test_static_002
     * @tc.desc Verify adding special string values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("Array_Blocking_Queue_With_Add_Test_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const capacity = 5;
        const queue = new containers.ArrayBlockingQueue<string>(5);
        expect(String(queue.add(""))).assertEqual('true');
        expect(queue.add('null')).assertTrue();
        expect(queue.add('undefined')).assertTrue();
        expect(String(queue.add("381yeqwhe239847qkedq4971"))).assertEqual('true');
        expect(String(queue.size)).assertEqual('4');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHADDTEST_0143
     * @tc.name Array_Blocking_Queue_With_Add_Test_static_003
     * @tc.desc Verify adding single element to queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("Array_Blocking_Queue_With_Add_Test_static_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const queue = new containers.ArrayBlockingQueue<string>(1);
        expect(String(queue.add('hello'))).assertEqual('true');
        expect(String(queue.size)).assertEqual('1');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHADDTEST_0144
     * @tc.name Array_Blocking_Queue_With_Add_Test_static_004
     * @tc.desc Verify adding bigint value to queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("Array_Blocking_Queue_With_Add_Test_static_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const queue = new containers.ArrayBlockingQueue<bigint>(1);
        let initialCapacity = queue.capacity;
        expect(String(initialCapacity)).assertEqual('1');
        const bigIntNum = BigInt(9007199254740991);
        expect(String(queue.add(bigIntNum))).assertEqual('true');
        expect(String(queue.size)).assertEqual('1');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHADDTEST_0145
     * @tc.name Array_Blocking_Queue_With_Add_Test_static_005
     * @tc.desc Verify adding boolean value to queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("Array_Blocking_Queue_With_Add_Test_static_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const queue = new containers.ArrayBlockingQueue<boolean>(1);
        let initialCapacity = queue.capacity;
        expect(String(initialCapacity)).assertEqual('1');
        expect(String(queue.add(false))).assertEqual('true');
        expect(String(queue.size)).assertEqual('1');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHADDTEST_0146
     * @tc.name Array_Blocking_Queue_With_Add_Test_static_006
     * @tc.desc Verify adding array to queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("Array_Blocking_Queue_With_Add_Test_static_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const queue = new containers.ArrayBlockingQueue<number[]>(1);
        let initialCapacity = queue.capacity;
        expect(String(initialCapacity)).assertEqual('1');

        const arr: number[] = [1, 2, 3];
        expect(String(queue.add(arr))).assertEqual('true');
        expect(String(queue.size)).assertEqual('1');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHADDTEST_0147
     * @tc.name Array_Blocking_Queue_With_Add_Test_static_007
     * @tc.desc Verify adding and popping array from queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("Array_Blocking_Queue_With_Add_Test_static_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        let queue: containers.ArrayBlockingQueue<number[]> = new containers.ArrayBlockingQueue<number[]>(1);
        let initialCapacity = queue.capacity;
        expect(String(initialCapacity)).assertEqual('1');
        const arr: number[] = [1, 2, 3];
        queue.add(arr);
        let sizeAfterPush = queue.size;
        expect(String(sizeAfterPush)).assertEqual('1');

        let poppedArray = queue.pop();
        expect(String(poppedArray)).assertEqual(String(arr));
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHADDTEST_0148
     * @tc.name Array_Blocking_Queue_With_Add_Test_static_008
     * @tc.desc Verify adding and popping Date object from queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("Array_Blocking_Queue_With_Add_Test_static_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        let queue: containers.ArrayBlockingQueue<Date> = new containers.ArrayBlockingQueue<Date>(1);
        let initialCapacity = queue.capacity;
        expect(String(initialCapacity)).assertEqual('1');

        const dateInstance = new Date();
        queue.add(dateInstance);
        let sizeAfterPush = queue.size;
        expect(String(sizeAfterPush)).assertEqual('1');

        let poppedDate = queue.pop();
        expect(String(poppedDate.getTime())).assertEqual(String(dateInstance.getTime()));
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHADDTEST_0149
     * @tc.name Array_Blocking_Queue_With_Add_Test_static_0009
     * @tc.desc Verify adding object with key-value pair to queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("Array_Blocking_Queue_With_Add_Test_static_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {

        let queue: containers.ArrayBlockingQueue<QueueItem2> = new containers.ArrayBlockingQueue<QueueItem2>(1);
        let initialCapacity = queue.capacity;
        expect(String(initialCapacity)).assertEqual('1');

        let addKey = queue.add({
          key: "value"
        });
        expect(String(addKey)).assertEqual('true');
        expect(String(queue.size)).assertEqual('1');
      });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHADDTEST_0151
     * @tc.name Array_Blocking_Queue_With_Add_Test_static_0011
     * @tc.desc Verify adding elements to full queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("Array_Blocking_Queue_With_Add_Test_static_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const queue = new containers.ArrayBlockingQueue<number>(1);
        expect(queue.add(1)).assertTrue();
        expect(String(queue.size)).assertEqual('1');
        expect(queue.add(2)).assertFalse();
        expect(String(queue.size)).assertEqual('1');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHADDTEST_0152
     * @tc.name Array_Blocking_Queue_With_Add_Test_static_0012
     * @tc.desc Verify adding multiple elements to queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("Array_Blocking_Queue_With_Add_Test_static_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const capacity = 5;
        const queue = new containers.ArrayBlockingQueue<number>(capacity);
        for (let i = 0; i < capacity - 1; i++) {
          expect(queue.add(i)).assertTrue();
        }
        expect(String(queue.size)).assertEqual(String(capacity - 1));
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHADDTEST_0153
     * @tc.name Array_Blocking_Queue_With_Add_Test_static_0013
     * @tc.desc Verify adding elements to fill queue capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("Array_Blocking_Queue_With_Add_Test_static_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const capacity = 10;
        const queue = new containers.ArrayBlockingQueue<number>(capacity);
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHPOLLTEST_0155
     * @tc.name Array_Blocking_Queue_With_Poll_Test_static_0002
     * @tc.desc Verify polling from single element queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("Array_Blocking_Queue_With_Poll_Test_static_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const queue = new containers.ArrayBlockingQueue<number>(1);
        queue.add(100);
        expect(String(queue.poll())).assertEqual('100');
        expect(String(queue.size)).assertEqual('0');
        expect(String(queue.poll()).toString()).assertEqual('undefined');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHPOLLTEST_0156
     * @tc.name Array_Blocking_Queue_With_Poll_Test_static_0003
     * @tc.desc Verify polling special string values from queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("Array_Blocking_Queue_With_Poll_Test_static_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const queue = new containers.ArrayBlockingQueue<string | null | undefined>(5);
        queue.add("");
        queue.add(null);
        queue.add(undefined);
        queue.add("huiafyef23@y8#");
        expect(queue.poll()).assertEqual("");
        expect(String(queue.poll())).assertEqual("null");
        expect(String(queue.poll())).assertEqual("undefined");
        expect(String(queue.size)).assertEqual('1');
        expect(queue.poll()).assertEqual("huiafyef23@y8#");
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHPOLLTEST_0157
     * @tc.name Array_Blocking_Queue_With_Poll_Test_static_0004
     * @tc.desc Verify polling and adding elements dynamically
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("Array_Blocking_Queue_With_Poll_Test_static_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const capacity = 5;
        const queue = new containers.ArrayBlockingQueue<number>(capacity);
        for (let i = 0; i < capacity - 1; i++) {
          queue.add(i);
        }
        expect(String(queue.poll())).assertEqual('0');
        expect(String(queue.size)).assertEqual(String(capacity - 2));
        expect(queue.add(99)).assertTrue();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHPOLLTEST_0158
     * @tc.name Array_Blocking_Queue_With_Poll_Test_static_0005
     * @tc.desc Verify polling all elements from filled queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("Array_Blocking_Queue_With_Poll_Test_static_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const capacity = 10;
        const queue = new containers.ArrayBlockingQueue<number>(capacity);
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHPOLLTEST_0159
     * @tc.name Array_Blocking_Queue_With_Poll_Test_static_0006
     * @tc.desc Verify polling elements in FIFO order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("Array_Blocking_Queue_With_Poll_Test_static_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const queue = new containers.ArrayBlockingQueue<string>(3);
        queue.add("first");
        queue.add("second");

        expect(queue.poll()).assertEqual("first");
        expect(String(queue.size)).assertEqual('1');
        expect(queue.poll()).assertEqual("second");
        expect(String(queue.size)).assertEqual('0');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHGETFIRSTTEST_016
     * @tc.name Array_Blocking_Queue_With_GetFirst_Test_static_0001
     * @tc.desc Verify getting first element from filled queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("Array_Blocking_Queue_With_GetFirst_Test_static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const queue = new containers.ArrayBlockingQueue<number>(3);
        queue.add(10);
        queue.add(20);
        queue.add(30);
        expect(String(queue.getFirst())).assertEqual('10');
        expect(String(queue.size)).assertEqual('3');
        expect(queue.add(40)).assertFalse();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHGETFIRSTTEST_0161
     * @tc.name Array_Blocking_Queue_With_GetFirst_Test_static_0002
     * @tc.desc Verify getting first element with special string values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("Array_Blocking_Queue_With_GetFirst_Test_static_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const queue = new containers.ArrayBlockingQueue<string | null | undefined>(5);
        queue.add("");
        queue.add(null);
        queue.add(undefined);
        queue.add("yihahah111");
        expect(String(queue.getFirst())).assertEqual("");
        expect(String(queue.size)).assertEqual('4');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHGETFIRSTTEST_0163
     * @tc.name Array_Blocking_Queue_With_GetFirst_Test_static_0004
     * @tc.desc Verify getting first element from single element queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("Array_Blocking_Queue_With_GetFirst_Test_static_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const queue = new containers.ArrayBlockingQueue<string>(1);
        queue.add("1");
        expect(String(queue.getFirst())).assertEqual("1");
        expect(String(queue.size)).assertEqual('1');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHGETFIRSTTEST_0164
     * @tc.name Array_Blocking_Queue_With_GetFirst_Test_static_0005
     * @tc.desc Verify getting first element after adding elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("Array_Blocking_Queue_With_GetFirst_Test_static_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const capacity = 5;
        const queue = new containers.ArrayBlockingQueue<number>(capacity);
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHGETFIRSTTEST_0165
     * @tc.name Array_Blocking_Queue_With_GetFirst_Test_static_0006
     * @tc.desc Verify getting first boolean element from queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("Array_Blocking_Queue_With_GetFirst_Test_static_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const queue = new containers.ArrayBlockingQueue<boolean>(1);
        queue.add(true);
        expect(queue.getFirst()).assertTrue();
        expect(String(queue.size)).assertEqual('1');
        expect(queue.getFirst()).assertTrue();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHGETFIRSTTEST_0166
     * @tc.name Array_Blocking_Queue_With_GetFirst_Test_static_0007
     * @tc.desc Verify getting first element after filling queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("Array_Blocking_Queue_With_GetFirst_Test_static_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const capacity = 10;
        const queue = new containers.ArrayBlockingQueue<number>(capacity);
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHCAPACITYTEST_0169
     * @tc.name Array_Blocking_Queue_With_Capacity_Test_static_0003
     * @tc.desc Verify single capacity queue behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("Array_Blocking_Queue_With_Capacity_Test_static_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const capacity = 1;
        const queue = new containers.ArrayBlockingQueue<number>(capacity);
        queue.add(123);
        expect(String(queue.capacity)).assertEqual('1');
        expect(String(queue.size)).assertEqual('1');
        expect(String(queue.poll())).assertEqual('123');
        expect(String(queue.capacity)).assertEqual('1');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHREMAININGCAPACITYTEST_0170
     * @tc.name Array_Blocking_Queue_With_RemainingCapacity_Test_static_0001
     * @tc.desc Verify remaining capacity of full queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("Array_Blocking_Queue_With_RemainingCapacity_Test_static_0001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const capacity = 3;
        const queue = new containers.ArrayBlockingQueue<number>(capacity);
        queue.add(123);
        queue.add(456);
        queue.add(789);
        expect(String(queue.remainingCapacity())).assertEqual('0');
        expect(queue.add(4)).assertFalse();
        expect(String(queue.remainingCapacity())).assertEqual('0');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BBASE_containers.ArrayBlockingQueueWITHREMAININGCAPACITYTEST_0171
     * @tc.name Array_Blocking_Queue_With_RemainingCapacity_Test_static_0002
     * @tc.desc Verify remaining capacity after adding elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("Array_Blocking_Queue_With_RemainingCapacity_Test_static_0002",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const capacity = 5;
        const queue = new containers.ArrayBlockingQueue<number>(capacity);
        expect(String(queue.remainingCapacity())).assertEqual(String(capacity));
        expect(queue.add(1)).assertTrue();
        expect(String(queue.remainingCapacity())).assertEqual(String(capacity - 1));
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHREMAININGCAPACITYTEST_0172
     * @tc.name Array_Blocking_Queue_With_RemainingCapacity_Test_static_0003
     * @tc.desc Verify remaining capacity changes after operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("Array_Blocking_Queue_With_RemainingCapacity_Test_static_0003",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const queue = new containers.ArrayBlockingQueue<boolean>(1);
        expect(String(queue.remainingCapacity())).assertEqual('1');
        queue.add(true);
        expect(String(queue.remainingCapacity())).assertEqual('0');
        queue.poll();
        expect(String(queue.remainingCapacity())).assertEqual('1');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueWITHREMAININGCAPACITYTEST_0173
     * @tc.name Array_Blocking_Queue_With_RemainingCapacity_Test_static_0004
     * @tc.desc Verify remaining capacity when nearly full
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("Array_Blocking_Queue_With_RemainingCapacity_Test_static_0004",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const capacity = 4;
        const queue = new containers.ArrayBlockingQueue<number>(capacity);
        queue.add(10);
        queue.add(20);
        queue.add(30);
        expect(String(queue.remainingCapacity())).assertEqual('1');
        queue.add(40);
        expect(String(queue.remainingCapacity())).assertEqual('0');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueREMAININGCAPACITYTENTEST_0174
     * @tc.name ArrayBlockingQueueRemainingCapacityTen_Test_static_005
     * @tc.desc Verify remaining capacity changes in large queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("ArrayBlockingQueueRemainingCapacityTen_Test_static_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const capacity = 10;
        const queue = new containers.ArrayBlockingQueue<string>(capacity);
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueREMAININGCAPACITYTENTEST_0175
     * @tc.name ArrayBlockingQueueRemainingCapacityDynamic_Test_static_006
     * @tc.desc Verify dynamic remaining capacity changes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("ArrayBlockingQueueRemainingCapacityDynamic_Test_static_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const capacity = 5;
        const queue = new containers.ArrayBlockingQueue<number>(capacity);
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueGETSIZEDYNAMICTEST_0176
     * @tc.name ArrayBlockingQueueGetSizeDynamic_Test_static_001
     * @tc.desc Verify size after filling queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("ArrayBlockingQueueGetSizeDynamic_Test_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const capacity = 3;
        const queue = new containers.ArrayBlockingQueue<number>(capacity);
        queue.push(1);
        queue.push(2);
        queue.push(3);

        expect(String(queue.size)).assertEqual('3');
        expect(String(queue.capacity)).assertEqual(String(capacity));
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueGETSIZEDYNAMICTEST_0179
     * @tc.name ArrayBlockingQueueGetSizeOne_Test_static_004
     * @tc.desc Verify size changes in single capacity queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("ArrayBlockingQueueGetSizeOne_Test_static_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const queue = new containers.ArrayBlockingQueue<boolean>(1);
      expect(String(queue.size)).assertEqual('0');
      queue.push(true);
      expect(String(queue.size)).assertEqual('1');
      queue.pop();
      expect(String(queue.size)).assertEqual('0');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueISEMPTYTRUETEST_0181
     * @tc.name ArrayBlockingQueueIsEmptyFalse_Test_static_002
     * @tc.desc Verify isEmpty on non-empty queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("ArrayBlockingQueueIsEmptyFalse_Test_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const queue = new containers.ArrayBlockingQueue<string>(2);
        queue.push("data");
        expect(String(queue.isEmpty())).assertEqual('false');
        expect(String(queue.size)).assertEqual('1');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueISEMPTYCHANGETEST_0183
     * @tc.name ArrayBlockingQueueIsEmptyBoundary_Test_static_004
     * @tc.desc Verify isEmpty on single capacity queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("ArrayBlockingQueueIsEmptyBoundary_Test_static_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const queue = new containers.ArrayBlockingQueue<number>(1);
        expect(String(queue.isEmpty())).assertEqual('true');
        queue.push(1);
        expect(String(queue.isEmpty())).assertEqual('false');
        queue.pop();
        expect(String(queue.isEmpty())).assertEqual('true');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueISEMPTYCHANGETEST_0184
     * @tc.name ArrayBlockingQueueIsEmptyMixed_Test_static_005
     * @tc.desc Verify isEmpty with mixed operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("ArrayBlockingQueueIsEmptyMixed_Test_static_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const queue = new containers.ArrayBlockingQueue<string>(3);
        queue.push("a");
        queue.pop();
        expect(String(queue.isEmpty())).assertEqual('true');

        queue.add("b");
        queue.pop();
        expect(String(queue.isEmpty())).assertEqual('true');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueISEMPTYCHANGETEST_0185
     * @tc.name ArrayBlockingQueueIsEmptyConcurrent_Test_static_006
     * @tc.desc Verify isEmpty with concurrent operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("ArrayBlockingQueueIsEmptyConcurrent_Test_static_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const queue = new containers.ArrayBlockingQueue<number>(10);
        queue.push(1);
        queue.pop();
        queue.push(2);
        expect(String(queue.isEmpty())).assertEqual('false');
        queue.pop();
        expect(String(queue.isEmpty())).assertEqual('true');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueGETENDCONCURRENTTEST_0186
     * @tc.name ArrayBlockingQueueGetEndConcurrent_Test_static_001
     * @tc.desc Verify getEnd on filled queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("ArrayBlockingQueueGetEndConcurrent_Test_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const capacity = 10;
        const queue = new containers.ArrayBlockingQueue<number>(capacity);
        for (let i = 0; i < capacity; i++) {
          queue.add(i);
        }
        expect(String(queue.getEnd())).assertEqual('9');
        expect(String(queue.size)).assertEqual('10');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueGETENDCONCURRENTTEST_0187
     * @tc.name ArrayBlockingQueueGetEndConcurrent_Test_static_002
     * @tc.desc Verify getEnd with special values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("ArrayBlockingQueueGetEndConcurrent_Test_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const capacity = 5;
        const queue = new containers.ArrayBlockingQueue<string | null | undefined>(capacity);
        queue.add("");
        queue.add(null);
        queue.add(undefined);
        queue.add("@#$");

        expect(String(queue.getEnd())).assertEqual('@#$');
        expect(queue.size).assertEqual(4);

        queue.poll();
        queue.add(null);
        expect(queue.getEnd()).assertEqual(null);

        queue.poll();
        queue.add(undefined);
        expect(queue.getEnd()).assertEqual(undefined);

        queue.poll();
        queue.add("");
        expect(String(queue.getEnd())).assertEqual("");
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueGETENDCONCURRENTTEST_0188
     * @tc.name ArrayBlockingQueueGetEndConcurrent_Test_static_003
     * @tc.desc Verify getEnd on empty queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("ArrayBlockingQueueGetEndConcurrent_Test_static_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const capacity = 10;
        const queue = new containers.ArrayBlockingQueue<number>(capacity);
        expect(String(queue.getEnd()).toString()).assertEqual('undefined');
        expect(String(queue.size)).assertEqual('0');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueGETENDCONCURRENTTEST_0189
     * @tc.name ArrayBlockingQueueGetEndConcurrent_Test_static_004
     * @tc.desc Verify getEnd on single element queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("ArrayBlockingQueueGetEndConcurrent_Test_static_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const capacity = 1;
        const queue = new containers.ArrayBlockingQueue<number>(capacity);
        queue.add(100)
        expect(String(queue.getEnd())).assertEqual('100');
        expect(String(queue.size)).assertEqual('1');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueGETENDCONCURRENTTEST_0190
     * @tc.name ArrayBlockingQueueGetEndConcurrent_Test_static_005
     * @tc.desc Verify getEnd on single element queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("ArrayBlockingQueueGetEndConcurrent_Test_static_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const capacity = 1;
        const queue = new containers.ArrayBlockingQueue<number>(capacity);
        queue.add(100)
        expect(String(queue.getEnd())).assertEqual('100');
        expect(String(queue.size)).assertEqual('1');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueGETENDCONCURRENTTEST_0191
     * @tc.name ArrayBlockingQueueGetEndConcurrent_Test_static_006
     * @tc.desc Verify getEnd after filling queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("ArrayBlockingQueueGetEndConcurrent_Test_static_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const capacity = 10;
        const queue = new containers.ArrayBlockingQueue<number>(capacity);
        for (let i = 0; i < capacity - 1; i++) {
          queue.add(i)
        }
        expect(String(queue.getEnd())).assertEqual('8');
        expect(String(queue.size)).assertEqual('9');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueGETENDCONCURRENTTEST_0192
     * @tc.name ArrayBlockingQueueGetEndConcurrent_Test_static_007
     * @tc.desc Verify getEnd after filling queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("ArrayBlockingQueueGetEndConcurrent_Test_static_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const capacity = 10;
        const queue = new containers.ArrayBlockingQueue<number>(capacity);

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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueGETENDCONCURRENTTEST_0193
     * @tc.name ArrayBlockingQueueGetEndConcurrent_Test_static_008
     * @tc.desc Verify getEnd with string value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("ArrayBlockingQueueGetEndConcurrent_Test_static_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const capacity = 1;
        const queue = new containers.ArrayBlockingQueue<string>(capacity);
        queue.add('hahah')
        expect(String(queue.getEnd())).assertEqual('hahah');
        expect(String(queue.size)).assertEqual('1');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueGETENDCONCURRENTTEST_0194
     * @tc.name ArrayBlockingQueueGetEndConcurrent_Test_static_009
     * @tc.desc Verify getEnd with multiple string values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("ArrayBlockingQueueGetEndConcurrent_Test_static_009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const queue = new containers.ArrayBlockingQueue<string>(5);
        queue.add('hahah')
        queue.add('xixixi')
        expect(String(queue.getEnd())).assertEqual('xixixi');
        expect(String(queue.size)).assertEqual('2');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueGETENDCONCURRENTTEST_0195
     * @tc.name ArrayBlockingQueueGetEndConcurrent_Test_static_0010
     * @tc.desc Verify getEnd with duplicate string values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("ArrayBlockingQueueGetEndConcurrent_Test_static_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const queue = new containers.ArrayBlockingQueue<string>(5);
        queue.add('hahah')
        queue.add('hahah')
        expect(String(queue.getEnd())).assertEqual('hahah');
        expect(String(queue.size)).assertEqual('2');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueGETENDCONCURRENTTEST_0196
     * @tc.name ArrayBlockingQueueGetEndConcurrent_Test_static_011
     * @tc.desc Verify getEnd with MAX_SAFE_INTEGER value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("ArrayBlockingQueueGetEndConcurrent_Test_static_011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const queue = new containers.ArrayBlockingQueue<number>(5);
        queue.add(Number.MAX_SAFE_INTEGER);
        expect(String(queue.getEnd())).assertEqual(String(Number.MAX_SAFE_INTEGER));
        expect(String(queue.size)).assertEqual('1');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueGETENDCONCURRENTTEST_0197
     * @tc.name ArrayBlockingQueueGetEndConcurrent_Test_static_012
     * @tc.desc Verify getEnd with MIN_SAFE_INTEGER value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("ArrayBlockingQueueGetEndConcurrent_Test_static_012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const queue = new containers.ArrayBlockingQueue<number>(5);
        queue.add(Number.MIN_SAFE_INTEGER);
        expect(String(queue.getEnd())).assertEqual(String(Number.MIN_SAFE_INTEGER));
        expect(String(queue.size)).assertEqual('1');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_containers.ArrayBlockingQueueCONSTRUCTORCONCURRENTTEST_0199
     * @tc.name ArrayBlockingQueueConstructorConcurrent_Test_static_002
     * @tc.desc Verify constructor with empty array and single capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("ArrayBlockingQueueConstructorConcurrent_Test_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const queue = new containers.ArrayBlockingQueue<number>(1, new Array<number>());
        expect(queue.isEmpty()).assertTrue();
        expect(String(queue.size)).assertEqual('0');
        expect(String(queue.capacity)).assertEqual('1');
      });

    /**
     * @tc.number SUB_COMMON_LIBRARY_UTIL_BASE_containers.ArrayBlockingQueueCONSTRUCTORWITHSETTEST_200
     * @tc.name ArrayBlockingQueueConstructorWith_Test_static_001
     * @tc.desc The test uses an empty array to initialize the queue (capacity = 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("ArrayBlockingQueueConstructorWith_Test_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const emptyArray = new Array<Int>();
          const queue = new containers.ArrayBlockingQueue<int>(0, emptyArray);
          expect(queue.isEmpty()).assertTrue();
          expect(String(queue.size)).assertEqual('0');
          expect(String(queue.capacity)).assertEqual('0');
        } catch (error) {
          expect(error instanceof Error).assertTrue();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMON_LIBRARY_UTIL_BASE_containers.ArrayBlockingQueueCONSTRUCTORWITHSETTEST_201
     * @tc.name ArrayBlockingQueueConstructorWith_Test_static_002
     * @tc.desc The test uses an empty array to initialize the queue (capacity = 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("ArrayBlockingQueueConstructorWith_Test_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const emptyArray = new Array<Int>();
          const queue = new containers.ArrayBlockingQueue<int>(1, emptyArray);
          expect(queue.isEmpty()).assertTrue();
          expect(String(queue.size)).assertEqual('0');
          expect(String(queue.capacity)).assertEqual('1');
        } catch (error) {
          expect(error instanceof Error).assertTrue();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMON_LIBRARY_UTIL_BASE_containers.ArrayBlockingQueueCONSTRUCTORWITHSETTEST_202
     * @tc.name ArrayBlockingQueueConstructorWith_Test_static_0003
     * @tc.desc The test initializes the queue with an array containing one element (capacity = 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("ArrayBlockingQueueConstructorWith_Test_static_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const oneElementArray = new Array<Int>(42);
          const queue = new containers.ArrayBlockingQueue<int>(0, oneElementArray);
          expect(queue.isEmpty()).assertFalse();
          expect(String(queue.size)).assertEqual('1');
          expect(String(queue.getFirst())).assertEqual('42');
          expect(String(queue.poll())).assertEqual('42');
          expect(String(queue.isEmpty())).assertEqual('true');
          expect(String(queue.capacity)).assertEqual('0');
        } catch (error) {
          expect(error instanceof Error).assertTrue();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMON_LIBRARY_UTIL_BASE_containers.ArrayBlockingQueueCONSTRUCTORWITHSETTEST_203
     * @tc.name ArrayBlockingQueueConstructorWith_Test_static_004
     * @tc.desc The test initializes the queue with an array containing one element (capacity = 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("ArrayBlockingQueueConstructorWith_Test_static_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const oneElementArray = new Array<Int>(42);
          const queue = new containers.ArrayBlockingQueue<int>(1, oneElementArray);
          expect(String(queue.isEmpty())).assertEqual('true');
          expect(String(queue.size)).assertEqual('0');
          expect(String(queue.getFirst())).assertEqual('undefined');
          expect(String(queue.poll()).toString()).assertEqual('undefined');
          expect(String(queue.isEmpty())).assertEqual('true');
          expect(String(queue.capacity)).assertEqual('1');
        } catch (error) {
          expect(error instanceof Error).assertTrue();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMON_LIBRARY_UTIL_BASE_containers.ArrayBlockingQueueCONSTRUCTORWITHSETTEST_204
     * @tc.name ArrayBlockingQueueConstructorWith_Test_static_005
     * @tc.desc The test initializes the queue with a collection containing one element (capacity = 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("ArrayBlockingQueueConstructorWith_Test_static_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const oneElementSet = new Array<Int>(42);
          const queue = new containers.ArrayBlockingQueue<int>(0, oneElementSet);
          expect(queue.isEmpty()).assertFalse();
          expect(String(queue.size)).assertEqual('1');
          expect(String(queue.getFirst())).assertEqual('42');
          expect(String(queue.poll())).assertEqual('42');
          expect(String(queue.isEmpty())).assertEqual('true');
          expect(String(queue.capacity)).assertEqual('0');
        } catch (error) {
          expect(error instanceof Error).assertTrue();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMON_LIBRARY_UTIL_BASE_containers.ArrayBlockingQueueCONSTRUCTORWITHSETTEST_205
     * @tc.name ArrayBlockingQueueConstructorWith_Test_static_006
     * @tc.desc The test initializes the queue with a collection containing one element (capacity = 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("ArrayBlockingQueueConstructorWith_Test_static_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const oneElementSet = new Array<Int>(42);
          const queue = new containers.ArrayBlockingQueue<int>(1, oneElementSet);
          expect(String(queue.isEmpty())).assertEqual('true');
          expect(String(queue.getFirst())).assertEqual('undefined');
          expect(String(queue.poll()).toString()).assertEqual('undefined');
          expect(String(queue.isEmpty())).assertEqual('true');
          expect(String(queue.capacity)).assertEqual('1');
        } catch (error) {
          expect(error instanceof Error).assertTrue();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMON_LIBRARY_UTIL_BASE_containers.ArrayBlockingQueueCONSTRUCTORWITHSETTEST_206
     * @tc.name ArrayBlockingQueueConstructorWith_Test_static_007
     * @tc.desc The test uses an array with 1000 elements to initialize the queue (capacity = 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("ArrayBlockingQueueConstructorWith_Test_static_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const queue: containers.ArrayBlockingQueue<int> =
            new containers.ArrayBlockingQueue<int>(0, thousandElementsArray);
          expect(String(queue.size)).assertEqual('1000');
          expect(String(queue.capacity)).assertEqual('0');
        } catch (error) {
          expect(error instanceof Error).assertTrue();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMON_LIBRARY_UTIL_BASE_containers.ArrayBlockingQueueCONSTRUCTORWITHSETTEST_207
     * @tc.name ArrayBlockingQueueConstructorWith_Test_static_008
     * @tc.desc The test uses an array with 1000 elements to initialize the queue (capacity = 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("ArrayBlockingQueueConstructorWith_Test_static_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const queue: containers.ArrayBlockingQueue<int> =
            new containers.ArrayBlockingQueue<int>(1, thousandElementsArray);
          expect(String(queue.size)).assertEqual('1');
          expect(String(queue.capacity)).assertEqual('1');
        } catch (error) {
          expect(error instanceof Error).assertTrue();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMON_LIBRARY_UTIL_BASE_containers.ArrayBlockingQueueCONSTRUCTORWITHSETTEST_208
     * @tc.name ArrayBlockingQueueConstructorWith_Test_static_009
     * @tc.desc The test uses an array with 1000 elements to initialize the queue (capacity = 1000)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("ArrayBlockingQueueConstructorWith_Test_static_009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const queue: containers.ArrayBlockingQueue<int> =
            new containers.ArrayBlockingQueue<int>(1000, thousandElementsArray);
          expect(String(queue.capacity)).assertEqual('1000');
        } catch (error) {
          expect(error instanceof Error).assertTrue();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMON_LIBRARY_UTIL_BASE_containers.ArrayBlockingQueueCONSTRUCTORWITHSETTEST_209
     * @tc.name ArrayBlockingQueueConstructorWith_Test_static_010
     * @tc.desc The test uses an empty set to initialize the queue (capacity = 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("ArrayBlockingQueueConstructorWith_Test_static_010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const emptySet = new Set<int>();
          const i = emptySet.values();
          const queue: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(0, i);
          expect(queue.isEmpty()).assertTrue();
          expect(String(queue.size)).assertEqual('0');
          expect(String(queue.capacity)).assertEqual('0');
        } catch (error) {
          expect(error instanceof Error).assertTrue();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMON_LIBRARY_UTIL_BASE_containers.ArrayBlockingQueueCONSTRUCTORWITHSETTEST_210
     * @tc.name ArrayBlockingQueueConstructorWith_Test_static_011
     * @tc.desc The test uses an empty set to initialize the queue (capacity = 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("ArrayBlockingQueueConstructorWith_Test_static_011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const emptySet = new Set<int>();
          const queue: containers.ArrayBlockingQueue<int> =
            new containers.ArrayBlockingQueue<int>(1, emptySet.values());
          expect(queue.isEmpty()).assertTrue();
          expect(String(queue.size)).assertEqual('0');
          expect(String(queue.capacity)).assertEqual('1');
        } catch (error) {
          expect(error instanceof Error).assertTrue();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMON_LIBRARY_UTIL_BASE_containers.ArrayBlockingQueueCONSTRUCTORWITHSETTEST_211
     * @tc.name ArrayBlockingQueueConstructorWith_Test_static_012
     * @tc.desc The test uses null as the iterable object to initialize the queue (capacity = 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("ArrayBlockingQueueConstructorWith_Test_static_012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const emptySet = new Set<int | null>();
          const queue: containers.ArrayBlockingQueue<int | null> =
            new containers.ArrayBlockingQueue<int | null>(0, emptySet);
          expect(String(queue.size)).assertEqual('0');
          expect(String(queue.capacity)).assertEqual('0');
        } catch (error) {
          expect(error instanceof Error).assertTrue();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMON_LIBRARY_UTIL_BASE_containers.ArrayBlockingQueueCONSTRUCTORWITHSETTEST_212
     * @tc.name ArrayBlockingQueueConstructorWith_Test_static_013
     * @tc.desc The test uses undefined as the iterable object to initialize the queue (capacity = 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("ArrayBlockingQueueConstructorWith_Test_static_013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const map = new Set<int | undefined>()
          const queue: containers.ArrayBlockingQueue<int | undefined> =
            new containers.ArrayBlockingQueue<int | undefined>(1, map.values());
          expect(String(queue.size)).assertEqual('0');
          expect(String(queue.capacity)).assertEqual('1');
        } catch (error) {
          expect(error instanceof Error).assertTrue();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMON_LIBRARY_UTIL_BASE_containers.ArrayBlockingQueueCONSTRUCTORWITHSETTEST_213
     * @tc.name ArrayBlockingQueueConstructorWith_Test_static_014
     * @tc.desc The test uses an array containing null/undefined to initialize the queue (capacity = 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("ArrayBlockingQueueConstructorWith_Test_static_014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const arrayWithNulls = new Array<Int | null | undefined>(1, null, 2, undefined, 3)
          const queue: containers.ArrayBlockingQueue<int | null | undefined> =
            new containers.ArrayBlockingQueue<int | null | undefined>(0, arrayWithNulls);
          expect(String(queue.size)).assertEqual('4');
          expect(String(queue.capacity)).assertEqual('0');
        } catch (error) {
          expect(error instanceof Error).assertTrue();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMON_LIBRARY_UTIL_BASE_containers.ArrayBlockingQueueCONSTRUCTORWITHSETTEST_214
     * @tc.name ArrayBlockingQueueConstructorWith_Test_static_015
     * @tc.desc The test uses an array containing null/undefined to initialize the queue (capacity = 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("ArrayBlockingQueueConstructorWith_Test_static_015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const arrayWithNulls = new Array<Int | null | undefined>(1, null, 2, undefined, 3)
          const queue: containers.ArrayBlockingQueue<int | null | undefined> =
            new containers.ArrayBlockingQueue<int | null | undefined>(1, arrayWithNulls);
          expect(String(queue.size)).assertEqual('1');
          expect(String(queue.capacity)).assertEqual('1');
        } catch (error) {
          expect(error instanceof Error).assertTrue();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMON_LIBRARY_UTIL_BASE_containers.ArrayBlockingQueueCONSTRUCTORWITHSETTEST_215
     * @tc.name ArrayBlockingQueueConstructorWith_Test_static_016
     * @tc.desc Tests initializing the queue using an iterable object with Int.MAX_VALUE elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("ArrayBlockingQueueConstructorWith_Test_static_016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const arr = new Map<int, int>();
          let maxCapacity = Int.MAX_VALUE
          const queue: containers.ArrayBlockingQueue<int> =
            new containers.ArrayBlockingQueue<int>(maxCapacity, arr.values());
          expect(String(queue.size)).assertEqual('0');
          expect(String(queue.capacity)).assertEqual(String(maxCapacity));
        } catch (error) {
          expect(error instanceof Error).assertTrue();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMON_LIBRARY_UTIL_BASE_containers.ArrayBlockingQueueCONSTRUCTORWITHSETTEST_216
     * @tc.name ArrayBlockingQueueConstructorWith_Test_static_017
     * @tc.desc To test the use of Map to initialize the queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("ArrayBlockingQueueConstructorWith_Test_static_017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const map = new Map<int, int>();
          map.set(1, 100);
          map.set(2, 200);
          map.set(3, 300);
          const queue: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(3, map.values());
          expect(String(queue.size)).assertEqual('3');
          expect(String(queue.capacity)).assertEqual('3');
        } catch (error) {
          expect(error instanceof Error).assertTrue();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMON_LIBRARY_UTIL_BASE_containers.ArrayBlockingQueueCONSTRUCTORWITHSETTEST_217
     * @tc.name ArrayBlockingQueueConstructorWith_Test_static_018
     * @tc.desc To test initializing queues using nested arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("ArrayBlockingQueueConstructorWith_Test_static_018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const nestedArray = new Map<int, int[]>();
          nestedArray.set(1, [1, 2]);
          nestedArray.set(2, [3, 4]);
          nestedArray.set(3, [5, 6]);
          const queue: containers.ArrayBlockingQueue<int> =
            new containers.ArrayBlockingQueue<int>(3, nestedArray.keys());
          expect(String(queue.size)).assertEqual('3');
          expect(String(queue.capacity)).assertEqual('3');
        } catch (error) {
          expect(error instanceof Error).assertTrue();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_containers.ArrayBlockingQueuePerformanceTest_218
     * @tc.name ArrayBlockingQueuePerformance_Test_static_001
     * @tc.desc 10 concurrent operations simultaneously add elements to the container.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("ArrayBlockingQueuePerformance_Test_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const threadCount = 10;
        const taskGroup = new taskpool.TaskGroup();
        let queueInt: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(threadCount);
        for (let i: int = 0; i < threadCount; i++) {
          taskGroup.addTask(createAddTask(queueInt, i));
        }
        await taskpool.execute(taskGroup);
        expect(JSON.stringify(queueInt.size)).assertEqual(JSON.stringify(threadCount));
        expect(queueInt.isEmpty()).assertFalse();
        done();
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_containers.ArrayBlockingQueuePerformanceTest_219
     * @tc.name ArrayBlockingQueuePerformance_Test_static_002
     * @tc.desc Initial container 100 elements, 10 concurrent simultaneous operation of the container to delete and remove elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("ArrayBlockingQueuePerformance_Test_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const totalCount: int = 100;
        const numbers: Array<int> = new Array<int>(10);
        for (let i = 0; i < totalCount; i++) {
          numbers.push(i);
        }
        const threadCount = 10;
        const taskGroup = new taskpool.TaskGroup();
        let iter = numbers.values();
        let queueInt: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(totalCount, iter);
        for (let i: int = 0; i < threadCount; i++) {
          taskGroup.addTask(createPopTask(queueInt));
        }
        await taskpool.execute(taskGroup);
        expect(JSON.stringify(queueInt.size)).assertEqual(JSON.stringify(totalCount - threadCount));
        expect(queueInt.isEmpty()).assertFalse();
        done();
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_containers.ArrayBlockingQueuePerformanceTest_220
     * @tc.name ArrayBlockingQueuePerformance_Test_static_003
     * @tc.desc Initial container with 100 elements. Ten concurrent operations simultaneously operate on the container to perform element deletion (poll operation).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("ArrayBlockingQueuePerformance_Test_static_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const totalCount: int = 100;
        const numbers: Array<int> = new Array<int>(100);
        for (let i = 0; i < totalCount; i++) {
          numbers.push(i);
        }
        const threadCount = 10;
        const taskGroup = new taskpool.TaskGroup();
        let iter = numbers.values();
        let queueInt: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(totalCount, iter);
        for (let i: int = 0; i < threadCount; i++) {
          taskGroup.addTask(createPollTask(queueInt));
        }
        await taskpool.execute(taskGroup);
        expect(JSON.stringify(queueInt.size)).assertEqual(JSON.stringify(totalCount - threadCount));
        expect(queueInt.isEmpty()).assertFalse();
        done();
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_containers.ArrayBlockingQueuePerformanceTest_221
     * @tc.name ArrayBlockingQueuePerformance_Test_static_004
     * @tc.desc Push 100 data, poll 100 data.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("ArrayBlockingQueuePerformance_Test_static_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const totalCount: int = 100;
        let queueInt: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(totalCount);
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_containers.ArrayBlockingQueuePerformanceTest_222
     * @tc.name ArrayBlockingQueuePerformance_Test_static_005
     * @tc.desc add 100 pieces of data, pop 100 pieces of data.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("ArrayBlockingQueuePerformance_Test_static_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const totalCount: int = 100;
        let queueInt: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(totalCount);
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_containers.ArrayBlockingQueueAsyncTest_223
     * @tc.name ArrayBlockingQueueAsync_Test_static_001
     * @tc.desc The host thread adds 1000 pieces of data, and 10 threads poll out the data at the same time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("ArrayBlockingQueueAsync_Test_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const totalCount: int = thousandTimes;
        const taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        let queueInt: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(totalCount);
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_containers.ArrayBlockingQueueAsyncTest_224
     * @tc.name ArrayBlockingQueueAsync_Test_static_002
     * @tc.desc Multi-thread (10) push inserts a total of 1000 data, and the host thread pops out the data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("ArrayBlockingQueueAsync_Test_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const totalCount: int = thousandTimes;
        const taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        let queueInt: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(totalCount);
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_containers.ArrayBlockingQueueAsyncTest_225
     * @tc.name ArrayBlockingQueueAsync_Test_static_003
     * @tc.desc Multi-threaded operation. Thread A inserts data, and thread B takes out data.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("ArrayBlockingQueueAsync_Test_static_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const totalCount: int = 100;
        const taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        let queueInt: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(totalCount);
        taskGroup.addTask(createPushTaskStart(queueInt, totalCount));
        taskGroup.addTask(createPopTaskStart(queueInt, totalCount));
        await taskpool.execute(taskGroup);
        expect(JSON.stringify(queueInt.size)).assertEqual('0');
        expect(queueInt.isEmpty()).assertTrue();
        done();
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_containers.ArrayBlockingQueueAsyncTest_226
     * @tc.name ArrayBlockingQueueAsync_Test_static_004
     * @tc.desc Threads add elements simultaneously to verify the thread safety of the queue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("ArrayBlockingQueueAsync_Test_static_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        let queueInt: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(100);
        for (let i = 0; i < 10; i++) {
          taskGroup.addTask(createPushTaskStartLoopTen(queueInt, i));
        }
        await taskpool.execute(taskGroup);
        expect(JSON.stringify(queueInt.size)).assertEqual('100');
        expect(queueInt.isEmpty()).assertFalse();
        done();
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_containers.ArrayBlockingQueueAsyncTest_227
     * @tc.name ArrayBlockingQueueAsync_Test_static_005
     * @tc.desc Preset 1000 pieces of data, 10 threads remove elements at the same time, verify the thread safety of the queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("ArrayBlockingQueueAsync_Test_static_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const totalCount: int = thousandTimes;
        const taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        let queueInt: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(totalCount);
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_containers.ArrayBlockingQueueAsyncTest_228
     * @tc.name ArrayBlockingQueueAsync_Test_static_006
     * @tc.desc 10 threads at the same time: loop 1000 times, after add getFirst, isEmpty, get size, push, pop, remove, remainingCapacity combined call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("ArrayBlockingQueueAsync_Test_static_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const totalCount: int = thousandTimes;
        const taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        let queueInt: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(totalCount);
        for (let i = 0; i < totalCount; i++) {
          queueInt.add(i);
        }
        expect(JSON.stringify(queueInt.size)).assertEqual(JSON.stringify(totalCount));
        for (let i = 0; i < 10; i++) {
          taskGroup.addTask(createPollTaskHundred(queueInt, i * hundredTimes));
        }
        await taskpool.execute(taskGroup);
        expect(JSON.stringify(queueInt.remainingCapacity())).assertEqual(JSON.stringify(totalCount));
        expect(JSON.stringify(queueInt.size)).assertEqual('0');
        expect(JSON.stringify(queueInt.getFirst()).toString()).assertEqual('undefined');
        expect(queueInt.isEmpty()).assertTrue();
        done();
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_containers.ArrayBlockingQueueAsyncTest_229
     * @tc.name ArrayBlockingQueueAsync_Test_static_007
     * @tc.desc 10 thread A and 10 thread B. Each thread calls add(element) or poll() 1,000 times.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("ArrayBlockingQueueAsync_Test_static_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const totalCount: int = thousandTimes;
        const taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        const taskGroupPoll: taskpool.TaskGroup = new taskpool.TaskGroup();
        let queueInt: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(totalCount);

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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_containers.ArrayBlockingQueueAsyncTest_230
     * @tc.name ArrayBlockingQueueAsync_Test_static_008
     * @tc.desc 10 threads A and 10 threads B, each calling push (element) or pop () 1,000 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("ArrayBlockingQueueAsync_Test_static_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const totalCount: int = thousandTimes;
        const taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        const taskPopGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        let queueInt: containers.ArrayBlockingQueue<int> = new containers.ArrayBlockingQueue<int>(totalCount);

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
     * @tc.number SUB_COMMON_LIBRARY_UTIL_BASE_ARRAY_BLOCKING_QUEUE_CONSTRUCTOR_WITH_SET_TEST_232
     * @tc.name ArrayBlockingQueueConstructorWith_Test_static_0001
     * @tc.desc empty queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("ArrayBlockingQueueConstructorWith_Test_static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const emptyArray = new Array<Int>();
          const queue = new containers.ArrayBlockingQueue<Int>(0, emptyArray);
          expect(queue.isEmpty()).assertFalse();
          expect(String(queue.size)).assertEqual('0');
          expect(String(queue.capacity)).assertEqual('0');
        } catch (error) {
          expect(error instanceof Error).assertTrue();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMON_LIBRARY_UTIL_BASE_containers.ArrayBlockingQueueCONSTRUCTOR_WITH_SET_TEST_233
     * @tc.name ArrayBlockingQueueConstructorWith_Test_static_0002
     * @tc.desc empty queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("ArrayBlockingQueueConstructorWith_Test_static_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const emptyArray = new Array<Int>();
          const queue = new containers.ArrayBlockingQueue<Int>(0, emptyArray);
          expect(queue.isEmpty()).assertFalse();
          expect(String(queue.size)).assertEqual('0');
          expect(String(queue.capacity)).assertEqual('0');
        } catch (error) {
          expect(error instanceof Error).assertTrue();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMON_LIBRARY_UTIL_BASE_containers.ArrayBlockingQueueCONSTRUCTOR_WITH_SET_TEST_234
     * @tc.name ArrayBlockingQueueConstructorWith_Test_static_003
     * @tc.desc Blocks until the queue has an element to take out
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("ArrayBlockingQueueConstructorWith_Test_static_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const queue = new containers.ArrayBlockingQueue<number>(10);
        let popCompleted = false;
        let popResult: number = 0;
        const popTask = new taskpool.Task(() => {
          popResult = queue.pop();
          popCompleted = true;
        });
        const pushTask = new taskpool.Task(() => {
          setTimeout(() => {
            queue.push(42);
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