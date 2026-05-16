import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, TestType, Size, Level, expect } from '@ohos/hypium';
import { util, LinkedList } from '@kit.ArkTS';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function LinkedListTest13() {
  describe('LinkedListTest13', () => {
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
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_0100
     * @tc.name      testLinkedList13Chapter0001
     * @tc.desc      Test removing hexadecimal (16-bit) of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0001';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const test = 0x0102
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeFirstFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_0200
     * @tc.name      testLinkedList13Chapter0002
     * @tc.desc      Test removing 32-bit hexadecimal of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0002';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const test = 0x01020304
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeFirstFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_0300
     * @tc.name      testLinkedList13Chapter0003
     * @tc.desc      Test removing octal (8-bit) of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0003';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const test = 0x3
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeFirstFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_0400
     * @tc.name      testLinkedList13Chapter0004
     * @tc.desc      Test removing exponent operator of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0004';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const test = 2 ** 3
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeFirstFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_0500
     * @tc.name      testLinkedList13Chapter0005
     * @tc.desc      Test removing scientific notation of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0005';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let test = 1e3
      newLinkedList.add(test)
      expect(newLinkedList.removeFirstFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()

      test = 2.5e-2
      newLinkedList.add(test)
      expect(newLinkedList.removeFirstFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_0600
     * @tc.name      testLinkedList13Chapter0006
     * @tc.desc      Test removing scientific notation of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0006';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const test = BigInt(9007199254740991n)
      expect(newLinkedList.add(Number(test))).assertTrue()
      expect(newLinkedList.removeFirstFound(Number(test))).assertTrue()
      expect(newLinkedList.has(Number(test))).assertFalse()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_0700
     * @tc.name      testLinkedList13Chapter0007
     * @tc.desc      Test removing true of Boolean type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0007';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<boolean>()

      const test = true
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeFirstFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_0800
     * @tc.name      testLinkedList13Chapter0008
     * @tc.desc      Test removing false of Boolean type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0008';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<boolean>()

      const test = false
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeFirstFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_0900
     * @tc.name      testLinkedList13Chapter0009
     * @tc.desc      Test removing values that are usually treated as false of Boolean type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0009';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<boolean>()

      const test01 = 0
      expect(newLinkedList.add(Boolean(test01))).assertTrue()
      expect(newLinkedList.removeFirstFound(Boolean(test01))).assertTrue()
      expect(newLinkedList.has(Boolean(test01))).assertFalse()

      const test02 = NaN
      expect(newLinkedList.add(Boolean(test02))).assertTrue()
      expect(newLinkedList.removeFirstFound(Boolean(test02))).assertTrue()
      expect(newLinkedList.has(Boolean(test02))).assertFalse()

      const test03 = ""
      expect(newLinkedList.add(Boolean(test03))).assertTrue()
      expect(newLinkedList.removeFirstFound(Boolean(test03))).assertTrue()
      expect(newLinkedList.has(Boolean(test03))).assertFalse()

      const test04 = null
      newLinkedList.add(test04)
      expect(newLinkedList.removeFirstFound(test04)).assertTrue()
      expect(newLinkedList.has(Boolean(test04))).assertFalse()

      const test05 = undefined
      newLinkedList.add(test05)
      expect(newLinkedList.removeFirstFound(test05)).assertTrue()
      expect(newLinkedList.has(Boolean(test05))).assertFalse()

    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_1000
     * @tc.name      testLinkedList13Chapter0010
     * @tc.desc      Test removing ! + other data types of Boolean type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0010';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<boolean>()

      const test01 = !'s'
      newLinkedList.add(test01)
      expect(newLinkedList.removeFirstFound(test01)).assertTrue()
      expect(newLinkedList.has(test01)).assertFalse()

      const test02 = !0
      newLinkedList.add(test02)
      expect(newLinkedList.removeFirstFound(test02)).assertTrue()
      expect(newLinkedList.has(test02)).assertFalse()

    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_1100
     * @tc.name      testLinkedList13Chapter0011
     * @tc.desc      Test removing ordinary object of Object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0011';
      console.log(TAG + ' start');

      interface testObject_1 {
        a: number;
        b: string;
        c: number[];
      }

      const newLinkedList = new LinkedList<testObject_1>()
      let test: testObject_1 = {a:1, b:"test", c:[1,2,3]}
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeFirstFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_1200
     * @tc.name      testLinkedList13Chapter0012
     * @tc.desc      Test removing nested object of Object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0012';
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
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeFirstFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_1300
     * @tc.name      testLinkedList13Chapter0013
     * @tc.desc      Test removing object with function property (no parameters) of Object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0013';
      console.log(TAG + ' start');

      interface testObject_1 {
        a: number;
        b: Function;
      }

      const newLinkedList = new LinkedList<testObject_1>()
      let test: testObject_1 = {a:1, b:()=>{return true}}
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeFirstFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_1400
     * @tc.name      testLinkedList13Chapter0014
     * @tc.desc      Test removing object with function property (with parameters) of Object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0014';
      console.log(TAG + ' start');

      interface testObject_1 {
        a: number;
        b: Function;
      }

      const newLinkedList = new LinkedList<testObject_1>()
      let test: testObject_1 = {a:1, b:(n:number)=>{return n*100}}
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeFirstFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_1500
     * @tc.name      testLinkedList13Chapter0015
     * @tc.desc      Test removing object containing ArrayBuffer of Object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0015';
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
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeFirstFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_1600
     * @tc.name      testLinkedList13Chapter0016
     * @tc.desc      Test removing object containing DataView of Object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0016';
      console.log(TAG + ' start');

      interface testObject_1 {
        view: DataView
      }
      const newLinkedList = new LinkedList<testObject_1>()
      const arrayBuffer = new ArrayBuffer(16)
      let test: testObject_1 = {view: new DataView(arrayBuffer)}
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeFirstFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_1700
     * @tc.name      testLinkedList13Chapter0017
     * @tc.desc      Test removing empty object of Object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0017';
      console.log(TAG + ' start');

      interface testObject_1 {}
      const newLinkedList = new LinkedList<testObject_1>()
      let test: testObject_1 = {}
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeFirstFound(test)).assertTrue()
      expect(newLinkedList.removeFirstFound(test)).assertTrue()
      expect(newLinkedList.removeFirstFound(test)).assertTrue()

      expect(newLinkedList.length).assertEqual(0)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_1800
     * @tc.name      testLinkedList13Chapter0018
     * @tc.desc      Test removing huge object of Object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0018';
      console.log(TAG + ' start');

      const hugeObj: Record<string, number> = {};

      const newLinkedList = new LinkedList<Record<string, number>>()
      for (let i = 0; i < 10000; i++) {
        hugeObj[i.toString()] = i;
      }

      newLinkedList.add(hugeObj)
      expect(newLinkedList.length).assertEqual(1)

      const start = Date.now()
      const removeFirstFoundResult = newLinkedList.removeFirstFound(hugeObj)
      const cost = Date.now() - start

      expect(removeFirstFoundResult).assertTrue()
      expect(newLinkedList.has(hugeObj)).assertFalse()
      expect(newLinkedList.length).assertEqual(0)
      expect(cost < 10).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_1900
     * @tc.name      testLinkedList13Chapter0019
     * @tc.desc      Test removing object containing null property of Object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0019';
      console.log(TAG + ' start');

      interface testObject_1 {
        a: null,
        b: number
      }

      const newLinkedList = new LinkedList<testObject_1>()
      let test: testObject_1 = {a: null, b: 1}
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeFirstFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_2000
     * @tc.name      testLinkedList13Chapter0020
     * @tc.desc      Test removing object containing NaN property of Object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0020';
      console.log(TAG + ' start');

      interface testObject_1 {
        a: number,
        b: number
      }

      const newLinkedList = new LinkedList<testObject_1>()
      let test: testObject_1 = {a: NaN, b: 1}
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeFirstFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_2100
     * @tc.name      testLinkedList13Chapter0021
     * @tc.desc      Test removing object containing Infinity property of Object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0021';
      console.log(TAG + ' start');

      interface testObject_1 {
        a: number,
        b: number
      }

      const newLinkedList = new LinkedList<testObject_1>()
      let test: testObject_1 = {a: Infinity, b: 1}
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeFirstFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_2200
     * @tc.name      testLinkedList13Chapter0022
     * @tc.desc      Test removing object containing TypedArray property of Object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0022';
      console.log(TAG + ' start');

      interface testObject_1 {
        a: number,
        b: Uint8Array
      }

      const newLinkedList = new LinkedList<testObject_1>()
      let test: testObject_1 = {a: Infinity, b: new Uint8Array([172, 101, 108, 108, 111])}
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeFirstFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_2300
     * @tc.name      testLinkedList13Chapter0023
     * @tc.desc      Test removing object containing Map property of Object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0023';
      console.log(TAG + ' start');


      interface testObject_1 {
        map: Map<string, string>,
      }

      const newLinkedList = new LinkedList<testObject_1>()
      let test: testObject_1 = {map: new Map([['key1', 'value1'], ['key2', 'value2']])}
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeFirstFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_2400
     * @tc.name      testLinkedList13Chapter0024
     * @tc.desc      Test removing object containing Set property of Object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0024';
      console.log(TAG + ' start');


      interface testObject_1 {
        set: Set<number>,
      }

      const newLinkedList = new LinkedList<testObject_1>()
      let test: testObject_1 = {set: new Set([1,2,3,2,1])}
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeFirstFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_2500
     * @tc.name      testLinkedList13Chapter0025
     * @tc.desc      Test removing object containing Promise property of Object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const TAG = 'testLinkedList13Chapter0025';
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
      expect(newLinkedList.add(test)).assertTrue()

      const promiseResult = await testPromise;
      expect(isResolved).assertTrue()
      expect(promiseResult).assertEqual('done')

      expect(newLinkedList.removeFirstFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_2600
     * @tc.name      testLinkedList13Chapter0026
     * @tc.desc      Test removing object containing regular expression property of Object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0026';
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
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeFirstFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_2700
     * @tc.name      testLinkedList13Chapter0027
     * @tc.desc      Test removing normal Uint8Array of Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0027';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const test = new Uint8Array([72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63])
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeFirstFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_2800
     * @tc.name      testLinkedList13Chapter0028
     * @tc.desc      Test removing array containing multiple 0s of Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0028';
      console.log(TAG + ' start');
      const newLinkedList = new LinkedList<Uint8Array>()
      const test = new Uint8Array([72, 101, 108, 108, 111, 87, 111, 114, 108,0,0,0,0,0, 100, 49, 50, 51, 63])
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.get(0).length).assertEqual(19)
      expect(newLinkedList.removeFirstFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_2900
     * @tc.name      testLinkedList13Chapter0029
     * @tc.desc      Test removing Array converted to Uint8Array containing negative numbers of Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0029';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const test = new Uint8Array([72, 101, 108, 108, 111, -87, -111, -114, 108, 100, -49, 50, 51, 63])
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeFirstFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_3000
     * @tc.name      testLinkedList13Chapter0030
     * @tc.desc      Test removing Array converted to Uint8Array/Uint16Array containing negative numbers of Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0030';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array | Uint16Array>()
      const test = new Uint8Array([72, 101, 108, 108, 111, -87, -111, -114, 108, 100, -49, 50, 51, 63])
      const test1 = new Uint16Array([72, 101, 108, 108, 111, -87, -111, -114, 108, 100, -49, 50, 51, 63])
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.add(test1)).assertTrue()
      expect(newLinkedList.removeFirstFound(test)).assertTrue()
      expect(newLinkedList.removeFirstFound(test1)).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_3100
     * @tc.name      testLinkedList13Chapter0031
     * @tc.desc      Test removing special array of Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0031';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Array<number | string>>()
      const test:Array<number | string> = []
      test["abc"] = 111
      test["aaa"] = 222
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeFirstFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_3200
     * @tc.name      testLinkedList13Chapter0032
     * @tc.desc      Test removing array containing NaN/Infinity of Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0032';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const test = new Uint8Array([72, 101, 108, NaN, Infinity, 108, 111])
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeFirstFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_3300
     * @tc.name      testLinkedList13Chapter0033
     * @tc.desc      Test removing array containing non-numeric types of Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0033';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Array<number | string | boolean | null | undefined>>()
      const test:Array<number | string | boolean | null | undefined> = [72, "abc", true, null, undefined, 108]
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeFirstFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_3400
     * @tc.name      testLinkedList13Chapter0034
     * @tc.desc      Test removing empty array of Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0034';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Array<string>>()
      const test:Array<string> = []
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeFirstFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_3500
     * @tc.name      testLinkedList13Chapter0035
     * @tc.desc      Test removing array with huge numeric overflow of Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0035';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const test = new Uint8Array([256, 65536, 32768])
      newLinkedList.add(test)
      expect(newLinkedList.removeFirstFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_3600
     * @tc.name      testLinkedList13Chapter0036
     * @tc.desc      Test removing Int8Array | Uint8Array | Uint8ClampedArray of Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0036';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Int8Array | Uint8Array | Uint8ClampedArray>()
      const test1 = new Int8Array([127, -128, 128, -129])
      const test2 = new Uint8Array([255, 0, 256, -1])
      const test3 = new Uint8ClampedArray([255, 0, 256, -1])
      newLinkedList.add(test1)
      newLinkedList.add(test2)
      newLinkedList.add(test3)
      expect(newLinkedList.removeFirstFound(test1)).assertTrue()
      expect(newLinkedList.removeFirstFound(test2)).assertTrue()
      expect(newLinkedList.removeFirstFound(test3)).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_3700
     * @tc.name      testLinkedList13Chapter0037
     * @tc.desc      Test removing Int16Array | Uint16Array | Int32Array | Uint32Array of Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0037';
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
      expect(newLinkedList.removeFirstFound(test1)).assertTrue()
      expect(newLinkedList.removeFirstFound(test2)).assertTrue()
      expect(newLinkedList.removeFirstFound(test3)).assertTrue()
      expect(newLinkedList.removeFirstFound(test4)).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_3800
     * @tc.name      testLinkedList13Chapter0038
     * @tc.desc      Test removing Float32Array | Float64Array | BigInt64Array | BigUint64Array of Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0038';
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
      expect(newLinkedList.removeFirstFound(test1)).assertTrue()
      expect(newLinkedList.removeFirstFound(test2)).assertTrue()
      expect(newLinkedList.removeFirstFound(test3)).assertTrue()
      expect(newLinkedList.removeFirstFound(test4)).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_3900
     * @tc.name      testLinkedList13Chapter0039
     * @tc.desc      Test removing TypedArray special value storage rules of Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0039';
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
      expect(newLinkedList.removeFirstFound(test1)).assertTrue()
      expect(newLinkedList.removeFirstFound(test2)).assertTrue()
      expect(newLinkedList.removeFirstFound(test3)).assertTrue()
      expect(newLinkedList.removeFirstFound(test4)).assertTrue()
      expect(newLinkedList.removeFirstFound(test5)).assertTrue()
      expect(newLinkedList.removeFirstFound(test6)).assertTrue()
      expect(newLinkedList.removeFirstFound(test7)).assertTrue()
      expect(newLinkedList.removeFirstFound(test8)).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_4000
     * @tc.name      testLinkedList13Chapter0040
     * @tc.desc      Test that deleting an empty container throws an error as expected
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0040';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      try {
        expect(newLinkedList.removeFirstFound("test")).assertFalse()
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} fail,err:${err}`);
        expect(String(err)).assertContain("Container is empty")
      }
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_4100
     * @tc.name      testLinkedList13Chapter0041
     * @tc.desc      Test that deleting a non-existent element returns false as expected
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0041';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      try {
        expect(newLinkedList.add("tests"))
        expect(newLinkedList.removeFirstFound("test")).assertFalse()
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} fail,err:${err}`);
        expect(String(err)).assertContain("BusinessError:")
      }

    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_4200
     * @tc.name      testLinkedList13Chapter0042
     * @tc.desc      Test removing undefined of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0042';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = undefined
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeLastFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_4300
     * @tc.name      testLinkedList13Chapter0043
     * @tc.desc      Test removing null of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0043';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = null
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeLastFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_4400
     * @tc.name      testLinkedList13Chapter0044
     * @tc.desc      Test removing empty string of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0044';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = ""
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeLastFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_4500
     * @tc.name      testLinkedList13Chapter0045
     * @tc.desc      Test removing full coverage of special characters of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0045';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~"
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeLastFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_4600
     * @tc.name      testLinkedList13Chapter0046
     * @tc.desc      Test removing full coverage of ASCII characters of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0046';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~"
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeLastFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_4700
     * @tc.name      testLinkedList13Chapter0047
     * @tc.desc      Test removing full coverage of special characters of String type (twice)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0047';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = " !!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~"
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeLastFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_4800
     * @tc.name      testLinkedList13Chapter0048
     * @tc.desc      Test removing special escape characters of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0048';
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
      expect(newLinkedList.removeLastFound("\a")).assertTrue()
      expect(newLinkedList.removeLastFound("\b")).assertTrue()
      expect(newLinkedList.removeLastFound("\f")).assertTrue()
      expect(newLinkedList.removeLastFound("\n")).assertTrue()
      expect(newLinkedList.removeLastFound("\r")).assertTrue()
      expect(newLinkedList.removeLastFound("\t")).assertTrue()
      expect(newLinkedList.removeLastFound("\v")).assertTrue()
      expect(newLinkedList.removeLastFound("\\")).assertTrue()
      expect(newLinkedList.removeLastFound("\'")).assertTrue()
      expect(newLinkedList.removeLastFound("\"")).assertTrue()
      expect(newLinkedList.removeLastFound("\?")).assertTrue()
      expect(newLinkedList.removeLastFound("\0")).assertTrue()
      expect(newLinkedList.removeLastFound("\d")).assertTrue()
      expect(newLinkedList.removeLastFound("\x31")).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_4900
     * @tc.name      testLinkedList13Chapter0049
     * @tc.desc      Test removing emoji symbols and their Unicode encodings of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0049';
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
      expect(newLinkedList.removeLastFound("👆")).assertTrue()
      expect(newLinkedList.removeLastFound("👿")).assertTrue()
      expect(newLinkedList.removeLastFound("👀")).assertTrue()
      expect(newLinkedList.removeLastFound("💯")).assertTrue()
      expect(newLinkedList.removeLastFound("🎅")).assertTrue()
      expect(newLinkedList.removeLastFound("😼")).assertTrue()
      expect(newLinkedList.removeLastFound("🔧")).assertTrue()
      expect(newLinkedList.removeLastFound("💇")).assertTrue()
      expect(newLinkedList.removeLastFound("🤼‍♂️")).assertTrue()
      expect(newLinkedList.removeLastFound("🛢")).assertTrue()
      expect(newLinkedList.removeLastFound("🀄")).assertTrue()
      expect(newLinkedList.removeLastFound("🏴")).assertTrue()
      expect(newLinkedList.removeLastFound(`\ud83d\udc46`)).assertTrue()
      expect(newLinkedList.removeLastFound(`\ud83d\udc7f`)).assertTrue()
      expect(newLinkedList.removeLastFound(`\ud83d\udc40`)).assertTrue()
      expect(newLinkedList.removeLastFound(`\ud83d\udcaf`)).assertTrue()
      expect(newLinkedList.removeLastFound(`\ud83c\udf85`)).assertTrue()
      expect(newLinkedList.removeLastFound(`\ud83d\ude3c`)).assertTrue()
      expect(newLinkedList.removeLastFound(`\ud83d\udd27`)).assertTrue()
      expect(newLinkedList.removeLastFound(`\ud83d\udc87`)).assertTrue()
      expect(newLinkedList.removeLastFound(`\ud83e\udd3c\u200d\u2642\ufe0f`)).assertTrue()
      expect(newLinkedList.removeLastFound(`\ud83d\udee2`)).assertTrue()
      expect(newLinkedList.removeLastFound(`\ud83c\udc04`)).assertTrue()
      expect(newLinkedList.removeLastFound(`\ud83c\udff4`)).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_5000
     * @tc.name      testLinkedList13Chapter0050
     * @tc.desc      Test removing invalid Unicode encodings of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0050';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      expect(newLinkedList.add(`\udc04`)).assertTrue()
      expect(newLinkedList.add(`\ud83d`)).assertTrue()
      expect(newLinkedList.add(`\udff4`)).assertTrue()
      expect(newLinkedList.removeLastFound(`\udc04`)).assertTrue()
      expect(newLinkedList.removeLastFound(`\ud83d`)).assertTrue()
      expect(newLinkedList.removeLastFound(`\udff4`)).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_5100
     * @tc.name      testLinkedList13Chapter0051
     * @tc.desc      Test removing keywords of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0051';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      expect(newLinkedList.add(`"0" `)).assertTrue()
      expect(newLinkedList.add(`"NaN"`)).assertTrue()
      expect(newLinkedList.add(`“”`)).assertTrue()
      expect(newLinkedList.removeLastFound(`"0" `)).assertTrue()
      expect(newLinkedList.removeLastFound(`"NaN"`)).assertTrue()
      expect(newLinkedList.removeLastFound(`“”`)).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_5200
     * @tc.name      testLinkedList13Chapter0052
     * @tc.desc      Test removing tree string type of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0052';
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
      expect(newLinkedList.removeLastFound(init(10))).assertTrue()
      expect(newLinkedList.removeLastFound(init(100))).assertTrue()
      expect(newLinkedList.removeLastFound(init(1000))).assertTrue()
      expect(newLinkedList.removeLastFound(init(10000))).assertTrue()
      expect(newLinkedList.removeLastFound(init(100000))).assertTrue()
      expect(newLinkedList.length).assertEqual(0)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_5300
     * @tc.name      testLinkedList13Chapter0053
     * @tc.desc      Test removing slice string type of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0053';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()

      let str = "{k1:value1,k2:value2}"

      for (let i = 0; i < 10; i++){
        let result = str.substring(0,str.length-2);
        str = result
        expect(newLinkedList.add(str)).assertTrue()
      }

      str = "{k1:value1,k2:value2}"

      for (let i = 0; i < 10; i++){
        let result = str.substring(0,str.length-2);
        str = result
        expect(newLinkedList.removeLastFound(str)).assertTrue()
      }
      expect(newLinkedList.length).assertEqual(0)
    })


    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_5400
     * @tc.name      testLinkedList13Chapter0054
     * @tc.desc      Test String GC for removeLastFound: works after adding & releasing an extra-long string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0054';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const largeStr = 'a'.repeat(10 * 10 * 10);
      expect(newLinkedList.add(largeStr)).assertTrue()
      expect(newLinkedList.removeLastFound(largeStr)).assertTrue()

      let temp = newLinkedList
      temp.clear();

      const newLargeStr = "c".repeat(10 * 10 * 10)
      expect(newLinkedList.add(newLargeStr)).assertTrue()
      expect(newLinkedList.removeLastFound(newLargeStr)).assertTrue()
      expect(newLinkedList.has(newLargeStr)).assertFalse()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_5500
     * @tc.name      testLinkedList13Chapter0055
     * @tc.desc      Test removing 0 of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0055';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let test = 0
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeLastFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_5600
     * @tc.name      testLinkedList13Chapter0056
     * @tc.desc      Test removing undefined of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0056';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let test = undefined
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeLastFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_5700
     * @tc.name      testLinkedList13Chapter0057
     * @tc.desc      Test removing NaN of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0057';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let test = NaN
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeLastFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_5800
     * @tc.name      testLinkedList13Chapter0058
     * @tc.desc      Test removing -0 of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0058';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let test = -0
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeLastFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_5900
     * @tc.name      testLinkedList13Chapter0059
     * @tc.desc      Test removing positive infinity of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0059';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let test = Infinity
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeLastFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_6000
     * @tc.name      testLinkedList13Chapter0060
     * @tc.desc      Test removing negative infinity of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0060';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let test = -Infinity
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeLastFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_6100
     * @tc.name      testLinkedList13Chapter0061
     * @tc.desc      Test removing double type of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0061';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let test = Math.floor(1.5)

      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeLastFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_6200
     * @tc.name      testLinkedList13Chapter0062
     * @tc.desc      Test removing Number.MAX_VALUE of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0062';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let test = 1.7976931348623157e+308
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeLastFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_6300
     * @tc.name      testLinkedList13Chapter0063
     * @tc.desc      Test removing Number.MIN_VALUE of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0063';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let test = 5e-324
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeLastFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_6400
     * @tc.name      testLinkedList13Chapter0064
     * @tc.desc      Test removing Number.EPSILON of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0064';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let test = 2.220446049250313e-16
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeLastFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_6500
     * @tc.name      testLinkedList13Chapter0065
     * @tc.desc      Test removing Number.EPSILON of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0065';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let test = 2^53 - 1
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeLastFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_6600
     * @tc.name      testLinkedList13Chapter0066
     * @tc.desc      Test removing byte of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0066';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let test = -64
      newLinkedList.add(test)
      expect(newLinkedList.removeLastFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()

      test = -128
      newLinkedList.add(test)
      expect(newLinkedList.removeLastFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()

      test = 127
      newLinkedList.add(test)
      expect(newLinkedList.removeLastFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()

      test = 128
      newLinkedList.add(test)
      expect(newLinkedList.removeLastFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_6700
     * @tc.name      testLinkedList13Chapter0067
     * @tc.desc      Test removing out-of-bounds byte of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0067';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const test = 128
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeLastFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_6800
     * @tc.name      testLinkedList13Chapter0068
     * @tc.desc      Test removing short of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0068';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let test = 10000
      newLinkedList.add(test)
      expect(newLinkedList.removeLastFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()

      test = -32768
      newLinkedList.add(test)
      expect(newLinkedList.removeLastFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()

      test = 32767
      newLinkedList.add(test)
      expect(newLinkedList.removeLastFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_6900
     * @tc.name      testLinkedList13Chapter0069
     * @tc.desc      Test removing out-of-bounds short of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0069';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const test = 32768
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeLastFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_7000
     * @tc.name      testLinkedList13Chapter0070
     * @tc.desc      Test removing int of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0070';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let test = 1000000
      newLinkedList.add(test)
      expect(newLinkedList.removeLastFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()

      test = -2147483648
      newLinkedList.add(test)
      expect(newLinkedList.removeLastFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()

      test = 2147483647
      newLinkedList.add(test)
      expect(newLinkedList.removeLastFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()

    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_7100
     * @tc.name      testLinkedList13Chapter0071
     * @tc.desc      Test removing out-of-bounds int of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0071';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const test = 2147483648
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeLastFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_7200
     * @tc.name      testLinkedList13Chapter0072
     * @tc.desc      Test removing long of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0072';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let test = 1234567890123456
      newLinkedList.add(test)
      expect(newLinkedList.removeLastFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()

      test = -9223372036854775808
      newLinkedList.add(test)
      expect(newLinkedList.removeLastFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()

      test = 9223372036854775807
      newLinkedList.add(test)
      expect(newLinkedList.removeLastFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_7300
     * @tc.name      testLinkedList13Chapter0073
     * @tc.desc      Test removing out-of-bounds long of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0073';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const test = 9223372036854775808
      expect(newLinkedList.add(test)).assertTrue()
      expect(newLinkedList.removeLastFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_7400
     * @tc.name      testLinkedList13Chapter0074
     * @tc.desc      Test removing float of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0074';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let test = 3.14159
      newLinkedList.add(test)
      expect(newLinkedList.removeLastFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()

      test = 1.40129846432481707e-45
      newLinkedList.add(test)
      expect(newLinkedList.removeLastFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()

      test = 3.4028234663852860e+38
      newLinkedList.add(test)
      expect(newLinkedList.removeLastFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()
    });
    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT13_7500
     * @tc.name      testLinkedList13Chapter0075
     * @tc.desc      Test removing double of Number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList13Chapter0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList13Chapter0075';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let test = 12345.67890123456789
      newLinkedList.add(test)
      expect(newLinkedList.removeLastFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()

      test = 4.94065645841246544e-324
      newLinkedList.add(test)
      expect(newLinkedList.removeLastFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()

      test = 1.79769313486231570e+308
      newLinkedList.add(test)
      expect(newLinkedList.removeLastFound(test)).assertTrue()
      expect(newLinkedList.has(test)).assertFalse()
    });
  })
}