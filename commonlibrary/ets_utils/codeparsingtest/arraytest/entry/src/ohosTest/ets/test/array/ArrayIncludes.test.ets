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
import { ArrayIncludesTestUtils } from './ArrayIncludesTestUtils';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function arrayIncludesTestTest() {
  describe('ArrayIncludesTest', () => {
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
     * @tc.name   IncludesExistsNumberTest001
     * @tc.number SUB_ARRAY_INCLUDES_TEST_001
     * @tc.desc   验证includes检测数组中存在的数字类型，返回true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesExistsNumberTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test001_IncludesExistsNumber();
      expect(result).assertEqual("Test Passed: IncludesExistsNumberTest001");
    });

    /**
     * @tc.name   IncludesNotExistsStringTest002
     * @tc.number SUB_ARRAY_INCLUDES_TEST_002
     * @tc.desc   验证includes检测数组中不存在的字符串类型，返回false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesNotExistsStringTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test002_IncludesNotExistsString();
      expect(result).assertEqual("Test Passed: IncludesNotExistsStringTest002");
    });

    /**
     * @tc.name   IncludesSupportsNaNTest003
     * @tc.number SUB_ARRAY_INCLUDES_TEST_003
     * @tc.desc   验证includes支持NaN匹配（区别于indexOf），数组含NaN时返回true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesSupportsNaNTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test003_IncludesSupportsNaN();
      expect(result).assertEqual("Test Passed: IncludesSupportsNaNTest003");
    });

    /**
     * @tc.name   IncludesSparseArraySlotTest004
     * @tc.number SUB_ARRAY_INCLUDES_TEST_004
     * @tc.desc   验证includes处理稀疏数组空槽（空槽视为undefined），检测undefined返回true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesSparseArraySlotTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test004_IncludesSparseArraySlot();
      expect(result).assertEqual("Test Passed: IncludesSparseArraySlotTest004");
    });

    /**
     * @tc.name   IncludesWithPositiveFromIndexTest005
     * @tc.number SUB_ARRAY_INCLUDES_TEST_005
     * @tc.desc   验证includes使用正向fromIndex参数，从指定位置向后搜索并匹配目标
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesWithPositiveFromIndexTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test005_IncludesWithPositiveFromIndex();
      expect(result).assertEqual("Test Passed: IncludesWithPositiveFromIndexTest005");
    });

    /**
     * @tc.name   IncludesWithExceedFromIndexTest006
     * @tc.number SUB_ARRAY_INCLUDES_TEST_006
     * @tc.desc   验证includes的fromIndex超出数组长度时，无搜索范围返回false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesWithExceedFromIndexTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test006_IncludesWithExceedFromIndex();
      expect(result).assertEqual("Test Passed: IncludesWithExceedFromIndexTest006");
    });

    /**
     * @tc.name   IncludesWithNegativeFromIndexTest007
     * @tc.number SUB_ARRAY_INCLUDES_TEST_007
     * @tc.desc   验证includes使用负向fromIndex参数（等价数组长度+fromIndex），正确匹配目标
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesWithNegativeFromIndexTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test007_IncludesWithNegativeFromIndex();
      expect(result).assertEqual("Test Passed: IncludesWithNegativeFromIndexTest007");
    });

    /**
     * @tc.name   IncludesReferenceObjectTest008
     * @tc.number SUB_ARRAY_INCLUDES_TEST_008
     * @tc.desc   验证includes检测引用类型（对象）时，仅同一引用返回true，不同实例返回false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesReferenceObjectTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test008_IncludesReferenceObject();
      expect(result).assertEqual("Test Passed: IncludesReferenceObjectTest008");
    });

    /**
     * @tc.name   IncludesSpecialValuesTest009
     * @tc.number SUB_ARRAY_INCLUDES_TEST_009
     * @tc.desc   验证includes正确区分并检测undefined、null、空字符串等特殊值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesSpecialValuesTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test009_IncludesSpecialValues();
      expect(result).assertEqual("Test Passed: IncludesSpecialValuesTest009");
    });

    /**
     * @tc.name   IncludesEmptyArrayTest010
     * @tc.number SUB_ARRAY_INCLUDES_TEST_010
     * @tc.desc   验证空数组调用includes时，检测任何目标值均返回false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesEmptyArrayTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test010_IncludesEmptyArray();
      expect(result).assertEqual("Test Passed: IncludesEmptyArrayTest010");
    });

    /**
     * @tc.name   IncludesWithFromIndexZeroTest011
     * @tc.number SUB_ARRAY_INCLUDES_TEST_011
     * @tc.desc   验证includes的fromIndex为0时，从数组开头搜索并匹配目标
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesWithFromIndexZeroTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test011_IncludesWithFromIndexZero();
      expect(result).assertEqual("Test Passed: IncludesWithFromIndexZeroTest011");
    });

    /**
     * @tc.name   IncludesWithFromIndexNegativeExceedTest012
     * @tc.number SUB_ARRAY_INCLUDES_TEST_012
     * @tc.desc   验证includes的fromIndex为负数且绝对值超数组长度时，等价于从开头搜索
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesWithFromIndexNegativeExceedTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test012_IncludesWithFromIndexNegativeExceed();
      expect(result).assertEqual("Test Passed: IncludesWithFromIndexNegativeExceedTest012");
    });

    /**
     * @tc.name   IncludesExplicitUndefinedTest013
     * @tc.number SUB_ARRAY_INCLUDES_TEST_013
     * @tc.desc   验证includes检测数组中显式添加的undefined（非空槽），返回true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesExplicitUndefinedTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test013_IncludesExplicitUndefined();
      expect(result).assertEqual("Test Passed: IncludesExplicitUndefinedTest013");
    });

    /**
     * @tc.name   IncludesNotExistsNullTest014
     * @tc.number SUB_ARRAY_INCLUDES_TEST_014
     * @tc.desc   验证includes检测数组中不存在的null，返回false（区分null与undefined）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesNotExistsNullTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test014_IncludesNotExistsNull();
      expect(result).assertEqual("Test Passed: IncludesNotExistsNullTest014");
    });

    /**
     * @tc.name   IncludesNestedArrayNotMatchTest015
     * @tc.number SUB_ARRAY_INCLUDES_TEST_015
     * @tc.desc   验证includes检测嵌套数组时，新数组实例（引用不同）返回false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesNestedArrayNotMatchTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test015_IncludesNestedArrayNotMatch();
      expect(result).assertEqual("Test Passed: IncludesNestedArrayNotMatchTest015");
    });

    /**
     * @tc.name   IncludesNestedArrayMatchTest016
     * @tc.number SUB_ARRAY_INCLUDES_TEST_016
     * @tc.desc   验证includes检测嵌套数组时，同一引用实例返回true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesNestedArrayMatchTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test016_IncludesNestedArrayMatch();
      expect(result).assertEqual("Test Passed: IncludesNestedArrayMatchTest016");
    });

    /**
     * @tc.name   IncludesBooleanVsNumberTest017
     * @tc.number SUB_ARRAY_INCLUDES_TEST_017
     * @tc.desc   验证includes严格区分布尔值与数字（true≠1、false≠0），返回false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesBooleanVsNumberTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test017_IncludesBooleanVsNumber();
      expect(result).assertEqual("Test Passed: IncludesBooleanVsNumberTest017");
    });

    /**
     * @tc.name   IncludesEmptyStrVsSpaceTest018
     * @tc.number SUB_ARRAY_INCLUDES_TEST_018
     * @tc.desc   验证includes严格区分空字符串与空格字符串，数组含""时检测" "返回false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesEmptyStrVsSpaceTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test018_IncludesEmptyStrVsSpace();
      expect(result).assertEqual("Test Passed: IncludesEmptyStrVsSpaceTest018");
    });

    /**
     * @tc.name   IncludesWithFromIndexDecimalTest019
     * @tc.number SUB_ARRAY_INCLUDES_TEST_019
     * @tc.desc   验证includes的fromIndex为小数时，自动向下取整后搜索
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesWithFromIndexDecimalTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test019_IncludesWithFromIndexDecimal();
      expect(result).assertEqual("Test Passed: IncludesWithFromIndexDecimalTest019");
    });

    /**
     * @tc.name   IncludesSymbolTypeTest020
     * @tc.number SUB_ARRAY_INCLUDES_TEST_020
     * @tc.desc   验证includes检测Symbol类型时，同一实例返回true，不同实例返回false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesSymbolTypeTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test020_IncludesSymbolType();
      expect(result).assertEqual("Test Passed: IncludesSymbolTypeTest020");
    });

    /**
     * @tc.name   IncludesBigIntTypeTest021
     * @tc.number SUB_ARRAY_INCLUDES_TEST_021
     * @tc.desc   验证includes检测BigInt类型时，值相等（即使实例不同）返回true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesBigIntTypeTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test021_IncludesBigIntType();
      expect(result).assertEqual("Test Passed: IncludesBigIntTypeTest021");
    });

    /**
     * @tc.name   IncludesFromIndexMissFrontTest022
     * @tc.number SUB_ARRAY_INCLUDES_TEST_022
     * @tc.desc   验证includes的fromIndex指定位置后，前面的匹配元素不参与搜索（但仍有后续匹配返回true）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesFromIndexMissFrontTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test022_IncludesFromIndexMissFront();
      expect(result).assertEqual("Test Passed: IncludesFromIndexMissFrontTest022");
    });

    /**
     * @tc.name   IncludesDateObjectTest023
     * @tc.number SUB_ARRAY_INCLUDES_TEST_023
     * @tc.desc   验证includes检测Date对象时，同一实例返回true，不同实例（即使时间相同）返回false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesDateObjectTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test023_IncludesDateObject();
      expect(result).assertEqual("Test Passed: IncludesDateObjectTest023");
    });

    /**
     * @tc.name   IncludesRegExpObjectTest024
     * @tc.number SUB_ARRAY_INCLUDES_TEST_024
     * @tc.desc   验证includes检测RegExp对象时，同一实例返回true，不同实例（即使规则相同）返回false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesRegExpObjectTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test024_IncludesRegExpObject();
      expect(result).assertEqual("Test Passed: IncludesRegExpObjectTest024");
    });

    /**
     * @tc.name   IncludesEmptyStrInEmptyStrArrayTest025
     * @tc.number SUB_ARRAY_INCLUDES_TEST_025
     * @tc.desc   验证includes检测仅含空字符串的数组时，返回true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesEmptyStrInEmptyStrArrayTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test025_IncludesEmptyStrInEmptyStrArray();
      expect(result).assertEqual("Test Passed: IncludesEmptyStrInEmptyStrArrayTest025");
    });

    /**
     * @tc.name   IncludesFromIndexLastElementTest026
     * @tc.number SUB_ARRAY_INCLUDES_TEST_026
     * @tc.desc   验证includes的fromIndex为数组长度-1时，仅搜索最后一个元素并匹配
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesFromIndexLastElementTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test026_IncludesFromIndexLastElement();
      expect(result).assertEqual("Test Passed: IncludesFromIndexLastElementTest026");
    });

    /**
     * @tc.name   IncludesNotExistsSymbolTest027
     * @tc.number SUB_ARRAY_INCLUDES_TEST_027
     * @tc.desc   验证includes检测数组中不存在的Symbol实例，返回false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesNotExistsSymbolTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test027_IncludesNotExistsSymbol();
      expect(result).assertEqual("Test Passed: IncludesNotExistsSymbolTest027");
    });

    /**
     * @tc.name   IncludesBigIntVsNumberTest028
     * @tc.number SUB_ARRAY_INCLUDES_TEST_028
     * @tc.desc   验证includes严格区分BigInt与Number类型（10n≠10），返回false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesBigIntVsNumberTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test028_IncludesBigIntVsNumber();
      expect(result).assertEqual("Test Passed: IncludesBigIntVsNumberTest028");
    });

    /**
     * @tc.name   IncludesInLargeArrayTest029
     * @tc.number SUB_ARRAY_INCLUDES_TEST_029
     * @tc.desc   验证includes在大数组中检测存在的目标值，正确返回true（不关注性能）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesInLargeArrayTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test029_IncludesInLargeArray();
      expect(result).assertEqual("Test Passed: IncludesInLargeArrayTest029");
    });

    /**
     * @tc.name   IncludesUndefinedNoSlotTest030
     * @tc.number SUB_ARRAY_INCLUDES_TEST_030
     * @tc.desc   验证includes检测含显式undefined（无空槽）的数组，返回true（场景区分空槽）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesUndefinedNoSlotTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test030_IncludesUndefinedNoSlot();
      expect(result).assertEqual("Test Passed: IncludesUndefinedNoSlotTest030");
    });

    /**
     * @tc.name   IncludesWithFromIndexNaNTes031
     * @tc.number SUB_ARRAY_INCLUDES_TEST_031
     * @tc.desc   验证includes的fromIndex为NaN时自动转为0，从开头搜索
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesWithFromIndexNaNTes031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test031_IncludesWithFromIndexNaN();
      expect(result).assertEqual("Test Passed: IncludesWithFromIndexNaNTes031");
    });

    /**
     * @tc.name   IncludesStringCaseSensitiveTest032
     * @tc.number SUB_ARRAY_INCLUDES_TEST_032
     * @tc.desc   验证includes检测字符串数组时严格区分大小写，大小写不同返回false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesStringCaseSensitiveTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test032_IncludesStringCaseSensitive();
      expect(result).assertEqual("Test Passed: IncludesStringCaseSensitiveTest032");
    });

    /**
     * @tc.name   IncludesFunctionInstanceTest033
     * @tc.number SUB_ARRAY_INCLUDES_TEST_033
     * @tc.desc   验证includes检测function实例时，同一实例返回true，不同实例返回false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesFunctionInstanceTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test033_IncludesFunctionInstance();
      expect(result).assertEqual("Test Passed: IncludesFunctionInstanceTest033");
    });

    /**
     * @tc.name   IncludesOnArrayLikeTest034
     * @tc.number SUB_ARRAY_INCLUDES_TEST_034
     * @tc.desc   验证类数组对象通过Array.prototype.includes.call调用，正常检测元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesOnArrayLikeTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test034_IncludesOnArrayLike();
      expect(result).assertEqual("Test Passed: IncludesOnArrayLikeTest034");
    });

    /**
     * @tc.name   IncludesWithFromIndexStringNumTest035
     * @tc.number SUB_ARRAY_INCLUDES_TEST_035
     * @tc.desc   验证includes的fromIndex为字符串数字时，自动转为数字后搜索
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesWithFromIndexStringNumTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test035_IncludesWithFromIndexStringNum();
      expect(result).assertEqual("Test Passed: IncludesWithFromIndexStringNumTest035");
    });

    /**
     * @tc.name   IncludesInfinityValueTest036
     * @tc.number SUB_ARRAY_INCLUDES_TEST_036
     * @tc.desc   验证includes检测Infinity时，数组含Infinity返回true，含-Infinity返回false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesInfinityValueTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test036_IncludesInfinityValue();
      expect(result).assertEqual("Test Passed: IncludesInfinityValueTest036");
    });

    /**
     * @tc.name   IncludesUndefinedInNullArrayTest037
     * @tc.number SUB_ARRAY_INCLUDES_TEST_037
     * @tc.desc   验证数组仅含null时，includes检测undefined返回false（区分null与undefined）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesUndefinedInNullArrayTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test037_IncludesUndefinedInNullArray();
      expect(result).assertEqual("Test Passed: IncludesUndefinedInNullArrayTest037");
    });

    /**
     * @tc.name   IncludesNestedObjectTest038
     * @tc.number SUB_ARRAY_INCLUDES_TEST_038
     * @tc.desc   验证includes检测嵌套对象时，同一实例返回true，新对象（值相同）返回false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesNestedObjectTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test038_IncludesNestedObject();
      expect(result).assertEqual("Test Passed: IncludesNestedObjectTest038");
    });

    /**
     * @tc.name   IncludesSingleElementArrayTest039
     * @tc.number SUB_ARRAY_INCLUDES_TEST_039
     * @tc.desc   验证长度为1的数组，includes检测唯一元素返回true，其他元素返回false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesSingleElementArrayTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test039_IncludesSingleElementArray();
      expect(result).assertEqual("Test Passed: IncludesSingleElementArrayTest039");
    });

    /**
     * @tc.name   IncludesWithFromIndexMaxSafeIntTest040
     * @tc.number SUB_ARRAY_INCLUDES_TEST_040
     * @tc.desc   验证includes的fromIndex为最大安全整数时，远超数组长度返回false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesWithFromIndexMaxSafeIntTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test040_IncludesWithFromIndexMaxSafeInt();
      expect(result).assertEqual("Test Passed: IncludesWithFromIndexMaxSafeIntTest040");
    });

    /**
     * @tc.name   IncludesSharedSymbolTest041
     * @tc.number SUB_ARRAY_INCLUDES_TEST_041
     * @tc.desc   验证includes检测Symbol.for创建的共享Symbol时，同一key返回true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesSharedSymbolTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test041_IncludesSharedSymbol();
      expect(result).assertEqual("Test Passed: IncludesSharedSymbolTest041");
    });

    /**
     * @tc.name   IncludesCircularObjectTest042
     * @tc.number SUB_ARRAY_INCLUDES_TEST_042
     * @tc.desc   验证includes检测循环引用对象时，同一实例返回true（不受循环引用影响）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesCircularObjectTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test042_IncludesCircularObject();
      expect(result).assertEqual("Test Passed: IncludesCircularObjectTest042");
    });

    /**
     * @tc.name   IncludesWithFromIndexNegEqualLengthTest043
     * @tc.number SUB_ARRAY_INCLUDES_TEST_043
     * @tc.desc   验证includes的fromIndex为-数组长度时，等价于0从开头搜索
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesWithFromIndexNegEqualLengthTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test043_IncludesWithFromIndexNegEqualLength();
      expect(result).assertEqual("Test Passed: IncludesWithFromIndexNegEqualLengthTest043");
    });

    /**
     * @tc.name   IncludesDifferentBigIntTest044
     * @tc.number SUB_ARRAY_INCLUDES_TEST_044
     * @tc.desc   验证includes检测BigInt时，不同值视为不同元素返回false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesDifferentBigIntTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test044_IncludesDifferentBigInt();
      expect(result).assertEqual("Test Passed: IncludesDifferentBigIntTest044");
    });

    /**
     * @tc.name   IncludesSubstringInArrayTest045
     * @tc.number SUB_ARRAY_INCLUDES_TEST_045
     * @tc.desc   验证includes检测字符串数组时，子字符串（非元素）返回false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesSubstringInArrayTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test045_IncludesSubstringInArray();
      expect(result).assertEqual("Test Passed: IncludesSubstringInArrayTest045");
    });

    /**
     * @tc.name   IncludesNullAndUndefinedTest046
     * @tc.number SUB_ARRAY_INCLUDES_TEST_046
     * @tc.desc   验证数组同时含null和undefined时，includes检测两者均返回true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesNullAndUndefinedTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test046_IncludesNullAndUndefined();
      expect(result).assertEqual("Test Passed: IncludesNullAndUndefinedTest046");
    });

    /**
     * @tc.name   IncludesWithFromIndexNegativeZeroTest047
     * @tc.number SUB_ARRAY_INCLUDES_TEST_047
     * @tc.desc   验证includes的fromIndex为-0时，等价于0从开头搜索
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesWithFromIndexNegativeZeroTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test047_IncludesWithFromIndexNegativeZero();
      expect(result).assertEqual("Test Passed: IncludesWithFromIndexNegativeZeroTest047");
    });

    /**
     * @tc.name   IncludesArrayElementDifferentRefTest048
     * @tc.number SUB_ARRAY_INCLUDES_TEST_048
     * @tc.desc   验证includes检测数组元素为数组时，值相同引用不同返回false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesArrayElementDifferentRefTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test048_IncludesArrayElementDifferentRef();
      expect(result).assertEqual("Test Passed: IncludesArrayElementDifferentRefTest048");
    });

    /**
     * @tc.name   IncludesArrayLikeWithEmptySlotTest049
     * @tc.number SUB_ARRAY_INCLUDES_TEST_049
     * @tc.desc   验证类数组含空槽时，includes检测undefined返回true（空槽视为undefined）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesArrayLikeWithEmptySlotTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test049_IncludesArrayLikeWithEmptySlot();
      expect(result).assertEqual("Test Passed: IncludesArrayLikeWithEmptySlotTest049");
    });

    /**
     * @tc.name   IncludesTwoElementArrayTest050
     * @tc.number SUB_ARRAY_INCLUDES_TEST_050
     * @tc.desc   验证长度为2的数组，includes检测两个元素返回true，其他元素返回false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesTwoElementArrayTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test050_IncludesTwoElementArray();
      expect(result).assertEqual("Test Passed: IncludesTwoElementArrayTest050");
    });

    /**
     * @tc.name   IncludesNegativeInfinityTest051
     * @tc.number SUB_ARRAY_INCLUDES_TEST_051
     * @tc.desc   验证includes检测-Infinity时，数组含-Infinity返回true，含Infinity返回false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesNegativeInfinityTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test051_IncludesNegativeInfinity();
      expect(result).assertEqual("Test Passed: IncludesNegativeInfinityTest051");
    });


    /**
     * @tc.name   IncludesMultipleSameRefTest053
     * @tc.number SUB_ARRAY_INCLUDES_TEST_053
     * @tc.desc   验证数组含多个相同引用类型实例时，includes检测该实例返回true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesMultipleSameRefTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test053_IncludesMultipleSameRef();
      expect(result).assertEqual("Test Passed: IncludesMultipleSameRefTest053");
    });

    /**
     * @tc.name   IncludesArrayLikeNonNumberKeyTest054
     * @tc.number SUB_ARRAY_INCLUDES_TEST_054
     * @tc.desc   验证类数组含非数字索引时，includes忽略非数字索引，仅检测数字索引元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesArrayLikeNonNumberKeyTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test054_IncludesArrayLikeNonNumberKey();
      expect(result).assertEqual("Test Passed: IncludesArrayLikeNonNumberKeyTest054");
    });

    /**
     * @tc.name   IncludesBigIntMaxValueTest055
     * @tc.number SUB_ARRAY_INCLUDES_TEST_055
     * @tc.desc   验证includes检测BigInt最大值时，值匹配返回true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesBigIntMaxValueTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test055_IncludesBigIntMaxValue();
      expect(result).assertEqual("Test Passed: IncludesBigIntMaxValueTest055");
    });

    /**
     * @tc.name   IncludesWithFromIndexEmptyStringTest056
     * @tc.number SUB_ARRAY_INCLUDES_TEST_056
     * @tc.desc   验证includes的fromIndex为空字符串时，自动转为0从开头搜索
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesWithFromIndexEmptyStringTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test056_IncludesWithFromIndexEmptyString();
      expect(result).assertEqual("Test Passed: IncludesWithFromIndexEmptyStringTest056");
    });

    /**
     * @tc.name   IncludesNullInUndefinedArrayTest057
     * @tc.number SUB_ARRAY_INCLUDES_TEST_057
     * @tc.desc   验证数组含undefined时，includes检测null返回false（区分null与undefined）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesNullInUndefinedArrayTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test057_IncludesNullInUndefinedArray();
      expect(result).assertEqual("Test Passed: IncludesNullInUndefinedArrayTest057");
    });

    /**
     * @tc.name   IncludesFunctionPrototypeTest058
     * @tc.number SUB_ARRAY_INCLUDES_TEST_058
     * @tc.desc   验证includes检测function.prototype时，因非数组元素返回false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesFunctionPrototypeTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test058_IncludesFunctionPrototype();
      expect(result).assertEqual("Test Passed: IncludesFunctionPrototypeTest058");
    });

    /**
     * @tc.name   IncludesEmptyArrayLikeTest059
     * @tc.number SUB_ARRAY_INCLUDES_TEST_059
     * @tc.desc   验证空类数组（length=0）调用includes时，检测任何元素返回false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesEmptyArrayLikeTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test059_IncludesEmptyArrayLike();
      expect(result).assertEqual("Test Passed: IncludesEmptyArrayLikeTest059");
    });

    /**
     * @tc.name   IncludesNaNAndInfinityTest060
     * @tc.number SUB_ARRAY_INCLUDES_TEST_060
     * @tc.desc   验证数组含NaN和Infinity时，includes检测两者返回true，检测-Infinity返回false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesNaNAndInfinityTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test060_IncludesNaNAndInfinity();
      expect(result).assertEqual("Test Passed: IncludesNaNAndInfinityTest060");
    });

    /**
     * @tc.name   IncludesWithFromIndexBooleanTest061
     * @tc.number SUB_ARRAY_INCLUDES_TEST_061
     * @tc.desc   验证includes的fromIndex为布尔值时，true→1、false→0后搜索
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesWithFromIndexBooleanTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test061_IncludesWithFromIndexBoolean();
      expect(result).assertEqual("Test Passed: IncludesWithFromIndexBooleanTest061");
    });

    /**
     * @tc.name   IncludesTypedArrayInstanceTest062
     * @tc.number SUB_ARRAY_INCLUDES_TEST_062
     * @tc.desc   验证includes检测TypedArray实例时，同一实例返回true，不同实例返回false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesTypedArrayInstanceTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test062_IncludesTypedArrayInstance();
      expect(result).assertEqual("Test Passed: IncludesTypedArrayInstanceTest062");
    });

    /**
     * @tc.name   IncludesWithFromIndexObjectTest063
     * @tc.number SUB_ARRAY_INCLUDES_TEST_063
     * @tc.desc   验证includes的fromIndex为普通对象时，转为NaN→0后搜索
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesWithFromIndexObjectTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test063_IncludesWithFromIndexObject();
      expect(result).assertEqual("Test Passed: IncludesWithFromIndexObjectTest063");
    });

    /**
     * @tc.name   IncludesArraySymbolIteratorTest064
     * @tc.number SUB_ARRAY_INCLUDES_TEST_064
     * @tc.desc   验证includes检测数组的Symbol.iterator属性（非元素）时返回false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesArraySymbolIteratorTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test064_IncludesArraySymbolIterator();
      expect(result).assertEqual("Test Passed: IncludesArraySymbolIteratorTest064");
    });

    /**
     * @tc.name   IncludesMixedUndefinedSlotTest065
     * @tc.number SUB_ARRAY_INCLUDES_TEST_065
     * @tc.desc   验证includes检测含空槽和显式undefined的混合数组时，返回true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesMixedUndefinedSlotTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test065_IncludesMixedUndefinedSlot();
      expect(result).assertEqual("Test Passed: IncludesMixedUndefinedSlotTest065");
    });

    /**
     * @tc.name   IncludesNullVsZeroTest066
     * @tc.number SUB_ARRAY_INCLUDES_TEST_066
     * @tc.desc   验证includes严格区分null与0，数组含null时检测0返回false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesNullVsZeroTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test066_IncludesNullVsZero();
      expect(result).assertEqual("Test Passed: IncludesNullVsZeroTest066");
    });

    /**
     * @tc.name   IncludesWithFromIndexMinusOneTest067
     * @tc.number SUB_ARRAY_INCLUDES_TEST_067
     * @tc.desc   验证includes的fromIndex为-1时，等价于array.length-1仅搜索最后一个元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesWithFromIndexMinusOneTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test067_IncludesWithFromIndexMinusOne();
      expect(result).assertEqual("Test Passed: IncludesWithFromIndexMinusOneTest067");
    });

    /**
     * @tc.name   IncludesMultipleNaNTes068
     * @tc.number SUB_ARRAY_INCLUDES_TEST_068
     * @tc.desc   验证includes检测含多个NaN的数组时，返回true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesMultipleNaNTes068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test068_IncludesMultipleNaN();
      expect(result).assertEqual("Test Passed: IncludesMultipleNaNTes068");
    });

    /**
     * @tc.name   IncludesTypedArrayInArrayTest069
     * @tc.number SUB_ARRAY_INCLUDES_TEST_069
     * @tc.desc   验证Array的includes检测TypedArray元素时，按引用匹配返回true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesTypedArrayInArrayTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test069_IncludesTypedArrayInArray();
      expect(result).assertEqual("Test Passed: IncludesTypedArrayInArrayTest069");
    });

    /**
     * @tc.name   IncludesRegExpDifferentFlagsTest070
     * @tc.number SUB_ARRAY_INCLUDES_TEST_070
     * @tc.desc   验证includes检测不同标志的RegExp实例时，返回false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesRegExpDifferentFlagsTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test070_IncludesRegExpDifferentFlags();
      expect(result).assertEqual("Test Passed: IncludesRegExpDifferentFlagsTest070");
    });

    /**
     * @tc.name   IncludesWithFromIndexSymbolTest071
     * @tc.number SUB_ARRAY_INCLUDES_TEST_071
     * @tc.desc   验证includes的fromIndex为Symbol类型时，转为NaN→0后搜索
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesWithFromIndexSymbolTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test071_IncludesWithFromIndexSymbol();
      expect(result).assertEqual("Test Passed: IncludesWithFromIndexSymbolTest071");
    });

    /**
     * @tc.name   IncludesBlobObjectTest072
     * @tc.number SUB_ARRAY_INCLUDES_TEST_072
     * @tc.desc   验证includes检测Blob对象时，同一实例返回true，不同实例返回false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesBlobObjectTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test072_IncludesBlobObject();
      expect(result).assertEqual("Test Passed: IncludesBlobObjectTest072");
    });

    /**
     * @tc.name   IncludesWithFromIndexBigIntTest073
     * @tc.number SUB_ARRAY_INCLUDES_TEST_073
     * @tc.desc   验证includes的fromIndex为BigInt类型时，转为对应数字后搜索
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesWithFromIndexBigIntTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test073_IncludesWithFromIndexBigInt();
      expect(result).assertEqual("Test Passed: IncludesWithFromIndexBigIntTest073");
    });

    /**
     * @tc.name   IncludesPromiseInstanceTest074
     * @tc.number SUB_ARRAY_INCLUDES_TEST_074
     * @tc.desc   验证includes检测Promise实例时，同一实例返回true，不同实例返回false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesPromiseInstanceTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test074_IncludesPromiseInstance();
      expect(result).assertEqual("Test Passed: IncludesPromiseInstanceTest074");
    });

    /**
     * @tc.name   IncludesWithFromIndexNullTest075
     * @tc.number SUB_ARRAY_INCLUDES_TEST_075
     * @tc.desc   验证includes的fromIndex为null时，转为0后搜索
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesWithFromIndexNullTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test075_IncludesWithFromIndexNull();
      expect(result).assertEqual("Test Passed: IncludesWithFromIndexNullTest075");
    });

    /**
     * @tc.name   IncludesEmptyStrVsZeroTest076
     * @tc.number SUB_ARRAY_INCLUDES_TEST_076
     * @tc.desc   验证includes严格区分空字符串与0，数组含空字符串时检测0返回false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesEmptyStrVsZeroTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test076_IncludesEmptyStrVsZero();
      expect(result).assertEqual("Test Passed: IncludesEmptyStrVsZeroTest076");
    });

    /**
     * @tc.name   IncludesWithFromIndexNegLengthPlus1Test077
     * @tc.number SUB_ARRAY_INCLUDES_TEST_077
     * @tc.desc   验证includes的fromIndex为-array.length+1时，等价于1后搜索
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesWithFromIndexNegLengthPlus1Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test077_IncludesWithFromIndexNegLengthPlus1();
      expect(result).assertEqual("Test Passed: IncludesWithFromIndexNegLengthPlus1Test077");
    });

    /**
     * @tc.name   IncludesMapInstanceTest078
     * @tc.number SUB_ARRAY_INCLUDES_TEST_078
     * @tc.desc   验证includes检测Map实例时，同一实例返回true，不同实例返回false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesMapInstanceTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test078_IncludesMapInstance();
      expect(result).assertEqual("Test Passed: IncludesMapInstanceTest078");
    });

    /**
     * @tc.name   IncludesNestedMultiArrayTest079
     * @tc.number SUB_ARRAY_INCLUDES_TEST_079
     * @tc.desc   验证includes检测多层嵌套数组时，同一实例返回true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesNestedMultiArrayTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test079_IncludesNestedMultiArray();
      expect(result).assertEqual("Test Passed: IncludesNestedMultiArrayTest079");
    });

    /**
     * @tc.name   IncludesWithFromIndexLargePositiveTest080
     * @tc.number SUB_ARRAY_INCLUDES_TEST_080
     * @tc.desc   验证includes的fromIndex为极大正数但小于数组长度时，正常搜索
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesWithFromIndexLargePositiveTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test080_IncludesWithFromIndexLargePositive();
      expect(result).assertEqual("Test Passed: IncludesWithFromIndexLargePositiveTest080");
    });

    /**
     * @tc.name   IncludesSetInstanceTest081
     * @tc.number SUB_ARRAY_INCLUDES_TEST_081
     * @tc.desc   验证includes检测Set实例时，不同实例（同元素）返回false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesSetInstanceTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test081_IncludesSetInstance();
      expect(result).assertEqual("Test Passed: IncludesSetInstanceTest081");
    });

    /**
     * @tc.name   IncludesWithFromIndexNonNumStringTest082
     * @tc.number SUB_ARRAY_INCLUDES_TEST_082
     * @tc.desc   验证includes的fromIndex为非数字字符串时，转为NaN→0后搜索
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesWithFromIndexNonNumStringTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test082_IncludesWithFromIndexNonNumString();
      expect(result).assertEqual("Test Passed: IncludesWithFromIndexNonNumStringTest082");
    });

    /**
     * @tc.name   IncludesInfinityVsMaxValueTest083
     * @tc.number SUB_ARRAY_INCLUDES_TEST_083
     * @tc.desc   验证includes严格区分Infinity与Number.MAX_VALUE，返回false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesInfinityVsMaxValueTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test083_IncludesInfinityVsMaxValue();
      expect(result).assertEqual("Test Passed: IncludesInfinityVsMaxValueTest083");
    });

    /**
     * @tc.name   IncludesDateDifferentTimeTest084
     * @tc.number SUB_ARRAY_INCLUDES_TEST_084
     * @tc.desc   验证includes检测不同时间的Date实例时，返回false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesDateDifferentTimeTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test084_IncludesDateDifferentTime();
      expect(result).assertEqual("Test Passed: IncludesDateDifferentTimeTest084");
    });

    /**
     * @tc.name   IncludesWithFromIndexNegLengthMinus1Test085
     * @tc.number SUB_ARRAY_INCLUDES_TEST_085
     * @tc.desc   验证includes的fromIndex为-array.length-1时，转为0后搜索
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesWithFromIndexNegLengthMinus1Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test085_IncludesWithFromIndexNegLengthMinus1();
      expect(result).assertEqual("Test Passed: IncludesWithFromIndexNegLengthMinus1Test085");
    });

    /**
     * @tc.name   IncludesArrowVsNormalFuncTest086
     * @tc.number SUB_ARRAY_INCLUDES_TEST_086
     * @tc.desc   验证includes检测箭头函数与普通函数时，不同类型返回false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesArrowVsNormalFuncTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test086_IncludesArrowVsNormalFunc();
      expect(result).assertEqual("Test Passed: IncludesArrowVsNormalFuncTest086");
    });

    /**
     * @tc.name   IncludesEmptyObjectDifferentRefTest087
     * @tc.number SUB_ARRAY_INCLUDES_TEST_087
     * @tc.desc   验证includes检测不同引用的空对象时，返回false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesEmptyObjectDifferentRefTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test087_IncludesEmptyObjectDifferentRef();
      expect(result).assertEqual("Test Passed: IncludesEmptyObjectDifferentRefTest087");
    });

    /**
     * @tc.name   IncludesWithFromIndexDecimalExceedTest088
     * @tc.number SUB_ARRAY_INCLUDES_TEST_088
     * @tc.desc   验证includes的fromIndex为小数且取整后超数组长度时，返回false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesWithFromIndexDecimalExceedTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test088_IncludesWithFromIndexDecimalExceed();
      expect(result).assertEqual("Test Passed: IncludesWithFromIndexDecimalExceedTest088");
    });

    /**
     * @tc.name   IncludesNegativeZeroVsZeroTest089
     * @tc.number SUB_ARRAY_INCLUDES_TEST_089
     * @tc.desc   验证includes检测-0时，因-0===0，数组含0返回true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesNegativeZeroVsZeroTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test089_IncludesNegativeZeroVsZero();
      expect(result).assertEqual("Test Passed: IncludesNegativeZeroVsZeroTest089");
    });

    /**
     * @tc.name   IncludesRegExpDifferentSourceTest090
     * @tc.number SUB_ARRAY_INCLUDES_TEST_090
     * @tc.desc   验证includes检测不同源的RegExp实例时，返回false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesRegExpDifferentSourceTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test090_IncludesRegExpDifferentSource();
      expect(result).assertEqual("Test Passed: IncludesRegExpDifferentSourceTest090");
    });

    /**
     * @tc.name   IncludesWithFromIndexEqualLengthTest091
     * @tc.number SUB_ARRAY_INCLUDES_TEST_091
     * @tc.desc   验证includes的fromIndex等于数组长度时，无搜索范围返回false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesWithFromIndexEqualLengthTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test091_IncludesWithFromIndexEqualLength();
      expect(result).assertEqual("Test Passed: IncludesWithFromIndexEqualLengthTest091");
    });

    /**
     * @tc.name   IncludesDifferentTypedArrayTypeTest092
     * @tc.number SUB_ARRAY_INCLUDES_TEST_092
     * @tc.desc   验证includes检测不同类型的TypedArray（同值）时，返回false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesDifferentTypedArrayTypeTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test092_IncludesDifferentTypedArrayType();
      expect(result).assertEqual("Test Passed: IncludesDifferentTypedArrayTypeTest092");
    });

    /**
     * @tc.name   IncludesNonEnumerablePropertyTest093
     * @tc.number SUB_ARRAY_INCLUDES_TEST_093
     * @tc.desc   验证includes检测数组的不可枚举属性时，因非元素返回false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesNonEnumerablePropertyTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test093_IncludesNonEnumerableProperty();
      expect(result).assertEqual("Test Passed: IncludesNonEnumerablePropertyTest093");
    });

    /**
     * @tc.name   IncludesWithFromIndexNegativeInfinityTest094
     * @tc.number SUB_ARRAY_INCLUDES_TEST_094
     * @tc.desc   验证includes的fromIndex为-Infinity时，转为0后搜索
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesWithFromIndexNegativeInfinityTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test094_IncludesWithFromIndexNegativeInfinity();
      expect(result).assertEqual("Test Passed: IncludesWithFromIndexNegativeInfinityTest094");
    });

    /**
     * @tc.name   IncludesNaNAndNullTest095
     * @tc.number SUB_ARRAY_INCLUDES_TEST_095
     * @tc.desc   验证includes检测含NaN和null的数组时，两者均返回true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesNaNAndNullTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test095_IncludesNaNAndNull();
      expect(result).assertEqual("Test Passed: IncludesNaNAndNullTest095");
    });

    /**
     * @tc.name   IncludesStringZeroVsNumberZeroTest096
     * @tc.number SUB_ARRAY_INCLUDES_TEST_096
     * @tc.desc   验证includes严格区分字符串"0"与数字0，返回false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesStringZeroVsNumberZeroTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test096_IncludesStringZeroVsNumberZero();
      expect(result).assertEqual("Test Passed: IncludesStringZeroVsNumberZeroTest096");
    });

    /**
     * @tc.name   IncludesWithFromIndexInfinityTest097
     * @tc.number SUB_ARRAY_INCLUDES_TEST_097
     * @tc.desc   验证includes的fromIndex为Infinity时，超出范围返回false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesWithFromIndexInfinityTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test097_IncludesWithFromIndexInfinity();
      expect(result).assertEqual("Test Passed: IncludesWithFromIndexInfinityTest097");
    });

    /**
     * @tc.name   IncludesBoundFunctionTest098
     * @tc.number SUB_ARRAY_INCLUDES_TEST_098
     * @tc.desc   验证includes检测bind后的函数时，因新实例返回false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesBoundFunctionTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test098_IncludesBoundFunction();
      expect(result).assertEqual("Test Passed: IncludesBoundFunctionTest098");
    });

    /**
     * @tc.name   IncludesSymbolDifferentDescTest099
     * @tc.number SUB_ARRAY_INCLUDES_TEST_099
     * @tc.desc   验证includes检测不同描述的Symbol时，返回false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesSymbolDifferentDescTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test099_IncludesSymbolDifferentDesc();
      expect(result).assertEqual("Test Passed: IncludesSymbolDifferentDescTest099");
    });

    /**
     * @tc.name   IncludesComprehensiveSceneTest100
     * @tc.number SUB_ARRAY_INCLUDES_TEST_100
     * @tc.desc   综合验证includes对基本类型、引用类型、特殊值的匹配逻辑
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesComprehensiveSceneTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test100_IncludesComprehensiveScene();
      expect(result).assertEqual("Test Passed: IncludesComprehensiveSceneTest100");
    });
    /**
     * @tc.name   IncludesMapEntryObjectTest101
     * @tc.number SUB_ARRAY_INCLUDES_TEST_101
     * @tc.desc   验证Array.prototype.includes对Map Entry对象的引用匹配逻辑：同一Entry实例返回true，不同实例（即使键值相同）返回false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IncludesMapEntryObjectTest101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIncludesTestUtils.test101_IncludesMapEntryObject();
      expect(result).assertEqual("Test Passed: IncludesMapEntryObjectTest101");
    });
  })
}