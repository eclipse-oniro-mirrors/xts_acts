import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, TestType, Size, Level, expect } from '@ohos/hypium';
import { util, LinkedList } from '@kit.ArkTS';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function LinkedListTest15() {
  describe('LinkedListTest15', () => {
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
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_0100
     * @tc.name      testLinkedList15Chapter0001
     * @tc.desc      Test adding float precision loss scenario of number class and clone, verify that the cloned instance is the same.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0001';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const float1 = 0.1;
      const float2 = 0.2;
      newLinkedList.add(float1);
      newLinkedList.add(float2);
      const sum = Number(newLinkedList.get(0)) + Number(newLinkedList.get(1));
      expect(Math.abs(sum - 0.3) < 1e-10).assertTrue();

      const testLinkedList = newLinkedList.clone()
      expect(testLinkedList.get(0)).assertEqual(newLinkedList.get(0))
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_0200
     * @tc.name      testLinkedList15Chapter0002
     * @tc.desc      Test adding double of number class and clone, verify that the cloned instance is the same.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0002';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      expect(newLinkedList.add(12345.67890123456789)).assertTrue()
      expect(newLinkedList.add(4.94065645841246544e-324)).assertTrue()
      expect(newLinkedList.add(1.79769313486231570e+308)).assertTrue()

      const testLinkedList = newLinkedList.clone()
      for (let i = 0; i < newLinkedList.length; i++){
        expect(testLinkedList.get(i)).assertEqual(newLinkedList.get(i))
      }
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_0300
     * @tc.name      testLinkedList15Chapter0003
     * @tc.desc      Test adding out-of-bounds double of number class and clone, verify that the cloned instance is the same.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0003';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 1.8e+308
      expect(newLinkedList.add(text)).assertTrue()

      const testLinkedList = newLinkedList.clone()
      expect(testLinkedList.get(0)).assertEqual(newLinkedList.get(0))
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_0400
     * @tc.name      testLinkedList15Chapter0004
     * @tc.desc      Test adding char of number class and clone, verify that the cloned instance is the same.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0004';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      expect(newLinkedList.add(0)).assertTrue()
      expect(newLinkedList.add(-65535)).assertTrue()

      const testLinkedList = newLinkedList.clone()
      for (let i = 0; i < newLinkedList.length; i++){
        expect(testLinkedList.get(i)).assertEqual(newLinkedList.get(i))
      }
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_0500
     * @tc.name      testLinkedList15Chapter0005
     * @tc.desc      Test adding char of number class stored as character and clone, verify that the cloned instance is the same.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0005';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = "a"
      expect(newLinkedList.add(text.charCodeAt(0))).assertTrue()

      const testLinkedList = newLinkedList.clone()
      expect(testLinkedList.get(0)).assertEqual(newLinkedList.get(0))
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_0600
     * @tc.name      testLinkedList15Chapter0006
     * @tc.desc      Test adding out-of-bounds char value of number class and clone, verify that the cloned instance is the same.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0006';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 65536
      expect(newLinkedList.add(text)).assertTrue()

      const testLinkedList = newLinkedList.clone()
      expect(testLinkedList.get(0)).assertEqual(newLinkedList.get(0))
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_0700
     * @tc.name      testLinkedList15Chapter0007
     * @tc.desc      Test adding bigint value of number class and clone, verify that the cloned instance is the same.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0007';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = BigInt(0xdecafafecacefade)
      expect(newLinkedList.add(Number(text))).assertTrue()

      const testLinkedList = newLinkedList.clone()
      expect(testLinkedList.get(0)).assertEqual(newLinkedList.get(0))
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_0800
     * @tc.name      testLinkedList15Chapter0008
     * @tc.desc      Test adding double value of number class and clone, verify that the cloned instance is the same.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0008';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 123.456
      expect(newLinkedList.add(text)).assertTrue()

      const testLinkedList = newLinkedList.clone()
      expect(testLinkedList.get(0)).assertEqual(newLinkedList.get(0))
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_0900
     * @tc.name      testLinkedList15Chapter0009
     * @tc.desc      Test adding float of number class and clone, verify that the cloned instance is the same.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0009';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 0xcafebabe
      expect(newLinkedList.add(text)).assertTrue()

      const testLinkedList = newLinkedList.clone()
      expect(testLinkedList.get(0)).assertEqual(newLinkedList.get(0))
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_1000
     * @tc.name      testLinkedList15Chapter0010
     * @tc.desc      Test adding hexadecimal (16-bit) of number class and clone, verify that the cloned instance is the same.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0010';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 0x0102
      expect(newLinkedList.add(text)).assertTrue()

      const testLinkedList = newLinkedList.clone()
      expect(testLinkedList.get(0)).assertEqual(newLinkedList.get(0))
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_1100
     * @tc.name      testLinkedList15Chapter0011
     * @tc.desc      Test adding 32-bit hexadecimal of number class and clone, verify that the cloned instance is the same.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0011';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 0x01020304
      expect(newLinkedList.add(text)).assertTrue()

      const testLinkedList = newLinkedList.clone()
      expect(testLinkedList.get(0)).assertEqual(newLinkedList.get(0))
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_1200
     * @tc.name      testLinkedList15Chapter0012
     * @tc.desc      Test adding octal of number class and clone, verify that the cloned instance is the same.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0012';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 0x3
      expect(newLinkedList.add(text)).assertTrue()

      const testLinkedList = newLinkedList.clone()
      expect(testLinkedList.get(0)).assertEqual(newLinkedList.get(0))
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_1300
     * @tc.name      testLinkedList15Chapter0013
     * @tc.desc      Test adding exponent operator result of number class and clone, verify that the cloned instance is the same.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0013';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 2 ** 3
      expect(newLinkedList.add(text)).assertTrue()

      const testLinkedList = newLinkedList.clone()
      expect(testLinkedList.get(0)).assertEqual(newLinkedList.get(0))
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_1400
     * @tc.name      testLinkedList15Chapter0014
     * @tc.desc      Test adding scientific notation of number class and clone, verify that the cloned instance is the same.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0014';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text = 1e3
      expect(newLinkedList.add(text)).assertTrue()

      text = 2.5e-2
      expect(newLinkedList.add(text)).assertTrue()

      const testLinkedList = newLinkedList.clone()
      for (let i = 0; i < newLinkedList.length; i++){
        expect(testLinkedList.get(i)).assertEqual(newLinkedList.get(i))
      }
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_1500
     * @tc.name      testLinkedList15Chapter0015
     * @tc.desc      Test adding large integer of number class and clone, verify that the cloned instance is the same.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0015';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = BigInt(9007199254740991n)
      expect(newLinkedList.add(Number(text))).assertTrue()

      const testLinkedList = newLinkedList.clone()
      expect(testLinkedList.get(0)).assertEqual(newLinkedList.get(0))
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_1600
     * @tc.name      testLinkedList15Chapter0016
     * @tc.desc      Test adding true of boolean class and clone, verify that the cloned instance is the same.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0016';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<boolean>()

      const text = true
      expect(newLinkedList.add(text)).assertTrue()

      const testLinkedList = newLinkedList.clone()
      expect(testLinkedList.get(0)).assertEqual(newLinkedList.get(0))
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_1700
     * @tc.name      testLinkedList15Chapter0017
     * @tc.desc      Test adding false of boolean class and clone, verify that the cloned instance is the same.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0017';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<boolean>()

      const text = false
      expect(newLinkedList.add(text)).assertTrue()

      const testLinkedList = newLinkedList.clone()
      expect(testLinkedList.get(0)).assertEqual(newLinkedList.get(0))
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_1800
     * @tc.name      testLinkedList15Chapter0018
     * @tc.desc      Test adding values often treated as false of boolean class and clone, verify that the cloned instance is the same.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0018';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<boolean>()

      const text01 = 0
      expect(newLinkedList.add(Boolean(text01))).assertTrue()

      const text02 = NaN
      expect(newLinkedList.add(Boolean(text02))).assertTrue()

      const text03 = ""
      expect(newLinkedList.add(Boolean(text03))).assertTrue()

      const text04 = null
      expect(newLinkedList.add(text04)).assertTrue()

      const text05 = undefined
      expect(newLinkedList.add(text05)).assertTrue()

      const testLinkedList = newLinkedList.clone()
      for (let i = 0; i < newLinkedList.length; i++){
        expect(testLinkedList.get(i)).assertEqual(newLinkedList.get(i))
      }
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_1900
     * @tc.name      testLinkedList15Chapter0019
     * @tc.desc      Test adding ! + other data types of boolean class and clone, verify that the cloned instance is the same.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0019';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<boolean>()

      const text01 = !'s'
      expect(newLinkedList.add(text01)).assertTrue()

      const text02 = !0
      expect(newLinkedList.add(text02)).assertTrue()

      const testLinkedList = newLinkedList.clone()
      for (let i = 0; i < newLinkedList.length; i++){
        expect(testLinkedList.get(i)).assertEqual(newLinkedList.get(i))
      }
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_2000
     * @tc.name      testLinkedList15Chapter0020
     * @tc.desc      Test adding ordinary object of object class and clone, verify that the cloned instance is the same.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0020';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: number;
        b: string;
        c: number[];
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a:1, b:"test", c:[1,2,3]}

      expect(newLinkedList.add(text)).assertTrue()

      const testLinkedList = newLinkedList.clone()
      expect(testLinkedList.get(0)).assertEqual(newLinkedList.get(0))
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_2100
     * @tc.name      testLinkedList15Chapter0021
     * @tc.desc      Test adding nested object of object class and clone, verify that the cloned instance is the same.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0021';
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

      expect(newLinkedList.add(text)).assertTrue()

      const testLinkedList = newLinkedList.clone()
      expect(testLinkedList.get(0)).assertEqual(newLinkedList.get(0))
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_2200
     * @tc.name      testLinkedList15Chapter0022
     * @tc.desc      Test adding object with function property (no parameters) of object class and clone, verify that the cloned instance is the same.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0022';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: number;
        b: Function;
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a:1, b:()=>{return true}}

      expect(newLinkedList.add(text)).assertTrue()

      const testLinkedList = newLinkedList.clone()
      expect(testLinkedList.get(0)).assertEqual(newLinkedList.get(0))
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_2300
     * @tc.name      testLinkedList15Chapter0023
     * @tc.desc      Test adding object with function property (with parameters) of object class and clone, verify that the cloned instance is the same.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0023';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: number;
        b: Function;
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a:1, b:(n:number)=>{return n*100}}

      expect(newLinkedList.add(text)).assertTrue()

      const testLinkedList = newLinkedList.clone()
      expect(testLinkedList.get(0)).assertEqual(newLinkedList.get(0))
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_2400
     * @tc.name      testLinkedList15Chapter0024
     * @tc.desc      Test adding object with ArrayBuffer property of object class and clone, verify that the cloned instance is the same.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0024';
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

      const testLinkedList = newLinkedList.clone()
      expect(testLinkedList.get(0)).assertEqual(newLinkedList.get(0))
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_2500
     * @tc.name      testLinkedList15Chapter0025
     * @tc.desc      Test adding object with DataView property of object class and clone, verify that the cloned instance is the same.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0025';
      console.log(TAG + ' start');

      interface textObject_1 {
        view: DataView
      }
      const newLinkedList = new LinkedList<textObject_1>()
      const arrayBuffer = new ArrayBuffer(16)
      let text: textObject_1 = {view: new DataView(arrayBuffer)}

      expect(newLinkedList.add(text)).assertTrue()

      const testLinkedList = newLinkedList.clone()
      expect(testLinkedList.get(0)).assertEqual(newLinkedList.get(0))
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_2600
     * @tc.name      testLinkedList15Chapter0026
     * @tc.desc      Test adding empty object of object class and clone, verify that the cloned instance is the same.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0026';
      console.log(TAG + ' start');

      interface textObject_1 {}
      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {}

      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.add(text)).assertTrue()

      const testLinkedList = newLinkedList.clone()
      for (let i = 0; i < newLinkedList.length; i++){
        expect(testLinkedList.get(i)).assertEqual(newLinkedList.get(i))
      }
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_2700
     * @tc.name      testLinkedList15Chapter0027
     * @tc.desc      Test adding extremely large object of object class and clone, verify that the cloned instance is the same.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0027';
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

      const testLinkedList = newLinkedList.clone()
      expect(testLinkedList.get(0)).assertEqual(newLinkedList.get(0))
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_2800
     * @tc.name      testLinkedList15Chapter0028
     * @tc.desc      Test adding object containing null property of object class and clone, verify that the cloned instance is the same.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0028';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: null,
        b: number
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a: null, b: 1}

      expect(newLinkedList.add(text)).assertTrue()

      const testLinkedList = newLinkedList.clone()
      expect(testLinkedList.get(0)).assertEqual(newLinkedList.get(0))
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_2900
     * @tc.name      testLinkedList15Chapter0029
     * @tc.desc      Test adding object containing NaN property of object class and clone, verify that the cloned instance is the same.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0029';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: number,
        b: number
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a: NaN, b: 1}

      expect(newLinkedList.add(text)).assertTrue()

      const testLinkedList = newLinkedList.clone()
      expect(testLinkedList.get(0)).assertEqual(newLinkedList.get(0))
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_3000
     * @tc.name      testLinkedList15Chapter0030
     * @tc.desc      Test adding object containing Infinity property of object class and clone, verify that the cloned instance is the same.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0030';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: number,
        b: number
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a: Infinity, b: 1}

      expect(newLinkedList.add(text)).assertTrue()

      const testLinkedList = newLinkedList.clone()
      expect(testLinkedList.get(0)).assertEqual(newLinkedList.get(0))
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_3100
     * @tc.name      testLinkedList15Chapter0031
     * @tc.desc      Test adding object with TypedArray property of object class and clone, verify that the cloned instance is the same.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0031';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: number,
        b: Uint8Array
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a: Infinity, b: new Uint8Array([172, 101, 108, 108, 111])}

      expect(newLinkedList.add(text)).assertTrue()

      const testLinkedList = newLinkedList.clone()
      expect(testLinkedList.get(0)).assertEqual(newLinkedList.get(0))
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_3200
     * @tc.name      testLinkedList15Chapter0032
     * @tc.desc      Test adding object with Map property of object class and clone, verify that the cloned instance is the same.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0032';
      console.log(TAG + ' start');


      interface textObject_1 {
        map: Map<string, string>,
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {map: new Map([['key1', 'value1'], ['key2', 'value2']])}

      expect(newLinkedList.add(text)).assertTrue()

      const testLinkedList = newLinkedList.clone()
      expect(testLinkedList.get(0)).assertEqual(newLinkedList.get(0))
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_3300
     * @tc.name      testLinkedList15Chapter0033
     * @tc.desc      Test adding object with Set property of object class and clone, verify that the cloned instance is the same.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0033';
      console.log(TAG + ' start');


      interface textObject_1 {
        set: Set<number>,
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {set: new Set([1,2,3,2,1])}

      expect(newLinkedList.add(text)).assertTrue()

      const testLinkedList = newLinkedList.clone()
      expect(testLinkedList.get(0)).assertEqual(newLinkedList.get(0))
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_3400
     * @tc.name      testLinkedList15Chapter0034
     * @tc.desc      Test adding object with Promise property of object class and clone, verify that the cloned instance is the same.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const TAG = 'testLinkedList15Chapter0034';
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

      const testLinkedList = newLinkedList.clone()
      expect(testLinkedList.get(0)).assertEqual(newLinkedList.get(0))

      const promiseResult = await testPromise;
      expect(isResolved).assertTrue()
      expect(promiseResult).assertEqual('done')
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_3500
     * @tc.name      testLinkedList15Chapter0035
     * @tc.desc      Test adding object with regular expression property of object class and clone, verify that the cloned instance is the same.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0035';
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

      const testLinkedList = newLinkedList.clone()
      expect(testLinkedList.get(0)).assertEqual(newLinkedList.get(0))
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_3600
     * @tc.name      testLinkedList15Chapter0036
     * @tc.desc      Test adding normal Uint8Array array of array class and clone, verify that the cloned instance is the same.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0036';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const text = new Uint8Array([72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63])

      expect(newLinkedList.add(text)).assertTrue()

      const testLinkedList = newLinkedList.clone()
      expect(testLinkedList.get(0)).assertEqual(newLinkedList.get(0))
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_3700
     * @tc.name      testLinkedList15Chapter0037
     * @tc.desc      Test adding array containing multiple zeros of array class and clone, verify that the cloned instance is the same.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0037';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const text = new Uint8Array([72, 101, 108, 108, 111, 87, 111, 114, 108,0,0,0,0,0, 100, 49, 50, 51, 63])

      expect(newLinkedList.add(text)).assertTrue()

      const testLinkedList = newLinkedList.clone()
      expect(testLinkedList.get(0)).assertEqual(newLinkedList.get(0))
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_3800
     * @tc.name      testLinkedList15Chapter0038
     * @tc.desc      Test adding Array (with negative numbers) converted to Uint8Array of array class and clone, verify that the cloned instance is the same.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0038';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const text = new Uint8Array([72, 101, 108, 108, 111, -87, -111, -114, 108, 100, -49, 50, 51, 63])

      expect(newLinkedList.add(text)).assertTrue()

      const testLinkedList = newLinkedList.clone()
      expect(testLinkedList.get(0)).assertEqual(newLinkedList.get(0))
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_3900
     * @tc.name      testLinkedList15Chapter0039
     * @tc.desc      Test adding Array (with negative numbers) converted to Uint8Array/Uint16Array of array class and clone, verify that the cloned instance is the same.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0039';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const newLinkedList1 = new LinkedList<Uint16Array>()
      const text = new Uint8Array([72, 101, 108, 108, 111, -87, -111, -114, 108, 100, -49, 50, 51, 63])
      const text1 = new Uint16Array([72, 101, 108, 108, 111, -87, -111, -114, 108, 100, -49, 50, 51, 63])

      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList1.add(text1)).assertTrue()

      const testLinkedList = newLinkedList.clone()
      for (let i = 0; i < newLinkedList.length; i++){
        expect(testLinkedList.get(i)).assertEqual(newLinkedList.get(i))
      }
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_4000
     * @tc.name      testLinkedList15Chapter0040
     * @tc.desc      Test adding special array of array class and clone, verify that the cloned instance is the same.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0040';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Array<number | string>>()
      const text:Array<number | string> = []
      text["abc"] = 111
      text["aaa"] = 222
      expect(newLinkedList.add(text)).assertTrue()

      const testLinkedList = newLinkedList.clone()
      expect(testLinkedList.get(0)).assertEqual(newLinkedList.get(0))
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_4100
     * @tc.name      testLinkedList15Chapter0041
     * @tc.desc      Test adding array containing NaN/Infinity of array class and clone, verify that the cloned instance is the same.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0041';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const text = new Uint8Array([72, 101, 108, NaN, Infinity, 108, 111])
      expect(newLinkedList.add(text)).assertTrue()

      const testLinkedList = newLinkedList.clone()
      expect(testLinkedList.get(0)).assertEqual(newLinkedList.get(0))
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_4200
     * @tc.name      testLinkedList15Chapter0042
     * @tc.desc      Test adding array containing non-numeric types of array class and clone, verify that the cloned instance is the same.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0042';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Array<number | string | boolean | null | undefined>>()
      const text:Array<number | string | boolean | null | undefined> = [72, "abc", true, null, undefined, 108]
      expect(newLinkedList.add(text)).assertTrue()

      const testLinkedList = newLinkedList.clone()
      expect(testLinkedList.get(0)).assertEqual(newLinkedList.get(0))
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_4300
     * @tc.name      testLinkedList15Chapter0043
     * @tc.desc      Test adding empty array of array class and clone, verify that the cloned instance is the same.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0043';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Array<string>>()
      const text:Array<string> = []
      expect(newLinkedList.add(text)).assertTrue()

      const testLinkedList = newLinkedList.clone()
      expect(testLinkedList.get(0)).assertEqual(newLinkedList.get(0))
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_4400
     * @tc.name      testLinkedList15Chapter0044
     * @tc.desc      Test adding array with extremely large numeric overflow of array class and clone, verify that the cloned instance is the same.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0044';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const text = new Uint8Array([256, 65536, 32768])
      expect(newLinkedList.add(text)).assertTrue()

      const testLinkedList = newLinkedList.clone()
      expect(testLinkedList.get(0)).assertEqual(newLinkedList.get(0))
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_4500
     * @tc.name      testLinkedList15Chapter0045
     * @tc.desc      Test adding Int8Array, Uint8Array, Uint8ClampedArray of array class and clone, verify that the cloned instance is the same.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0045';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Int8Array | Uint8Array | Uint8ClampedArray>()
      const text1 = new Int8Array([127, -128, 128, -129])
      const text2 = new Uint8Array([255, 0, 256, -1])
      const text3 = new Uint8ClampedArray([255, 0, 256, -1])

      expect(newLinkedList.add(text1)).assertTrue()
      expect(newLinkedList.add(text2)).assertTrue()
      expect(newLinkedList.add(text3)).assertTrue()

      const testLinkedList = newLinkedList.clone()
      for (let i = 0; i < newLinkedList.length; i++){
        expect(testLinkedList.get(i)).assertEqual(newLinkedList.get(i))
      }
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_4600
     * @tc.name      testLinkedList15Chapter0046
     * @tc.desc      Test adding Int16Array, Uint16Array, Int32Array, Uint32Array of array class and clone, verify that the cloned instance is the same.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0046';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Int16Array | Uint16Array | Int32Array | Uint32Array>()
      const text1 = new Int16Array([32767, -32768, 32769, -32769])
      const text2 = new Uint16Array([65535, 0, 65536, -1])
      const text3 = new Int32Array([2147483647, -2147483648, 2147483648, -2147483649])
      const text4 = new Uint32Array([4294967295, 0, 4294967296, -1])

      expect(newLinkedList.add(text1)).assertTrue()
      expect(newLinkedList.add(text2)).assertTrue()
      expect(newLinkedList.add(text3)).assertTrue()
      expect(newLinkedList.add(text4)).assertTrue()

      const testLinkedList = newLinkedList.clone()
      for (let i = 0; i < newLinkedList.length; i++){
        expect(testLinkedList.get(i)).assertEqual(newLinkedList.get(i))
      }
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_4700
     * @tc.name      testLinkedList15Chapter0047
     * @tc.desc      Test adding Float32Array, Float64Array, BigInt64Array, BigUint64Array of array class and clone, verify that the cloned instance is the same.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0047';
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
      expect(newLinkedList.add(text2)).assertTrue()
      expect(newLinkedList.add(text3)).assertTrue()
      expect(newLinkedList.add(text4)).assertTrue()

      const testLinkedList = newLinkedList.clone()
      for (let i = 0; i < newLinkedList.length; i++){
        expect(testLinkedList.get(i)).assertEqual(newLinkedList.get(i))
      }
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_4800
     * @tc.name      testLinkedList15Chapter0048
     * @tc.desc      Test adding TypedArray special value storage rules of array class and clone, verify that the cloned instance is the same.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0048';
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
      expect(newLinkedList.add(text2)).assertTrue()
      expect(newLinkedList.add(text3)).assertTrue()
      expect(newLinkedList.add(text4)).assertTrue()
      expect(newLinkedList.add(text5)).assertTrue()
      expect(newLinkedList.add(text6)).assertTrue()
      expect(newLinkedList.add(text7)).assertTrue()
      expect(newLinkedList.add(text8)).assertTrue()

      const testLinkedList = newLinkedList.clone()
      for (let i = 0; i < newLinkedList.length; i++){
        expect(testLinkedList.get(i)).assertEqual(newLinkedList.get(i))
      }
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_4900
     * @tc.name      testLinkedList15Chapter0049
     * @tc.desc      Test adding array containing non-numeric types of array class and clone, verify that the cloned instance is the same.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0049';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Array<number | string | boolean | null | undefined>>()
      const text:Array<number | string | boolean | null | undefined> = [72, "abc", true, null, undefined, 108]
      expect(newLinkedList.add(text)).assertTrue()

      const testLinkedList = newLinkedList.clone()
      expect(testLinkedList.get(0)).assertEqual(newLinkedList.get(0))
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_5000
     * @tc.name      testLinkedList15Chapter0050
     * @tc.desc      Test callback function to traverse complete basic characters of String class, ensuring indices match the actual added elements.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0050';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const textString = [
        undefined, null, "", " ", "!", "\"", "#", "$", "%", "&", "'", "(", ")", "*", "+", ",", "-", ".",
        "/", ":", ";", "<", "=", ">", "?", "@", "[", "\\", "]", "^", "_", "`", "{", "|", "}", "~", "0",
        "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J",
        "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "a", "b", "c",
        "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v",
        "w", "x", "y", "z", "!!", "\"\"", "##", "$$", "%%", "&&", "''", "(())", "**", "++", ",,", "--",
        "..", "//", "::", ";;", "<<", "==", ">>", "??", "@@", "[[", "\\\\", "]]", "^^", "__", "``", "{{",
        "||", "}}", "~~",
      ];

      for (let i of textString){
        expect(newLinkedList.add(i)).assertTrue();
      }
	  expect(newLinkedList[0]).assertUndefined();
      newLinkedList.forEach((value:string, index:number) => {
        expect(value).assertEqual(textString[index]);
      })
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_5100
     * @tc.name      testLinkedList15Chapter0051
     * @tc.desc      Test callback function to traverse complete special escape characters of String class, ensuring indices match the actual added elements.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0051';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const textEscape = [
        "\a", "\b", "\f", "\n", "\r", "\t", "\v", "\\", "\'", "\"", "\?", "\0", "\d", "\x31"
      ]

      for (let i of textEscape){
        expect(newLinkedList.add(i)).assertTrue()
      }
      newLinkedList.forEach((value:string, index:number) => {
        expect(value).assertEqual(textEscape[index])
      })
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_5200
     * @tc.name      testLinkedList15Chapter0052
     * @tc.desc      Test callback function to traverse complete emoji symbols and their Unicode encodings of String class, ensuring indices match the actual added elements.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0052';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const textUnicode = [
        "👆", "👿", "👀", "💯", "🎅", "😼", "🔧", "💇", "🤼‍♂️", "🛢", "🀄", "🏴",
        `\ud83d\udc46`, `\ud83d\udc7f`, `\ud83d\udc40`, `\ud83d\udcaf`, `\ud83c\udf85`,
        `\ud83d\ude3c`, `\ud83d\udd27`, `\ud83d\udc87`, `\ud83e\udd3c\u200d\u2642\ufe0f`,
        `\ud83d\udee2`, `\ud83c\udc04`, `\ud83c\udff4`
      ]

      for (let i of textUnicode){
        expect(newLinkedList.add(i)).assertTrue()
      }
      newLinkedList.forEach((value:string, index:number) => {
        expect(value).assertEqual(textUnicode[index])
      })
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_5300
     * @tc.name      testLinkedList15Chapter0053
     * @tc.desc      Test callback function to traverse complete invalid Unicode encodings and keywords of String class, ensuring indices match the actual added elements.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0053';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const textIllegal = [
        `\udc04`, `\ud83d`, `\udff4`, "0", "NaN", "“", "”"
      ]

      for (let i of textIllegal){
        expect(newLinkedList.add(i)).assertTrue()
      }
      newLinkedList.forEach((value:string, index:number) => {
        expect(value).assertEqual(textIllegal[index])
      })
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_5400
     * @tc.name      testLinkedList15Chapter0054
     * @tc.desc      Test callback function to traverse all elements of number class, ensuring indices match the actual added elements.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0054';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      const textNumber = [
        0, undefined, NaN, -0, Infinity, -Infinity, Math.floor(1.5), 1.7976931348623157e+308,
        5e-324, 2.220446049250313e-16, Number(9007199254740991n), -128, 64, 127, -32768, 16384,
        32767, -2147483648, 1073741824, 2147483647, -9223372036854775808, 4611686018427387904,
        9223372036854775807, -1.40129846432481707e-45, 1.7014117331926443e+38, 3.40282346638528860e+38,
        1.40129846432481707e-45, -1.7014117331926443e+38, -3.40282346638528860e+38,
        -4.94065645841246544e-324, 8.9884656743115785e+307, 1.79769313486231570e+308,
        4.94065645841246544e-324, -8.9884656743115785e+307, -1.79769313486231570e+308,
        0, 32768, 65535, Number(BigInt(0xdecafafecacefade)), 123.456, 0xcafebabe, 0x0102, 0x01020304, 0x3,
        8, 1000, 0.025, Number(9007199254740991n)
      ];

      for (let i of textNumber){
        expect(newLinkedList.add(i)).assertTrue()
      }
      newLinkedList.forEach((value: number, index: number) => {
        if (Number.isNaN(value)) {
          expect(value).assertNaN()
        }else {
          expect(value).assertEqual(textNumber[index])
        }
      })
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_5500
     * @tc.name      testLinkedList15Chapter0055
     * @tc.desc      Test callback function to traverse all elements of Boolean class, ensuring indices match the actual added elements.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0055';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<boolean>()
      const textBoolean = [
        true, false, 0, NaN, "", null, undefined, !'s', !0
      ]

      for (let i of textBoolean){
        expect(newLinkedList.add(Boolean(i))).assertTrue()
      }
      newLinkedList.forEach((value: boolean, index: number) => {
        expect(value).assertEqual(Boolean(textBoolean[index]))
      })
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_5600
     * @tc.name      testLinkedList15Chapter0056
     * @tc.desc      Test callback function to traverse all elements of object class, ensuring indices match the actual added elements.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0056';
      console.log(TAG + ' start');

      interface testObject_S{
        strings:string[]
        numbers:number[]
        boolean:boolean[]
      }

      interface testObject {
        string:string,
        number:number,
        boolean:boolean,
        object:testObject_S,
        function:Function,
        arrayBuffer: ArrayBuffer,
        dataView: DataView,
        undefined: undefined,
        null: null,
        naN: number,
        infinity: number ,
        uint8Array: Uint8Array,
        map: Map<string, string>,
        set: Set<number>,
        promise: Promise<string>,
        regex: RegExp
      }
      const textRegex = /abc/gi
      let isResolved = false;
      const testPromise = new Promise<string>((resolve) => {
        setTimeout(() => {
          isResolved = true;
          resolve('done');
        }, 100);
      });

      const newLinkedList = new LinkedList<testObject>()
      const textObject: testObject = {
        string: "homo",
        number: 114514,
        boolean: true,
        object: {
          strings: ["a", "b", "c"],
          numbers: [1, 2, 3],
          boolean: [true, false]
        },
        function:()=>{return true},
        arrayBuffer:  new ArrayBuffer(16),
        dataView: new DataView(new ArrayBuffer(16)),
        undefined: undefined,
        null: null,
        naN: NaN,
        infinity: Infinity ,
        uint8Array: new Uint8Array([72,101,108,108,111]),
        map: new Map([['key1', 'value1'], ['key2', 'value2']]),
        set: new Set([1,2,3,2,1]),
        promise: testPromise,
        regex: textRegex,
      }

      expect(newLinkedList.add(textObject)).assertTrue()

      newLinkedList.forEach(async (value: testObject, index: number) => {
        if (index == 0) {
          const newObject: testObject = value;
          expect(newObject.string).assertEqual("homo")
          expect(newObject.number).assertEqual(114514)
          expect(newObject.boolean).assertTrue()
          expect(newObject.object.strings[0]).assertEqual("a")
          expect(newObject.object.strings[1]).assertEqual("b")
          expect(newObject.object.strings[2]).assertEqual("c")
          expect(newObject.object.numbers[0]).assertEqual(1)
          expect(newObject.object.numbers[1]).assertEqual(2)
          expect(newObject.object.numbers[2]).assertEqual(3)
          expect(newObject.object.boolean[0]).assertTrue()
          expect(newObject.object.boolean[1]).assertFalse()
          expect(newObject.function()).assertTrue()
          expect(newObject.arrayBuffer instanceof ArrayBuffer).assertTrue()
          expect(newObject.dataView.buffer instanceof ArrayBuffer).assertTrue()
          expect(newObject.undefined).assertUndefined()
          expect(newObject.null).assertNull()
          expect(newObject.naN).assertNaN()
          expect(newObject.infinity).assertEqual(Infinity)
          expect(newObject.uint8Array[0]).assertEqual(72)
          expect(newObject.uint8Array[1]).assertEqual(101)
          expect(newObject.uint8Array[2]).assertEqual(108)
          expect(newObject.uint8Array[3]).assertEqual(108)
          expect(newObject.uint8Array[4]).assertEqual(111)
          expect(newObject.map.get("key1")).assertEqual("value1")
          expect(newObject.map.get("key2")).assertEqual("value2")
          expect(newObject.set.has(1)).assertTrue()
          expect(newObject.set.has(2)).assertTrue()
          expect(newObject.set.has(3)).assertTrue()
          expect(newObject.set.has(4)).assertFalse()
          expect(isResolved).assertFalse()
          let result = ''
          result = await newObject.promise
          expect(isResolved).assertTrue()
          expect(result).assertEqual('done')
          expect(newObject.regex.test("ABC")).assertTrue()
          expect(newObject.regex.test("abd")).assertFalse()
          expect(newObject.regex.flags).assertEqual("gi")
          expect(newObject.regex.global).assertTrue()
          expect(newObject.regex.ignoreCase).assertTrue()
          expect(newObject.regex.source).assertEqual("abc")
        }
      })
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_5700
     * @tc.name      testLinkedList15Chapter0057
     * @tc.desc      Test whether undefined of String class can be correctly cleared after addition.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0057';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = undefined
      newLinkedList.add(test)
      newLinkedList.clear()
      expect(newLinkedList.has(test)).assertFalse()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_5800
     * @tc.name      testLinkedList15Chapter0058
     * @tc.desc      Test whether null of String class can be correctly cleared after addition.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0058';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = null
      newLinkedList.add(test)
      newLinkedList.clear()
      expect(newLinkedList.has(test)).assertFalse()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_5900
     * @tc.name      testLinkedList15Chapter0059
     * @tc.desc      Test whether empty string of String class can be correctly cleared after addition.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0059';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = ""
      newLinkedList.add(test)
      newLinkedList.clear()
      expect(newLinkedList.has(test)).assertFalse()

    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_6000
     * @tc.name      testLinkedList15Chapter0060
     * @tc.desc      Test whether full coverage of special characters of String class can be correctly cleared after addition.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0060';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~"
      newLinkedList.add(test)
      newLinkedList.clear()
      expect(newLinkedList.has(test)).assertFalse()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_6100
     * @tc.name      testLinkedList15Chapter0061
     * @tc.desc      Test whether full coverage of ASCII codes of String class can be correctly cleared after addition.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0061';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~"
      newLinkedList.add(test)
      newLinkedList.clear()
      expect(newLinkedList.has(test)).assertFalse()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_6200
     * @tc.name      testLinkedList15Chapter0062
     * @tc.desc      Test whether full coverage of special characters of String class (twice) can be correctly cleared after addition.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0062';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = " !!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~"
      newLinkedList.add(test)
      newLinkedList.clear()
      expect(newLinkedList.has(test)).assertFalse()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_6300
     * @tc.name      testLinkedList15Chapter0063
     * @tc.desc      Test whether special escape characters of String class can be correctly cleared after addition.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0063';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      newLinkedList.add("\a")
      newLinkedList.add("\b")
      newLinkedList.add("\f")
      newLinkedList.add("\n")
      newLinkedList.add("\r")
      newLinkedList.add("\t")
      newLinkedList.add("\v")
      newLinkedList.add("\\")
      newLinkedList.add("\'")
      newLinkedList.add("\"")
      newLinkedList.add("\?")
      newLinkedList.add("\0")
      newLinkedList.add("\d")
      newLinkedList.add("\x31")

      newLinkedList.clear()

      expect(newLinkedList.has("\a")).assertFalse()
      expect(newLinkedList.has("\b")).assertFalse()
      expect(newLinkedList.has("\f")).assertFalse()
      expect(newLinkedList.has("\n")).assertFalse()
      expect(newLinkedList.has("\r")).assertFalse()
      expect(newLinkedList.has("\t")).assertFalse()
      expect(newLinkedList.has("\v")).assertFalse()
      expect(newLinkedList.has("\\")).assertFalse()
      expect(newLinkedList.has("\'")).assertFalse()
      expect(newLinkedList.has("\"")).assertFalse()
      expect(newLinkedList.has("\?")).assertFalse()
      expect(newLinkedList.has("\0")).assertFalse()
      expect(newLinkedList.has("\d")).assertFalse()
      expect(newLinkedList.has("\x31")).assertFalse()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_6400
     * @tc.name      testLinkedList15Chapter0064
     * @tc.desc      Test: Verify correct clearing of String-class emoji symbols & their Unicode encodings post addition
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0064';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      newLinkedList.add("👆")
      newLinkedList.add("👿")
      newLinkedList.add("👀")
      newLinkedList.add("💯")
      newLinkedList.add("🎅")
      newLinkedList.add("😼")
      newLinkedList.add("🔧")
      newLinkedList.add("💇")
      newLinkedList.add("🤼‍♂️")
      newLinkedList.add("🛢")
      newLinkedList.add("🀄")
      newLinkedList.add("🏴")
      newLinkedList.add(`\ud83d\udc46`)
      newLinkedList.add(`\ud83d\udc7f`)
      newLinkedList.add(`\ud83d\udc40`)
      newLinkedList.add(`\ud83d\udcaf`)
      newLinkedList.add(`\ud83c\udf85`)
      newLinkedList.add(`\ud83d\ude3c`)
      newLinkedList.add(`\ud83d\udd27`)
      newLinkedList.add(`\ud83d\udc87`)
      newLinkedList.add(`\ud83e\udd3c\u200d\u2642\ufe0f`)
      newLinkedList.add(`\ud83d\udee2`)
      newLinkedList.add(`\ud83c\udc04`)
      newLinkedList.add(`\ud83c\udff4`)

      newLinkedList.clear()

      expect(newLinkedList.has("👆")).assertFalse()
      expect(newLinkedList.has("👿")).assertFalse()
      expect(newLinkedList.has("👀")).assertFalse()
      expect(newLinkedList.has("💯")).assertFalse()
      expect(newLinkedList.has("🎅")).assertFalse()
      expect(newLinkedList.has("😼")).assertFalse()
      expect(newLinkedList.has("🔧")).assertFalse()
      expect(newLinkedList.has("💇")).assertFalse()
      expect(newLinkedList.has("🤼‍♂️")).assertFalse()
      expect(newLinkedList.has("🛢")).assertFalse()
      expect(newLinkedList.has("🀄")).assertFalse()
      expect(newLinkedList.has("🏴")).assertFalse()
      expect(newLinkedList.has(`\ud83d\udc46`)).assertFalse()
      expect(newLinkedList.has(`\ud83d\udc7f`)).assertFalse()
      expect(newLinkedList.has(`\ud83d\udc40`)).assertFalse()
      expect(newLinkedList.has(`\ud83d\udcaf`)).assertFalse()
      expect(newLinkedList.has(`\ud83c\udf85`)).assertFalse()
      expect(newLinkedList.has(`\ud83d\ude3c`)).assertFalse()
      expect(newLinkedList.has(`\ud83d\udd27`)).assertFalse()
      expect(newLinkedList.has(`\ud83d\udc87`)).assertFalse()
      expect(newLinkedList.has(`\ud83e\udd3c\u200d\u2642\ufe0f`)).assertFalse()
      expect(newLinkedList.has(`\ud83d\udee2`)).assertFalse()
      expect(newLinkedList.has(`\ud83c\udc04`)).assertFalse()
      expect(newLinkedList.has(`\ud83c\udff4`)).assertFalse()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_6500
     * @tc.name      testLinkedList15Chapter0065
     * @tc.desc      Test whether invalid Unicode encodings of String class can be correctly cleared after addition.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0065';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      newLinkedList.add(`\udc04`)
      newLinkedList.add(`\ud83d`)
      newLinkedList.add(`\udff4`)

      newLinkedList.clear()

      expect(newLinkedList.has(`\udc04`)).assertFalse()
      expect(newLinkedList.has(`\ud83d`)).assertFalse()
      expect(newLinkedList.has(`\udff4`)).assertFalse()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_6600
     * @tc.name      testLinkedList15Chapter0066
     * @tc.desc      Test whether keywords of String class can be correctly cleared after addition.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0066';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      newLinkedList.add(`"0" `)
      newLinkedList.add(`"NaN"`)
      newLinkedList.add(`“”`)

      newLinkedList.clear()

      expect(newLinkedList.has(`"0" `)).assertFalse()
      expect(newLinkedList.has(`"NaN"`)).assertFalse()
      expect(newLinkedList.has(`“”`)).assertFalse()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_6700
     * @tc.name      testLinkedList15Chapter0067
     * @tc.desc      Test whether treeString type of String class can be correctly cleared after addition.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0067';
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
      newLinkedList.add(init(10))
      newLinkedList.add(init(100))
      newLinkedList.add(init(1000))
      newLinkedList.add(init(10000))
      newLinkedList.add(init(100000))

      newLinkedList.clear()

      expect(newLinkedList.has(init(10))).assertFalse()
      expect(newLinkedList.has(init(100))).assertFalse()
      expect(newLinkedList.has(init(1000))).assertFalse()
      expect(newLinkedList.has(init(10000))).assertFalse()
      expect(newLinkedList.has(init(100000))).assertFalse()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT15_6800
     * @tc.name      testLinkedList15Chapter0068
     * @tc.desc      Test whether sliceString type of String class can be correctly cleared after addition.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList15Chapter0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList15Chapter0068';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()

      let str = "{k1:value1,k2:value2}"

      for (let i = 0; i < 10; i++){
        let result = str.substring(0,str.length-2);
        str = result
        newLinkedList.add(str)
        newLinkedList.clear()
        expect(newLinkedList.has(str)).assertFalse()
      }
    });
  })
}