import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, TestType, Size, Level, expect } from '@ohos/hypium';
import { util, LinkedList } from '@kit.ArkTS';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function LinkedListTest09() {
  describe('LinkedListTest09', () => {
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
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_0100
     * @tc.name      testLinkedList09Chapter0001
     * @tc.desc      Test removeByIndex with huge object of Object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0001';
      console.log(TAG + ' start');

      const hugeObj: Record<string, number> = {};

      const newLinkedList = new LinkedList<Record<string, number>>()
      for (let i = 0; i < 10000; i++) {
        hugeObj[i.toString()] = i;
      }
      newLinkedList.add(hugeObj);
      newLinkedList.add(hugeObj);
      const start = Date.now()
      expect(newLinkedList.removeByIndex(0) === hugeObj).assertTrue()
      const cost = Date.now()   - start

      expect(newLinkedList.length).assertEqual(1)

      const newText = newLinkedList.getLast()
      expect(newText['5000']).assertEqual(5000)

      expect(cost < 10).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_0200
     * @tc.name      testLinkedList09Chapter0002
     * @tc.desc      Test removeByIndex with object containing null property of Object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0002';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: null,
        b: number
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a: null, b: 1}
      newLinkedList.add(text)
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_0300
     * @tc.name      testLinkedList09Chapter0003
     * @tc.desc      Test removeByIndex with object containing NaN property of Object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0003';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: number,
        b: number
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a: NaN, b: 1}
      newLinkedList.add(text)
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_0400
     * @tc.name      testLinkedList09Chapter0004
     * @tc.desc      Test removeByIndex with object containing Infinity property of Object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0004';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: number,
        b: number
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a: Infinity, b: 1}
      newLinkedList.add(text)
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_0500
     * @tc.name      testLinkedList09Chapter0005
     * @tc.desc      Test removeByIndex with object containing TypedArray property of Object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0005';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: number,
        b: Uint8Array
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a: Infinity, b: new Uint8Array([172, 101, 108, 108, 111])}
      newLinkedList.add(text)
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_0600
     * @tc.name      testLinkedList09Chapter0006
     * @tc.desc      Test removeByIndex with object containing Map property of Object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0006';
      console.log(TAG + ' start');


      interface textObject_1 {
        map: Map<string, string>,
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {map: new Map([['key1', 'value1'], ['key2', 'value2']])}
      newLinkedList.add(text)
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_0700
     * @tc.name      testLinkedList09Chapter0007
     * @tc.desc      Test removeByIndex with object containing Set property of Object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0007';
      console.log(TAG + ' start');


      interface textObject_1 {
        set: Set<number>,
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {set: new Set([1,2,3,2,1])}
      newLinkedList.add(text)
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_0800
     * @tc.name      testLinkedList09Chapter0008
     * @tc.desc      Test removeByIndex with object containing Promise property of Object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const TAG = 'testLinkedList09Chapter0008';
      console.log(TAG + ' start');

      interface textObject_1 {
        promise: Promise<string>,
      }

      const newLinkedList = new LinkedList<textObject_1>()

      let isResolved = false;
      const testPromise = new Promise<string>((resolve) => {
        setTimeout(() => {
          isResolved = true;
          resolve('done');
        }, 100);
      });

      const text: textObject_1 = {promise: testPromise}
      newLinkedList.add(text)

      const promiseResult = await testPromise;
      expect(isResolved).assertTrue()
      expect(promiseResult).assertEqual('done')
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_0900
     * @tc.name      testLinkedList09Chapter0009
     * @tc.desc      Test removeByIndex with object containing regular expression property of Object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0009';
      console.log(TAG + ' start');

      interface textObject_1 {
        regex: RegExp,
        flags: string
      }

      const newLinkedList = new LinkedList<textObject_1>()

      const testRegex = /abc/gi
      const text: textObject_1 = {
        regex: testRegex,
        flags: testRegex.flags
      }
      newLinkedList.add(text)
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_1000
     * @tc.name      testLinkedList09Chapter0010
     * @tc.desc      Test removeByIndex with normal Uint8Array of Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0010';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const text = new Uint8Array([72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63])
      newLinkedList.add(text)
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_1100
     * @tc.name      testLinkedList09Chapter0011
     * @tc.desc      Test removeByIndex with array containing multiple 0 values of Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0011';
      console.log(TAG + ' start');
      const newLinkedList = new LinkedList<Uint8Array>()
      const text = new Uint8Array([72, 101, 108, 108, 111, 87, 111, 114, 108,0,0,0,0,0, 100, 49, 50, 51, 63])
      newLinkedList.add(text);
      newLinkedList.add(text);
      expect(newLinkedList.get(0).length).assertEqual(19)
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_1200
     * @tc.name      testLinkedList09Chapter0012
     * @tc.desc      Test removeByIndex with Array converted to Uint8Array containing negative numbers of Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0012';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const text = new Uint8Array([72, 101, 108, 108, 111, -87, -111, -114, 108, 100, -49, 50, 51, 63])
      newLinkedList.add(text)
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_1300
     * @tc.name      testLinkedList09Chapter0013
     * @tc.desc      Test removeByIndex for negative-number Array converted to Uint8Array/Uint16Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0013';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const newLinkedList1 = new LinkedList<Uint16Array>()
      const text = new Uint8Array([72, 101, 108, 108, 111, -87, -111, -114, 108, 100, -49, 50, 51, 63])
      const text1 = new Uint16Array([72, 101, 108, 108, 111, -87, -111, -114, 108, 100, -49, 50, 51, 63])
      newLinkedList.add(text)
      newLinkedList1.add(text1);
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()
      expect(newLinkedList1.removeByIndex(0) ===text1).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_1400
     * @tc.name      testLinkedList09Chapter0014
     * @tc.desc      Test removeByIndex with special array of Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0014';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Array<number | string>>()
      const text:Array<number | string> = []
      text["abc"] = 111
      text["aaa"] = 222
      newLinkedList.add(text)
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_1500
     * @tc.name      testLinkedList09Chapter0015
     * @tc.desc      Test removeByIndex with array containing NaN/Infinity of Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0015';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const text = new Uint8Array([72, 101, 108, NaN, Infinity, 108, 111])
      newLinkedList.add(text)
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()
    })


    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_1600
     * @tc.name      testLinkedList09Chapter0016
     * @tc.desc      Test removeByIndex with array containing non-numeric types of Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0016';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Array<number | string | boolean | null | undefined>>()
      const text:Array<number | string | boolean | null | undefined> = [72, "abc", true, null, undefined, 108]
      newLinkedList.add(text)
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_1700
     * @tc.name      testLinkedList09Chapter0017
     * @tc.desc      Test removeByIndex with empty array of Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0017';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Array<string>>()
      const text:Array<string> = []
      newLinkedList.add(text)
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_1800
     * @tc.name      testLinkedList09Chapter0018
     * @tc.desc      Test removeByIndex with array containing huge numeric overflow values of Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0018';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const text = new Uint8Array([256, 65536, 32768])
      newLinkedList.add(text)
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_1900
     * @tc.name      testLinkedList09Chapter0019
     * @tc.desc      Test removeByIndex with Int8Array | Uint8Array | Uint8ClampedArray of Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0019';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Int8Array | Uint8Array | Uint8ClampedArray>()
      const text1 = new Int8Array([127, -128, 128, -129])
      const text2 = new Uint8Array([255, 0, 256, -1])
      const text3 = new Uint8ClampedArray([255, 0, 256, -1])
      newLinkedList.add(text1)
      newLinkedList.add(text2)
      newLinkedList.add(text3)
      expect(newLinkedList.removeByIndex(0) ===text1).assertTrue()
      expect(newLinkedList.removeByIndex(0) ===text2).assertTrue()
      expect(newLinkedList.removeByIndex(0) ===text3).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_7900
     * @tc.name      testLinkedList09Chapter0079
     * @tc.desc      Test removeByIndex with Int16Array | Uint16Array | Int32Array | Uint32Array of Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0079';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Int16Array | Uint16Array | Int32Array | Uint32Array>()
      const text1 = new Int16Array([32767, -32768, 32769, -32769])
      const text2 = new Uint16Array([65535, 0, 65536, -1])
      const text3 = new Int32Array([2147483647, -2147483648, 2147483648, -2147483649])
      const text4 = new Uint32Array([4294967295, 0, 4294967296, -1])
      newLinkedList.add(text1)
      newLinkedList.add(text2)
      newLinkedList.add(text3)
      newLinkedList.add(text4)
      expect(newLinkedList.removeByIndex(0) ===text1).assertTrue()
      expect(newLinkedList.removeByIndex(0) ===text2).assertTrue()
      expect(newLinkedList.removeByIndex(0) ===text3).assertTrue()
      expect(newLinkedList.removeByIndex(0) ===text4).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_2100
     * @tc.name      testLinkedList09Chapter0021
     * @tc.desc      Test removeByIndex with Float32Array | Float64Array | BigInt64Array | BigUint64Array of Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0021';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Float32Array | Float64Array | BigInt64Array | BigUint64Array>()
      const text1 = new Float32Array([
        3.4028234663852886e38, 1.401298464324817e-45, -3.4028234663852886e38, 3.5e38, -3.5e38
      ])
      const text2 = new Float64Array([
        1.7976931348623157e308, 5e-324, -1.7976931348623157e308, 1.8e308, -1.8e308
      ]);
      const text3 = new BigInt64Array([
        9223372036854775807n, -9223372036854775808n, 9223372036854775808n, -9223372036854775809n
      ]);
      const text4 = new BigUint64Array([
        18446744073709551615n, 0n, 18446744073709551616n, -1n
      ])
      newLinkedList.add(text1)
      newLinkedList.add(text2)
      newLinkedList.add(text3)
      newLinkedList.add(text4)
      expect(newLinkedList.removeByIndex(0) ===text1).assertTrue()
      expect(newLinkedList.removeByIndex(0) ===text2).assertTrue()
      expect(newLinkedList.removeByIndex(0) ===text3).assertTrue()
      expect(newLinkedList.removeByIndex(0) ===text4).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_2200
     * @tc.name      testLinkedList09Chapter0022
     * @tc.desc      Test removeByIndex with TypedArray special value storage rules of Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0022';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<
      Float32Array | Float64Array | Int8Array | Uint8Array | Uint8ClampedArray |
      Int16Array | Uint16Array | Int32Array | Uint32Array
      >()

      const text1 = new Float32Array([Infinity, -Infinity, NaN])
      const text2 = new Float64Array([Infinity, -Infinity, NaN])
      const text3 = new Int8Array([Infinity, -Infinity, NaN])
      const text4 = new Uint8Array([Infinity, -Infinity, NaN])
      const text5 = new Uint8ClampedArray([Infinity, -Infinity, NaN])
      const text6 = new Int16Array([Infinity, -Infinity, NaN])
      const text7 = new Uint16Array([Infinity, -Infinity, NaN])
      const text8 = new Int32Array([Infinity, -Infinity, NaN])
      newLinkedList.add(text1)
      newLinkedList.add(text2)
      newLinkedList.add(text3)
      newLinkedList.add(text4)
      newLinkedList.add(text5)
      newLinkedList.add(text6)
      newLinkedList.add(text7)
      newLinkedList.add(text8)
      expect(newLinkedList.removeByIndex(0) ===text1).assertTrue()
      expect(newLinkedList.removeByIndex(0) ===text2).assertTrue()
      expect(newLinkedList.removeByIndex(0) ===text3).assertTrue()
      expect(newLinkedList.removeByIndex(0) ===text4).assertTrue()
      expect(newLinkedList.removeByIndex(0) ===text5).assertTrue()
      expect(newLinkedList.removeByIndex(0) ===text6).assertTrue()
      expect(newLinkedList.removeByIndex(0) ===text7).assertTrue()
      expect(newLinkedList.removeByIndex(0) ===text8).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_2300
     * @tc.name      testLinkedList09Chapter0023
     * @tc.desc      Test that searching for a non-existent index returns undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0023';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      try {
        expect(newLinkedList.removeByIndex(0)).assertFalse()
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} fail,err:${err}`);
        expect(String(err)).assertContain("Container is empty")
      }

    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_2400
     * @tc.name      testLinkedList09Chapter0024
     * @tc.desc      Test removeFirst with undefined value of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0024';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = undefined
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() === test).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_2500
     * @tc.name      testLinkedList09Chapter0025
     * @tc.desc      Test removeFirst with null value of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0025';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = null
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() === test).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_2600
     * @tc.name      testLinkedList09Chapter0026
     * @tc.desc      Test removeFirst with empty string of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0026';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = ""
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() === test).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_2700
     * @tc.name      testLinkedList09Chapter0027
     * @tc.desc      Test removeFirst with full coverage of special characters of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0027';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~"
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() === test).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_2800
     * @tc.name      testLinkedList09Chapter0028
     * @tc.desc      Test removeFirst with full coverage of ASCII codes of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0028';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~"
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() === test).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_2900
     * @tc.name      testLinkedList09Chapter0029
     * @tc.desc      Test removeFirst with full coverage of special characters (twice) of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0029';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = " !!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~"
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() === test).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_3000
     * @tc.name      testLinkedList09Chapter0030
     * @tc.desc      Test removeFirst with special escape characters of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0030';
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
      expect(newLinkedList.removeFirst() === "\a").assertTrue()
      expect(newLinkedList.removeFirst() === "\b").assertTrue()
      expect(newLinkedList.removeFirst() === "\f").assertTrue()
      expect(newLinkedList.removeFirst() ==="\n").assertTrue()
      expect(newLinkedList.removeFirst() ==="\r").assertTrue()
      expect(newLinkedList.removeFirst() ==="\t").assertTrue()
      expect(newLinkedList.removeFirst() ==="\v").assertTrue()
      expect(newLinkedList.removeFirst() ==="\\").assertTrue()
      expect(newLinkedList.removeFirst() ==="\'").assertTrue()
      expect(newLinkedList.removeFirst() ==="\"").assertTrue()
      expect(newLinkedList.removeFirst() ==="\?").assertTrue()
      expect(newLinkedList.removeFirst() ==="\0").assertTrue()
      expect(newLinkedList.removeFirst() ==="\d").assertTrue()
      expect(newLinkedList.removeFirst() ==="\x31").assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_3100
     * @tc.name      testLinkedList09Chapter0031
     * @tc.desc      Test removeFirst with emojis and their Unicode encodings of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0031';
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
      expect(newLinkedList.add(`\ud83d\udc46`)).assertTrue()
      expect(newLinkedList.add(`\ud83d\udc7f`)).assertTrue()
      expect(newLinkedList.add(`\ud83d\udc40`)).assertTrue()
      expect(newLinkedList.add(`\ud83d\udcaf`)).assertTrue()
      expect(newLinkedList.add(`\ud83c\udf85`)).assertTrue()
      expect(newLinkedList.add(`\ud83d\ude3c`)).assertTrue()
      expect(newLinkedList.add(`\ud83d\udd27`)).assertTrue()
      expect(newLinkedList.add(`\ud83d\udc87`)).assertTrue()
      expect(newLinkedList.add(`\ud83e\udd3c\u200d\u2642\ufe0f`)).assertTrue()
      expect(newLinkedList.add(`\ud83d\udee2`)).assertTrue()
      expect(newLinkedList.add(`\ud83c\udc04`)).assertTrue()
      expect(newLinkedList.add(`\ud83c\udff4`)).assertTrue()
      expect(newLinkedList.removeFirst() ==="👆").assertTrue()
      expect(newLinkedList.removeFirst() ==="👿").assertTrue()
      expect(newLinkedList.removeFirst() ==="👀").assertTrue()
      expect(newLinkedList.removeFirst() ==="💯").assertTrue()
      expect(newLinkedList.removeFirst() ==="🎅").assertTrue()
      expect(newLinkedList.removeFirst() ==="😼").assertTrue()
      expect(newLinkedList.removeFirst() ==="🔧").assertTrue()
      expect(newLinkedList.removeFirst() ==="💇").assertTrue()
      expect(newLinkedList.removeFirst() ==="🤼‍♂️").assertTrue()
      expect(newLinkedList.removeFirst() ==="🛢").assertTrue()
      expect(newLinkedList.removeFirst() ==="🀄").assertTrue()
      expect(newLinkedList.removeFirst() ==="🏴").assertTrue()
      expect(newLinkedList.removeFirst() ===`\ud83d\udc46`).assertTrue()
      expect(newLinkedList.removeFirst() ===`\ud83d\udc7f`).assertTrue()
      expect(newLinkedList.removeFirst() ===`\ud83d\udc40`).assertTrue()
      expect(newLinkedList.removeFirst() ===`\ud83d\udcaf`).assertTrue()
      expect(newLinkedList.removeFirst() ===`\ud83c\udf85`).assertTrue()
      expect(newLinkedList.removeFirst() ===`\ud83d\ude3c`).assertTrue()
      expect(newLinkedList.removeFirst() ===`\ud83d\udd27`).assertTrue()
      expect(newLinkedList.removeFirst() ===`\ud83d\udc87`).assertTrue()
      expect(newLinkedList.removeFirst() ===`\ud83e\udd3c\u200d\u2642\ufe0f`).assertTrue()
      expect(newLinkedList.removeFirst() ===`\ud83d\udee2`).assertTrue()
      expect(newLinkedList.removeFirst() ===`\ud83c\udc04`).assertTrue()
      expect(newLinkedList.removeFirst() ===`\ud83c\udff4`).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_3200
     * @tc.name      testLinkedList09Chapter0032
     * @tc.desc      Test removeFirst with invalid Unicode encodings of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0032';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      expect(newLinkedList.add(`\udc04`)).assertTrue()
      expect(newLinkedList.add(`\ud83d`)).assertTrue()
      expect(newLinkedList.add(`\udff4`)).assertTrue()
      expect(newLinkedList.removeFirst() ===`\udc04`).assertTrue()
      expect(newLinkedList.removeFirst() ===`\ud83d`).assertTrue()
      expect(newLinkedList.removeFirst() ===`\udff4`).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_3300
     * @tc.name      testLinkedList09Chapter0033
     * @tc.desc      Test removeFirst with keywords of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0033';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      expect(newLinkedList.add(`"0" `)).assertTrue()
      expect(newLinkedList.add(`"NaN"`)).assertTrue()
      expect(newLinkedList.add(`“”`)).assertTrue()
      expect(newLinkedList.removeFirst() ===`"0" `).assertTrue()
      expect(newLinkedList.removeFirst() ===`"NaN"`).assertTrue()
      expect(newLinkedList.removeFirst() ===`“”`).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_3400
     * @tc.name      testLinkedList09Chapter0034
     * @tc.desc      Test removeFirst with treeString type of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0034';
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
      expect(newLinkedList.removeFirst() ===init(10)).assertTrue()
      expect(newLinkedList.removeFirst() ===init(100)).assertTrue()
      expect(newLinkedList.removeFirst() ===init(1000)).assertTrue()
      expect(newLinkedList.removeFirst() ===init(10000)).assertTrue()
      expect(newLinkedList.removeFirst() ===init(100000)).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_3500
     * @tc.name      testLinkedList09Chapter0035
     * @tc.desc      Test removeFirst with sliceString type of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0035';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()

      let str = "{k1:value1,k2:value2}"

      for (let i = 0; i < 10; i++){
        let result = str.substring(0,str.length-2);
        str = result
        expect(newLinkedList.add(str)).assertTrue()
        expect(newLinkedList.removeFirst() ===str).assertTrue()
      }
      expect(newLinkedList.length).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_3600
     * @tc.name      testLinkedList09Chapter0036
     * @tc.desc      Test removeFirst with GC behavior of String type: Whether the linked list can be used normally after releasing the extra-long string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0036';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const largeStr = 'a'.repeat(10 * 10 * 10);
      expect(newLinkedList.add(largeStr)).assertTrue()
      expect(newLinkedList.removeFirst() ===largeStr).assertTrue()

      let temp = newLinkedList
      temp.clear();

      const newLargeStr = "c".repeat(10 * 10 * 10)
      expect(newLinkedList.add(newLargeStr)).assertTrue()
      expect(newLinkedList.removeFirst() ===newLargeStr).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_3700
     * @tc.name      testLinkedList09Chapter0037
     * @tc.desc      Test removeFirst with value 0 of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0037';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let test = 0
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeFirst() ===test).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_3800
     * @tc.name      testLinkedList09Chapter0038
     * @tc.desc      Test removeFirst with undefined value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0038';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let test = undefined
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeFirst() ===test).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_3900
     * @tc.name      testLinkedList09Chapter0039
     * @tc.desc      Test removeFirst with NaN value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0039';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let test = NaN
      newLinkedList.add( test)
      expect(Number.isNaN(newLinkedList.removeFirst())).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_4000
     * @tc.name      testLinkedList09Chapter0040
     * @tc.desc      Test removeFirst with value -0 of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0040';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let test = -0
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeFirst() ===test).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_4100
     * @tc.name      testLinkedList09Chapter0041
     * @tc.desc      Test removeFirst with positive infinity of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0041';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let test = Infinity
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeFirst() ===test).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_4200
     * @tc.name      testLinkedList09Chapter0042
     * @tc.desc      Test removeFirst with negative infinity of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0042';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let test = -Infinity
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeFirst() ===test).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_4300
     * @tc.name      testLinkedList09Chapter0043
     * @tc.desc      Test removeFirst with double type value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0043';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let test = Math.floor(1.5)
      expect(newLinkedList.add(test)).assertTrue()

      expect(newLinkedList.removeFirst() ===test).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_4400
     * @tc.name      testLinkedList09Chapter0044
     * @tc.desc      Test removeFirst with Number.MAX_VALUE of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0044';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let test = 1.7976931348623157e+308
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeFirst() ===test).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_4500
     * @tc.name      testLinkedList09Chapter0045
     * @tc.desc      Test removeFirst with Number.MIN_VALUE of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0045';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let test = 5e-324
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeFirst() ===test).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_4600
     * @tc.name      testLinkedList09Chapter0046
     * @tc.desc      Test removeFirst with Number.EPSILON of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0046';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let test = 2.220446049250313e-16
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() ===test).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_4700
     * @tc.name      testLinkedList09Chapter0047
     * @tc.desc      Test removeFirst with Number.EPSILON of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0047';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let test = 2^53 - 1
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeFirst() ===test).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_4800
     * @tc.name      testLinkedList09Chapter0048
     * @tc.desc      Test removeFirst with byte type value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0048';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let test = -64
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() ===test).assertTrue()

      test = -128
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() ===test).assertTrue()

      test = 127
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() ===test).assertTrue()

      test = 128
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() ===test).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_4900
     * @tc.name      testLinkedList09Chapter0049
     * @tc.desc      Test removeFirst with out-of-bounds byte value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0049';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const test = 128
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() ===test).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_5000
     * @tc.name      testLinkedList09Chapter0050
     * @tc.desc      Test removeFirst with short type value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0050';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let test = 10000
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() ===test).assertTrue()

      test = -32768
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() ===test).assertTrue()

      test = 32767
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() ===test).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_5100
     * @tc.name      testLinkedList09Chapter0051
     * @tc.desc      Test removeFirst with out-of-bounds short value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0051';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const test = 32768
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() ===test).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_5200
     * @tc.name      testLinkedList09Chapter0052
     * @tc.desc      Test removeFirst with int type value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0052';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let test = 1000000
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() ===test).assertTrue()

      test = -2147483648
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() ===test).assertTrue()

      test = 2147483647
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() ===test).assertTrue()

      expect(newLinkedList.length).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_5300
     * @tc.name      testLinkedList09Chapter0053
     * @tc.desc      Test removeFirst with out-of-bounds int value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0053';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const test = 2147483648
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() ===test).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_5400
     * @tc.name      testLinkedList09Chapter0054
     * @tc.desc      Test removeFirst with long type value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0054';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let test = 1234567890123456
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() ===test).assertTrue()

      test = -9223372036854775808
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() ===test).assertTrue()

      test = 9223372036854775807
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() ===test).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_5500
     * @tc.name      testLinkedList09Chapter0055
     * @tc.desc      Test removeFirst with out-of-bounds long value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0055';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const test = 9223372036854775808
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() ===test).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_5600
     * @tc.name      testLinkedList09Chapter0056
     * @tc.desc      Test removeFirst with float type value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0056';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let test = 3.14159
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() ===test).assertTrue()

      test = 1.40129846432481707e-45
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() ===test).assertTrue()

      test = 3.4028234663852860e+38
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() ===test).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_5700
     * @tc.name      testLinkedList09Chapter0057
     * @tc.desc      Test removeFirst with double type value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0057';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let test = 12345.67890123456789
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() ===test).assertTrue()

      test = 4.94065645841246544e-324
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() ===test).assertTrue()

      test = 1.79769313486231570e+308
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() ===test).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_5800
     * @tc.name      testLinkedList09Chapter0058
     * @tc.desc      Test removeFirst with out-of-bounds double value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0058';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const test = 1.8e+308
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() ===test).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_5900
     * @tc.name      testLinkedList09Chapter0059
     * @tc.desc      Test removeFirst with char type value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0059';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let test = 0
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() ===test).assertTrue()

      test = -65535
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() ===test).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_6000
     * @tc.name      testLinkedList09Chapter0060
     * @tc.desc      Test removeFirst with char stored as character of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0060';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const test = "a"
      newLinkedList.add(test.charCodeAt(0))
      const removedValue = newLinkedList.removeFirst();
      expect(removedValue === test.charCodeAt(0)).assertTrue();
      expect(newLinkedList.length).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_6100
     * @tc.name      testLinkedList09Chapter0061
     * @tc.desc      Test removeFirst with out-of-bounds char value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0061';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const test = 65536
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() ===test).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_6200
     * @tc.name      testLinkedList09Chapter0062
     * @tc.desc      Test removeFirst with bigint value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0062';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const test = BigInt(0xdecafafecacefade)
      newLinkedList.add( Number(test))
      expect(newLinkedList.removeFirst() === Number(test)).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_6300
     * @tc.name      testLinkedList09Chapter0063
     * @tc.desc      Test removeFirst with double value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0063';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const test = 123.456
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() ===test).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_6400
     * @tc.name      testLinkedList09Chapter0064
     * @tc.desc      Test removeFirst with float value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0064';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const test = 0xcafebabe
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() ===test).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_6500
     * @tc.name      testLinkedList09Chapter0065
     * @tc.desc      Test removeFirst with hexadecimal (16-bit) value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0065';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const test = 0x0102
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() ===test).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_6600
     * @tc.name      testLinkedList09Chapter0066
     * @tc.desc      Test removeFirst with 32-bit hexadecimal value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0066';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const test = 0x01020304
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() ===test).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_6700
     * @tc.name      testLinkedList09Chapter0067
     * @tc.desc      Test removeFirst with octal (8-bit) value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0067';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const test = 0x3
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() ===test).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_6800
     * @tc.name      testLinkedList09Chapter0068
     * @tc.desc      Test removeFirst with exponent operator value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0068';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const test = 2 ** 3
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() ===test).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_6900
     * @tc.name      testLinkedList09Chapter0069
     * @tc.desc      Test removeFirst with scientific notation value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0069';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let test = 1e3
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() ===test).assertTrue()

      test = 2.5e-2
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() ===test).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_7000
     * @tc.name      testLinkedList09Chapter0070
     * @tc.desc      Test removeFirst with scientific notation value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0070';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const test = BigInt(9007199254740991n)
      newLinkedList.add( Number(test))
      expect(newLinkedList.removeFirst() === Number(test)).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_7100
     * @tc.name      testLinkedList09Chapter0071
     * @tc.desc      Test removeFirst with true value of Boolean type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0071';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<boolean>()

      const test = true
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() ===test).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_7200
     * @tc.name      testLinkedList09Chapter0072
     * @tc.desc      Test removeFirst with false value of Boolean type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0072';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<boolean>()

      const test = false
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() ===test).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_7300
     * @tc.name      testLinkedList09Chapter0073
     * @tc.desc      Test removeFirst with values that are usually converted to false of Boolean type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0073';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<boolean>()

      const test01 = 0
      newLinkedList.add( Boolean(test01))
      expect(newLinkedList.removeFirst() ===Boolean(test01)).assertTrue()

      const test02 = NaN
      newLinkedList.add( Boolean(test02))
      expect(newLinkedList.removeFirst() ===Boolean(test02)).assertTrue()

      const test03 = ""
      newLinkedList.add( Boolean(test03))
      expect(newLinkedList.removeFirst() ===Boolean(test03)).assertTrue()

      const test04 = null
      newLinkedList.add(Boolean(test04))
      expect(newLinkedList.removeFirst() === Boolean(test04)).assertTrue()

      const test05 = undefined
      newLinkedList.add( Boolean(test05))
      expect(newLinkedList.removeFirst() === Boolean(test05)).assertTrue()

      expect(newLinkedList.length).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_7400
     * @tc.name      testLinkedList09Chapter0074
     * @tc.desc      Test removeFirst with ! + other data types of Boolean type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0074';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<boolean>()

      const test01 = !'s'
      newLinkedList.add(test01)
      expect(newLinkedList.removeFirst() ===test01).assertTrue()

      const test02 = !0
      newLinkedList.add(test02)
      expect(newLinkedList.removeFirst() ===test02).assertTrue()

      expect(newLinkedList.length).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_7500
     * @tc.name      testLinkedList09Chapter0075
     * @tc.desc      Test removeFirst with normal object of Object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0075';
      console.log(TAG + ' start');

      interface testObject_1 {
        a: number;
        b: string;
        c: number[];
      }

      const newLinkedList = new LinkedList<testObject_1>()
      let test: testObject_1 = {a:1, b:"test", c:[1,2,3]}
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() ===test).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_7600
     * @tc.name      testLinkedList09Chapter0076
     * @tc.desc      Test removeFirst with nested object of Object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0076';
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
      expect(newLinkedList.removeFirst() ===test).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_7700
     * @tc.name      testLinkedList09Chapter0077
     * @tc.desc      Test removeFirst with object containing function property (no parameters) of Object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0077';
      console.log(TAG + ' start');

      interface testObject_1 {
        a: number;
        b: Function;
      }

      const newLinkedList = new LinkedList<testObject_1>()
      let test: testObject_1 = {a:1, b:()=>{return true}}
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() ===test).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT09_7800
     * @tc.name      testLinkedList09Chapter0078
     * @tc.desc      Test removeFirst with object containing function property (with parameters) of Object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList09Chapter0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList09Chapter0078';
      console.log(TAG + ' start');

      interface testObject_1 {
        a: number;
        b: Function;
      }

      const newLinkedList = new LinkedList<testObject_1>()
      let test: testObject_1 = {a:1, b:(n:number)=>{return n*100}}
      newLinkedList.add(test)
      expect(newLinkedList.removeFirst() ===test).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    });
  })
}