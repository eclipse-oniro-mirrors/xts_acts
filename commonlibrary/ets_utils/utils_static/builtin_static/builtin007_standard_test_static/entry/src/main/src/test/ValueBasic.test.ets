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
export default function valueBasicTest() {

  describe("valueBasicTest", (): void => {
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
     * @tc.number SUB_DATA_DOUBLEVALUE_BASIC_0100
     * @tc.name   testDoubleValueBasic_0100
     * @tc.desc   Verify creation with positive double value
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testDoubleValueBasic_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const TAG = 'testDoubleValueBasic_0100';
        try {
          
          let testValue: double = 3.1415926535;
          let instance = DoubleValue.of(testValue);
          let doubleValue = instance as DoubleValue;
          expect(doubleValue.getValueData()).assertEqual(testValue);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number SUB_DATA_DOUBLEVALUE_BOUNDARY_0200
     * @tc.name   testDoubleValueBoundary_0200
     * @tc.desc   Verify maximum double value handling
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testDoubleValueBoundary_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const TAG = 'testDoubleValueBoundary_0200';
        try {
          
          let maxValue: double = Number.MAX_VALUE;
          let instance = DoubleValue.of(maxValue);
          let doubleValue = instance as DoubleValue;
          expect(doubleValue.getValueData()).assertEqual(maxValue);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number SUB_DATA_DOUBLEVALUE_SPECIAL_0300
     * @tc.name   testDoubleValueSpecial_0300
     * @tc.desc   Verify negative zero handling
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testDoubleValueSpecial_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const TAG = 'testDoubleValueSpecial_0300';
        try {
          
          let negativeZero: double = -0;
          let instance = DoubleValue.of(negativeZero);
          let doubleValue = instance as DoubleValue;
          expect(1 / doubleValue.getValueData()).assertEqual(Number.POSITIVE_INFINITY);
          expect(-1 / doubleValue.getValueData()).assertEqual(Number.NEGATIVE_INFINITY);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number SUB_DATA_DOUBLEVALUE_EXCEPTION_0400
     * @tc.name   testDoubleValueException_0400
     * @tc.desc   Verify NaN value handling
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testDoubleValueException_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const TAG = 'testDoubleValueException_0400';
        try {
          
          let nanValue: double = Number.NaN;
          let instance = DoubleValue.of(nanValue);
          let doubleValue = instance as DoubleValue;
          expect(Number.isNaN(doubleValue.getValueData())).assertTrue();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number SUB_DATA_DOUBLEVALUE_BOUNDARY_0500
     * @tc.name   testDoubleValueBoundary_0500
     * @tc.desc   Verify positive/negative infinity handling
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testDoubleValueBoundary_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const TAG = 'testDoubleValueBoundary_0500';
        try {
          
          let posInf: double = Number.POSITIVE_INFINITY;
          let negInf: double = Number.NEGATIVE_INFINITY;
          let posInstance = DoubleValue.of(posInf) as DoubleValue;
          let negInstance = DoubleValue.of(negInf) as DoubleValue;
          expect(posInstance.getValueData()).assertEqual(posInf);
          expect(negInstance.getValueData()).assertEqual(negInf);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number SUB_DATA_DOUBLEVALUE_BASIC_0600
     * @tc.name   testDoubleValueBasic_0600
     * @tc.desc   Verify creation with large double value
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testDoubleValueBasic_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const TAG = 'testDoubleValueBasic_0600';
        try {
          
          let testValue: double = 1.7976931348623157e+308;
          let instance = DoubleValue.of(testValue);
          let doubleValue = instance as DoubleValue;
          expect(doubleValue.getValueData()).assertEqual(testValue);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number SUB_DATA_DOUBLEVALUE_BOUNDARY_0700
     * @tc.name   testDoubleValueBoundary_0700
     * @tc.desc   Verify minimum double value handling
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testDoubleValueBoundary_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const TAG = 'testDoubleValueBoundary_0700';
        try {
          
          let minValue: double = Number.MIN_VALUE;
          let instance = DoubleValue.of(minValue);
          let doubleValue = instance as DoubleValue;
          expect(doubleValue.getValueData()).assertEqual(minValue);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number SUB_DATA_DOUBLEVALUE_SPECIAL_0800
     * @tc.name   testDoubleValueSpecial_0800
     * @tc.desc   Verify positive infinity handling
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testDoubleValueSpecial_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const TAG = 'testDoubleValueSpecial_0800';
        try {
          
          let positiveInfinity: double = Number.POSITIVE_INFINITY;
          let instance = DoubleValue.of(positiveInfinity);
          let doubleValue = instance as DoubleValue;
          expect(doubleValue.getValueData()).assertEqual(Number.POSITIVE_INFINITY);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number SUB_DATA_DOUBLEVALUE_SPECIAL_0900
     * @tc.name   testDoubleValueSpecial_0900
     * @tc.desc   Verify negative infinity handling
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testDoubleValueSpecial_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const TAG = 'testDoubleValueSpecial_0900';
        try {
          
          let negativeInfinity: double = Number.NEGATIVE_INFINITY;
          let instance = DoubleValue.of(negativeInfinity);
          let doubleValue = instance as DoubleValue;
          expect(doubleValue.getValueData()).assertEqual(Number.NEGATIVE_INFINITY);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number SUB_DATA_DOUBLEVALUE_SPECIAL_1000
     * @tc.name   testDoubleValueSpecial_1000
     * @tc.desc   Verify NaN (Not-a-Number) handling
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testDoubleValueSpecial_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const TAG = 'testDoubleValueSpecial_1000';
        try {
          
          let nanValue: double = Number.NaN;
          let instance = DoubleValue.of(nanValue);
          let doubleValue = instance as DoubleValue;
          expect(isNaN(doubleValue.getValueData())).assertTrue();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number SUB_DATA_DOUBLEVALUE_BOUNDARY_1100
     * @tc.name   testDoubleValueBoundary_1100
     * @tc.desc   Verify very small positive value handling
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testDoubleValueBoundary_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const TAG = 'testDoubleValueBoundary_1100';
        try {
          
          let smallValue: double = 5e-324;
          let instance = DoubleValue.of(smallValue);
          let doubleValue = instance as DoubleValue;
          expect(doubleValue.getValueData()).assertEqual(smallValue);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number SUB_DATA_DOUBLEVALUE_BOUNDARY_1200
     * @tc.name   testDoubleValueBoundary_1200
     * @tc.desc   Verify very large negative value handling
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testDoubleValueBoundary_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const TAG = 'testDoubleValueBoundary_1200';
        try {
          
          let largeNegative: double = -1.7976931348623157e+308;
          let instance = DoubleValue.of(largeNegative);
          let doubleValue = instance as DoubleValue;
          expect(doubleValue.getValueData()).assertEqual(largeNegative);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  SUB_DATA_DOUBLEVALUE_BASIC_1300
     * @tc.name   testDoubleValueBasic_1300
     * @tc.desc   Verify creation with fractional value
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testDoubleValueBasic_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const TAG = 'testDoubleValueBasic_1300';
        try {
          
          let testValue: double = 0.1234567890123456;
          let instance = DoubleValue.of(testValue);
          let doubleValue = instance as DoubleValue;
          expect(doubleValue.getValueData()).assertEqual(testValue);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err}`);
          expect().assertFail();
        }
      });


    /**
     * @tc.number SUB_DATA_INTVALUE_BASIC_0100
     * @tc.name   testIntValueBasic_0100
     * @tc.desc   Verify creation with positive int value and getValueData return correctly
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testIntValueBasic_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const TAG = 'testIntValueBasic_0100';
        try {
          
          const testData: Int = 12345 as Int;
          const instance = IntValue.of(testData);
          expect(instance instanceof IntValue).assertTrue();
          const intValue = instance as IntValue;
          expect(intValue.getValueData()).assertEqual(testData);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number SUB_DATA_INTVALUE_BASIC_0200
     * @tc.name   testIntValueBasic_0200
     * @tc.desc   Verify creation with negative int value and getValueData return correctly
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testIntValueBasic_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const TAG = 'testIntValueBasic_0200';
        try {
          
          const testData: Int = -6789 as Int;
          const instance = IntValue.of(testData);
          expect(instance instanceof IntValue).assertTrue();
          const intValue = instance as IntValue;
          expect(intValue.getValueData()).assertEqual(testData);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err}`);
          expect().assertFail();
        }
      });

   /**
    * @tc.number SUB_DATA_INTVALUE_BOUNDARY_0300
    * @tc.name   testIntValueBoundary_0300
    * @tc.desc   Verify maximum int value handling and getValueData return correctly
    * @tc.size   MEDIUMTEST
    * @tc.type   FUNCTION
    * @tc.level  LEVEL1
    */
    it("testIntValueBoundary_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const TAG = 'testIntValueBoundary_0300';
        try {
          
          const maxInt: Int = 2147483647 as Int;
          const instance = IntValue.of(maxInt);
          expect(instance instanceof IntValue).assertTrue();
          const intValue = instance as IntValue;
          expect(intValue.getValueData()).assertEqual(maxInt);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number SUB_DATA_INTVALUE_SPECIAL_0400
     * @tc.name   testIntValueSpecial_0400
     * @tc.desc   Verify zero int value handling and getValueData return correctly
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testIntValueSpecial_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const TAG = 'testIntValueSpecial_0400';
        try {
          
          const zeroValue: Int = 0 as Int;
          const instance = IntValue.of(zeroValue);
          expect(instance instanceof IntValue).assertTrue();
          const intValue = instance as IntValue;
          expect(intValue.getValueData()).assertEqual(zeroValue);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number SUB_DATA_INTVALUE_BOUNDARY_0500
     * @tc.name   testIntValueBoundary_0500
     * @tc.desc   Verify minimum int value handling and getValueData return correctly
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testIntValueBoundary_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const TAG = 'testIntValueBoundary_0500';
        try {
          
          const minInt: Int = -2147483648 as Int;
          const instance = IntValue.of(minInt);
          expect(instance instanceof IntValue).assertTrue();
          const intValue = instance as IntValue;
          expect(intValue.getValueData()).assertEqual(minInt);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number SUB_DATA_INTVALUE_SPECIAL_0600
     * @tc.name   testIntValueSpecial_0600
     * @tc.desc   Verify one int value handling and getValueData return correctly
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testIntValueSpecial_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const TAG = 'testIntValueSpecial_0600';
        try {
          
          const oneValue: Int = 1 as Int;
          const instance = IntValue.of(oneValue);
          expect(instance instanceof IntValue).assertTrue();
          const intValue = instance as IntValue;
          expect(intValue.getValueData()).assertEqual(oneValue);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number SUB_DATA_INTVALUE_SPECIAL_0700
     * @tc.name   testIntValueSpecial_0700
     * @tc.desc   Verify negative one int value handling and getValueData return correctly
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testIntValueSpecial_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const TAG = 'testIntValueSpecial_0700';
        try {
          
          const negOneValue: Int = -1 as Int;
          const instance = IntValue.of(negOneValue);
          expect(instance instanceof IntValue).assertTrue();
          const intValue = instance as IntValue;
          expect(intValue.getValueData()).assertEqual(negOneValue);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number SUB_DATA_INTVALUE_BASIC_0800
     * @tc.name   testIntValueBasic_0800
     * @tc.desc   Verify creation with large positive int value and getValueData return correctly
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testIntValueBasic_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const TAG = 'testIntValueBasic_0800';
        try {
          
          const testData: Int = 987654321 as Int;
          const instance = IntValue.of(testData);
          expect(instance instanceof IntValue).assertTrue();
          const intValue = instance as IntValue;
          expect(intValue.getValueData()).assertEqual(testData);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number SUB_DATA_INTVALUE_BASIC_0900
     * @tc.name   testIntValueBasic_0900
     * @tc.desc   Verify creation with small negative int value and getValueData return correctly
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testIntValueBasic_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const TAG = 'testIntValueBasic_0900';
        try {
          
          const testData: Int = -123 as Int;
          const instance = IntValue.of(testData);
          expect(instance instanceof IntValue).assertTrue();
          const intValue = instance as IntValue;
          expect(intValue.getValueData()).assertEqual(testData);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number SUB_DATA_INTVALUE_SPECIAL_1000
     * @tc.name   testIntValueSpecial_1000
     * @tc.desc   Verify one int value handling and getValueData return correctly
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testIntValueSpecial_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const TAG = 'testIntValueSpecial_1000';
        try {
          
          const oneValue: Int = 1 as Int;
          const instance = IntValue.of(oneValue);
          expect(instance instanceof IntValue).assertTrue();
          const intValue = instance as IntValue;
          expect(intValue.getValueData()).assertEqual(oneValue);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number SUB_DATA_INTVALUE_SPECIAL_1100
     * @tc.name   testIntValueSpecial_1100
     * @tc.desc   Verify negative one int value handling and getValueData return correctly
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testIntValueSpecial_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const TAG = 'testIntValueSpecial_1100';
        try {
          
          const negOneValue: Int = -1 as Int;
          const instance = IntValue.of(negOneValue);
          expect(instance instanceof IntValue).assertTrue();
          const intValue = instance as IntValue;
          expect(intValue.getValueData()).assertEqual(negOneValue);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number SUB_DATA_INTVALUE_BOUNDARY_1200
     * @tc.name   testIntValueBoundary_1200
     * @tc.desc   Verify value near maximum int (max-1) handling and getValueData return correctly
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testIntValueBoundary_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const TAG = 'testIntValueBoundary_1200';
        try {
          
          const nearMaxInt: Int = 2147483646 as Int;
          const instance = IntValue.of(nearMaxInt);
          expect(instance instanceof IntValue).assertTrue();
          const intValue = instance as IntValue;
          expect(intValue.getValueData()).assertEqual(nearMaxInt);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number SUB_DATA_INTVALUE_BOUNDARY_1300
     * @tc.name   testIntValueBoundary_1300
     * @tc.desc   Verify value near minimum int (min+1) handling and getValueData return correctly
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testIntValueBoundary_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const TAG = 'testIntValueBoundary_1300';
        try {
          
          const nearMinInt: Int = -2147483647 as Int;
          const instance = IntValue.of(nearMinInt);
          expect(instance instanceof IntValue).assertTrue();
          const intValue = instance as IntValue;
          expect(intValue.getValueData()).assertEqual(nearMinInt);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number SUB_DATA_INTVALUE_BASIC_1400
     * @tc.name   testIntValueBasic_1400
     * @tc.desc   Verify creation with medium positive int value and getValueData return correctly
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testIntValueBasic_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const TAG = 'testIntValueBasic_1400';
        try {
          
          const testData: Int = 50000 as Int;
          const instance = IntValue.of(testData);
          expect(instance instanceof IntValue).assertTrue();
          const intValue = instance as IntValue;
          expect(intValue.getValueData()).assertEqual(testData);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number SUB_DATA_INTVALUE_BASIC_1500
     * @tc.name   testIntValueBasic_1500
     * @tc.desc   Verify creation with medium negative int value and getValueData return correctly
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testIntValueBasic_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const TAG = 'testIntValueBasic_1500';
        try {
          
          const testData: Int = -80000 as Int;
          const instance = IntValue.of(testData);
          expect(instance instanceof IntValue).assertTrue();
          const intValue = instance as IntValue;
          expect(intValue.getValueData()).assertEqual(testData);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number SUB_DATA_INTVALUE_SPECIAL_1600
     * @tc.name   testIntValueSpecial_1600
     * @tc.desc   Verify power-of-two int value (16) handling and getValueData return correctly
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testIntValueSpecial_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const TAG = 'testIntValueSpecial_1600';
        try {
          
          const pow2Value: Int = 16 as Int;
          const instance = IntValue.of(pow2Value);
          expect(instance instanceof IntValue).assertTrue();
          const intValue = instance as IntValue;
          expect(intValue.getValueData()).assertEqual(pow2Value);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number SUB_DATA_INTVALUE_SPECIAL_1700
     * @tc.name   testIntValueSpecial_1700
     * @tc.desc   Verify negative power-of-two int value (-32) handling and getValueData return correctly
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testIntValueSpecial_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const TAG = 'testIntValueSpecial_1700';
        try {
          
          const negPow2Value: Int = -32 as Int;
          const instance = IntValue.of(negPow2Value);
          expect(instance instanceof IntValue).assertTrue();
          const intValue = instance as IntValue;
          expect(intValue.getValueData()).assertEqual(negPow2Value);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number SUB_DATA_INTVALUE_BASIC_1800
     * @tc.name   testIntValueBasic_1800
     * @tc.desc   Verify creation with zero int value and getValueData return correctly
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testIntValueBasic_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const TAG = 'testIntValueBasic_1800';
        try {
          
          const testData: Int = 0 as Int;
          const instance = IntValue.of(testData);
          expect(instance instanceof IntValue).assertTrue();
          const intValue = instance as IntValue;
          expect(intValue.getValueData()).assertEqual(testData);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number SUB_DATA_INTVALUE_BOUNDARY_1900
     * @tc.name   testIntValueBoundary_1900
     * @tc.desc   Verify creation with maximum int value and getValueData return correctly
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testIntValueBoundary_1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const TAG = 'testIntValueBoundary_1900';
        try {
          
          const maxInt: Int = 2147483647 as Int;
          const instance = IntValue.of(maxInt);
          expect(instance instanceof IntValue).assertTrue();
          const intValue = instance as IntValue;
          expect(intValue.getValueData()).assertEqual(maxInt);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number SUB_DATA_INTVALUE_BOUNDARY_2000
     * @tc.name   testIntValueBoundary_2000
     * @tc.desc   Verify creation with minimum int value and getValueData return correctly
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testIntValueBoundary_2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const TAG = 'testIntValueBoundary_2000';
        try {
          
          const minInt: Int = -2147483648 as Int;
          const instance = IntValue.of(minInt);
          expect(instance instanceof IntValue).assertTrue();
          const intValue = instance as IntValue;
          expect(intValue.getValueData()).assertEqual(minInt);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number SUB_DATA_INTVALUE_BASIC_2100
     * @tc.name   testIntValueBasic_2100
     * @tc.desc   Verify creation with small positive int value and getValueData return correctly
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testIntValueBasic_2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const TAG = 'testIntValueBasic_2100';
        try {
          
          const testData: Int = 123 as Int;
          const instance = IntValue.of(testData);
          expect(instance instanceof IntValue).assertTrue();
          const intValue = instance as IntValue;
          expect(intValue.getValueData()).assertEqual(testData);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number SUB_DATA_INTVALUE_BASIC_2200
     * @tc.name   testIntValueBasic_2200
     * @tc.desc   Verify creation with small negative int value and getValueData return correctly
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testIntValueBasic_2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const TAG = 'testIntValueBasic_2200';
        try {
          
          const testData: Int = -456 as Int;
          const instance = IntValue.of(testData);
          expect(instance instanceof IntValue).assertTrue();
          const intValue = instance as IntValue;
          expect(intValue.getValueData()).assertEqual(testData);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number SUB_DATA_INTVALUE_SPECIAL_2300
     * @tc.name   testIntValueSpecial_2300
     * @tc.desc   Verify large positive int value (123456789) handling and getValueData return correctly
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testIntValueSpecial_2300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const TAG = 'testIntValueSpecial_2300';
        try {
          
          const largeValue: Int = 123456789 as Int;
          const instance = IntValue.of(largeValue);
          expect(instance instanceof IntValue).assertTrue();
          const intValue = instance as IntValue;
          expect(intValue.getValueData()).assertEqual(largeValue);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number SUB_DATA_INTVALUE_SPECIAL_2400
     * @tc.name   testIntValueSpecial_2400
     * @tc.desc   Verify large negative int value (-987654321) handling and getValueData return correctly
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testIntValueSpecial_2400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const TAG = 'testIntValueSpecial_2400';
        try {
          
          const largeNegValue: Int = -987654321 as Int;
          const instance = IntValue.of(largeNegValue);
          expect(instance instanceof IntValue).assertTrue();
          const intValue = instance as IntValue;
          expect(intValue.getValueData()).assertEqual(largeNegValue);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number SUB_DATA_INTVALUE_SPECIAL_2500
     * @tc.name   testIntValueSpecial_2500
     * @tc.desc   Verify odd int value (7) handling and getValueData return correctly
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testIntValueSpecial_2500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const TAG = 'testIntValueSpecial_2500';
        try {
          
          const oddValue: Int = 7 as Int;
          const instance = IntValue.of(oddValue);
          expect(instance instanceof IntValue).assertTrue();
          const intValue = instance as IntValue;
          expect(intValue.getValueData()).assertEqual(oddValue);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number SUB_DATA_LONGVALUE_BASIC_0100
     * @tc.name   testLongValueBasic_0100
     * @tc.desc   Verify creation with positive long value and getValueData return correctly
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testLongValueBasic_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const TAG = 'testLongValueBasic_0100';
        try {
          
          const testData: long = 1234567890 as long;
          const instance = LongValue.of(testData);
          expect(instance instanceof LongValue).assertTrue();
          const longValue = instance as LongValue;
          expect(longValue.getValueData()).assertEqual(testData);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number SUB_DATA_LONGVALUE_BASIC_0200
     * @tc.name   testLongValueBasic_0200
     * @tc.desc   Verify creation with negative long value and getValueData return correctly
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testLongValueBasic_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const TAG = 'testLongValueBasic_0200';
        try {
          
          const testData: long = -987654321 as long;
          const instance = LongValue.of(testData);
          expect(instance instanceof LongValue).assertTrue();
          const longValue = instance as LongValue;
          expect(longValue.getValueData()).assertEqual(testData);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number SUB_DATA_LONGVALUE_BOUNDARY_0300
     * @tc.name   testLongValueBoundary_0300
     * @tc.desc   Verify maximum long value handling and getValueData return correctly
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testLongValueBoundary_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const TAG = 'testLongValueBoundary_0300';
        try {
          
          const maxLong: long = 9223372036854775807 as long;
          const instance = LongValue.of(maxLong);
          expect(instance instanceof LongValue).assertTrue();
          const longValue = instance as LongValue;
          expect(longValue.getValueData()).assertEqual(maxLong);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number SUB_DATA_LONGVALUE_BOUNDARY_0400_01
     * @tc.name   testLongValueBoundary_0400
     * @tc.desc   Verify minimum long value handling and getValueData return correctly
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testLongValueBoundary_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const TAG = 'testLongValueBoundary_0400';
        try {
          
          const minLong: long = -9223372036854775808 as long;
          const instance = LongValue.of(minLong);
          expect(instance instanceof LongValue).assertTrue();
          const longValue = instance as LongValue;
          expect(longValue.getValueData()).assertEqual(minLong);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number SUB_DATA_LONGVALUE_SPECIAL_0500_01
     * @tc.name   testLongValueSpecial_0500
     * @tc.desc   Verify zero long value handling and getValueData return correctly
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testLongValueSpecial_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const TAG = 'testLongValueSpecial_0500';
        try {
          
          const zeroValue: long = 0 as long;
          const instance = LongValue.of(zeroValue);
          expect(instance instanceof LongValue).assertTrue();
          const longValue = instance as LongValue;
          expect(longValue.getValueData()).assertEqual(zeroValue);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number SUB_DATA_LONGVALUE_SPECIAL_0600_01
     * @tc.name   testLongValueSpecial_0600
     * @tc.desc   Verify one long value handling and getValueData return correctly
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testLongValueSpecial_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const TAG = 'testLongValueSpecial_0600';
        try {
          
          const oneValue: long = 1 as long;
          const instance = LongValue.of(oneValue);
          expect(instance instanceof LongValue).assertTrue();
          const longValue = instance as LongValue;
          expect(longValue.getValueData()).assertEqual(oneValue);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number SUB_DATA_LONGVALUE_SPECIAL_0700
     * @tc.name   testLongValueSpecial_0700
     * @tc.desc   Verify negative one long value handling and getValueData return correctly
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testLongValueSpecial_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const TAG = 'testLongValueSpecial_0700';
        try {
          
          const negOneValue: long = -1 as long;
          const instance = LongValue.of(negOneValue);
          expect(instance instanceof LongValue).assertTrue();
          const longValue = instance as LongValue;
          expect(longValue.getValueData()).assertEqual(negOneValue);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number SUB_DATA_LONGVALUE_BOUNDARY_0800
     * @tc.name   testLongValueBoundary_0800
     * @tc.desc   Verify near maximum long value handling and getValueData return correctly
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testLongValueBoundary_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const TAG = 'testLongValueBoundary_0800';
        try {
          
          const nearMaxValue: long = 9223372036854775806 as long;
          const instance = LongValue.of(nearMaxValue);
          expect(instance instanceof LongValue).assertTrue();
          const longValue = instance as LongValue;
          expect(longValue.getValueData()).assertEqual(nearMaxValue);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number SUB_DATA_LONGVALUE_BOUNDARY_0900
     * @tc.name   testLongValueBoundary_0900
     * @tc.desc   Verify near minimum long value handling and getValueData return correctly
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testLongValueBoundary_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const TAG = 'testLongValueBoundary_0900';
        try {
          
          const nearMinValue: long = -9223372036854775807 as long;
          const instance = LongValue.of(nearMinValue);
          expect(instance instanceof LongValue).assertTrue();
          const longValue = instance as LongValue;
          expect(longValue.getValueData()).assertEqual(nearMinValue);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number SUB_DATA_LONGVALUE_SPECIAL_1000
     * @tc.name   testLongValueSpecial_1000
     * @tc.desc   Verify large but not boundary long value handling and getValueData return correctly
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testLongValueSpecial_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const TAG = 'testLongValueSpecial_1000';
        try {
          
          const largeValue: long = 5000000000000000000 as long;
          const instance = LongValue.of(largeValue);
          expect(instance instanceof LongValue).assertTrue();
          const longValue = instance as LongValue;
          expect(longValue.getValueData()).assertEqual(largeValue);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number SUB_DATA_LONGVALUE_SPECIAL_1100
     * @tc.name   testLongValueSpecial_1100
     * @tc.desc   Verify large negative long value handling and getValueData return correctly
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testLongValueSpecial_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const TAG = 'testLongValueSpecial_1100';
        try {
          
          const largeNegValue: long = -4500000000000000000 as long;
          const instance = LongValue.of(largeNegValue);
          expect(instance instanceof LongValue).assertTrue();
          const longValue = instance as LongValue;
          expect(longValue.getValueData()).assertEqual(largeNegValue);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number SUB_DATA_LONGVALUE_SPECIAL_1200
     * @tc.name   testLongValueSpecial_1200
     * @tc.desc   Verify power-of-two long value (2^50) handling and getValueData return correctly
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testLongValueSpecial_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const TAG = 'testLongValueSpecial_1200';
        try {
          
          const pow2Value: long = 1125899906842624 as long;
          const instance = LongValue.of(pow2Value);
          expect(instance instanceof LongValue).assertTrue();
          const longValue = instance as LongValue;
          expect(longValue.getValueData()).assertEqual(pow2Value);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number SUB_DATA_LONGVALUE_BASIC_1300
     * @tc.name   testLongValueBasic_1300
     * @tc.desc   Verify medium positive long value handling and getValueData return correctly
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testLongValueBasic_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const TAG = 'testLongValueBasic_1300';
        try {
          
          const mediumValue: long = 12345678901234 as long;
          const instance = LongValue.of(mediumValue);
          expect(instance instanceof LongValue).assertTrue();
          const longValue = instance as LongValue;
          expect(longValue.getValueData()).assertEqual(mediumValue);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number SUB_DATA_LONGVALUE_BASIC_1400
     * @tc.name   testLongValueBasic_1400
     * @tc.desc   Verify medium negative long value handling and getValueData return correctly
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testLongValueBasic_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const TAG = 'testLongValueBasic_1400';
        try {
          
          const mediumNegValue: long = -98765432109876 as long;
          const instance = LongValue.of(mediumNegValue);
          expect(instance instanceof LongValue).assertTrue();
          const longValue = instance as LongValue;
          expect(longValue.getValueData()).assertEqual(mediumNegValue);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number SUB_DATA_LONGVALUE_SPECIAL_1500
     * @tc.name   testLongValueSpecial_1500
     * @tc.desc   Verify negative power-of-two long value (-2^40) handling and getValueData return correctly
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testLongValueSpecial_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const TAG = 'testLongValueSpecial_1500';
        try {
          
          const negPow2Value: long = -1099511627776 as long;
          const instance = LongValue.of(negPow2Value);
          expect(instance instanceof LongValue).assertTrue();
          const longValue = instance as LongValue;
          expect(longValue.getValueData()).assertEqual(negPow2Value);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number SUB_DATA_LONGVALUE_SPECIAL_1600
     * @tc.name   testLongValueSpecial_1600
     * @tc.desc   Verify tiny positive long value (near zero) handling and getValueData return correctly
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testLongValueSpecial_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        const TAG = 'testLongValueSpecial_1600';
        try {
          
          const tinyPosValue: long = 123 as long;
          const instance = LongValue.of(tinyPosValue);
          expect(instance instanceof LongValue).assertTrue();
          const longValue = instance as LongValue;
          expect(longValue.getValueData()).assertEqual(tinyPosValue);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number SUB_DATA_LONGVALUE_SPECIAL_1700
     * @tc.name   SUB_Data_LongValue_Special_0017
     * @tc.desc   Verify tiny negative long value (near zero) handling and getValueData return correctly
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Data_LongValue_Special_0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'testLong017 start');
        const tinyNegValue: long = -456 as long;
        const instance = LongValue.of(tinyNegValue);
        expect(instance instanceof LongValue).assertTrue();
        const longValue = instance as LongValue;
        expect(longValue.getValueData()).assertEqual(tinyNegValue);
        done();
        console.log(domain, tag, '%{public}s', 'testLong017 end');
      });

    /**
     * @tc.number SUB_DATA_LONGVALUE_SPECIAL_1800
     * @tc.name   SUB_Data_LongValue_Special_0018
     * @tc.desc   Verify power-of-ten long value (10^18) handling and getValueData return correctly
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Data_LongValue_Special_0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'testLong018 start');
        const pow10Value: long = 1000000000000000000 as long;
        const instance = LongValue.of(pow10Value);
        expect(instance instanceof LongValue).assertTrue();
        const longValue = instance as LongValue;
        expect(longValue.getValueData()).assertEqual(pow10Value);
        done();
        console.log(domain, tag, '%{public}s', 'testLong018 end');
      });

    /**
     * @tc.number SUB_DATA_LONGVALUE_SPECIAL_1900
     * @tc.name   SUB_Data_LongValue_Special_0019
     * @tc.desc   Verify negative power-of-ten long value (-10^15) handling and getValueData return correctly
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Data_LongValue_Special_0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'testLong019 start');
        const negPow10Value: long = -1000000000000000 as long;
        const instance = LongValue.of(negPow10Value);
        expect(instance instanceof LongValue).assertTrue();
        const longValue = instance as LongValue;
        expect(longValue.getValueData()).assertEqual(negPow10Value);
        done();
        console.log(domain, tag, '%{public}s', 'testLong019 end');
      });

    /**
     * @tc.number SUB_DATA_LONGVALUE_BASIC_2000
     * @tc.name   SUB_Data_LongValue_Basic_0020
     * @tc.desc   Verify mid-range positive long value (with odd digits) handling and getValueData return correctly
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Data_LongValue_Basic_0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'testLong020 start');
        const midOddValue: long = 7654321987654321 as long;
        const instance = LongValue.of(midOddValue);
        expect(instance instanceof LongValue).assertTrue();
        const longValue = instance as LongValue;
        expect(longValue.getValueData()).assertEqual(midOddValue);
        done();
        console.log(domain, tag, '%{public}s', 'testLong020 end');
      });

    /**
     * @tc.number SUB_DATA_SHORTVALUE_BASIC_0100
     * @tc.name   SUB_Data_ShortValue_Basic_0001
     * @tc.desc   Verify creation with positive short value and getValueData return correctly
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Data_ShortValue_Basic_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'testShort001 start');
        const testData: short = 12345 as short;
        const instance = ShortValue.of(testData);
        expect(instance instanceof ShortValue).assertTrue();
        const shortValue = instance as ShortValue;
        expect(shortValue.getValueData()).assertEqual(testData);
        done();
        console.log(domain, tag, '%{public}s', 'testShort001 end');
      });

    /**
     * @tc.number SUB_DATA_SHORTVALUE_BASIC_0200
     * @tc.name   SUB_Data_ShortValue_Basic_0002
     * @tc.desc   Verify creation with negative short value and getValueData return correctly
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Data_ShortValue_Basic_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'testShort002 start');
        const testData: short = -9876 as short;
        const instance = ShortValue.of(testData);
        expect(instance instanceof ShortValue).assertTrue();
        const shortValue = instance as ShortValue;
        expect(shortValue.getValueData()).assertEqual(testData);
        done();
        console.log(domain, tag, '%{public}s', 'testShort002 end');
      });

    /**
     * @tc.number SUB_DATA_SHORTVALUE_BOUNDARY_0300
     * @tc.name   SUB_Data_ShortValue_Boundary_0003
     * @tc.desc   Verify maximum short value handling and getValueData return correctly
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Data_ShortValue_Boundary_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'testShort003 start');
        const maxValue: short = 32767 as short;
        const instance = ShortValue.of(maxValue);
        expect(instance instanceof ShortValue).assertTrue();
        const shortValue = instance as ShortValue;
        expect(shortValue.getValueData()).assertEqual(maxValue);
        done();
        console.log(domain, tag, '%{public}s', 'testShort003 end');
      });

    /**
     * @tc.number SUB_DATA_SHORTVALUE_BOUNDARY_0400
     * @tc.name   SUB_Data_ShortValue_Boundary_0004
     * @tc.desc   Verify minimum short value handling and getValueData return correctly
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Data_ShortValue_Boundary_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'testShort004 start');
        const minValue: short = -32768 as short;
        const instance = ShortValue.of(minValue);
        expect(instance instanceof ShortValue).assertTrue();
        const shortValue = instance as ShortValue;
        expect(shortValue.getValueData()).assertEqual(minValue);
        done();
        console.log(domain, tag, '%{public}s', 'testShort004 end');
      });

    /**
     * @tc.number SUB_DATA_SHORTVALUE_SPECIAL_0500
     * @tc.name   SUB_Data_ShortValue_Special_0005
     * @tc.desc   Verify zero short value handling and getValueData return correctly
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Data_ShortValue_Special_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'testShort005 start');
        const zeroValue: short = 0 as short;
        const instance = ShortValue.of(zeroValue);
        expect(instance instanceof ShortValue).assertTrue();
        const shortValue = instance as ShortValue;
        expect(shortValue.getValueData()).assertEqual(zeroValue);
        done();
        console.log(domain, tag, '%{public}s', 'testShort005 end');
      });

    /**
     * @tc.number SUB_DATA_SHORTVALUE_SPECIAL_0600
     * @tc.name   SUB_Data_ShortValue_Special_0006
     * @tc.desc   Verify one short value handling and getValueData return correctly
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Data_ShortValue_Special_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'testShort006 start');
        const oneValue: short = 1 as short;
        const instance = ShortValue.of(oneValue);
        expect(instance instanceof ShortValue).assertTrue();
        const shortValue = instance as ShortValue;
        expect(shortValue.getValueData()).assertEqual(oneValue);
        done();
        console.log(domain, tag, '%{public}s', 'testShort006 end');
      });

    /**
     * @tc.number SUB_DATA_SHORTVALUE_BOUNDARY_0800
     * @tc.name   SUB_Data_ShortValue_Boundary_0008
     * @tc.desc   Verify near maximum short value handling and getValueData return correctly
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Data_ShortValue_Boundary_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'testShort008 start');
        const nearMaxValue: short = 32766 as short;
        const instance = ShortValue.of(nearMaxValue);
        expect(instance instanceof ShortValue).assertTrue();
        const shortValue = instance as ShortValue;
        expect(shortValue.getValueData()).assertEqual(nearMaxValue);
        done();
        console.log(domain, tag, '%{public}s', 'testShort008 end');
      });

    /**
     * @tc.number SUB_DATA_SHORTVALUE_BOUNDARY_0900
     * @tc.name   SUB_Data_ShortValue_Boundary_0009
     * @tc.desc   Verify near minimum short value handling and getValueData return correctly
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Data_ShortValue_Boundary_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'testShort009 start');
        const nearMinValue: short = -32767 as short;
        const instance = ShortValue.of(nearMinValue);
        expect(instance instanceof ShortValue).assertTrue();
        const shortValue = instance as ShortValue;
        expect(shortValue.getValueData()).assertEqual(nearMinValue);
        done();
        console.log(domain, tag, '%{public}s', 'testShort009 end');
      });

    /**
     * @tc.number SUB_DATA_SHORTVALUE_BASIC_1200
     * @tc.name   SUB_Data_ShortValue_Basic_0012
     * @tc.desc   Verify medium positive short value handling and getValueData return correctly
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Data_ShortValue_Basic_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'testShort012 start');
        const mediumPosValue: short = 1234 as short;
        const instance = ShortValue.of(mediumPosValue);
        expect(instance instanceof ShortValue).assertTrue();
        const shortValue = instance as ShortValue;
        expect(shortValue.getValueData()).assertEqual(mediumPosValue);
        done();
        console.log(domain, tag, '%{public}s', 'testShort012 end');
      });

    /**
     * @tc.number SUB_DATA_SHORTVALUE_BASIC_1300
     * @tc.name   SUB_Data_ShortValue_Basic_0013
     * @tc.desc   Verify medium negative short value handling and getValueData return correctly
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Data_ShortValue_Basic_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'testShort013 start');
        const mediumNegValue: short = -5678 as short;
        const instance = ShortValue.of(mediumNegValue);
        expect(instance instanceof ShortValue).assertTrue();
        const shortValue = instance as ShortValue;
        expect(shortValue.getValueData()).assertEqual(mediumNegValue);
        done();
        console.log(domain, tag, '%{public}s', 'testShort013 end');
      });

    /**
     * @tc.number SUB_DATA_SHORTVALUE_SPECIAL_1500
     * @tc.name   SUB_Data_ShortValue_Special_0015
     * @tc.desc   Verify power-of-two short value (2^10) handling and getValueData return correctly
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Data_ShortValue_Special_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'testShort015 start');
        const pow2Value: short = 1024 as short;
        const instance = ShortValue.of(pow2Value);
        expect(instance instanceof ShortValue).assertTrue();
        const shortValue = instance as ShortValue;
        expect(shortValue.getValueData()).assertEqual(pow2Value);
        done();
        console.log(domain, tag, '%{public}s', 'testShort015 end');
      });

    /**
     * @tc.number SUB_DATA_SHORTVALUE_SPECIAL_1600
     * @tc.name   SUB_Data_ShortValue_Special_0016
     * @tc.desc   Verify small positive short value (near zero) handling and getValueData return correctly
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Data_ShortValue_Special_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'testShort016 start');
        const smallPosValue: short = 100 as short;
        const instance = ShortValue.of(smallPosValue);
        expect(instance instanceof ShortValue).assertTrue();
        const shortValue = instance as ShortValue;
        expect(shortValue.getValueData()).assertEqual(smallPosValue);
        done();
        console.log(domain, tag, '%{public}s', 'testShort016 end');
      });

    /**
     * @tc.number SUB_DATA_SHORTVALUE_SPECIAL_1700
     * @tc.name   SUB_Data_ShortValue_Special_0017
     * @tc.desc   Verify small negative short value (near zero) handling and getValueData return correctly
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Data_ShortValue_Special_0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'testShort017 start');
        const smallNegValue: short = -200 as short;
        const instance = ShortValue.of(smallNegValue);
        expect(instance instanceof ShortValue).assertTrue();
        const shortValue = instance as ShortValue;
        expect(shortValue.getValueData()).assertEqual(smallNegValue);
        done();
        console.log(domain, tag, '%{public}s', 'testShort017 end');
      });

    /**
     * @tc.number SUB_DATA_SHORTVALUE_SPECIAL_1800
     * @tc.name   SUB_Data_ShortValue_Special_0018
     * @tc.desc   Verify power-of-ten short value (10^3) handling and getValueData return correctly
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Data_ShortValue_Special_0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'testShort018 start');
        const pow10Value: short = 1000 as short;
        const instance = ShortValue.of(pow10Value);
        expect(instance instanceof ShortValue).assertTrue();
        const shortValue = instance as ShortValue;
        expect(shortValue.getValueData()).assertEqual(pow10Value);
        done();
        console.log(domain, tag, '%{public}s', 'testShort018 end');
      });

    /**
     * @tc.number SUB_DATA_SHORTVALUE_BASIC_1900
     * @tc.name   SUB_Data_ShortValue_Basic_0019
     * @tc.desc   Verify odd positive short value handling and getValueData return correctly
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Data_ShortValue_Basic_0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'testShort019 start');
        const oddPosValue: short = 12345 as short;
        const instance = ShortValue.of(oddPosValue);
        expect(instance instanceof ShortValue).assertTrue();
        const shortValue = instance as ShortValue;
        expect(shortValue.getValueData()).assertEqual(oddPosValue);
        done();
        console.log(domain, tag, '%{public}s', 'testShort019 end');
      });

    /**
     * @tc.number SUB_DATA_SHORTVALUE_BASIC_2000
     * @tc.name   SUB_Data_ShortValue_Basic_0020
     * @tc.desc   Verify even negative short value handling and getValueData return correctly
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Data_ShortValue_Basic_0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'testShort020 start');
        const evenNegValue: short = -9876 as short;
        const instance = ShortValue.of(evenNegValue);
        expect(instance instanceof ShortValue).assertTrue();
        const shortValue = instance as ShortValue;
        expect(shortValue.getValueData()).assertEqual(evenNegValue);
        done();
        console.log(domain, tag, '%{public}s', 'testShort020 end');
      });

  /**
     * @tc.number SUB_DATA_ARRAYVALUE_LENGTH_SINGLEELEMENT_0100
     * @tc.name   SUB_Data_ArrayValue_Length_SingleElement_0001
     * @tc.desc   Verify getLength returns correct length for single element array
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Data_ArrayValue_Length_SingleElement_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'test001 start');
        let testValues: FixedArray<number> = [42];
        let instance = ArrayValue.of(testValues);
        let arrayValue = instance as ArrayValue;
        expect(arrayValue.getLength()).assertEqual(1);
        done();
        console.log(domain, tag, '%{public}s', 'test001 end');
      });

    /**
     * @tc.number SUB_DATA_ARRAYVALUE_LENGTH_BOOLEANARRAY_0200
     * @tc.name   SUB_Data_ArrayValue_Length_BooleanArray_0002
     * @tc.desc   Verify getLength returns correct length for boolean array
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Data_ArrayValue_Length_BooleanArray_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'test002 start');
        let testValues: FixedArray<boolean> = [true, false, true];
        let instance = ArrayValue.of(testValues);
        let arrayValue = instance as ArrayValue;
        expect(arrayValue.getLength()).assertEqual(3);
        done();
        console.log(domain, tag, '%{public}s', 'test002 end');
      });

    /**
     * @tc.number SUB_DATA_ARRAYVALUE_LENGTH_STRINGARRAY_0300
     * @tc.name   SUB_Data_ArrayValue_Length_StringArray_0003
     * @tc.desc   Verify getLength returns correct length for string array
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Data_ArrayValue_Length_StringArray_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'test003 start');
        let testValues: FixedArray<string> = ["hello", "world", "test", "array"];
        let instance = ArrayValue.of(testValues);
        let arrayValue = instance as ArrayValue;
        expect(arrayValue.getLength()).assertEqual(4);
        done();
        console.log(domain, tag, '%{public}s', 'test003 end');
      });

    /**
     * @tc.number SUB_DATA_ARRAYVALUE_LENGTH_LONGARRAY_0400
     * @tc.name   SUB_Data_ArrayValue_Length_LongArray_0004
     * @tc.desc   Verify getLength returns correct length for long array
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Data_ArrayValue_Length_LongArray_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'test004 start');
        let testValues: FixedArray<long> = [123456789012345, 987654321098765];
        let instance = ArrayValue.of(testValues);
        let arrayValue = instance as ArrayValue;
        expect(arrayValue.getLength()).assertEqual(2);
        done();
        console.log(domain, tag, '%{public}s', 'test004 end');
      });

    /**
     * @tc.number SUB_DATA_ARRAYVALUE_LENGTH_LARGEARRAY_0500
     * @tc.name   SUB_Data_ArrayValue_Length_LargeArray_0005
     * @tc.desc   Verify getLength returns correct length for large size array
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Data_ArrayValue_Length_LargeArray_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'test005 start');
        let testValues: FixedArray<number> = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
        let instance = ArrayValue.of(testValues);
        let arrayValue = instance as ArrayValue;
        expect(arrayValue.getLength()).assertEqual(10);
        done();
        console.log(domain, tag, '%{public}s', 'test005 end');
      });

    /**
     * @tc.number SUB_DATA_ARRAYVALUE_LENGTH_NULLELEMENTS_0600
     * @tc.name   SUB_Data_ArrayValue_Length_NullElements_0006
     * @tc.desc   Verify getLength returns correct length for array with null elements
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Data_ArrayValue_Length_NullElements_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'test006 start');
        let testValues: FixedArray<number | null> = [null, 2, null, 4];
        let instance = ArrayValue.of(testValues);
        let arrayValue = instance as ArrayValue;
        expect(arrayValue.getLength()).assertEqual(4);
        done();
        console.log(domain, tag, '%{public}s', 'test006 end');
      });

    /**
     * @tc.number SUB_DATA_ARRAYVALUE_LENGTH_NESTEDARRAYS_0700
     * @tc.name   SUB_Data_ArrayValue_Length_NestedArrays_0007
     * @tc.desc   Verify getLength returns correct length for array containing nested arrays
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Data_ArrayValue_Length_NestedArrays_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'test007 start');
        let testValues: FixedArray<FixedArray<number>> = [[1, 2], [3, 4, 5], [6]];
        let instance = ArrayValue.of(testValues);
        let arrayValue = instance as ArrayValue;
        expect(arrayValue.getLength()).assertEqual(3);
        done();
        console.log(domain, tag, '%{public}s', 'test007 end');
      });

    /**
     * @tc.number SUB_DATA_ARRAYVALUE_LENGTH_NONEMPTYARRAY_0800
     * @tc.name   SUB_Data_ArrayValue_Length_NonEmptyArray_0008
     * @tc.desc   Verify getLength returns correct length for non-empty array
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Data_ArrayValue_Length_NonEmptyArray_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'test008 start');
        let testValues: FixedArray<number> = [123, 456, 789];
        let instance = ArrayValue.of(testValues);
        let arrayValue = instance as ArrayValue;
        expect(arrayValue.getLength()).assertEqual(3);
        done();
        console.log(domain, tag, '%{public}s', 'test008 end');
      });

    /**
     * @tc.number SUB_DATA_ARRAYVALUE_LENGTH_EMPTYARRAY_0900
     * @tc.name   SUB_Data_ArrayValue_Length_EmptyArray_0009
     * @tc.desc   Verify getLength returns correct length for empty array
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Data_ArrayValue_Length_EmptyArray_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'test009 start');
        let testValues: FixedArray<number> = [];
        let instance = ArrayValue.of(testValues);
        let arrayValue = instance as ArrayValue;
        expect(arrayValue.getLength()).assertEqual(0);
        done();
        console.log(domain, tag, '%{public}s', 'test009 end');
      });

    /**
     * @tc.number SUB_DATA_ARRAYVALUE_LENGTH_MIXEDARRAY_1000
     * @tc.name   SUB_Data_ArrayValue_Length_MixedArray_0010
     * @tc.desc   Verify getLength returns correct length for mixed type array
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Data_ArrayValue_Length_MixedArray_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'test010 start');
        let testValues: FixedArray<number | string> = [123, "abc", 456, "def"];
        let instance = ArrayValue.of(testValues);
        let arrayValue = instance as ArrayValue;
        expect(arrayValue.getLength()).assertEqual(4);
        done();
        console.log(domain, tag, '%{public}s', 'test010 end');
      });

    /**
     * @tc.number SUB_DATA_ARRAYVALUE_LENGTH_MULTIPLE_1100
     * @tc.name   SUB_Data_ArrayValue_Length_Multiple_0011
     * @tc.desc   Verify getLength returns correct lengths for multiple ArrayValue objects
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Data_ArrayValue_Length_Multiple_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'test011 start');
        let testValues1: FixedArray<number> = [123, 456, 789];
        let testValues2: FixedArray<string> = ["apple", "banana", "cherry"];
        let instance1 = ArrayValue.of(testValues1);
        let instance2 = ArrayValue.of(testValues2);
        let arrayValue1 = instance1 as ArrayValue;
        let arrayValue2 = instance2 as ArrayValue;
        expect(arrayValue1.getLength()).assertEqual(3);
        expect(arrayValue2.getLength()).assertEqual(3);
        done();
        console.log(domain, tag, '%{public}s', 'test011 end');
      });

    /**
     * @tc.number SUB_DATA_ARRAYVALUE_LENGTH_BOOLEANARRAY_1300
     * @tc.name   SUB_Data_ArrayValue_Length_BooleanArray_0013
     * @tc.desc   Verify getLength returns correct length for boolean array
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Data_ArrayValue_Length_BooleanArray_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'test013 start');
        let testValues: FixedArray<boolean> = [true, false, true, false];
        let instance = ArrayValue.of(testValues);
        let arrayValue = instance as ArrayValue;
        expect(arrayValue.getLength()).assertEqual(4);
        done();
        console.log(domain, tag, '%{public}s', 'test013 end');
      });

    /**
     * @tc.number SUB_DATA_ARRAYVALUE_LENGTH_LONGARRAY_1400
     * @tc.name   SUB_Data_ArrayValue_Length_LongArray_0014
     * @tc.desc   Verify getLength returns correct length for long type array
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Data_ArrayValue_Length_LongArray_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'test014 start');
        let testValues: FixedArray<long> = [123456789012345, 987654321098765, 1122334455667788];
        let instance = ArrayValue.of(testValues);
        let arrayValue = instance as ArrayValue;
        expect(arrayValue.getLength()).assertEqual(3);
        done();
        console.log(domain, tag, '%{public}s', 'test014 end');
      });

    /**
     * @tc.number SUB_DATA_ARRAYVALUE_LENGTH_NULLINARRAY_1500
     * @tc.name   SUB_Data_ArrayValue_Length_NullInArray_0015
     * @tc.desc   Verify getLength returns correct length for array containing null elements
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Data_ArrayValue_Length_NullInArray_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'test015 start');
        let testValues: FixedArray<number | null> = [null, 200, null, 400, null];
        let instance = ArrayValue.of(testValues);
        let arrayValue = instance as ArrayValue;
        expect(arrayValue.getLength()).assertEqual(5);
        done();
        console.log(domain, tag, '%{public}s', 'test015 end');
      });

    /**
     * @tc.number SUB_DATA_ARRAYVALUE_LENGTH_SINGLEELEMENT_1600
     * @tc.name   SUB_Data_ArrayValue_Length_SingleElement_0016
     * @tc.desc   Verify getLength returns correct length for array with single element
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Data_ArrayValue_Length_SingleElement_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'test016 start');
        let testValues: FixedArray<string> = ["onlyElement"];
        let instance = ArrayValue.of(testValues);
        let arrayValue = instance as ArrayValue;
        expect(arrayValue.getLength()).assertEqual(1);
        done();
        console.log(domain, tag, '%{public}s', 'test016 end');
      });

    /**
     * @tc.number SUB_DATA_ARRAYVALUE_LENGTH_DEEPERNESTEDARRAY_1700
     * @tc.name   SUB_Data_ArrayValue_Length_DeeperNestedArray_0017
     * @tc.desc   Verify getLength returns correct length for array with deeper nested arrays
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Data_ArrayValue_Length_DeeperNestedArray_0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'test017 start');
        let testValues: FixedArray<FixedArray<FixedArray<number>>> = [[[1]], [[2, 3]], [[4, 5, 6]], [[7]]];
        let instance = ArrayValue.of(testValues);
        let arrayValue = instance as ArrayValue;
        expect(arrayValue.getLength()).assertEqual(4);
        done();
        console.log(domain, tag, '%{public}s', 'test017 end');
      });

    const getValidLambdaType = (): LambdaType => {
    };
    const getValidFunction = (): Function => {
      return () => "test result";
    };
  });
}