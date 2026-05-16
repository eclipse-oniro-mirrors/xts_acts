import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, TestType, Size, Level, expect } from '@ohos/hypium';
import { util, LinkedList } from '@kit.ArkTS';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function LinkedListTest08() {
  describe('LinkedListTest08', () => {
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
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_0100
     * @tc.name      testLinkedList08Chapter0001
     * @tc.desc      Test getIndexOf for object with NaN property of Object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0001';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: number,
        b: number
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a: NaN, b: 1}
      newLinkedList.add((text))
      expect(newLinkedList.getIndexOf(text)).assertEqual(0)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_0200
     * @tc.name      testLinkedList08Chapter0002
     * @tc.desc      Test getIndexOf for object with Infinity property of Object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0002';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: number,
        b: number
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a: Infinity, b: 1}
      newLinkedList.add((text))
      expect(newLinkedList.getIndexOf(text)).assertEqual(0)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_0300
     * @tc.name      testLinkedList08Chapter0003
     * @tc.desc      Test getIndexOf for object with TypedArray property of Object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0003';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: number,
        b: Uint8Array
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a: Infinity, b: new Uint8Array([172, 101, 108, 108, 111])}
      newLinkedList.add((text))
      expect(newLinkedList.getIndexOf(text)).assertEqual(0)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_0400
     * @tc.name      testLinkedList08Chapter0004
     * @tc.desc      Test getIndexOf for object with Map property of Object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0004';
      console.log(TAG + ' start');

      interface textObject_1 {
        map: Map<string, string>,
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {map: new Map([['key1', 'value1'], ['key2', 'value2']])}
      newLinkedList.add((text))
      expect(newLinkedList.getIndexOf(text)).assertEqual(0)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_0500
     * @tc.name      testLinkedList08Chapter0005
     * @tc.desc      Test getIndexOf for object with Set property of Object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0005';
      console.log(TAG + ' start');

      interface textObject_1 {
        set: Set<number>,
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {set: new Set([1,2,3,2,1])}
      newLinkedList.add((text))
      expect(newLinkedList.getIndexOf(text)).assertEqual(0)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_0600
     * @tc.name      testLinkedList08Chapter0006
     * @tc.desc      Test getIndexOf for object with Promise property of Object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const TAG = 'testLinkedList08Chapter0006';
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
      newLinkedList.add((text))
      expect(newLinkedList.getIndexOf(text)).assertEqual(0)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_0700
     * @tc.name      testLinkedList08Chapter0007
     * @tc.desc      Test getIndexOf for object with RegExp property of Object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0007';
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
      newLinkedList.add((text))
      expect(newLinkedList.getIndexOf(text)).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_0800
     * @tc.name      testLinkedList08Chapter0008
     * @tc.desc      Test getIndexOf for normal Uint8Array of Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0008';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const text = new Uint8Array([72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63])
      newLinkedList.add((text))
      expect(newLinkedList.getIndexOf(text)).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_0900
     * @tc.name      testLinkedList08Chapter0009
     * @tc.desc      Test getIndexOf for array containing multiple 0s of Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0009';
      console.log(TAG + ' start');
      const newLinkedList = new LinkedList<Uint8Array>()
      const text = new Uint8Array([72, 101, 108, 108, 111, 87, 111, 114, 108,0,0,0,0,0, 100, 49, 50, 51, 63])
      newLinkedList.add((text))
      expect(newLinkedList.getIndexOf(text)).assertEqual(0)
      expect(newLinkedList.get(0).length).assertEqual(19)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_1000
     * @tc.name      testLinkedList08Chapter0010
     * @tc.desc      Test getIndexOf for Array containing negative numbers converted to Uint8Array of Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0010';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const text = new Uint8Array([72, 101, 108, 108, 111, -87, -111, -114, 108, 100, -49, 50, 51, 63])
      newLinkedList.add(text)

      expect(newLinkedList.getIndexOf(text)).assertEqual(0)

      expect(text[5]).assertEqual(169)
      expect(text[6]).assertEqual(145)
      expect(text[7]).assertEqual(142)
      expect(text[10]).assertEqual(207)
      const text2 = new Uint8Array([72, 101, 108, 108, 111, -87, -111, -114, 108, 100, -49, 50, 51, 63])
      expect(newLinkedList.getIndexOf(text2)).assertEqual(-1)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_1100
     * @tc.name      testLinkedList08Chapter0011
     * @tc.desc      Test getIndexOf for Array (with negative numbers) converted to Uint8Array/Uint16Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0011';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array | Uint16Array>()
      const text = new Uint8Array([72, 101, 108, 108, 111, -87, -111, -114, 108, 100, -49, 50, 51, 63])
      const text1 = new Uint16Array([72, 101, 108, 108, 111, -87, -111, -114, 108, 100, -49, 50, 51, 63])
      const text2 = new Uint8Array([72, 101, 108, 108, 111, -87, -111, -114, 108, 100, -49, 50, 51, 63])
      newLinkedList.add(text)
      newLinkedList.add(text1)
      newLinkedList.add(text2)
      expect(newLinkedList.getIndexOf(text)).assertEqual(0)
      expect(newLinkedList.getIndexOf(text1)).assertEqual(1)
      expect(newLinkedList.getIndexOf(text2)).assertEqual(2)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_1200
     * @tc.name      testLinkedList08Chapter0012
     * @tc.desc      Test getIndexOf for special array of Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0012';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Array<number | string>>()
      const text:Array<number | string> = []
      text["abc"] = 111
      text["aaa"] = 222
      newLinkedList.add(text)
      expect(newLinkedList.getIndexOf(text)).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_1300
     * @tc.name      testLinkedList08Chapter0013
     * @tc.desc      Test getIndexOf for array containing NaN/Infinity of Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0013';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const text = new Uint8Array([72, 101, 108, NaN, Infinity, 108, 111])
      newLinkedList.add(text)
      expect(newLinkedList.getIndexOf(text)).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_1400
     * @tc.name      testLinkedList08Chapter0014
     * @tc.desc      Test getIndexOf for array containing non-numeric types of Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0014';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Array<number | string | boolean | null | undefined>>()
      const text:Array<number | string | boolean | null | undefined> = [72, "abc", true, null, undefined, 108]
      newLinkedList.add(text)
      expect(newLinkedList.getIndexOf(text)).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_1500
     * @tc.name      testLinkedList08Chapter0015
     * @tc.desc      Test getIndexOf for empty array of Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0015';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Array<string>>()
      const text:Array<string> = []
      newLinkedList.add(text)
      expect(newLinkedList.getIndexOf(text)).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_1600
     * @tc.name      testLinkedList08Chapter0016
     * @tc.desc      Test getIndexOf for array with huge numeric overflow of Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0016';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const text = new Uint8Array([256, 65536, 32768])
      newLinkedList.add(text)
      expect(newLinkedList.getIndexOf(text)).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_1700
     * @tc.name      testLinkedList08Chapter0017
     * @tc.desc      Test getIndexOf for Int8Array | Uint8Array | Uint8ClampedArray of Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0017';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Int8Array | Uint8Array | Uint8ClampedArray>()
      const text1 = new Int8Array([127, -128, 128, -129])
      const text2 = new Uint8Array([255, 0, 256, -1])
      const text3 = new Uint8ClampedArray([255, 0, 256, -1])
      newLinkedList.add(text1)
      newLinkedList.add(text2)
      newLinkedList.add(text3)
      expect(newLinkedList.getIndexOf(text1)).assertEqual(0)
      expect(newLinkedList.getIndexOf(text2)).assertEqual(1)
      expect(newLinkedList.getIndexOf(text3)).assertEqual(2)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_1800
     * @tc.name      testLinkedList08Chapter0018
     * @tc.desc      Test getIndexOf for Int16Array | Uint16Array | Int32Array | Uint32Array of Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0018';
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
      expect(newLinkedList.getIndexOf(text1)).assertEqual(0)
      expect(newLinkedList.getIndexOf(text2)).assertEqual(1)
      expect(newLinkedList.getIndexOf(text3)).assertEqual(2)
      expect(newLinkedList.getIndexOf(text4)).assertEqual(3)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_1900
     * @tc.name      testLinkedList08Chapter0019
     * @tc.desc      Test getIndexOf for Float32Array | Float64Array | BigInt64Array | BigUint64Array of Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0019';
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
      expect(newLinkedList.getIndexOf(text1)).assertEqual(0)
      expect(newLinkedList.getIndexOf(text2)).assertEqual(1)
      expect(newLinkedList.getIndexOf(text3)).assertEqual(2)
      expect(newLinkedList.getIndexOf(text4)).assertEqual(3)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_2000
     * @tc.name      testLinkedList08Chapter0020
     * @tc.desc      Test getIndexOf for TypedArray special value storage rules of Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0020';
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
      expect(newLinkedList.getIndexOf(text1)).assertEqual(0)
      expect(newLinkedList.getIndexOf(text2)).assertEqual(1)
      expect(newLinkedList.getIndexOf(text3)).assertEqual(2)
      expect(newLinkedList.getIndexOf(text4)).assertEqual(3)
      expect(newLinkedList.getIndexOf(text5)).assertEqual(4)
      expect(newLinkedList.getIndexOf(text6)).assertEqual(5)
      expect(newLinkedList.getIndexOf(text7)).assertEqual(6)
      expect(newLinkedList.getIndexOf(text8)).assertEqual(7)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_2100
     * @tc.name      testLinkedList08Chapter0021
     * @tc.desc      Test that searching for a non-existent element returns -1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0021';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      expect(newLinkedList.getIndexOf("test")).assertEqual(-1)

    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_2200
     * @tc.name      testLinkedList08Chapter0022
     * @tc.desc      Test removeByIndex with undefined value of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0022';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = undefined
      newLinkedList.add(test)
      expect(newLinkedList.removeByIndex(0) === test).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_2300
     * @tc.name      testLinkedList08Chapter0023
     * @tc.desc      Test removeByIndex with null value of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0023';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = null
      newLinkedList.add(test)
      expect(newLinkedList.removeByIndex(0) === test).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_2400
     * @tc.name      testLinkedList08Chapter0024
     * @tc.desc      Test removeByIndex with empty string of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0024';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = ""
      newLinkedList.add(test)
      expect(newLinkedList.removeByIndex(0) === test).assertTrue()

    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_2500
     * @tc.name      testLinkedList08Chapter0025
     * @tc.desc      Test removeByIndex with full coverage of special characters of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0025';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~"
      newLinkedList.add(test)
      expect(newLinkedList.removeByIndex(0) === test).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_2600
     * @tc.name      testLinkedList08Chapter0026
     * @tc.desc      Test removeByIndex with full coverage of ASCII codes of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0026';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~"
      newLinkedList.add(test)
      expect(newLinkedList.removeByIndex(0) === test).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_2700
     * @tc.name      testLinkedList08Chapter0027
     * @tc.desc      Test removeByIndex with full coverage of special characters (twice) of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0027';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = " !!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~"
      newLinkedList.add(test)
      expect(newLinkedList.removeByIndex(0) === test).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_2800
     * @tc.name      testLinkedList08Chapter0028
     * @tc.desc      Test removeByIndex with special escape characters of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0028';
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
      expect(newLinkedList.removeByIndex(0) === "\a").assertTrue()
      expect(newLinkedList.removeByIndex(0) === "\b").assertTrue()
      expect(newLinkedList.removeByIndex(0) === "\f").assertTrue()
      expect(newLinkedList.removeByIndex(0) ==="\n").assertTrue()
      expect(newLinkedList.removeByIndex(0) ==="\r").assertTrue()
      expect(newLinkedList.removeByIndex(0) ==="\t").assertTrue()
      expect(newLinkedList.removeByIndex(0) ==="\v").assertTrue()
      expect(newLinkedList.removeByIndex(0) ==="\\").assertTrue()
      expect(newLinkedList.removeByIndex(0) ==="\'").assertTrue()
      expect(newLinkedList.removeByIndex(0) ==="\"").assertTrue()
      expect(newLinkedList.removeByIndex(0) ==="\?").assertTrue()
      expect(newLinkedList.removeByIndex(0) ==="\0").assertTrue()
      expect(newLinkedList.removeByIndex(0) ==="\d").assertTrue()
      expect(newLinkedList.removeByIndex(0) ==="\x31").assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_2900
     * @tc.name      testLinkedList08Chapter0029
     * @tc.desc      Test removeByIndex with emojis and their Unicode encodings of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0029';
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
      expect(newLinkedList.removeByIndex(0) ==="👆").assertTrue()
      expect(newLinkedList.removeByIndex(0) ==="👿").assertTrue()
      expect(newLinkedList.removeByIndex(0) ==="👀").assertTrue()
      expect(newLinkedList.removeByIndex(0) ==="💯").assertTrue()
      expect(newLinkedList.removeByIndex(0) ==="🎅").assertTrue()
      expect(newLinkedList.removeByIndex(0) ==="😼").assertTrue()
      expect(newLinkedList.removeByIndex(0) ==="🔧").assertTrue()
      expect(newLinkedList.removeByIndex(0) ==="💇").assertTrue()
      expect(newLinkedList.removeByIndex(0) ==="🤼‍♂️").assertTrue()
      expect(newLinkedList.removeByIndex(0) ==="🛢").assertTrue()
      expect(newLinkedList.removeByIndex(0) ==="🀄").assertTrue()
      expect(newLinkedList.removeByIndex(0) ==="🏴").assertTrue()
      expect(newLinkedList.removeByIndex(0) ===`\ud83d\udc46`).assertTrue()
      expect(newLinkedList.removeByIndex(0) ===`\ud83d\udc7f`).assertTrue()
      expect(newLinkedList.removeByIndex(0) ===`\ud83d\udc40`).assertTrue()
      expect(newLinkedList.removeByIndex(0) ===`\ud83d\udcaf`).assertTrue()
      expect(newLinkedList.removeByIndex(0) ===`\ud83c\udf85`).assertTrue()
      expect(newLinkedList.removeByIndex(0) ===`\ud83d\ude3c`).assertTrue()
      expect(newLinkedList.removeByIndex(0) ===`\ud83d\udd27`).assertTrue()
      expect(newLinkedList.removeByIndex(0) ===`\ud83d\udc87`).assertTrue()
      expect(newLinkedList.removeByIndex(0) ===`\ud83e\udd3c\u200d\u2642\ufe0f`).assertTrue()
      expect(newLinkedList.removeByIndex(0) ===`\ud83d\udee2`).assertTrue()
      expect(newLinkedList.removeByIndex(0) ===`\ud83c\udc04`).assertTrue()
      expect(newLinkedList.removeByIndex(0) ===`\ud83c\udff4`).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_3000
     * @tc.name      testLinkedList08Chapter0030
     * @tc.desc      Test removeByIndex with invalid Unicode encodings of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0030';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      expect(newLinkedList.add(`\udc04`)).assertTrue()
      expect(newLinkedList.add(`\ud83d`)).assertTrue()
      expect(newLinkedList.add(`\udff4`)).assertTrue()
      expect(newLinkedList.removeByIndex(0) ===`\udc04`).assertTrue()
      expect(newLinkedList.removeByIndex(0) ===`\ud83d`).assertTrue()
      expect(newLinkedList.removeByIndex(0) ===`\udff4`).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_3100
     * @tc.name      testLinkedList08Chapter0031
     * @tc.desc      Test removeByIndex with keywords of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0031';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      expect(newLinkedList.add(`"0" `)).assertTrue()
      expect(newLinkedList.add(`"NaN"`)).assertTrue()
      expect(newLinkedList.add(`“”`)).assertTrue()
      expect(newLinkedList.removeByIndex(0) ===`"0" `).assertTrue()
      expect(newLinkedList.removeByIndex(0) ===`"NaN"`).assertTrue()
      expect(newLinkedList.removeByIndex(0) ===`“”`).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_3200
     * @tc.name      testLinkedList08Chapter0032
     * @tc.desc      Test removeByIndex with treeString type of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0032';
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
      expect(newLinkedList.removeByIndex(0) ===init(10)).assertTrue()
      expect(newLinkedList.removeByIndex(0) ===init(100)).assertTrue()
      expect(newLinkedList.removeByIndex(0) ===init(1000)).assertTrue()
      expect(newLinkedList.removeByIndex(0) ===init(10000)).assertTrue()
      expect(newLinkedList.removeByIndex(0) ===init(100000)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_3300
     * @tc.name      testLinkedList08Chapter0033
     * @tc.desc      Test removeByIndex with sliceString type of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0033';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()

      let str = "{k1:value1,k2:value2}"

      for (let i = 0; i < 10; i++){
        let result = str.substring(0,str.length-2);
        str = result
        expect(newLinkedList.add(str)).assertTrue()
        expect(newLinkedList.removeByIndex(0) ===str).assertTrue()
      }
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_3400
     * @tc.name      testLinkedList08Chapter0034
     * @tc.desc      Test String GC for removeByIndex: linked list works after releasing extra-long string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0034';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const largeStr = 'a'.repeat(10 * 10 * 10);
      expect(newLinkedList.add(largeStr)).assertTrue()
      expect(newLinkedList.removeByIndex(0) ===largeStr).assertTrue()

      let temp = newLinkedList
      temp.clear();

      const newLargeStr = "c".repeat(10 * 10 * 10)
      expect(newLinkedList.add(newLargeStr)).assertTrue()
      expect(newLinkedList.removeByIndex(0) ===newLargeStr).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_3500
     * @tc.name      testLinkedList08Chapter0035
     * @tc.desc      Test removeByIndex with value 0 of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0035';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = 0
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_3600
     * @tc.name      testLinkedList08Chapter0036
     * @tc.desc      Test removeByIndex with undefined value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0036';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = undefined
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_3700
     * @tc.name      testLinkedList08Chapter0037
     * @tc.desc      Test removeByIndex with NaN value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0037';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = NaN
      newLinkedList.add( text)
      expect(Number.isNaN(newLinkedList.removeByIndex(0))).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_3800
     * @tc.name      testLinkedList08Chapter0038
     * @tc.desc      Test removeByIndex with value -0 of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0038';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = -0
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_3900
     * @tc.name      testLinkedList08Chapter0039
     * @tc.desc      Test removeByIndex with positive infinity of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0039';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = Infinity
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_4000
     * @tc.name      testLinkedList08Chapter0040
     * @tc.desc      Test removeByIndex with negative infinity of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0040';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = -Infinity
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_4100
     * @tc.name      testLinkedList08Chapter0041
     * @tc.desc      Test removeByIndex with double type value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0041';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = Math.floor(1.5)
      expect(newLinkedList.add(text)).assertTrue()

      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_4200
     * @tc.name      testLinkedList08Chapter0042
     * @tc.desc      Test removeByIndex with Number.MAX_VALUE of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0042';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = 1.7976931348623157e+308
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_4300
     * @tc.name      testLinkedList08Chapter0043
     * @tc.desc      Test removeByIndex with Number.MIN_VALUE of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0043';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = 5e-324
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_4400
     * @tc.name      testLinkedList08Chapter0044
     * @tc.desc      Test removeByIndex with Number.EPSILON of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0044';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = 2.220446049250313e-16
      newLinkedList.add(text)
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_4500
     * @tc.name      testLinkedList08Chapter0045
     * @tc.desc      Test removeByIndex with Number.EPSILON of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0045';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = 2^53 - 1
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_4600
     * @tc.name      testLinkedList08Chapter0046
     * @tc.desc      Test removeByIndex with byte type value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0046';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text = -64
      newLinkedList.add(text)
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()

      text = -128
      newLinkedList.add(text)
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()

      text = 127
      newLinkedList.add(text)
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()

      text = 128
      newLinkedList.add(text)
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_4700
     * @tc.name      testLinkedList08Chapter0047
     * @tc.desc      Test removeByIndex with out-of-bounds byte value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0047';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 128
      newLinkedList.add(text)
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_4800
     * @tc.name      testLinkedList08Chapter0048
     * @tc.desc      Test removeByIndex with short type value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0048';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text = 10000
      newLinkedList.add(text)
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()

      text = -32768
      newLinkedList.add(text)
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()

      text = 32767
      newLinkedList.add(text)
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_4900
     * @tc.name      testLinkedList08Chapter0049
     * @tc.desc      Test removeByIndex with out-of-bounds short value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0049';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 32768
      newLinkedList.add(text)
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_5000
     * @tc.name      testLinkedList08Chapter0050
     * @tc.desc      Test removeByIndex with int type value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0050';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text = 1000000
      newLinkedList.add(text)
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()

      text = -2147483648
      newLinkedList.add(text)
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()

      text = 2147483647
      newLinkedList.add(text)
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()

    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_5100
     * @tc.name      testLinkedList08Chapter0051
     * @tc.desc      Test removeByIndex with out-of-bounds int value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0051';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 2147483648
      newLinkedList.add(text)
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_5200
     * @tc.name      testLinkedList08Chapter0052
     * @tc.desc      Test removeByIndex with long type value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0052';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text = 1234567890123456
      newLinkedList.add(text)
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()

      text = -9223372036854775808
      newLinkedList.add(text)
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()

      text = 9223372036854775807
      newLinkedList.add(text)
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_5300
     * @tc.name      testLinkedList08Chapter0053
     * @tc.desc      Test removeByIndex with out-of-bounds long value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0053';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 9223372036854775808
      newLinkedList.add(text)
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_5400
     * @tc.name      testLinkedList08Chapter0054
     * @tc.desc      Test removeByIndex with float type value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0054';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text = 3.14159
      newLinkedList.add(text)
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()

      text = 1.40129846432481707e-45
      newLinkedList.add(text)
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()

      text = 3.4028234663852860e+38
      newLinkedList.add(text)
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_5500
     * @tc.name      testLinkedList08Chapter0055
     * @tc.desc      Test removeByIndex with float precision loss scenario of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0055';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const float1 = 0.1;
      const float2 = 0.2;
      newLinkedList.add(float1);
      newLinkedList.add(float2);
      newLinkedList.add(0.3);
      newLinkedList.removeByIndex(2);
      const sum = Number(newLinkedList.get(0)) + Number(newLinkedList.get(1));
      expect(Math.abs(sum - 0.3) < 1e-10).assertTrue();
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_5600
     * @tc.name      testLinkedList08Chapter0056
     * @tc.desc      Test removeByIndex with double type value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0056';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text = 12345.67890123456789
      newLinkedList.add(text)
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()

      text = 4.94065645841246544e-324
      newLinkedList.add(text)
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()

      text = 1.79769313486231570e+308
      newLinkedList.add(text)
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_5700
     * @tc.name      testLinkedList08Chapter0057
     * @tc.desc      Test removeByIndex with out-of-bounds double value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0057';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 1.8e+308
      newLinkedList.add(text)
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_5800
     * @tc.name      testLinkedList08Chapter0058
     * @tc.desc      Test removeByIndex with char type value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0058';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text = 0
      newLinkedList.add(text)
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()

      text = -65535
      newLinkedList.add(text)
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_5900
     * @tc.name      testLinkedList08Chapter0059
     * @tc.desc      Test removeByIndex with char stored as character of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0059';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = "a"
      newLinkedList.add(text.charCodeAt(0))
      const removedValue = newLinkedList.removeByIndex(0);
      expect(removedValue === text.charCodeAt(0)).assertTrue();
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_6000
     * @tc.name      testLinkedList08Chapter0060
     * @tc.desc      Test removeByIndex with out-of-bounds char value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0060';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 65536
      newLinkedList.add(text)
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_6100
     * @tc.name      testLinkedList08Chapter0061
     * @tc.desc      Test removeByIndex with bigint value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0061';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = BigInt(0xdecafafecacefade)
      newLinkedList.add( Number(text))
      expect(newLinkedList.removeByIndex(0) === Number(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_6200
     * @tc.name      testLinkedList08Chapter0062
     * @tc.desc      Test removeByIndex with double value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0062';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 123.456
      newLinkedList.add(text)
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_6300
     * @tc.name      testLinkedList08Chapter0063
     * @tc.desc      Test removeByIndex with float value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0063';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 0xcafebabe
      newLinkedList.add(text)
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_6400
     * @tc.name      testLinkedList08Chapter0064
     * @tc.desc      Test removeByIndex with hexadecimal (16-bit) value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0064';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 0x0102
      newLinkedList.add(text)
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_6500
     * @tc.name      testLinkedList08Chapter0065
     * @tc.desc      Test removeByIndex with 32-bit hexadecimal value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0065';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 0x01020304
      newLinkedList.add(text)
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_6600
     * @tc.name      testLinkedList08Chapter0066
     * @tc.desc      Test removeByIndex with octal (8-bit) value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0066';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 0x3
      newLinkedList.add(text)
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_6700
     * @tc.name      testLinkedList08Chapter0067
     * @tc.desc      Test removeByIndex with exponent operator value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0067';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 2 ** 3
      newLinkedList.add(text)
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_6800
     * @tc.name      testLinkedList08Chapter0068
     * @tc.desc      Test removeByIndex with scientific notation value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0068';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text = 1e3
      newLinkedList.add(text)
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()

      text = 2.5e-2
      newLinkedList.add(text)
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_6900
     * @tc.name      testLinkedList08Chapter0069
     * @tc.desc      Test removeByIndex with scientific notation value of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0069';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = BigInt(9007199254740991n)
      newLinkedList.add( Number(text))
      expect(newLinkedList.removeByIndex(0) === Number(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_7000
     * @tc.name      testLinkedList08Chapter0070
     * @tc.desc      Test removeByIndex with true value of Boolean type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0070';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<boolean>()

      const text = true
      newLinkedList.add(text)
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_7100
     * @tc.name      testLinkedList08Chapter0071
     * @tc.desc      Test removeByIndex with false value of Boolean type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0071';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<boolean>()

      const text = false
      newLinkedList.add(text)
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_7200
     * @tc.name      testLinkedList08Chapter0072
     * @tc.desc      Test removeByIndex with values that are usually converted to false of Boolean type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0072';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<boolean>()

      const text01 = 0
      newLinkedList.add( Boolean(text01))
      expect(newLinkedList.removeByIndex(0) ===Boolean(text01)).assertTrue()

      const text02 = NaN
      newLinkedList.add( Boolean(text02))
      expect(newLinkedList.removeByIndex(0) ===Boolean(text02)).assertTrue()

      const text03 = ""
      newLinkedList.add( Boolean(text03))
      expect(newLinkedList.removeByIndex(0) ===Boolean(text03)).assertTrue()

      const text04 = null
      newLinkedList.add(Boolean(text04))
      expect(newLinkedList.removeByIndex(0) === Boolean(text04)).assertTrue()

      const text05 = undefined
      newLinkedList.add(Boolean(text05))
      expect(newLinkedList.removeByIndex(0) === Boolean(text05)).assertTrue()

    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_7300
     * @tc.name      testLinkedList08Chapter0073
     * @tc.desc      Test removeByIndex with ! + other data types of Boolean type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0073';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<boolean>()

      const text01 = !'s'
      newLinkedList.add(text01)
      expect(newLinkedList.removeByIndex(0) ===text01).assertTrue()

      const text02 = !0
      newLinkedList.add(text02)
      expect(newLinkedList.removeByIndex(0) ===text02).assertTrue()

    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_7400
     * @tc.name      testLinkedList08Chapter0074
     * @tc.desc      Test removeByIndex with normal object of Object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0074';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: number;
        b: string;
        c: number[];
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a:1, b:"test", c:[1,2,3]}
      newLinkedList.add(text)
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_7500
     * @tc.name      testLinkedList08Chapter0075
     * @tc.desc      Test removeByIndex with nested object of Object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0075';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: number;
        b: string;
        c: number[];
      }
      interface textObject_2{
        d: number;
        e: textObject_1
      }

      const newLinkedList = new LinkedList<textObject_2>()
      let text: textObject_2 = {d: 10, e: {a:1, b:"test", c:[1,2,3]}}
      newLinkedList.add(text)
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_7600
     * @tc.name      testLinkedList08Chapter0076
     * @tc.desc      Test removeByIndex with object containing function property (no parameters) of Object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0076';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: number;
        b: Function;
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a:1, b:()=>{return true}}
      newLinkedList.add(text)
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_7700
     * @tc.name      testLinkedList08Chapter0077
     * @tc.desc      Test removeByIndex with object containing function property (with parameters) of Object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0077';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: number;
        b: Function;
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a:1, b:(n:number)=>{return n*100}}
      newLinkedList.add(text)
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_7800
     * @tc.name      testLinkedList08Chapter0078
     * @tc.desc      Test removeByIndex with object containing ArrayBuffer property of Object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0078';
      console.log(TAG + ' start');

      interface textObject_1 {
        buffer: ArrayBuffer
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = { buffer: new ArrayBuffer(16) }

      let uint8View = new Uint8Array(text.buffer)
      uint8View[0] = 10
      uint8View[1] = 20
      uint8View[2] = 30
      newLinkedList.add(text)
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_7900
     * @tc.name      testLinkedList08Chapter0079
     * @tc.desc      Test removeByIndex with object containing DataView property of Object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0079';
      console.log(TAG + ' start');

      interface textObject_1 {
        view: DataView
      }
      const newLinkedList = new LinkedList<textObject_1>()
      const arrayBuffer = new ArrayBuffer(16)
      let text: textObject_1 = {view: new DataView(arrayBuffer)}
      newLinkedList.add(text)
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT08_8000
     * @tc.name      testLinkedList08Chapter0080
     * @tc.desc      Test removeByIndex with empty object of Object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList08Chapter0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList08Chapter0080';
      console.log(TAG + ' start');

      interface textObject_1 {}
      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {}
      newLinkedList.add(text)
      newLinkedList.add(text)
      newLinkedList.add(text)
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()
      expect(newLinkedList.removeByIndex(0) ===text).assertTrue()
    })
  })
}