import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { TreeSet, util } from '@kit.ArkTS';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function TreeSet03Test() {
  describe('TreeSet03Test', () => {
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
     * @tc.number    SUB_TREESET_TEST03_0100
     * @tc.name      testTreeSet03Chapter0001
     * @tc.desc      Add Int16Array out of bounds value 32768
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0001';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      let result = treeSet.add(32768);
      expect(result).assertTrue();
      expect(treeSet.has(32768)).assertTrue();
    });


    /**
     * @tc.number    SUB_TREESET_TEST03_0200
     * @tc.name      testTreeSet03Chapter0002
     * @tc.desc      Add Uint16Array boundary value 65535
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0002';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      let result = treeSet.add(65535);
      expect(result).assertTrue();
      expect(treeSet.has(65535)).assertTrue();
    });


    /**
     * @tc.number    SUB_TREESET_TEST03_0300
     * @tc.name      testTreeSet03Chapter0003
     * @tc.desc      Add Uint16Array out of bounds value 65536
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0003';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      let result = treeSet.add(65536);
      expect(result).assertTrue();
      expect(treeSet.has(65536)).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_0400
     * @tc.name      testTreeSet03Chapter0004
     * @tc.desc      Add Int32Array boundary value -2147483648
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0004';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      let result = treeSet.add(-2147483648);
      expect(result).assertTrue();
      expect(treeSet.has(-2147483648)).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_0500
     * @tc.name      testTreeSet03Chapter0005
     * @tc.desc      Add Int32Array boundary value 2147483647
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0005';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      let result = treeSet.add(2147483647);
      expect(result).assertTrue();
      expect(treeSet.has(2147483647)).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_0600
     * @tc.name      testTreeSet03Chapter0006
     * @tc.desc      Add Int32Array out of bounds value -2147483649
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0006';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      let result = treeSet.add(-2147483649);
      expect(result).assertTrue();
      expect(treeSet.has(-2147483649)).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_0700
     * @tc.name      testTreeSet03Chapter0007
     * @tc.desc      Add Int32Array out of bounds value 2147483648
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0007';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      let result = treeSet.add(2147483648);
      expect(result).assertTrue();
      expect(treeSet.has(2147483648)).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_0800
     * @tc.name      testTreeSet03Chapter0008
     * @tc.desc      Add Uint32Array boundary value 4294967295
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0008';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      let result = treeSet.add(4294967295);
      expect(result).assertTrue();
      expect(treeSet.has(4294967295)).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_0900
     * @tc.name      testTreeSet03Chapter0009
     * @tc.desc      Add Uint32Array out of bounds value 4294967296
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0009';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      let result = treeSet.add(4294967296);
      expect(result).assertTrue();
      expect(treeSet.has(4294967296)).assertTrue();
    });


    /**
     * @tc.number    SUB_TREESET_TEST03_1000
     * @tc.name      testTreeSet03Chapter0010
     * @tc.desc      Add Float32Array boundary value 3.4028234663852886e38
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0010';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      let result = treeSet.add(3.4028234663852886e38);
      expect(result).assertTrue();
      expect(treeSet.has(3.4028234663852886e38)).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_1100
     * @tc.name      testTreeSet03Chapter0011
     * @tc.desc      Add Float32Array out of bounds value -3.5e38
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0011';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      let result = treeSet.add(-3.5e38);
      expect(result).assertTrue();
      expect(treeSet.has(-3.5e38)).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_1200
     * @tc.name      testTreeSet03Chapter0012
     * @tc.desc      Add Float32Array out of bounds value 3.5e38
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0012';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      let result = treeSet.add(3.5e38);
      expect(result).assertTrue();
      expect(treeSet.has(3.5e38)).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_1300
     * @tc.name      testTreeSet03Chapter0013
     * @tc.desc      Add Float64Array boundary value -1.7976931348623157e308
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0013';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      let result = treeSet.add(-1.7976931348623157e308);
      expect(result).assertTrue();
      expect(treeSet.has(-1.7976931348623157e308)).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_1400
     * @tc.name      testTreeSet03Chapter0014
     * @tc.desc      Add Float64Array boundary value 1.7976931348623157e308
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0014';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      let result = treeSet.add(1.7976931348623157e308);
      expect(result).assertTrue();
      expect(treeSet.has(1.7976931348623157e308)).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_1500
     * @tc.name      testTreeSet03Chapter0015
     * @tc.desc      Add Float64Array out of bounds value -1.8e308
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0015';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      let result = treeSet.add(-1.8e308);
      expect(result).assertTrue();
      expect(treeSet.has(-1.8e308)).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_1600
     * @tc.name      testTreeSet03Chapter0016
     * @tc.desc      Add Float64Array out of bounds value 1.8e308
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0016';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      let result = treeSet.add(1.8e308);
      expect(result).assertTrue();
      expect(treeSet.has(1.8e308)).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_1700
     * @tc.name      testTreeSet03Chapter0017
     * @tc.desc      Add Infinity to Float32Array TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0017';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      let result = treeSet.add(Infinity);
      expect(result).assertTrue();
      expect(treeSet.has(Infinity)).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_1800
     * @tc.name      testTreeSet03Chapter0018
     * @tc.desc      Add -Infinity to Float32Array TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0018';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      let result = treeSet.add(-Infinity);
      expect(result).assertTrue();
      expect(treeSet.has(-Infinity)).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_1900
     * @tc.name      testTreeSet03Chapter0019
     * @tc.desc      Add NaN to Float32Array TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0019';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      let result = treeSet.add(NaN);
      expect(result).assertTrue();
    });


    /**
     * @tc.number    SUB_TREESET_TEST03_2000
     * @tc.name      testTreeSet03Chapter0020
     * @tc.desc      Add string undefined to TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0020';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      let result = treeSet.add("undefined");
      expect(result).assertTrue();
      expect(treeSet.has("undefined")).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_2100
     * @tc.name      testTreeSet03Chapter0021
     * @tc.desc      Add string null to TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0021';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      let result = treeSet.add("null");
      expect(result).assertTrue();
      expect(treeSet.has("null")).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_2200
     * @tc.name      testTreeSet03Chapter0022
     * @tc.desc      Add empty string to TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0022';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      let result = treeSet.add("");
      expect(result).assertTrue();
      expect(treeSet.has("")).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_2300
     * @tc.name      testTreeSet03Chapter0023
     * @tc.desc      Add special characters to TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0023';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      let specialChars = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
      for (let i = 0; i < specialChars.length; i++) {
        let char = specialChars.charAt(i);
        let result = treeSet.add(char);
        expect(result).assertTrue();
        expect(treeSet.has(char)).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_2400
     * @tc.name      testTreeSet03Chapter0024
     * @tc.desc      Add full ASCII characters to TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0024';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      let asciiChars =
        "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
      for (let i = 0; i < asciiChars.length; i++) {
        let char = asciiChars.charAt(i);
        let result = treeSet.add(char);
        expect(result).assertTrue();
        expect(treeSet.has(char)).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_2500
     * @tc.name      testTreeSet03Chapter0025
     * @tc.desc      Add duplicated special characters to TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0025';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      let dupSpecialChars = "!!\"\"##$$%%&&''(())**++,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~";
      for (let i = 0; i < dupSpecialChars.length; i++) {
        let char = dupSpecialChars.charAt(i);
        let result = treeSet.add(char);
        expect(result).assertTrue();
        expect(treeSet.has(char)).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_2600
     * @tc.name      testTreeSet03Chapter0026
     * @tc.desc      Add escape characters to TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0026';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      let escapeChars =
        ["\\a", "\\b", "\\f", "\\n", "\\r", "\\t", "\\v", "\\\\", "\\'", "\\\"", "\\?", "\\0", "\\ddd", "\\xhh"];
      for (let char of escapeChars) {
        let result = treeSet.add(char);
        expect(result).assertTrue();
        expect(treeSet.has(char)).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_2700
     * @tc.name      testTreeSet03Chapter0027
     * @tc.desc      Add emoji characters to TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0027';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      let emojis = ["👆", "👿", "👀", "💯", "🎅", "😼", "🔧", "💇", "🤼‍♂️", "🛢", "🀄", "🏴"];
      for (let emoji of emojis) {
        let result = treeSet.add(emoji);
        expect(result).assertTrue();
        expect(treeSet.has(emoji)).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_2800
     * @tc.name      testTreeSet03Chapter0028
     * @tc.desc      Add invalid Unicode characters to TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0028';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      let invalidUnicode = ["\\udc04", "\\ud83d", "\\udff4"];
      for (let unicode of invalidUnicode) {
        let result = treeSet.add(unicode);
        expect(result).assertTrue();
        expect(treeSet.has(unicode)).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_2900
     * @tc.name      testTreeSet03Chapter0029
     * @tc.desc      Add keyword strings to TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0029';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      let keywords = ["0", "NaN", ""];
      for (let keyword of keywords) {
        let result = treeSet.add(keyword);
        expect(result).assertTrue();
        expect(treeSet.has(keyword)).assertTrue();
      }
    });


    /**
     * @tc.number    SUB_TREESET_TEST03_3000
     * @tc.name      testTreeSet03Chapter0030
     * @tc.desc      Add number -0 to TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0030';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      let result = treeSet.add(-0);
      expect(result).assertTrue();
      expect(treeSet.has(-0)).assertTrue();
    });


    /**
     * @tc.number    SUB_TREESET_TEST03_3100
     * @tc.name      testTreeSet03Chapter0031
     * @tc.desc      Add double value Math.floor(1.5) to TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0031';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      let result = treeSet.add(Math.floor(1.5));
      expect(result).assertTrue();
      expect(treeSet.has(1)).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_3200
     * @tc.name      testTreeSet03Chapter0032
     * @tc.desc      Add Number.MAX_VALUE to TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0032';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      let result = treeSet.add(Number.MAX_VALUE);
      expect(result).assertTrue();
      expect(treeSet.has(Number.MAX_VALUE)).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_3300
     * @tc.name      testTreeSet03Chapter0033
     * @tc.desc      Add Number.MIN_VALUE to TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0033';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      let result = treeSet.add(Number.MIN_VALUE);
      expect(result).assertTrue();
      expect(treeSet.has(Number.MIN_VALUE)).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_3400
     * @tc.name      testTreeSet03Chapter0034
     * @tc.desc      Add Number.EPSILON to TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0034';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      let result = treeSet.add(Number.EPSILON);
      expect(result).assertTrue();
      expect(treeSet.has(Number.EPSILON)).assertTrue();
    });


    /**
     * @tc.number    SUB_TREESET_TEST03_3500
     * @tc.name      testTreeSet03Chapter0035
     * @tc.desc      Add long range value -9223372036854775808 to TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0035';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      let result = treeSet.add(-9223372036854775808);
      expect(result).assertTrue();
      expect(treeSet.has(-9223372036854775808)).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_3600
     * @tc.name      testTreeSet03Chapter0036
     * @tc.desc      Add long range value 9223372036854775807 to TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0036';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      let result = treeSet.add(9223372036854775807);
      expect(result).assertTrue();
      expect(treeSet.has(9223372036854775807)).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_3700
     * @tc.name      testTreeSet03Chapter0037
     * @tc.desc      Add float range value to TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0037';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      let floatValue = 1.40129846432481707e-45;
      let result = treeSet.add(floatValue);
      expect(result).assertTrue();
      expect(treeSet.has(floatValue)).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_3800
     * @tc.name      testTreeSet03Chapter0038
     * @tc.desc      Add double range value to TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0038';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      let doubleValue = 4.94065645841246544e-324;
      let result = treeSet.add(doubleValue);
      expect(result).assertTrue();
      expect(treeSet.has(doubleValue)).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_3900
     * @tc.name      testTreeSet03Chapter0039
     * @tc.desc      Add char range value 65535 to TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0039';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      let result = treeSet.add(65535);
      expect(result).assertTrue();
      expect(treeSet.has(65535)).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_4000
     * @tc.name      testTreeSet03Chapter0040
     * @tc.desc      Add hex value 0x0102 to TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0040';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      let result = treeSet.add(0x0102);
      expect(result).assertTrue();
      expect(treeSet.has(0x0102)).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_4100
     * @tc.name      testTreeSet03Chapter0041
     * @tc.desc      Add octal value 0o3 to TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0041';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      let result = treeSet.add(0o3);
      expect(result).assertTrue();
      expect(treeSet.has(0o3)).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_4200
     * @tc.name      testTreeSet03Chapter0042
     * @tc.desc      Add exponent value 2 ** 3 to TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0042';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      let result = treeSet.add(2**3);
      expect(result).assertTrue();
      expect(treeSet.has(8)).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_4300
     * @tc.name      testTreeSet03Chapter0043
     * @tc.desc      Add scientific notation 1e3 to TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0043';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      let result = treeSet.add(1e3);
      expect(result).assertTrue();
      expect(treeSet.has(1000)).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_4400
     * @tc.name      testTreeSet03Chapter0044
     * @tc.desc      Add boolean true to TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0044';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<boolean>();
      let result = treeSet.add(true);
      expect(result).assertTrue();
      expect(treeSet.has(true)).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_4500
     * @tc.name      testTreeSet03Chapter0045
     * @tc.desc      Add boolean false to TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0045';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<boolean>();
      let result = treeSet.add(false);
      expect(result).assertTrue();
      expect(treeSet.has(false)).assertTrue();
    });


    /**
     * @tc.number    SUB_TREESET_TEST03_4600
     * @tc.name      testTreeSet03Chapter0046
     * @tc.desc      Add normal Uint8Array array to TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0046';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<Array<number>>();
      let arr = [72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63];
      let result = treeSet.add(arr);
      expect(result).assertTrue();
      expect(treeSet.has(arr)).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_4700
     * @tc.name      testTreeSet03Chapter0047
     * @tc.desc      Add array with multiple zeros to TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0047';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<Array<number>>();
      let arr = [72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63];
      let result = treeSet.add(arr);
      expect(result).assertTrue();
      expect(treeSet.has(arr)).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_4800
     * @tc.name      testTreeSet03Chapter0048
     * @tc.desc      Add array with negative numbers to TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0048';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<Array<number>>();
      let arr = [72, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63];
      let result = treeSet.add(arr);
      expect(result).assertTrue();
      expect(treeSet.has(arr)).assertTrue();
    });

    /**
     * * @tc.number    SUB_TREESET_TEST03_4900
     * @tc.name      testTreeSet03Chapter0049
     * @tc.desc      Add special array with string keys to TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0049';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<Array<number>>();
      let arr: Array<number> = [];
      arr["abc"] = 111;
      arr["aaa"] = 222;
      let result = treeSet.add(arr);
      expect(result).assertTrue();
      expect(treeSet.has(arr)).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_5000
     * @tc.name      testTreeSet03Chapter0050
     * @tc.desc      Add array containing NaN and Infinity to TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0050';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<Array<number>>();
      let arr = [72, 101, NaN, Infinity, 108, 111];
      let result = treeSet.add(arr);
      expect(result).assertTrue();
      expect(treeSet.has(arr)).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_5100
     * @tc.name      testTreeSet03Chapter0051
     * @tc.desc      Add array with mixed types to TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0051';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<Array<number | string | boolean | null | undefined>>();
      let arr: Array<number | string | boolean | null | undefined> = [72, "abc", true, null, undefined, 108];
      let result = treeSet.add(arr);
      expect(result).assertTrue();
      expect(treeSet.has(arr)).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_5200
     * @tc.name      testTreeSet03Chapter0052
     * @tc.desc      Add empty array to TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0052';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<Array<number>>();
      let arr: Array<number> = [];
      let result = treeSet.add(arr);
      expect(result).assertTrue();
      expect(treeSet.has(arr)).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_5300
     * @tc.name      testTreeSet03Chapter0053
     * @tc.desc      Add array with overflow values to TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0053';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<Array<number>>();
      let arr = [256, 65536, 32768];
      let result = treeSet.add(arr);
      expect(result).assertTrue();
      expect(treeSet.has(arr)).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_5400
     * @tc.name      testTreeSet03Chapter0054
     * @tc.desc      Add duplicate string value to TreeSet, expect false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0054';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      treeSet.add("test");
      let result = treeSet.add("test");
      expect(result).assertTrue();
      expect(treeSet.has("test")).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_5500
     * @tc.name      testTreeSet03Chapter0055
     * @tc.desc      Add duplicate number value to TreeSet, expect false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0055';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      let result = treeSet.add(100);
      expect(result).assertTrue();
      expect(treeSet.has(100)).assertTrue();
    });


    /**
     * @tc.number    SUB_TREESET_TEST03_5600
     * @tc.name      testTreeSet03Chapter0056
     * @tc.desc      Add null value to TreeSet, should compile and run
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0056';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number | null>();
      let result = treeSet.add(null);
      expect(result).assertTrue();
      expect(treeSet.has(null)).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_5700
     * @tc.name      testTreeSet03Chapter0057
     * @tc.desc      Add undefined value to TreeSet, should compile and run
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0057';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number | undefined>();
      let result = treeSet.add(undefined);
      expect(result).assertTrue();
      expect(treeSet.has(undefined)).assertTrue();
    });


    /**
     * @tc.number    SUB_TREESET_TEST03_5800
     * @tc.name      testTreeSet03Chapter0058
     * @tc.desc      Add null value to TreeSet<string> should compile but throw error at runtime
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0058';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      let result = treeSet.add(null);
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_5900
     * @tc.name      testTreeSet03Chapter0059
     * @tc.desc      Add undefined value to TreeSet<number> should compile but throw error at runtime
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0059';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      let result = treeSet.add(undefined);
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_6000
     * @tc.name      testTreeSet03Chapter0060
     * @tc.desc      Remove existing string element from TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0060';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<string>();
      treeSet.add("squirrel");
      treeSet.add("sparrow");
      treeSet.add("eagle");
      const result = treeSet.remove("sparrow");
      expect(result).assertTrue();
      expect(treeSet.has("sparrow")).assertFalse();
      expect(treeSet.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_6100
     * @tc.name      testTreeSet03Chapter0061
     * @tc.desc      Remove non-existing string element from TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0061';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<string>();
      treeSet.add("squirrel");
      treeSet.add("sparrow");
      const result = treeSet.remove("eagle");
      expect(result).assertFalse();
      expect(treeSet.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_6200
     * @tc.name      testTreeSet03Chapter0062
     * @tc.desc      Remove empty string from TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0062';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<string>();
      treeSet.add("");
      treeSet.add("sparrow");
      const result = treeSet.remove("");
      expect(result).assertTrue();
      expect(treeSet.has("")).assertFalse();
      expect(treeSet.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_6300
     * @tc.name      testTreeSet03Chapter0063
     * @tc.desc      Remove special characters string from TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0063';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<string>();
      treeSet.add("!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~");
      treeSet.add("normal");
      const result = treeSet.remove("!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~");
      expect(result).assertTrue();
      expect(treeSet.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_6400
     * @tc.name      testTreeSet03Chapter0064
     * @tc.desc      Remove string with escape sequences from TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0064';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<string>();
      treeSet.add("\\n\\t\\r");
      treeSet.add("text");
      const result = treeSet.remove("\\n\\t\\r");
      expect(result).assertTrue();
      expect(treeSet.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_6500
     * @tc.name      testTreeSet03Chapter0065
     * @tc.desc      Remove emoji string from TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0065';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<string>();
      treeSet.add("👆");
      treeSet.add("👿");
      treeSet.add("👀");
      const result = treeSet.remove("👿");
      expect(result).assertTrue();
      expect(treeSet.has("👿")).assertFalse();
      expect(treeSet.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_6600
     * @tc.name      testTreeSet03Chapter0066
     * @tc.desc      Remove existing number element from TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0066';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<number>();
      treeSet.add(1);
      treeSet.add(2);
      treeSet.add(3);
      const result = treeSet.remove(2);
      expect(result).assertTrue();
      expect(treeSet.has(2)).assertFalse();
      expect(treeSet.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_6700
     * @tc.name      testTreeSet03Chapter0067
     * @tc.desc      Remove number 0 from TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0067';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<number>();
      treeSet.add(0);
      treeSet.add(1);
      treeSet.add(-1);
      const result = treeSet.remove(0);
      expect(result).assertTrue();
      expect(treeSet.has(0)).assertFalse();
      expect(treeSet.length).assertEqual(2);
    });


    /**
     * @tc.number    SUB_TREESET_TEST03_6800
     * @tc.name      testTreeSet03Chapter0068
     * @tc.desc      Remove Infinity from TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0068';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<number>();
      treeSet.add(Infinity);
      treeSet.add(1);
      treeSet.add(-Infinity);
      const result = treeSet.remove(Infinity);
      expect(result).assertTrue();
      expect(treeSet.has(Infinity)).assertFalse();
      expect(treeSet.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_6900
     * @tc.name      testTreeSet03Chapter0069
     * @tc.desc      Remove -Infinity from TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0069';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<number>();
      treeSet.add(-Infinity);
      treeSet.add(0);
      treeSet.add(Infinity);
      const result = treeSet.remove(-Infinity);
      expect(result).assertTrue();
      expect(treeSet.has(-Infinity)).assertFalse();
      expect(treeSet.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_7000
     * @tc.name      testTreeSet03Chapter0070
     * @tc.desc      Remove NaN from TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0070';
      console.log(TAG + ' start');
      try {
        const treeSet = new TreeSet<number>();
        treeSet.add(NaN);
        treeSet.add(1);
        treeSet.add(2);
        const result = treeSet.remove(NaN);
        expect(result).assertFalse();
        expect(treeSet.length).assertEqual(3);
      } catch (err) {
        expect(err).assertUndefined();
      }
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_7100
     * @tc.name      testTreeSet03Chapter0071
     * @tc.desc      Remove Number.MAX_VALUE from TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0071';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<number>();
      treeSet.add(Number.MAX_VALUE);
      treeSet.add(Number.MIN_VALUE);
      treeSet.add(0);
      const result = treeSet.remove(Number.MAX_VALUE);
      expect(result).assertTrue();
      expect(treeSet.has(Number.MAX_VALUE)).assertFalse();
      expect(treeSet.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_7200
     * @tc.name      testTreeSet03Chapter0072
     * @tc.desc      Remove Number.MIN_VALUE from TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0072';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<number>();
      treeSet.add(Number.MIN_VALUE);
      treeSet.add(0);
      treeSet.add(1);
      const result = treeSet.remove(Number.MIN_VALUE);
      expect(result).assertTrue();
      expect(treeSet.has(Number.MIN_VALUE)).assertFalse();
      expect(treeSet.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_7300
     * @tc.name      testTreeSet03Chapter0073
     * @tc.desc      Remove Number.MAX_SAFE_INTEGER from TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0073';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<number>();
      treeSet.add(Number.MAX_SAFE_INTEGER);
      treeSet.add(0);
      treeSet.add(Number.MIN_SAFE_INTEGER);
      const result = treeSet.remove(Number.MAX_SAFE_INTEGER);
      expect(result).assertTrue();
      expect(treeSet.has(Number.MAX_SAFE_INTEGER)).assertFalse();
      expect(treeSet.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_7400
     * @tc.name      testTreeSet03Chapter0074
     * @tc.desc      Remove boolean true from TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0074';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<boolean>();
      treeSet.add(true);
      treeSet.add(false);
      const result = treeSet.remove(true);
      expect(result).assertTrue();
      expect(treeSet.has(true)).assertFalse();
      expect(treeSet.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_7500
     * @tc.name      testTreeSet03Chapter0075
     * @tc.desc      Remove boolean false from TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0075';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<boolean>();
      treeSet.add(false);
      treeSet.add(true);
      const result = treeSet.remove(false);
      expect(result).assertTrue();
      expect(treeSet.has(false)).assertFalse();
      expect(treeSet.length).assertEqual(1);
    });


    /**
     * @tc.number    SUB_TREESET_TEST03_7600
     * @tc.name      testTreeSet03Chapter0076
     * @tc.desc      Remove from empty TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0076';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<string>();
      const result = treeSet.remove("element");
      expect(result).assertFalse();
      expect(treeSet.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_7700
     * @tc.name      testTreeSet03Chapter0077
     * @tc.desc      Remove last element from TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0077';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<string>();
      treeSet.add("only");
      const result = treeSet.remove("only");
      expect(result).assertTrue();
      expect(treeSet.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_7800
     * @tc.name      testTreeSet03Chapter0078
     * @tc.desc      Remove element after multiple removals
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0078';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<number>();
      treeSet.add(1);
      treeSet.add(2);
      treeSet.add(3);
      treeSet.add(4);
      treeSet.add(5);
      treeSet.remove(1);
      treeSet.remove(3);
      const result = treeSet.remove(5);
      expect(result).assertTrue();
      expect(treeSet.has(5)).assertFalse();
      expect(treeSet.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_7900
     * @tc.name      testTreeSet03Chapter0079
     * @tc.desc      Remove string undefined from TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0079';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<string>();
      treeSet.add("test");
      treeSet.add(undefined);
      const result = treeSet.remove(undefined);
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_8000
     * @tc.name      testTreeSet03Chapter0080
     * @tc.desc      Remove octal number from TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0080';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<number>();
      treeSet.add(0o10);
      treeSet.add(0o20);
      const result = treeSet.remove(0o10);
      expect(result).assertTrue();
      expect(treeSet.has(0o10)).assertFalse();
      expect(treeSet.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_8100
     * @tc.name      testTreeSet03Chapter0081
     * @tc.desc      Remove exponential operator result from TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0081';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<number>();
      treeSet.add(2**3);
      treeSet.add(3**2);
      const result = treeSet.remove(8);
      expect(result).assertTrue();
      expect(treeSet.has(8)).assertFalse();
      expect(treeSet.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_8200
     * @tc.name      testTreeSet03Chapter0082
     * @tc.desc      Remove scientific notation number from TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0082';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<number>();
      treeSet.add(1e3);
      treeSet.add(2.5e-2);
      const result = treeSet.remove(1000);
      expect(result).assertTrue();
      expect(treeSet.has(1000)).assertFalse();
      expect(treeSet.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_8300
     * @tc.name      testTreeSet03Chapter0083
     * @tc.desc      Remove bigint from TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0083';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<bigint>();
      treeSet.add(9007199254740991n);
      treeSet.add(1234567890123456789n);
      const result = treeSet.remove(9007199254740991n);
      expect(result).assertTrue();
      expect(treeSet.has(9007199254740991n)).assertFalse();
      expect(treeSet.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_8400
     * @tc.name      testTreeSet03Chapter0084
     * @tc.desc      Remove float number from TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0084';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<number>();
      treeSet.add(0.1);
      treeSet.add(0.2);
      treeSet.add(0.3);
      const result = treeSet.remove(0.2);
      expect(result).assertTrue();
      expect(treeSet.has(0.2)).assertFalse();
      expect(treeSet.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_8500
     * @tc.name      testTreeSet03Chapter0085
     * @tc.desc      Remove array from TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0085';
      console.log(TAG + ' start');
      const arr1 = [1, 2, 3];
      const arr2 = [4, 5, 6];
      const treeSet = new TreeSet<Array<number>>();
      treeSet.add(arr1);
      treeSet.add(arr2);
      const result = treeSet.remove(arr1);
      expect(result).assertTrue();
      expect(treeSet.has(arr1)).assertFalse();
      expect(treeSet.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_8600
     * @tc.name      testTreeSet03Chapter0086
     * @tc.desc      Remove array with different reference from TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0086';
      console.log(TAG + ' start');
      const arr1 = [1, 2, 3];
      const arr2 = [1, 2, 3];
      const treeSet = new TreeSet<Array<number>>();
      treeSet.add(arr1);
      const result = treeSet.remove(arr2);
      expect(result).assertTrue();
      expect(treeSet.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_8700
     * @tc.name      testTreeSet03Chapter0087
     * @tc.desc      Test getLowerValue with empty TreeSet, return undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0087';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      let result = treeSet.getLowerValue(5);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_8800
     * @tc.name      testTreeSet03Chapter0088
     * @tc.desc      Test getLowerValue when key is the smallest element in TreeSet, return undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0088';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(1);
      treeSet.add(3);
      treeSet.add(5);
      let result = treeSet.getLowerValue(1);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_8900
     * @tc.name      testTreeSet03Chapter0089
     * @tc.desc      Test getLowerValue when key is the largest element in TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0089';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(1);
      treeSet.add(3);
      treeSet.add(5);
      let result = treeSet.getLowerValue(5);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_9000
     * @tc.name      testTreeSet03Chapter0090
     * @tc.desc      Test getLowerValue when key is in the middle of TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0090';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      treeSet.add("apple");
      treeSet.add("banana");
      treeSet.add("cherry");
      treeSet.add("date");
      let result = treeSet.getLowerValue("cherry");
      expect(result).assertEqual("banana");
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_9100
     * @tc.name      testTreeSet03Chapter0091
     * @tc.desc      Test getLowerValue when key not in TreeSet but smaller element exists
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0091';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(10);
      treeSet.add(20);
      treeSet.add(30);
      let result = treeSet.getLowerValue(25);
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_9200
     * @tc.name      testTreeSet03Chapter0092
     * @tc.desc      Test getLowerValue when key not in TreeSet and no smaller element exists
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0092';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(10);
      treeSet.add(20);
      treeSet.add(30);
      let result = treeSet.getLowerValue(5);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_9300
     * @tc.name      testTreeSet03Chapter0093
     * @tc.desc      Test getLowerValue with boundary values of Int8Array range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0093';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(-128);
      treeSet.add(0);
      treeSet.add(127);
      let result1 = treeSet.getLowerValue(127);
      expect(result1).assertEqual(0);
      let result2 = treeSet.getLowerValue(0);
      expect(result2).assertEqual(-128);
      let result3 = treeSet.getLowerValue(-128);
      expect(result3).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_9400
     * @tc.name      testTreeSet03Chapter0094
     * @tc.desc      Test getLowerValue with out of bounds values of Int8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0094';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(-129);
      treeSet.add(128);
      treeSet.add(0);
      let result1 = treeSet.getLowerValue(128);
      expect(result1).assertEqual(0);
      let result2 = treeSet.getLowerValue(0);
      expect(result2).assertEqual(-129);
      let result3 = treeSet.getLowerValue(-129);
      expect(result3).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_9500
     * @tc.name      testTreeSet03Chapter0095
     * @tc.desc      Test getLowerValue with boundary values of Uint8Array range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0095';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(0);
      treeSet.add(100);
      treeSet.add(255);
      let result1 = treeSet.getLowerValue(255);
      expect(result1).assertEqual(100);
      let result2 = treeSet.getLowerValue(0);
      expect(result2).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_9600
     * @tc.name      testTreeSet03Chapter0096
     * @tc.desc      Test getLowerValue with out of bounds values of Uint8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0096';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(-1);
      treeSet.add(256);
      treeSet.add(50);
      let result1 = treeSet.getLowerValue(256);
      expect(result1).assertEqual(50);
      let result2 = treeSet.getLowerValue(50);
      expect(result2).assertEqual(-1);
      let result3 = treeSet.getLowerValue(-1);
      expect(result3).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREESET_TEST03_9700
     * @tc.name      testTreeSet03Chapter0097
     * @tc.desc      Test getLowerValue with boundary values of Int16Array range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet03Chapter0097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet03Chapter0097';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(-32768);
      treeSet.add(0);
      treeSet.add(32767);
      let result1 = treeSet.getLowerValue(32767);
      expect(result1).assertEqual(0);
      let result2 = treeSet.getLowerValue(0);
      expect(result2).assertEqual(-32768);
    });
  })
}