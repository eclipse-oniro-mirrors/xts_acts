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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { ArrayJoinTestUtils } from './ArrayJoinTestUtils';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function arrayJoinTestTest() {
  describe('ArrayJoinTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(30);
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
     * @tc.name   JoinDefaultSeparatorTest001
     * @tc.number SUB_ARRAY_JOIN_TEST_001
     * @tc.desc   验证join使用默认分隔符（逗号）时，基本类型元素正确拼接为字符串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinDefaultSeparatorTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test001_JoinDefaultSeparator();
      expect(result).assertEqual("Test Passed: JoinDefaultSeparatorTest001");
    });

    /**
     * @tc.name   JoinCustomSeparatorTest002
     * @tc.number SUB_ARRAY_JOIN_TEST_002
     * @tc.desc   验证join使用自定义分隔符（短横线）时，字符串元素正确拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinCustomSeparatorTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test002_JoinCustomSeparator();
      expect(result).assertEqual("Test Passed: JoinCustomSeparatorTest002");
    });

    /**
     * @tc.name   JoinWithUndefinedNullAndHoleTest003
     * @tc.number SUB_ARRAY_JOIN_TEST_003
     * @tc.desc   验证join处理含undefined、null、空槽的数组时，均转为空字符串拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithUndefinedNullAndHoleTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test003_JoinWithUndefinedNullAndHole();
      expect(result).assertEqual("Test Passed: JoinWithUndefinedNullAndHoleTest003");
    });

    /**
     * @tc.name   JoinEmptyArrayTest004
     * @tc.number SUB_ARRAY_JOIN_TEST_004
     * @tc.desc   验证空数组调用join时，无论分隔符为何，均返回空字符串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinEmptyArrayTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test004_JoinEmptyArray();
      expect(result).assertEqual("Test Passed: JoinEmptyArrayTest004");
    });

    /**
     * @tc.name   JoinSingleElementArrayTest005
     * @tc.number SUB_ARRAY_JOIN_TEST_005
     * @tc.desc   验证单元素数组调用join时，忽略分隔符，返回元素的字符串形式
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinSingleElementArrayTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test005_JoinSingleElementArray();
      expect(result).assertEqual("Test Passed: JoinSingleElementArrayTest005");
    });

    /**
     * @tc.name   JoinWithUndefinedNullSeparatorTest007
     * @tc.number SUB_ARRAY_JOIN_TEST_007
     * @tc.desc   验证join的分隔符为undefined或null时，自动转为空字符串，元素无分隔拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithUndefinedNullSeparatorTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test007_JoinWithUndefinedNullSeparator();
      expect(result).assertEqual("Test Passed: JoinWithUndefinedNullSeparatorTest007");
    });

    /**
     * @tc.name   JoinOnArrayLikeTest008
     * @tc.number SUB_ARRAY_JOIN_TEST_008
     * @tc.desc   验证类数组对象通过Array.prototype.join.call调用时，按整数索引拼接元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinOnArrayLikeTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test008_JoinOnArrayLike();
      expect(result).assertEqual("Test Passed: JoinOnArrayLikeTest008");
    });

    /**
     * @tc.name   JoinWithSpecialValuesTest009
     * @tc.number SUB_ARRAY_JOIN_TEST_009
     * @tc.desc   验证join处理特殊值（NaN/Infinity/Symbol）时，转为对应字符串后拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithSpecialValuesTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test009_JoinWithSpecialValues();
      expect(result).assertEqual("Test Passed: JoinWithSpecialValuesTest009");
    });

    /**
     * @tc.name   JoinWithDeepNestedArraysTest010
     * @tc.number SUB_ARRAY_JOIN_TEST_010
     * @tc.desc   验证join处理多层嵌套数组时，递归调用toString扁平化后拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithDeepNestedArraysTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test010_JoinWithDeepNestedArrays();
      expect(result).assertEqual("Test Passed: JoinWithDeepNestedArraysTest010");
    });

    /**
     * @tc.name   JoinWithEmptyStringSeparatorTest011
     * @tc.number SUB_ARRAY_JOIN_TEST_011
     * @tc.desc   验证join使用空字符串作为分隔符时，所有元素无缝拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithEmptyStringSeparatorTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test011_JoinWithEmptyStringSeparator();
      expect(result).assertEqual("Test Passed: JoinWithEmptyStringSeparatorTest011");
    });

    /**
     * @tc.name   JoinWithMultiCharSeparatorTest012
     * @tc.number SUB_ARRAY_JOIN_TEST_012
     * @tc.desc   验证join使用多字符作为分隔符时，按完整字符串进行拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithMultiCharSeparatorTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test012_JoinWithMultiCharSeparator();
      expect(result).assertEqual("Test Passed: JoinWithMultiCharSeparatorTest012");
    });

    /**
     * @tc.name   JoinWithTemplateStringsTest013
     * @tc.number SUB_ARRAY_JOIN_TEST_013
     * @tc.desc   验证join处理包含模板字符串的数组时，按其字符串值进行拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithTemplateStringsTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test013_JoinWithTemplateStrings();
      expect(result).assertEqual("Test Passed: JoinWithTemplateStringsTest013");
    });

    /**
     * @tc.name   JoinWithNumberSeparatorTest014
     * @tc.number SUB_ARRAY_JOIN_TEST_014
     * @tc.desc   验证join的分隔符为数字时，隐式转换为字符串后进行拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithNumberSeparatorTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test014_JoinWithNumberSeparator();
      expect(result).assertEqual("Test Passed: JoinWithNumberSeparatorTest014");
    });

    /**
     * @tc.name   JoinWithBooleanSeparatorTest015
     * @tc.number SUB_ARRAY_JOIN_TEST_015
     * @tc.desc   验证join的分隔符为布尔值时，隐式转换为字符串后进行拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithBooleanSeparatorTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test015_JoinWithBooleanSeparator();
      expect(result).assertEqual("Test Passed: JoinWithBooleanSeparatorTest015");
    });

    /**
     * @tc.name   JoinWithBooleanElementsTest016
     * @tc.number SUB_ARRAY_JOIN_TEST_016
     * @tc.desc   验证join处理包含布尔值的数组时，将其转换为 "true" 或 "false" 后拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithBooleanElementsTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test016_JoinWithBooleanElements();
      expect(result).assertEqual("Test Passed: JoinWithBooleanElementsTest016");
    });

    /**
     * @tc.name   JoinWithEmptyArrayElementsTest017
     * @tc.number SUB_ARRAY_JOIN_TEST_017
     * @tc.desc   验证join处理包含空数组元素的数组时，将空数组转为空字符串后拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithEmptyArrayElementsTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test017_JoinWithEmptyArrayElements();
      expect(result).assertEqual("Test Passed: JoinWithEmptyArrayElementsTest017");
    });

    /**
     * @tc.name   JoinArrayLikeDiscontinuousTest018
     * @tc.number SUB_ARRAY_JOIN_TEST_018
     * @tc.desc   验证join处理索引不连续的类数组对象时，跳过空槽进行拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinArrayLikeDiscontinuousTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test018_JoinArrayLikeDiscontinuous();
      expect(result).assertEqual("Test Passed: JoinArrayLikeDiscontinuousTest018");
    });

    /**
     * @tc.name   JoinWithZeroWidthSpaceTest019
     * @tc.number SUB_ARRAY_JOIN_TEST_019
     * @tc.desc   验证join处理包含零宽度空格的数组时，按普通字符拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithZeroWidthSpaceTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test019_JoinWithZeroWidthSpace();
      expect(result).assertEqual("Test Passed: JoinWithZeroWidthSpaceTest019");
    });

    /**
     * @tc.name   JoinWithObjectSeparatorTest020
     * @tc.number SUB_ARRAY_JOIN_TEST_020
     * @tc.desc   验证join的分隔符为对象时，调用其 toString() 方法后进行拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithObjectSeparatorTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test020_JoinWithObjectSeparator();
      expect(result).assertEqual("Test Passed: JoinWithObjectSeparatorTest020");
    });

    /**
     * @tc.name   JoinWithNullElementsTest021
     * @tc.number SUB_ARRAY_JOIN_TEST_021
     * @tc.desc   验证join处理包含null元素的数组时，将null转为空字符串后拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithNullElementsTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test021_JoinWithNullElements();
      expect(result).assertEqual("Test Passed: JoinWithNullElementsTest021");
    });

    /**
     * @tc.name   JoinArrayLikeZeroLengthTest022
     * @tc.number SUB_ARRAY_JOIN_TEST_022
     * @tc.desc   验证join处理length为0的类数组对象时，返回空字符串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinArrayLikeZeroLengthTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test022_JoinArrayLikeZeroLength();
      expect(result).assertEqual("Test Passed: JoinArrayLikeZeroLengthTest022");
    });

    /**
     * @tc.name   JoinWithUndefinedElementsTest023
     * @tc.number SUB_ARRAY_JOIN_TEST_023
     * @tc.desc   验证join处理包含undefined元素的数组时，将undefined转为空字符串后拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithUndefinedElementsTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test023_JoinWithUndefinedElements();
      expect(result).assertEqual("Test Passed: JoinWithUndefinedElementsTest023");
    });

    /**
     * @tc.name   JoinWithFunctionSeparatorTest024
     * @tc.number SUB_ARRAY_JOIN_TEST_024
     * @tc.desc   验证join的分隔符为函数时，调用其 toString() 方法后进行拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithFunctionSeparatorTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test024_JoinWithFunctionSeparator();
      expect(result).assertEqual("Test Passed: JoinWithFunctionSeparatorTest024");
    });

    /**
     * @tc.name   JoinWithSingleElementArrayElementsTest025
     * @tc.number SUB_ARRAY_JOIN_TEST_025
     * @tc.desc   验证join处理包含单元素数组的数组时，将其扁平化后拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithSingleElementArrayElementsTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test025_JoinWithSingleElementArrayElements();
      expect(result).assertEqual("Test Passed: JoinWithSingleElementArrayElementsTest025");
    });

    /**
     * @tc.name   JoinArrayLikeWithNonEnumerableTest026
     * @tc.number SUB_ARRAY_JOIN_TEST_026
     * @tc.desc   验证join处理含不可枚举属性的类数组对象时，忽略不可枚举属性
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinArrayLikeWithNonEnumerableTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test026_JoinArrayLikeWithNonEnumerable();
      expect(result).assertEqual("Test Passed: JoinArrayLikeWithNonEnumerableTest026");
    });

    /**
     * @tc.name   JoinWithEscapeCharactersTest027
     * @tc.number SUB_ARRAY_JOIN_TEST_027
     * @tc.desc   验证join处理包含换行符和制表符的数组时，按普通字符拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithEscapeCharactersTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test027_JoinWithEscapeCharacters();
      expect(result).assertEqual("Test Passed: JoinWithEscapeCharactersTest027");
    });

    /**
     * @tc.name   JoinEmptyArrayWithUndefinedSeparatorTest028
     * @tc.number SUB_ARRAY_JOIN_TEST_028
     * @tc.desc   验证空数组使用undefined作为分隔符调用join时，返回空字符串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinEmptyArrayWithUndefinedSeparatorTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test028_JoinEmptyArrayWithUndefinedSeparator();
      expect(result).assertEqual("Test Passed: JoinEmptyArrayWithUndefinedSeparatorTest028");
    });

    /**
     * @tc.name   JoinHugeArrayTest029
     * @tc.number SUB_ARRAY_JOIN_TEST_029
     * @tc.desc   验证join在处理超大数组（100,000个元素）时的基本功能和性能边界
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL3
     */
    it('JoinHugeArrayTest029', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, async () => {
      const result = await ArrayJoinTestUtils.test029_JoinHugeArray();
      expect(result).assertEqual("Test Passed: JoinHugeArrayTest029");
    });

    /**
     * @tc.name   JoinWithCustomObjectToStringTest030
     * @tc.number SUB_ARRAY_JOIN_TEST_030
     * @tc.desc   验证join处理包含覆盖了toString()方法的自定义对象时，调用其自定义方法进行拼接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithCustomObjectToStringTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test030_JoinWithCustomObjectToString();
      expect(result).assertEqual("Test Passed: JoinWithCustomObjectToStringTest030");
    });

    /**
     * @tc.name   JoinWithNewlineSeparatorTest031
     * @tc.number SUB_ARRAY_JOIN_TEST_031
     * @tc.desc   Verify that join uses a single newline character `\n` as the separator.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithNewlineSeparatorTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test031_JoinWithNewlineSeparator();
      expect(result).assertEqual("Test Passed: JoinWithNewlineSeparatorTest031");
    });

    /**
     * @tc.name   JoinWithTabSeparatorTest032
     * @tc.number SUB_ARRAY_JOIN_TEST_032
     * @tc.desc   Verify that join uses a single tab character `\t` as the separator.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithTabSeparatorTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test032_JoinWithTabSeparator();
      expect(result).assertEqual("Test Passed: JoinWithTabSeparatorTest032");
    });

    /**
     * @tc.name   JoinWithZeroWidthNonJoinerSeparatorTest033
     * @tc.number SUB_ARRAY_JOIN_TEST_033
     * @tc.desc   Verify that join uses a zero-width non-joiner (ZWNJ) character as the separator.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithZeroWidthNonJoinerSeparatorTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test033_JoinWithZeroWidthNonJoinerSeparator();
      expect(result).assertEqual("Test Passed: JoinWithZeroWidthNonJoinerSeparatorTest033");
    });

    /**
     * @tc.name   JoinWithMultiByteCharactersTest034
     * @tc.number SUB_ARRAY_JOIN_TEST_034
     * @tc.desc   Verify that join correctly handles and concatenates multi-byte UTF-8 characters (e.g., CJK).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithMultiByteCharactersTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test034_JoinWithMultiByteCharacters();
      expect(result).assertEqual("Test Passed: JoinWithMultiByteCharactersTest034");
    });

    /**
     * @tc.name   JoinArrayLikeWithNonNumericLengthTest036
     * @tc.number SUB_ARRAY_JOIN_TEST_036
     * @tc.desc   Verify that join treats a non-numeric length property on an array-like object as 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinArrayLikeWithNonNumericLengthTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test036_JoinArrayLikeWithNonNumericLength();
      expect(result).assertEqual("Test Passed: JoinArrayLikeWithNonNumericLengthTest036");
    });

    /**
     * @tc.name   JoinArrayLikeLengthGreaterThanIndicesTest037
     * @tc.number SUB_ARRAY_JOIN_TEST_037
     * @tc.desc   Verify that join iterates up to `length - 1` on array-like objects, treating missing indices as empty strings.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinArrayLikeLengthGreaterThanIndicesTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test037_JoinArrayLikeLengthGreaterThanIndices();
      expect(result).assertEqual("Test Passed: JoinArrayLikeLengthGreaterThanIndicesTest037");
    });

    /**
     * @tc.name   JoinArrayOfArraysTest038
     * @tc.number SUB_ARRAY_JOIN_TEST_038
     * @tc.desc   Verify that joining an array of arrays uses the outer separator and the inner arrays' default toString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinArrayOfArraysTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test038_JoinArrayOfArrays();
      expect(result).assertEqual("Test Passed: JoinArrayOfArraysTest038");
    });

    /**
     * @tc.name   JoinWithMapTest039
     * @tc.number SUB_ARRAY_JOIN_TEST_039
     * @tc.desc   Verify that join works correctly in combination with the map method to format numbers.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithMapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test039_JoinWithMap();
      expect(result).assertEqual("Test Passed: JoinWithMapTest039");
    });

    /**
     * @tc.name   JoinWithObjectGetterToStringTest040
     * @tc.number SUB_ARRAY_JOIN_TEST_040
     * @tc.desc   Verify that join correctly invokes a custom toString getter function on an object element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithObjectGetterToStringTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test040_JoinWithObjectGetterToString();
      expect(result).assertEqual("Test Passed: JoinWithObjectGetterToStringTest040");
    });

    /**
     * @tc.name   JoinWithEmojiSeparatorTest041
     * @tc.number SUB_ARRAY_JOIN_TEST_041
     * @tc.desc   Verify that join uses an emoji character as the separator.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithEmojiSeparatorTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test041_JoinWithEmojiSeparator();
      expect(result).assertEqual("Test Passed: JoinWithEmojiSeparatorTest041");
    });


    /**
     * @tc.name   JoinWithMapObjectsTest043
     * @tc.number SUB_ARRAY_JOIN_TEST_043
     * @tc.desc   Verify that join converts Map objects to their string representation "[object Map]".
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithMapObjectsTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test043_JoinWithMapObjects();
      expect(result).assertEqual("Test Passed: JoinWithMapObjectsTest043");
    });

    /**
     * @tc.name   JoinArrayLikeWithNegativeLengthTest044
     * @tc.number SUB_ARRAY_JOIN_TEST_044
     * @tc.desc   Verify that join treats a negative length property on an array-like object as 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinArrayLikeWithNegativeLengthTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test044_JoinArrayLikeWithNegativeLength();
      expect(result).assertEqual("Test Passed: JoinArrayLikeWithNegativeLengthTest044");
    });

    /**
     * @tc.name   JoinIntoHugeStringTest045
     * @tc.number SUB_ARRAY_JOIN_TEST_045
     * @tc.desc   Verify that join can handle concatenating into an extremely large string without crashing.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL3
     */
    it('JoinIntoHugeStringTest045', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, async () => {
      const result = await ArrayJoinTestUtils.test045_JoinIntoHugeString();
      expect(result).assertEqual("Test Passed: JoinIntoHugeStringTest045");
    });

    /**
     * @tc.name   JoinAsCallbackTest046
     * @tc.number SUB_ARRAY_JOIN_TEST_046
     * @tc.desc   Verify that the join method can be passed as a callback to other functions like forEach.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinAsCallbackTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test046_JoinAsCallback();
      expect(result).assertEqual("Test Passed: JoinAsCallbackTest046");
    });

    /**
     * @tc.name   JoinWithLocalizedNumberStringTest047
     * @tc.number SUB_ARRAY_JOIN_TEST_047
     * @tc.desc   Verify that join correctly handles a number string formatted with toLocaleString.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithLocalizedNumberStringTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test047_JoinWithLocalizedNumberString();
      expect(result).assertEqual("Test Passed: JoinWithLocalizedNumberStringTest047");
    });

    /**
     * @tc.name   JoinOnNonArrayLikeTest048
     * @tc.number SUB_ARRAY_JOIN_TEST_048
     * @tc.desc   Verify that attempting to call join on a non-array-like object (e.g., null) throws a TypeError.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinOnNonArrayLikeTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test048_JoinOnNonArrayLike();
      expect(result).assertEqual("Test Passed: JoinOnNonArrayLikeTest048");
    });

    /**
     * @tc.name   JoinWithSetObjectsTest049
     * @tc.number SUB_ARRAY_JOIN_TEST_049
     * @tc.desc   Verify that join converts Set objects to their string representation "[object Set]".
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithSetObjectsTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test049_JoinWithSetObjects();
      expect(result).assertEqual("Test Passed: JoinWithSetObjectsTest049");
    });

    /**
     * @tc.name   JoinWithInfinityElementsTest050
     * @tc.number SUB_ARRAY_JOIN_TEST_050
     * @tc.desc   Verify that join converts Infinity and -Infinity elements to their respective string representations.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithInfinityElementsTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test050_JoinWithInfinityElements();
      expect(result).assertEqual("Test Passed: JoinWithInfinityElementsTest050");
    });

    /**
     * @tc.name   JoinWithPromiseObjectsTest051
     * @tc.number SUB_ARRAY_JOIN_TEST_051
     * @tc.desc   Verify that join converts Promise objects to their string representation "[object Promise]".
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithPromiseObjectsTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test051_JoinWithPromiseObjects();
      expect(result).assertEqual("Test Passed: JoinWithPromiseObjectsTest051");
    });

    /**
     * @tc.name   JoinAfterFilterTest052
     * @tc.number SUB_ARRAY_JOIN_TEST_052
     * @tc.desc   Verify that join works correctly on the result of filtering out falsy values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinAfterFilterTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test052_JoinAfterFilter();
      expect(result).assertEqual("Test Passed: JoinAfterFilterTest052");
    });

    /**
     * @tc.name   JoinWithRegExpSeparatorTest053
     * @tc.number SUB_ARRAY_JOIN_TEST_053
     * @tc.desc   Verify that a regular expression object used as a separator is converted to its string literal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithRegExpSeparatorTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test053_JoinWithRegExpSeparator();
      expect(result).assertEqual("Test Passed: JoinWithRegExpSeparatorTest053");
    });

    /**
     * @tc.name   JoinWithErrorObjectsTest054
     * @tc.number SUB_ARRAY_JOIN_TEST_054
     * @tc.desc   Verify that join converts Error objects to their string representation "Error: message".
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithErrorObjectsTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test054_JoinWithErrorObjects();
      expect(result).assertEqual("Test Passed: JoinWithErrorObjectsTest054");
    });

    /**
     * @tc.name   JoinAfterFlatMapTest055
     * @tc.number SUB_ARRAY_JOIN_TEST_055
     * @tc.desc   Verify that join works correctly on the result of Array.prototype.flatMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinAfterFlatMapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test055_JoinAfterFlatMap();
      expect(result).assertEqual("Test Passed: JoinAfterFlatMapTest055");
    });

    /**
     * @tc.name   JoinArrayLikeWithLargeLengthTest056
     * @tc.number SUB_ARRAY_JOIN_TEST_056
     * @tc.desc   Verify that join handles array-like objects with very large length values.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL3
     */
    it('JoinArrayLikeWithLargeLengthTest056', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, async () => {
      const result = await ArrayJoinTestUtils.test056_JoinArrayLikeWithLargeLength();
      expect(result).assertEqual("Test Passed: JoinArrayLikeWithLargeLengthTest056");
    });

    /**
     * @tc.name   JoinWithScientificNotationSeparatorTest057
     * @tc.number SUB_ARRAY_JOIN_TEST_057
     * @tc.desc   Verify that a string in scientific notation used as a separator is handled correctly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithScientificNotationSeparatorTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test057_JoinWithScientificNotationSeparator();
      expect(result).assertEqual("Test Passed: JoinWithScientificNotationSeparatorTest057");
    });

    /**
     * @tc.name   JoinWithWeakCollectionsTest058
     * @tc.number SUB_ARRAY_JOIN_TEST_058
     * @tc.desc   Verify that join converts WeakMap and WeakSet objects to their string representations.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithWeakCollectionsTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test058_JoinWithWeakCollections();
      expect(result).assertEqual("Test Passed: JoinWithWeakCollectionsTest058");
    });

    /**
     * @tc.name   JoinWithSliceTest059
     * @tc.number SUB_ARRAY_JOIN_TEST_059
     * @tc.desc   Verify that join works correctly on a subset of an array obtained via slice.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithSliceTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test059_JoinWithSlice();
      expect(result).assertEqual("Test Passed: JoinWithSliceTest059");
    });

    /**
     * @tc.name   JoinArrayLikeWithFractionalLengthTest060
     * @tc.number SUB_ARRAY_JOIN_TEST_060
     * @tc.desc   Verify that a fractional length on an array-like object is truncated when using join.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinArrayLikeWithFractionalLengthTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test060_JoinArrayLikeWithFractionalLength();
      expect(result).assertEqual("Test Passed: JoinArrayLikeWithFractionalLengthTest060");
    });

    /**
     * @tc.name   JoinWithJsonStringSeparatorTest061
     * @tc.number SUB_ARRAY_JOIN_TEST_061
     * @tc.desc   Verify that a JSON string used as a separator is handled correctly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithJsonStringSeparatorTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test061_JoinWithJsonStringSeparator();
      expect(result).assertEqual("Test Passed: JoinWithJsonStringSeparatorTest061");
    });

    /**
     * @tc.name   JoinWithBuiltInObjectsTest062
     * @tc.number SUB_ARRAY_JOIN_TEST_062
     * @tc.desc   Verify that join converts built-in objects like Atomics and Reflect to their string representations.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithBuiltInObjectsTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test062_JoinWithBuiltInObjects();
      expect(result).assertEqual("Test Passed: JoinWithBuiltInObjectsTest062");
    });

    /**
     * @tc.name   JoinAfterConcatTest063
     * @tc.number SUB_ARRAY_JOIN_TEST_063
     * @tc.desc   Verify that join works correctly on the result of concatenating two arrays.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinAfterConcatTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test063_JoinAfterConcat();
      expect(result).assertEqual("Test Passed: JoinAfterConcatTest063");
    });

    /**
     * @tc.name   JoinArrayLikeUnorderedIndicesTest064
     * @tc.number SUB_ARRAY_JOIN_TEST_064
     * @tc.desc   Verify that join iterates indices in ascending order regardless of property definition order.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinArrayLikeUnorderedIndicesTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test064_JoinArrayLikeUnorderedIndices();
      expect(result).assertEqual("Test Passed: JoinArrayLikeUnorderedIndicesTest064");
    });

    /**
     * @tc.name   JoinWithStringUndefinedSeparatorTest065
     * @tc.number SUB_ARRAY_JOIN_TEST_065
     * @tc.desc   Verify that the string "undefined" is treated as a literal separator.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithStringUndefinedSeparatorTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test065_JoinWithStringUndefinedSeparator();
      expect(result).assertEqual("Test Passed: JoinWithStringUndefinedSeparatorTest065");
    });


    /**
     * @tc.name   JoinAllUndefinedElementsTest067
     * @tc.number SUB_ARRAY_JOIN_TEST_067
     * @tc.desc   Verify that joining an array with all undefined elements results in separators only.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinAllUndefinedElementsTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test067_JoinAllUndefinedElements();
      expect(result).assertEqual("Test Passed: JoinAllUndefinedElementsTest067");
    });

    /**
     * @tc.name   JoinArrayLikeWithSymbolIndexTest068
     * @tc.number SUB_ARRAY_JOIN_TEST_068
     * @tc.desc   Verify that Symbol indices on array-like objects are ignored by join.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinArrayLikeWithSymbolIndexTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test068_JoinArrayLikeWithSymbolIndex();
      expect(result).assertEqual("Test Passed: JoinArrayLikeWithSymbolIndexTest068");
    });

    /**
     * @tc.name   JoinWithWhitespaceSeparatorTest069
     * @tc.number SUB_ARRAY_JOIN_TEST_069
     * @tc.desc   Verify that separators with leading and trailing whitespace are preserved.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithWhitespaceSeparatorTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test069_JoinWithWhitespaceSeparator();
      expect(result).assertEqual("Test Passed: JoinWithWhitespaceSeparatorTest069");
    });

    /**
     * @tc.name   JoinMixedSpecialValuesTest070
     * @tc.number SUB_ARRAY_JOIN_TEST_070
     * @tc.desc   End-to-end test verifying join handles a complex array with mixed value types.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('JoinMixedSpecialValuesTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const result = await ArrayJoinTestUtils.test070_JoinMixedSpecialValues();
      expect(result).assertEqual("Test Passed: JoinMixedSpecialValuesTest070");
    });

    /**
     * @tc.name   JoinNullSeparatorAndElementsTest071
     * @tc.number SUB_ARRAY_JOIN_TEST_071
     * @tc.desc   Verify that both null separator and null elements are converted to empty strings.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinNullSeparatorAndElementsTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test071_JoinNullSeparatorAndElements();
      expect(result).assertEqual("Test Passed: JoinNullSeparatorAndElementsTest071");
    });

    /**
     * @tc.name   JoinAfterReverseTest072
     * @tc.number SUB_ARRAY_JOIN_TEST_072
     * @tc.desc   Verify that join works correctly on the result of reversing an array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinAfterReverseTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test072_JoinAfterReverse();
      expect(result).assertEqual("Test Passed: JoinAfterReverseTest072");
    });

    /**
     * @tc.name   JoinWithZeroSeparatorTest073
     * @tc.number SUB_ARRAY_JOIN_TEST_073
     * @tc.desc   Verify that the number 0 used as a separator is converted to the string "0".
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithZeroSeparatorTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test073_JoinWithZeroSeparator();
      expect(result).assertEqual("Test Passed: JoinWithZeroSeparatorTest073");
    });

    /**
     * @tc.name   JoinFromArrayFromTest074
     * @tc.number SUB_ARRAY_JOIN_TEST_074
     * @tc.desc   Verify that join works correctly on an array created from a string using Array.from.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinFromArrayFromTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test074_JoinFromArrayFrom();
      expect(result).assertEqual("Test Passed: JoinFromArrayFromTest074");
    });

    /**
     * @tc.name   JoinWithEmptyArraySeparatorTest075
     * @tc.number SUB_ARRAY_JOIN_TEST_075
     * @tc.desc   Verify that an empty array used as a separator is converted to an empty string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithEmptyArraySeparatorTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test075_JoinWithEmptyArraySeparator();
      expect(result).assertEqual("Test Passed: JoinWithEmptyArraySeparatorTest075");
    });

    /**
     * @tc.name   JoinWithStringObjectsTest076
     * @tc.number SUB_ARRAY_JOIN_TEST_076
     * @tc.desc   Verify that join converts String objects to their primitive string values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithStringObjectsTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test076_JoinWithStringObjects();
      expect(result).assertEqual("Test Passed: JoinWithStringObjectsTest076");
    });

    /**
     * @tc.name   JoinAfterFillTest077
     * @tc.number SUB_ARRAY_JOIN_TEST_077
     * @tc.desc   Verify that join works correctly on an array filled with a single value using Array.prototype.fill.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinAfterFillTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test077_JoinAfterFill();
      expect(result).assertEqual("Test Passed: JoinAfterFillTest077");
    });

    /**
     * @tc.name   JoinWithExtremeNumbersTest078
     * @tc.number SUB_ARRAY_JOIN_TEST_078
     * @tc.desc   Verify that join converts Number.MAX_VALUE and Number.MIN_VALUE to their string representations.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithExtremeNumbersTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test078_JoinWithExtremeNumbers();
      expect(result).assertEqual("Test Passed: JoinWithExtremeNumbersTest078");
    });

    /**
     * @tc.name   JoinWithMultiLineSeparatorTest079
     * @tc.number SUB_ARRAY_JOIN_TEST_079
     * @tc.desc   Verify that join handles a multi-line template literal as a separator correctly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithMultiLineSeparatorTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test079_JoinWithMultiLineSeparator();
      expect(result).assertEqual("Test Passed: JoinWithMultiLineSeparatorTest079");
    });

    /**
     * @tc.name   JoinAllEmptyStringsTest080
     * @tc.number SUB_ARRAY_JOIN_TEST_080
     * @tc.desc   Verify that joining an array where all elements are empty strings results in separators only.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinAllEmptyStringsTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test080_JoinAllEmptyStrings();
      expect(result).assertEqual("Test Passed: JoinAllEmptyStringsTest080");
    });

    /**
     * @tc.name   JoinAfterSortTest081
     * @tc.number SUB_ARRAY_JOIN_TEST_081
     * @tc.desc   Verify that join works correctly on the result of sorting an array of numbers.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinAfterSortTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test081_JoinAfterSort();
      expect(result).assertEqual("Test Passed: JoinAfterSortTest081");
    });

    /**
     * @tc.name   JoinUndefinedSeparatorAndElementsTest082
     * @tc.number SUB_ARRAY_JOIN_TEST_082
     * @tc.desc   Verify that both undefined separator and undefined elements are converted to empty strings.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinUndefinedSeparatorAndElementsTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test082_JoinUndefinedSeparatorAndElements();
      expect(result).assertEqual("Test Passed: JoinUndefinedSeparatorAndElementsTest082");
    });

    /**
     * @tc.name   JoinWithNumberObjectsTest083
     * @tc.number SUB_ARRAY_JOIN_TEST_083
     * @tc.desc   Verify that join converts Number objects to their primitive number values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithNumberObjectsTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test083_JoinWithNumberObjects();
      expect(result).assertEqual("Test Passed: JoinWithNumberObjectsTest083");
    });

    /**
     * @tc.name   JoinAfterFlatTest084
     * @tc.number SUB_ARRAY_JOIN_TEST_084
     * @tc.desc   Verify that join works correctly on the result of flattening a deeply nested array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinAfterFlatTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test084_JoinAfterFlat();
      expect(result).assertEqual("Test Passed: JoinAfterFlatTest084");
    });

    /**
     * @tc.name   JoinWithHtmlEntitySeparatorTest085
     * @tc.number SUB_ARRAY_JOIN_TEST_085
     * @tc.desc   Verify that a string containing HTML entities used as a separator is handled correctly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithHtmlEntitySeparatorTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test085_JoinWithHtmlEntitySeparator();
      expect(result).assertEqual("Test Passed: JoinWithHtmlEntitySeparatorTest085");
    });

    /**
     * @tc.name   JoinSingleEmptyStringElementTest086
     * @tc.number SUB_ARRAY_JOIN_TEST_086
     * @tc.desc   Verify that joining an array with a single empty string element returns an empty string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinSingleEmptyStringElementTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test086_JoinSingleEmptyStringElement();
      expect(result).assertEqual("Test Passed: JoinSingleEmptyStringElementTest086");
    });

    /**
     * @tc.name   JoinWithSymbolSeparatorTest087
     * @tc.number SUB_ARRAY_JOIN_TEST_087
     * @tc.desc   Verify that attempting to use a Symbol as a separator throws a TypeError.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithSymbolSeparatorTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test087_JoinWithSymbolSeparator();
      expect(result).assertEqual("Test Passed: JoinWithSymbolSeparatorTest087");
    });

    /**
     * @tc.name   JoinSparseArrayWithHolesTest088
     * @tc.number SUB_ARRAY_JOIN_TEST_088
     * @tc.desc   Verify that joining a sparse array with only empty slots returns an empty string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinSparseArrayWithHolesTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test088_JoinSparseArrayWithHoles();
      expect(result).assertEqual("Test Passed: JoinSparseArrayWithHolesTest088");
    });

    /**
     * @tc.name   JoinWithLongStringElementsTest089
     * @tc.number SUB_ARRAY_JOIN_TEST_089
     * @tc.desc   Verify that join can handle concatenation of very long string elements.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL3
     */
    it('JoinWithLongStringElementsTest089', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, async () => {
      const result = await ArrayJoinTestUtils.test089_JoinWithLongStringElements();
      expect(result).assertEqual("Test Passed: JoinWithLongStringElementsTest089");
    });

    /**
     * @tc.name   JoinWithFlatMapStringsTest092
     * @tc.number SUB_ARRAY_JOIN_TEST_092
     * @tc.desc   Verify that join works correctly with flatMap to split and rejoin strings.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithFlatMapStringsTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test092_JoinWithFlatMapStrings();
      expect(result).assertEqual("Test Passed: JoinWithFlatMapStringsTest092");
    });

    /**
     * @tc.name   JoinWithNonBmpSeparatorTest093
     * @tc.number SUB_ARRAY_JOIN_TEST_093
     * @tc.desc   Verify that join correctly handles emoji and other non-BMP Unicode characters as separators.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithNonBmpSeparatorTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test093_JoinWithNonBmpSeparator();
      expect(result).assertEqual("Test Passed: JoinWithNonBmpSeparatorTest093");
    });

    /**
     * @tc.name   JoinWithArrayBuffersTest094
     * @tc.number SUB_ARRAY_JOIN_TEST_094
     * @tc.desc   Verify that join converts ArrayBuffer objects to their string representation "[object ArrayBuffer]".
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithArrayBuffersTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test094_JoinWithArrayBuffers();
      expect(result).assertEqual("Test Passed: JoinWithArrayBuffersTest094");
    });

    /**
     * @tc.name   JoinWithReduceTest095
     * @tc.number SUB_ARRAY_JOIN_TEST_095
     * @tc.desc   Verify that join can be emulated using the reduce method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithReduceTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test095_JoinWithReduce();
      expect(result).assertEqual("Test Passed: JoinWithReduceTest095");
    });

    /**
     * @tc.name   JoinWithSharedArrayBufferTest096
     * @tc.number SUB_ARRAY_JOIN_TEST_096
     * @tc.desc   Verify that join converts SharedArrayBuffer objects to their string representation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithSharedArrayBufferTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test096_JoinWithSharedArrayBuffer();
      expect(result).assertEqual("Test Passed: JoinWithSharedArrayBufferTest096");
    });

    /**
     * @tc.name   JoinWithZeroWidthSpaceSeparatorTest097
     * @tc.number SUB_ARRAY_JOIN_TEST_097
     * @tc.desc   Verify that a zero-width space character used as a separator is preserved.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithZeroWidthSpaceSeparatorTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test097_JoinWithZeroWidthSpaceSeparator();
      expect(result).assertEqual("Test Passed: JoinWithZeroWidthSpaceSeparatorTest097");
    });

    /**
     * @tc.name   JoinWithDataViewsTest098
     * @tc.number SUB_ARRAY_JOIN_TEST_098
     * @tc.desc   Verify that join converts DataView objects to their string representation "[object DataView]".
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithDataViewsTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test098_JoinWithDataViews();
      expect(result).assertEqual("Test Passed: JoinWithDataViewsTest098");
    });

    /**
     * @tc.name   JoinWithArrayWithTest099
     * @tc.number SUB_ARRAY_JOIN_TEST_099
     * @tc.desc   Verify that join works correctly with the Array.prototype.with method to replace elements.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithArrayWithTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test099_JoinWithArrayWith();
      expect(result).assertEqual("Test Passed: JoinWithArrayWithTest099");
    });

    /**
     * @tc.name   JoinWithTypedArraysTest100
     * @tc.number SUB_ARRAY_JOIN_TEST_100
     * @tc.desc   Verify that join converts typed array objects (e.g., BigInt64Array) to their string representation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithTypedArraysTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test100_JoinWithTypedArrays();
      expect(result).assertEqual("Test Passed: JoinWithTypedArraysTest100");
    });

    /**
     * @tc.name   JoinWithStringNaNSeparatorTest101
     * @tc.number SUB_ARRAY_JOIN_TEST_101
     * @tc.desc   Verify that the string "NaN" is treated as a literal separator.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithStringNaNSeparatorTest101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test101_JoinWithStringNaNSeparator();
      expect(result).assertEqual("Test Passed: JoinWithStringNaNSeparatorTest101");
    });

    /**
     * @tc.name   JoinWithWeakRefsTest102
     * @tc.number SUB_ARRAY_JOIN_TEST_102
     * @tc.desc   Verify that join converts WeakRef objects to their string representation "[object WeakRef]".
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithWeakRefsTest102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test102_JoinWithWeakRefs();
      expect(result).assertEqual("Test Passed: JoinWithWeakRefsTest102");
    });

    /**
     * @tc.name   JoinWithDeletedElementTest103
     * @tc.number SUB_ARRAY_JOIN_TEST_103
     * @tc.desc   Verify that join treats an array element deleted with the `delete` operator as an empty string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithDeletedElementTest103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test103_JoinWithDeletedElement();
      expect(result).assertEqual("Test Passed: JoinWithDeletedElementTest103");
    });

    /**
     * @tc.name   JoinWithFinalizationRegistriesTest104
     * @tc.number SUB_ARRAY_JOIN_TEST_104
     * @tc.desc   Verify that join converts FinalizationRegistry objects to their string representation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithFinalizationRegistriesTest104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test104_JoinWithFinalizationRegistries();
      expect(result).assertEqual("Test Passed: JoinWithFinalizationRegistriesTest104");
    });

    /**
     * @tc.name   JoinWithLongSeparatorTest105
     * @tc.number SUB_ARRAY_JOIN_TEST_105
     * @tc.desc   Verify that join can handle very long separator strings efficiently.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL3
     */
    it('JoinWithLongSeparatorTest105', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, async () => {
      const result = await ArrayJoinTestUtils.test105_JoinWithLongSeparator();
      expect(result).assertEqual("Test Passed: JoinWithLongSeparatorTest105");
    });

    /**
     * @tc.name   JoinWithLargeBigIntTest108
     * @tc.number SUB_ARRAY_JOIN_TEST_108
     * @tc.desc   Verify that join converts very large BigInt values to their string representations correctly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithLargeBigIntTest108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test108_JoinWithLargeBigInt();
      expect(result).assertEqual("Test Passed: JoinWithLargeBigIntTest108");
    });

    /**
     * @tc.name   JoinWithForOfLoopTest109
     * @tc.number SUB_ARRAY_JOIN_TEST_109
     * @tc.desc   Verify that join works correctly with results collected from a for...of loop.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithForOfLoopTest109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test109_JoinWithForOfLoop();
      expect(result).assertEqual("Test Passed: JoinWithForOfLoopTest109");
    });

    /**
     * @tc.name   JoinWithPositiveAndNegativeZeroTest110
     * @tc.number SUB_ARRAY_JOIN_TEST_110
     * @tc.desc   Verify that both +0 and -0 are converted to the string "0" when joined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('JoinWithPositiveAndNegativeZeroTest110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayJoinTestUtils.test110_JoinWithPositiveAndNegativeZero();
      expect(result).assertEqual("Test Passed: JoinWithPositiveAndNegativeZeroTest110");
    });
  })
}