import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, TestType, Size, Level, expect } from '@ohos/hypium';
import { util, LinkedList } from '@kit.ArkTS';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function LinkedListTest10() {
  describe('LinkedListTest10', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await sleep(30);
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    
    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_0100
     * @tc.name      testLinkedList10Chapter0001
     * @tc.desc      Test removeFirst with object containing ArrayBuffer property of Object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0001';
      console.log(TAG + ' start');

      interface testObject_1 {
        buffer: ArrayBuffer
      }

      const newLinkedList = new LinkedList<testObject_1>()
      let test: testObject_1 = { buffer: new ArrayBuffer(16) }

      let uint8View = new Uint8Array(test.buffer)
      uint8View[0] = 10
      uint8View[1] = 20
      uint8View[2] = 30
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() ===test).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_0200
     * @tc.name      testLinkedList10Chapter0002
     * @tc.desc      Test removeFirst with object containing DataView property of Object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0058';
      console.log(TAG + ' start');

      interface testObject_1 {
        view: DataView
      }
      const newLinkedList = new LinkedList<testObject_1>()
      const arrayBuffer = new ArrayBuffer(16)
      let test: testObject_1 = {view: new DataView(arrayBuffer)}
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() ===test).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_0300
     * @tc.name      testLinkedList10Chapter0003
     * @tc.desc      Test removeFirst with empty object of Object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0003';
      console.log(TAG + ' start');

      interface testObject_1 {}
      const newLinkedList = new LinkedList<testObject_1>()
      let test: testObject_1 = {}
      newLinkedList.add(test)
      newLinkedList.add(test)
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() ===test).assertTrue()
      expect(newLinkedList.removeFirst() ===test).assertTrue()
      expect(newLinkedList.removeFirst() ===test).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_0400
     * @tc.name      testLinkedList10Chapter0004
     * @tc.desc      Test removeFirst with huge object of Object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0004';
      console.log(TAG + ' start');

      const hugeObj: Record<string, number> = {};

      const newLinkedList = new LinkedList<Record<string, number>>()
      for (let i = 0; i < 10000; i++) {
        hugeObj[i.toString()] = i;
      }
      newLinkedList.add(hugeObj);
      newLinkedList.add(hugeObj);
      const start = Date.now()
      expect(newLinkedList.removeFirst() === hugeObj).assertTrue()
      const cost = Date.now()   - start

      expect(newLinkedList.length).assertEqual(1)

      const newText = newLinkedList.getLast()
      expect(newText['5000']).assertEqual(5000)

      expect(cost < 10).assertTrue()
      expect(newLinkedList.length).assertEqual(1)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_0500
     * @tc.name      testLinkedList10Chapter0005
     * @tc.desc      Test removeFirst with object containing null property of Object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0005';
      console.log(TAG + ' start');

      interface testObject_1 {
        a: null,
        b: number
      }

      const newLinkedList = new LinkedList<testObject_1>()
      let test: testObject_1 = {a: null, b: 1}
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() ===test).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_0600
     * @tc.name      testLinkedList10Chapter0006
     * @tc.desc      Test removeFirst with object containing NaN property of Object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0006';
      console.log(TAG + ' start');

      interface testObject_1 {
        a: number,
        b: number
      }

      const newLinkedList = new LinkedList<testObject_1>()
      let test: testObject_1 = {a: NaN, b: 1}
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() ===test).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_0700
     * @tc.name      testLinkedList10Chapter0007
     * @tc.desc      Test removeFirst with object containing Infinity property of Object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0007';
      console.log(TAG + ' start');

      interface testObject_1 {
        a: number,
        b: number
      }

      const newLinkedList = new LinkedList<testObject_1>()
      let test: testObject_1 = {a: Infinity, b: 1}
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() ===test).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_0800
     * @tc.name      testLinkedList10Chapter0008
     * @tc.desc      Test removeFirst with object containing TypedArray property of Object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0008';
      console.log(TAG + ' start');

      interface testObject_1 {
        a: number,
        b: Uint8Array
      }

      const newLinkedList = new LinkedList<testObject_1>()
      let test: testObject_1 = {a: Infinity, b: new Uint8Array([172, 101, 108, 108, 111])}
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() ===test).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_0900
     * @tc.name      testLinkedList10Chapter0009
     * @tc.desc      Test removeFirst with object containing Map property of Object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0009';
      console.log(TAG + ' start');


      interface testObject_1 {
        map: Map<string, string>,
      }

      const newLinkedList = new LinkedList<testObject_1>()
      let test: testObject_1 = {map: new Map([['key1', 'value1'], ['key2', 'value2']])}
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() ===test).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_1000
     * @tc.name      testLinkedList10Chapter0010
     * @tc.desc      Test removeFirst with object containing Set property of Object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0010';
      console.log(TAG + ' start');


      interface testObject_1 {
        set: Set<number>,
      }

      const newLinkedList = new LinkedList<testObject_1>()
      let test: testObject_1 = {set: new Set([1,2,3,2,1])}
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() ===test).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_1100
     * @tc.name      testLinkedList10Chapter0011
     * @tc.desc      Test removeFirst with object containing Promise property of Object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const TAG = 'testLinkedList10Chapter0011';
      console.log(TAG + ' start');

      interface testObject_1 {
        promise: Promise<string>,
      }

      const newLinkedList = new LinkedList<testObject_1>()

      let isResolved = false;
      const testPromise = new Promise<string>((resolve) => {
        setTimeout(() => {
          isResolved = true;
          resolve('done');
        }, 100);
      });

      const test: testObject_1 = {promise: testPromise}
      newLinkedList.add(test)

      const promiseResult = await testPromise;
      expect(isResolved).assertTrue()
      expect(promiseResult).assertEqual('done')
      expect(newLinkedList.removeFirst() ===test).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_1200
     * @tc.name      testLinkedList10Chapter0012
     * @tc.desc      Test removeFirst with object containing regular expression property of Object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0012';
      console.log(TAG + ' start');

      interface testObject_1 {
        regex: RegExp,
        flags: string
      }

      const newLinkedList = new LinkedList<testObject_1>()

      const testRegex = /abc/gi
      const test: testObject_1 = {
        regex: testRegex,
        flags: testRegex.flags
      }
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() ===test).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_1300
     * @tc.name      testLinkedList10Chapter0013
     * @tc.desc      Test removeFirst with normal Uint8Array of Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0013';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const test = new Uint8Array([72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63])
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() ===test).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_1400
     * @tc.name      testLinkedList10Chapter0014
     * @tc.desc      Test removeFirst with array containing multiple 0 values of Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0014';
      console.log(TAG + ' start');
      const newLinkedList = new LinkedList<Uint8Array>()
      const test = new Uint8Array([72, 101, 108, 108, 111, 87, 111, 114, 108,0,0,0,0,0, 100, 49, 50, 51, 63])
      newLinkedList.add(test);
      newLinkedList.add(test);
      expect(newLinkedList.get(0).length).assertEqual(19)
      expect(newLinkedList.removeFirst() ===test).assertTrue()
      expect(newLinkedList.length).assertEqual(1)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_1500
     * @tc.name      testLinkedList10Chapter0015
     * @tc.desc      Test removeFirst with Array converted to Uint8Array containing negative numbers of Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0015';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const test = new Uint8Array([72, 101, 108, 108, 111, -87, -111, -114, 108, 100, -49, 50, 51, 63])
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() ===test).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_1600
     * @tc.name      testLinkedList10Chapter0016
     * @tc.desc      Test removeFirst with Array converted to Uint8Array/Uint16Array containing negative numbers of Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0016';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const newLinkedList1 = new LinkedList<Uint16Array>()
      const test = new Uint8Array([72, 101, 108, 108, 111, -87, -111, -114, 108, 100, -49, 50, 51, 63])
      const test1 = new Uint16Array([72, 101, 108, 108, 111, -87, -111, -114, 108, 100, -49, 50, 51, 63])
      newLinkedList.add(test)
      newLinkedList1.add(test1);
      expect(newLinkedList.removeFirst() ===test).assertTrue()
      expect(newLinkedList1.removeFirst() ===test1).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
      expect(newLinkedList1.length).assertEqual(0)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_1700
     * @tc.name      testLinkedList10Chapter0017
     * @tc.desc      Test removeFirst with special array of Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0017';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Array<number | string>>()
      const test:Array<number | string> = []
      test["abc"] = 111
      test["aaa"] = 222
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() ===test).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_1800
     * @tc.name      testLinkedList10Chapter0018
     * @tc.desc      Test removeFirst with array containing NaN/Infinity of Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0018';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const test = new Uint8Array([72, 101, 108, NaN, Infinity, 108, 111])
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() ===test).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    })


    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_1900
     * @tc.name      testLinkedList10Chapter0019
     * @tc.desc      Test removeFirst with array containing non-numeric types of Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0019';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Array<number | string | boolean | null | undefined>>()
      const test:Array<number | string | boolean | null | undefined> = [72, "abc", true, null, undefined, 108]
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() ===test).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_2000
     * @tc.name      testLinkedList10Chapter0020
     * @tc.desc      Test removeFirst with empty array of Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0020';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Array<string>>()
      const test:Array<string> = []
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() ===test).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_2100
     * @tc.name      testLinkedList10Chapter0021
     * @tc.desc      Test removeFirst with array containing huge numeric overflow values of Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0021';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const test = new Uint8Array([256, 65536, 32768])
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() ===test).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_2200
     * @tc.name      testLinkedList10Chapter0022
     * @tc.desc      Test removeFirst with Int8Array | Uint8Array | Uint8ClampedArray of Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0022';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Int8Array | Uint8Array | Uint8ClampedArray>()
      const test1 = new Int8Array([127, -128, 128, -129])
      const test2 = new Uint8Array([255, 0, 256, -1])
      const test3 = new Uint8ClampedArray([255, 0, 256, -1])
      newLinkedList.add(test1)
      newLinkedList.add(test2)
      newLinkedList.add(test3)
      expect(newLinkedList.removeFirst() ===test1).assertTrue()
      expect(newLinkedList.removeFirst() ===test2).assertTrue()
      expect(newLinkedList.removeFirst() ===test3).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_2300
     * @tc.name      testLinkedList10Chapter0023
     * @tc.desc      Test removeFirst with Int16Array | Uint16Array | Int32Array | Uint32Array of Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0023';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Int16Array | Uint16Array | Int32Array | Uint32Array>()
      const test1 = new Int16Array([32767, -32768, 32769, -32769])
      const test2 = new Uint16Array([65535, 0, 65536, -1])
      const test3 = new Int32Array([2147483647, -2147483648, 2147483648, -2147483649])
      const test4 = new Uint32Array([4294967295, 0, 4294967296, -1])
      newLinkedList.add(test1)
      newLinkedList.add(test2)
      newLinkedList.add(test3)
      newLinkedList.add(test4)
      expect(newLinkedList.removeFirst() ===test1).assertTrue()
      expect(newLinkedList.removeFirst() ===test2).assertTrue()
      expect(newLinkedList.removeFirst() ===test3).assertTrue()
      expect(newLinkedList.removeFirst() ===test4).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_2400
     * @tc.name      testLinkedList10Chapter0024
     * @tc.desc      Test removeFirst with Float32Array | Float64Array | BigInt64Array | BigUint64Array of Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0024';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Float32Array | Float64Array | BigInt64Array | BigUint64Array>()
      const test1 = new Float32Array([
        3.4028234663852886e38, 1.401298464324817e-45, -3.4028234663852886e38, 3.5e38, -3.5e38
      ])
      const test2 = new Float64Array([
        1.7976931348623157e308, 5e-324, -1.7976931348623157e308, 1.8e308, -1.8e308
      ]);
      const test3 = new BigInt64Array([
        9223372036854775807n, -9223372036854775808n, 9223372036854775808n, -9223372036854775809n
      ]);
      const test4 = new BigUint64Array([
        18446744073709551615n, 0n, 18446744073709551616n, -1n
      ])
      newLinkedList.add(test1)
      newLinkedList.add(test2)
      newLinkedList.add(test3)
      newLinkedList.add(test4)
      expect(newLinkedList.removeFirst() ===test1).assertTrue()
      expect(newLinkedList.removeFirst() ===test2).assertTrue()
      expect(newLinkedList.removeFirst() ===test3).assertTrue()
      expect(newLinkedList.removeFirst() ===test4).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_2500
     * @tc.name      testLinkedList10Chapter0025
     * @tc.desc      Test removeFirst with TypedArray special value storage rules of Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0025';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<
      Float32Array | Float64Array | Int8Array | Uint8Array | Uint8ClampedArray |
      Int16Array | Uint16Array | Int32Array | Uint32Array
      >()

      const test1 = new Float32Array([Infinity, -Infinity, NaN])
      const test2 = new Float64Array([Infinity, -Infinity, NaN])
      const test3 = new Int8Array([Infinity, -Infinity, NaN])
      const test4 = new Uint8Array([Infinity, -Infinity, NaN])
      const test5 = new Uint8ClampedArray([Infinity, -Infinity, NaN])
      const test6 = new Int16Array([Infinity, -Infinity, NaN])
      const test7 = new Uint16Array([Infinity, -Infinity, NaN])
      const test8 = new Int32Array([Infinity, -Infinity, NaN])
      newLinkedList.add(test1)
      newLinkedList.add(test2)
      newLinkedList.add(test3)
      newLinkedList.add(test4)
      newLinkedList.add(test5)
      newLinkedList.add(test6)
      newLinkedList.add(test7)
      newLinkedList.add(test8)
      expect(newLinkedList.removeFirst() ===test1).assertTrue()
      expect(newLinkedList.removeFirst() ===test2).assertTrue()
      expect(newLinkedList.removeFirst() ===test3).assertTrue()
      expect(newLinkedList.removeFirst() ===test4).assertTrue()
      expect(newLinkedList.removeFirst() ===test5).assertTrue()
      expect(newLinkedList.removeFirst() ===test6).assertTrue()
      expect(newLinkedList.removeFirst() ===test7).assertTrue()
      expect(newLinkedList.removeFirst() ===test8).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_2600
     * @tc.name      testLinkedList10Chapter0026
     * @tc.desc      Test that deleting an empty container throws an error as expected
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0026';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      try {
        expect(newLinkedList.removeFirst()).assertUndefined()
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} fail,err:${err}`);
        expect(String(err)).assertContain("Container is empty")
      }
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_2700
     * @tc.name      testLinkedList10Chapter0027
     * @tc.desc      Test removeLast with undefined value of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0027';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = undefined
      newLinkedList.add(test)
      expect(newLinkedList.removeLast() === test).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_2800
     * @tc.name      testLinkedList10Chapter0028
     * @tc.desc      Test removeLast with null value of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0028';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = null
      newLinkedList.add(test)
      expect(newLinkedList.removeLast() === test).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_2900
     * @tc.name      testLinkedList10Chapter0029
     * @tc.desc      Test removeLast with empty string of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0029';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = ""
      newLinkedList.add(test)
      expect(newLinkedList.removeLast() === test).assertTrue()

    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_3000
     * @tc.name      testLinkedList10Chapter0030
     * @tc.desc      Test removeLast with full coverage of special characters of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0030';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~"
      newLinkedList.add(test)
      expect(newLinkedList.removeLast() === test).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_3100
     * @tc.name      testLinkedList10Chapter0031
     * @tc.desc      Test removeLast with full coverage of ASCII codes of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0031';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~"
      newLinkedList.add(test)
      expect(newLinkedList.removeLast() === test).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_3200
     * @tc.name      testLinkedList10Chapter0032
     * @tc.desc      Test removeLast with full coverage of special characters (twice) of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0032';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = " !!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~"
      newLinkedList.add(test)
      expect(newLinkedList.removeLast() === test).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_3300
     * @tc.name      testLinkedList10Chapter0033
     * @tc.desc      Test removeLast with special escape characters of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0033';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      expect(newLinkedList.add("\a")).assertTrue()
      expect(newLinkedList.add("\b")).assertTrue()
      expect(newLinkedList.add("\f")).assertTrue()
      expect(newLinkedList.add("\n")).assertTrue()
      expect(newLinkedList.add("\r")).assertTrue()
      expect(newLinkedList.add("\t")).assertTrue()
      expect(newLinkedList.add("\v")).assertTrue()
      expect(newLinkedList.add("\\")).assertTrue()
      expect(newLinkedList.add("\'")).assertTrue()
      expect(newLinkedList.add("\"")).assertTrue()
      expect(newLinkedList.add("\?")).assertTrue()
      expect(newLinkedList.add("\0")).assertTrue()
      expect(newLinkedList.add("\d")).assertTrue()
      expect(newLinkedList.add("\x31")).assertTrue()
      expect(newLinkedList.removeLast() ==="\x31").assertTrue()
      expect(newLinkedList.removeLast() ==="\d").assertTrue()
      expect(newLinkedList.removeLast() ==="\0").assertTrue()
      expect(newLinkedList.removeLast() ==="\?").assertTrue()
      expect(newLinkedList.removeLast() ==="\"").assertTrue()
      expect(newLinkedList.removeLast() ==="\'").assertTrue()
      expect(newLinkedList.removeLast() ==="\\").assertTrue()
      expect(newLinkedList.removeLast() ==="\v").assertTrue()
      expect(newLinkedList.removeLast() ==="\t").assertTrue()
      expect(newLinkedList.removeLast() ==="\r").assertTrue()
      expect(newLinkedList.removeLast() ==="\n").assertTrue()
      expect(newLinkedList.removeLast() === "\f").assertTrue()
      expect(newLinkedList.removeLast() === "\b").assertTrue()
      expect(newLinkedList.removeLast() === "\a").assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_3400
     * @tc.name      testLinkedList10Chapter0034
     * @tc.desc      Test removeLast with emojis and their Unicode encodings of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0034';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      expect(newLinkedList.add("👆")).assertTrue()
      expect(newLinkedList.add("👿")).assertTrue()
      expect(newLinkedList.add("👀")).assertTrue()
      expect(newLinkedList.add("💯")).assertTrue()
      expect(newLinkedList.add("🎅")).assertTrue()
      expect(newLinkedList.add("😼")).assertTrue()
      expect(newLinkedList.add("🔧")).assertTrue()
      expect(newLinkedList.add("💇")).assertTrue()
      expect(newLinkedList.add("🤼‍♂️")).assertTrue()
      expect(newLinkedList.add("🛢")).assertTrue()
      expect(newLinkedList.add("🀄")).assertTrue()
      expect(newLinkedList.add("🏴")).assertTrue()
      expect(newLinkedList.removeLast() ===`\ud83c\udff4`).assertTrue()
      expect(newLinkedList.removeLast() ===`\ud83c\udc04`).assertTrue()
      expect(newLinkedList.removeLast() ===`\ud83d\udee2`).assertTrue()
      expect(newLinkedList.removeLast() ===`\ud83e\udd3c\u200d\u2642\ufe0f`).assertTrue()
      expect(newLinkedList.removeLast() ===`\ud83d\udc87`).assertTrue()
      expect(newLinkedList.removeLast() ===`\ud83d\udd27`).assertTrue()
      expect(newLinkedList.removeLast() ===`\ud83d\ude3c`).assertTrue()
      expect(newLinkedList.removeLast() ===`\ud83c\udf85`).assertTrue()
      expect(newLinkedList.removeLast() ===`\ud83d\udcaf`).assertTrue()
      expect(newLinkedList.removeLast() ===`\ud83d\udc40`).assertTrue()
      expect(newLinkedList.removeLast() ===`\ud83d\udc7f`).assertTrue()
      expect(newLinkedList.removeLast() ===`\ud83d\udc46`).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_3500
     * @tc.name      testLinkedList10Chapter0035
     * @tc.desc      Test removeLast with invalid Unicode encodings of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0035';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      expect(newLinkedList.add(`\udc04`)).assertTrue()
      expect(newLinkedList.add(`\ud83d`)).assertTrue()
      expect(newLinkedList.add(`\udff4`)).assertTrue()
      expect(newLinkedList.removeLast() ===`\udff4`).assertTrue()
      expect(newLinkedList.removeLast() ===`\ud83d`).assertTrue()
      expect(newLinkedList.removeLast() ===`\udc04`).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_3600
     * @tc.name      testLinkedList10Chapter0036
     * @tc.desc      Test removeLast with keywords of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0036';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      expect(newLinkedList.add(`"0" `)).assertTrue()
      expect(newLinkedList.add(`"NaN"`)).assertTrue()
      expect(newLinkedList.add(`“”`)).assertTrue()
      expect(newLinkedList.removeLast() ===`“”`).assertTrue()
      expect(newLinkedList.removeLast() ===`"NaN"`).assertTrue()
      expect(newLinkedList.removeLast() ===`"0" `).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_3700
     * @tc.name      testLinkedList10Chapter0037
     * @tc.desc      Test removeLast with treeString type of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0037';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()

      let init: (size: number) => string = (size: number): string => {
        let ans = '[';
        while (ans.length < size) {
          ans += '{"a":1},';
        }
        ans += '{"a":1}]';
        return ans;
      };
      expect(newLinkedList.add(init(10))).assertTrue()
      expect(newLinkedList.add(init(100))).assertTrue()
      expect(newLinkedList.add(init(1000))).assertTrue()
      expect(newLinkedList.add(init(10000))).assertTrue()
      expect(newLinkedList.add(init(100000))).assertTrue()
      expect(newLinkedList.removeLast() ===init(100000)).assertTrue()
      expect(newLinkedList.removeLast() ===init(10000)).assertTrue()
      expect(newLinkedList.removeLast() ===init(1000)).assertTrue()
      expect(newLinkedList.removeLast() ===init(100)).assertTrue()
      expect(newLinkedList.removeLast() ===init(10)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_3800
     * @tc.name      testLinkedList10Chapter0038
     * @tc.desc      Test removeLast with sliceString type of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0038';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()

      let str = "{k1:value1,k2:value2}"

      for (let i = 0; i < 10; i++){
        let result = str.substring(0,str.length-2);
        str = result
        expect(newLinkedList.add(str)).assertTrue()
        expect(newLinkedList.removeLast() ===str).assertTrue()
      }
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_3900
     * @tc.name      testLinkedList10Chapter0039
     * @tc.desc      Test String GC for removeLast: linked list works after releasing extra-long string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0039';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const largeStr = 'a'.repeat(10 * 10 * 10);
      expect(newLinkedList.add(largeStr)).assertTrue()
      expect(newLinkedList.removeLast() ===largeStr).assertTrue()

      let temp = newLinkedList
      temp.clear();

      const newLargeStr = "c".repeat(10 * 10 * 10)
      expect(newLinkedList.add(newLargeStr)).assertTrue()
      expect(newLinkedList.removeLast() ===newLargeStr).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_4000
     * @tc.name      testLinkedList10Chapter0040
     * @tc.desc      Test removeLast with value 0 of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0040';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let test = 0
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeLast() ===test).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_4100
     * @tc.name      testLinkedList10Chapter0041
     * @tc.desc      Test removeLast with undefined value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0041';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let test = undefined
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeLast() ===test).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_4200
     * @tc.name      testLinkedList10Chapter0042
     * @tc.desc      Test removeLast with NaN value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0042';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let test = NaN
      newLinkedList.add( test)
      expect(Number.isNaN(newLinkedList.removeLast())).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_4300
     * @tc.name      testLinkedList10Chapter0043
     * @tc.desc      Test removeLast with value -0 of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0043';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let test = -0
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeLast() ===test).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_4400
     * @tc.name      testLinkedList10Chapter0044
     * @tc.desc      Test removeLast with positive infinity of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0044';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let test = Infinity
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeLast() ===test).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_4500
     * @tc.name      testLinkedList10Chapter0045
     * @tc.desc      Test removeLast with negative infinity of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0045';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let test = -Infinity
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeLast() ===test).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_4600
     * @tc.name      testLinkedList10Chapter0046
     * @tc.desc      Test removeLast with double type value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0046';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let test = Math.floor(1.5)
      expect(newLinkedList.add(test)).assertTrue()

      expect(newLinkedList.removeLast() ===test).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_4700
     * @tc.name      testLinkedList10Chapter0047
     * @tc.desc      Test removeLast with Number.MAX_VALUE of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0047';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let test = 1.7976931348623157e+308
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeLast() ===test).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_4800
     * @tc.name      testLinkedList10Chapter0048
     * @tc.desc      Test removeLast with Number.MIN_VALUE of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0048';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let test = 5e-324
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeLast() ===test).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_4900
     * @tc.name      testLinkedList10Chapter0049
     * @tc.desc      Test removeLast with Number.EPSILON of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0049';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let test = 2.220446049250313e-16
      newLinkedList.add(test)
      expect(newLinkedList.removeLast() ===test).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_5000
     * @tc.name      testLinkedList10Chapter0050
     * @tc.desc      Test removeLast with Number.EPSILON of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0050';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let test = 2^53 - 1
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeLast() ===test).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_5100
     * @tc.name      testLinkedList10Chapter0051
     * @tc.desc      Test removeLast with byte type value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0051';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let test = -64
      newLinkedList.add(test)
      expect(newLinkedList.removeLast() ===test).assertTrue()

      test = -128
      newLinkedList.add(test)
      expect(newLinkedList.removeLast() ===test).assertTrue()

      test = 127
      newLinkedList.add(test)
      expect(newLinkedList.removeLast() ===test).assertTrue()

      test = 128
      newLinkedList.add(test)
      expect(newLinkedList.removeLast() ===test).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_5200
     * @tc.name      testLinkedList10Chapter0052
     * @tc.desc      Test removeLast with out-of-bounds byte value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0052';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const test = 128
      newLinkedList.add(test)
      expect(newLinkedList.removeLast() ===test).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_5300
     * @tc.name      testLinkedList10Chapter0053
     * @tc.desc      Test removeLast with short type value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0053';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let test = 10000
      newLinkedList.add(test)
      expect(newLinkedList.removeLast() ===test).assertTrue()

      test = -32768
      newLinkedList.add(test)
      expect(newLinkedList.removeLast() ===test).assertTrue()

      test = 32767
      newLinkedList.add(test)
      expect(newLinkedList.removeLast() ===test).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_5400
     * @tc.name      testLinkedList10Chapter0054
     * @tc.desc      Test removeLast with out-of-bounds short value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0054';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const test = 32768
      newLinkedList.add(test)
      expect(newLinkedList.removeLast() ===test).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_5500
     * @tc.name      testLinkedList10Chapter0055
     * @tc.desc      Test removeLast with int type value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0055';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let test = 1000000
      newLinkedList.add(test)
      expect(newLinkedList.removeLast() ===test).assertTrue()

      test = -2147483648
      newLinkedList.add(test)
      expect(newLinkedList.removeLast() ===test).assertTrue()

      test = 2147483647
      newLinkedList.add(test)
      expect(newLinkedList.removeLast() ===test).assertTrue()

    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_5600
     * @tc.name      testLinkedList10Chapter0056
     * @tc.desc      Test removeLast with out-of-bounds int value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0056';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const test = 2147483648
      newLinkedList.add(test)
      expect(newLinkedList.removeLast() ===test).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_5700
     * @tc.name      testLinkedList10Chapter0057
     * @tc.desc      Test removeLast with long type value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0057';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let test = 1234567890123456
      newLinkedList.add(test)
      expect(newLinkedList.removeLast() ===test).assertTrue()

      test = -9223372036854775808
      newLinkedList.add(test)
      expect(newLinkedList.removeLast() ===test).assertTrue()

      test = 9223372036854775807
      newLinkedList.add(test)
      expect(newLinkedList.removeLast() ===test).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_5800
     * @tc.name      testLinkedList10Chapter0058
     * @tc.desc      Test removeLast with out-of-bounds long value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0058';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const test = 9223372036854775808
      newLinkedList.add(test)
      expect(newLinkedList.removeLast() ===test).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_5900
     * @tc.name      testLinkedList10Chapter0059
     * @tc.desc      Test removeLast with float type value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0059';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let test = 3.14159
      newLinkedList.add(test)
      expect(newLinkedList.removeLast() ===test).assertTrue()

      test = 1.40129846432481707e-45
      newLinkedList.add(test)
      expect(newLinkedList.removeLast() ===test).assertTrue()

      test = 3.4028234663852860e+38
      newLinkedList.add(test)
      expect(newLinkedList.removeLast() ===test).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_6000
     * @tc.name      testLinkedList10Chapter0060
     * @tc.desc      Test removeLast with float precision loss scenario of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0060';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const float1 = 0.1;
      const float2 = 0.2;
      newLinkedList.add(float1);
      newLinkedList.add(float2);
      newLinkedList.add(0.3);
      newLinkedList.removeLast();
      const sum = Number(newLinkedList.get(0)) + Number(newLinkedList.get(1));
      expect(Math.abs(sum - 0.3) < 1e-10).assertTrue();
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_6100
     * @tc.name      testLinkedList10Chapter0061
     * @tc.desc      Test removeLast with double type value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0061';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let test = 12345.67890123456789
      newLinkedList.add(test)
      expect(newLinkedList.removeLast() ===test).assertTrue()

      test = 4.94065645841246544e-324
      newLinkedList.add(test)
      expect(newLinkedList.removeLast() ===test).assertTrue()

      test = 1.79769313486231570e+308
      newLinkedList.add(test)
      expect(newLinkedList.removeLast() ===test).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_6200
     * @tc.name      testLinkedList10Chapter0062
     * @tc.desc      Test removeLast with out-of-bounds double value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0062';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const test = 1.8e+308
      newLinkedList.add(test)
      expect(newLinkedList.removeLast() ===test).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_6300
     * @tc.name      testLinkedList10Chapter0063
     * @tc.desc      Test removeLast with char type value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0063';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let test = 0
      newLinkedList.add(test)
      expect(newLinkedList.removeLast() ===test).assertTrue()

      test = -65535
      newLinkedList.add(test)
      expect(newLinkedList.removeLast() ===test).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_6400
     * @tc.name      testLinkedList10Chapter0064
     * @tc.desc      Test removeLast with char stored as character of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0064';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const test = "a"
      newLinkedList.add(test.charCodeAt(0))
      const removedValue = newLinkedList.removeLast();
      expect(removedValue === test.charCodeAt(0)).assertTrue();
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_6500
     * @tc.name      testLinkedList10Chapter0065
     * @tc.desc      Test removeLast with out-of-bounds char value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0065';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const test = 65536
      newLinkedList.add(test)
      expect(newLinkedList.removeLast() ===test).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_6600
     * @tc.name      testLinkedList10Chapter0066
     * @tc.desc      Test removeLast with bigint value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0066';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const test = BigInt(0xdecafafecacefade)
      newLinkedList.add( Number(test))
      expect(newLinkedList.removeLast() === Number(test)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_6700
     * @tc.name      testLinkedList10Chapter0067
     * @tc.desc      Test removeLast with double value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0067';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const test = 123.456
      newLinkedList.add(test)
      expect(newLinkedList.removeLast() ===test).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_6800
     * @tc.name      testLinkedList10Chapter0068
     * @tc.desc      Test removeLast with float value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0068';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const test = 0xcafebabe
      newLinkedList.add(test)
      expect(newLinkedList.removeLast() ===test).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_6900
     * @tc.name      testLinkedList10Chapter0069
     * @tc.desc      Test removeLast with hexadecimal (16-bit) value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0069';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const test = 0x0102
      newLinkedList.add(test)
      expect(newLinkedList.removeLast() ===test).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_7000
     * @tc.name      testLinkedList10Chapter0070
     * @tc.desc      Test removeLast with 32-bit hexadecimal value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0070';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const test = 0x01020304
      newLinkedList.add(test)
      expect(newLinkedList.removeLast() ===test).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_7100
     * @tc.name      testLinkedList10Chapter0071
     * @tc.desc      Test removeLast with octal (8-bit) value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0071';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const test = 0x3
      newLinkedList.add(test)
      expect(newLinkedList.removeLast() ===test).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_7200
     * @tc.name      testLinkedList10Chapter0072
     * @tc.desc      Test removeLast with exponent operator value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0072';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const test = 2 ** 3
      newLinkedList.add(test)
      expect(newLinkedList.removeLast() ===test).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_7300
     * @tc.name      testLinkedList10Chapter0073
     * @tc.desc      Test removeLast with scientific notation value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0073';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let test = 1e3
      newLinkedList.add(test)
      expect(newLinkedList.removeLast() ===test).assertTrue()

      test = 2.5e-2
      newLinkedList.add(test)
      expect(newLinkedList.removeLast() ===test).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_7400
     * @tc.name      testLinkedList10Chapter0074
     * @tc.desc      Test removeLast with scientific notation value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0074';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const test = BigInt(9007199254740991n)
      newLinkedList.add( Number(test))
      expect(newLinkedList.removeLast() === Number(test)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_7500
     * @tc.name      testLinkedList10Chapter0075
     * @tc.desc      Test removeLast with true value of Boolean type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0075';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<boolean>()

      const test = true
      newLinkedList.add(test)
      expect(newLinkedList.removeLast() ===test).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_7600
     * @tc.name      testLinkedList10Chapter0076
     * @tc.desc      Test removeLast with false value of Boolean type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0076';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<boolean>()

      const test = false
      newLinkedList.add(test)
      expect(newLinkedList.removeLast() ===test).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_7700
     * @tc.name      testLinkedList10Chapter0077
     * @tc.desc      Test removeLast with values that are usually converted to false of Boolean type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0077';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<boolean>()

      const test01 = 0
      newLinkedList.add( Boolean(test01))
      expect(newLinkedList.removeLast() ===Boolean(test01)).assertTrue()

      const test02 = NaN
      newLinkedList.add( Boolean(test02))
      expect(newLinkedList.removeLast() ===Boolean(test02)).assertTrue()

      const test03 = ""
      newLinkedList.add( Boolean(test03))
      expect(newLinkedList.removeLast() ===Boolean(test03)).assertTrue()

      const test04 = null
      newLinkedList.add(Boolean(test04))
      expect(newLinkedList.removeLast() === Boolean(test04)).assertTrue()

      const test05 = undefined
      newLinkedList.add( Boolean(test05))
      expect(newLinkedList.removeLast() === Boolean(test05)).assertTrue()

    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_7800
     * @tc.name      testLinkedList10Chapter0078
     * @tc.desc      Test removeLast with ! + other data types of Boolean type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0078';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<boolean>()

      const test01 = !'s'
      newLinkedList.add(test01)
      expect(newLinkedList.removeLast() === Boolean(test01)).assertTrue()

      const test02 = !0
      newLinkedList.add(test02)
      expect(newLinkedList.removeLast() ===Boolean(test02)).assertTrue()

    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_7900
     * @tc.name      testLinkedList10Chapter0079
     * @tc.desc      Test removeLast with normal object of Object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0079';
      console.log(TAG + ' start');

      interface testObject_1 {
        a: number;
        b: string;
        c: number[];
      }

      const newLinkedList = new LinkedList<testObject_1>()
      let test: testObject_1 = {a:1, b:"test", c:[1,2,3]}
      newLinkedList.add(test)
      expect(newLinkedList.removeLast() ===test).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT10_8000
     * @tc.name      testLinkedList10Chapter0080
     * @tc.desc      Test removeLast with nested object of Object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList10Chapter0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList10Chapter0080';
      console.log(TAG + ' start');

      interface testObject_1 {
        a: number;
        b: string;
        c: number[];
      }
      interface testObject_2{
        d: number;
        e: testObject_1
      }

      const newLinkedList = new LinkedList<testObject_2>()
      let test: testObject_2 = {d: 10, e: {a:1, b:"test", c:[1,2,3]}}
      newLinkedList.add(test)
      expect(newLinkedList.removeLast() ===test).assertTrue()
    });
  })
}