import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, TestType, Size, Level, expect } from '@ohos/hypium';
import { util, LinkedList } from '@kit.ArkTS';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function LinkedListTest01() {
  describe('LinkedListTest01', () => {
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
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_0100
     * @tc.name      testLinkedList01Chapter0001
     * @tc.desc      Construct string container normally
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0001';
      console.log(TAG + ' start');

      let newLinkList = new LinkedList<string>();
      let test = "test"

      newLinkList.add(test)
      expect(newLinkList.has(test)).assertTrue()

    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_0200
     * @tc.name      testLinkedList01Chapter0002
     * @tc.desc      Construct number container normally
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0002';
      console.log(TAG + ' start');

      let newLinkList = new LinkedList<number>();
      let test = 123

      newLinkList.add(test)
      expect(newLinkList.has(test)).assertTrue()

    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_0300
     * @tc.name      testLinkedList01Chapter0003
     * @tc.desc      Construct boolean container normally
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0003';
      console.log(TAG + ' start');

      let newLinkList = new LinkedList<boolean>();
      let test = true

      newLinkList.add(test)
      expect(newLinkList.has(test)).assertTrue()

    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_0400
     * @tc.name      testLinkedList01Chapter0004
     * @tc.desc      Construct object container normally
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0004';
      console.log(TAG + ' start');

      interface testObject_1 {
        a: number;
        b: string;
        c: boolean;
      }

      let newLinkList = new LinkedList<object>();
      let test: testObject_1 = { a:10, b:"w1", c:true }

      newLinkList.add(test)
      expect(newLinkList.has(test)).assertTrue()

    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_0500
     * @tc.name      testLinkedList01Chapter0005
     * @tc.desc      Construct Array container normally
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0005';
      console.log(TAG + ' start');

      let newLinkList = new LinkedList<Array<string>>();
      let test:Array<string> = ["23","123"]

      newLinkList.add(test)
      expect(newLinkList.has(test)).assertTrue()

    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_0600
     * @tc.name      testLinkedList01Chapter0006
     * @tc.desc      Try if the constructed function assigned to other variables can be used normally
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0006';
      console.log(TAG + ' start');

      const newLinkList = new LinkedList<string>();
      let testLinkList = newLinkList
      let test = "test"
      testLinkList.add(test)

      expect(testLinkList.has(test)).assertTrue()
      expect(newLinkList.has(test)).assertTrue()

    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_0700
     * @tc.name      testLinkedList01Chapter0007
     * @tc.desc      Test adding undefined of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0007';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = undefined
      expect(newLinkedList.add(test)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_0800
     * @tc.name      testLinkedList01Chapter0008
     * @tc.desc      Test adding null of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0008';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = null
      expect(newLinkedList.add(test)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_0900
     * @tc.name      testLinkedList01Chapter0009
     * @tc.desc      Test adding empty string of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0009';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = ""
      expect(newLinkedList.add(test)).assertTrue()

    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_1000
     * @tc.name      testLinkedList01Chapter0010
     * @tc.desc      Test adding full coverage of special characters of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter00010';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~"
      expect(newLinkedList.add(test)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_1100
     * @tc.name      testLinkedList01Chapter0011
     * @tc.desc      Test adding full coverage of ASCII codes of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0011';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~"
      expect(newLinkedList.add(test)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_1200
     * @tc.name      testLinkedList01Chapter0012
     * @tc.desc      Test adding full coverage of special characters of String type (twice)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0012';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const test = " !!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~"
      expect(newLinkedList.add(test)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_1300
     * @tc.name      testLinkedList01Chapter0013
     * @tc.desc      Test adding special escape characters of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0013';
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
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_1400
     * @tc.name      testLinkedList01Chapter0014
     * @tc.desc      Test adding emojis and their Unicode encodings of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0014';
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
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_1500
     * @tc.name      testLinkedList01Chapter0015
     * @tc.desc      Test adding invalid unicode encodings of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0015';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()

      expect(newLinkedList.add(`\udc04`)).assertTrue()
      expect(newLinkedList.add(`\ud83d`)).assertTrue()
      expect(newLinkedList.add(`\udff4`)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_1600
     * @tc.name      testLinkedList01Chapter0016
     * @tc.desc      Test adding keywords of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0016';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()

      expect(newLinkedList.add(`"0" `)).assertTrue()
      expect(newLinkedList.add(`"NaN"`)).assertTrue()
      expect(newLinkedList.add(`“”`)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_1700
     * @tc.name      testLinkedList01Chapter0017
     * @tc.desc      Test adding treeString type of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0017';
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
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_1800
     * @tc.name      testLinkedList01Chapter0018
     * @tc.desc      Test adding sliceString type of String type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0018';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()

      let str = "{k1:value1,k2:value2}"

      for (let i = 0; i < 10; i++){
        let result = str.substring(0,str.length-2);
        str = result
        expect(newLinkedList.add(str)).assertTrue()
      }
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_1900
     * @tc.name      testLinkedList01Chapter0019
     * @tc.desc      Test String GC behavior: normal usability after adding and releasing an extra-long string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0019';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<string>()
      const largeStr = 'a'.repeat(10 * 10 * 10);

      expect(newLinkedList.add(largeStr)).assertTrue()

      let temp = newLinkedList
      temp.clear();

      const newLargeStr = "c".repeat(10 * 10 * 10)
      expect(newLinkedList.add(newLargeStr)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_2000
     * @tc.name      testLinkedList01Chapter0020
     * @tc.desc      Test adding 0 of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0020';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = 0

      expect(newLinkedList.add(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_2100
     * @tc.name      testLinkedList01Chapter0021
     * @tc.desc      Test adding undefined of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0021';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = undefined

      expect(newLinkedList.add(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_2200
     * @tc.name      testLinkedList01Chapter0022
     * @tc.desc      Test adding NaN of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0022';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = NaN

      expect(newLinkedList.add(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_2300
     * @tc.name      testLinkedList01Chapter0023
     * @tc.desc      Test adding -0 of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0023';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = -0

      expect(newLinkedList.add(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_2400
     * @tc.name      testLinkedList01Chapter0024
     * @tc.desc      Test adding positive infinity of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0024';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = Infinity

      expect(newLinkedList.add(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_2500
     * @tc.name      testLinkedList01Chapter0025
     * @tc.desc      Test adding negative infinity of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0025';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = -Infinity

      expect(newLinkedList.add(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_2600
     * @tc.name      testLinkedList01Chapter0026
     * @tc.desc      Test adding double type of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0026';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = Math.floor(1.5)


      expect(newLinkedList.add(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_2700
     * @tc.name      testLinkedList01Chapter0027
     * @tc.desc      Test adding Number.MAX_VALUE of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0027';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = 1.7976931348623157e+308

      expect(newLinkedList.add(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_2800
     * @tc.name      testLinkedList01Chapter0028
     * @tc.desc      Test adding Number.MIN_VALUE of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0028';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = 5e-324

      expect(newLinkedList.add(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_2900
     * @tc.name      testLinkedList01Chapter0029
     * @tc.desc      Test adding Number.EPSILON of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0029';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = 2.220446049250313e-16

      expect(newLinkedList.add(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_3000
     * @tc.name      testLinkedList01Chapter0030
     * @tc.desc      Test adding Number.EPSILON of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0030';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()
      let text = 2^53 - 1

      expect(newLinkedList.add(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_3100
     * @tc.name      testLinkedList01Chapter0031
     * @tc.desc      Test adding byte of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0031';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text = -64
      expect(newLinkedList.add(text)).assertTrue()

      text = -128
      expect(newLinkedList.add(text)).assertTrue()

      text = 127
      expect(newLinkedList.add(text)).assertTrue()

      text = 128
      expect(newLinkedList.add(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_3200
     * @tc.name      testLinkedList01Chapter0032
     * @tc.desc      Test adding out-of-bounds byte of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0032';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 128
      expect(newLinkedList.add(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_3300
     * @tc.name      testLinkedList01Chapter0033
     * @tc.desc      Test adding short of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0033';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text = 10000
      expect(newLinkedList.add(text)).assertTrue()

      text = -32768
      expect(newLinkedList.add(text)).assertTrue()

      text = 32767
      expect(newLinkedList.add(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_3400
     * @tc.name      testLinkedList01Chapter0034
     * @tc.desc      Test adding out-of-bounds short of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0034';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 32768
      expect(newLinkedList.add(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_3500
     * @tc.name      testLinkedList01Chapter0035
     * @tc.desc      Test adding int of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0035';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text = 1000000
      expect(newLinkedList.add(text)).assertTrue()

      text = -2147483648
      expect(newLinkedList.add(text)).assertTrue()

      text = 2147483647
      expect(newLinkedList.add(text)).assertTrue()

    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_3600
     * @tc.name      testLinkedList01Chapter0036
     * @tc.desc      Test adding out-of-bounds int of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0036';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 2147483648
      expect(newLinkedList.add(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_3700
     * @tc.name      testLinkedList01Chapter0037
     * @tc.desc      Test adding long of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0037';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text = 1234567890123456
      expect(newLinkedList.add(text)).assertTrue()

      text = -9223372036854775808
      expect(newLinkedList.add(text)).assertTrue()

      text = 9223372036854775807
      expect(newLinkedList.add(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_3800
     * @tc.name      testLinkedList01Chapter0038
     * @tc.desc      Test adding out-of-bounds long of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0038';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 9223372036854775808
      expect(newLinkedList.add(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_3900
     * @tc.name      testLinkedList01Chapter0039
     * @tc.desc      Test adding float of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0039';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text = 3.14159
      expect(newLinkedList.add(text)).assertTrue()

      text = 1.40129846432481707e-45
      expect(newLinkedList.add(text)).assertTrue()

      text = 3.4028234663852860e+38
      expect(newLinkedList.add(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_4000
     * @tc.name      testLinkedList01Chapter0040
     * @tc.desc      Test adding float precision loss scenario of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0040';
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
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_4100
     * @tc.name      testLinkedList01Chapter0041
     * @tc.desc      Test adding double of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0041';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text = 12345.67890123456789
      expect(newLinkedList.add(text)).assertTrue()

      text = 4.94065645841246544e-324
      expect(newLinkedList.add(text)).assertTrue()

      text = 1.79769313486231570e+308
      expect(newLinkedList.add(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_4200
     * @tc.name      testLinkedList01Chapter0042
     * @tc.desc      Test adding out-of-bounds double of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0042';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 1.8e+308
      expect(newLinkedList.add(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_4300
     * @tc.name      testLinkedList01Chapter0043
     * @tc.desc      Test adding char of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0043';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text = 0
      expect(newLinkedList.add(text)).assertTrue()

      text = -65535
      expect(newLinkedList.add(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_4400
     * @tc.name      testLinkedList01Chapter0044
     * @tc.desc      Test adding char of number type stored as character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0044';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = "a"
      expect(newLinkedList.add(text.charCodeAt(0))).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_4500
     * @tc.name      testLinkedList01Chapter0045
     * @tc.desc      Test adding out-of-bounds char value of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0045';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 65536
      expect(newLinkedList.add(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_4600
     * @tc.name      testLinkedList01Chapter0046
     * @tc.desc      Test adding bigint value of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0046';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = BigInt(0xdecafafecacefade)
      expect(newLinkedList.add(Number(text))).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_4700
     * @tc.name      testLinkedList01Chapter0047
     * @tc.desc      Test adding double value of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0047';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 123.456
      expect(newLinkedList.add(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_4800
     * @tc.name      testLinkedList01Chapter0048
     * @tc.desc      Test adding float of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0048';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 0xcafebabe
      expect(newLinkedList.add(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_4900
     * @tc.name      testLinkedList01Chapter0049
     * @tc.desc      Test adding hexadecimal (16-bit) of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0049';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 0x0102
      expect(newLinkedList.add(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_5000
     * @tc.name      testLinkedList01Chapter0050
     * @tc.desc      Test adding hexadecimal (32-bit) of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0050';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 0x01020304
      expect(newLinkedList.add(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_5100
     * @tc.name      testLinkedList01Chapter0051
     * @tc.desc      Test adding octal (8-bit) of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0051';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 0x3
      expect(newLinkedList.add(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_5200
     * @tc.name      testLinkedList01Chapter0052
     * @tc.desc      Test adding exponent operator of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0052';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = 2 ** 3
      expect(newLinkedList.add(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_5300
     * @tc.name      testLinkedList01Chapter0053
     * @tc.desc      Test adding scientific notation of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0053';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      let text = 1e3
      expect(newLinkedList.add(text)).assertTrue()

      text = 2.5e-2
      expect(newLinkedList.add(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_5400
     * @tc.name      testLinkedList01Chapter0054
     * @tc.desc      Test adding large integer of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0054';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<number>()

      const text = BigInt(9007199254740991n)
      expect(newLinkedList.add(Number(text))).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_5500
     * @tc.name      testLinkedList01Chapter0055
     * @tc.desc      Test adding true of boolean type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0055';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<boolean>()

      const text = true
      expect(newLinkedList.add(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_5600
     * @tc.name      testLinkedList01Chapter0056
     * @tc.desc      Test adding false of boolean type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0056';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<boolean>()

      const text = false
      expect(newLinkedList.add(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_5700
     * @tc.name      testLinkedList01Chapter0057
     * @tc.desc      Test adding values that are usually treated as false of boolean type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0057';
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

    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_5800
     * @tc.name      testLinkedList01Chapter0058
     * @tc.desc      Test adding ! + other data types of boolean type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0058';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<boolean>()

      const text01 = !'s'
      expect(newLinkedList.add(text01)).assertTrue()

      const text02 = !0
      expect(newLinkedList.add(text02)).assertTrue()

    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_5900
     * @tc.name      testLinkedList01Chapter0059
     * @tc.desc      Test adding ordinary object of object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0059';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: number;
        b: string;
        c: number[];
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a:1, b:"test", c:[1,2,3]}

      expect(newLinkedList.add(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_6000
     * @tc.name      testLinkedList01Chapter0060
     * @tc.desc      Test adding nested object of object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0060';
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
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_6100
     * @tc.name      testLinkedList01Chapter0061
     * @tc.desc      Test adding object with function property (no parameters) of object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0061';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: number;
        b: Function;
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a:1, b:()=>{return true}}

      expect(newLinkedList.add(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_6200
     * @tc.name      testLinkedList01Chapter0062
     * @tc.desc      Test adding object with function property (with parameters) of object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0062';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: number;
        b: Function;
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a:1, b:(n:number)=>{return n*100}}

      expect(newLinkedList.add(text)).assertTrue()
    });

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_6300
     * @tc.name      testLinkedList01Chapter0063
     * @tc.desc      Test adding object with ArrayBuffer property of object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0063';
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
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_6400
     * @tc.name      testLinkedList01Chapter0064
     * @tc.desc      Test adding object with DataView property of object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0064';
      console.log(TAG + ' start');

      interface textObject_1 {
        view: DataView
      }
      const newLinkedList = new LinkedList<textObject_1>()
      const arrayBuffer = new ArrayBuffer(16)
      let text: textObject_1 = {view: new DataView(arrayBuffer)}

      expect(newLinkedList.add(text)).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_6500
     * @tc.name      testLinkedList01Chapter0065
     * @tc.desc      Test adding empty object of object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0065';
      console.log(TAG + ' start');

      interface textObject_1 {}
      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {}

      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.add(text)).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_6600
     * @tc.name      testLinkedList01Chapter0066
     * @tc.desc      Test adding extremely large object of object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0066';
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
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_6700
     * @tc.name      testLinkedList01Chapter0067
     * @tc.desc      Test adding object with null property of object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0067';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: null,
        b: number
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a: null, b: 1}

      expect(newLinkedList.add(text)).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_6800
     * @tc.name      testLinkedList01Chapter0068
     * @tc.desc      Test adding object with NaN property of object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0068';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: number,
        b: number
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a: NaN, b: 1}

      expect(newLinkedList.add(text)).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_6900
     * @tc.name      testLinkedList01Chapter0069
     * @tc.desc      Test adding object with Infinity property of object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0069';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: number,
        b: number
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a: Infinity, b: 1}

      expect(newLinkedList.add(text)).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_7000
     * @tc.name      testLinkedList01Chapter0070
     * @tc.desc      Test adding object with TypedArray property of object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0070';
      console.log(TAG + ' start');

      interface textObject_1 {
        a: number,
        b: Uint8Array
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {a: Infinity, b: new Uint8Array([172, 101, 108, 108, 111])}

      expect(newLinkedList.add(text)).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_7100
     * @tc.name      testLinkedList01Chapter0071
     * @tc.desc      Test adding object with Map property of object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0071';
      console.log(TAG + ' start');


      interface textObject_1 {
        map: Map<string, string>,
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {map: new Map([['key1', 'value1'], ['key2', 'value2']])}

      expect(newLinkedList.add(text)).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_7200
     * @tc.name      testLinkedList01Chapter0072
     * @tc.desc      Test adding object with Set property of object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0072';
      console.log(TAG + ' start');


      interface textObject_1 {
        set: Set<number>,
      }

      const newLinkedList = new LinkedList<textObject_1>()
      let text: textObject_1 = {set: new Set([1,2,3,2,1])}

      expect(newLinkedList.add(text)).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_7300
     * @tc.name      testLinkedList01Chapter0073
     * @tc.desc      Test adding an object of the Object class that contains a Promise property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const TAG = 'testLinkedList01Chapter0073';
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

      const promiseResult = await testPromise;
      expect(isResolved).assertTrue()
      expect(promiseResult).assertEqual('done')
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_7400
     * @tc.name      testLinkedList01Chapter0074
     * @tc.desc      Test adding an object of the Object class that contains a regular expression property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0074';
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
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_7500
     * @tc.name      testLinkedList01Chapter0075
     * @tc.desc      Test adding a normal Uint8Array of the Array class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0075';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const text = new Uint8Array([72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63])

      expect(newLinkedList.add(text)).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_7600
     * @tc.name      testLinkedList01Chapter0076
     * @tc.desc      Test adding an array of the Array class that contains multiple 0s
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0076';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const text = new Uint8Array([72, 101, 108, 108, 111, 87, 111, 114, 108,0,0,0,0,0, 100, 49, 50, 51, 63])

      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList.get(0).length).assertEqual(19)
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_7700
     * @tc.name      testLinkedList01Chapter0077
     * @tc.desc      Test adding an Array with negative numbers converted to Uint8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0077';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const text = new Uint8Array([72, 101, 108, 108, 111, -87, -111, -114, 108, 100, -49, 50, 51, 63])

      expect(newLinkedList.add(text)).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_7800
     * @tc.name      testLinkedList01Chapter0078
     * @tc.desc      Test adding an Array with negative numbers converted to Uint8Array/Uint16Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0078';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const newLinkedList1 = new LinkedList<Uint16Array>()
      const text = new Uint8Array([72, 101, 108, 108, 111, -87, -111, -114, 108, 100, -49, 50, 51, 63])
      const text1 = new Uint16Array([72, 101, 108, 108, 111, -87, -111, -114, 108, 100, -49, 50, 51, 63])

      expect(newLinkedList.add(text)).assertTrue()
      expect(newLinkedList1.add(text1)).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_7900
     * @tc.name      testLinkedList01Chapter0079
     * @tc.desc      Test adding a special array of the Array class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0079';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Array<number | string>>()
      const text:Array<number | string> = []
      text["abc"] = 111
      text["aaa"] = 222
      expect(newLinkedList.add(text)).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_8000
     * @tc.name      testLinkedList01Chapter0080
     * @tc.desc      Test adding an array of the Array class that contains NaN/Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0080';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const text = new Uint8Array([72, 101, 108, NaN, Infinity, 108, 111])
      expect(newLinkedList.add(text)).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_8100
     * @tc.name      testLinkedList01Chapter0081
     * @tc.desc      Test adding an array of the Array class that contains non-numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0081';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Array<number | string | boolean | null | undefined>>()
      const text:Array<number | string | boolean | null | undefined> = [72, "abc", true, null, undefined, 108]
      expect(newLinkedList.add(text)).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_8200
     * @tc.name      testLinkedList01Chapter0082
     * @tc.desc      Test adding an array of the Array class that contains non-numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0082';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Array<number | string | boolean | null | undefined>>()
      const text:Array<number | string | boolean | null | undefined> = [72, "abc", true, null, undefined, 108]
      expect(newLinkedList.add(text)).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_8300
     * @tc.name      testLinkedList01Chapter0083
     * @tc.desc      Test adding an empty array of the Array class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0083';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Array<string>>()
      const text:Array<string> = []
      expect(newLinkedList.add(text)).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_8400
     * @tc.name      testLinkedList01Chapter0084
     * @tc.desc      Test adding an array of the Array class with extreme numeric overflow
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0084';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Uint8Array>()
      const text = new Uint8Array([256, 65536, 32768])
      expect(newLinkedList.add(text)).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_8500
     * @tc.name      testLinkedList01Chapter0085
     * @tc.desc      Test adding Int8Array | Uint8Array | Uint8ClampedArray of the Array class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0085';
      console.log(TAG + ' start');

      const newLinkedList = new LinkedList<Int8Array | Uint8Array | Uint8ClampedArray>()
      const text1 = new Int8Array([127, -128, 128, -129])
      const text2 = new Uint8Array([255, 0, 256, -1])
      const text3 = new Uint8ClampedArray([255, 0, 256, -1])

      expect(newLinkedList.add(text1)).assertTrue()
      expect(newLinkedList.add(text2)).assertTrue()
      expect(newLinkedList.add(text3)).assertTrue()
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_8600
     * @tc.name      testLinkedList01Chapter0086
     * @tc.desc      Test adding Int16Array | Uint16Array | Int32Array | Uint32Array of the Array class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0086';
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
    })

    /**
     * @tc.number    SUB_UTIL_LINKEDLIST_TEXT01_8700
     * @tc.name      testLinkedList01Chapter0087
     * @tc.desc      Test adding Float32Array | Float64Array | BigInt64Array | BigUint64Array of the Array class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLinkedList01Chapter0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLinkedList01Chapter0087';
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
    })
  })
}