import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Deque } from '@kit.ArkTS';
import { hilog } from '@kit.PerformanceAnalysisKit';

interface SimpleTestObject {
  a: number;
  b: string;
  c: boolean;
}

interface NestedTestObjectLevel3 {
  e: number;
}

interface NestedTestObjectLevel2 {
  c: number;
  d: NestedTestObjectLevel3;
}

interface NestedTestObject {
  a: number;
  b: NestedTestObjectLevel2;
}

interface ObjectWithUndefined {
  a: undefined;
  b: number;
}

interface ObjectWithNull {
  a: null;
  b: number;
}

interface ObjectWithNaN {
  a: number;
  b: number;
}

interface ObjectWithInfinity {
  a: number;
  b: number;
  c: number;
}

interface EmptyTestObject {
}

type MixedArrayElement = number | string | boolean | null | undefined;

type NullableElement = number | string | boolean | null | undefined;

type MixedDequeElement = number | string | boolean;

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function dequeArraylistInsertFront01Test() {
  describe('dequeArraylistInsertFront01Test', () => {
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
     * @tc.number    SUB_ARRAYLIST_INSERTFRONT01_0100
     * @tc.name      testArraylistInsertFront01NumberBasic0001
     * @tc.desc      insert normal positive integer to deque front
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylistInsertFront01NumberBasic0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testArraylistInsertFront01NumberBasic0001';
        console.log(TAG + ' start');

        let deque = new Deque<number>();
        deque.insertFront(42);
        expect(deque.getFirst()).assertEqual(42);
        expect(deque.length).assertEqual(1);

        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERTFRONT01_0200
     * @tc.name      testArraylistInsertFront01NumberZero0002
     * @tc.desc      insert number zero to deque front
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylistInsertFront01NumberZero0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testArraylistInsertFront01NumberZero0002';
        console.log(TAG + ' start');

        let deque = new Deque<number>();
        deque.insertFront(0);
        expect(deque.getFirst()).assertEqual(0);
        expect(deque.length).assertEqual(1);

        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERTFRONT01_0300
     * @tc.name      testArraylistInsertFront01NumberNegativeZero0003
     * @tc.desc      insert negative zero to deque front (verify -0 equals 0 in JS/ArkTS)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylistInsertFront01NumberNegativeZero0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testArraylistInsertFront01NumberNegativeZero0003';
        console.log(TAG + ' start');

        let deque = new Deque<number>();
        deque.insertFront(-0);
        expect(deque.getFirst()).assertEqual(0);
        expect(deque.length).assertEqual(1);

        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERTFRONT01_0400
     * @tc.name      testArraylistInsertFront01NumberNegative0004
     * @tc.desc      insert negative integer to deque front
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylistInsertFront01NumberNegative0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testArraylistInsertFront01NumberNegative0004';
        console.log(TAG + ' start');

        let deque = new Deque<number>();
        deque.insertFront(-50);
        expect(deque.getFirst()).assertEqual(-50);
        expect(deque.length).assertEqual(1);

        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERTFRONT01_0500
     * @tc.name      testArraylistInsertFront01NumberFloat0005
     * @tc.desc      insert floating point number to deque front
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylistInsertFront01NumberFloat0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testArraylistInsertFront01NumberFloat0005';
        console.log(TAG + ' start');

        let deque = new Deque<number>();
        deque.insertFront(3.14159);
        expect(deque.getFirst()).assertEqual(3.14159);
        expect(deque.length).assertEqual(1);

        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERTFRONT01_0600
     * @tc.name      testArraylistInsertFront01NumberNaN0006
     * @tc.desc      insert NaN to deque front
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylistInsertFront01NumberNaN0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testArraylistInsertFront01NumberNaN0006';
        console.log(TAG + ' start');

        let deque = new Deque<number>();
        deque.insertFront(NaN);
        expect(isNaN(deque.getFirst() as number)).assertTrue();
        expect(deque.length).assertEqual(1);

        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERTFRONT01_0700
     * @tc.name      testArraylistInsertFront01NumberInfinity0007
     * @tc.desc      insert positive Infinity to deque front
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylistInsertFront01NumberInfinity0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testArraylistInsertFront01NumberInfinity0007';
        console.log(TAG + ' start');

        let deque = new Deque<number>();
        deque.insertFront(Infinity);
        expect(deque.getFirst()).assertEqual(Infinity);
        expect(deque.length).assertEqual(1);

        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERTFRONT01_0800
     * @tc.name      testArraylistInsertFront01NumberNegativeInfinity0008
     * @tc.desc      insert negative Infinity to deque front
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylistInsertFront01NumberNegativeInfinity0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testArraylistInsertFront01NumberNegativeInfinity0008';
        console.log(TAG + ' start');

        let deque = new Deque<number>();
        deque.insertFront(-Infinity);
        expect(deque.getFirst()).assertEqual(-Infinity);
        expect(deque.length).assertEqual(1);

        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERTFRONT01_0900
     * @tc.name      testArraylistInsertFront01NumberMaxValue0009
     * @tc.desc      insert Number.MAX_VALUE to deque front
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylistInsertFront01NumberMaxValue0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testArraylistInsertFront01NumberMaxValue0009';
        console.log(TAG + ' start');

        let deque = new Deque<number>();
        deque.insertFront(Number.MAX_VALUE);
        expect(deque.getFirst()).assertEqual(Number.MAX_VALUE);
        expect(deque.length).assertEqual(1);

        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERTFRONT01_1000
     * @tc.name      testArraylistInsertFront01NumberMinValue0010
     * @tc.desc      insert Number.MIN_VALUE to deque front
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylistInsertFront01NumberMinValue0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testArraylistInsertFront01NumberMinValue0010';
        console.log(TAG + ' start');

        let deque = new Deque<number>();
        deque.insertFront(Number.MIN_VALUE);
        expect(deque.getFirst()).assertEqual(Number.MIN_VALUE);
        expect(deque.length).assertEqual(1);

        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERTFRONT01_1100
     * @tc.name      testArraylistInsertFront01NumberEpsilon0011
     * @tc.desc      insert Number.EPSILON to deque front
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylistInsertFront01NumberEpsilon0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testArraylistInsertFront01NumberEpsilon0011';
        console.log(TAG + ' start');

        let deque = new Deque<number>();
        deque.insertFront(Number.EPSILON);
        expect(deque.getFirst()).assertEqual(Number.EPSILON);
        expect(deque.length).assertEqual(1);

        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERTFRONT01_1200
     * @tc.name      testArraylistInsertFront01NumberMaxSafeInteger0012
     * @tc.desc      insert Number.MAX_SAFE_INTEGER to deque front
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylistInsertFront01NumberMaxSafeInteger0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testArraylistInsertFront01NumberMaxSafeInteger0012';
        console.log(TAG + ' start');

        let deque = new Deque<number>();
        deque.insertFront(Number.MAX_SAFE_INTEGER);
        expect(deque.getFirst()).assertEqual(Number.MAX_SAFE_INTEGER);
        expect(deque.length).assertEqual(1);

        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERTFRONT01_1300
     * @tc.name      testArraylistInsertFront01NumberHex0013
     * @tc.desc      insert hexadecimal number to deque front (verify conversion to decimal)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylistInsertFront01NumberHex0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testArraylistInsertFront01NumberHex0013';
        console.log(TAG + ' start');

        let deque = new Deque<number>();
        deque.insertFront(0x0102);
        expect(deque.getFirst()).assertEqual(258);
        expect(deque.length).assertEqual(1);

        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERTFRONT01_1400
     * @tc.name      testArraylistInsertFront01NumberOctal0014
     * @tc.desc      insert octal number to deque front (verify conversion to decimal)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylistInsertFront01NumberOctal0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testArraylistInsertFront01NumberOctal0014';
        console.log(TAG + ' start');

        let deque = new Deque<number>();
        deque.insertFront(0o377);
        expect(deque.getFirst()).assertEqual(255);
        expect(deque.length).assertEqual(1);

        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERTFRONT01_1500
     * @tc.name      testArraylistInsertFront01NumberExponent0015
     * @tc.desc      insert exponent calculation result to deque front
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylistInsertFront01NumberExponent0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testArraylistInsertFront01NumberExponent0015';
        console.log(TAG + ' start');

        let deque = new Deque<number>();
        deque.insertFront(2 ** 3);
        expect(deque.getFirst()).assertEqual(8);
        expect(deque.length).assertEqual(1);

        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERTFRONT01_1600
     * @tc.name      testArraylistInsertFront01NumberScientific0016
     * @tc.desc      insert scientific notation number to deque front (verify conversion to decimal)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylistInsertFront01NumberScientific0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testArraylistInsertFront01NumberScientific0016';
        console.log(TAG + ' start');

        let deque = new Deque<number>();
        deque.insertFront(1e3);
        expect(deque.getFirst()).assertEqual(1000);
        expect(deque.length).assertEqual(1);

        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERTFRONT01_1700
     * @tc.name      testArraylistInsertFront01StringEmpty0017
     * @tc.desc      insert empty string to deque front
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylistInsertFront01StringEmpty0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testArraylistInsertFront01StringEmpty0017';
        console.log(TAG + ' start');

        let deque = new Deque<string>();
        deque.insertFront("");
        expect(deque.getFirst()).assertEqual("");
        expect(deque.length).assertEqual(1);

        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERTFRONT01_1800
     * @tc.name      testArraylistInsertFront01StringNormal0018
     * @tc.desc      insert normal text string to deque front
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylistInsertFront01StringNormal0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testArraylistInsertFront01StringNormal0018';
        console.log(TAG + ' start');

        let deque = new Deque<string>();
        deque.insertFront("Hello World");
        expect(deque.getFirst()).assertEqual("Hello World");
        expect(deque.length).assertEqual(1);

        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERTFRONT01_1900
     * @tc.name      testArraylistInsertFront01StringSpecialChars0019
     * @tc.desc      insert special characters string to deque front
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylistInsertFront01StringSpecialChars0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testArraylistInsertFront01StringSpecialChars0019';
        console.log(TAG + ' start');

        let deque = new Deque<string>();
        const specialChars = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
        deque.insertFront(specialChars);
        expect(deque.getFirst()).assertEqual(specialChars);
        expect(deque.length).assertEqual(1);

        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERTFRONT01_2000
     * @tc.name      testArraylistInsertFront01StringAsciiChars0020
     * @tc.desc      insert full ASCII characters string to deque front
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylistInsertFront01StringAsciiChars0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testArraylistInsertFront01StringAsciiChars0020';
        console.log(TAG + ' start');

        let deque = new Deque<string>();
        const asciiChars = "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
        deque.insertFront(asciiChars);
        expect(deque.getFirst()).assertEqual(asciiChars);
        expect(deque.length).assertEqual(1);

        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERTFRONT01_2100
     * @tc.name      testArraylistInsertFront01StringEscapeChars0021
     * @tc.desc      insert escape characters string to deque front
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylistInsertFront01StringEscapeChars0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testArraylistInsertFront01StringEscapeChars0021';
        console.log(TAG + ' start');

        let deque = new Deque<string>();
        const escapeChars = "\\a\\b\\f\\n\\r\\t\\v\\\\\\'\\\"\\?\\0\\x41";
        deque.insertFront(escapeChars);
        expect(deque.getFirst()).assertEqual(escapeChars);
        expect(deque.length).assertEqual(1);

        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERTFRONT01_2200
     * @tc.name      testArraylistInsertFront01StringEmoji0022
     * @tc.desc      insert emoji string to deque front
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylistInsertFront01StringEmoji0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testArraylistInsertFront01StringEmoji0022';
        console.log(TAG + ' start');

        let deque = new Deque<string>();
        deque.insertFront("👆");
        expect(deque.getFirst()).assertEqual("👆");
        expect(deque.length).assertEqual(1);

        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERTFRONT01_2300
     * @tc.name      testArraylistInsertFront01StringUnicode0023
     * @tc.desc      insert Unicode string to deque front
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylistInsertFront01StringUnicode0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testArraylistInsertFront01StringUnicode0023';
        console.log(TAG + ' start');

        let deque = new Deque<string>();
        deque.insertFront("\\ud83d\\udc46");
        expect(deque.getFirst()).assertEqual("\\ud83d\\udc46");
        expect(deque.length).assertEqual(1);

        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERTFRONT01_2400
     * @tc.name      testArraylistInsertFront01StringKeywordNaN0024
     * @tc.desc      insert "NaN" string to deque front (distinguish from Number.NaN)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylistInsertFront01StringKeywordNaN0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testArraylistInsertFront01StringKeywordNaN0024';
        console.log(TAG + ' start');

        let deque = new Deque<string>();
        deque.insertFront("NaN");
        expect(deque.getFirst()).assertEqual("NaN");
        expect(deque.length).assertEqual(1);

        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERTFRONT01_2500
     * @tc.name      testArraylistInsertFront01StringKeywordUndefined0025
     * @tc.desc      insert "undefined" string to deque front (distinguish from undefined value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylistInsertFront01StringKeywordUndefined0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testArraylistInsertFront01StringKeywordUndefined0025';
        console.log(TAG + ' start');

        let deque = new Deque<string>();
        deque.insertFront("undefined");
        expect(deque.getFirst()).assertEqual("undefined");
        expect(deque.length).assertEqual(1);

        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERTFRONT01_2600
     * @tc.name      testArraylistInsertFront01BooleanTrue0026
     * @tc.desc      insert boolean true to deque front
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylistInsertFront01BooleanTrue0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testArraylistInsertFront01BooleanTrue0026';
        console.log(TAG + ' start');

        let deque = new Deque<boolean>();
        deque.insertFront(true);
        expect(deque.getFirst()).assertTrue();
        expect(deque.length).assertEqual(1);

        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERTFRONT01_2700
     * @tc.name      testArraylistInsertFront01BooleanFalse0027
     * @tc.desc      insert boolean false to deque front
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylistInsertFront01BooleanFalse0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testArraylistInsertFront01BooleanFalse0027';
        console.log(TAG + ' start');

        let deque = new Deque<boolean>();
        deque.insertFront(false);
        expect(deque.getFirst()).assertFalse();
        expect(deque.length).assertEqual(1);

        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERTFRONT01_2800
     * @tc.name      testArraylistInsertFront01ArrayNormal0028
     * @tc.desc      insert normal number array to deque front
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylistInsertFront01ArrayNormal0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testArraylistInsertFront01ArrayNormal0028';
        console.log(TAG + ' start');

        let deque = new Deque<number[]>();
        const array: number[] = [1, 2, 3, 4, 5];
        deque.insertFront(array);
        expect(deque.getFirst()).assertDeepEquals(array);
        expect(deque.length).assertEqual(1);

        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERTFRONT01_2900
     * @tc.name      testArraylistInsertFront01ArrayWithZeros0029
     * @tc.desc      insert array with multiple zeros to deque front
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylistInsertFront01ArrayWithZeros0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testArraylistInsertFront01ArrayWithZeros0029';
        console.log(TAG + ' start');

        let deque = new Deque<number[]>();
        const array: number[] = [0, 0, 0, 1, 2, 3];
        deque.insertFront(array);
        expect(deque.getFirst()).assertDeepEquals(array);
        expect(deque.length).assertEqual(1);

        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERTFRONT01_3000
     * @tc.name      testArraylistInsertFront01ArrayWithNegatives0030
     * @tc.desc      insert array with negative numbers to deque front
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylistInsertFront01ArrayWithNegatives0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testArraylistInsertFront01ArrayWithNegatives0030';
        console.log(TAG + ' start');

        let deque = new Deque<number[]>();
        const array: number[] = [-1, -2, -3, 1, 2, 3];
        deque.insertFront(array);
        expect(deque.getFirst()).assertDeepEquals(array);
        expect(deque.length).assertEqual(1);

        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERTFRONT01_3100
     * @tc.name      testArraylistInsertFront01ArrayEmpty0031
     * @tc.desc      insert empty array to deque front
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylistInsertFront01ArrayEmpty0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testArraylistInsertFront01ArrayEmpty0031';
        console.log(TAG + ' start');

        let deque = new Deque<MixedArrayElement[]>();
        const array: MixedArrayElement[] = [];
        deque.insertFront(array);
        expect(deque.getFirst()).assertDeepEquals(array);
        expect(deque.length).assertEqual(1);

        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERTFRONT01_3200
     * @tc.name      testArraylistInsertFront01ArrayWithNaN0032
     * @tc.desc      insert array with NaN to deque front
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylistInsertFront01ArrayWithNaN0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testArraylistInsertFront01ArrayWithNaN0032';
        console.log(TAG + ' start');

        let deque = new Deque<number[]>();
        const array: number[] = [NaN, 1, 2, 3];
        deque.insertFront(array);
        const result = deque.getFirst() as number[];
        expect(isNaN(result[0])).assertTrue();
        expect(result[1]).assertEqual(1);
        expect(result[2]).assertEqual(2);
        expect(result[3]).assertEqual(3);
        expect(deque.length).assertEqual(1);

        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERTFRONT01_3300
     * @tc.name      testArraylistInsertFront01ArrayWithInfinity0033
     * @tc.desc      insert array with Infinity to deque front
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylistInsertFront01ArrayWithInfinity0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testArraylistInsertFront01ArrayWithInfinity0033';
        console.log(TAG + ' start');

        let deque = new Deque<number[]>();
        const array: number[] = [Infinity, -Infinity, 1, 2, 3];
        deque.insertFront(array);
        const result = deque.getFirst() as number[];
        expect(result[0]).assertEqual(Infinity);
        expect(result[1]).assertEqual(-Infinity);
        expect(result[2]).assertEqual(1);
        expect(result[3]).assertEqual(2);
        expect(result[4]).assertEqual(3);
        expect(deque.length).assertEqual(1);

        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERTFRONT01_3400
     * @tc.name      testArraylistInsertFront01ArrayMixedTypes0034
     * @tc.desc      insert array with mixed types to deque front
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylistInsertFront01ArrayMixedTypes0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testArraylistInsertFront01ArrayMixedTypes0034';
        console.log(TAG + ' start');

        let deque = new Deque<MixedArrayElement[]>();
        const array: MixedArrayElement[] = [1, "string", true, null, undefined];
        deque.insertFront(array);
        expect(deque.getFirst()).assertDeepEquals(array);
        expect(deque.length).assertEqual(1);

        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERTFRONT01_3500
     * @tc.name      testArraylistInsertFront01ObjectSimple0035
     * @tc.desc      insert simple key-value object to deque front
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylistInsertFront01ObjectSimple0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testArraylistInsertFront01ObjectSimple0035';
        console.log(TAG + ' start');

        let deque = new Deque<SimpleTestObject>();
        const obj: SimpleTestObject = { a: 1, b: "test", c: true };
        deque.insertFront(obj);
        expect(JSON.stringify(deque.getFirst())).assertEqual(JSON.stringify(obj));
        expect(deque.length).assertEqual(1);

        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERTFRONT01_3600
     * @tc.name      testArraylistInsertFront01ObjectNested0036
     * @tc.desc      insert nested object to deque front
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylistInsertFront01ObjectNested0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testArraylistInsertFront01ObjectNested0036';
        console.log(TAG + ' start');

        let deque = new Deque<NestedTestObject>();
        const nestedLevel3: NestedTestObjectLevel3 = { e: 3 };
        const nestedLevel2: NestedTestObjectLevel2 = { c: 2, d: nestedLevel3 };
        const obj: NestedTestObject = { a: 1, b: nestedLevel2 };

        deque.insertFront(obj);
        expect(JSON.stringify(deque.getFirst())).assertEqual(JSON.stringify(obj));
        expect(deque.length).assertEqual(1);

        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERTFRONT01_3700
     * @tc.name      testArraylistInsertFront01ObjectEmpty0037
     * @tc.desc      insert empty object to deque front
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylistInsertFront01ObjectEmpty0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testArraylistInsertFront01ObjectEmpty0037';
        console.log(TAG + ' start');

        let deque = new Deque<EmptyTestObject>();
        const obj: EmptyTestObject = {};
        deque.insertFront(obj);
        expect(Object.keys(deque.getFirst() as EmptyTestObject).length).assertEqual(0);
        expect(deque.length).assertEqual(1);

        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERTFRONT01_3800
     * @tc.name      testArraylistInsertFront01ObjectWithUndefined0038
     * @tc.desc      insert object with undefined property to deque front
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylistInsertFront01ObjectWithUndefined0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testArraylistInsertFront01ObjectWithUndefined0038';
        console.log(TAG + ' start');

        let deque = new Deque<ObjectWithUndefined>();
        const obj: ObjectWithUndefined = { a: undefined, b: 1 };
        deque.insertFront(obj);
        expect(JSON.stringify(deque.getFirst())).assertEqual(JSON.stringify(obj));
        expect(deque.length).assertEqual(1);

        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERTFRONT01_3900
     * @tc.name      testArraylistInsertFront01ObjectWithNull0039
     * @tc.desc      insert object with null property to deque front
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylistInsertFront01ObjectWithNull0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testArraylistInsertFront01ObjectWithNull0039';
        console.log(TAG + ' start');

        let deque = new Deque<ObjectWithNull>();
        const obj: ObjectWithNull = { a: null, b: 1 };
        deque.insertFront(obj);
        expect(JSON.stringify(deque.getFirst())).assertEqual(JSON.stringify(obj));
        expect(deque.length).assertEqual(1);

        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERTFRONT01_4000
     * @tc.name      testArraylistInsertFront01ObjectWithNaN0040
     * @tc.desc      insert object with NaN property to deque front
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylistInsertFront01ObjectWithNaN0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testArraylistInsertFront01ObjectWithNaN0040';
        console.log(TAG + ' start');

        let deque = new Deque<ObjectWithNaN>();
        const obj: ObjectWithNaN = { a: NaN, b: 1 };
        deque.insertFront(obj);
        const result = deque.getFirst() as ObjectWithNaN;
        expect(isNaN(result.a)).assertTrue();
        expect(result.b).assertEqual(1);
        expect(deque.length).assertEqual(1);

        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERTFRONT01_4100
     * @tc.name      testArraylistInsertFront01ObjectWithInfinity0041
     * @tc.desc      insert object with Infinity property to deque front
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylistInsertFront01ObjectWithInfinity0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testArraylistInsertFront01ObjectWithInfinity0041';
        console.log(TAG + ' start');

        let deque = new Deque<ObjectWithInfinity>();
        const obj: ObjectWithInfinity = { a: Infinity, b: -Infinity, c: 1 };
        deque.insertFront(obj);
        const result = deque.getFirst() as ObjectWithInfinity;
        expect(result.a).assertEqual(Infinity);
        expect(result.b).assertEqual(-Infinity);
        expect(result.c).assertEqual(1);
        expect(deque.length).assertEqual(1);

        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERTFRONT01_4200
     * @tc.name      testArraylistInsertFront01Null0042
     * @tc.desc      insert null value to deque front
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylistInsertFront01Null0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testArraylistInsertFront01Null0042';
        console.log(TAG + ' start');

        let deque = new Deque<NullableElement>();
        deque.insertFront(null);
        expect(deque.getFirst()).assertNull();
        expect(deque.length).assertEqual(1);

        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERTFRONT01_4300
     * @tc.name      testArraylistInsertFront01Undefined0043
     * @tc.desc      insert undefined value to deque front
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylistInsertFront01Undefined0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testArraylistInsertFront01Undefined0043';
        console.log(TAG + ' start');

        let deque = new Deque<NullableElement>();
        deque.insertFront(undefined);
        expect(deque.getFirst()).assertUndefined();
        expect(deque.length).assertEqual(1);

        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERTFRONT01_4400
     * @tc.name      testArraylistInsertFront01Int8Array0044
     * @tc.desc      insert Int8Array to deque front
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylistInsertFront01Int8Array0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testArraylistInsertFront01Int8Array0044';
        console.log(TAG + ' start');

        let deque = new Deque<Int8Array>();
        const typedArray = new Int8Array([-128, 127, 0, 50]);
        deque.insertFront(typedArray);
        expect(Array.from(deque.getFirst() as Int8Array)).assertDeepEquals([-128, 127, 0, 50]);
        expect(deque.length).assertEqual(1);

        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERTFRONT01_4500
     * @tc.name      testArraylistInsertFront01Uint8Array0045
     * @tc.desc      insert Uint8Array to deque front
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylistInsertFront01Uint8Array0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testArraylistInsertFront01Uint8Array0045';
        console.log(TAG + ' start');

        let deque = new Deque<Uint8Array>();
        const typedArray = new Uint8Array([0, 255, 100, 200]);
        deque.insertFront(typedArray);
        expect(Array.from(deque.getFirst() as Uint8Array)).assertDeepEquals([0, 255, 100, 200]);
        expect(deque.length).assertEqual(1);

        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERTFRONT01_4600
     * @tc.name      testArraylistInsertFront01Uint8ClampedArray0046
     * @tc.desc      insert Uint8ClampedArray to deque front (verify value clamping)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylistInsertFront01Uint8ClampedArray0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testArraylistInsertFront01Uint8ClampedArray0046';
        console.log(TAG + ' start');

        let deque = new Deque<Uint8ClampedArray>();
        const typedArray = new Uint8ClampedArray([-1, 0, 255, 256, 100]);
        deque.insertFront(typedArray);
        expect(Array.from(deque.getFirst() as Uint8ClampedArray)).assertDeepEquals([0, 0, 255, 255, 100]);
        expect(deque.length).assertEqual(1);

        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERTFRONT01_4700
     * @tc.name      testArraylistInsertFront01Int16Array0047
     * @tc.desc      insert Int16Array to deque front
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylistInsertFront01Int16Array0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testArraylistInsertFront01Int16Array0047';
        console.log(TAG + ' start');

        let deque = new Deque<Int16Array>();
        const typedArray = new Int16Array([-32768, 32767, 0, 1000]);
        deque.insertFront(typedArray);
        expect(Array.from(deque.getFirst() as Int16Array)).assertDeepEquals([-32768, 32767, 0, 1000]);
        expect(deque.length).assertEqual(1);

        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERTFRONT01_4800
     * @tc.name      testArraylistInsertFront01Uint16Array0048
     * @tc.desc      insert Uint16Array to deque front
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylistInsertFront01Uint16Array0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testArraylistInsertFront01Uint16Array0048';
        console.log(TAG + ' start');

        let deque = new Deque<Uint16Array>();
        const typedArray = new Uint16Array([0, 65535, 1000, 2000]);
        deque.insertFront(typedArray);
        expect(Array.from(deque.getFirst() as Uint16Array)).assertDeepEquals([0, 65535, 1000, 2000]);
        expect(deque.length).assertEqual(1);

        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERTFRONT01_4900
     * @tc.name      testArraylistInsertFront01Int32Array0049
     * @tc.desc      insert Int32Array to deque front
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylistInsertFront01Int32Array0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testArraylistInsertFront01Int32Array0049';
        console.log(TAG + ' start');

        let deque = new Deque<Int32Array>();
        const typedArray = new Int32Array([-2147483648, 2147483647, 0, 100000]);
        deque.insertFront(typedArray);
        expect(Array.from(deque.getFirst() as Int32Array)).assertDeepEquals([-2147483648, 2147483647, 0, 100000]);
        expect(deque.length).assertEqual(1);

        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERTFRONT01_5000
     * @tc.name      testArraylistInsertFront01Uint32Array0050
     * @tc.desc      insert Uint32Array to deque front
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylistInsertFront01Uint32Array0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testArraylistInsertFront01Uint32Array0050';
        console.log(TAG + ' start');

        let deque = new Deque<Uint32Array>();
        const typedArray = new Uint32Array([0, 4294967295, 100000, 200000]);
        deque.insertFront(typedArray);
        expect(Array.from(deque.getFirst() as Uint32Array)).assertDeepEquals([0, 4294967295, 100000, 200000]);
        expect(deque.length).assertEqual(1);

        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERTFRONT01_5100
     * @tc.name      testArraylistInsertFront01Float32Array0051
     * @tc.desc      insert Float32Array to deque front
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylistInsertFront01Float32Array0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testArraylistInsertFront01Float32Array0051';
        console.log(TAG + ' start');

        let deque = new Deque<Float32Array>();
        const typedArray = new Float32Array([-3.4028234663852886e38, 3.4028234663852886e38, 0, 1.5]);
        deque.insertFront(typedArray);
        const result = deque.getFirst() as Float32Array;
        expect(result[0]).assertEqual(-3.4028234663852886e38);
        expect(result[1]).assertEqual(3.4028234663852886e38);
        expect(result[2]).assertEqual(0);
        expect(result[3]).assertEqual(1.5);
        expect(deque.length).assertEqual(1);

        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERTFRONT01_5200
     * @tc.name      testArraylistInsertFront01Float64Array0052
     * @tc.desc      insert Float64Array to deque front
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylistInsertFront01Float64Array0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testArraylistInsertFront01Float64Array0052';
        console.log(TAG + ' start');

        let deque = new Deque<Float64Array>();
        const typedArray = new Float64Array([-1.7976931348623157e308, 1.7976931348623157e308, 0, 1.5]);
        deque.insertFront(typedArray);
        const result = deque.getFirst() as Float64Array;
        expect(result[0]).assertEqual(-1.7976931348623157e308);
        expect(result[1]).assertEqual(1.7976931348623157e308);
        expect(result[2]).assertEqual(0);
        expect(result[3]).assertEqual(1.5);
        expect(deque.length).assertEqual(1);

        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERTFRONT01_5300
     * @tc.name      testArraylistInsertFront01MultipleElements0053
     * @tc.desc      insert multiple elements to deque front (verify order)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylistInsertFront01MultipleElements0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testArraylistInsertFront01MultipleElements0053';
        console.log(TAG + ' start');

        let deque = new Deque<number>();
        deque.insertFront(1);
        deque.insertFront(2);
        deque.insertFront(3);

        expect(deque.getFirst()).assertEqual(3);
        expect(deque.length).assertEqual(3);

        // 验证顺序
        expect(deque.popFirst()).assertEqual(3);
        expect(deque.popFirst()).assertEqual(2);
        expect(deque.popFirst()).assertEqual(1);

        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERTFRONT01_5400
     * @tc.name      testArraylistInsertFront01MixedTypes0054
     * @tc.desc      insert mixed types to deque front (using explicit union type)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylistInsertFront01MixedTypes0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testArraylistInsertFront01MixedTypes0054';
        console.log(TAG + ' start');

        // 使用明确的联合类型代替 any
        let deque = new Deque<MixedDequeElement>();

        deque.insertFront(42);
        expect(deque.getFirst()).assertEqual(42);

        deque.insertFront("Hello");
        expect(deque.getFirst()).assertEqual("Hello");

        deque.insertFront(true);
        expect(deque.getFirst()).assertTrue();

        expect(deque.length).assertEqual(3);

        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERTFRONT01_5500
     * @tc.name      testArraylistInsertFront01Performance0055
     * @tc.desc      performance test: insert large quantity of elements to deque front
     * @tc.size      LargeTest
     * @tc.type      Performance
     * @tc.level     Level 2
     */
    it("testArraylistInsertFront01Performance0055", TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL2, (): void => {
        const TAG = 'testArraylistInsertFront01Performance0055';
        console.log(TAG + ' start');

        let deque = new Deque<number>();
        const startTime = new Date().getTime();

        const count = 10000;
        for (let i = 0; i < count; i++) {
          deque.insertFront(i);
        }

        const endTime = new Date().getTime();
        const duration = endTime - startTime;

        expect(deque.length).assertEqual(count);
        console.info(`Inserted ${count} elements in ${duration}ms`);

        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERTFRONT01_5600
     * @tc.name      testArraylistInsertFront01LargeString0056
     * @tc.desc      performance test: insert large string to deque front
     * @tc.size      LargeTest
     * @tc.type      Performance
     * @tc.level     Level 2
     */
    it("testArraylistInsertFront01LargeString0056", TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL2, (): void => {
        const TAG = 'testArraylistInsertFront01LargeString0056';
        console.log(TAG + ' start');

        let deque = new Deque<string>();
        const largeString = "a".repeat(10000);
        deque.insertFront(largeString);

        expect(deque.getFirst()).assertEqual(largeString);
        expect(deque.length).assertEqual(1);
        expect((deque.getFirst() as string).length).assertEqual(10000);

        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERTFRONT01_5700
     * @tc.name      testArraylistInsertFront01CustomClassObject0057
     * @tc.desc      insert custom class object to deque front
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylistInsertFront01CustomClassObject0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testArraylistInsertFront01CustomClassObject0057';
        console.log(TAG + ' start');

        class C1 {
          name: string = "";
          age: string = "";
          constructor(name: string, age: string) {
            this.name = name;
            this.age = age;
          }
        }

        let deque = new Deque<C1>();
        // 修复点：通过 new C1() 显式创建类实例，而非直接使用对象字面量
        const obj1: C1 = new C1("Dylon", "13");
        const obj2: C1 = new C1("Joe", "14");
        const obj3: C1 = new C1("Lucy", "15");

        deque.insertFront(obj1);
        deque.insertFront(obj2);
        deque.insertFront(obj3);

        expect(deque.getFirst()).assertEqual(obj3);
        expect(deque.length).assertEqual(3);

        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERTFRONT01_5800
     * @tc.name      testArraylistInsertFront01MixedCustomObjectTypes0058
     * @tc.desc      insert mixed custom class object, string and number to deque front
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArraylistInsertFront01MixedCustomObjectTypes0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'testArraylistInsertFront01MixedCustomObjectTypes0058';
        console.log(TAG + ' start');

        class C1 {
          name: string = "";
          age: string = "";
          constructor(name: string, age: string) {
            this.name = name;
            this.age = age;
          }
        }

        let deque = new Deque<C1 | string | number>();
        // 修复点：同样通过 new C1() 创建实例
        const customObj: C1 = new C1("Dylon", "13");
        const str = "testString";
        const num = 123;

        deque.insertFront(customObj);
        deque.insertFront(str);
        deque.insertFront(num);

        expect(deque.getFirst()).assertEqual(num);
        expect(deque.length).assertEqual(3);

        console.log(TAG + ' done');
      });
  });
}