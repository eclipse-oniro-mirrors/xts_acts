import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, TestType, Size, Level, expect } from '@ohos/hypium';
import { util, LinkedList } from '@kit.ArkTS';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function LinkedListTest02() {
  describe('LinkedListTest02', () => {
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
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_0100
     * @tc.name      testLinkedList02Chapter0001
     * @tc.desc      Test the storage rules for special values of array-type TypedArray when adding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0001';
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
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_0200
     * @tc.name      testLinkedList02Chapter0002
     * @tc.desc      Test adding undefined of String type from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0002';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = undefined
      newLinkedList.addFirst(test)
      expect(newLinkedList.has(test)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_0300
     * @tc.name      testLinkedList02Chapter0003
     * @tc.desc      Test adding null of String type from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0003';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = null
      newLinkedList.addFirst(test)
      expect(newLinkedList.has(test)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_0400
     * @tc.name      testLinkedList02Chapter0004
     * @tc.desc      Test adding empty string of String type from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0004';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = ""
      newLinkedList.addFirst(test)
      expect(newLinkedList.has(test)).assertTrue()

    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_0500
     * @tc.name      testLinkedList02Chapter0005
     * @tc.desc      Test adding full coverage of special characters of String type from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0005';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~"
      newLinkedList.addFirst(test)
      expect(newLinkedList.has(test)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_0600
     * @tc.name      testLinkedList02Chapter0006
     * @tc.desc      Test adding full coverage of ASCII codes of String type from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0006';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = "!\"#$%&'()*+,-./0223456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~"
      newLinkedList.addFirst(test)
      expect(newLinkedList.has(test)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_0700
     * @tc.name      testLinkedList02Chapter0007
     * @tc.desc      Test adding full coverage of special characters of String type (twice) from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0007';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = " !!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~"
      newLinkedList.addFirst(test)
      expect(newLinkedList.has(test)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_0800
     * @tc.name      testLinkedList02Chapter0008
     * @tc.desc      Test adding special escape characters of String type from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0008';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      newLinkedList.addFirst("\a")
      newLinkedList.addFirst("\b")
      newLinkedList.addFirst("\f")
      newLinkedList.addFirst("\n")
      newLinkedList.addFirst("\r")
      newLinkedList.addFirst("\t")
      newLinkedList.addFirst("\v")
      newLinkedList.addFirst("\\")
      newLinkedList.addFirst("\'")
      newLinkedList.addFirst("\"")
      newLinkedList.addFirst("\?")
      newLinkedList.addFirst("\0")
      newLinkedList.addFirst("\d")
      newLinkedList.addFirst("\x31")

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
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_0900
     * @tc.name      testLinkedList02Chapter0009
     * @tc.desc      Test adding emojis and their Unicode encodings of String type from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0009';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()

      newLinkedList.addFirst("👆")
      expect(newLinkedList.getFirst()).assertEqual(`\ud83d\udc46`)

      newLinkedList.addFirst("👿")
      expect(newLinkedList.getFirst()).assertEqual(`\ud83d\udc7f`)

      newLinkedList.addFirst("👀")
      expect(newLinkedList.getFirst()).assertEqual(`\ud83d\udc40`)

      newLinkedList.addFirst("💯")
      expect(newLinkedList.getFirst()).assertEqual(`\ud83d\udcaf`)

      newLinkedList.addFirst("🎅")
      expect(newLinkedList.getFirst()).assertEqual(`\ud83c\udf85`)

      newLinkedList.addFirst("😼")
      expect(newLinkedList.getFirst()).assertEqual(`\ud83d\ude3c`)

      newLinkedList.addFirst("🔧")
      expect(newLinkedList.getFirst()).assertEqual(`\ud83d\udd27`)

      newLinkedList.addFirst("💇")
      expect(newLinkedList.getFirst()).assertEqual(`\ud83d\udc87`)

      newLinkedList.addFirst("🤼‍♂️")
      expect(newLinkedList.getFirst()).assertEqual(`\ud83e\udd3c\u200d\u2642\ufe0f`)

      newLinkedList.addFirst("🛢")
      expect(newLinkedList.getFirst()).assertEqual(`\ud83d\udee2`)

      newLinkedList.addFirst("🀄")
      expect(newLinkedList.getFirst()).assertEqual(`\ud83c\udc04`)

      newLinkedList.addFirst("🏴")
      expect(newLinkedList.getFirst()).assertEqual(`\ud83c\udff4`)

    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_1000
     * @tc.name      testLinkedList02Chapter0010
     * @tc.desc      Test adding invalid unicode encodings of String type from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0010';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()

      newLinkedList.addFirst(`\udc04`)
      expect(newLinkedList.getFirst()).assertEqual(`\udc04`)

      newLinkedList.addFirst(`\ud83d`)
      expect(newLinkedList.getFirst()).assertEqual(`\ud83d`)

      newLinkedList.addFirst(`\udff4`)
      expect(newLinkedList.getFirst()).assertEqual(`\udff4`)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_1100
     * @tc.name      testLinkedList02Chapter0011
     * @tc.desc      Test adding keywords of String type from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0011';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()

      newLinkedList.addFirst(`"0" `)
      expect(newLinkedList.getFirst()).assertEqual(`"0" `)

      newLinkedList.addFirst(`"NaN"`)
      expect(newLinkedList.getFirst()).assertEqual(`"NaN"`)

      newLinkedList.addFirst(`“”`)
      expect(newLinkedList.getFirst()).assertEqual(`“”`)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_1200
     * @tc.name      testLinkedList02Chapter0012
     * @tc.desc      Test adding treeString type of String type from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0012';
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
      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)

      text = init(100)
      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)

      text = init(1000)
      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)

      text = init(10000)
      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)

      text = init(100000)
      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_1300
     * @tc.name      testLinkedList02Chapter0013
     * @tc.desc      Test adding sliceString type of String type from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0013';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()

      let str = "{k1:value1,k2:value2}"

      for (let i = 0; i < 10; i++){
        let result = str.substring(0,str.length-2);
        str = result
        newLinkedList.addFirst(str)
        expect(newLinkedList.getFirst()).assertEqual(str)
      }
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_1400
     * @tc.name      testLinkedList02Chapter0014
     * @tc.desc      Test String GC for head addition: works after adding & releasing extra-long strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0014';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const largeStr = 'a'.repeat(10 * 10 * 10);

      newLinkedList.addFirst(largeStr)
      expect(newLinkedList.getFirst()).assertEqual(largeStr)

      let temp = newLinkedList
      temp.clear();

      const newLargeStr = "c".repeat(10 * 10 * 10)
      newLinkedList.addFirst(newLargeStr)
      expect(newLinkedList.getFirst()).assertEqual(newLargeStr)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_1500
     * @tc.name      testLinkedList02Chapter0015
     * @tc.desc      Test adding 0 of number type from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0015';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = 0

      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_1600
     * @tc.name      testLinkedList02Chapter0016
     * @tc.desc      Test adding undefined of number type from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0016';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = undefined

      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_1700
     * @tc.name      testLinkedList02Chapter0017
     * @tc.desc      Test adding NaN of number type from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0017';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = NaN

      newLinkedList.addFirst(text)
      expect(Number.isNaN(newLinkedList.getFirst())).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_1800
     * @tc.name      testLinkedList02Chapter0018
     * @tc.desc      Test adding -0 of number type from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0018';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = -0

      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_1900
     * @tc.name      testLinkedList02Chapter0019
     * @tc.desc      Test adding positive infinity of number type from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0019';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = Infinity

      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_2000
     * @tc.name      testLinkedList02Chapter0020
     * @tc.desc      Test adding negative infinity of number type from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0020';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = -Infinity

      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_2100
     * @tc.name      testLinkedList02Chapter0021
     * @tc.desc      Test adding double type of number type from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0021';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = Math.floor(1.5)


      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_2200
     * @tc.name      testLinkedList02Chapter0022
     * @tc.desc      Test adding Number.MAX_VALUE of number type from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0022';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = 1.7976931348623157e+308

      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_2300
     * @tc.name      testLinkedList02Chapter0023
     * @tc.desc      Test adding Number.MIN_VALUE of number type from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0023';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = 5e-324

      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_2400
     * @tc.name      testLinkedList02Chapter0024
     * @tc.desc      Test adding Number.EPSILON of number type from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0024';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = 2.220446049250313e-16

      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_2500
     * @tc.name      testLinkedList02Chapter0025
     * @tc.desc      Test adding Number.EPSILON of number type from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0025';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = 2^53 - 1

      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_2600
     * @tc.name      testLinkedList02Chapter0026
     * @tc.desc      Test adding byte of number type from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0026';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text = -64
      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)

      text = -128
      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)

      text = 127
      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)

      text = 128
      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_2700
     * @tc.name      testLinkedList02Chapter0027
     * @tc.desc      Test adding out-of-bounds byte of number type from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0027';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 128
      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_2800
     * @tc.name      testLinkedList02Chapter0028
     * @tc.desc      Test adding short of number type from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0028';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text = 10000
      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)

      text = -32768
      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)

      text = 32767
      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_2900
     * @tc.name      testLinkedList02Chapter0029
     * @tc.desc      Test adding out-of-bounds short of number type from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0029';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 32768
      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_3000
     * @tc.name      testLinkedList02Chapter0030
     * @tc.desc      Test adding int of number type from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0030';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text = 1000000
      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)

      text = -2147483648
      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)

      text = 2147483647
      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)

    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_3100
     * @tc.name      testLinkedList02Chapter0031
     * @tc.desc      Test adding out-of-bounds int of number type from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0031';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 2147483648
      expect(newLinkedList.add(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_3200
     * @tc.name      testLinkedList02Chapter0032
     * @tc.desc      Test adding long of number type from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0032';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text = 1234567890123456
      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)

      text = -9223372036854775808
      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)

      text = 9223372036854775807
      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_3300
     * @tc.name      testLinkedList02Chapter0033
     * @tc.desc      Test adding out-of-bounds long of number type from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0033';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 9223372036854775808
      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_3400
     * @tc.name      testLinkedList02Chapter0034
     * @tc.desc      Test adding float of number type from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0034';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text = 3.14159
      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)

      text = 1.40129846432481707e-45
      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)

      text = 3.4028234663852860e+38
      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_3500
     * @tc.name      testLinkedList02Chapter0035
     * @tc.desc      Test float precision loss scenario of number type when adding from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0035';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const float1 = 0.1;
      const float2 = 0.2;
      newLinkedList.addFirst(float1);
      newLinkedList.addFirst(float2);
      const sum = Number(newLinkedList.get(0)) + Number(newLinkedList.get(1));
      expect(Math.abs(sum - 0.3) < 1e-10).assertTrue();
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_3600
     * @tc.name      testLinkedList02Chapter0036
     * @tc.desc      Test adding double of number type from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0036';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text = 12345.67890123456789
      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)

      text = 4.94065645841246544e-324
      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)

      text = 1.79769313486231570e+308
      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_3700
     * @tc.name      testLinkedList02Chapter0037
     * @tc.desc      Test adding out-of-bounds double of number type from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0037';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 1.8e+308
      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_3800
     * @tc.name      testLinkedList02Chapter0038
     * @tc.desc      Test adding char of number type from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0038';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text = 0
      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)

      text = -65535
      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_3900
     * @tc.name      testLinkedList02Chapter0039
     * @tc.desc      Test adding char of number type stored as character from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0039';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = "a"
      newLinkedList.addFirst(text.charCodeAt(0))
      expect(newLinkedList.getFirst()).assertEqual(text.charCodeAt(0))
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_4000
     * @tc.name      testLinkedList02Chapter0040
     * @tc.desc      Test adding out-of-bounds char value of number type from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0040';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 65536
      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_4100
     * @tc.name      testLinkedList02Chapter0041
     * @tc.desc      Test adding bigint value of number type from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0041';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = BigInt(0xdecafafecacefade)
      newLinkedList.addFirst(Number(text))
      expect(newLinkedList.add(Number(text))).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_4200
     * @tc.name      testLinkedList02Chapter0042
     * @tc.desc      Test adding double value of number type from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0042';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 123.456
      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_4300
     * @tc.name      testLinkedList02Chapter0043
     * @tc.desc      Test adding float of number type from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0043';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 0xcafebabe
      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_4400
     * @tc.name      testLinkedList02Chapter0044
     * @tc.desc      Test adding hexadecimal (16-bit) of number type from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0044';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 0x0102
      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_4500
     * @tc.name      testLinkedList02Chapter0045
     * @tc.desc      Test adding hexadecimal (32-bit) of number type from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0045';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 0x01020304
      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_4600
     * @tc.name      testLinkedList02Chapter0046
     * @tc.desc      Test adding octal of number type from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0046';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 0x3
      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_4700
     * @tc.name      testLinkedList02Chapter0047
     * @tc.desc      Test adding exponent operator value of number type from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0047';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 2 ** 3
      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_4800
     * @tc.name      testLinkedList02Chapter0048
     * @tc.desc      Test adding scientific notation value of number type from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0048';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text = 1e3
      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)

      text = 2.5e-2
      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_4900
     * @tc.name      testLinkedList02Chapter0049
     * @tc.desc      Test adding large integer of number type from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0049';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = BigInt(9007199254740991n)
      newLinkedList.addFirst(Number(text))
      expect(newLinkedList.getFirst()).assertEqual(Number(text))
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_5000
     * @tc.name      testLinkedList02Chapter0050
     * @tc.desc      Test adding true of boolean type from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0050';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<boolean>()

      const text = true
      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_5100
     * @tc.name      testLinkedList02Chapter0051
     * @tc.desc      Test adding false of boolean type from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0051';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<boolean>()

      const text = false
      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_5200
     * @tc.name      testLinkedList02Chapter0052
     * @tc.desc      Test adding values that are usually treated as false of boolean type from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0052';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<boolean>()

      const text01 = 0
      newLinkedList.addFirst(Boolean(text01))
      expect(newLinkedList.getFirst()).assertFalse()

      const text02 = NaN
      newLinkedList.addFirst(Boolean(text02))
      expect(newLinkedList.getFirst()).assertFalse()

      const text03 = ""
      newLinkedList.addFirst(Boolean(text03))
      expect(newLinkedList.getFirst()).assertFalse()

      const text04 = null
      newLinkedList.addFirst(Boolean(text04))
      expect(newLinkedList.getFirst()).assertFalse()

      const text05 = undefined
      newLinkedList.addFirst(Boolean(text05))
      expect(newLinkedList.getFirst()).assertFalse()

    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_5300
     * @tc.name      testLinkedList02Chapter0053
     * @tc.desc      Test adding ! + other data types converted to boolean type from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0053';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<boolean>()

      const text01 = !'s'
      newLinkedList.addFirst(text01)
      expect(newLinkedList.getFirst()).assertEqual(text01)

      const text02 = !0
      newLinkedList.addFirst(text02)
      expect(newLinkedList.getFirst()).assertEqual(text02)

    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_5400
     * @tc.name      testLinkedList02Chapter0054
     * @tc.desc      Test adding ordinary object of object type from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0054';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: number;
        b: string;
        c: number[];
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a:1, b:"test", c:[1,2,3]}

      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_5500
     * @tc.name      testLinkedList02Chapter0055
     * @tc.desc      Test adding nested object of object type from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0055';
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

      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_5600
     * @tc.name      testLinkedList02Chapter0056
     * @tc.desc      Test adding object with function property (no parameters) of object type from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0056';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: number;
        b: Function;
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a:1, b:()=>{return true}}

      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_5700
     * @tc.name      testLinkedList02Chapter0057
     * @tc.desc      Test adding object with function property (with parameters) of object type from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0057';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: number;
        b: Function;
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a:1, b:(n:number)=>{return n*100}}

      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_5800
     * @tc.name      testLinkedList02Chapter0058
     * @tc.desc      Test adding object with ArrayBuffer property of object type from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0058';
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

      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_5900
     * @tc.name      testLinkedList02Chapter0059
     * @tc.desc      Test adding object with DataView property of object type from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0059';
      console.log(TAG + ' start');

      interface textObject_1 {
        view: DataView
      }
      const newLinkedList = new LinkedList<textObject_1>()
      const arrayBuffer = new ArrayBuffer(16)
      let text: textObject_1 = {view: new DataView(arrayBuffer)}

      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_6000
     * @tc.name      testLinkedList02Chapter0060
     * @tc.desc      Test adding empty object of object type from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0060';
      console.log(TAG + ' start');

      interface textObject_1 {}
      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {}

      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)
      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)
      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_6100
     * @tc.name      testLinkedList02Chapter0061
     * @tc.desc      Test adding extremely large object of object type from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0061';
      console.log(TAG + ' start');

      const hugeObj: Record<string, number> = {};

      const newLinkedList = new LinkedList<Record<string, number>>()
      for (let i = 0; i < 10000; i++) {
        hugeObj[i.toString()] = i;
      }

      const start = Date.now()
      newLinkedList.addFirst(hugeObj)
      expect(newLinkedList.getFirst()).assertEqual(hugeObj)
      const cost = Date.now()   - start

      expect(newLinkedList.length).assertEqual(1)

      const newText = newLinkedList.getFirst()
      expect(newText['5000']).assertEqual(5000)

      expect(cost < 10).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_6200
     * @tc.name      testLinkedList02Chapter0062
     * @tc.desc      Test adding object with null property of object type from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0062';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: null,
        b: number
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a: null, b: 1}

      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_6300
     * @tc.name      testLinkedList02Chapter0063
     * @tc.desc      Test adding object with NaN property of object type from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0063';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: number,
        b: number
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a: NaN, b: 1}

      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_6400
     * @tc.name      testLinkedList02Chapter0064
     * @tc.desc      Test adding object with Infinity property of object type from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0064';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: number,
        b: number
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a: Infinity, b: 1}

      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_6500
     * @tc.name      testLinkedList02Chapter0065
     * @tc.desc      Test adding an object of Object class with TypedArray property from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0065';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: number,
        b: Uint8Array
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a: Infinity, b: new Uint8Array([172, 101, 108, 108, 111])}

      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_6600
     * @tc.name      testLinkedList02Chapter0066
     * @tc.desc      Test adding an object of Object class with Map property from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0066';
      console.log(TAG + ' start');


      interface textObject_1 {
        map: Map<string, string>,
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {map: new Map([['key1', 'value1'], ['key2', 'value2']])}

      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_6700
     * @tc.name      testLinkedList02Chapter0067
     * @tc.desc      Test adding an object of Object class with Set property from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0067';
      console.log(TAG + ' start');


      interface textObject_1 {
        set: Set<number>,
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {set: new Set([1,2,3,2,1])}

      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_6800
     * @tc.name      testLinkedList02Chapter0068
     * @tc.desc      Test adding an object of Object class with Promise property from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const TAG = 'testLinkedList02Chapter0068';
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

      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)

      const promiseResult = await testPromise;
      expect(isResolved).assertTrue()
      expect(promiseResult).assertEqual('done')
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_6900
     * @tc.name      testLinkedList02Chapter0069
     * @tc.desc      Test adding an object of Object class with regular expression property from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0069';
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

      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_7000
     * @tc.name      testLinkedList02Chapter0070
     * @tc.desc      Test adding a normal Uint8Array of Array class from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0070';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const text = new Uint8Array([72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63])

      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_7100
     * @tc.name      testLinkedList02Chapter0071
     * @tc.desc      Test adding an array of Array class containing multiple 0s from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0071';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const text = new Uint8Array([72, 101, 108, 108, 111, 87, 111, 114, 108,0,0,0,0,0, 100, 49, 50, 51, 63])

      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)
      expect(newLinkedList.get(0).length).assertEqual(19)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_7200
     * @tc.name      testLinkedList02Chapter0072
     * @tc.desc      Test adding an Array containing negative numbers converted to Uint8Array from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0072';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const text = new Uint8Array([72, 101, 108, 108, 111, -87, -111, -114, 108, 100, -49, 50, 51, 63])

      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_7300
     * @tc.name      testLinkedList02Chapter0073
     * @tc.desc      Test adding an Array containing negative numbers converted to Uint8Array/Uint16Array from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0073';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const newLinkedList1 = new LinkedList<Uint16Array>()
      const text = new Uint8Array([72, 101, 108, 108, 111, -87, -111, -114, 108, 100, -49, 50, 51, 63])
      const text1 = new Uint16Array([72, 101, 108, 108, 111, -87, -111, -114, 108, 100, -49, 50, 51, 63])

      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)
      newLinkedList1.addFirst(text1)
      expect(newLinkedList1.add(text1)).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_7400
     * @tc.name      testLinkedList02Chapter0074
     * @tc.desc      Test adding a special array of Array class from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0074';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Array<number | string>>()
      const text:Array<number | string> = []
      text["abc"] = 111
      text["aaa"] = 222
      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_7500
     * @tc.name      testLinkedList02Chapter0075
     * @tc.desc      Test adding an array of Array class containing NaN/Infinity from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0075';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const text = new Uint8Array([72, 101, 108, NaN, Infinity, 108, 111])
      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_7600
     * @tc.name      testLinkedList02Chapter0076
     * @tc.desc      Test adding an array of Array class containing non-numeric types from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0076';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Array<number | string | boolean | null | undefined>>()
      const text:Array<number | string | boolean | null | undefined> = [72, "abc", true, null, undefined, 108]
      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_7700
     * @tc.name      testLinkedList02Chapter0077
     * @tc.desc      Test adding an array of Array class containing non-numeric types from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0077';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Array<number | string | boolean | null | undefined>>()
      const text:Array<number | string | boolean | null | undefined> = [72, "abc", true, null, undefined, 108]
      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_7800
     * @tc.name      testLinkedList02Chapter0078
     * @tc.desc      Test adding an empty array of Array class from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0078';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Array<string>>()
      const text:Array<string> = []
      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_7900
     * @tc.name      testLinkedList02Chapter0079
     * @tc.desc      Test adding an array of Array class with extreme numeric overflow from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0079';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const text = new Uint8Array([256, 65536, 32768])
      newLinkedList.addFirst(text)
      expect(newLinkedList.getFirst()).assertEqual(text)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_8000
     * @tc.name      testLinkedList02Chapter0080
     * @tc.desc      Test adding Int8Array | Uint8Array | Uint8ClampedArray of Array class from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0080';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Int8Array | Uint8Array | Uint8ClampedArray>()
      const text1 = new Int8Array([127, -128, 128, -129])
      const text2 = new Uint8Array([255, 0, 256, -1])
      const text3 = new Uint8ClampedArray([255, 0, 256, -1])

      newLinkedList.addFirst(text1)
      expect(newLinkedList.getFirst()).assertEqual(text1)
      newLinkedList.addFirst(text2)
      expect(newLinkedList.getFirst()).assertEqual(text2)
      newLinkedList.addFirst(text3)
      expect(newLinkedList.getFirst()).assertEqual(text3)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT02_8100
     * @tc.name      testLinkedList02Chapter0081
     * @tc.desc      Test adding Int16Array | Uint16Array | Int32Array | Uint32Array of Array class from the head
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList02Chapter0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList02Chapter0081';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Int16Array | Uint16Array | Int32Array | Uint32Array>()
      const text1 = new Int16Array([32767, -32768, 32769, -32769])
      const text2 = new Uint16Array([65535, 0, 65536, -1])
      const text3 = new Int32Array([2147483647, -2147483648, 2147483648, -2147483649])
      const text4 = new Uint32Array([4294967295, 0, 4294967296, -1])

      newLinkedList.addFirst(text1)
      expect(newLinkedList.getFirst()).assertEqual(text1)
      newLinkedList.addFirst(text2)
      expect(newLinkedList.getFirst()).assertEqual(text2)
      newLinkedList.addFirst(text3)
      expect(newLinkedList.getFirst()).assertEqual(text3)
      newLinkedList.addFirst(text4)
      expect(newLinkedList.getFirst()).assertEqual(text4)
    })
  })
}