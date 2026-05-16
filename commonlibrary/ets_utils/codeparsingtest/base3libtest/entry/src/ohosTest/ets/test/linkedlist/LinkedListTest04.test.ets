import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, TestType, Size, Level, expect } from '@ohos/hypium';
import { util, LinkedList } from '@kit.ArkTS';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function LinkedListTest04() {
  describe('LinkedListTest04', () => {
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
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_0100
     * @tc.name      testLinkedList04Chapter0001
     * @tc.desc      Test inserting empty arrays of the array class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0001';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Array<string>>()
      const text:Array<string> = []
      newLinkedList.insert(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_0200
     * @tc.name      testLinkedList04Chapter0002
     * @tc.desc      Test inserting extremely large numeric overflow values of the array class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0002';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const text = new Uint8Array([256, 65536, 32768])
      newLinkedList.insert(0,text)
      expect(newLinkedList.get(0)).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_0300
     * @tc.name      testLinkedList04Chapter0003
     * @tc.desc      Test inserting Int8Array | Uint8Array | Uint8ClampedArray of the array class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0003';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Int8Array | Uint8Array | Uint8ClampedArray>()
      const text1 = new Int8Array([127, -128, 128, -129])
      const text2 = new Uint8Array([255, 0, 256, -1])
      const text3 = new Uint8ClampedArray([255, 0, 256, -1])

      newLinkedList.insert(0,text1)
      expect(newLinkedList.get(0)).assertEqual(text1)
      newLinkedList.insert(1,text2)
      expect(newLinkedList.get(1)).assertEqual(text2)
      newLinkedList.insert(2,text3)
      expect(newLinkedList.get(2)).assertEqual(text3)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_0400
     * @tc.name      testLinkedList04Chapter0004
     * @tc.desc      Test inserting Int16Array | Uint16Array | Int32Array | Uint32Array of the array class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0004';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Int16Array | Uint16Array | Int32Array | Uint32Array>()
      const text1 = new Int16Array([32767, -32768, 32769, -32769])
      const text2 = new Uint16Array([65535, 0, 65536, -1])
      const text3 = new Int32Array([2147483647, -2147483648, 2147483648, -2147483649])
      const text4 = new Uint32Array([4294967295, 0, 4294967296, -1])

      newLinkedList.insert(0,text1)
      expect(newLinkedList.get(0)).assertEqual(text1)
      newLinkedList.insert(1,text2)
      expect(newLinkedList.get(1)).assertEqual(text2)
      newLinkedList.insert(2,text3)
      expect(newLinkedList.get(2)).assertEqual(text3)
      newLinkedList.insert(3,text4)
      expect(newLinkedList.get(3)).assertEqual(text4)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_0500
     * @tc.name      testLinkedList04Chapter0005
     * @tc.desc      Test inserting Float32Array | Float64Array | BigInt64Array | BigUint64Array of the array class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0005';
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

      newLinkedList.insert(0,text1)
      expect(newLinkedList.get(0)).assertEqual(text1)
      newLinkedList.insert(1,text2)
      expect(newLinkedList.get(1)).assertEqual(text2)
      newLinkedList.insert(2,text3)
      expect(newLinkedList.get(2)).assertEqual(text3)
      newLinkedList.insert(3,text4)
      expect(newLinkedList.get(3)).assertEqual(text4)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_0600
     * @tc.name      testLinkedList04Chapter0006
     * @tc.desc      Test the storage rules of special values in TypedArray of the array class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0006';
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

      newLinkedList.insert(0,text1)
      expect(newLinkedList.get(0)).assertEqual(text1)
      newLinkedList.insert(1,text2)
      expect(newLinkedList.get(1)).assertEqual(text2)
      newLinkedList.insert(2,text3)
      expect(newLinkedList.get(2)).assertEqual(text3)
      newLinkedList.insert(3,text4)
      expect(newLinkedList.get(3)).assertEqual(text4)
      newLinkedList.insert(4,text5)
      expect(newLinkedList.get(4)).assertEqual(text5)
      newLinkedList.insert(5,text6)
      expect(newLinkedList.get(5)).assertEqual(text6)
      newLinkedList.insert(6,text7)
      expect(newLinkedList.get(6)).assertEqual(text7)
      newLinkedList.insert(7,text8)
      expect(newLinkedList.get(7)).assertEqual(text8)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_0800
     * @tc.name      testLinkedList04Chapter0008
     * @tc.desc      Test adding and checking if the String class contains undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0008';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = undefined
      newLinkedList.add(test)
      expect(newLinkedList.has(test)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_0900
     * @tc.name      testLinkedList04Chapter0009
     * @tc.desc      Test adding and checking if the String class contains null
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0009';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = null
      newLinkedList.add(test)
      expect(newLinkedList.has(test)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_1000
     * @tc.name      testLinkedList04Chapter0010
     * @tc.desc      Test adding and checking if the String class contains empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0010';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = ""
      newLinkedList.add(test)
      expect(newLinkedList.has(test)).assertTrue()

    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_1100
     * @tc.name      testLinkedList04Chapter0011
     * @tc.desc      Test adding and checking full coverage of special characters in the String class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0011';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~"
      newLinkedList.add(test)
      expect(newLinkedList.has(test)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_1200
     * @tc.name      testLinkedList04Chapter0012
     * @tc.desc      Test adding and checking full coverage of ASCII codes in the String class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0012';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~"
      newLinkedList.add(test)
      expect(newLinkedList.has(test)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_1300
     * @tc.name      testLinkedList04Chapter0013
     * @tc.desc      Test adding and checking full coverage of special characters in the String class (twice)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0013';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = " !!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~"
      newLinkedList.add(test)
      expect(newLinkedList.has(test)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_1400
     * @tc.name      testLinkedList04Chapter0014
     * @tc.desc      Test adding and checking special escape characters in the String class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0014';
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

      expect(newLinkedList.has("\a")).assertTrue()
      expect(newLinkedList.has("\b")).assertTrue()
      expect(newLinkedList.has("\f")).assertTrue()
      expect(newLinkedList.has("\n")).assertTrue()
      expect(newLinkedList.has("\r")).assertTrue()
      expect(newLinkedList.has("\t")).assertTrue()
      expect(newLinkedList.has("\v")).assertTrue()
      expect(newLinkedList.has("\\")).assertTrue()
      expect(newLinkedList.has("\'")).assertTrue()
      expect(newLinkedList.has("\"")).assertTrue()
      expect(newLinkedList.has("\?")).assertTrue()
      expect(newLinkedList.has("\0")).assertTrue()
      expect(newLinkedList.has("\d")).assertTrue()
      expect(newLinkedList.has("\x31")).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_1500
     * @tc.name      testLinkedList04Chapter0015
     * @tc.desc      Test adding and checking emoji symbols and their Unicode encodings in the String class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0015';
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

      expect(newLinkedList.has("👆")).assertTrue()
      expect(newLinkedList.has("👿")).assertTrue()
      expect(newLinkedList.has("👀")).assertTrue()
      expect(newLinkedList.has("💯")).assertTrue()
      expect(newLinkedList.has("🎅")).assertTrue()
      expect(newLinkedList.has("😼")).assertTrue()
      expect(newLinkedList.has("🔧")).assertTrue()
      expect(newLinkedList.has("💇")).assertTrue()
      expect(newLinkedList.has("🤼‍♂️")).assertTrue()
      expect(newLinkedList.has("🛢")).assertTrue()
      expect(newLinkedList.has("🀄")).assertTrue()
      expect(newLinkedList.has("🏴")).assertTrue()
      expect(newLinkedList.has(`\ud83d\udc46`)).assertTrue()
      expect(newLinkedList.has(`\ud83d\udc7f`)).assertTrue()
      expect(newLinkedList.has(`\ud83d\udc40`)).assertTrue()
      expect(newLinkedList.has(`\ud83d\udcaf`)).assertTrue()
      expect(newLinkedList.has(`\ud83c\udf85`)).assertTrue()
      expect(newLinkedList.has(`\ud83d\ude3c`)).assertTrue()
      expect(newLinkedList.has(`\ud83d\udd27`)).assertTrue()
      expect(newLinkedList.has(`\ud83d\udc87`)).assertTrue()
      expect(newLinkedList.has(`\ud83e\udd3c\u200d\u2642\ufe0f`)).assertTrue()
      expect(newLinkedList.has(`\ud83d\udee2`)).assertTrue()
      expect(newLinkedList.has(`\ud83c\udc04`)).assertTrue()
      expect(newLinkedList.has(`\ud83c\udff4`)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_1600
     * @tc.name      testLinkedList04Chapter0016
     * @tc.desc      Test adding and checking invalid unicode encodings in the String class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0016';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()

      newLinkedList.add(`\udc04`)
      newLinkedList.add(`\ud83d`)
      newLinkedList.add(`\udff4`)

      expect(newLinkedList.has(`\udc04`)).assertTrue()
      expect(newLinkedList.has(`\ud83d`)).assertTrue()
      expect(newLinkedList.has(`\udff4`)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_1700
     * @tc.name      testLinkedList04Chapter0017
     * @tc.desc      Test adding and checking keywords in the String class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0017';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()

      newLinkedList.add('"0"')
      newLinkedList.add('"NaN"')
      newLinkedList.add('""')

      expect(newLinkedList.has(`"0"`)).assertTrue()
      expect(newLinkedList.has(`"NaN"`)).assertTrue()
      expect(newLinkedList.has(`""`)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_1800
     * @tc.name      testLinkedList04Chapter0018
     * @tc.desc      Test adding and checking treeString type in the String class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0018';
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

      expect(newLinkedList.has(init(10))).assertTrue()
      expect(newLinkedList.has(init(100))).assertTrue()
      expect(newLinkedList.has(init(1000))).assertTrue()
      expect(newLinkedList.has(init(10000))).assertTrue()
      expect(newLinkedList.has(init(100000))).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_1900
     * @tc.name      testLinkedList04Chapter0019
     * @tc.desc      Test adding and checking sliceString type in the String class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0019';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()

      let str = "{k1:value1,k2:value2}"

      for (let i = 0; i < 10; i++){
        let result = str.substring(0,str.length-2);
        str = result
        newLinkedList.add(str)
        expect(newLinkedList.has(str)).assertTrue()
      }
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_2000
     * @tc.name      testLinkedList04Chapter0020
     * @tc.desc      Test String class GC behavior: ultra-long strings work normally after addition and release
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0020';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const largeStr = 'a'.repeat(10 * 10 * 10);
      newLinkedList.add(largeStr)
      expect(newLinkedList.has(largeStr)).assertTrue()

      let temp = newLinkedList
      temp.clear();

      const newLargeStr = "c".repeat(10 * 10 * 10)
      newLinkedList.add(newLargeStr)
      expect(newLinkedList.has(newLargeStr)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_2100
     * @tc.name      testLinkedList04Chapter0021
     * @tc.desc      Test adding and checking if the number class contains 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0021';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = 0

      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_2200
     * @tc.name      testLinkedList04Chapter0022
     * @tc.desc      Test adding and checking if the number class contains undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0022';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = undefined

      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_2300
     * @tc.name      testLinkedList04Chapter0023
     * @tc.desc      Test adding and checking if the number class contains NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0023';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = NaN

      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_2400
     * @tc.name      testLinkedList04Chapter0024
     * @tc.desc      Test adding and checking if the number class contains -0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0024';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = -0

      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_2500
     * @tc.name      testLinkedList04Chapter0025
     * @tc.desc      Test adding and checking if the number class contains positive infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0025';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = Infinity

      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_2600
     * @tc.name      testLinkedList04Chapter0026
     * @tc.desc      Test adding and checking if the number class contains negative infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0026';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = -Infinity

      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_2700
     * @tc.name      testLinkedList04Chapter0027
     * @tc.desc      Test adding and checking if the number class contains double type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0027';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = Math.floor(1.5)


      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_2800
     * @tc.name      testLinkedList04Chapter0028
     * @tc.desc      Test adding and checking if the number class contains Number.MAX_VALUE
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0028';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = 1.7976931348623157e+308

      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_2900
     * @tc.name      testLinkedList04Chapter0029
     * @tc.desc      Test adding and checking if the number class contains Number.MIN_VALUE
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0029';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = 5e-324

      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_3000
     * @tc.name      testLinkedList04Chapter0030
     * @tc.desc      Test adding and checking if the number class contains Number.EPSILON
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0030';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = 2.220446049250313e-16

      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_3100
     * @tc.name      testLinkedList04Chapter0031
     * @tc.desc      Test adding and checking if the number class contains Number.EPSILON
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0031';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = 2^53 - 1

      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_3200
     * @tc.name      testLinkedList04Chapter0032
     * @tc.desc      Test adding and checking if the number class contains byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0032';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text = -64
      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()

      text = -128
      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()

      text = 127
      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()

      text = 128
      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_3300
     * @tc.name      testLinkedList04Chapter0033
     * @tc.desc      Test adding and checking byte overflow in the number class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0033';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 128
      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_3400
     * @tc.name      testLinkedList04Chapter0034
     * @tc.desc      Test adding and checking if the number class contains short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0034';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text = 10000
      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()

      text = -32768
      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()

      text = 32767
      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_3500
     * @tc.name      testLinkedList04Chapter0035
     * @tc.desc      Test adding and checking short overflow in the number class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0035';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 32768
      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_3600
     * @tc.name      testLinkedList04Chapter0036
     * @tc.desc      Test adding and checking if the number class contains int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0036';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text = 1000000
      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()

      text = -2147483648
      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()

      text = 2147483647
      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()

    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_3700
     * @tc.name      testLinkedList04Chapter0037
     * @tc.desc      Test adding and checking int overflow in the number class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0037';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 2147483648
      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_3800
     * @tc.name      testLinkedList04Chapter0038
     * @tc.desc      Test adding and checking if the number class contains long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0038';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text = 1234567890123456
      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()

      text = -9223372036854775808
      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()

      text = 9223372036854775807
      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_3900
     * @tc.name      testLinkedList04Chapter0039
     * @tc.desc      Test adding and checking long overflow in the number class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0039';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 9223372036854775808
      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_4000
     * @tc.name      testLinkedList04Chapter0040
     * @tc.desc      Test adding and checking if the number class contains float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0040';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text = 3.14159
      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()

      text = 1.40129846432481707e-45
      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()

      text = 3.4028234663852860e+38
      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_4100
     * @tc.name      testLinkedList04Chapter0041
     * @tc.desc      Test adding and checking float precision loss scenarios in the number class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0041';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const float1 = 0.1;
      const float2 = 0.2;
      newLinkedList.add(float1)
      newLinkedList.add(float2)
      newLinkedList.has(float1);
      newLinkedList.has(float2);
      const sum = Number(newLinkedList.get(0)) + Number(newLinkedList.get(1));
      expect(Math.abs(sum - 0.3) < 1e-10).assertTrue();
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_4200
     * @tc.name      testLinkedList04Chapter0042
     * @tc.desc      Test adding and checking if the number class contains double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0042';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text = 12345.67890123456789
      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()

      text = 4.94065645841246544e-324
      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()

      text = 1.79769313486231570e+308
      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_4300
     * @tc.name      testLinkedList04Chapter0043
     * @tc.desc      Test adding and checking double overflow in the number class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0043';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 1.8e+308
      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_4400
     * @tc.name      testLinkedList04Chapter0044
     * @tc.desc      Test adding and checking if the number class contains char
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0044';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text = 0
      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()

      text = -65535
      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_4500
     * @tc.name      testLinkedList04Chapter0045
     * @tc.desc      Test adding and checking char stored as characters in the number class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0045';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = "a"
      newLinkedList.add(text.charCodeAt(0))
      expect(newLinkedList.has(text.charCodeAt(0))).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_4600
     * @tc.name      testLinkedList04Chapter0046
     * @tc.desc      Test adding and checking char out-of-bounds values in the number class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0046';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 65536
      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_4700
     * @tc.name      testLinkedList04Chapter0047
     * @tc.desc      Test adding and checking bigint values in the number class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0047';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = BigInt(0xdecafafecacefade)
      newLinkedList.add(Number(text))
      expect(newLinkedList.has(Number(text))).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_4800
     * @tc.name      testLinkedList04Chapter0048
     * @tc.desc      Test adding and checking double values in the number class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0048';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 123.456
      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_4900
     * @tc.name      testLinkedList04Chapter0049
     * @tc.desc      Test adding and checking float in the number class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0049';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 0xcafebabe
      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_5000
     * @tc.name      testLinkedList04Chapter0050
     * @tc.desc      Test adding and checking hexadecimal (16-bit) values in the number class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0050';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 0x0102
      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_5100
     * @tc.name      testLinkedList04Chapter0051
     * @tc.desc      Test adding and checking hexadecimal (32-bit) values in the number class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0051';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 0x01020304
      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_5200
     * @tc.name      testLinkedList04Chapter0052
     * @tc.desc      Test adding and checking octal (8-bit) values in the number class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0052';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 0x3
      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_5300
     * @tc.name      testLinkedList04Chapter0053
     * @tc.desc      Test adding and checking exponent operators in the number class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0053';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 2 ** 3
      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_5400
     * @tc.name      testLinkedList04Chapter0054
     * @tc.desc      Test adding and checking scientific notation in the number class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0054';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text = 1e3
      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()

      text = 2.5e-2
      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_5500
     * @tc.name      testLinkedList04Chapter0055
     * @tc.desc      Test adding and checking large integers in the number class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0055';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = BigInt(9007199254740991n)
      newLinkedList.add(Number(text))
      expect(newLinkedList.has(Number(text))).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_5600
     * @tc.name      testLinkedList04Chapter0056
     * @tc.desc      Test adding and checking if the boolean class contains true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0056';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<boolean>()

      const text = true
      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_5700
     * @tc.name      testLinkedList04Chapter0057
     * @tc.desc      Test adding and checking if the boolean class contains false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0057';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<boolean>()

      const text = false
      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_5800
     * @tc.name      testLinkedList04Chapter0058
     * @tc.desc      Test adding and checking values that are usually treated as false in the boolean class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0058';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<boolean>()

      const text01 = 0
      newLinkedList.add(Boolean(text01))
      expect(newLinkedList.has(Boolean(text01))).assertTrue()

      const text02 = NaN
      newLinkedList.add(Boolean(text02))
      expect(newLinkedList.has(Boolean(text02))).assertTrue()

      const text03 = ""
      newLinkedList.add(Boolean(text03))
      expect(newLinkedList.has(Boolean(text03))).assertTrue()

      const text04 = null
      newLinkedList.add(Boolean(text04))
      expect(newLinkedList.has(Boolean(text04))).assertTrue()

      const text05 = undefined
      newLinkedList.add(Boolean(text05))
      expect(newLinkedList.has(Boolean(text05))).assertTrue()

    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_5900
     * @tc.name      testLinkedList04Chapter0059
     * @tc.desc      Test adding and checking ! + other data types in the boolean class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0059';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<boolean>()

      const text01 = !'s'
      newLinkedList.add(text01)
      expect(newLinkedList.has(text01)).assertTrue()

      const text02 = !0
      newLinkedList.add(text02)
      expect(newLinkedList.has(text02)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_6000
     * @tc.name      testLinkedList04Chapter0060
     * @tc.desc      Test adding and checking if the object class contains ordinary objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0060';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: number;
        b: string;
        c: number[];
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a:1, b:"test", c:[1,2,3]}

      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_6100
     * @tc.name      testLinkedList04Chapter0061
     * @tc.desc      Test adding and checking if the LinkedList contains nested objects of the Object class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0061';
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
      expect(newLinkedList.has(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_6200
     * @tc.name      testLinkedList04Chapter0062
     * @tc.desc      Test LinkedList: contains Object (with parameterless function properties) after addition
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0062';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: number;
        b: Function;
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a:1, b:()=>{return true}}

      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_6300
     * @tc.name      testLinkedList04Chapter0063
     * @tc.desc      Test LinkedList: contains Object (with parameterized function properties) after addition
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0063';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: number;
        b: Function;
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a:1, b:(n:number)=>{return n*100}}

      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_6400
     * @tc.name      testLinkedList04Chapter0064
     * @tc.desc      Test adding and checking if the LinkedList contains Object class objects that include ArrayBuffer
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0064';
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
      expect(newLinkedList.has(text)).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_6500
     * @tc.name      testLinkedList04Chapter0065
     * @tc.desc      Test adding and checking if the LinkedList contains Object class objects that include DataView
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0065';
      console.log(TAG + ' start');

      interface textObject_1 {
        view: DataView
      }
      const newLinkedList = new LinkedList<textObject_1>()
      const arrayBuffer = new ArrayBuffer(16)
      let text: textObject_1 = {view: new DataView(arrayBuffer)}

      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_6600
     * @tc.name      testLinkedList04Chapter0066
     * @tc.desc      Test adding and checking if the LinkedList contains empty objects of the Object class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0066';
      console.log(TAG + ' start');

      interface textObject_1 {}
      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {}

      newLinkedList.add(text)
      newLinkedList.add(text)
      newLinkedList.add(text)

      expect(newLinkedList.has(text)).assertTrue()
      expect(newLinkedList.has(text)).assertTrue()
      expect(newLinkedList.has(text)).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_6700
     * @tc.name      testLinkedList04Chapter0067
     * @tc.desc      Test adding and checking if the LinkedList contains extremely large objects of the Object class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0067';
      console.log(TAG + ' start');

      const hugeObj: Record<string, number> = {};

      const newLinkedList = new LinkedList<Record<string, number>>()
      for (let i = 0; i < 10000; i++) {
        hugeObj[i.toString()] = i;
      }

      const start = Date.now()
      newLinkedList.add(hugeObj)
      expect(newLinkedList.has(hugeObj)).assertTrue()
      const cost = Date.now()   - start

      expect(newLinkedList.length).assertEqual(1)

      const newText = newLinkedList.getLast()
      expect(newText['5000']).assertEqual(5000)

      expect(cost < 15).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_6800
     * @tc.name      testLinkedList04Chapter0068
     * @tc.desc      Test adding and checking if the LinkedList contains Object class objects with null properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0068';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: null,
        b: number
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a: null, b: 1}

      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_6900
     * @tc.name      testLinkedList04Chapter0069
     * @tc.desc      Test adding and checking if the LinkedList contains Object class objects with NaN properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0069';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: number,
        b: number
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a: NaN, b: 1}

      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_7000
     * @tc.name      testLinkedList04Chapter0070
     * @tc.desc      Test adding and checking if the LinkedList contains Object class objects with Infinity properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0070';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: number,
        b: number
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a: Infinity, b: 1}

      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_7100
     * @tc.name      testLinkedList04Chapter0071
     * @tc.desc      Test adding and checking if the LinkedList contains Object class objects with TypedArray properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0071';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: number,
        b: Uint8Array
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a: Infinity, b: new Uint8Array([172, 101, 108, 108, 111])}

      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_7200
     * @tc.name      testLinkedList04Chapter0072
     * @tc.desc      Test adding and checking if the LinkedList contains Object class objects with Map properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0072';
      console.log(TAG + ' start');


      interface textObject_1 {
        map: Map<string, string>,
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {map: new Map([['key1', 'value1'], ['key2', 'value2']])}

      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_7300
     * @tc.name      testLinkedList04Chapter0073
     * @tc.desc      Test adding and checking if the LinkedList contains Object class objects with Set properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0073';
      console.log(TAG + ' start');


      interface textObject_1 {
        set: Set<number>,
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {set: new Set([1,2,3,2,1])}

      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_7400
     * @tc.name      testLinkedList04Chapter0074
     * @tc.desc      Test adding and checking if the LinkedList contains Object class objects with Promise properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const TAG = 'testLinkedList04Chapter0074';
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
      expect(newLinkedList.has(text)).assertTrue()

      const promiseResult = await testPromise;
      expect(isResolved).assertTrue()
      expect(promiseResult).assertEqual('done')
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_7500
     * @tc.name      testLinkedList04Chapter0075
     * @tc.desc      Test LinkedList: contains Object (with regex properties) after addition
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0075';
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
      expect(newLinkedList.has(text)).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_7600
     * @tc.name      testLinkedList04Chapter0076
     * @tc.desc      Test adding and checking if the LinkedList contains normal Uint8Array arrays of the Array class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0076';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const text = new Uint8Array([72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63])

      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_7700
     * @tc.name      testLinkedList04Chapter0077
     * @tc.desc      Test adding and checking if the LinkedList contains Array class arrays with multiple zeros
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0077';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const text = new Uint8Array([72, 101, 108, 108, 111, 87, 111, 114, 108,0,0,0,0,0, 100, 49, 50, 51, 63])

      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()
      expect(newLinkedList.get(0).length).assertEqual(19)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT04_7800
     * @tc.name      testLinkedList04Chapter0078
     * @tc.desc      Test LinkedList: contains Uint8Array-converted Array (with negative numbers) after addition
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList04Chapter0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList04Chapter0078';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const text = new Uint8Array([72, 101, 108, 108, 111, -87, -111, -114, 108, 100, -49, 50, 51, 63])

      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()
    })
  })
}