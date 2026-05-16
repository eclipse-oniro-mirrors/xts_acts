import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, TestType, Size, Level, expect } from '@ohos/hypium';
import { util, LinkedList } from '@kit.ArkTS';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function LinkedListTest05() {
  describe('LinkedListTest05', () => {
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
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_0100
     * @tc.name      testLinkedList05Chapter0001
     * @tc.desc      Test adding and checking if the LinkedList contains Array class arrays with negative numbers converted to (Uint8Array/Uint16Array)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0001';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const newLinkedList1 = new LinkedList<Uint16Array>()
      const text = new Uint8Array([72, 101, 108, 108, 111, -87, -111, -114, 108, 100, -49, 50, 51, 63])
      const text1 = new Uint16Array([72, 101, 108, 108, 111, -87, -111, -114, 108, 100, -49, 50, 51, 63])

      newLinkedList.add(text)
      newLinkedList1.add(text1)

      expect(newLinkedList.has(text)).assertTrue()
      expect(newLinkedList1.has(text1)).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_0200
     * @tc.name      testLinkedList05Chapter0002
     * @tc.desc      Test adding and checking if the LinkedList contains special arrays of the Array class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0002';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Array<number | string>>()
      const text:Array<number | string> = []
      text["abc"] = 111
      text["aaa"] = 222
      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_0300
     * @tc.name      testLinkedList05Chapter0003
     * @tc.desc      Test adding and checking if the LinkedList contains Array class arrays with NaN/Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0003';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const text = new Uint8Array([72, 101, 108, NaN, Infinity, 108, 111])
      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_0400
     * @tc.name      testLinkedList05Chapter0004
     * @tc.desc      Test adding and checking if the LinkedList contains Array class arrays with non-numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0004';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Array<number | string | boolean | null | undefined>>()
      const text:Array<number | string | boolean | null | undefined> = [72, "abc", true, null, undefined, 108]
      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_0500
     * @tc.name      testLinkedList05Chapter0005
     * @tc.desc      Test adding and checking if the LinkedList contains Array class arrays with non-numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0005';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Array<number | string | boolean | null | undefined>>()
      const text:Array<number | string | boolean | null | undefined> = [72, "abc", true, null, undefined, 108]
      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_0600
     * @tc.name      testLinkedList05Chapter0006
     * @tc.desc      Test adding and checking if the LinkedList contains empty arrays of the Array class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0006';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Array<string>>()
      const text:Array<string> = []
      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_0700
     * @tc.name      testLinkedList05Chapter0007
     * @tc.desc      Test adding and checking if the LinkedList contains Array class arrays with extreme numeric overflow
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0007';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const text = new Uint8Array([256, 65536, 32768])
      newLinkedList.add(text)
      expect(newLinkedList.has(text)).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_0800
     * @tc.name      testLinkedList05Chapter0008
     * @tc.desc      Test adding and checking if the LinkedList contains Int8Array | Uint8Array | Uint8ClampedArray of the Array class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0008';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Int8Array | Uint8Array | Uint8ClampedArray>()
      const text1 = new Int8Array([127, -128, 128, -129])
      const text2 = new Uint8Array([255, 0, 256, -1])
      const text3 = new Uint8ClampedArray([255, 0, 256, -1])

      newLinkedList.add(text1)
      newLinkedList.add(text2)
      newLinkedList.add(text3)

      expect(newLinkedList.has(text1)).assertTrue()
      expect(newLinkedList.has(text2)).assertTrue()
      expect(newLinkedList.has(text3)).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_0900
     * @tc.name      testLinkedList05Chapter0009
     * @tc.desc      Test adding and checking if the LinkedList contains Int16Array | Uint16Array | Int32Array | Uint32Array of the Array class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0009';
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

      expect(newLinkedList.has(text1)).assertTrue()
      expect(newLinkedList.has(text2)).assertTrue()
      expect(newLinkedList.has(text3)).assertTrue()
      expect(newLinkedList.has(text4)).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_1000
     * @tc.name      testLinkedList05Chapter0010
     * @tc.desc      Test adding and checking if the LinkedList contains Float32Array | Float64Array | BigInt64Array | BigUint64Array of the Array class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0010';
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

      expect(newLinkedList.has(text1)).assertTrue()
      expect(newLinkedList.has(text2)).assertTrue()
      expect(newLinkedList.has(text3)).assertTrue()
      expect(newLinkedList.has(text4)).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_1100
     * @tc.name      testLinkedList05Chapter0011
     * @tc.desc      Test adding and checking if the LinkedList contains TypedArray special value storage rules of the Array class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0011';
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

      expect(newLinkedList.has(text1)).assertTrue()
      expect(newLinkedList.has(text2)).assertTrue()
      expect(newLinkedList.has(text3)).assertTrue()
      expect(newLinkedList.has(text4)).assertTrue()
      expect(newLinkedList.has(text5)).assertTrue()
      expect(newLinkedList.has(text6)).assertTrue()
      expect(newLinkedList.has(text7)).assertTrue()
      expect(newLinkedList.has(text8)).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_1200
     * @tc.name      testLinkedList05Chapter0012
     * @tc.desc      Test extracting undefined of the String class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0012';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = undefined
      newLinkedList.add(test)
      expect(newLinkedList.get(0)).assertEqual(test)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_1300
     * @tc.name      testLinkedList05Chapter0013
     * @tc.desc      Test extracting null of the String class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0013';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = null
      newLinkedList.add(test)
      expect(newLinkedList.get(0)).assertEqual(test)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_1400
     * @tc.name      testLinkedList05Chapter0014
     * @tc.desc      Test extracting empty string of the String class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0014';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = ""
      newLinkedList.add(test)
      expect(newLinkedList.get(0)).assertEqual(test)

    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_1500
     * @tc.name      testLinkedList05Chapter0015
     * @tc.desc      Test full coverage of extracting special characters of the String class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0015';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~"
      newLinkedList.add(test)
      expect(newLinkedList.get(0)).assertEqual(test)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_1600
     * @tc.name      testLinkedList05Chapter0016
     * @tc.desc      Test full coverage of extracting ASCII codes of the String class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0016';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~"
      newLinkedList.add(test)
      expect(newLinkedList.get(0)).assertEqual(test)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_1700
     * @tc.name      testLinkedList05Chapter0017
     * @tc.desc      Test full coverage of extracting special characters of the String class (twice)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0017';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = " !!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~"
      newLinkedList.add(test)
      expect(newLinkedList.get(0)).assertEqual(test)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_1800
     * @tc.name      testLinkedList05Chapter0018
     * @tc.desc      Test extracting special escape characters of the String class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0018';
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
      expect(newLinkedList.get(0)).assertEqual("\a")
      expect(newLinkedList.get(1)).assertEqual("\b")
      expect(newLinkedList.get(2)).assertEqual("\f")
      expect(newLinkedList.get(3)).assertEqual("\n")
      expect(newLinkedList.get(4)).assertEqual("\r")
      expect(newLinkedList.get(5)).assertEqual("\t")
      expect(newLinkedList.get(6)).assertEqual("\v")
      expect(newLinkedList.get(7)).assertEqual("\\")
      expect(newLinkedList.get(8)).assertEqual("\'")
      expect(newLinkedList.get(9)).assertEqual("\"")
      expect(newLinkedList.get(10)).assertEqual("\?")
      expect(newLinkedList.get(11)).assertEqual("\0")
      expect(newLinkedList.get(12)).assertEqual("\d")
      expect(newLinkedList.get(13)).assertEqual("\x31")

    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_1900
     * @tc.name      testLinkedList05Chapter0019
     * @tc.desc      Test extracting emojis and their Unicode encodings of the String class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0019';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()


      newLinkedList.add("👆")
      expect(newLinkedList.get(0)).assertEqual(`\ud83d\udc46`)

      newLinkedList.add("👿")
      expect(newLinkedList.get(1)).assertEqual(`\ud83d\udc7f`)

      newLinkedList.add("👀")
      expect(newLinkedList.get(2)).assertEqual(`\ud83d\udc40`)

      newLinkedList.add("💯")
      expect(newLinkedList.get(3)).assertEqual(`\ud83d\udcaf`)

      newLinkedList.add("🎅")
      expect(newLinkedList.get(4)).assertEqual(`\ud83c\udf85`)

      newLinkedList.add("😼")
      expect(newLinkedList.get(5)).assertEqual(`\ud83d\ude3c`)

      newLinkedList.add("🔧")
      expect(newLinkedList.get(6)).assertEqual(`\ud83d\udd27`)

      newLinkedList.add("💇")
      expect(newLinkedList.get(7)).assertEqual(`\ud83d\udc87`)

      newLinkedList.add("🤼‍♂️")
      expect(newLinkedList.get(8)).assertEqual(`\ud83e\udd3c\u200d\u2642\ufe0f`)

      newLinkedList.add("🛢")
      expect(newLinkedList.get(9)).assertEqual(`\ud83d\udee2`)

      newLinkedList.add("🀄")
      expect(newLinkedList.get(10)).assertEqual(`\ud83c\udc04`)

      newLinkedList.add("🏴")
      expect(newLinkedList.get(11)).assertEqual(`\ud83c\udff4`)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_2000
     * @tc.name      testLinkedList05Chapter0020
     * @tc.desc      Test extracting invalid unicode encodings of the String class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0020';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()


      newLinkedList.add(`\udc04`)
      expect(newLinkedList.get(0)).assertEqual(`\udc04`)

      newLinkedList.add(`\ud83d`)
      expect(newLinkedList.get(1)).assertEqual(`\ud83d`)

      newLinkedList.add(`\udff4`)
      expect(newLinkedList.get(2)).assertEqual(`\udff4`)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_2100
     * @tc.name      testLinkedList05Chapter0021
     * @tc.desc      Test extracting keywords of the String class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0021';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()

      newLinkedList.add(`"0" `)
      expect(newLinkedList.get(0)).assertEqual(`"0" `)

      newLinkedList.add(`"NaN"`)
      expect(newLinkedList.get(1)).assertEqual(`"NaN"`)

      newLinkedList.add(`“”`)
      expect(newLinkedList.get(2)).assertEqual(`“”`)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_2200
     * @tc.name      testLinkedList05Chapter0022
     * @tc.desc      Test extracting treeString type of the String class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0022';
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
      newLinkedList.add(text)
      expect(newLinkedList.get(0)).assertEqual(text)

      text = init(100)
      newLinkedList.add(text)
      expect(newLinkedList.get(1)).assertEqual(text)

      text = init(1000)
      newLinkedList.add(text)
      expect(newLinkedList.get(2)).assertEqual(text)

      text = init(10000)
      newLinkedList.add(text)
      expect(newLinkedList.get(3)).assertEqual(text)

      text = init(100000)
      newLinkedList.add(text)
      expect(newLinkedList.get(4)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_2300
     * @tc.name      testLinkedList05Chapter0023
     * @tc.desc      Test extracting sliceString type of the String class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0023';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()

      let str = "{k1:value1,k2:value2}"

      for (let i = 0; i < 10; i++){
        let result = str.substring(0,str.length-2);
        str = result
        newLinkedList.add(str)
        expect(newLinkedList.get(i)).assertEqual(str)
      }
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_2400
     * @tc.name      testLinkedList05Chapter0024
     * @tc.desc      Test String class GC behavior: normal usability after adding and releasing an ultra-long string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0024';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const largeStr = 'a'.repeat(10 * 10 * 10);

      newLinkedList.add(largeStr)
      expect(newLinkedList.get(0)).assertEqual(largeStr)

      let temp = newLinkedList
      temp.clear();

      const newLargeStr = "c".repeat(10 * 10 * 10)
      newLinkedList.add(newLargeStr)
      expect(newLinkedList.get(0)).assertEqual(newLargeStr)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_2500
     * @tc.name      testLinkedList05Chapter0025
     * @tc.desc      Test extracting 0 of the number class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0025';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = 0

      newLinkedList.add(text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_2600
     * @tc.name      testLinkedList05Chapter0026
     * @tc.desc      Test extracting undefined of the number class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0026';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = undefined

      newLinkedList.add(text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_2700
     * @tc.name      testLinkedList05Chapter0027
     * @tc.desc      Test extracting NaN of the number class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0027';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = NaN

      newLinkedList.add(text)
      expect(newLinkedList.get(0)).assertNaN()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_2800
     * @tc.name      testLinkedList05Chapter0028
     * @tc.desc      Test extracting -0 of the number class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0028';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = -0

      newLinkedList.add(text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_2900
     * @tc.name      testLinkedList05Chapter0029
     * @tc.desc      Test extracting positive infinity of the number class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0029';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = Infinity

      newLinkedList.add(text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_3000
     * @tc.name      testLinkedList05Chapter0030
     * @tc.desc      Test extracting negative infinity of the number class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0030';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = -Infinity

      newLinkedList.add(text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_3100
     * @tc.name      testLinkedList05Chapter0031
     * @tc.desc      Test extracting double type of the number class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0031';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = Math.floor(1.5)


      newLinkedList.add(text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_3200
     * @tc.name      testLinkedList05Chapter0032
     * @tc.desc      Test extracting Number.MAX_VALUE of the number class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0032';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = 1.7976931348623157e+308

      newLinkedList.add(text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_3300
     * @tc.name      testLinkedList05Chapter0033
     * @tc.desc      Test extracting Number.MIN_VALUE of the number class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0033';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = 5e-324

      newLinkedList.add(text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_3400
     * @tc.name      testLinkedList05Chapter0034
     * @tc.desc      Test extracting Number.EPSILON of the number class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0034';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = 2.220446049250313e-16

      newLinkedList.add(text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_3500
     * @tc.name      testLinkedList05Chapter0035
     * @tc.desc      Test extracting Number.EPSILON of the number class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0035';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = 2^53 - 1

      newLinkedList.add(text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_3600
     * @tc.name      testLinkedList05Chapter0036
     * @tc.desc      Test extracting byte of the number class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0036';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text = -64
      newLinkedList.add(text)
      expect(newLinkedList.get(0)).assertEqual(text)

      text = -128
      newLinkedList.add(text)
      expect(newLinkedList.get(1)).assertEqual(text)

      text = 127
      newLinkedList.add(text)
      expect(newLinkedList.get(2)).assertEqual(text)

      text = 128
      newLinkedList.add(text)
      expect(newLinkedList.get(3)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_3700
     * @tc.name      testLinkedList05Chapter0037
     * @tc.desc      Test extracting out-of-bounds byte of the number class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0037';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 128
      newLinkedList.add(text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_3800
     * @tc.name      testLinkedList05Chapter0038
     * @tc.desc      Test extracting short of the number class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0038';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text = 10000
      newLinkedList.add(text)
      expect(newLinkedList.get(0)).assertEqual(text)

      text = -32768
      newLinkedList.add(text)
      expect(newLinkedList.get(1)).assertEqual(text)

      text = 32767
      newLinkedList.add(text)
      expect(newLinkedList.get(2)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_3900
     * @tc.name      testLinkedList05Chapter0039
     * @tc.desc      Test extracting out-of-bounds short of the number class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0039';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 32768
      newLinkedList.add(text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_4000
     * @tc.name      testLinkedList05Chapter0040
     * @tc.desc      Test extracting int of the number class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0040';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text = 1000000
      newLinkedList.add(text)
      expect(newLinkedList.get(0)).assertEqual(text)

      text = -2147483648
      newLinkedList.add(text)
      expect(newLinkedList.get(1)).assertEqual(text)

      text = 2147483647
      newLinkedList.add(text)
      expect(newLinkedList.get(2)).assertEqual(text)

    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_4100
     * @tc.name      testLinkedList05Chapter0041
     * @tc.desc      Test extracting out-of-bounds int of the number class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0041';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 2147483648
      newLinkedList.add(text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_4200
     * @tc.name      testLinkedList05Chapter0042
     * @tc.desc      Test extracting long of the number class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0042';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text = 1234567890123456
      newLinkedList.add(text)
      expect(newLinkedList.get(0)).assertEqual(text)

      text = -9223372036854775808
      newLinkedList.add(text)
      expect(newLinkedList.get(1)).assertEqual(text)

      text = 9223372036854775807
      newLinkedList.add(text)
      expect(newLinkedList.get(2)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_4300
     * @tc.name      testLinkedList05Chapter0043
     * @tc.desc      Test extracting out-of-bounds long of the number class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0043';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 9223372036854775808
      newLinkedList.add(text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_4400
     * @tc.name      testLinkedList05Chapter0044
     * @tc.desc      Test extracting float of the number class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0044';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text = 3.14159
      newLinkedList.add(text)
      expect(newLinkedList.get(0)).assertEqual(text)

      text = 1.40129846432481707e-45
      newLinkedList.add(text)
      expect(newLinkedList.get(1)).assertEqual(text)

      text = 3.4028234663852860e+38
      newLinkedList.add(text)
      expect(newLinkedList.get(2)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_4500
     * @tc.name      testLinkedList05Chapter0045
     * @tc.desc      Test extracting float precision loss scenarios of the number class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0045';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const float1 = 0.1;
      const float2 = 0.2;
      newLinkedList.add(float1);
      newLinkedList.add(float2);
      const sum = Number(newLinkedList.get(0)) + Number(newLinkedList.get(1));
      expect(Math.abs(sum - 0.3) < 1e-10).assertTrue();
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_4600
     * @tc.name      testLinkedList05Chapter0046
     * @tc.desc      Test extracting double of the number class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0046';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text = 12345.67890123456789
      newLinkedList.add(text)
      expect(newLinkedList.get(0)).assertEqual(text)

      text = 4.94065645841246544e-324
      newLinkedList.add(text)
      expect(newLinkedList.get(1)).assertEqual(text)

      text = 1.79769313486231570e+308
      newLinkedList.add(text)
      expect(newLinkedList.get(2)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_4700
     * @tc.name      testLinkedList05Chapter0047
     * @tc.desc      Test extracting out-of-bounds double of the number class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0047';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 1.8e+308
      newLinkedList.add(text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_4800
     * @tc.name      testLinkedList05Chapter0048
     * @tc.desc      Test extracting char of the number class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0048';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text = 0
      newLinkedList.add(text)
      expect(newLinkedList.get(0)).assertEqual(text)

      text = -65535
      newLinkedList.add(text)
      expect(newLinkedList.get(1)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_4900
     * @tc.name      testLinkedList05Chapter0049
     * @tc.desc      Test extracting char stored as characters of the number class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0049';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = "a"
      newLinkedList.add(text.charCodeAt(0))
      expect(newLinkedList.get(0)).assertEqual(text.charCodeAt(0))
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_5000
     * @tc.name      testLinkedList05Chapter0050
     * @tc.desc      Test extracting out-of-bounds char values of the number class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0050';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 65536
      newLinkedList.add(text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_5100
     * @tc.name      testLinkedList05Chapter0051
     * @tc.desc      Test extracting bigint values of the number class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0051';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = BigInt(0xdecafafecacefade)
      newLinkedList.add(Number(text))
      expect(newLinkedList.get(0)).assertEqual(Number(text))
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_5200
     * @tc.name      testLinkedList05Chapter0052
     * @tc.desc      Test extracting double values of the number class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0052';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 123.456
      newLinkedList.add(text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_5300
     * @tc.name      testLinkedList05Chapter0053
     * @tc.desc      Test extracting float of the number class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0053';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 0xcafebabe
      newLinkedList.add(text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_5400
     * @tc.name      testLinkedList05Chapter0054
     * @tc.desc      Test extracting hexadecimal (16-bit) of the number class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0054';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 0x0102
      newLinkedList.add(text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_5500
     * @tc.name      testLinkedList05Chapter0055
     * @tc.desc      Test extracting hexadecimal (32-bit) of the number class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0055';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 0x01020304
      newLinkedList.add(text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_5600
     * @tc.name      testLinkedList05Chapter0056
     * @tc.desc      Test extracting octal (8-bit) of the number class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0056';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 0x3
      newLinkedList.add(text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_5700
     * @tc.name      testLinkedList05Chapter0057
     * @tc.desc      Test extracting exponent operator of the number class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0057';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 2 ** 3
      newLinkedList.add(text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_5800
     * @tc.name      testLinkedList05Chapter0058
     * @tc.desc      Test extracting scientific notation of the number class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0058';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text = 1e3
      newLinkedList.add(text)
      expect(newLinkedList.get(0)).assertEqual(text)

      text = 2.5e-2
      newLinkedList.add(text)
      expect(newLinkedList.get(1)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_5900
     * @tc.name      testLinkedList05Chapter0059
     * @tc.desc      Test extracting large integers of the number class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0059';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = BigInt(9007199254740991n)
      newLinkedList.add(Number(text))
      expect(newLinkedList.get(0)).assertEqual(Number(text))
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_6000
     * @tc.name      testLinkedList05Chapter0060
     * @tc.desc      Test extracting true of the boolean class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0060';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<boolean>()

      const text = true
      newLinkedList.add(text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_6100
     * @tc.name      testLinkedList05Chapter0061
     * @tc.desc      Test extracting false of the boolean class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0061';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<boolean>()

      const text = false
      newLinkedList.add(text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_6200
     * @tc.name      testLinkedList05Chapter0062
     * @tc.desc      Test extracting values that are usually treated as false of the boolean class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0062';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<boolean>()

      const text01 = 0
      newLinkedList.add(Boolean(text01))
      expect(newLinkedList.get(0)).assertFalse()

      const text02 = NaN
      newLinkedList.add(Boolean(text02))
      expect(newLinkedList.get(1)).assertFalse()

      const text03 = ""
      newLinkedList.add(Boolean(text03))
      expect(newLinkedList.get(2)).assertFalse()

      const text04 = null
      newLinkedList.add(Boolean(text04))
      expect(newLinkedList.get(3)).assertFalse()

      const text05 = undefined
      newLinkedList.add(Boolean(text05))
      expect(newLinkedList.get(4)).assertFalse()

    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_6300
     * @tc.name      testLinkedList05Chapter0063
     * @tc.desc      Test extraction of boolean type with ! operator + other data types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0063';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<boolean>()

      const text01 = !'s'
      newLinkedList.add(text01)
      expect(newLinkedList.get(0)).assertEqual(text01)

      const text02 = !0
      newLinkedList.add(text02)
      expect(newLinkedList.get(1)).assertEqual(text02)

    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_6400
     * @tc.name      testLinkedList05Chapter0064
     * @tc.desc      Test extraction of ordinary objects of object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0064';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: number;
        b: string;
        c: number[];
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a:1, b:"test", c:[1,2,3]}

      newLinkedList.add(text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_6500
     * @tc.name      testLinkedList05Chapter0065
     * @tc.desc      Test extraction of nested objects of object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0065';
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
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_6600
     * @tc.name      testLinkedList05Chapter0066
     * @tc.desc      Test extraction of objects of object type containing function properties: no parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0066';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: number;
        b: Function;
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a:1, b:()=>{return true}}

      newLinkedList.add(text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_6700
     * @tc.name      testLinkedList05Chapter0067
     * @tc.desc      Test extraction of objects of object type containing function properties: with parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0067';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: number;
        b: Function;
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a:1, b:(n:number)=>{return n*100}}

      newLinkedList.add(text)
      expect(newLinkedList.get(0)).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_6800
     * @tc.name      testLinkedList05Chapter0068
     * @tc.desc      Test extraction of objects of object type containing ArrayBuffer
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0068';
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
      expect(newLinkedList.get(0)).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_6900
     * @tc.name      testLinkedList05Chapter0069
     * @tc.desc      Test extraction of objects of object type containing DataView
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0069';
      console.log(TAG + ' start');

      interface textObject_1 {
        view: DataView
      }
      const newLinkedList = new LinkedList<textObject_1>()
      const arrayBuffer = new ArrayBuffer(16)
      let text: textObject_1 = {view: new DataView(arrayBuffer)}

      newLinkedList.add(text)
      expect(newLinkedList.get(0)).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_7000
     * @tc.name      testLinkedList05Chapter0070
     * @tc.desc      Test extraction of empty objects of object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0070';
      console.log(TAG + ' start');

      interface textObject_1 {}
      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {}

      newLinkedList.add(text)
      expect(newLinkedList.get(0)).assertEqual(text)
      newLinkedList.add(text)
      expect(newLinkedList.get(1)).assertEqual(text)
      newLinkedList.add(text)
      expect(newLinkedList.get(2)).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_7100
     * @tc.name      testLinkedList05Chapter0071
     * @tc.desc      Test extraction of extremely large objects of object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0071';
      console.log(TAG + ' start');

      const hugeObj: Record<string, number> = {};

      const newLinkedList = new LinkedList<Record<string, number>>()
      for (let i = 0; i < 10000; i++) {
        hugeObj[i.toString()] = i;
      }

      const start = Date.now()
      newLinkedList.add(hugeObj)
      const cost = Date.now()   - start

      expect(newLinkedList.length).assertEqual(1)

      const newText = newLinkedList.get(0)
      expect(newText['5000']).assertEqual(5000)

      expect(cost < 10).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_7200
     * @tc.name      testLinkedList05Chapter0072
     * @tc.desc      Test extraction of objects of object type containing null property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0072';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: null,
        b: number
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a: null, b: 1}

      newLinkedList.add(text)
      expect(newLinkedList.get(0)).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_7300
     * @tc.name      testLinkedList05Chapter0073
     * @tc.desc      Test extraction of objects of object type containing NaN property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0073';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: number,
        b: number
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a: NaN, b: 1}

      newLinkedList.add(text)
      expect(newLinkedList.get(0)).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_7400
     * @tc.name      testLinkedList05Chapter0074
     * @tc.desc      Test extraction of objects of object type containing Infinity property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0074';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: number,
        b: number
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a: Infinity, b: 1}

      newLinkedList.add(text)
      expect(newLinkedList.get(0)).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_7500
     * @tc.name      testLinkedList05Chapter0075
     * @tc.desc      Test extraction of objects of object type containing TypedArray property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0075';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: number,
        b: Uint8Array
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a: Infinity, b: new Uint8Array([172, 101, 108, 108, 111])}

      newLinkedList.add(text)
      expect(newLinkedList.get(0)).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_7600
     * @tc.name      testLinkedList05Chapter0076
     * @tc.desc      Test extraction of objects of object type containing Map property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0076';
      console.log(TAG + ' start');

      interface textObject_1 {
        map: Map<string, string>,
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {map: new Map([['key1', 'value1'], ['key2', 'value2']])}

      newLinkedList.add(text)
      expect(newLinkedList.get(0)).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_7700
     * @tc.name      testLinkedList05Chapter0077
     * @tc.desc      Test extraction of objects of object type containing Set property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList05Chapter0077';
      console.log(TAG + ' start');

      interface textObject_1 {
        set: Set<number>,
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {set: new Set([1,2,3,2,1])}

      newLinkedList.add(text)
      expect(newLinkedList.get(0)).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT05_7800
     * @tc.name      testLinkedList05Chapter0078
     * @tc.desc      Test extraction of objects of object type containing Promise property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList05Chapter0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const TAG = 'testLinkedList05Chapter0078';
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
      expect(newLinkedList.get(0)).assertEqual(text)

      const promiseResult = await testPromise;
      expect(isResolved).assertTrue()
      expect(promiseResult).assertEqual('done')
    })
  })
}