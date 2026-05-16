import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, TestType, Size, Level, expect } from '@ohos/hypium';
import { util, LinkedList } from '@kit.ArkTS';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function LinkedListTest03() {
  describe('LinkedListTest03', () => {
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
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_0100
     * @tc.name      testLinkedList03Chapter0001
     * @tc.desc      Test adding array types Float32Array | Float64Array | BigInt64Array | BigUint64Array from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0001';
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

      newLinkedList.addFirst(text1)
      expect(newLinkedList.getFirst()).assertEqual(text1)
      newLinkedList.addFirst(text2)
      expect(newLinkedList.getFirst()).assertEqual(text2)
      newLinkedList.addFirst(text3)
      expect(newLinkedList.getFirst()).assertEqual(text3)
      newLinkedList.addFirst(text4)
      expect(newLinkedList.getFirst()).assertEqual(text4)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_0200
     * @tc.name      testLinkedList03Chapter0002
     * @tc.desc      Test storage rules for special values of TypedArray in array types added from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0002';
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

      newLinkedList.addFirst(text1)
      expect(newLinkedList.getFirst()).assertEqual(text1)
      newLinkedList.addFirst(text2)
      expect(newLinkedList.getFirst()).assertEqual(text2)
      newLinkedList.addFirst(text3)
      expect(newLinkedList.getFirst()).assertEqual(text3)
      newLinkedList.addFirst(text4)
      expect(newLinkedList.getFirst()).assertEqual(text4)
      newLinkedList.addFirst(text5)
      expect(newLinkedList.getFirst()).assertEqual(text5)
      newLinkedList.addFirst(text6)
      expect(newLinkedList.getFirst()).assertEqual(text6)
      newLinkedList.addFirst(text7)
      expect(newLinkedList.getFirst()).assertEqual(text7)
      newLinkedList.addFirst(text8)
      expect(newLinkedList.getFirst()).assertEqual(text8)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_0300
     * @tc.name      testLinkedList03Chapter0003
     * @tc.desc      Test inserting undefined of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0003';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = undefined
      newLinkedList.insert(0,test)
      expect(newLinkedList.get(0)).assertEqual(test)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_0400
     * @tc.name      testLinkedList03Chapter0004
     * @tc.desc      Test inserting null of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0004';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = null
      newLinkedList.insert(0,test)
      expect(newLinkedList.get(0)).assertEqual(test)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_0500
     * @tc.name      testLinkedList03Chapter0005
     * @tc.desc      Test inserting empty string of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0005';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = ""
      newLinkedList.insert(0,test)
      expect(newLinkedList.get(0)).assertEqual(test)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_0600
     * @tc.name      testLinkedList03Chapter0006
     * @tc.desc      Test full coverage of inserting special characters of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0006';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~"
      newLinkedList.insert(0,test)
      expect(newLinkedList.get(0)).assertEqual(test)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_0700
     * @tc.name      testLinkedList03Chapter0007
     * @tc.desc      Test full coverage of inserting ASCII codes of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0007';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~"
      newLinkedList.insert(0,test)
      expect(newLinkedList.get(0)).assertEqual(test)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_0800
     * @tc.name      testLinkedList03Chapter0008
     * @tc.desc      Test full coverage of inserting special characters of String type (twice)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0008';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = " !!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~"
      newLinkedList.insert(0,test)
      expect(newLinkedList.get(0)).assertEqual(test)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_0900
     * @tc.name      testLinkedList03Chapter0009
     * @tc.desc      Test inserting special escape characters of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0009';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()

      newLinkedList.insert(0,"\a")
      expect(newLinkedList.get(0)).assertEqual("\a")

      newLinkedList.insert(0,"\b")
      expect(newLinkedList.get(0)).assertEqual("\b")

      newLinkedList.insert(0,"\f")
      expect(newLinkedList.get(0)).assertEqual("\f")

      newLinkedList.insert(0,"\n")
      expect(newLinkedList.get(0)).assertEqual("\n")

      newLinkedList.insert(0,"\r")
      expect(newLinkedList.get(0)).assertEqual("\r")

      newLinkedList.insert(0,"\t")
      expect(newLinkedList.get(0)).assertEqual("\t")

      newLinkedList.insert(0,"\v")
      expect(newLinkedList.get(0)).assertEqual("\v")

      newLinkedList.insert(0,"\\")
      expect(newLinkedList.get(0)).assertEqual("\\")

      newLinkedList.insert(0,"\'")
      expect(newLinkedList.get(0)).assertEqual("\'")

      newLinkedList.insert(0,"\"")
      expect(newLinkedList.get(0)).assertEqual("\"")

      newLinkedList.insert(0,"\?")
      expect(newLinkedList.get(0)).assertEqual("\?")

      newLinkedList.insert(0,"\0")
      expect(newLinkedList.get(0)).assertEqual("\0")

      newLinkedList.insert(0,"\d")
      expect(newLinkedList.get(0)).assertEqual("\d")

      newLinkedList.insert(0,"\x31")
      expect(newLinkedList.get(0)).assertEqual("\x31")
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_1000
     * @tc.name      testLinkedList03Chapter0010
     * @tc.desc      Test inserting emoji symbols and their Unicode encodings of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0010';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()

      newLinkedList.insert(0,"👆")
      expect(newLinkedList.get(0)).assertEqual("👆")
      newLinkedList.insert(1,"👿")
      expect(newLinkedList.get(1)).assertEqual("👿")
      newLinkedList.insert(2,"👀")
      expect(newLinkedList.get(2)).assertEqual("👀")
      newLinkedList.insert(3,"💯")
      expect(newLinkedList.get(3)).assertEqual("💯")
      newLinkedList.insert(4,"🎅")
      expect(newLinkedList.get(4)).assertEqual("🎅")
      newLinkedList.insert(5,"😼")
      expect(newLinkedList.get(5)).assertEqual("😼")
      newLinkedList.insert(6,"🔧")
      expect(newLinkedList.get(6)).assertEqual("🔧")
      newLinkedList.insert(7,"💇")
      expect(newLinkedList.get(7)).assertEqual("💇")
      newLinkedList.insert(8,"🤼‍♂️")
      expect(newLinkedList.get(8)).assertEqual("🤼‍♂️")
      newLinkedList.insert(9,"🛢")
      expect(newLinkedList.get(9)).assertEqual("🛢")
      newLinkedList.insert(10,"🀄")
      expect(newLinkedList.get(10)).assertEqual("🀄")
      newLinkedList.insert(11,"🏴")
      expect(newLinkedList.get(11)).assertEqual("🏴")

      newLinkedList.insert(0,`\ud83d\udc46`)
      expect(newLinkedList.get(0)).assertEqual(`\ud83d\udc46`)
      newLinkedList.insert(1,`\ud83d\udc7f`)
      expect(newLinkedList.get(1)).assertEqual(`\ud83d\udc7f`)
      newLinkedList.insert(2,`\ud83d\udc40`)
      expect(newLinkedList.get(2)).assertEqual(`\ud83d\udc40`)
      newLinkedList.insert(3,`\ud83d\udcaf`)
      expect(newLinkedList.get(3)).assertEqual(`\ud83d\udcaf`)
      newLinkedList.insert(4,`\ud83c\udf85`)
      expect(newLinkedList.get(4)).assertEqual(`\ud83c\udf85`)
      newLinkedList.insert(5,`\ud83d\ude3c`)
      expect(newLinkedList.get(5)).assertEqual(`\ud83d\ude3c`)
      newLinkedList.insert(6,`\ud83d\udd27`)
      expect(newLinkedList.get(6)).assertEqual(`\ud83d\udd27`)
      newLinkedList.insert(7,`\ud83d\udc87`)
      expect(newLinkedList.get(7)).assertEqual(`\ud83d\udc87`)
      newLinkedList.insert(8,`\ud83e\udd3c\u200d\u2642\ufe0f`)
      expect(newLinkedList.get(8)).assertEqual(`\ud83e\udd3c\u200d\u2642\ufe0f`)
      newLinkedList.insert(9,`\ud83d\udee2`)
      expect(newLinkedList.get(9)).assertEqual(`\ud83d\udee2`)
      newLinkedList.insert(10,`\ud83c\udc04`)
      expect(newLinkedList.get(10)).assertEqual(`\ud83c\udc04`)
      newLinkedList.insert(11,`\ud83c\udff4`)
      expect(newLinkedList.get(11)).assertEqual(`\ud83c\udff4`)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_1100
     * @tc.name      testLinkedList03Chapter0011
     * @tc.desc      Test inserting invalid unicode encodings of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0011';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      newLinkedList.insert(0,`\udc04`)
      expect(newLinkedList.get(0)).assertEqual(`\udc04`)
      newLinkedList.insert(1,`\ud83d`)
      expect(newLinkedList.get(1)).assertEqual(`\ud83d`)
      newLinkedList.insert(2,`\udff4`)
      expect(newLinkedList.get(2)).assertEqual(`\udff4`)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_1200
     * @tc.name      testLinkedList03Chapter0012
     * @tc.desc      Test inserting keywords of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0012';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()

      newLinkedList.insert(0,`"0" `)
      expect(newLinkedList.get(0)).assertEqual(`"0" `)
      newLinkedList.insert(1,`"NaN"`)
      expect(newLinkedList.get(1)).assertEqual(`"NaN"`)
      newLinkedList.insert(2,`“”`)
      expect(newLinkedList.get(2)).assertEqual(`“”`)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_1300
     * @tc.name      testLinkedList03Chapter0013
     * @tc.desc      Test inserting treeString type of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0013';
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

      let text = init(10)
      newLinkedList.insert(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)

      text = init(100)
      newLinkedList.insert(1,text)
      expect(newLinkedList.get(1)).assertEqual(text)

      text = init(1000)
      newLinkedList.insert(2,text)
      expect(newLinkedList.get(2)).assertEqual(text)

      text = init(10000)
      newLinkedList.insert(3,text)
      expect(newLinkedList.get(3)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_1400
     * @tc.name      testLinkedList03Chapter0014
     * @tc.desc      Test inserting sliceString type of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0014';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()

      let str = "{k1:value1,k2:value2}"

      for (let i = 0; i < 10; i++){
        let result = str.substring(0,str.length-2);
        str = result

        newLinkedList.insert(0,str)
        expect(newLinkedList.get(0)).assertEqual(str)
      }
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_1500
     * @tc.name      testLinkedList03Chapter0015
     * @tc.desc      Test String GC for insertion: works after adding & releasing an ultra-long string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0015';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const largeStr = 'a'.repeat(10 * 10 * 10);

      newLinkedList.insert(0,largeStr)
      expect(newLinkedList.get(0)).assertEqual(largeStr)

      let temp = newLinkedList
      temp.clear();

      const newLargeStr = "c".repeat(10 * 10 * 10)

      newLinkedList.insert(0,newLargeStr)
      expect(newLinkedList.get(0)).assertEqual(newLargeStr)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_1600
     * @tc.name      testLinkedList03Chapter0016
     * @tc.desc      Test inserting 0 of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0016';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = 0

      newLinkedList.insert(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_1700
     * @tc.name      testLinkedList03Chapter0017
     * @tc.desc      Test inserting undefined of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0017';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = undefined

      newLinkedList.insert(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_1800
     * @tc.name      testLinkedList03Chapter0018
     * @tc.desc      Test inserting NaN of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0018';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = NaN

      newLinkedList.insert(0,text)
      expect(newLinkedList.get(0)).assertNaN()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_1900
     * @tc.name      testLinkedList03Chapter0019
     * @tc.desc      Test inserting -0 of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0019';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = -0

      newLinkedList.insert(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_2000
     * @tc.name      testLinkedList03Chapter0020
     * @tc.desc      Test inserting positive infinity of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0020';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = Infinity

      newLinkedList.insert(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_2100
     * @tc.name      testLinkedList03Chapter0021
     * @tc.desc      Test inserting negative infinity of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0021';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = -Infinity

      newLinkedList.insert(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_2200
     * @tc.name      testLinkedList03Chapter0022
     * @tc.desc      Test inserting double type of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0022';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = Math.floor(1.5)


      newLinkedList.insert(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_2300
     * @tc.name      testLinkedList03Chapter0023
     * @tc.desc      Test inserting Number.MAX_VALUE of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0023';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = 1.7976931348623157e+308

      newLinkedList.insert(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_2400
     * @tc.name      testLinkedList03Chapter0024
     * @tc.desc      Test inserting Number.MIN_VALUE of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0024';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = 5e-324

      newLinkedList.insert(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_2500
     * @tc.name      testLinkedList03Chapter0025
     * @tc.desc      Test inserting Number.EPSILON of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0025';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = 2.220446049250313e-16

      newLinkedList.insert(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_2600
     * @tc.name      testLinkedList03Chapter0026
     * @tc.desc      Test inserting Number.EPSILON of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0026';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = 2^53 - 1

      newLinkedList.insert(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_2700
     * @tc.name      testLinkedList03Chapter0027
     * @tc.desc      Test inserting byte of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0027';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text = -64
      newLinkedList.insert(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)

      text = -128
      newLinkedList.insert(1,text)
      expect(newLinkedList.get(1)).assertEqual(text)

      text = 127
      newLinkedList.insert(2,text)
      expect(newLinkedList.get(2)).assertEqual(text)

      text = 128
      newLinkedList.insert(3,text)
      expect(newLinkedList.get(3)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_2800
     * @tc.name      testLinkedList03Chapter0028
     * @tc.desc      Test inserting out-of-bounds byte of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0028';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 128
      newLinkedList.insert(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_2900
     * @tc.name      testLinkedList03Chapter0029
     * @tc.desc      Test inserting short of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0029';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text = 10000
      newLinkedList.insert(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)

      text = -32768
      newLinkedList.insert(1,text)
      expect(newLinkedList.get(1)).assertEqual(text)

      text = 32767
      newLinkedList.insert(2,text)
      expect(newLinkedList.get(2)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_3000
     * @tc.name      testLinkedList03Chapter0030
     * @tc.desc      Test inserting out-of-bounds short of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0030';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 32768
      newLinkedList.insert(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_3100
     * @tc.name      testLinkedList03Chapter0031
     * @tc.desc      Test inserting int of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0031';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text = 1000000
      newLinkedList.insert(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)

      text = -2147483648
      newLinkedList.insert(1,text)
      expect(newLinkedList.get(1)).assertEqual(text)

      text = 2147483647
      newLinkedList.insert(2,text)
      expect(newLinkedList.get(2)).assertEqual(text)

    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_3200
     * @tc.name      testLinkedList03Chapter0032
     * @tc.desc      Test inserting out-of-bounds int of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0032';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 2147483648
      newLinkedList.insert(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_3300
     * @tc.name      testLinkedList03Chapter0033
     * @tc.desc      Test inserting long of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0033';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text = 1234567890123456
      newLinkedList.insert(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)

      text = -9223372036854775808
      newLinkedList.insert(1,text)
      expect(newLinkedList.get(1)).assertEqual(text)

      text = 9223372036854775807
      newLinkedList.insert(2,text)
      expect(newLinkedList.get(2)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_3400
     * @tc.name      testLinkedList03Chapter0034
     * @tc.desc      Test inserting out-of-bounds long of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0034';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 9223372036854775808
      newLinkedList.insert(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_3500
     * @tc.name      testLinkedList03Chapter0035
     * @tc.desc      Test inserting float of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0035';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text = 3.14159
      newLinkedList.insert(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)

      text = 1.40129846432481707e-45
      newLinkedList.insert(1,text)
      expect(newLinkedList.get(1)).assertEqual(text)

      text = 3.4028234663852860e+38
      newLinkedList.insert(2,text)
      expect(newLinkedList.get(2)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_3600
     * @tc.name      testLinkedList03Chapter0036
     * @tc.desc      Test inserting float precision loss scenario of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0036';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const float1 = 0.1;
      const float2 = 0.2;
      newLinkedList.insert(0,float1);
      newLinkedList.insert(1,float2);
      const sum = Number(newLinkedList.get(0)) + Number(newLinkedList.get(1));
      expect(Math.abs(sum - 0.3) < 1e-10).assertTrue();
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_3700
     * @tc.name      testLinkedList03Chapter0037
     * @tc.desc      Test inserting double of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0037';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text = 12345.67890123456789
      newLinkedList.insert(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)

      text = 4.94065645841246544e-324
      newLinkedList.insert(1,text)
      expect(newLinkedList.get(1)).assertEqual(text)

      text = 1.79769313486231570e+308
      newLinkedList.insert(2,text)
      expect(newLinkedList.get(2)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_3800
     * @tc.name      testLinkedList03Chapter0038
     * @tc.desc      Test inserting out-of-bounds double of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0038';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 1.8e+308
      newLinkedList.insert(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_3900
     * @tc.name      testLinkedList03Chapter0039
     * @tc.desc      Test inserting char of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0039';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text = 0
      newLinkedList.insert(0,text)
      expect(newLinkedList.has(text)).assertTrue()

      text = -65535
      newLinkedList.insert(1,text)
      expect(newLinkedList.get(1)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_4000
     * @tc.name      testLinkedList03Chapter0040
     * @tc.desc      Test inserting char of number type stored as character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0040';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = "a"
      newLinkedList.insert(0,text.charCodeAt(0))

      expect(newLinkedList.get(0)).assertEqual(text.charCodeAt(0))
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_4100
     * @tc.name      testLinkedList03Chapter0041
     * @tc.desc      Test inserting out-of-bounds char value of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0041';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 65536
      newLinkedList.insert(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_4200
     * @tc.name      testLinkedList03Chapter0042
     * @tc.desc      Test inserting bigint value of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0042';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = BigInt(0xdecafafecacefade)
      newLinkedList.insert(0,Number(text))
      expect(newLinkedList.get(0)).assertEqual(Number(text))
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_4300
     * @tc.name      testLinkedList03Chapter0043
     * @tc.desc      Test inserting double value of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0043';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 123.456
      newLinkedList.insert(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_4400
     * @tc.name      testLinkedList03Chapter0044
     * @tc.desc      Test inserting float of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0044';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 0xcafebabe
      newLinkedList.insert(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_4500
     * @tc.name      testLinkedList03Chapter0045
     * @tc.desc      Test inserting hexadecimal (16-bit) of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0045';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 0x0102
      newLinkedList.insert(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_4600
     * @tc.name      testLinkedList03Chapter0046
     * @tc.desc      Test inserting hexadecimal (32-bit) of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0046';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 0x01020304
      newLinkedList.insert(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_4700
     * @tc.name      testLinkedList03Chapter0047
     * @tc.desc      Test inserting octal of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0047';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 0x3
      newLinkedList.insert(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_4800
     * @tc.name      testLinkedList03Chapter0048
     * @tc.desc      Test inserting exponent operator of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0048';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 2 ** 3
      newLinkedList.insert(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_4900
     * @tc.name      testLinkedList03Chapter0049
     * @tc.desc      Test inserting scientific notation of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0049';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text = 1e3
      newLinkedList.insert(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)

      text = 2.5e-2
      newLinkedList.insert(1,text)
      expect(newLinkedList.get(1)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_5000
     * @tc.name      testLinkedList03Chapter0050
     * @tc.desc      Test inserting large integer of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0050';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = BigInt(9007199254740991n)
      newLinkedList.insert(0,Number(text))
      expect(newLinkedList.get(0)).assertEqual(Number(text))
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_5100
     * @tc.name      testLinkedList03Chapter0051
     * @tc.desc      Test inserting true of boolean type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0051';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<boolean>()

      const text = true
      newLinkedList.insert(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_5200
     * @tc.name      testLinkedList03Chapter0052
     * @tc.desc      Test inserting false of boolean type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0052';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<boolean>()

      const text = false
      newLinkedList.insert(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_5300
     * @tc.name      testLinkedList03Chapter0053
     * @tc.desc      Test inserting values that are usually treated as false of boolean type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0053';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<boolean>()

      const text01 = 0
      newLinkedList.insert(0,Boolean(text01))
      expect(newLinkedList.get(0)).assertFalse()
      const text02 = NaN
      newLinkedList.insert(1,Boolean(text02))
      expect(newLinkedList.get(1)).assertFalse()
      const text03 = ""
      newLinkedList.insert(2,Boolean(text03))
      expect(newLinkedList.get(2)).assertFalse()
      const text04 = null
      newLinkedList.insert(3,text04)
      expect(newLinkedList.get(3)).assertNull()
      const text05 = undefined
      newLinkedList.insert(4,text05)
      expect(newLinkedList.get(4)).assertUndefined()

    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_5400
     * @tc.name      testLinkedList03Chapter0054
     * @tc.desc      Test inserting ! + other data types of boolean type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0054';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<boolean>()

      const text01 = !'s'
      newLinkedList.insert(0,text01)
      expect(newLinkedList.get(0)).assertEqual(text01)

      const text02 = !0
      newLinkedList.insert(0,text02)
      expect(newLinkedList.get(0)).assertEqual(text02)

    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_5500
     * @tc.name      testLinkedList03Chapter0055
     * @tc.desc      Test inserting ordinary object of object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0055';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: number;
        b: string;
        c: number[];
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a:1, b:"test", c:[1,2,3]}

      newLinkedList.insert(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_5600
     * @tc.name      testLinkedList03Chapter0056
     * @tc.desc      Test inserting nested object of object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0056';
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

      newLinkedList.insert(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_5700
     * @tc.name      testLinkedList03Chapter0057
     * @tc.desc      Test inserting object with function property of object type: no parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0057';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: number;
        b: Function;
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a:1, b:()=>{return true}}

      newLinkedList.insert(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_5800
     * @tc.name      testLinkedList03Chapter0058
     * @tc.desc      Test inserting object with function property of object type: with parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0058';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: number;
        b: Function;
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a:1, b:(n:number)=>{return n*100}}

      newLinkedList.insert(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_5900
     * @tc.name      testLinkedList03Chapter0059
     * @tc.desc      Test inserting object with ArrayBuffer property of object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0059';
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

      newLinkedList.insert(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_6000
     * @tc.name      testLinkedList03Chapter0060
     * @tc.desc      Test inserting object with DataView property of object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0060';
      console.log(TAG + ' start');

      interface textObject_1 {
        view: DataView
      }
      const newLinkedList = new LinkedList<textObject_1>()
      const arrayBuffer = new ArrayBuffer(16)
      let text: textObject_1 = {view: new DataView(arrayBuffer)}

      newLinkedList.insert(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    })
    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_6100
     * @tc.name      testLinkedList03Chapter0061
     * @tc.desc      Test inserting empty objects of the object class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0061';
      console.log(TAG + ' start');

      interface textObject_1 {}
      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {}

      newLinkedList.insert(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
      newLinkedList.insert(1,text)
      expect(newLinkedList.get(1)).assertEqual(text)
      newLinkedList.insert(2,text)
      expect(newLinkedList.get(2)).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_6200
     * @tc.name      testLinkedList03Chapter0062
     * @tc.desc      Test inserting extremely large objects of the object class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0062';
      console.log(TAG + ' start');

      const hugeObj: Record<string, number> = {};

      const newLinkedList = new LinkedList<Record<string, number>>()
      for (let i = 0; i < 10000; i++) {
        hugeObj[i.toString()] = i;
      }

      const start = Date.now()
      newLinkedList.insert(0,hugeObj)
      expect(newLinkedList.get(0)).assertEqual(hugeObj)
      const cost = Date.now()   - start

      expect(newLinkedList.length).assertEqual(1)

      const newText = newLinkedList.getLast()
      expect(newText['5000']).assertEqual(5000)

      expect(cost < 10).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_6300
     * @tc.name      testLinkedList03Chapter0063
     * @tc.desc      Test inserting objects of the object class containing null properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0063';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: null,
        b: number
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a: null, b: 1}

      newLinkedList.insert(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_6400
     * @tc.name      testLinkedList03Chapter0064
     * @tc.desc      Test inserting objects of the object class containing NaN properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0064';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: number,
        b: number
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a: NaN, b: 1}

      newLinkedList.insert(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_6500
     * @tc.name      testLinkedList03Chapter0065
     * @tc.desc      Test inserting objects of the object class containing Infinity properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0065';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: number,
        b: number
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a: Infinity, b: 1}

      newLinkedList.insert(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_6600
     * @tc.name      testLinkedList03Chapter0066
     * @tc.desc      Test inserting objects of the object class containing TypedArray properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0066';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: number,
        b: Uint8Array
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a: Infinity, b: new Uint8Array([172, 101, 108, 108, 111])}

      newLinkedList.insert(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_6700
     * @tc.name      testLinkedList03Chapter0067
     * @tc.desc      Test inserting objects of the object class containing Map properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0067';
      console.log(TAG + ' start');


      interface textObject_1 {
        map: Map<string, string>,
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {map: new Map([['key1', 'value1'], ['key2', 'value2']])}

      newLinkedList.insert(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_6800
     * @tc.name      testLinkedList03Chapter0068
     * @tc.desc      Test inserting objects of the object class containing Set properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0068';
      console.log(TAG + ' start');


      interface textObject_1 {
        set: Set<number>,
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {set: new Set([1,2,3,2,1])}

      newLinkedList.insert(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_6900
     * @tc.name      testLinkedList03Chapter0069
     * @tc.desc      Test inserting objects of the object class containing Promise properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const TAG = 'testLinkedList03Chapter0069';
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

      newLinkedList.insert(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)

      const promiseResult = await testPromise;
      expect(isResolved).assertTrue()
      expect(promiseResult).assertEqual('done')
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_7000
     * @tc.name      testLinkedList03Chapter0070
     * @tc.desc      Test inserting objects of the object class containing regular expression properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0070';
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

      newLinkedList.insert(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_7100
     * @tc.name      testLinkedList03Chapter0071
     * @tc.desc      Test inserting normal unit8Array arrays of the array class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0071';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const text = new Uint8Array([72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63])

      newLinkedList.insert(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_7200
     * @tc.name      testLinkedList03Chapter0072
     * @tc.desc      Test inserting arrays of the array class containing multiple 0s
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0072';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const text = new Uint8Array([72, 101, 108, 108, 111, 87, 111, 114, 108,0,0,0,0,0, 100, 49, 50, 51, 63])

      newLinkedList.insert(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
      expect(newLinkedList.get(0).length).assertEqual(19)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_7300
     * @tc.name      testLinkedList03Chapter0073
     * @tc.desc      Test inserting Array (with negative numbers) converted to Uint8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0073';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const text = new Uint8Array([72, 101, 108, 108, 111, -87, -111, -114, 108, 100, -49, 50, 51, 63])

      newLinkedList.insert(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_7400
     * @tc.name      testLinkedList03Chapter0074
     * @tc.desc      Test inserting Array (with negative numbers) converted to Uint8Array/Uint16Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0074';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const newLinkedList1 = new LinkedList<Uint16Array>()
      const text = new Uint8Array([72, 101, 108, 108, 111, -87, -111, -114, 108, 100, -49, 50, 51, 63])
      const text1 = new Uint16Array([72, 101, 108, 108, 111, -87, -111, -114, 108, 100, -49, 50, 51, 63])

      newLinkedList.insert(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
      newLinkedList1.insert(0,text1)
      expect(newLinkedList1.get(0)).assertEqual(text1)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_7500
     * @tc.name      testLinkedList03Chapter0075
     * @tc.desc      Test inserting special arrays of the array class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0075';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Array<number | string>>()
      const text:Array<number | string> = []
      text["abc"] = 111
      text["aaa"] = 222
      newLinkedList.insert(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_7600
     * @tc.name      testLinkedList03Chapter0076
     * @tc.desc      Test inserting arrays of the array class containing NaN/Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0076';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const text = new Uint8Array([72, 101, 108, NaN, Infinity, 108, 111])
      newLinkedList.insert(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_7700
     * @tc.name      testLinkedList03Chapter0077
     * @tc.desc      Test inserting arrays of the array class containing non-numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0077';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Array<number | string | boolean | null | undefined>>()
      const text:Array<number | string | boolean | null | undefined> = [72, "abc", true, null, undefined, 108]
      newLinkedList.insert(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT03_7800
     * @tc.name      testLinkedList03Chapter0078
     * @tc.desc      Test inserting arrays of the array class containing non-numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList03Chapter0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList03Chapter0078';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Array<number | string | boolean | null | undefined>>()
      const text:Array<number | string | boolean | null | undefined> = [72, "abc", true, null, undefined, 108]
      newLinkedList.insert(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    })
  })
}