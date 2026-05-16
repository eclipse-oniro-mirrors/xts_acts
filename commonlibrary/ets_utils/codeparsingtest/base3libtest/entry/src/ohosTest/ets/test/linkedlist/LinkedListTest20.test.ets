import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, TestType, Size, Level, expect } from '@ohos/hypium';
import { util, LinkedList } from '@kit.ArkTS';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function LinkedListTest20() {
  describe('LinkedListTest20', () => {
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
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT20_0100
     * @tc.name      testLinkedList20Chapter0001
     * @tc.desc      Test adding an object containing function properties: with parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList20Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList20Chapter0001';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: number;
        b: Function;
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a:1, b:(n:number)=>{return n*100}}

      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT20_0200
     * @tc.name      testLinkedList20Chapter0002
     * @tc.desc      Test adding an object containing ArrayBuffer
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList20Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList20Chapter0002';
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

      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT20_0300
     * @tc.name      testLinkedList20Chapter0003
     * @tc.desc      Test adding an object containing DataView
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList20Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList20Chapter0003';
      console.log(TAG + ' start');

      interface textObject_1 {
        view: DataView
      }
      const newLinkedList = new LinkedList<textObject_1>()
      const arrayBuffer = new ArrayBuffer(16)
      let text: textObject_1 = {view: new DataView(arrayBuffer)}

      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT20_0400
     * @tc.name      testLinkedList20Chapter0004
     * @tc.desc      Test adding an empty object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList20Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList20Chapter0004';
      console.log(TAG + ' start');

      interface textObject_1 {}
      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {}

      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text)
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text)
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT20_0500
     * @tc.name      testLinkedList20Chapter0005
     * @tc.desc      Test adding a huge object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList20Chapter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList20Chapter0005';
      console.log(TAG + ' start');

      const hugeObj: Record<string, number> = {};

      const newLinkedList = new LinkedList<Record<string, number>>()
      for (let i = 0; i < 10000; i++) {
        hugeObj[i.toString()] = i;
      }

      const start = Date.now()
      expect(newLinkedList.add(hugeObj)).assertTrue()
      const cost = Date.now()   - start

      expect(newLinkedList.length).assertEqual(1)

      const newText = newLinkedList.getLast()
      expect(newText['5000']).assertEqual(5000)

      expect(cost < 10).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT20_0600
     * @tc.name      testLinkedList20Chapter0006
     * @tc.desc      Test adding an object containing null property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList20Chapter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList20Chapter0006';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: null,
        b: number
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a: null, b: 1}

      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT20_0700
     * @tc.name      testLinkedList20Chapter0007
     * @tc.desc      Test adding an object containing NaN property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList20Chapter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList20Chapter0007';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: number,
        b: number
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a: NaN, b: 1}

      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT20_0800
     * @tc.name      testLinkedList20Chapter0008
     * @tc.desc      Test adding an object containing Infinity property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList20Chapter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList20Chapter0008';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: number,
        b: number
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a: Infinity, b: 1}

      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT20_0900
     * @tc.name      testLinkedList20Chapter0009
     * @tc.desc      Test adding an object containing TypedArray property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList20Chapter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList20Chapter0009';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: number,
        b: Uint8Array
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a: Infinity, b: new Uint8Array([172, 101, 108, 108, 111])}

      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT20_1000
     * @tc.name      testLinkedList20Chapter0010
     * @tc.desc      Test adding an object containing Map property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList20Chapter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList20Chapter0010';
      console.log(TAG + ' start');


      interface textObject_1 {
        map: Map<string, string>,
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {map: new Map([['key1', 'value1'], ['key2', 'value2']])}

      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT20_1100
     * @tc.name      testLinkedList20Chapter0011
     * @tc.desc      Test adding an object containing Set property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList20Chapter0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList20Chapter0011';
      console.log(TAG + ' start');


      interface textObject_1 {
        set: Set<number>,
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {set: new Set([1,2,3,2,1])}

      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT20_1200
     * @tc.name      testLinkedList20Chapter0012
     * @tc.desc      Test adding an object containing Promise property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList20Chapter0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const TAG = 'testLinkedList20Chapter0012';
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

      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text)

      const promiseResult = await testPromise;
      expect(isResolved).assertTrue()
      expect(promiseResult).assertEqual('done')
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT20_1300
     * @tc.name      testLinkedList20Chapter0013
     * @tc.desc      Test adding an object containing RegExp property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList20Chapter0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList20Chapter0013';
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

      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT20_1400
     * @tc.name      testLinkedList20Chapter0014
     * @tc.desc      Test adding a normal Uint8Array array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList20Chapter0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList20Chapter0014';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const text = new Uint8Array([72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63])

      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT20_1500
     * @tc.name      testLinkedList20Chapter0015
     * @tc.desc      Test adding an array containing multiple zeros
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList20Chapter0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList20Chapter0015';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const text = new Uint8Array([72, 101, 108, 108, 111, 87, 111, 114, 108,0,0,0,0,0, 100, 49, 50, 51, 63])

      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text)
      expect(newLinkedList.get(0).length).assertEqual(19)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT20_1600
     * @tc.name      testLinkedList20Chapter0016
     * @tc.desc      Test adding an array containing negative numbers converted to Uint8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList20Chapter0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList20Chapter0016';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const text = new Uint8Array([72, 101, 108, 108, 111, -87, -111, -114, 108, 100, -49, 50, 51, 63])

      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT20_1700
     * @tc.name      testLinkedList20Chapter0017
     * @tc.desc      Test adding arrays containing negative numbers converted to Uint8Array/Uint16Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList20Chapter0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList20Chapter0017';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const newLinkedList1 = new LinkedList<Uint16Array>()
      const text = new Uint8Array([72, 101, 108, 108, 111, -87, -111, -114, 108, 100, -49, 50, 51, 63])
      const text1 = new Uint16Array([72, 101, 108, 108, 111, -87, -111, -114, 108, 100, -49, 50, 51, 63])

      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text)
      expect(newLinkedList1.add(text1)).assertTrue()
      expect(newLinkedList1.getLast()).assertEqual(text1)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT20_1800
     * @tc.name      testLinkedList20Chapter0018
     * @tc.desc      Test adding a special array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList20Chapter0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList20Chapter0018';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Array<number | string>>()
      const text:Array<number | string> = []
      text["abc"] = 111
      text["aaa"] = 222
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT20_1900
     * @tc.name      testLinkedList20Chapter0019
     * @tc.desc      Test adding an array containing NaN/Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList20Chapter0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList20Chapter0019';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const text = new Uint8Array([72, 101, 108, NaN, Infinity, 108, 111])
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT20_2000
     * @tc.name      testLinkedList20Chapter0020
     * @tc.desc      Test adding an array containing non-numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList20Chapter0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList20Chapter0020';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Array<number | string | boolean | null | undefined>>()
      const text:Array<number | string | boolean | null | undefined> = [72, "abc", true, null, undefined, 108]
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT20_2100
     * @tc.name      testLinkedList20Chapter0021
     * @tc.desc      Test adding an array containing non-numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList20Chapter0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList20Chapter0021';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Array<number | string | boolean | null | undefined>>()
      const text:Array<number | string | boolean | null | undefined> = [72, "abc", true, null, undefined, 108]
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT20_2200
     * @tc.name      testLinkedList20Chapter0022
     * @tc.desc      Test adding an empty array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList20Chapter0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList20Chapter0022';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Array<string>>()
      const text:Array<string> = []
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT20_2300
     * @tc.name      testLinkedList20Chapter0023
     * @tc.desc      Test adding array with overflow of huge values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList20Chapter0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList20Chapter0023';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const text = new Uint8Array([256, 65536, 32768])
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT20_2400
     * @tc.name      testLinkedList20Chapter0024
     * @tc.desc      Test adding Int8Array | Uint8Array | Uint8ClampedArray arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList20Chapter0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList20Chapter0024';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Int8Array | Uint8Array | Uint8ClampedArray>()
      const text1 = new Int8Array([127, -128, 128, -129])
      const text2 = new Uint8Array([255, 0, 256, -1])
      const text3 = new Uint8ClampedArray([255, 0, 256, -1])

      expect(newLinkedList.add(text1)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text1)
      expect(newLinkedList.add(text2)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text2)
      expect(newLinkedList.add(text3)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text3)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT20_2500
     * @tc.name      testLinkedList20Chapter0025
     * @tc.desc      Test adding Int16Array | Uint16Array | Int32Array | Uint32Array arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList20Chapter0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList20Chapter0025';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Int16Array | Uint16Array | Int32Array | Uint32Array>()
      const text1 = new Int16Array([32767, -32768, 32769, -32769])
      const text2 = new Uint16Array([65535, 0, 65536, -1])
      const text3 = new Int32Array([2147483647, -2147483648, 2147483648, -2147483649])
      const text4 = new Uint32Array([4294967295, 0, 4294967296, -1])

      expect(newLinkedList.add(text1)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text1)
      expect(newLinkedList.add(text2)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text2)
      expect(newLinkedList.add(text3)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text3)
      expect(newLinkedList.add(text4)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text4)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT20_2600
     * @tc.name      testLinkedList20Chapter0026
     * @tc.desc      Test adding Float32Array | Float64Array | BigInt64Array | BigUint64Array arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList20Chapter0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList20Chapter0026';
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

      expect(newLinkedList.add(text1)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text1)
      expect(newLinkedList.add(text2)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text2)
      expect(newLinkedList.add(text3)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text3)
      expect(newLinkedList.add(text4)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text4)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT20_2700
     * @tc.name      testLinkedList20Chapter0027
     * @tc.desc      Test special value storage rules for TypedArray
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList20Chapter0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList20Chapter0027';
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

      expect(newLinkedList.add(text1)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text1)
      expect(newLinkedList.add(text2)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text2)
      expect(newLinkedList.add(text3)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text3)
      expect(newLinkedList.add(text4)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text4)
      expect(newLinkedList.add(text5)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text5)
      expect(newLinkedList.add(text6)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text6)
      expect(newLinkedList.add(text7)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text7)
      expect(newLinkedList.add(text8)).assertTrue()
      expect(newLinkedList.getLast()).assertEqual(text8)
    })
  })
}