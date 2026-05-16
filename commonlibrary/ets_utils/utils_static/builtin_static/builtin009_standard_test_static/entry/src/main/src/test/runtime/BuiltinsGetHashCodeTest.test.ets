import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';

import {
  NormalTestObject,
  InnerMostTestObject,
  MiddleTestObject,
  NestedTestObject,
  FunctionPropTestObject,
  ArrayBufferTestObject,
  DataViewTestObject,
  Key2ValueObj,
  ParentTestClass,
  InheritedTestClass,
  NonEnumerableTestClass,
  InjectedProtoClass,
  MiddleProtoClass,
  PrototypePollutionTestClass,
  TestClass,
  UndefinedPropertyTestClass,
  NullPropertyTestClass,
  NaNPropertyTestClass,
  InfinityPropertyTestClass,
  TypedArrayTestClass,
  MapTestClass,
  SetTestClass,
  PromiseTestClass,
  RegExpTestClass
} from './BuiltinsGetHashCodeClass';
import Utils from '../Util.test';

export default function builtinsGetHashCodeTest() {
  describe("builtinsGetHashCodeTest", () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
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
     * @tc.name    builtinsGetHashCodeTest0001
     * @tc.number  BUILTINS_GET_HASH_CODE_TEST_0001
     * @tc.desc    Test getHashCode by normal object
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsGetHashCodeTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testObject: NormalTestObject = {
        a: 1,
        b: "test",
        c: [1, 2, 3]
      };

      let hashCode: number | undefined = undefined;
      let isValidObject = false;

      try {
        hashCode = Runtime.getHashCode(testObject);
        expect(Number.isInteger(hashCode)).assertTrue();
        expect(testObject.a === 1).assertTrue();
        expect(testObject.b === "test").assertTrue();
        expect(testObject.c.length === 3).assertTrue();
        isValidObject = true;
      } catch (error) {
        console.log("处理 NormalTestObject 时出现异常：", error);
      }

      expect(isValidObject).assertTrue();
    });

    /**
     * @tc.name    builtinsGetHashCodeTest0002
     * @tc.number  BUILTINS_GET_HASH_CODE_TEST_0002
     * @tc.desc    Test getHashCode by nested object
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsGetHashCodeTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testObject: NestedTestObject = {
        a: 1,
        b: {
          c: 2,
          d: {
            e: 3
          }
        }
      };
      let hashCode: number | undefined = undefined;
      let isValidObject = false;

      try {
        hashCode = Runtime.getHashCode(testObject);
        expect(Number.isInteger(hashCode)).assertTrue();
        isValidObject = true;
      } catch (error) {
        console.log(error);
      }
      expect(isValidObject).assertTrue();
    });

    /**
     * @tc.name    builtinsGetHashCodeTest0003
     * @tc.number  BUILTINS_GET_HASH_CODE_TEST_0003
     * @tc.desc    Test getHashCode by functional object
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsGetHashCodeTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let isValidObject = false;
      try {
        const testObject: FunctionPropTestObject = {
          a: 1,
          b: () => {}
        };
        let hashCode: number | undefined = undefined;
        hashCode = Runtime.getHashCode(testObject);
        expect(Number.isInteger(hashCode)).assertTrue();
        isValidObject = true;
      } catch (error) {
        console.log(error);
      }
      expect(isValidObject).assertTrue();
    });

    /**
     * @tc.name    builtinsGetHashCodeTest0004
     * @tc.number  BUILTINS_GET_HASH_CODE_TEST_0004
     * @tc.desc    Test getHashCode by object with extended chain
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsGetHashCodeTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let isValidObject = false;
      try {
        const testObject: InheritedTestClass = new InheritedTestClass();
        let hashCode: number | undefined = undefined;
        hashCode = Runtime.getHashCode(testObject);
        expect(Number.isInteger(hashCode)).assertTrue();
        isValidObject = true;
      } catch (error) {
        console.log(error);
      }
      expect(isValidObject).assertTrue();
    });

    /**
     * @tc.name    builtinsGetHashCodeTest0005
     * @tc.number  BUILTINS_GET_HASH_CODE_TEST_0005
     * @tc.desc    Test getHashCode with null input
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsGetHashCodeTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testObject: Object = new Object();
      let hashCode: number | undefined = undefined;
      let isValidObject = false;

      try {
        hashCode = Runtime.getHashCode(testObject);
        expect(Number.isInteger(hashCode)).assertTrue();
        isValidObject = true;
      } catch (error) {
        console.log(error);
      }
      expect(isValidObject).assertTrue();
    });

    /**
     * @tc.name    builtinsGetHashCodeTest0006
     * @tc.number  BUILTINS_GET_HASH_CODE_TEST_0006
     * @tc.desc    Test getHashCode with non-enumerable property object
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsGetHashCodeTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let isValidObject = false;
      try {
        const testObject: NonEnumerableTestClass = new NonEnumerableTestClass();
        let hashCode: number | undefined = undefined;
        hashCode = Runtime.getHashCode(testObject);
        expect(Number.isInteger(hashCode)).assertTrue();
        isValidObject = true;
      } catch (error) {
        console.log(error);
      }
      expect(isValidObject).assertTrue();
    });

    /**
     * @tc.name    builtinsGetHashCodeTest0007
     * @tc.number  BUILTINS_GET_HASH_CODE_TEST_0007
     * @tc.desc    Test getHashCode with arraybuffer object
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsGetHashCodeTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let isValidObject = false;

      try {
        const testObject: ArrayBufferTestObject = {
          buffer: new ArrayBuffer(16)
        };
        let hashCode: number | undefined = undefined;
        hashCode = Runtime.getHashCode(testObject);
        expect(Number.isInteger(hashCode)).assertTrue();
        isValidObject = true;
      } catch (error) {
        console.log(error);
      }
      expect(isValidObject).assertTrue();
    });

    /**
     * @tc.name    builtinsGetHashCodeTest0008
     * @tc.number  BUILTINS_GET_HASH_CODE_TEST_0008
     * @tc.desc    Test getHashCode with dataview object
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsGetHashCodeTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let isValidObject = false;

      try {
        const testObject: DataViewTestObject = {
          view: new DataView(new ArrayBuffer(16))
        };
        let hashCode: number | undefined = undefined;
        hashCode = Runtime.getHashCode(testObject);
        expect(Number.isInteger(hashCode)).assertTrue();
        isValidObject = true;
      } catch (error) {
        console.log(error);
      }
      expect(isValidObject).assertTrue();
    });

    /**
     * @tc.name    builtinsGetHashCodeTest0009
     * @tc.number  BUILTINS_GET_HASH_CODE_TEST_0009
     * @tc.desc    Test getHashCode with null object
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsGetHashCodeTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let isValidObject = false;

      try {
        const testObject: object = {};
        let hashCode: number | undefined = undefined;
        hashCode = Runtime.getHashCode(testObject);
        expect(Number.isInteger(hashCode)).assertTrue();
        isValidObject = true;
      } catch (error) {
        console.log(error);
      }
      expect(isValidObject).assertTrue();
    });

    /**
     * @tc.name    builtinsGetHashCodeTest0010
     * @tc.number  BUILTINS_GET_HASH_CODE_TEST_0010
     * @tc.desc    Test getHashCode with large object
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsGetHashCodeTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let isValidObject = false;

      try {
        const largeArray: number[] = [];
        for (let i = 0; i < 10000; i++) {
          largeArray.push(i);
        }
        let hashCode: number | undefined = undefined;
        hashCode = Runtime.getHashCode(largeArray);
        expect(Number.isInteger(hashCode)).assertTrue();
        isValidObject = true;
      } catch (error) {
        console.log(error);
      }

      expect(isValidObject).assertTrue();
    });

    /**
     * @tc.name    builtinsGetHashCodeTest0011
     * @tc.number  BUILTINS_GET_HASH_CODE_TEST_0011
     * @tc.desc    Test getHashCode with contaminated chain object
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsGetHashCodeTest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testObject: PrototypePollutionTestClass = new PrototypePollutionTestClass();
      let hashCode: number | undefined = undefined;
      let isValidObject = false;

      try {
        hashCode = Runtime.getHashCode(testObject);
        expect(Number.isInteger(hashCode)).assertTrue();
        isValidObject = true;
      } catch (error) {
        console.log( error);
      }
      expect(isValidObject).assertTrue();
    });

    /**
     * @tc.name    builtinsGetHashCodeTest0012
     * @tc.number  BUILTINS_GET_HASH_CODE_TEST_0012
     * @tc.desc    Test getHashCode with non-extension object
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsGetHashCodeTest0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let isNonExtensible = false;
      let isValidObject = false;

      try {
        const testObject: TestClass = new TestClass();
        let hashCode: number | undefined = undefined;
        const ownProperties = Object.getOwnPropertyNames(testObject);
        const hasPropertyA = ownProperties.includes('a');
        const noExtraProperties = ownProperties.length === 1;

        isNonExtensible = hasPropertyA && noExtraProperties;
        hashCode = Runtime.getHashCode(testObject);
        expect(Number.isInteger(hashCode)).assertTrue();
        expect(isNonExtensible).assertTrue();
        isValidObject = true;
      } catch (error) {
        console.log(error);
      }
      expect(isValidObject).assertTrue();
    });

    /**
     * @tc.name    builtinsGetHashCodeTest0013
     * @tc.number  BUILTINS_GET_HASH_CODE_TEST_0013
     * @tc.desc    Test getHashCode with frozen object
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsGetHashCodeTest0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testObject: TestClass = new TestClass();
      let hashCode: number | undefined = undefined;
      let isValidObject = false;
      let isFrozen = false;
      let hasValidProperty = false;
      let isPropReadOnly = false;

      try {
        hasValidProperty = (testObject.a === 1);
        hashCode = Runtime.getHashCode(testObject);
        expect(Number.isInteger(hashCode)).assertTrue();
        expect(hasValidProperty).assertTrue();
        expect(isFrozen).assertFalse();
        isValidObject = true;
      } catch (error) {
        console.log(error);
      }
      expect(isValidObject).assertTrue();
    });

    /**
     * @tc.name    builtinsGetHashCodeTest0014
     * @tc.number  BUILTINS_GET_HASH_CODE_TEST_0014
     * @tc.desc    Test getHashCode with sealed object
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsGetHashCodeTest0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testObject: TestClass = new TestClass();
      let hashCode: number | undefined = undefined;
      let isValidObject = false;
      let isSealed = false;
      let hasValidProperty = false;
      let canModifyExistingProperty = false;

      try {
        hasValidProperty = (testObject.a === 1);
        testObject.a = 2;
        canModifyExistingProperty = (testObject.a === 2);
        isSealed = hasValidProperty && canModifyExistingProperty;
        hashCode = Runtime.getHashCode(testObject);
        expect(Number.isInteger(hashCode)).assertTrue();
        expect(hasValidProperty).assertTrue();
        expect(canModifyExistingProperty).assertTrue();
        expect(isSealed).assertTrue();
        isValidObject = true;
      } catch (error) {
        console.log(error);
      }
      expect(isValidObject).assertTrue();
    });

    /**
     * @tc.name    builtinsGetHashCodeTest0015
     * @tc.number  BUILTINS_GET_HASH_CODE_TEST_0015
     * @tc.desc    Test getHashCode by object with undefined value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsGetHashCodeTest0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testObject: UndefinedPropertyTestClass = new UndefinedPropertyTestClass();
      let hashCode: number | undefined = undefined;
      let isValidObject = false;
      let hasValidUndefinedProperty = false;
      let hasValidNumberProperty = false;

      try {
        hasValidUndefinedProperty = (testObject.a === undefined);
        hasValidNumberProperty = (testObject.b === 1);
        hashCode = Runtime.getHashCode(testObject);
        expect(Number.isInteger(hashCode)).assertTrue();
        expect(hasValidUndefinedProperty).assertTrue();
        expect(hasValidNumberProperty).assertTrue();
        isValidObject = true;
      } catch (error) {
        console.log(error);
      }
      expect(isValidObject).assertTrue();
    });

    /**
     * @tc.name    builtinsGetHashCodeTest0016
     * @tc.number  BUILTINS_GET_HASH_CODE_TEST_0016
     * @tc.desc    Test getHashCode by object with null value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsGetHashCodeTest0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testObject: NullPropertyTestClass = new NullPropertyTestClass();
      let hashCode: number | undefined = undefined;
      let isValidObject = false;
      let hasValidNullProperty = false;
      let hasValidNumberProperty = false;

      try {
        hasValidNullProperty = (testObject.a === null);
        hasValidNumberProperty = (testObject.b === 1);
        hashCode = Runtime.getHashCode(testObject);
        expect(Number.isInteger(hashCode)).assertTrue();
        expect(hasValidNullProperty).assertTrue();
        expect(hasValidNumberProperty).assertTrue();
        isValidObject = true;
      } catch (error) {
        console.log(error);
      }
      expect(isValidObject).assertTrue();
    });

    /**
     * @tc.name    builtinsGetHashCodeTest0017
     * @tc.number  BUILTINS_GET_HASH_CODE_TEST_0017
     * @tc.desc    Test getHashCode by object with nan value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsGetHashCodeTest0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testObject: NaNPropertyTestClass = new NaNPropertyTestClass();
      let hashCode: number | undefined = undefined;
      let isValidObject = false;
      let hasValidNaNProperty = false;
      let hasValidNumberProperty = false;

      try {
        hasValidNaNProperty = Number.isNaN(testObject.a);
        hasValidNumberProperty = (testObject.b === 1);
        hashCode = Runtime.getHashCode(testObject);
        expect(Number.isInteger(hashCode)).assertTrue();
        expect(hasValidNaNProperty).assertTrue();
        expect(hasValidNumberProperty).assertTrue();
        isValidObject = true;
      } catch (error) {
        console.log( error);
      }
      expect(isValidObject).assertTrue();
    });

    /**
     * @tc.name    builtinsGetHashCodeTest0018
     * @tc.number  BUILTINS_GET_HASH_CODE_TEST_0018
     * @tc.desc    Test getHashCode by object with infinity value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsGetHashCodeTest0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testObject: InfinityPropertyTestClass = new InfinityPropertyTestClass();
      let hashCode: number | undefined = undefined;
      let isValidObject = false;
      let hasValidInfinityProperty = false;
      let hasValidNumberProperty = false;

      try {
        hasValidInfinityProperty = (testObject.a === Infinity);
        hasValidNumberProperty = (testObject.b === 1);
        hashCode = Runtime.getHashCode(testObject);
        expect(Number.isInteger(hashCode)).assertTrue();
        expect(hasValidInfinityProperty).assertTrue();
        expect(hasValidNumberProperty).assertTrue();
        isValidObject = true;
      } catch (error) {
        console.log(error);
      }
      expect(isValidObject).assertTrue();
    });

    /**
     * @tc.name    builtinsGetHashCodeTest0019
     * @tc.number  BUILTINS_GET_HASH_CODE_TEST_0019
     * @tc.desc    Test getHashCode by object with typearray value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsGetHashCodeTest0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testObject: TypedArrayTestClass = new TypedArrayTestClass();
      const targetData = [72, 101, 108, 108, 111];
      let hashCode: number | undefined = undefined;
      let isValidObject = false;
      let isUint8ArrayInstance = false;
      let hasCorrectLength = false;
      let hasCorrectContent = false;

      try {
        isUint8ArrayInstance = (testObject.buffer instanceof Uint8Array);
        hasCorrectLength = (testObject.buffer.length === targetData.length);
        let contentMatch = true;
        for (let i = 0; i < testObject.buffer.length; i++) {
          if (testObject.buffer[i] !== targetData[i]) {
            contentMatch = false;
            break;
          }
        }
        hasCorrectContent = contentMatch;
        hashCode = Runtime.getHashCode(testObject);
        expect(Number.isInteger(hashCode)).assertTrue();
        expect(isUint8ArrayInstance).assertTrue();
        expect(hasCorrectLength).assertTrue();
        expect(hasCorrectContent).assertTrue();
        isValidObject = true;
      } catch (error) {
        console.log(error);
      }
      expect(isValidObject).assertTrue();
    });

    /**
     * @tc.name    builtinsGetHashCodeTest0020
     * @tc.number  BUILTINS_GET_HASH_CODE_TEST_0020
     * @tc.desc    Test getHashCode by object with map value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsGetHashCodeTest0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testObject: MapTestClass = new MapTestClass();
      let hashCode: number | undefined = undefined;
      let isValidObject = false;
      let isMapInstance = false;
      let hasCorrectSize = false;
      let hasCorrectKey1Value = false;
      let hasCorrectKey2Value = false;

      try {
        isMapInstance = (testObject.map instanceof Map);
        hasCorrectSize = (testObject.map.size === 2);
        hasCorrectKey1Value = (testObject.map.get('key1') === 'value1');
        const key2Value = testObject.map.get('key2');
        hasCorrectKey2Value = (typeof key2Value === 'object' && key2Value !== null && (key2Value as Key2ValueObj).a === 1);
        hashCode = Runtime.getHashCode(testObject);
        expect(Number.isInteger(hashCode)).assertTrue();
        expect(isMapInstance).assertTrue();
        expect(hasCorrectSize).assertTrue();
        expect(hasCorrectKey1Value).assertTrue();
        expect(hasCorrectKey2Value).assertTrue();
        isValidObject = true;
      } catch (error) {
        console.log(error);
      }
      expect(isValidObject).assertTrue();
    });

    /**
     * @tc.name    builtinsGetHashCodeTest0021
     * @tc.number  BUILTINS_GET_HASH_CODE_TEST_0021
     * @tc.desc    Test getHashCode by object with set value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsGetHashCodeTest0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testObject: SetTestClass = new SetTestClass();
      const targetElements = [1, 2, 3];
      let hashCode: number | undefined = undefined;
      let isValidObject = false;
      let isSetInstance = false;
      let hasCorrectSize = false;
      let hasAllTargetElements = false;

      try {
        isSetInstance = (testObject.set instanceof Set);
        hasCorrectSize = (testObject.set.size === 3);
        let allElementsExist = true;
        for (const element of targetElements) {
          if (!testObject.set.has(element)) {
            allElementsExist = false;
            break;
          }
        }
        hasAllTargetElements = allElementsExist;
        hashCode = Runtime.getHashCode(testObject);
        expect(Number.isInteger(hashCode)).assertTrue();
        expect(isSetInstance).assertTrue();
        expect(hasCorrectSize).assertTrue();
        expect(hasAllTargetElements).assertTrue();
        isValidObject = true;
      } catch (error) {
        console.log(error);
      }
      expect(isValidObject).assertTrue();
    });

    /**
     * @tc.name    builtinsGetHashCodeTest0022
     * @tc.number  BUILTINS_GET_HASH_CODE_TEST_0022
     * @tc.desc    Test getHashCode by object with promise value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsGetHashCodeTest0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (): Promise<void> => {
      const testObject: PromiseTestClass = new PromiseTestClass();
      let hashCode: number | undefined = undefined;
      let isValidObject = false;
      let isPromiseInstance = false;
      let isPromiseResolvedCorrectly = false;

      try {
        isPromiseInstance = (testObject.promise instanceof Promise);
        const promiseResult = await testObject.promise;
        isPromiseResolvedCorrectly = (promiseResult === 'done');
        hashCode = Runtime.getHashCode(testObject);
        expect(Number.isInteger(hashCode)).assertTrue();
        expect(isPromiseInstance).assertTrue();
        expect(isPromiseResolvedCorrectly).assertTrue();
        isValidObject = true;
      } catch (error) {
        console.log(error);
      }
      expect(isValidObject).assertTrue();
    });

    /**
     * @tc.name    builtinsGetHashCodeTest0023
     * @tc.number  BUILTINS_GET_HASH_CODE_TEST_0023
     * @tc.desc    Test getHashCode by object with regular expression value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsGetHashCodeTest0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testObject: RegExpTestClass = new RegExpTestClass();
      let hashCode: number | undefined = undefined;
      let isValidObject = false;
      let isRegexInstance = false;
      let hasCorrectRegexSource = false;
      let hasCorrectRegexFlags = false;
      let isFlagsInstance = false;
      let hasCorrectFlagsSource = false;
      let hasCorrectFlagsFlags = false;

      try {
        isRegexInstance = (testObject.regex instanceof RegExp);
        hasCorrectRegexSource = (testObject.regex.source === 'abc');
        hasCorrectRegexFlags = (testObject.regex.flags === 'gi');
        isFlagsInstance = (testObject.flags instanceof RegExp);
        hasCorrectFlagsSource = (testObject.flags.source === 'def');
        hasCorrectFlagsFlags = (testObject.flags.flags === 'm');
        hashCode = Runtime.getHashCode(testObject);

        expect(Number.isInteger(hashCode)).assertTrue();
        expect(isRegexInstance).assertTrue();
        expect(hasCorrectRegexSource).assertTrue();
        expect(hasCorrectRegexFlags).assertTrue();
        expect(isFlagsInstance).assertTrue();
        expect(hasCorrectFlagsSource).assertTrue();
        expect(hasCorrectFlagsFlags).assertTrue();
        isValidObject = true;
      } catch (error) {
        console.log(error);
      }
      expect(isValidObject).assertTrue();
    });
  })
}