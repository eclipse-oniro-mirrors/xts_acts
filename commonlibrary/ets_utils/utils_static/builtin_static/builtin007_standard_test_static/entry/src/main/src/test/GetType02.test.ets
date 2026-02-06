/**
 * Copyright (c) 2025 SwanLink (Jiangsu) Technology Development Co., LTD.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';
import Utils from './Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
export default function getType02Test() {
  describe("getType02Test", (): void => {
    // Dewm25 fines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
	   await Utils.msSleep(100);
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
     * @tc.number  SUB_COMMONLIBRARY_FLOATVALUE_GETTYPE_0100
     * @tc.name    testValueGetType80001
     * @tc.desc    Verify getType() with positive float value
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType80001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType80001';
      try {
        const floatType: FloatType = FloatType.REF;
        const floatValue = new FloatValue(floatType, 3.14159 as float);
        const result = floatValue.getType();
        expect(typeof result).assertEqual(typeof floatType);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_FLOATVALUE_GETTYPE_0200
     * @tc.name    testValueGetType80002
     * @tc.desc    Verify getType() with negative float value
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType80002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType80002';
      try {
        const floatType: FloatType = FloatType.REF;
        const floatValue = new FloatValue(floatType, -2.71828 as float);
        const result = floatValue.getType();
        expect(typeof result).assertEqual(typeof floatType);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_FLOATVALUE_GETTYPE_0300
     * @tc.name    testValueGetType80003
     * @tc.desc    Verify getType() with zero value
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType80003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType80003';
      try {
        const floatType: FloatType = FloatType.REF;
        const floatValue = new FloatValue(floatType, 0.0 as float);
        const result = floatValue.getType();
        expect(typeof result).assertEqual(typeof floatType);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_FLOATVALUE_GETTYPE_0400
     * @tc.name    testValueGetType80004
     * @tc.desc    Verify getType() with MAX_VALUE
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType80004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType80004';
      try {
        const floatType: FloatType = FloatType.REF;
        const floatValue = new FloatValue(floatType, Number.MAX_VALUE as float);
        const result = floatValue.getType();
        expect(typeof result).assertEqual(typeof floatType);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_FLOATVALUE_GETTYPE_0500
     * @tc.name   testValueGetType80005
     * @tc.desc   Verify getType() with MIN_VALUE
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  Level 1
     */
    it('testValueGetType80005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType80005';
      try {
        const floatType: FloatType = FloatType.REF;
        const floatValue = new FloatValue(floatType, Number.MIN_VALUE as float);
        const result = floatValue.getType();
        expect(typeof result).assertEqual(typeof floatType);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_FLOATVALUE_GETTYPE_0600
     * @tc.name    testValueGetType80006
     * @tc.desc    Verify getType() with NaN
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType80006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType80006';
      try {
        const floatType: FloatType = FloatType.REF;
        const floatValue = new FloatValue(floatType, Number.NaN as float);
        const result = floatValue.getType();
        expect(typeof result).assertEqual(typeof floatType);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_FLOATVALUE_GETTYPE_0700
     * @tc.name    testValueGetType80007
     * @tc.desc    Verify getType() with Infinity
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType80007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType80007';
      try {
        const floatType: FloatType = FloatType.REF;
        const floatValue = new FloatValue(floatType, Number.POSITIVE_INFINITY as float);
        const result = floatValue.getType();
        expect(typeof result).assertEqual(typeof floatType);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_FLOATVALUE_GETTYPE_0800
     * @tc.name    testValueGetType80008
     * @tc.desc    Verify getType() with Negative Infinity
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType80008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType80008';
      try {
        const floatType: FloatType = FloatType.REF;
        const floatValue = new FloatValue(floatType, Number.NEGATIVE_INFINITY as float);
        const result = floatValue.getType();
        expect(typeof result).assertEqual(typeof floatType);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_FLOATVALUE_GETTYPE_0900
     * @tc.name    testValueGetType80009
     * @tc.desc    Verify getType() returns consistent type instance
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType80009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType80009';
      try {
        const floatType: FloatType = FloatType.REF;
        const floatValue = new FloatValue(floatType, 1.618 as float);
        const firstCall = floatValue.getType();
        const secondCall = floatValue.getType();
        expect(typeof firstCall).assertEqual(typeof secondCall);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_BYTEVALUE_GETTYPE_0100
     * @tc.name    testValueGetType110001
     * @tc.desc    Verify getType() returns correct ByteType instance
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType110001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType110001';
      try {
        const byteType: ByteType = ByteType.REF;
        const byteValue = new ByteValue(byteType, 42 as byte);
        const result = byteValue.getType();
        expect(typeof result).assertEqual(typeof byteType);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_BYTEVALUE_GETTYPE_0200
     * @tc.name    testValueGetType110002
     * @tc.desc    Verify getType() with minimum byte value (-128)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType110002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType110002';
      try {
        const byteType: ByteType = ByteType.REF;
        const byteValue = new ByteValue(byteType, -128 as byte);
        const result = byteValue.getType();
        expect(typeof result).assertEqual(typeof byteType);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_BYTEVALUE_GETTYPE_0300
     * @tc.name    testValueGetType110003
     * @tc.desc    Verify getType() with maximum byte value (127)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType110003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType110003';
      try {
        const byteType: ByteType = ByteType.REF;
        const byteValue = new ByteValue(byteType, 127 as byte);
        const result = byteValue.getType();
        expect(typeof result).assertEqual(typeof byteType);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_BYTEVALUE_GETTYPE_0400
     * @tc.name    testValueGetType110004
     * @tc.desc    Verify getType() with zero value
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType110004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType110004';
      try {
        const byteType: ByteType = ByteType.REF;
        const byteValue = new ByteValue(byteType, 0 as byte);
        const result = byteValue.getType();
        expect(typeof result).assertEqual(typeof byteType);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_BYTEVALUE_GETTYPE_0500
     * @tc.name    testValueGetType110005
     * @tc.desc    Verify getType() returns consistent results
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType110005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType110005';
      try {
        const byteType: ByteType = ByteType.REF;
        const byteValue = new ByteValue(byteType, 10 as byte);
        const firstCall = byteValue.getType();
        const secondCall = byteValue.getType();
        expect(typeof firstCall).assertEqual(typeof secondCall);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_BYTEVALUE_GETTYPE_0600
     * @tc.name    testValueGetType110006
     * @tc.desc    Verify getType() returns ByteType instance
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType110006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType110006';
      try {
        const byteType: ByteType = ByteType.REF;
        const byteValue = new ByteValue(byteType, 10 as byte);
        const result = byteValue.getType();
        expect(typeof result).assertEqual(typeof byteType);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_BYTEVALUE_GETTYPE_0700
     * @tc.name    testValueGetType110007
     * @tc.desc    Verify getType() returns Type instance
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType110007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType110007';
      try {
        const byteType: ByteType = ByteType.REF;
        const byteValue = new ByteValue(byteType, 10 as byte);
        const result = byteValue.getType();
        expect(typeof result).assertEqual(typeof byteType);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_BYTEVALUE_GETTYPE_0800
     * @tc.name    testValueGetType110008
     * @tc.desc    Verify getType() with different ByteType instances
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType110008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType110008';
      try {
        const byteType1: ByteType = ByteType.REF;
        const byteType2: ByteType = ByteType.REF;
        const byteValue1 = new ByteValue(byteType1, 10 as byte);
        const byteValue2 = new ByteValue(byteType2, 20 as byte);
        const result1 = byteValue1.getType();
        const result2 = byteValue2.getType();
        expect(typeof result1).assertEqual(typeof result2);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_BYTEVALUE_GETTYPE_0900
     * @tc.name    testValueGetType110009
     * @tc.desc    Verify getType() with negative value
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType110009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType110009';
      try {
        const byteType: ByteType = ByteType.REF;
        const byteValue = new ByteValue(byteType, -50 as byte);
        const result = byteValue.getType();
        expect(typeof result).assertEqual(typeof byteType);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_BYTEVALUE_GETTYPE_1000
     * @tc.name    testValueGetType110010
     * @tc.desc    Verify getType() with middle-range positive value
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType110010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType110010';
      try {
        const byteType: ByteType = ByteType.REF;
        const byteValue = new ByteValue(byteType, 100 as byte);
        const result = byteValue.getType();
        expect(typeof result).assertEqual(typeof byteType);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_BOOLEANVALUE_GETTYPE_0100
     * @tc.name    testValueGetType120001
     * @tc.desc    Verify getType() returns correct BooleanType instance for true value
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType120001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType120001';
      try {
        const booleanType: BooleanType = BooleanType.REF;
        const booleanValue = new BooleanValue(booleanType, true);
        const result = booleanValue.getType();
        expect(typeof result).assertEqual(typeof booleanType);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_BOOLEANVALUE_GETTYPE_0200
     * @tc.name    testValueGetType120002
     * @tc.desc    Verify getType() returns correct BooleanType instance for false value
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType120002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType120002';
      try {
        const booleanType: BooleanType = BooleanType.REF;
        const booleanValue = new BooleanValue(booleanType, false);
        const result = booleanValue.getType();
        expect(typeof result).assertEqual(typeof booleanType);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_BOOLEANVALUE_GETTYPE_0300
     * @tc.name    testValueGetType120003
     * @tc.desc    Verify getType() returns same instance on multiple calls
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType120003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType120003';
      try {
        const booleanType: BooleanType = BooleanType.REF;
        const booleanValue = new BooleanValue(booleanType, true);
        const firstCall = booleanValue.getType();
        const secondCall = booleanValue.getType();
        expect(typeof firstCall).assertEqual(typeof secondCall);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_BOOLEANVALUE_GETTYPE_0400
     * @tc.name    testValueGetType120004
     * @tc.desc    Verify getType() returns BooleanType instance
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType120004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType120004';
      try {
        const booleanType: BooleanType = BooleanType.REF;
        const booleanValue = new BooleanValue(booleanType, false);
        const result = booleanValue.getType();
        expect(typeof result).assertEqual(typeof booleanType);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_BOOLEANVALUE_GETTYPE_0500
     * @tc.name    testValueGetType120005
     * @tc.desc    Verify getType() returns Type instance
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType120005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType120005';
      try {
        const booleanType: BooleanType = BooleanType.REF;
        const booleanValue = new BooleanValue(booleanType, true);
        const result = booleanValue.getType();
        expect(typeof result).assertEqual(typeof booleanType);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_BOOLEANVALUE_GETTYPE_0600
     * @tc.name    testValueGetType120006
     * @tc.desc    Verify getType() with different BooleanType instances
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType120006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType120006';
      try {
        const booleanType1: BooleanType = BooleanType.REF;
        const booleanType2: BooleanType = BooleanType.REF;
        const booleanValue1 = new BooleanValue(booleanType1, true);
        const booleanValue2 = new BooleanValue(booleanType2, false);
        const result1 = booleanValue1.getType();
        const result2 = booleanValue2.getType();
        expect(typeof result1).assertEqual(typeof result2);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_BOOLEANVALUE_GETTYPE_0700
     * @tc.name    testValueGetType120007
     * @tc.desc    Verify getType() works with different value representations
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType120007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType120007';
      try {
        const booleanType: BooleanType = BooleanType.REF;
        const value1 = new BooleanValue(booleanType, true);
        const value2 = new BooleanValue(booleanType, false);
        const value3 = new BooleanValue(booleanType, new Boolean(true));
        const value4 = new BooleanValue(booleanType, new Boolean(false));
        const result1 = value1.getType();
        const result2 = value2.getType();
        const result3 = value3.getType();
        const result4 = value4.getType();
        expect(typeof result1).assertEqual(typeof result2);
        expect(typeof result1).assertEqual(typeof result3);
        expect(typeof result1).assertEqual(typeof result4);
        expect(typeof result2).assertEqual(typeof result3);
        expect(typeof result2).assertEqual(typeof result4);
        expect(typeof result3).assertEqual(typeof result4);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_BOOLEANVALUE_GETTYPE_0800
     * @tc.name    testValueGetType120008
     * @tc.desc    Verify getType() returns instance with correct prototype chain
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType120008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType120008';
      try {
        const booleanType: BooleanType = BooleanType.REF;
        const booleanValue = new BooleanValue(booleanType, true);
        const result = booleanValue.getType();
        expect(typeof result).assertEqual(typeof booleanType);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_BOOLEANVALUE_GETTYPE_0900
     * @tc.name    testValueGetType120009
     * @tc.desc    Verify getType() is a function and returns expected type
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType120009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType120009';
      try {
        const booleanType: BooleanType = BooleanType.REF;
        const booleanValue = new BooleanValue(booleanType, false);
        const result = booleanValue.getType();
        expect(typeof result).assertEqual(typeof booleanType);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAYVALUE_GETTYPE_0100
     * @tc.name    testValueGetType130001
     * @tc.desc    Verify getType() returns correct ArrayType instance for primitive array
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType130001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType130001';
      try {
        const arrayType: ArrayType = ArrayType.INT_REF;
        const arrayData = [1, 2, 3];
        const arrayValue = new ArrayValue(arrayType, arrayData);
        const result = arrayValue.getType();
        expect(typeof result).assertEqual(typeof arrayType);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAYVALUE_GETTYPE_0200
     * @tc.name    testValueGetType130002
     * @tc.desc    Verify getType() returns correct ArrayType instance for reference array
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType130002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType130002';
      try {
        const arrayType: ArrayType = ArrayType.CHAR_REF;
        const arrayData = ["a", "b", "c"];
        const arrayValue = new ArrayValue(arrayType, arrayData);
        const result = arrayValue.getType();
        expect(typeof result).assertEqual(typeof arrayType);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAYVALUE_GETTYPE_0300
     * @tc.name    testValueGetType130003
     * @tc.desc    Verify getType() returns same instance on multiple calls
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType130003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType130003';
      try {
        const arrayType: ArrayType = ArrayType.BOOLEAN_REF;
        const arrayData = [true, false, true];
        const arrayValue = new ArrayValue(arrayType, arrayData);
        const firstCall = arrayValue.getType();
        const secondCall = arrayValue.getType();
        expect(typeof firstCall).assertEqual(typeof secondCall);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAYVALUE_GETTYPE_0400
     * @tc.name    testValueGetType130004
     * @tc.desc    Verify getType() returns ArrayType instance
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType130004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType130004';
      try {
        const arrayType: ArrayType = ArrayType.FLOAT_REF;
        const arrayData = [1.1, 2.2, 3.3];
        const arrayValue = new ArrayValue(arrayType, arrayData);
        const result = arrayValue.getType();
        expect(typeof result).assertEqual(typeof arrayType);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAYVALUE_GETTYPE_0500
     * @tc.name    testValueGetType130005
     * @tc.desc    Verify getType() returns Type instance
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType130005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType130005';
      try {
        const arrayType: ArrayType = ArrayType.CHAR_REF;
        const arrayData = ['a', 'b', 'c'];
        const arrayValue = new ArrayValue(arrayType, arrayData);
        const result = arrayValue.getType();
        expect(typeof result).assertEqual(typeof arrayType);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAYVALUE_GETTYPE_0600
     * @tc.name    testValueGetType130006
     * @tc.desc    Verify getType() with empty array
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType130006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType130006';
      try {
        const arrayType: ArrayType = ArrayType.DOUBLE_REF;
        const arrayData: number[] = [];
        const arrayValue = new ArrayValue(arrayType, arrayData);
        const result = arrayValue.getType();
        expect(typeof result).assertEqual(typeof arrayType);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAYVALUE_GETTYPE_0700
     * @tc.name    testValueGetType130007
     * @tc.desc    Verify getType() with multi-dimensional array
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType130007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType130007';
      try {
        const arrayType: ArrayType = ArrayType.LONG_REF;
        const arrayData = [[1n, 2n], [3n, 4n]];
        const arrayValue = new ArrayValue(arrayType, arrayData);
        const result = arrayValue.getType();
        expect(typeof result).assertEqual(typeof arrayType);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAYVALUE_GETTYPE_0800
     * @tc.name    testValueGetType130008
     * @tc.desc    Verify getType() with large array
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType130008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType130008';
      try {
        const arrayType: ArrayType = ArrayType.DOUBLE_REF;
        const arrayData: number[] = new Array<number>(10000).fill(1);
        const arrayValue = new ArrayValue(arrayType, arrayData);
        const result = arrayValue.getType();
        expect(typeof result).assertEqual(typeof arrayType);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAYVALUE_GETTYPE_0900
     * @tc.name    testValueGetType130009
     * @tc.desc    Verify getType() with array of arrays
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType130009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType130009';
      try {
        const arrayType: ArrayType = ArrayType.INT_REF;
        const arrayData = [[1, 2], [3, 4]];
        const arrayValue = new ArrayValue(arrayType, arrayData);
        const result = arrayValue.getType();
        expect(typeof result).assertEqual(typeof arrayType);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_DOUBLEVALUE_GETTYPE_0100
     * @tc.name    testValueGetType140001
     * @tc.desc    Verify getType() returns correct DoubleType instance for positive value
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType140001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType140001';
      try {
        const doubleType: DoubleType = DoubleType.REF;
        const doubleValue = new DoubleValue(doubleType, 3.14159);
        const result = doubleValue.getType();
        expect(typeof result).assertEqual(typeof doubleType);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_DOUBLEVALUE_GETTYPE_0200
     * @tc.name    testValueGetType140002
     * @tc.desc    Verify getType() returns correct DoubleType instance for negative value
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType140002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType140002';
      try {
        const doubleType: DoubleType = DoubleType.REF;
        const doubleValue = new DoubleValue(doubleType, -2.71828);
        const result = doubleValue.getType();
        expect(typeof result).assertEqual(typeof doubleType);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_DOUBLEVALUE_GETTYPE_0300
     * @tc.name    testValueGetType140003
     * @tc.desc    Verify getType() returns correct DoubleType instance for zero value
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType140003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType140003';
      try {
        const doubleType: DoubleType = DoubleType.REF;
        const doubleValue = new DoubleValue(doubleType, 0.0);
        const result = doubleValue.getType();
        expect(typeof result).assertEqual(typeof doubleType);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_DOUBLEVALUE_GETTYPE_0400
     * @tc.name    testValueGetType140004
     * @tc.desc    Verify getType() returns same instance on multiple calls
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType140004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType140004';
      try {
        const doubleType: DoubleType = DoubleType.REF;
        const doubleValue = new DoubleValue(doubleType, 1.23456);
        const firstCall = doubleValue.getType();
        const secondCall = doubleValue.getType();
        expect(typeof firstCall).assertEqual(typeof secondCall);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_DOUBLEVALUE_GETTYPE_0500
     * @tc.name    testValueGetType140005
     * @tc.desc    Verify getType() returns DoubleType instance
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType140005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType140005';
      try {
        const doubleType: DoubleType = DoubleType.REF;
        const doubleValue = new DoubleValue(doubleType, 5.4321);
        const result = doubleValue.getType();
        expect(typeof result).assertEqual(typeof doubleType);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_DOUBLEVALUE_GETTYPE_0600
     * @tc.name    testValueGetType140006
     * @tc.desc    Verify getType() returns Type instance
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType140006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType140006';
      try {
        const doubleType: DoubleType = DoubleType.REF;
        const doubleValue = new DoubleValue(doubleType, 9.87654);
        const result = doubleValue.getType();
        expect(typeof result).assertEqual(typeof doubleType);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_DOUBLEVALUE_GETTYPE_0700
     * @tc.name    testValueGetType140007
     * @tc.desc    Verify getType() with maximum double value
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType140007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType140007';
      try {
        const doubleType: DoubleType = DoubleType.REF;
        const doubleValue = new DoubleValue(doubleType, Number.MAX_VALUE);
        const result = doubleValue.getType();
        expect(typeof result).assertEqual(typeof doubleType);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_DOUBLEVALUE_GETTYPE_0800
     * @tc.name    testValueGetType140008
     * @tc.desc    Verify getType() with minimum double value
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType140008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType140008';
      try {
        const doubleType: DoubleType = DoubleType.REF;
        const doubleValue = new DoubleValue(doubleType, Number.MIN_VALUE);
        const result = doubleValue.getType();
        expect(typeof result).assertEqual(typeof doubleType);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_DOUBLEVALUE_GETTYPE_0900
     * @tc.name    testValueGetType140009
     * @tc.desc    Verify getType() with NaN value
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType140009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType140009';
      try {
        const doubleType: DoubleType = DoubleType.REF;
        const doubleValue = new DoubleValue(doubleType, NaN);
        const result = doubleValue.getType();
        expect(typeof result).assertEqual(typeof doubleType);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_DOUBLEVALUE_GETTYPE_1000
     * @tc.name    testValueGetType140010
     * @tc.desc    Verify getType() with Positive Infinity values
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType140010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType140010';
      try {
        const doubleType: DoubleType = DoubleType.REF;
        const posInfValue = new DoubleValue(doubleType, Infinity);
        const result = posInfValue.getType();
        expect(typeof result).assertEqual(typeof doubleType);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_DOUBLEVALUE_GETTYPE_1100
     * @tc.name    testValueGetType140011
     * @tc.desc    Verify getType() with subnormal double values
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType140011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType140011';
      try {
        const doubleType: DoubleType = DoubleType.REF;
        const subnormalValue = new DoubleValue(doubleType, Number.MIN_VALUE / 2);
        const result = subnormalValue.getType();
        expect(typeof result).assertEqual(typeof doubleType);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_DOUBLEVALUE_GETTYPE_1200
     * @tc.name    testValueGetType140012
     * @tc.desc    Verify getType() with different DoubleType instances
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType140012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType140012';
      try {
        const doubleType1: DoubleType = DoubleType.REF;
        const doubleType2: DoubleType = DoubleType.REF;
        const value1 = new DoubleValue(doubleType1, 1.23);
        const value2 = new DoubleValue(doubleType2, 4.56);
        const result1 = value1.getType();
        const result2 = value2.getType();
        expect(typeof result1).assertEqual(typeof doubleType1);
        expect(typeof result2).assertEqual(typeof doubleType2);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_DOUBLEVALUE_GETTYPE_1300
     * @tc.name    testValueGetType140013
     * @tc.desc    Verify getType() with Negative Infinity values
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType140013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType140013';
      try {
        const doubleType: DoubleType = DoubleType.REF;
        const negInfValue = new DoubleValue(doubleType, -Infinity);
        const result = negInfValue.getType();
        expect(typeof result).assertEqual(typeof doubleType);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAYVALUE_GETDATA_0100
     * @tc.name    testValueGetData130001
     * @tc.desc    Verify getData() returns correct array data for primitive array
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetData130001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetData130001';
      try {
        const arrayType: ArrayType = ArrayType.INT_REF;
        const arrayData = [1, 2, 3];
        const arrayValue = new ArrayValue(arrayType, arrayData);
        const result = arrayValue.getData();
        expect(result === arrayData).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAYVALUE_GETDATA_0200
     * @tc.name    testValueGetData130002
     * @tc.desc    Verify getData() returns correct array data for object array
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetData130002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetData130002';
      try {
        const arrayType: ArrayType = ArrayType.CHAR_REF;
        const arrayData = [
          new Object(),
          new Object(),
          new Object()
        ];
        const arrayValue = new ArrayValue(arrayType, arrayData);
        const result = arrayValue.getData();
        expect(result === arrayData).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAYVALUE_GETDATA_0300
     * @tc.name    testValueGetData130003
     * @tc.desc    Verify getData() returns empty array data
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetData130003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetData130003';
      try {
        const arrayType: ArrayType = ArrayType.CHAR_REF;
        const arrayData: string[] = [];
        const arrayValue = new ArrayValue(arrayType, arrayData);
        const result = arrayValue.getData();
        expect(result === arrayData).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAYVALUE_GETDATA_0400
     * @tc.name    testValueGetData130004
     * @tc.desc    Verify getData() returns same instance on multiple calls
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetData130004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetData130004';
      try {
        const arrayType: ArrayType = ArrayType.FLOAT_REF;
        const arrayData = [1.1, 2.2, 3.3];
        const arrayValue = new ArrayValue(arrayType, arrayData);
        const firstCall = arrayValue.getData();
        const secondCall = arrayValue.getData();
        expect(firstCall === secondCall).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAYVALUE_GETDATA_0500
     * @tc.name    testValueGetData130005
     * @tc.desc    Verify getData() with empty object array (alternative to null test)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetData130005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetData130005';
      try {
        const arrayType: ArrayType = ArrayType.CHAR_REF;
        const emptyArray: Object[] = [];
        const arrayValue = new ArrayValue(arrayType, emptyArray);
        const result = arrayValue.getData();
        expect(result === emptyArray).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAYVALUE_GETDATA_0600
     * @tc.name    testValueGetData130006
     * @tc.desc    Verify getData() with initialized empty array (alternative to undefined test)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetData130006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetData130006';
      try {
        const arrayType: ArrayType = ArrayType.CHAR_REF;
        const initializedEmptyArray = new Array<String>();
        const arrayValue = new ArrayValue(arrayType, initializedEmptyArray);
        const result = arrayValue.getData();
        expect(result === initializedEmptyArray).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAYVALUE_GETDATA_0700
     * @tc.name    testValueGetData130007
     * @tc.desc    Verify getData() with array containing null elements
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetData130007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetData130007';
      try {
        const arrayType: ArrayType = ArrayType.CHAR_REF;
        const arrayData: (Object | null)[] = [null, new Object(), null];
        const arrayValue = new ArrayValue(arrayType, arrayData);
        const result = arrayValue.getData();
        expect(result === arrayData).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_BOOLEANVALUE_GETDATA_0100
     * @tc.name    testValueGetData120001
     * @tc.desc    Verify getData() returns correct Boolean object for true value
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetData120001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetData120001';
      try {
        const booleanType: BooleanType = BooleanType.REF;
        const booleanValue = new BooleanValue(booleanType, true);
        const result = booleanValue.getData();
        expect(result === true).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_BOOLEANVALUE_GETDATA_0200
     * @tc.name    testValueGetData120002
     * @tc.desc    Verify getData() returns correct Boolean object for false value
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetData120002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetData120002';
      try {
        const booleanType: BooleanType = BooleanType.REF;
        const booleanValue = new BooleanValue(booleanType, false);
        const result = booleanValue.getData();
        expect(result === false).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_BOOLEANVALUE_GETDATA_0300
     * @tc.name   testValueGetData120003
     * @tc.desc   Verify getData() returns new Boolean instance each time
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  Level 1
     */
    it('testValueGetData120003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetData120003';
      try {
        const booleanType: BooleanType = BooleanType.REF;
        const booleanValue = new BooleanValue(booleanType, true);
        const firstCall = booleanValue.getData();
        const secondCall = booleanValue.getData();
        expect(firstCall === secondCall).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_BOOLEANVALUE_GETDATA_0400
     * @tc.name    testValueGetData120004
     * @tc.desc    Verify getData() with multiple BooleanType instances (boundary case)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetData120004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetData120004';
      try {
        const booleanType1: BooleanType = BooleanType.REF;
        const booleanType2: BooleanType = BooleanType.REF;
        const value1 = new BooleanValue(booleanType1, true);
        const value2 = new BooleanValue(booleanType2, false);
        const result1 = value1.getData();
        const result2 = value2.getData();
        expect(result1 === true && result2 === false).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_BOOLEANVALUE_GETDATA_0500
     * @tc.name    testValueGetData120005
     * @tc.desc    Verify getData() with repeated calls (stability test)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetData120005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetData120005';
      try {
        const booleanType: BooleanType = BooleanType.REF;
        const booleanValue = new BooleanValue(booleanType, false);
        for (let i = 0; i < 10; i++) {
          const result = booleanValue.getData();
          expect(result instanceof Boolean).assertTrue();
          expect((result as Boolean).valueOf()).assertFalse();
        }
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_BOOLEANVALUE_GETDATA_0600
     * @tc.name    testValueGetData120006
     * @tc.desc    Verify getData() returns correct type after value change (edge case)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testValueGetData120006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetData120006';
      try {
        const booleanType: BooleanType = BooleanType.REF;
        const value1 = new BooleanValue(booleanType, true);
        const value2 = new BooleanValue(booleanType, false);
        expect((value1.getData() as Boolean).valueOf()).assertTrue();
        expect((value2.getData() as Boolean).valueOf()).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_BOOLEANVALUE_GETDATA_0700
     * @tc.name    testValueGetData120007
     * @tc.desc    Verify getData() with different BooleanType parameters (boundary case)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testValueGetData120007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetData120007';
      try {
        const booleanType1: BooleanType = BooleanType.REF;
        const booleanType2: BooleanType = BooleanType.REF;
        const value1 = new BooleanValue(booleanType1, true);
        const value2 = new BooleanValue(booleanType2, true);
        expect((value1.getData() as Boolean).valueOf()).assertTrue();
        expect((value2.getData() as Boolean).valueOf()).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_DOUBLEVALUE_GETDATA_0100
     * @tc.name    testValueGetData140001
     * @tc.desc    Verify getData() returns correct double value for positive number
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testValueGetData140001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetData140001';
      try {
        const doubleType: DoubleType = DoubleType.REF;
        const testValue = 3.1415926;
        const doubleValue = new DoubleValue(doubleType, testValue);
        const result = doubleValue.getData();
        expect(typeof result === 'number').assertTrue();
        expect(result as number).assertEqual(testValue);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_DOUBLEVALUE_GETDATA_0200
     * @tc.name    testValueGetData140002
     * @tc.desc    Verify getData() returns correct double value for negative number
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testValueGetData140002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetData140002';
      try {
        const doubleType: DoubleType = DoubleType.REF;
        const testValue = -2.71828;
        const doubleValue = new DoubleValue(doubleType, testValue);
        const result = doubleValue.getData();
        expect(typeof result === 'number').assertTrue();
        expect(result as number).assertEqual(testValue);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_DOUBLEVALUE_GETDATA_0300
     * @tc.name    testValueGetData140003
     * @tc.desc    Verify getData() returns zero value correctly
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testValueGetData140003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetData140003';
      try {
        const doubleType: DoubleType = DoubleType.REF;
        const doubleValue = new DoubleValue(doubleType, 0.0);
        const result = doubleValue.getData();
        expect(typeof result === 'number').assertTrue();
        expect(result as number).assertEqual(0.0);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_DOUBLEVALUE_GETDATA_0400
     * @tc.name    testValueGetData140004
     * @tc.desc    Verify getData() returns maximum double value
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testValueGetData140004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetData140004';
      try {
        const doubleType: DoubleType = DoubleType.REF;
        const maxValue = Number.MAX_VALUE;
        const doubleValue = new DoubleValue(doubleType, maxValue);
        const result = doubleValue.getData();
        expect(typeof result === 'number').assertTrue();
        expect(result as number).assertEqual(maxValue);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_DOUBLEVALUE_GETDATA_0500
     * @tc.name    testValueGetData140005
     * @tc.desc    Verify getData() returns minimum positive double value
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testValueGetData140005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetData140005';
      try {
        const doubleType: DoubleType = DoubleType.REF;
        const minValue = Number.MIN_VALUE;
        const doubleValue = new DoubleValue(doubleType, minValue);
        const result = doubleValue.getData();
        expect(typeof result === 'number').assertTrue();
        expect(result as number).assertEqual(minValue);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_DOUBLEVALUE_GETDATA_0600
     * @tc.name     testValueGetData140006
     * @tc.desc     Verify getData() returns NaN value correctly
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     * @tc.level    LEVEL1
     */
    it('testValueGetData140006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetData140006';
      try {
        const doubleType: DoubleType = DoubleType.REF;
        const doubleValue = new DoubleValue(doubleType, NaN);
        const result = doubleValue.getData();
        expect(typeof result === 'number').assertTrue();
        expect(isNaN(result as number)).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_DOUBLEVALUE_GETDATA_0700
     * @tc.name    testValueGetData140007
     * @tc.desc    Verify getData() returns Infinity value correctly
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testValueGetData140007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetData140007';
      try {
        const doubleType: DoubleType = DoubleType.REF;
        const infValue = Infinity;
        const doubleValue = new DoubleValue(doubleType, infValue);
        const result = doubleValue.getData();
        expect(typeof result === 'number').assertTrue();
        expect(result as number).assertEqual(infValue);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_DOUBLEVALUE_GETDATA_0800
     * @tc.name    testValueGetData140008
     * @tc.desc    Verify getData() returns -Infinity value correctly
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testValueGetData140008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetData140008';
      try {
        const doubleType: DoubleType = DoubleType.REF;
        const doubleValue = new DoubleValue(doubleType, -Infinity);
        const result = doubleValue.getData();
        expect(typeof result === 'number').assertTrue();
        expect(result as number).assertEqual(-Infinity);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_DOUBLEVALUE_GETDATA_0900
     * @tc.name    testValueGetData140009
     * @tc.desc    Verify getData() handles Number.EPSILON correctly
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testValueGetData140009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetData140009';
      try {
        const doubleType: DoubleType = DoubleType.REF;
        const doubleValue = new DoubleValue(doubleType, Number.EPSILON);
        const result = doubleValue.getData();
        expect(typeof result === 'number').assertTrue();
        expect(result as number).assertEqual(Number.EPSILON);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_LAMBDAVALUE_GETTYPE_0100
     * @tc.name    testValueGetType60001
     * @tc.desc    Verify getType() returns correct LambdaType instance
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testValueGetType60001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType60001';
      try {
        const func = (x: number) => x * 2;
        const lambdaType: LambdaType = Type.of(func) as LambdaType;
        const lambdaValue = new LambdaValue(lambdaType, func);
        const result = lambdaValue.getType();
        expect(result === lambdaType).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_LAMBDAVALUE_GETTYPE_0200
     * @tc.name    testValueGetType60002
     * @tc.desc    Verify getType() returns LambdaType instance
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testValueGetType60002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType60002';
      try {
        const func = (): void => {
        };
        const lambdaType: LambdaType = Type.of(func) as LambdaType;
        const lambdaValue = new LambdaValue(lambdaType, func);
        const result = lambdaValue.getType();
        expect(typeof result).assertEqual(typeof lambdaType);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_LAMBDAVALUE_GETTYPE_0500
     * @tc.name    testValueGetType60005
     * @tc.desc    Verify getType() with different LambdaType instances
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testValueGetType60005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType60005';
      try {
        const func1 = (n: number) => n.toString();
        const func2 = (s: string) => s.length;
        const lambdaType1: LambdaType = Type.of(func1) as LambdaType;
        const lambdaType2: LambdaType = Type.of(func2) as LambdaType;
        const lambdaValue1 = new LambdaValue(lambdaType1, func1);
        const lambdaValue2 = new LambdaValue(lambdaType2, func2);
        expect(lambdaValue1.getType() === lambdaType1).assertTrue();
        expect(lambdaValue2.getType() === lambdaType2).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_LAMBDAVALUE_GETTYPE_0600
     * @tc.name    testValueGetType60006
     * @tc.desc    Verify getType() with arrow function
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testValueGetType60006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType60006';
      try {
        const arrowFunc = (n: number) => n > 0;
        const lambdaType: LambdaType = Type.of(arrowFunc) as LambdaType;
        const lambdaValue = new LambdaValue(lambdaType, arrowFunc);
        const result = lambdaValue.getType();
        expect(result === lambdaType).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_LAMBDAVALUE_GETTYPE_0700
     * @tc.name    testValueGetType60007
     * @tc.desc    Verify getType() with complex nested function type
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testValueGetType60007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType60007';
      try {
        const func = (fn: (n: number) => boolean) => fn(10).toString();
        const lambdaType: LambdaType = Type.of(func) as LambdaType;
        const lambdaValue = new LambdaValue(lambdaType, func);
        expect(lambdaValue.getType() === lambdaType).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_CLASSVALUE_GETTYPE_0100
     * @tc.name    testValueGetType90001
     * @tc.desc    Verify getType() returns ClassType instance
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testValueGetType90001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType90001';
      try {
        const classType: ClassType = Type.of(new Object()) as ClassType;
        const emptyObj = new Object();
        const classValue = new ClassValue(classType, emptyObj);
        const result = classValue.getType();
        expect(typeof result).assertEqual(typeof classType);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_CLASSVALUE_GETTYPE_0200
     * @tc.name    testValueGetType90002
     * @tc.desc    Verify getType() with Date object
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testValueGetType90002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType90002';
      try {
        const classType: ClassType = Type.of(new Object()) as ClassType;
        const dateObj = new Date();
        const dateValue = new ClassValue(classType, dateObj);
        const result = dateValue.getType();
        expect(typeof result).assertEqual(typeof classType);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_CLASSVALUE_GETTYPE_0300
     * @tc.name    testValueGetType90003
     * @tc.desc    Verify getType() with java.lang.String class
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testValueGetType90003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType90003';
      try {
        const stringType: ClassType = Type.of(new Object()) as ClassType;
        const stringValue = new ClassValue(stringType, "test");
        expect(typeof stringValue.getType()).assertEqual(typeof stringType!);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_CLASSVALUE_GETTYPE_0400
     * @tc.name    testValueGetType90004
     * @tc.desc    Verify getType() with java.lang.Number class
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testValueGetType90004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType90004';
      try {
        const numberType: ClassType = Type.of(new Object()) as ClassType;
        const numberValue = new ClassValue(numberType, 123);
        expect(typeof numberValue.getType()).assertEqual(typeof numberType!);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_CLASSVALUE_GETTYPE_0500
     * @tc.name    testValueGetType90005
     * @tc.desc    Verify getType() with java.lang.Boolean class
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testValueGetType90005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType90005';
      try {
        const booleanType: ClassType = Type.of(new Object()) as ClassType;
        const booleanValue = new ClassValue(booleanType, true);
        expect(typeof booleanValue.getType()).assertEqual(typeof booleanType!);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_CLASSVALUE_GETTYPE_0600
     * @tc.name    testValueGetType90006
     * @tc.desc    Verify getType() with empty class name
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testValueGetType90006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType90006';
      try {
        const emptyType: ClassType = Type.of(new Object()) as ClassType;
        const emptyValue = new ClassValue(emptyType, {});
        expect(typeof emptyValue.getType()).assertEqual(typeof emptyType!);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_CLASSVALUE_GETTYPE_0700
     * @tc.name    testValueGetType90007
     * @tc.desc    Verify getType() with very long class name
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testValueGetType90007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType90007';
      try {
        const longType: ClassType = Type.of(new Object()) as ClassType;
        const longValue = new ClassValue(longType, {});
        expect(typeof longValue.getType()).assertEqual(typeof longType);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_CLASSVALUE_GETTYPE_0800
     * @tc.name    testValueGetType90008
     * @tc.desc    Verify getType() with array class type
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testValueGetType90008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType90008';
      try {
        const arrayType: ClassType = Type.of(new Object()) as ClassType;
        const testArray: string[] = ["test"];
        const arrayValue = new ClassValue(arrayType, testArray);
        expect(typeof arrayValue.getType()).assertEqual(typeof arrayType);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_STRINGVALUE_GETTYPE_1300
     * @tc.name    testValueGetType20013
     * @tc.desc    Verify getType() with concatenated strings
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testValueGetType20013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType20013';
      try {
        const str1 = "Hello";
        const str2 = "ArkTS";
        const concatString = new StringValue(new StringType(), str1 + " " + str2);
        const result = concatString.getType();
        expect(result instanceof StringType).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_STRINGVALUE_GETTYPE_1400
     * @tc.name    testValueGetType20014
     * @tc.desc    Verify getType() with dynamically generated strings
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testValueGetType20014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType20014';
      try {
        const dynamicStr = new Date().toString();
        const dynamicString = new StringValue(new StringType(), dynamicStr);
        const result = dynamicString.getType();
        expect(result instanceof StringType).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_STRINGVALUE_GETTYPE_1500
     * @tc.name    testValueGetType20015
     * @tc.desc    Verify getType() with strings converted from other types
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testValueGetType20015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType20015';
      try {
        const boolStr = new StringValue(new StringType(), true.toString());
        const numStr = new StringValue(new StringType(), (123.45).toString());
        const boolType = boolStr.getType();
        const numType = numStr.getType();
        expect(boolType instanceof StringType).assertTrue();
        expect(numType instanceof StringType).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_VOIDVALUE_GETTYPE_0800
     * @tc.name    testValueGetType00008
     * @tc.desc    Verify VoidType instance properties
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testValueGetType00008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType00008';
      try {
        const voidType = VoidValue.INSTANCE.getType();
        expect(voidType instanceof VoidType).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_VOIDVALUE_GETTYPE_0900
     * @tc.name    testValueGetType00009
     * @tc.desc    Verify VoidType comparison with primitive types
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testValueGetType00009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType00009';
      try {
        const voidType = VoidValue.INSTANCE.getType();
        expect(typeof voidType !== 'string').assertTrue();
        expect(typeof voidType !== 'number').assertTrue();
        expect(typeof voidType !== 'boolean').assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UNDEFINEDVALUE_GETTYPE_0600
     * @tc.name    testValueGetType10006
     * @tc.desc    Verify getType() returns same instance across multiple calls
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testValueGetType10006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType10006';
      try {
        const type1 = UndefinedValue.INSTANCE.getType();
        const type2 = UndefinedValue.INSTANCE.getType();
        const type3 = UndefinedValue.INSTANCE.getType();
        expect(type1 === type2 && type2 === type3).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UNDEFINEDVALUE_GETTYPE_0700
     * @tc.name    testValueGetType10007
     * @tc.desc    Verify getType() method properties
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testValueGetType10007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType10007';
      try {
        const result = UndefinedValue.INSTANCE.getType();
        expect(typeof result.toString).assertEqual('function');
        expect(result.toString()).assertEqual('undefined');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UNDEFINEDVALUE_GETTYPE_0800
     * @tc.name    testValueGetType10008
     * @tc.desc    Verify getType() returns non-null object
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testValueGetType10008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType10008';
      try {
        const result = UndefinedValue.INSTANCE.getType();
        expect(result !== null).assertTrue();
        expect(typeof result).assertEqual('object');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UNDEFINEDVALUE_GETTYPE_0900
     * @tc.name    testValueGetType10009
     * @tc.desc    Verify getType() returns object with non-enumerable keys
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testValueGetType10009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType10009';
      try {
        const result = UndefinedValue.INSTANCE.getType();
        expect(typeof result.toString === 'function').assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UNDEFINEDVALUE_GETTYPE_1000
     * @tc.name    testValueGetType10010
     * @tc.desc    Verify getType() result is not equal to NullType.REF
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testValueGetType10010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType10010';
      try {
        const result = UndefinedValue.INSTANCE.getType();
        expect(result !== NullType.REF).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UNDEFINEDVALUE_GETTYPE_1100
     * @tc.name     testValueGetType10011
     * @tc.desc     Verify getType() returns same hashCode across calls
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     * @tc.level    LEVEL1
     */
    it('testValueGetType10011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType10011';
      try {
        const t1 = UndefinedValue.INSTANCE.getType();
        const t2 = UndefinedValue.INSTANCE.getType();
        expect(t1 === t2).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_NULLVALUE_GETTYPE_0500
     * @tc.name    testValueGetType40005
     * @tc.desc    Verify multiple calls return same instance
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testValueGetType40005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType40005';
      try {
        const type1 = NullValue.INSTANCE.getType();
        const type2 = NullValue.INSTANCE.getType();
        const type3 = NullValue.INSTANCE.getType();
        expect(type1 === type2 && type2 === type3).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_NULLVALUE_GETTYPE_0600
     * @tc.name    testValueGetType40006
     * @tc.desc    Verify type comparison with other types
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testValueGetType40006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType40006';
      try {
        const nullType = NullValue.INSTANCE.getType();
        expect(nullType.toString() === 'string').assertFalse();
        expect(nullType.toString() === 'number').assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_NULLVALUE_GETTYPE_0700
     * @tc.name    testValueGetType40007
     * @tc.desc    Verify method properties
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testValueGetType40007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType40007';
      try {
        const result = NullValue.INSTANCE.getType();
        expect(typeof result.toString).assertEqual('function');
        expect(result.toString()).assertEqual('null');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_NULLVALUE_GETTYPE_0800
     * @tc.name    testValueGetType40008
     * @tc.desc    Verify instanceof check
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testValueGetType40008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType40008';
      try {
        const result = NullValue.INSTANCE.getType();
        expect(result instanceof Object).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_NULLVALUE_GETTYPE_0900
     * @tc.name    testValueGetType40009
     * @tc.desc    Verify NullType is distinguishable from UndefinedType
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testValueGetType40009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType40009';
      try {
        expect(NullValue.INSTANCE.getType() !== UndefinedValue.INSTANCE.getType()).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_VOIDVALUE_TOLOCALESTRING_0900
     * @tc.name    testValueLocaleString00009
     * @tc.desc    Verify toLocaleString() returns consistent value across calls
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testValueLocaleString00009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueLocaleString00009';
      try {
        const voidValue = VoidValue.INSTANCE;
        const result1 = voidValue.toLocaleString();
        const result2 = voidValue.toLocaleString();
        const result3 = voidValue.toLocaleString();
        expect(result1).assertEqual(result2);
        expect(result2).assertEqual(result3);
        expect(result1 === result2 && result2 === result3).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_VOIDVALUE_TOLOCALESTRING_1000
     * @tc.name    testValueLocaleString00010
     * @tc.desc    Verify toLocaleString() returns expected string value
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testValueLocaleString00010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueLocaleString00010';
      try {
        const result = VoidValue.INSTANCE.toLocaleString();
        expect(result === 'undefined' || result === 'void').assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_VOIDVALUE_TOLOCALESTRING_1100
     * @tc.name    testValueLocaleString00011
     * @tc.desc    Verify toLocaleString() returns same reference for same value
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testValueLocaleString00011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueLocaleString00011';
      try {
        const result1 = VoidValue.INSTANCE.toLocaleString();
        const result2 = VoidValue.INSTANCE.toLocaleString();
        expect(result1 === result2).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_VOIDVALUE_TOLOCALESTRING_1200
     * @tc.name    testValueLocaleString00012
     * @tc.desc    Verify toLocaleString() is not the same function as toString()
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testValueLocaleString00012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueLocaleString00012';
      try {
        const voidValue = VoidValue.INSTANCE;
        expect(voidValue.toLocaleString).not().assertEqual(voidValue.toString);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number   SUB_COMMONLIBRARY_VOIDVALUE_TOLOCALESTRING_1300
     * @tc.name     testValueLocaleString00013
     * @tc.desc     Verify toLocaleString() returns a primitive string, not String object
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     * @tc.level    LEVEL1
     */
    it('testValueLocaleString00013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueLocaleString00013';
      try {
        const result = VoidValue.INSTANCE.toLocaleString();
        expect(typeof result).assertEqual('string');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UNDEFINEDVALUE_TOLOCALESTRING_0800
     * @tc.name    testValueLocaleString10008
     * @tc.desc    Verify toLocaleString() returns non-empty string
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testValueLocaleString10008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueLocaleString10008';
      try {
        const result = UndefinedValue.INSTANCE.toLocaleString();
        expect(result !== '').assertTrue();
        expect(result.length > 0).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UNDEFINEDVALUE_TOLOCALESTRING_0900
     * @tc.name    testValueLocaleString10009
     * @tc.desc    Verify toLocaleString() returns same reference across calls
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testValueLocaleString10009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueLocaleString10009';
      try {
        const result1 = UndefinedValue.INSTANCE.toLocaleString();
        const result2 = UndefinedValue.INSTANCE.toLocaleString();
        const result3 = UndefinedValue.INSTANCE.toLocaleString();
        expect(result1 === result2 && result2 === result3).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UNDEFINEDVALUE_TOLOCALESTRING_1000
     * @tc.name    testValueLocaleString10010
     * @tc.desc    Verify toLocaleString() returns expected string value
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testValueLocaleString10010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueLocaleString10010';
      try {
        const result = UndefinedValue.INSTANCE.toLocaleString();
        expect(result === 'undefined' || result === 'Undefined').assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UNDEFINEDVALUE_TOLOCALESTRING_1100
     * @tc.name    testValueLocaleString10011
     * @tc.desc    Verify toLocaleString() method properties
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testValueLocaleString10011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueLocaleString10011';
      try {
        const method = UndefinedValue.INSTANCE.toLocaleString;
        expect(typeof method).assertEqual('function');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_SHORTVALUE_GETTYPE_0800
     * @tc.name    testValueGetType30008
     * @tc.desc    Verify getType() returns same instance for same ShortType
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testValueGetType30008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType30008';
      try {
        const shortType: ShortType = ShortType.REF;
        const value1 = new ShortValue(shortType, 10);
        const value2 = new ShortValue(shortType, 20);
        const resultType1 = value1.getType();
        const resultType2 = value2.getType();
        expect(typeof resultType1).assertEqual(typeof resultType2);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_SHORTVALUE_GETTYPE_0900
     * @tc.name    testValueGetType30009
     * @tc.desc    Verify getType() returns correct type after value modification
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testValueGetType30009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType30009';
      try {
        const shortType: ShortType = ShortType.REF;
        const shortValue = new ShortValue(shortType, 0);
        const originalType = shortValue.getType();
        expect(typeof originalType).assertEqual(typeof shortType);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_SHORTVALUE_GETTYPE_1000
     * @tc.name    testValueGetType30010
     * @tc.desc    Verify type comparison with other numeric types
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testValueGetType30010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType30010';
      try {
        const shortType: ShortType = ShortType.REF;
        const shortValue = new ShortValue(shortType, 10);
        const resultType = shortValue.getType();
        expect(typeof resultType).assertEqual(typeof shortType);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_SHORTVALUE_GETTYPE_1100
     * @tc.name    testValueGetType30011
     * @tc.desc    Verify getType() returns ShortType instance
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testValueGetType30011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType30011';
      try {
        const shortType: ShortType = ShortType.REF;
        const shortValue = new ShortValue(shortType, 15);
        const resultType = shortValue.getType();
        expect(typeof resultType).assertEqual(typeof shortType);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_SHORTVALUE_GETTYPE_1200
     * @tc.name    testValueGetType30012
     * @tc.desc    Verify getType() returns non-null object
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testValueGetType30012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType30012';
      try {
        const shortType: ShortType = ShortType.REF;
        const type = new ShortValue(shortType, 0).getType();
        expect(type != null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_SHORTVALUE_GETTYPE_1300
     * @tc.name    testValueGetType30013
     * @tc.desc    Verify getType() returns same reference after value overflow
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testValueGetType30013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType30013';
      try {
        const shortType: ShortType = ShortType.REF;
        const v1 = new ShortValue(shortType, 32767);
        const v2 = new ShortValue(shortType, -32768);
        expect(v1.getType() === v2.getType()).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
       * @tc.number  SUB_COMMONLIBRARY_LONGVALUE_GETTYPE_0700
       * @tc.name    testValueGetType50007
       * @tc.desc    Verify getType() returns correct type after value modification
       * @tc.size    MEDIUMTEST
       * @tc.type    FUNCTION
       * @tc.level   LEVEL1
       */
    it('testValueGetType50007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType50007';
      try {
        const longType: LongType = LongType.REF;
        const longValue = new LongValue(longType, 0);
        const originalType = longValue.getType();
        expect(longValue.getType()).assertEqual(originalType);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_LONGVALUE_GETTYPE_0800
     * @tc.name    testValueGetType50008
     * @tc.desc    Verify type comparison with other numeric types
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testValueGetType50008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType50008';
      try {
        const longType: LongType = LongType.REF;
        const longValue = new LongValue(longType, 10);
        const resultType = longValue.getType();
        expect(typeof resultType).assertEqual(typeof longType);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_INTVALUE_GETTYPE_0700
     * @tc.name    testValueGetType70007
     * @tc.desc    Verify getType() returns same IntType instance for same IntType reference
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testValueGetType70007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType70007';
      try {
        const intType: IntType = IntType.REF;
        const v1 = new IntValue(intType, 1);
        const v2 = new IntValue(intType, 2);
        expect(v1.getType() === v2.getType()).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_INTVALUE_GETTYPE_0800
     * @tc.name    testValueGetType70008
     * @tc.desc    Verify getType() returns non-null object
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testValueGetType70008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType70008';
      try {
        const intType: IntType = IntType.REF;
        const type = new IntValue(intType, 0).getType();
        expect(type != null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_FLOATVALUE_GETTYPE_1000
     * @tc.name    testValueGetType80010
     * @tc.desc    Verify getType() returns same FloatType instance for same FloatType reference
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testValueGetType80010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType80010';
      try {
        const floatType: FloatType = FloatType.REF;
        const v1 = new FloatValue(floatType, 1.0);
        const v2 = new FloatValue(floatType, 2.0);
        expect(v1.getType() === v2.getType()).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_FLOATVALUE_GETTYPE_1100
     * @tc.name    testValueGetType80011
     * @tc.desc    Verify getType() returns non-null object
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testValueGetType80011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType80011';
      try {
        const floatType: FloatType = FloatType.REF;
        const floatValue = new FloatValue(floatType, 0.0 as float);
        const result = floatValue.getType();
        expect(result != null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
       * @tc.number  SUB_COMMONLIBRARY_BOOLEANVALUE_GETTYPE_1000
       * @tc.name    testValueGetType120010
       * @tc.desc    Verify getType() returns same BooleanType instance for same BooleanType reference
       * @tc.size    MEDIUMTEST
       * @tc.type    FUNCTION
       * @tc.level   LEVEL1
       */
    it('testValueGetType120010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType120010';
      try {
        const booleanType: BooleanType = BooleanType.REF;
        const v1 = new BooleanValue(booleanType, true);
        const v2 = new BooleanValue(booleanType, false);
        expect(v1.getType() === v2.getType()).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
       * @tc.number  SUB_COMMONLIBRARY_BOOLEANVALUE_GETTYPE_1100
       * @tc.name    testValueGetType120011
       * @tc.desc    Verify getType() returns non-null object
       * @tc.size    MEDIUMTEST
       * @tc.type    FUNCTION
       * @tc.level   LEVEL1
       */
    it('testValueGetType120011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType120011';
      try {
        const booleanType: BooleanType = BooleanType.REF;
        const booleanValue = new BooleanValue(booleanType, false);
        const result = booleanValue.getType();
        expect(result != null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
       * @tc.number  SUB_COMMONLIBRARY_ARRAYVALUE_GETTYPE_1000
       * @tc.name    testValueGetType130010
       * @tc.desc    Verify getType() returns same ArrayType instance for same ArrayType reference
       * @tc.size    MEDIUMTEST
       * @tc.type    FUNCTION
       * @tc.level   LEVEL1
       */
    it('testValueGetType130010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType130010';
      try {
        const arrayType: ArrayType = ArrayType.INT_REF;
        const v1 = new ArrayValue(arrayType, [1, 2, 3]);
        const v2 = new ArrayValue(arrayType, [4, 5]);
        expect(v1.getType() === v2.getType()).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_KERNEL_MATH_CLZ64_0100_01
     * @tc.name    testmathClz6400001
     * @tc.desc    Verify clz64() returns correct leading zero count for byte input
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testmathClz6400001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testmathClz6400001';
      try {
        const zero: byte = 0 as byte;
        expect(clz64(zero)).assertEqual(64);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_KERNEL_MATH_CLZ64_0200_01
     * @tc.name    testmathClz6400002
     * @tc.desc    Verify clz64() handles edge cases correctly
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testmathClz6400002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testmathClz6400002';
      try {
        const minByte: byte = 0 as byte;
        const maxByte: byte = (255).toByte();
        expect(clz64(minByte)).assertEqual(64);
        expect(clz64(maxByte)).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_KERNEL_MATH_CLZ64_400
     * @tc.name    testmathClz6400004
     * @tc.desc    Verify clz64() correctly masks input to 8 bits
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testmathClz6400004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testmathClz6400004';
      try {
        const overflowByte: byte = (256).toByte();
        expect(clz64(overflowByte)).assertEqual(64);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_KERNEL_MATH_CLZ64_0500_01
     * @tc.name    testmathClz6400005
     * @tc.desc    Normal values: typical non-boundary byte inputs
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testmathClz6400005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testmathClz6400005';
      try {
        expect(clz64(0x0F as byte)).assertEqual(60);
        expect(clz64(0x70 as byte)).assertEqual(57);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_KERNEL_MATH_CLZ64_0600_01
     * @tc.name    testmathClz6400006
     * @tc.desc    Boundary values: 0x01 (LSB set) and 0x80 (MSB set)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testmathClz6400006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testmathClz6400006';
      try {
        expect(clz64(0x01 as byte)).assertEqual(63);
        expect(clz64((0x80).toByte())).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_KERNEL_MATH_CLZ64_0700_01
     * @tc.name    testmathClz6400007
     * @tc.desc    Abnormal value: negative integer cast to byte (JS -1 becomes 255)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testmathClz6400007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testmathClz6400007';
      try {
        const negByte: byte = -1 as byte;
        expect(clz64(negByte)).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_KERNEL_MATH_CLZ64_0800_01
     * @tc.name    testmathClz6400008
     * @tc.desc    Abnormal value: out-of-range positive integer masked to 8 bits
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testmathClz6400008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testmathClz6400008';
      try {
        expect(clz64((511).toByte())).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });
    });
}