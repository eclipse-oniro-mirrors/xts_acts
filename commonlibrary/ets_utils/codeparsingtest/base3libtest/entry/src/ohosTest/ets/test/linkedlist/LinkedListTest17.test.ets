import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, TestType, Size, Level, expect } from '@ohos/hypium';
import { util, LinkedList } from '@kit.ArkTS';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function LinkedListTest17() {
  describe('LinkedListTest17', () => {
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
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_0100
     * @tc.name      testLinkedList17Chapter0001
     * @tc.desc      Test LinkedList: Replace added element at index with String (emojis & Unicode)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0001';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()

      newLinkedList.add("a")
      newLinkedList.set(0,"👆")
      expect(newLinkedList.get(0)).assertEqual(`\ud83d\udc46`)
      newLinkedList.add("a")
      newLinkedList.set(1,"👿")
      expect(newLinkedList.get(1)).assertEqual(`\ud83d\udc7f`)
      newLinkedList.add("a")
      newLinkedList.set(2,"👀")
      expect(newLinkedList.get(2)).assertEqual(`\ud83d\udc40`)
      newLinkedList.add("a")
      newLinkedList.set(3,"💯")
      expect(newLinkedList.get(3)).assertEqual(`\ud83d\udcaf`)
      newLinkedList.add("a")
      newLinkedList.set(4,"🎅")
      expect(newLinkedList.get(4)).assertEqual(`\ud83c\udf85`)
      newLinkedList.add("a")
      newLinkedList.set(5,"😼")
      expect(newLinkedList.get(5)).assertEqual(`\ud83d\ude3c`)
      newLinkedList.add("a")
      newLinkedList.set(6,"🔧")
      expect(newLinkedList.get(6)).assertEqual(`\ud83d\udd27`)
      newLinkedList.add("a")
      newLinkedList.set(7,"💇")
      expect(newLinkedList.get(7)).assertEqual(`\ud83d\udc87`)
      newLinkedList.add("a")
      newLinkedList.set(8,"🤼‍♂️")
      expect(newLinkedList.get(8)).assertEqual(`\ud83e\udd3c\u200d\u2642\ufe0f`)
      newLinkedList.add("a")
      newLinkedList.set(9,"🛢")
      expect(newLinkedList.get(9)).assertEqual(`\ud83d\udee2`)
      newLinkedList.add("a")
      newLinkedList.set(10,"🀄")
      expect(newLinkedList.get(10)).assertEqual(`\ud83c\udc04`)
      newLinkedList.add("a")
      newLinkedList.set(11,"🏴")
      expect(newLinkedList.get(11)).assertEqual(`\ud83c\udff4`)

      newLinkedList.set(0,`\ud83d\udc46`)
      expect(newLinkedList.get(0)).assertEqual(`👆`)
      newLinkedList.set(1,`\ud83d\udc7f`)
      expect(newLinkedList.get(1)).assertEqual(`👿`)
      newLinkedList.set(2,`\ud83d\udc40`)
      expect(newLinkedList.get(2)).assertEqual(`👀`)
      newLinkedList.set(3,`\ud83d\udcaf`)
      expect(newLinkedList.get(3)).assertEqual(`💯`)
      newLinkedList.set(4,`\ud83c\udf85`)
      expect(newLinkedList.get(4)).assertEqual(`🎅`)
      newLinkedList.set(5,`\ud83d\ude3c`)
      expect(newLinkedList.get(5)).assertEqual(`😼`)
      newLinkedList.set(6,`\ud83d\udd27`)
      expect(newLinkedList.get(6)).assertEqual(`🔧`)
      newLinkedList.set(7,`\ud83d\udc87`)
      expect(newLinkedList.get(7)).assertEqual(`💇`)
      newLinkedList.set(8,`\ud83e\udd3c\u200d\u2642\ufe0f`)
      expect(newLinkedList.get(8)).assertEqual(`🤼‍♂️`)
      newLinkedList.set(9,`\ud83d\udee2`)
      expect(newLinkedList.get(9)).assertEqual(`🛢`)
      newLinkedList.set(10,`\ud83c\udc04`)
      expect(newLinkedList.get(10)).assertEqual(`🀄`)
      newLinkedList.set(11,`\ud83c\udff4`)
      expect(newLinkedList.get(11)).assertEqual(`🏴`)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_0200
     * @tc.name      testLinkedList17Chapter0002
     * @tc.desc      Test replacing the added element with invalid unicode encodings of String type at specified index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0002';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()

      newLinkedList.add("a")
      newLinkedList.set(0,`\udc04`)
      expect(newLinkedList.get(0)).assertEqual(`\udc04`)
      newLinkedList.add("a")
      newLinkedList.set(1,`\ud83d`)
      expect(newLinkedList.get(1)).assertEqual(`\ud83d`)
      newLinkedList.add("a")
      newLinkedList.set(2,`\udff4`)
      expect(newLinkedList.get(2)).assertEqual(`\udff4`)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_0300
     * @tc.name      testLinkedList17Chapter0003
     * @tc.desc      Test replacing the added element with keywords of String type at specified index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0003';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()

      newLinkedList.add("a")
      newLinkedList.set(0,`"0" `)
      expect(newLinkedList.get(0)).assertEqual(`"0" `)
      newLinkedList.add("a")
      newLinkedList.set(1,`"NaN"`)
      expect(newLinkedList.get(1)).assertEqual(`"NaN"`)
      newLinkedList.add("a")
      newLinkedList.set(2,`“”`)
      expect(newLinkedList.get(2)).assertEqual(`“”`)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_0400
     * @tc.name      testLinkedList17Chapter0004
     * @tc.desc      Test replacing the added element with treeString type of String type at specified index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0004';
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
      newLinkedList.add("a")
      let text = init(10)
      newLinkedList.set(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
      newLinkedList.add("a")
      text = init(100)
      newLinkedList.set(1,text)
      expect(newLinkedList.get(1)).assertEqual(text)
      newLinkedList.add("a")
      text = init(1000)
      newLinkedList.set(2,text)
      expect(newLinkedList.get(2)).assertEqual(text)
      newLinkedList.add("a")
      text = init(10000)
      newLinkedList.set(3,text)
      expect(newLinkedList.get(3)).assertEqual(text)
      newLinkedList.add("a")
      text = init(100000)
      newLinkedList.set(4,text)
      expect(newLinkedList.get(4)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_0500
     * @tc.name      testLinkedList17Chapter0005
     * @tc.desc      Test replacing the added element with sliceString type of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0005';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()

      let str = "{k1:value1,k2:value2}"

      for (let i = 0; i < 10; i++){
        let result = str.substring(0,str.length-2);
        str = result
        newLinkedList.add("a")
        newLinkedList.set(0,str)
        expect(newLinkedList.get(0)).assertEqual(str)
      }
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_0600
     * @tc.name      testLinkedList17Chapter0006
     * @tc.desc      Test LinkedList: Replace element, verify normal work post ultra-long String add/release (GC)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0006';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const largeStr = 'a'.repeat(10 * 10 * 10);

      newLinkedList.add("a")
      newLinkedList.set(0,largeStr)
      expect(newLinkedList.get(0)).assertEqual(largeStr)

      let temp = newLinkedList
      temp.clear();

      const newLargeStr = "c".repeat(10 * 10 * 10)
      newLinkedList.add("a")
      newLinkedList.set(0,newLargeStr)
      expect(newLinkedList.get(0)).assertEqual(newLargeStr)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_0700
     * @tc.name      testLinkedList17Chapter0007
     * @tc.desc      Test replacing the added element with 0 of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0007';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = 0

      newLinkedList.add(1)
      newLinkedList.set(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_0800
     * @tc.name      testLinkedList17Chapter0008
     * @tc.desc      Test replacing the added element with undefined of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0008';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = undefined

      newLinkedList.add(1)
      newLinkedList.set(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_0900
     * @tc.name      testLinkedList17Chapter0009
     * @tc.desc      Test replacing the added element with NaN of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0009';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = NaN

      newLinkedList.add(1)
      newLinkedList.set(0,text)
      expect(newLinkedList.get(0)).assertNaN()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_1000
     * @tc.name      testLinkedList17Chapter0010
     * @tc.desc      Test replacing the added element with -0 of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0010';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = -0

      newLinkedList.add(1)
      newLinkedList.set(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_1100
     * @tc.name      testLinkedList17Chapter0011
     * @tc.desc      Test replacing the added element with positive infinity of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0011';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = Infinity

      newLinkedList.add(1)
      newLinkedList.set(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_1200
     * @tc.name      testLinkedList17Chapter0012
     * @tc.desc      Test replacing the added element with negative infinity of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0012';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = -Infinity

      newLinkedList.add(1)
      newLinkedList.set(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_1300
     * @tc.name      testLinkedList17Chapter0013
     * @tc.desc      Test replacing the added element with double type of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0013';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = Math.floor(1.5)


      newLinkedList.add(1)
      newLinkedList.set(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_1400
     * @tc.name      testLinkedList17Chapter0014
     * @tc.desc      Test replacing the added element with Number.MAX_VALUE of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0014';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = 1.7976931348623157e+308

      newLinkedList.add(1)
      newLinkedList.set(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_1500
     * @tc.name      testLinkedList17Chapter0015
     * @tc.desc      Test replacing the added element with Number.MIN_VALUE of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0015';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = 5e-324

      newLinkedList.add(1)
      newLinkedList.set(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_1600
     * @tc.name      testLinkedList17Chapter0016
     * @tc.desc      Test replacing the added element with Number.EPSILON of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0016';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = 2.220446049250313e-16

      newLinkedList.add(1)
      newLinkedList.set(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_1700
     * @tc.name      testLinkedList17Chapter0017
     * @tc.desc      Test replacing the added element with Number.EPSILON of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0017';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = 2^53 - 1

      newLinkedList.add(1)
      newLinkedList.set(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_1800
     * @tc.name      testLinkedList17Chapter0018
     * @tc.desc      Test replacing the added element with byte values of number type at specified index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0018';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text = -64
      newLinkedList.add(1)
      newLinkedList.set(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)

      text = -128
      newLinkedList.add(1)
      newLinkedList.set(1,text)
      expect(newLinkedList.get(1)).assertEqual(text)

      text = 127
      newLinkedList.add(1)
      newLinkedList.set(2,text)
      expect(newLinkedList.get(2)).assertEqual(text)

      text = 128
      newLinkedList.add(1)
      newLinkedList.set(3,text)
      expect(newLinkedList.get(3)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_1900
     * @tc.name      testLinkedList17Chapter0019
     * @tc.desc      Test replacing the added element with out-of-bounds byte values of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0019';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 128
      newLinkedList.add(1)
      newLinkedList.set(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_2000
     * @tc.name      testLinkedList17Chapter0020
     * @tc.desc      Test replacing the added element with short values of number type at specified index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0020';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text = 10000
      newLinkedList.add(1)
      newLinkedList.set(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)

      text = -32768
      newLinkedList.add(1)
      newLinkedList.set(1,text)
      expect(newLinkedList.get(1)).assertEqual(text)

      text = 32767
      newLinkedList.add(1)
      newLinkedList.set(2,text)
      expect(newLinkedList.get(2)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_2100
     * @tc.name      testLinkedList17Chapter0021
     * @tc.desc      Test replacing the added element with out-of-bounds short values of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0021';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 32768
      newLinkedList.add(1)
      newLinkedList.set(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_2200
     * @tc.name      testLinkedList17Chapter0022
     * @tc.desc      Test replacing the added element with int values of number type at specified index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0022';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text = 1000000
      newLinkedList.add(1)
      newLinkedList.set(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)

      text = -2147483648
      newLinkedList.add(1)
      newLinkedList.set(1,text)
      expect(newLinkedList.get(1)).assertEqual(text)

      text = 2147483647
      newLinkedList.add(1)
      newLinkedList.set(2,text)
      expect(newLinkedList.get(2)).assertEqual(text)

    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_2300
     * @tc.name      testLinkedList17Chapter0023
     * @tc.desc      Test replacing the added element with out-of-bounds int values of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0023';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 2147483648
      newLinkedList.add(1)
      newLinkedList.set(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_2400
     * @tc.name      testLinkedList17Chapter0024
     * @tc.desc      Test replacing the added element with long values of number type at specified index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0024';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text = 1234567890123456
      newLinkedList.add(1)
      newLinkedList.set(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)

      text = -9223372036854775808
      newLinkedList.add(1)
      newLinkedList.set(1,text)
      expect(newLinkedList.get(1)).assertEqual(text)

      text = 9223372036854775807
      newLinkedList.add(1)
      newLinkedList.set(2,text)
      expect(newLinkedList.get(2)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_2500
     * @tc.name      testLinkedList17Chapter0025
     * @tc.desc      Test replacing the added element with out-of-bounds long values of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0025';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 9223372036854775808
      newLinkedList.add(1)
      newLinkedList.set(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_2600
     * @tc.name      testLinkedList17Chapter0026
     * @tc.desc      Test replacing the added element with float values of number type at specified index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0026';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text = 3.14159
      newLinkedList.add(1)
      newLinkedList.set(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)

      text = 1.40129846432481707e-45
      newLinkedList.add(1)
      newLinkedList.set(1,text)
      expect(newLinkedList.get(1)).assertEqual(text)

      text = 3.4028234663852860e+38
      newLinkedList.add(1)
      newLinkedList.set(2,text)
      expect(newLinkedList.get(2)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_2700
     * @tc.name      testLinkedList17Chapter0027
     * @tc.desc      Test replacing the added element with float precision loss scenarios of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0027';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      newLinkedList.add(0)
      newLinkedList.add(1)
      const float1 = 0.1;
      const float2 = 0.2;
      newLinkedList.set(0,float1)
      newLinkedList.set(1,float2)
      const sum = Number(newLinkedList.get(0)) + Number(newLinkedList.get(1));
      expect(Math.abs(sum - 0.3) < 1e-10).assertTrue();
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_2800
     * @tc.name      testLinkedList17Chapter0028
     * @tc.desc      Test replacing the added element with double values of number type at specified index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0028';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text = 12345.67890123456789
      newLinkedList.add(1)
      newLinkedList.set(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)

      text = 4.94065645841246544e-324
      newLinkedList.add(1)
      newLinkedList.set(1,text)
      expect(newLinkedList.get(1)).assertEqual(text)

      text = 1.79769313486231570e+308
      newLinkedList.add(1)
      newLinkedList.set(2,text)
      expect(newLinkedList.get(2)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_2900
     * @tc.name      testLinkedList17Chapter0029
     * @tc.desc      Test replacing the added element with out-of-bounds double values of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0029';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 1.8e+308
      newLinkedList.add(1)
      newLinkedList.set(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_3000
     * @tc.name      testLinkedList17Chapter0030
     * @tc.desc      Test replacing the added element with char values of number type at specified index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0030';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text = 0
      newLinkedList.add(1)
      newLinkedList.set(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)

      text = -65535
      newLinkedList.add(1)
      newLinkedList.set(1,text)
      expect(newLinkedList.get(1)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_3100
     * @tc.name      testLinkedList17Chapter0031
     * @tc.desc      Test replacing the added element with char values stored as characters of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0031';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = "a"
      newLinkedList.add(1)
      newLinkedList.set(0,text.charCodeAt(0))
      expect(newLinkedList.get(0)).assertEqual(text.charCodeAt(0))
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_3200
     * @tc.name      testLinkedList17Chapter0032
     * @tc.desc      Test replacing the added element with out-of-bounds char values of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0032';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 65536
      newLinkedList.add(1)
      newLinkedList.set(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_3300
     * @tc.name      testLinkedList17Chapter0033
     * @tc.desc      Test replacing the added element with bigint values of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0033';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = BigInt(0xdecafafecacefade)
      newLinkedList.add(1)
      newLinkedList.set(0,Number(text))
      expect(newLinkedList.get(0)).assertEqual(Number(text))
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_3400
     * @tc.name      testLinkedList17Chapter0034
     * @tc.desc      Test replacing the added element with double values of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0034';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 123.456
      newLinkedList.add(1)
      newLinkedList.set(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_3500
     * @tc.name      testLinkedList17Chapter0035
     * @tc.desc      Test replacing the added element with float values of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0035';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 0xcafebabe
      newLinkedList.add(1)
      newLinkedList.set(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_3600
     * @tc.name      testLinkedList17Chapter0036
     * @tc.desc      Test replacing the added element with hexadecimal (16-bit) values of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0036';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 0x0102
      newLinkedList.add(1)
      newLinkedList.set(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_3700
     * @tc.name      testLinkedList17Chapter0037
     * @tc.desc      Test replacing the added element with hexadecimal (32-bit) values of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0037';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 0x01020304
      newLinkedList.add(1)
      newLinkedList.set(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_3800
     * @tc.name      testLinkedList17Chapter0038
     * @tc.desc      Test replacing the added element with octal values of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0038';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 0x3
      newLinkedList.add(1)
      newLinkedList.set(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_3900
     * @tc.name      testLinkedList17Chapter0039
     * @tc.desc      Test replacing the added element with exponent operator values of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0039';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 2 ** 3
      newLinkedList.add(1)
      newLinkedList.set(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_4000
     * @tc.name      testLinkedList17Chapter0040
     * @tc.desc      Test replacing the added element with scientific notation values of number type at specified index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0040';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text = 1e3
      newLinkedList.add(1)
      newLinkedList.set(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)

      text = 2.5e-2
      newLinkedList.add(1)
      newLinkedList.set(1,text)
      expect(newLinkedList.get(1)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_4100
     * @tc.name      testLinkedList17Chapter0041
     * @tc.desc      Test replacing the added element with scientific notation values of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0041';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = BigInt(9007199254740991n)
      newLinkedList.add(1)
      newLinkedList.set(0,Number(text))
      expect(newLinkedList.get(0)).assertEqual(Number(text))
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_4200
     * @tc.name      testLinkedList17Chapter0042
     * @tc.desc      Test replacing the added element with true value of boolean type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0042';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<boolean>()

      const text = true
      newLinkedList.add(false)
      newLinkedList.set(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_4300
     * @tc.name      testLinkedList17Chapter0043
     * @tc.desc      Test replacing the added element with false value of boolean type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0043';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<boolean>()

      const text = false
      newLinkedList.add(true)
      newLinkedList.set(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_4400
     * @tc.name      testLinkedList17Chapter0044
     * @tc.desc      Test: Replace added element at specified index with boolean falsy values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0044';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<boolean>()

      newLinkedList.add(true)
      const text01 = 0
      newLinkedList.set(0,Boolean(text01))
      expect(newLinkedList.get(0)).assertEqual(Boolean(text01))

      newLinkedList.add(true)
      const text02 = NaN
      newLinkedList.set(1,Boolean(text02))
      expect(newLinkedList.get(1)).assertEqual(Boolean(text02))

      newLinkedList.add(true)
      const text03 = ""
      newLinkedList.set(2,Boolean(text03))
      expect(newLinkedList.get(2)).assertEqual(Boolean(text03))

      newLinkedList.add(true)
      const text04 = null
      newLinkedList.set(3,text04)
      expect(newLinkedList.get(3)).assertEqual(text04)

      newLinkedList.add(true)
      const text05 = undefined
      newLinkedList.set(4,text05)
      expect(newLinkedList.get(4)).assertEqual(text05)

    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_4500
     * @tc.name      testLinkedList17Chapter0045
     * @tc.desc      Test replacing the added element with ! + other data types for boolean type at specified index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0045';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<boolean>()
      newLinkedList.add(true)
      newLinkedList.add(true)

      const text01 = !'s'
      newLinkedList.set(0,text01)
      expect(newLinkedList.get(0)).assertEqual(text01)

      const text02 = !0
      newLinkedList.set(1,text02)
      expect(newLinkedList.get(1)).assertEqual(text02)

    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_4600
     * @tc.name      testLinkedList17Chapter0046
     * @tc.desc      Test replacing the added element with ordinary objects of object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0046';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: number;
        b: string;
        c: number[];
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a:1, b:"test", c:[1,2,3]}

      newLinkedList.add({a:0,b:"",c:[]})
      newLinkedList.set(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_4700
     * @tc.name      testLinkedList17Chapter0047
     * @tc.desc      Test replacing the added element with nested objects of object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0047';
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

      newLinkedList.add({d: 0, e: {a:0, b:"", c:[]}})
      newLinkedList.set(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_4800
     * @tc.name      testLinkedList17Chapter0048
     * @tc.desc      Test: Replace added element with object-type objects (function props w/o params)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0048';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: number;
        b: Function;
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a:1, b:()=>{return true}}

      newLinkedList.add({a:0,b:()=>{}})
      newLinkedList.set(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_4900
     * @tc.name      testLinkedList17Chapter0049
     * @tc.desc      Test: Replace added element with object-type objects (function props w/ params)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0049';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: number;
        b: Function;
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a:1, b:(n:number)=>{return n*100}}

      newLinkedList.add({a:0, b:()=>{}})
      newLinkedList.set(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_5000
     * @tc.name      testLinkedList17Chapter0050
     * @tc.desc      Test replacing the added element with objects containing ArrayBuffer properties of object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0050';
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

      newLinkedList.add({ buffer: new ArrayBuffer(16) })
      newLinkedList.set(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_5100
     * @tc.name      testLinkedList17Chapter0051
     * @tc.desc      Test replacing the added element with objects containing DataView properties of object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0051';
      console.log(TAG + ' start');

      interface textObject_1 {
        view: DataView
      }
      const newLinkedList = new LinkedList<textObject_1>()
      const arrayBuffer = new ArrayBuffer(16)
      let text: textObject_1 = {view: new DataView(arrayBuffer)}

      newLinkedList.add({view: new DataView(arrayBuffer)})
      newLinkedList.set(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_5200
     * @tc.name      testLinkedList17Chapter0052
     * @tc.desc      Test replacing the added element with empty objects of object type at specified index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0052';
      console.log(TAG + ' start');

      interface textObject_1 {}
      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {}

      newLinkedList.add({})
      newLinkedList.set(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
      newLinkedList.add({})
      newLinkedList.set(1,text)
      expect(newLinkedList.get(1)).assertEqual(text)
      newLinkedList.add({})
      newLinkedList.set(2,text)
      expect(newLinkedList.get(2)).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_5300
     * @tc.name      testLinkedList17Chapter0053
     * @tc.desc      Test replacing the added element with extremely large objects of object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0053';
      console.log(TAG + ' start');

      const hugeObj: Record<string, number> = {};

      const newLinkedList = new LinkedList<Record<string, number>>()
      for (let i = 0; i < 10000; i++) {
        hugeObj[i.toString()] = i;
      }

      const start = Date.now()
      newLinkedList.add({})
      newLinkedList.set(0,hugeObj)
      expect(newLinkedList.get(0)).assertEqual(hugeObj)
      const cost = Date.now()   - start

      expect(newLinkedList.length).assertEqual(1)

      const newText = newLinkedList.getLast()
      expect(newText['5000']).assertEqual(5000)

      expect(cost < 10).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_5400
     * @tc.name      testLinkedList17Chapter0054
     * @tc.desc      Test replacing the added element with objects containing null properties of object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0054';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: null,
        b: number
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a: null, b: 1}

      newLinkedList.add({a:null,b:0})
      newLinkedList.set(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_5500
     * @tc.name      testLinkedList17Chapter0055
     * @tc.desc      Test replacing the added element with objects containing NaN properties of object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0055';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: number,
        b: number
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a: NaN, b: 1}

      newLinkedList.add({a:NaN,b:0})
      newLinkedList.set(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_5600
     * @tc.name      testLinkedList17Chapter0056
     * @tc.desc      Test replacing the added element with objects containing Infinity properties of object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0056';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: number,
        b: number
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a: Infinity, b: 1}

      newLinkedList.add({a:Infinity,b:0})
      newLinkedList.set(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_5700
     * @tc.name      testLinkedList17Chapter0057
     * @tc.desc      Test replacing the added element with objects containing TypedArray properties of object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0057';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: number,
        b: Uint8Array
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a: Infinity, b: new Uint8Array([172, 101, 108, 108, 111])}

      newLinkedList.add({a: Infinity, b: new Uint8Array([0, 0, 0, 0, 0])})
      newLinkedList.set(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_5800
     * @tc.name      testLinkedList17Chapter0058
     * @tc.desc      Test replacing the added element with objects containing Map properties of object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0058';
      console.log(TAG + ' start');


      interface textObject_1 {
        map: Map<string, string>,
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {map: new Map([['key1', 'value1'], ['key2', 'value2']])}

      newLinkedList.add({map: new Map([['', ''], ['', '']])})
      newLinkedList.set(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_5900
     * @tc.name      testLinkedList17Chapter0059
     * @tc.desc      Test replacing element with object containing Set property after adding element to LinkedList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0059';
      console.log(TAG + ' start');


      interface textObject_1 {
        set: Set<number>,
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {set: new Set([1,2,3,2,1])}

      newLinkedList.add({set: new Set([0,0,0,0,0])})
      newLinkedList.set(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_6000
     * @tc.name      testLinkedList17Chapter0060
     * @tc.desc      Test replacing element with object containing Promise property after adding element to LinkedList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const TAG = 'testLinkedList17Chapter0060';
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

      newLinkedList.add({promise: testPromise})
      newLinkedList.set(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_6100
     * @tc.name      testLinkedList17Chapter0061
     * @tc.desc      Test LinkedList: Add element, replace with object (regex property)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0061';
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

      newLinkedList.add({
        regex: testRegex,
        flags: testRegex.flags
      })
      newLinkedList.set(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_6200
     * @tc.name      testLinkedList17Chapter0062
     * @tc.desc      Test replacing element with normal Uint8Array after adding element to LinkedList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0062';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const text = new Uint8Array([72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63])

      newLinkedList.add(new Uint8Array([]))
      newLinkedList.set(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_6300
     * @tc.name      testLinkedList17Chapter0063
     * @tc.desc      Test replacing element with Uint8Array containing multiple zeros after adding element to LinkedList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0063';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const text = new Uint8Array([72, 101, 108, 108, 111, 87, 111, 114, 108,0,0,0,0,0, 100, 49, 50, 51, 63])

      newLinkedList.add(new Uint8Array([]))
      newLinkedList.set(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
      expect(newLinkedList.get(0).length).assertEqual(19)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_6400
     * @tc.name      testLinkedList17Chapter0064
     * @tc.desc      Test LinkedList: Add element, replace with Uint8Array (converted from negative-number Array)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0064';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const text = new Uint8Array([72, 101, 108, 108, 111, -87, -111, -114, 108, 100, -49, 50, 51, 63])

      newLinkedList.add(new Uint8Array([]))
      newLinkedList.set(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_6500
     * @tc.name      testLinkedList17Chapter0065
     * @tc.desc      Test LinkedList: Add element, replace with Uint8/Uint16Array (converted from negative-number Array)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0065';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const newLinkedList1 = new LinkedList<Uint16Array>()
      const text = new Uint8Array([72, 101, 108, 108, 111, -87, -111, -114, 108, 100, -49, 50, 51, 63])
      const text1 = new Uint16Array([72, 101, 108, 108, 111, -87, -111, -114, 108, 100, -49, 50, 51, 63])

      newLinkedList.add(new Uint8Array([]))
      newLinkedList.set(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
      newLinkedList1.add(new Uint16Array([]))
      newLinkedList1.set(0,text1)
      expect(newLinkedList1.get(0)).assertEqual(text1)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_6600
     * @tc.name      testLinkedList17Chapter0066
     * @tc.desc      Test replacing element with special Array after adding element to LinkedList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0066';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Array<number | string>>()
      const text:Array<number | string> = []
      text["abc"] = 111
      text["aaa"] = 222
      newLinkedList.add([])
      newLinkedList.set(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_6700
     * @tc.name      testLinkedList17Chapter0067
     * @tc.desc      Test replacing element with Uint8Array containing NaN/Infinity after adding element to LinkedList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0067';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const text = new Uint8Array([72, 101, 108, NaN, Infinity, 108, 111])
      newLinkedList.add(new Uint8Array([]))
      newLinkedList.set(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_6800
     * @tc.name      testLinkedList17Chapter0068
     * @tc.desc      Test replacing element with Array containing non-numeric types after adding element to LinkedList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0068';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Array<number | string | boolean | null | undefined>>()
      const text:Array<number | string | boolean | null | undefined> = [72, "abc", true, null, undefined, 108]
      newLinkedList.add([])
      newLinkedList.set(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_6900
     * @tc.name      testLinkedList17Chapter0069
     * @tc.desc      Test replacing element with Array containing non-numeric types after adding element to LinkedList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0069';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Array<number | string | boolean | null | undefined>>()
      const text:Array<number | string | boolean | null | undefined> = [72, "abc", true, null, undefined, 108]
      newLinkedList.add([])
      newLinkedList.set(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_7000
     * @tc.name      testLinkedList17Chapter0070
     * @tc.desc      Test replacing element with empty Array after adding element to LinkedList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0070';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Array<string>>()
      const text:Array<string> = []
      newLinkedList.add([])
      newLinkedList.set(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_7100
     * @tc.name      testLinkedList17Chapter0071
     * @tc.desc      Test LinkedList: Add element, replace with Uint8Array (extreme numeric overflow values)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0071';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const text = new Uint8Array([256, 65536, 32768])
      newLinkedList.add(new Uint8Array([]))
      newLinkedList.set(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_7200
     * @tc.name      testLinkedList17Chapter0072
     * @tc.desc      Test LinkedList: Add elements, replace specified indices with Int8/Uint8/Uint8ClampedArray
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0072';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Int8Array | Uint8Array | Uint8ClampedArray>()
      const text1 = new Int8Array([127, -128, 128, -129])
      const text2 = new Uint8Array([255, 0, 256, -1])
      const text3 = new Uint8ClampedArray([255, 0, 256, -1])

      newLinkedList.add(new Int8Array([]))
      newLinkedList.set(0,text1)
      expect(newLinkedList.get(0)).assertEqual(text1)
      newLinkedList.add(new Uint8Array([]))
      newLinkedList.set(1,text2)
      expect(newLinkedList.get(1)).assertEqual(text2)
      newLinkedList.add(new Uint8ClampedArray([]))
      newLinkedList.set(2,text3)
      expect(newLinkedList.get(2)).assertEqual(text3)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_7300
     * @tc.name      testLinkedList17Chapter0073
     * @tc.desc      Test LinkedList: Add elements, replace specified indices with Int16/Uint16/Int32/Uint32Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0073';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Int16Array | Uint16Array | Int32Array | Uint32Array>()
      const text1 = new Int16Array([32767, -32768, 32769, -32769])
      const text2 = new Uint16Array([65535, 0, 65536, -1])
      const text3 = new Int32Array([2147483647, -2147483648, 2147483648, -2147483649])
      const text4 = new Uint32Array([4294967295, 0, 4294967296, -1])

      newLinkedList.add(new Int16Array([]))
      newLinkedList.set(0,text1)
      expect(newLinkedList.get(0)).assertEqual(text1)
      newLinkedList.add(new Uint16Array([]))
      newLinkedList.set(1,text2)
      expect(newLinkedList.get(1)).assertEqual(text2)
      newLinkedList.add(new Int32Array([]))
      newLinkedList.set(2,text3)
      expect(newLinkedList.get(2)).assertEqual(text3)
      newLinkedList.add(new Uint32Array([]))
      newLinkedList.set(3,text4)
      expect(newLinkedList.get(3)).assertEqual(text4)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT17_7400
     * @tc.name      testLinkedList17Chapter0074
     * @tc.desc      Test LinkedList:Add elements,replace specified indices with Float32/Float64/BigInt64/BigUint64Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList17Chapter0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList17Chapter0074';
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

      newLinkedList.add(new Float32Array([]))
      newLinkedList.set(0,text1)
      expect(newLinkedList.get(0)).assertEqual(text1)
      newLinkedList.add(new Float64Array([]))
      newLinkedList.set(1,text2)
      expect(newLinkedList.get(1)).assertEqual(text2)
      newLinkedList.add(new BigInt64Array([]))
      newLinkedList.set(2,text3)
      expect(newLinkedList.get(2)).assertEqual(text3)
      newLinkedList.add(new BigUint64Array([]))
      newLinkedList.set(3,text4)
      expect(newLinkedList.get(3)).assertEqual(text4)
    })
  })
}