/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function builtinsComparisonAndEqualityTest() {
  describe('builtinsComparisonAndEqualityTest', () => {
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
     * @tc.name    builtinsComparisonAndEqualityTest0001
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0001
     * @tc.desc    Test static compare method with same object instance
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let sameObj = new Char(c'\u0041');
      expect(Char.compare(sameObj, sameObj)).assertTrue();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0002
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0002
     * @tc.desc    Test static compare method with different objects but identical primitive value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let value1 = new Char(c'\u00E9');
      let value2 = new Char(c'\u00E9');
      expect(Char.compare(value1, value2)).assertTrue();
      expect(Char.compare(value2, value1)).assertTrue();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0007
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0007
     * @tc.desc    Test static compare method with different primitive values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let uppercaseA = new Char(c'\u0041');
      let uppercaseB = new Char(c'\u0042');
      expect(Char.compare(uppercaseA, uppercaseB)).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0008
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0008
     * @tc.desc    Test static compare method with boundary values MIN_VALUE and MAX_VALUE
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let minVal = new Char(Char.MIN_VALUE);
      let maxVal = new Char(Char.MAX_VALUE);
      expect(Char.compare(minVal, minVal)).assertTrue();
      expect(Char.compare(maxVal, maxVal)).assertTrue();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0009
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0009
     * @tc.desc    Test static compare method inequality across extreme boundaries
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let minVal = new Char(Char.MIN_VALUE);
      let maxVal = new Char(Char.MAX_VALUE);
      expect(Char.compare(minVal, maxVal)).assertFalse();
      expect(Char.compare(maxVal, minVal)).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0010
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0010
     * @tc.desc    Test static compare method surrogate range boundaries self-equality
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let highMin = new Char(Char.HIGH_SURROGATE_MIN);
      let highMax = new Char(Char.HIGH_SURROGATE_MAX);
      let lowMin = new Char(Char.LOW_SURROGATE_MIN);
      let lowMax = new Char(Char.LOW_SURROGATE_MAX);
      expect(Char.compare(highMin, highMin)).assertTrue();
      expect(Char.compare(highMax, highMax)).assertTrue();
      expect(Char.compare(lowMin, lowMin)).assertTrue();
      expect(Char.compare(lowMax, lowMax)).assertTrue();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0011
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0011
     * @tc.desc    Test static compare method inequality within surrogate ranges
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let highMin = new Char(Char.HIGH_SURROGATE_MIN);
      let highMax = new Char(Char.HIGH_SURROGATE_MAX);
      let lowMin = new Char(Char.LOW_SURROGATE_MIN);
      let lowMax = new Char(Char.LOW_SURROGATE_MAX);
      expect(Char.compare(highMin, highMax)).assertFalse();
      expect(Char.compare(lowMin, lowMax)).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0012
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0012
     * @tc.desc    Test static compare method Unicode range coverage self-equality
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
     it('builtinsComparisonAndEqualityTest0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let controlChar = new Char(c'\u0001');
      let latin1Char = new Char(c'\u00FF');
      let cjkUnified = new Char(c'\u4E00');
      let surrogateStart = new Char(c'\uD800');
      let privateUseStart = new Char(c'\uE000');
      expect(Char.compare(controlChar, controlChar)).assertTrue();
      expect(Char.compare(latin1Char, latin1Char)).assertTrue();
      expect(Char.compare(cjkUnified, cjkUnified)).assertTrue();
      expect(Char.compare(surrogateStart, surrogateStart)).assertTrue();
      expect(Char.compare(privateUseStart, privateUseStart)).assertTrue();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0013
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0013
     * @tc.desc    Test static compare method cross-range inequality verification
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let controlChar = new Char(c'\u0001');
      let latin1Char = new Char(c'\u00FF');
      let cjkUnified = new Char(c'\u4E00');
      let surrogateStart = new Char(c'\uD800');
      let privateUseStart = new Char(c'\uE000');
      expect(Char.compare(controlChar, latin1Char)).assertFalse();
      expect(Char.compare(latin1Char, cjkUnified)).assertFalse();
      expect(Char.compare(surrogateStart, privateUseStart)).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0014
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0014
     * @tc.desc    Test instance compareTo method basic ASCII ordering
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let space = new Char(c'\u0020');
      let digit0 = new Char(c'\u0030');
      let digit9 = new Char(c'\u0039');
      let uppercaseA = new Char(c'\u0041');
      let uppercaseZ = new Char(c'\u005A');
      let lowercaseA = new Char(c'\u0061');
      expect(space.compareTo(digit0)).assertEqual(-1);
      expect(digit0.compareTo(space)).assertEqual(1);
      expect(digit0.compareTo(digit9)).assertEqual(-1);
      expect(digit9.compareTo(uppercaseA)).assertEqual(-1);
      expect(uppercaseA.compareTo(uppercaseZ)).assertEqual(-1);
      expect(uppercaseZ.compareTo(lowercaseA)).assertEqual(-1);
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0015
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0015
     * @tc.desc    Test instance compareTo method self-comparison returns zero
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let space = new Char(c'\u0020');
      let digit0 = new Char(c'\u0030');
      let uppercaseA = new Char(c'\u0041');
      expect(space.compareTo(space)).assertEqual(0);
      expect(digit0.compareTo(digit0)).assertEqual(0);
      expect(uppercaseA.compareTo(uppercaseA)).assertEqual(0);
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0016
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0016
     * @tc.desc    Test instance compareTo method extreme boundary ordering
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let minVal = new Char(Char.MIN_VALUE);
      let maxVal = new Char(Char.MAX_VALUE);
      expect(minVal.compareTo(maxVal)).assertEqual(-1);
      expect(maxVal.compareTo(minVal)).assertEqual(1);
      expect(minVal.compareTo(minVal)).assertEqual(0);
      expect(maxVal.compareTo(maxVal)).assertEqual(0);
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0017
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0017
     * @tc.desc    Test instance compareTo method surrogate range internal ordering
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let highMin = new Char(Char.HIGH_SURROGATE_MIN);
      let highMax = new Char(Char.HIGH_SURROGATE_MAX);
      let lowMin = new Char(Char.LOW_SURROGATE_MIN);
      let lowMax = new Char(Char.LOW_SURROGATE_MAX);
      expect(highMin.compareTo(highMax)).assertEqual(-1);
      expect(highMax.compareTo(highMin)).assertEqual(1);
      expect(lowMin.compareTo(lowMax)).assertEqual(-1);
      expect(lowMax.compareTo(lowMin)).assertEqual(1);
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0018
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0018
     * @tc.desc    Test instance compareTo method cross-surrogate range ordering
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let highMax = new Char(Char.HIGH_SURROGATE_MAX);
      let lowMin = new Char(Char.LOW_SURROGATE_MIN);
      expect(highMax.compareTo(lowMin)).assertEqual(-1);
      expect(lowMin.compareTo(highMax)).assertEqual(1);
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0019
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0019
     * @tc.desc    Test instance compareTo method Unicode range transition ordering
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let controlEnd = new Char(c'\u001F');
      let spaceChar = new Char(c'\u0020');
      let latin1End = new Char(c'\u00FF');
      let cjkStart = new Char(c'\u4E00');
      let surrogateStart = new Char(c'\uD800');
      let privateStart = new Char(c'\uE000');
      expect(controlEnd.compareTo(spaceChar)).assertEqual(-1);
      expect(spaceChar.compareTo(controlEnd)).assertEqual(1);
      expect(latin1End.compareTo(cjkStart)).assertEqual(-1);
      expect(cjkStart.compareTo(latin1End)).assertEqual(1);
      expect(cjkStart.compareTo(surrogateStart)).assertEqual(-1);
      expect(surrogateStart.compareTo(cjkStart)).assertEqual(1);
      expect(surrogateStart.compareTo(privateStart)).assertEqual(-1);
      expect(privateStart.compareTo(surrogateStart)).assertEqual(1);
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0020
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0020
     * @tc.desc    Test instance compareTo method consecutive code point ordering
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let codePoint1 = new Char(c'\u1234');
      let codePoint2 = new Char(c'\u1235');
      expect(codePoint1.compareTo(codePoint2)).assertEqual(-1);
      expect(codePoint2.compareTo(codePoint1)).assertEqual(1);
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0021
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0021
     * @tc.desc    Test instance compareTo method surrogate range edge transitions
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let beforeHighSurrogate = new Char(c'\uD7FF');
      let highMin = new Char(Char.HIGH_SURROGATE_MIN);
      let lowMax = new Char(Char.LOW_SURROGATE_MAX);
      let afterLowSurrogate = new Char(c'\uE000');
      expect(beforeHighSurrogate.compareTo(highMin)).assertEqual(-1);
      expect(highMin.compareTo(beforeHighSurrogate)).assertEqual(1);
      expect(lowMax.compareTo(afterLowSurrogate)).assertEqual(-1);
      expect(afterLowSurrogate.compareTo(lowMax)).assertEqual(1);
    });
    /**
     * @tc.name    builtinsComparisonAndEqualityTest0022
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0022
     * @tc.desc    Test equals method with same object reference identity
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charInstance = new Char(c'\u0041');
      expect(charInstance.equals(charInstance)).assertTrue();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0023
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0023
     * @tc.desc    Test equals method with different objects sharing identical primitive value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let char1 = new Char(c'\u00E9');
      let char2 = new Char(c'\u00E9');
      expect(char1.equals(char2)).assertTrue();
      expect(char2.equals(char1)).assertTrue();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0024
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0024
     * @tc.desc    Test equals method with different primitive values returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
     it('builtinsComparisonAndEqualityTest0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let uppercaseA = new Char(c'\u0041');
      let uppercaseB = new Char(c'\u0042');
      expect(uppercaseA.equals(uppercaseB)).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0025
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0025
     * @tc.desc    Test equals method with null argument returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charInstance = new Char(c'\u0041');
      expect(charInstance.equals(null)).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0026
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0026
     * @tc.desc    Test equals method with undefined argument returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charInstance = new Char(c'\u0041');
      expect(charInstance.equals(undefined)).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0027
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0027
     * @tc.desc    Test equals method with number primitive type returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charInstance = new Char(c'\u0041');
      // Char.equals() only accepts Char type parameters
      expect(charInstance.equals(new Char(c'\u0041')) === true).assertTrue();
      expect(charInstance.equals(new Char(c'\u0000')) === false).assertTrue();
      // For non-Char parameters, equals() should return false
      expect(charInstance.equals(65) === false).assertTrue();
      expect(charInstance.equals(0) === false).assertTrue();
      expect(charInstance.equals(NaN) === false).assertTrue();
      expect(charInstance.equals(Infinity) === false).assertTrue();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0028
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0028
     * @tc.desc    Test equals method with string primitive type returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charInstance = new Char(c'\u0041');
      expect(charInstance.equals("A")).assertFalse();
      expect(charInstance.equals(String.fromCharCode(65))).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0029
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0029
     * @tc.desc    Test equals method with boolean primitive type returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charInstance = new Char(c'\u0041');
      expect(charInstance.equals(true)).assertFalse();
      expect(charInstance.equals(false)).assertFalse();
    });
    /**
     * @tc.name    builtinsComparisonAndEqualityTest0030
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0030
     * @tc.desc    Test equals method with array type argument returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charInstance = new Char(c'\u0041');
      let testArray: char[] = [c'\u0041'];
      let emptyArray: string[] = [];
      expect(charInstance.equals(testArray)).assertFalse();
      expect(charInstance.equals(emptyArray)).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0031
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0031
     * @tc.desc    Test equals method with MIN_VALUE boundary self-equality
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let minVal = new Char(Char.MIN_VALUE);
      expect(minVal.equals(minVal)).assertTrue();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0032
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0032
     * @tc.desc    Test equals method with MAX_VALUE boundary self-equality
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let maxVal = new Char(Char.MAX_VALUE);
      expect(maxVal.equals(maxVal)).assertTrue();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0033
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0033
     * @tc.desc    Test equals method with different objects holding MIN_VALUE and MAX_VALUE
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let minVal1 = new Char(Char.MIN_VALUE);
      let minVal2 = new Char(Char.MIN_VALUE);
      let maxVal1 = new Char(Char.MAX_VALUE);
      let maxVal2 = new Char(Char.MAX_VALUE);
      expect(minVal1.equals(minVal2)).assertTrue();
      expect(maxVal1.equals(maxVal2)).assertTrue();
      expect(minVal1.equals(maxVal1)).assertFalse();
      expect(maxVal1.equals(minVal1)).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0034
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0034
     * @tc.desc    Test equals method with surrogate range characters self-equality
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let highMin = new Char(Char.HIGH_SURROGATE_MIN);
      let highMax = new Char(Char.HIGH_SURROGATE_MAX);
      let lowMin = new Char(Char.LOW_SURROGATE_MIN);
      let lowMax = new Char(Char.LOW_SURROGATE_MAX);
      let highMinDup = new Char(Char.HIGH_SURROGATE_MIN);
      let lowMaxDup = new Char(Char.LOW_SURROGATE_MAX);
      expect(highMin.equals(highMinDup)).assertTrue();
      expect(lowMax.equals(lowMaxDup)).assertTrue();
      expect(highMax.equals(highMin)).assertFalse();
      expect(lowMin.equals(lowMax)).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0035
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0035
     * @tc.desc    Test equals method with Unicode control characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let controlChar1 = new Char(c'\u0000');
      let controlChar2 = new Char(c'\u0000');
      let controlChar3 = new Char(c'\u001F');
      expect(controlChar1.equals(controlChar2)).assertTrue();
      expect(controlChar1.equals(controlChar3)).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0036
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0036
     * @tc.desc    Test equals method with Latin-1 supplement characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let latinChar1 = new Char(c'\u00A9');
      let latinChar2 = new Char(c'\u00A9');
      let latinChar3 = new Char(c'\u00FF');
      expect(latinChar1.equals(latinChar2)).assertTrue();
      expect(latinChar1.equals(latinChar3)).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0037
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0037
     * @tc.desc    Test equals method with CJK Unified Ideographs
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let cjkChar1 = new Char(c'\u4E00');
      let cjkChar2 = new Char(c'\u4E00');
      let cjkChar3 = new Char(c'\u9FFF');
      expect(cjkChar1.equals(cjkChar2)).assertTrue();
      expect(cjkChar1.equals(cjkChar3)).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0038
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0038
     * @tc.desc    Test equals method symmetry property
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let char1 = new Char(c'\u00E9');
      let char2 = new Char(c'\u00E9');
      expect(char1.equals(char2)).assertEqual(char2.equals(char1));
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0039
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0039
     * @tc.desc    Test equals method with Emoji characters (surrogate plane)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let emojiChar1 = new Char(c'\uD83D');
      let emojiChar2 = new Char(c'\uD83D');
      let emojiChar3 = new Char(c'\uDE00');
      expect(emojiChar1.equals(emojiChar2)).assertTrue();
      expect(emojiChar1.equals(emojiChar3)).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0040
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0040
     * @tc.desc    Test equals method with private use area characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let privateChar1 = new Char(c'\uE000');
      let privateChar2 = new Char(c'\uE000');
      let privateChar3 = new Char(c'\uF8FF');
      expect(privateChar1.equals(privateChar2)).assertTrue();
      expect(privateChar1.equals(privateChar3)).assertFalse();
    });
    /**
     * @tc.name    builtinsComparisonAndEqualityTest0041
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0041
     * @tc.desc    Test equals method with Char having different value returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charA = new Char(c'A');
      let charB = new Char(c'B');
      expect(charA.equals(charB)).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0042
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0042
     * @tc.desc    Test equals method with Int8Array instance returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charA = new Char(c'A');
      let int8Array = new Int8Array([72, 101, 108, 108, 111]);
      expect(charA.equals(int8Array)).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0043
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0043
     * @tc.desc    Test equals method with Uint8Array instance returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charA = new Char(c'A');
      let uint8Array = new Uint8Array([72, 101, 108, 108, 111]);
      expect(charA.equals(uint8Array)).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0044
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0044
     * @tc.desc    Test equals method with Uint8ClampedArray instance returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charA = new Char(c'A');
      let clampedArray = new Uint8ClampedArray([72, 101, 108, 108, 111]);
      expect(charA.equals(clampedArray)).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0045
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0045
     * @tc.desc    Test equals method with Int16Array instance returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charA = new Char(c'A');
      let int16Array = new Int16Array([72, 101, 108, 108, 111]);
      expect(charA.equals(int16Array)).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0046
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0046
     * @tc.desc    Test equals method with Uint16Array instance returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charA = new Char(c'A');
      let uint16Array = new Uint16Array([72, 101, 108, 108, 111]);
      expect(charA.equals(uint16Array)).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0047
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0047
     * @tc.desc    Test equals method with Int32Array instance returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charA = new Char(c'A');
      let int32Array = new Int32Array([72, 101, 108, 108, 111]);
      expect(charA.equals(int32Array)).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0048
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0048
     * @tc.desc    Test equals method with Uint32Array instance returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charA = new Char(c'A');
      let uint32Array = new Uint32Array([72, 101, 108, 108, 111]);
      expect(charA.equals(uint32Array)).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0049
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0049
     * @tc.desc    Test equals method with Float32Array instance returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charA = new Char(c'A');
      let float32Array = new Float32Array([72.5, 101.2, 108.8, 108.0, 111.1]);
      expect(charA.equals(float32Array)).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0050
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0050
     * @tc.desc    Test equals method with Float64Array instance returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charA = new Char(c'A');
      let float64Array = new Float64Array([72.5, 101.2, 108.8, 108.0, 111.1]);
      expect(charA.equals(float64Array)).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0051
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0051
     * @tc.desc    Test equals method with BigInt64Array instance returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charA = new Char(c'A');
      let bigInt64Array = new BigInt64Array([72n, 101n, 108n, 108n, 111n]);
      expect(charA.equals(bigInt64Array)).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0052
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0052
     * @tc.desc    Test equals method with BigUint64Array instance returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charA = new Char(c'A');
      let bigUint64Array = new BigUint64Array([72n, 101n, 108n, 108n, 111n]);
      expect(charA.equals(bigUint64Array)).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0053
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0053
     * @tc.desc    Test equals method with undefined returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charA = new Char(c'A');
      expect(charA.equals(undefined)).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0054
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0054
     * @tc.desc    Test equals method with null returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charA = new Char(c'A');
      expect(charA.equals(null)).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0055
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0055
     * @tc.desc    Test equals method with empty string returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charA = new Char(c'A');
      expect(charA.equals("")).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0056
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0056
     * @tc.desc    Test equals method with special characters returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charA = new Char(c'A');
      expect(charA.equals("!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~")).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0057
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0057
     * @tc.desc    Test equals method with ASCII string returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charA = new Char(c'A');
      expect(charA.equals("HelloWorld123")).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0058
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0058
     * @tc.desc    Test equals method with emoji character returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charA = new Char(c'A');
      expect(charA.equals("👍")).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0059
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0059
     * @tc.desc    Test equals method with illegal Unicode returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charA = new Char(c'A');
      expect(charA.equals("\udc04")).assertFalse();
      expect(charA.equals("\udff4")).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0060
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0060
     * @tc.desc    Test equals method with keyword strings returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charA = new Char(c'A');
      expect(charA.equals("0")).assertFalse();
      expect(charA.equals("NaN")).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0061
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0061
     * @tc.desc    Test equals method with number 0 returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charA = new Char(c'A');
      expect(charA.equals(0)).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0062
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0062
     * @tc.desc    Test equals method with number -0 returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charA = new Char(c'A');
      expect(charA.equals(-0)).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0063
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0063
     * @tc.desc    Test equals method with NaN returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charA = new Char(c'A');
      expect(charA.equals(NaN)).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0064
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0064
     * @tc.desc    Test equals method with Infinity returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charA = new Char(c'A');
      expect(charA.equals(Infinity)).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0065
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0065
     * @tc.desc    Test equals method with -Infinity returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charA = new Char(c'A');
      expect(charA.equals(-Infinity)).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0066
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0066
     * @tc.desc    Test equals method with Number.MAX_VALUE returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charA = new Char(c'A');
      expect(charA.equals(Number.MAX_VALUE)).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0067
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0067
     * @tc.desc    Test equals method with Number.MIN_VALUE returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charA = new Char(c'A');
      expect(charA.equals(Number.MIN_VALUE)).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0068
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0068
     * @tc.desc    Test equals method with Number.EPSILON returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charA = new Char(c'A');
      expect(charA.equals(Number.EPSILON)).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0069
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0069
     * @tc.desc    Test equals method with Number.MAX_SAFE_INTEGER returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charA = new Char(c'A');
      expect(charA.equals(Number.MAX_SAFE_INTEGER)).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0070
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0070
     * @tc.desc    Test equals method with byte out of range returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charA = new Char(c'A');
      expect(charA.equals(-129)).assertFalse();
      expect(charA.equals(128)).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0071
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0071
     * @tc.desc    Test equals method with short out of range returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charA = new Char(c'A');
      expect(charA.equals(-32769)).assertFalse();
      expect(charA.equals(32768)).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0072
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0072
     * @tc.desc    Test equals method with int out of range returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charA = new Char(c'A');
      expect(charA.equals(-2147483649)).assertFalse();
      expect(charA.equals(2147483648)).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0073
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0073
     * @tc.desc    Test equals method with hexadecimal number returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charA = new Char(c'A');
      expect(charA.equals(0x0102)).assertFalse();
      expect(charA.equals(0x01020304)).assertFalse();
      expect(charA.equals(0x3)).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0074
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0074
     * @tc.desc    Test equals method with scientific notation returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charA = new Char(c'A');
      expect(charA.equals(1e3)).assertFalse();
      expect(charA.equals(2.5e-2)).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0075
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0075
     * @tc.desc    Test equals method with boolean true returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charA = new Char(c'A');
      expect(charA.equals(true)).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0076
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0076
     * @tc.desc    Test equals method with boolean false returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charA = new Char(c'A');
      expect(charA.equals(false)).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0077
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0077
     * @tc.desc    Test equals method with normal array returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charA = new Char(c'A');
      let arr = [72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63];
      expect(charA.equals(arr)).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0078
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0078
     * @tc.desc    Test equals method with array containing zeros returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charA = new Char(c'A');
      let arr = [72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63];
      expect(charA.equals(arr)).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0079
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0079
     * @tc.desc    Test equals method with array containing negative numbers returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charA = new Char(c'A');
      let arr = [72, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63];
      expect(charA.equals(arr)).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0080
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0080
     * @tc.desc    Test equals method with array containing mixed types returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charA = new Char(c'A');
      let arr = [72, "abc", true, null, undefined, 108];
      expect(charA.equals(arr)).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0081
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0081
     * @tc.desc    Test equals method with array containing overflow values returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charA = new Char(c'A');
      let arr = [256, 65536, 32768];
      expect(charA.equals(arr)).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0082
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0082
     * @tc.desc    Test equals method with Date object returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charA = new Char(c'A');
      let date = new Date();
      expect(charA.equals(date)).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0083
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0083
     * @tc.desc    Test equals method with TreeString-like object returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charA = new Char(c'A');
      let treeString = "[";
      while (treeString.length < 100) {
        treeString += "{\"a\":1},";
      }
      treeString += "{\"a\":1}]";
      expect(charA.equals(treeString)).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0084
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0084
     * @tc.desc    Test equals method with SliceString-like object returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charA = new Char(c'A');
      let largeStr = "a".repeat(10000) + "{k1:value1,k2:value2}";
      let sliceString = largeStr.substring(10000, largeStr.length-2);
      expect(charA.equals(sliceString)).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0085
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0085
     * @tc.desc    Test equals method with escaped string returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charA = new Char(c'A');
      expect(charA.equals("\\a")).assertFalse();
      expect(charA.equals("\\b")).assertFalse();
      expect(charA.equals("\\f")).assertFalse();
      expect(charA.equals("\\n")).assertFalse();
      expect(charA.equals("\\r")).assertFalse();
      expect(charA.equals("\\t")).assertFalse();
      expect(charA.equals("\\v")).assertFalse();
      expect(charA.equals("\\\\")).assertFalse();
      expect(charA.equals("\\'")).assertFalse();
      expect(charA.equals("\\\"")).assertFalse();
      expect(charA.equals("\\?")).assertFalse();
      expect(charA.equals("\\0")).assertFalse();
      expect(charA.equals("\\123")).assertFalse();
      expect(charA.equals("\\x41")).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0086
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0086
     * @tc.desc    Test equals method with large Uint8Array returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charA = new Char(c'A');
      let largeArray = new Uint8Array(10000).fill(72);
      expect(charA.equals(largeArray)).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0087
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0087
     * @tc.desc    Test equals method with ArrayBuffer returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charA = new Char(c'A');
      let buffer = new ArrayBuffer(16);
      expect(charA.equals(buffer)).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0088
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0088
     * @tc.desc    Test equals method with DataView returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charA = new Char(c'A');
      let view = new DataView(new ArrayBuffer(16));
      expect(charA.equals(view)).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0089
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0089
     * @tc.desc    Test equals method with multiple consecutive Char objects returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charA = new Char(c'A');
      let charB = new Char(c'A');
      let charC = charB;
      expect(charA.equals(charB)).assertTrue();
      expect(charA.equals(charC)).assertTrue();
      expect(charB.equals(charC)).assertTrue();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0090
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0090
     * @tc.desc    Test equals method comparison with MAX_CODE_POINT boundary returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charA = new Char(c'A');
      expect(charA.equals(0x10FFFF)).assertFalse();
    });

    /**
     * @tc.name    builtinsComparisonAndEqualityTest0091
     * @tc.number  BUILTINS_COMPARISON_AND_EQUALITY_TEST_0091
     * @tc.desc    Test equals method comparison beyond MAX_CODE_POINT returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsComparisonAndEqualityTest0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let charA = new Char(c'A');
      expect(charA.equals(0x110000)).assertFalse();
    });

  })
}