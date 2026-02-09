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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { ArrayIndexOfTestUtils } from './ArrayIndexOfTestUtils';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function arrayIndexOfTestTest() {
  describe('ArrayIndexOfTest', () => {
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
     * @tc.name   IndexOfExistsNumberTest001
     * @tc.number SUB_ARRAY_INDEXOF_TEST_001
     * @tc.desc   验证indexOf检测数组中存在的数字，返回首次匹配的索引
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfExistsNumberTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test001_IndexOfExistsNumber();
      expect(result).assertEqual("Test Passed: IndexOfExistsNumberTest001");
    });

    /**
     * @tc.name   IndexOfNotExistsStringTest002
     * @tc.number SUB_ARRAY_INDEXOF_TEST_002
     * @tc.desc   验证indexOf检测数组中不存在的字符串，返回-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfNotExistsStringTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test002_IndexOfNotExistsString();
      expect(result).assertEqual("Test Passed: IndexOfNotExistsStringTest002");
    });

    /**
     * @tc.name   IndexOfNotSupportNaNTes003
     * @tc.number SUB_ARRAY_INDEXOF_TEST_003
     * @tc.desc   验证indexOf不支持NaN匹配（NaN !== NaN），返回-1（对比includes支持NaN）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfNotSupportNaNTes003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test003_IndexOfNotSupportNaN();
      expect(result).assertEqual("Test Passed: IndexOfNotSupportNaNTes003");
    });

    /**
     * @tc.name   IndexOfSparseArraySlotTest004
     * @tc.number SUB_ARRAY_INDEXOF_TEST_004
     * @tc.desc   验证indexOf处理稀疏数组空槽时，检测undefined返回-1（空槽≠显式undefined，对比includes）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfSparseArraySlotTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test004_IndexOfSparseArraySlot();
      expect(result).assertEqual("Test Passed: IndexOfSparseArraySlotTest004");
    });

    /**
     * @tc.name   IndexOfWithFromIndexPositiveTest005
     * @tc.number SUB_ARRAY_INDEXOF_TEST_005
     * @tc.desc   验证indexOf使用正向fromIndex，从指定位置向后搜索首次匹配的索引
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfWithFromIndexPositiveTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test005_IndexOfWithFromIndexPositive();
      expect(result).assertEqual("Test Passed: IndexOfWithFromIndexPositiveTest005");
    });

    /**
     * @tc.name   IndexOfWithFromIndexExceedTest006
     * @tc.number SUB_ARRAY_INDEXOF_TEST_006
     * @tc.desc   验证indexOf的fromIndex超出数组长度时，返回-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfWithFromIndexExceedTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test006_IndexOfWithFromIndexExceed();
      expect(result).assertEqual("Test Passed: IndexOfWithFromIndexExceedTest006");
    });

    /**
     * @tc.name   IndexOfWithFromIndexNegativeTest007
     * @tc.number SUB_ARRAY_INDEXOF_TEST_007
     * @tc.desc   验证indexOf使用负fromIndex（等价array.length+fromIndex），返回首次匹配的索引
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfWithFromIndexNegativeTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test007_IndexOfWithFromIndexNegative();
      expect(result).assertEqual("Test Passed: IndexOfWithFromIndexNegativeTest007");
    });

    /**
     * @tc.name   IndexOfReferenceTypeObjectTest008
     * @tc.number SUB_ARRAY_INDEXOF_TEST_008
     * @tc.desc   验证indexOf检测引用类型（对象）时，仅同一引用返回索引，不同引用返回-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfReferenceTypeObjectTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test008_IndexOfReferenceTypeObject();
      expect(result).assertEqual("Test Passed: IndexOfReferenceTypeObjectTest008");
    });

    /**
     * @tc.name   IndexOfDistinguishStringNumTest009
     * @tc.number SUB_ARRAY_INDEXOF_TEST_009
     * @tc.desc   验证indexOf严格区分字符串数字与数字，类型不同返回-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfDistinguishStringNumTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test009_IndexOfDistinguishStringNum();
      expect(result).assertEqual("Test Passed: IndexOfDistinguishStringNumTest009");
    });

    /**
     * @tc.name   IndexOfEmptyArrayTest010
     * @tc.number SUB_ARRAY_INDEXOF_TEST_010
     * @tc.desc   验证空数组调用indexOf时，任何目标均返回-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfEmptyArrayTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test010_IndexOfEmptyArray();
      expect(result).assertEqual("Test Passed: IndexOfEmptyArrayTest010");
    });

    /**
     * @tc.name   IndexOfWithFromIndexZeroTest011
     * @tc.number SUB_ARRAY_INDEXOF_TEST_011
     * @tc.desc   验证indexOf的fromIndex为0时，从开头搜索返回首次匹配的索引
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfWithFromIndexZeroTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test011_IndexOfWithFromIndexZero();
      expect(result).assertEqual("Test Passed: IndexOfWithFromIndexZeroTest011");
    });

    /**
     * @tc.name   IndexOfDuplicateElementsTest012
     * @tc.number SUB_ARRAY_INDEXOF_TEST_012
     * @tc.desc   验证indexOf检测含重复元素的数组时，返回目标元素首次出现的索引
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfDuplicateElementsTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test012_IndexOfDuplicateElements();
      expect(result).assertEqual("Test Passed: IndexOfDuplicateElementsTest012");
    });

    /**
     * @tc.name   IndexOfExplicitUndefinedTest013
     * @tc.number SUB_ARRAY_INDEXOF_TEST_013
     * @tc.desc   验证indexOf检测数组中显式undefined时返回正确索引，区别于稀疏数组的空槽
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfExplicitUndefinedTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test013_IndexOfExplicitUndefined();
      expect(result).assertEqual("Test Passed: IndexOfExplicitUndefinedTest013");
    });

    /**
     * @tc.name   IndexOfFromIndexNegExceedLengthTest014
     * @tc.number SUB_ARRAY_INDEXOF_TEST_014
     * @tc.desc   验证indexOf的fromIndex为负数且绝对值超数组长度时，转为0返回首次匹配索引
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfFromIndexNegExceedLengthTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test014_IndexOfFromIndexNegExceedLength();
      expect(result).assertEqual("Test Passed: IndexOfFromIndexNegExceedLengthTest014");
    });

    /**
     * @tc.name   IndexOfNullValueTest015
     * @tc.number SUB_ARRAY_INDEXOF_TEST_015
     * @tc.desc   验证indexOf检测数组中null时返回正确索引，严格区分null与undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfNullValueTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test015_IndexOfNullValue();
      expect(result).assertEqual("Test Passed: IndexOfNullValueTest015");
    });

    /**
     * @tc.name   IndexOfFromIndexDecimalTest016
     * @tc.number SUB_ARRAY_INDEXOF_TEST_016
     * @tc.desc   验证indexOf的fromIndex为小数时，自动向下取整后返回正确索引
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfFromIndexDecimalTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test016_IndexOfFromIndexDecimal();
      expect(result).assertEqual("Test Passed: IndexOfFromIndexDecimalTest016");
    });

    /**
     * @tc.name   IndexOfNestedArrayDifferentRefTest017
     * @tc.number SUB_ARRAY_INDEXOF_TEST_017
     * @tc.desc   验证indexOf检测嵌套数组时，引用不同返回-1，同一引用返回正确索引
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfNestedArrayDifferentRefTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test017_IndexOfNestedArrayDifferentRef();
      expect(result).assertEqual("Test Passed: IndexOfNestedArrayDifferentRefTest017");
    });

    /**
     * @tc.name   IndexOfBooleanVsNumberTest018
     * @tc.number SUB_ARRAY_INDEXOF_TEST_018
     * @tc.desc   验证indexOf严格区分布尔值与数字（true≠1、false≠0），返回-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfBooleanVsNumberTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test018_IndexOfBooleanVsNumber();
      expect(result).assertEqual("Test Passed: IndexOfBooleanVsNumberTest018");
    });

    /**
     * @tc.name   IndexOfFromIndexStringNumTest019
     * @tc.number SUB_ARRAY_INDEXOF_TEST_019
     * @tc.desc   验证indexOf的fromIndex为字符串数字时，自动转为数字后返回正确索引
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfFromIndexStringNumTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test019_IndexOfFromIndexStringNum();
      expect(result).assertEqual("Test Passed: IndexOfFromIndexStringNumTest019");
    });

    /**
     * @tc.name   IndexOfSymbolInstanceTest020
     * @tc.number SUB_ARRAY_INDEXOF_TEST_020
     * @tc.desc   验证indexOf检测Symbol时，同一实例返回正确索引，不同实例返回-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfSymbolInstanceTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test020_IndexOfSymbolInstance();
      expect(result).assertEqual("Test Passed: IndexOfSymbolInstanceTest020");
    });

    /**
     * @tc.name   IndexOfInfinityValueTest021
     * @tc.number SUB_ARRAY_INDEXOF_TEST_021
     * @tc.desc   验证indexOf检测Infinity时返回正确索引，严格区分Infinity与-Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfInfinityValueTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test021_IndexOfInfinityValue();
      expect(result).assertEqual("Test Passed: IndexOfInfinityValueTest021");
    });

    /**
     * @tc.name   IndexOfFromIndexBooleanTest022
     * @tc.number SUB_ARRAY_INDEXOF_TEST_022
     * @tc.desc   验证indexOf的fromIndex为布尔值时，true→1、false→0后返回正确索引
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfFromIndexBooleanTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test022_IndexOfFromIndexBoolean();
      expect(result).assertEqual("Test Passed: IndexOfFromIndexBooleanTest022");
    });

    /**
     * @tc.name   IndexOfDateInstanceTest023
     * @tc.number SUB_ARRAY_INDEXOF_TEST_023
     * @tc.desc   验证indexOf检测Date时，同一实例返回正确索引，不同实例（同时间）返回-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfDateInstanceTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test023_IndexOfDateInstance();
      expect(result).assertEqual("Test Passed: IndexOfDateInstanceTest023");
    });

    /**
     * @tc.name   IndexOfFromIndexObjectTest024
     * @tc.number SUB_ARRAY_INDEXOF_TEST_024
     * @tc.desc   验证indexOf的fromIndex为普通对象时，转为NaN→0后返回正确索引
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfFromIndexObjectTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test024_IndexOfFromIndexObject();
      expect(result).assertEqual("Test Passed: IndexOfFromIndexObjectTest024");
    });

    /**
     * @tc.name   IndexOfBigIntVsNumberTest025
     * @tc.number SUB_ARRAY_INDEXOF_TEST_025
     * @tc.desc   验证indexOf严格区分BigInt与Number（10n≠10），返回-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfBigIntVsNumberTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test025_IndexOfBigIntVsNumber();
      expect(result).assertEqual("Test Passed: IndexOfBigIntVsNumberTest025");
    });

    /**
     * @tc.name   IndexOfOnArrayLikeTest026
     * @tc.number SUB_ARRAY_INDEXOF_TEST_026
     * @tc.desc   验证类数组对象通过Array.prototype.indexOf.call调用，返回正确索引
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfOnArrayLikeTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test026_IndexOfOnArrayLike();
      expect(result).assertEqual("Test Passed: IndexOfOnArrayLikeTest026");
    });

    /**
     * @tc.name   IndexOfFromIndexNegativeInfinityTest027
     * @tc.number SUB_ARRAY_INDEXOF_TEST_027
     * @tc.desc   验证indexOf的fromIndex为-Infinity时，转为0后返回正确索引
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfFromIndexNegativeInfinityTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test027_IndexOfFromIndexNegativeInfinity();
      expect(result).assertEqual("Test Passed: IndexOfFromIndexNegativeInfinityTest027");
    });

    /**
     * @tc.name   IndexOfMultipleUndefinedTest028
     * @tc.number SUB_ARRAY_INDEXOF_TEST_028
     * @tc.desc   验证indexOf检测含多个显式undefined的数组时，返回首次出现的索引
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfMultipleUndefinedTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test028_IndexOfMultipleUndefined();
      expect(result).assertEqual("Test Passed: IndexOfMultipleUndefinedTest028");
    });

    /**
     * @tc.name   IndexOfFromIndexNonNumStringTest029
     * @tc.number SUB_ARRAY_INDEXOF_TEST_029
     * @tc.desc   验证indexOf的fromIndex为非数字字符串时，转为NaN→0后返回正确索引
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfFromIndexNonNumStringTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test029_IndexOfFromIndexNonNumString();
      expect(result).assertEqual("Test Passed: IndexOfFromIndexNonNumStringTest029");
    });

    /**
     * @tc.name   IndexOfArrayPrototypePropertyTest030
     * @tc.number SUB_ARRAY_INDEXOF_TEST_030
     * @tc.desc   验证indexOf仅检测数组索引元素，不检测数组prototype属性，返回-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfArrayPrototypePropertyTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test030_IndexOfArrayPrototypeProperty();
      expect(result).assertEqual("Test Passed: IndexOfArrayPrototypePropertyTest030");
    });

    /**
     * @tc.name   IndexOfFromIndexNegativeZeroTest031
     * @tc.number SUB_ARRAY_INDEXOF_TEST_031
     * @tc.desc   验证indexOf的fromIndex为-0时，等价于0返回首次匹配的索引
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfFromIndexNegativeZeroTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test031_IndexOfFromIndexNegativeZero();
      expect(result).assertEqual("Test Passed: IndexOfFromIndexNegativeZeroTest031");
    });

    /**
     * @tc.name   IndexOfRegExpInstanceTest032
     * @tc.number SUB_ARRAY_INDEXOF_TEST_032
     * @tc.desc   验证indexOf检测RegExp时，同一实例返回索引，不同实例（即使规则相同）返回-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfRegExpInstanceTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test032_IndexOfRegExpInstance();
      expect(result).assertEqual("Test Passed: IndexOfRegExpInstanceTest032");
    });

    /**
     * @tc.name   IndexOfEmptyStringTest033
     * @tc.number SUB_ARRAY_INDEXOF_TEST_033
     * @tc.desc   验证indexOf检测数组中空字符串时，返回首次出现的索引
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfEmptyStringTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test033_IndexOfEmptyString();
      expect(result).assertEqual("Test Passed: IndexOfEmptyStringTest033");
    });

    /**
     * @tc.name   IndexOfFromIndexLastElementTest034
     * @tc.number SUB_ARRAY_INDEXOF_TEST_034
     * @tc.desc   验证indexOf的fromIndex为array.length-1时，仅搜索最后一个元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfFromIndexLastElementTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test034_IndexOfFromIndexLastElement();
      expect(result).assertEqual("Test Passed: IndexOfFromIndexLastElementTest034");
    });

    /**
     * @tc.name   IndexOfBoundFunctionTest035
     * @tc.number SUB_ARRAY_INDEXOF_TEST_035
     * @tc.desc   验证indexOf检测bind后的函数时，因新实例返回-1，原函数返回索引
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfBoundFunctionTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test035_IndexOfBoundFunction();
      expect(result).assertEqual("Test Passed: IndexOfBoundFunctionTest035");
    });

    /**
     * @tc.name   IndexOfDifferentBigIntTest036
     * @tc.number SUB_ARRAY_INDEXOF_TEST_036
     * @tc.desc   验证indexOf检测不同值的BigInt时，返回-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfDifferentBigIntTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test036_IndexOfDifferentBigInt();
      expect(result).assertEqual("Test Passed: IndexOfDifferentBigIntTest036");
    });

    /**
     * @tc.name   IndexOfArrayLikeWithEmptySlotTest037
     * @tc.number SUB_ARRAY_INDEXOF_TEST_037
     * @tc.desc   验证类数组含空槽时，indexOf检测undefined返回-1（空槽≠显式undefined）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfArrayLikeWithEmptySlotTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test037_IndexOfArrayLikeWithEmptySlot();
      expect(result).assertEqual("Test Passed: IndexOfArrayLikeWithEmptySlotTest037");
    });

    /**
     * @tc.name   IndexOfFromIndexNaNTes038
     * @tc.number SUB_ARRAY_INDEXOF_TEST_038
     * @tc.desc   验证indexOf的fromIndex为NaN时，转为0返回首次匹配的索引
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfFromIndexNaNTes038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test038_IndexOfFromIndexNaN();
      expect(result).assertEqual("Test Passed: IndexOfFromIndexNaNTes038");
    });

    /**
     * @tc.name   IndexOfNegativeInfinityTest039
     * @tc.number SUB_ARRAY_INDEXOF_TEST_039
     * @tc.desc   验证indexOf检测数组中-Infinity时返回正确索引，区分-Infinity与Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfNegativeInfinityTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test039_IndexOfNegativeInfinity();
      expect(result).assertEqual("Test Passed: IndexOfNegativeInfinityTest039");
    });

    /**
     * @tc.name   IndexOfStringCaseSensitiveTest040
     * @tc.number SUB_ARRAY_INDEXOF_TEST_040
     * @tc.desc   验证indexOf检测字符串时严格区分大小写，大小写不同返回-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfStringCaseSensitiveTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test040_IndexOfStringCaseSensitive();
      expect(result).assertEqual("Test Passed: IndexOfStringCaseSensitiveTest040");
    });

    /**
     * @tc.name   IndexOfMultipleSameRefObjectTest041
     * @tc.number SUB_ARRAY_INDEXOF_TEST_041
     * @tc.desc   验证indexOf检测含多个相同引用对象的数组时，返回首次出现的索引
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfMultipleSameRefObjectTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test041_IndexOfMultipleSameRefObject();
      expect(result).assertEqual("Test Passed: IndexOfMultipleSameRefObjectTest041");
    });

    /**
     * @tc.name   IndexOfArrayElementSameRefTest042
     * @tc.number SUB_ARRAY_INDEXOF_TEST_042
     * @tc.desc   验证indexOf检测数组元素为数组时，同一引用返回索引，不同引用返回-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfArrayElementSameRefTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test042_IndexOfArrayElementSameRef();
      expect(result).assertEqual("Test Passed: IndexOfArrayElementSameRefTest042");
    });

    /**
     * @tc.name   IndexOfFromIndexSymbolTest043
     * @tc.number SUB_ARRAY_INDEXOF_TEST_043
     * @tc.desc   验证ES规范：Symbol作为fromIndex时，indexOf抛出TypeError（无法转为数字）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfFromIndexSymbolTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test043_IndexOfFromIndexSymbol();
      expect(result).assertEqual("Test Passed: IndexOfFromIndexSymbolTest043");
    });

    /**
     * @tc.name   IndexOfFromIndexBigIntTest044
     * @tc.number SUB_ARRAY_INDEXOF_TEST_044
     * @tc.desc   验证ES规范：BigInt作为fromIndex时，indexOf抛出TypeError（无法转为数字）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfFromIndexBigIntTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test044_IndexOfFromIndexBigInt();
      expect(result).assertEqual("Test Passed: IndexOfFromIndexBigIntTest044");
    });

    /**
     * @tc.name   IndexOfEmptyStrVsSpaceTest045
     * @tc.number SUB_ARRAY_INDEXOF_TEST_045
     * @tc.desc   验证indexOf严格区分空字符串与空格字符串，返回对应索引或-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfEmptyStrVsSpaceTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test045_IndexOfEmptyStrVsSpace();
      expect(result).assertEqual("Test Passed: IndexOfEmptyStrVsSpaceTest045");
    });

    /**
     * @tc.name   IndexOfFromIndexMaxSafeIntTest046
     * @tc.number SUB_ARRAY_INDEXOF_TEST_046
     * @tc.desc   验证indexOf的fromIndex为最大安全整数时，远超数组长度返回-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfFromIndexMaxSafeIntTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test046_IndexOfFromIndexMaxSafeInt();
      expect(result).assertEqual("Test Passed: IndexOfFromIndexMaxSafeIntTest046");
    });

    /**
     * @tc.name   IndexOfCircularObjectTest047
     * @tc.number SUB_ARRAY_INDEXOF_TEST_047
     * @tc.desc   验证indexOf检测循环引用对象时，同一实例返回索引，不同实例返回-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfCircularObjectTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test047_IndexOfCircularObject();
      expect(result).assertEqual("Test Passed: IndexOfCircularObjectTest047");
    });

    /**
     * @tc.name   IndexOfFunctionPrototypeTest048
     * @tc.number SUB_ARRAY_INDEXOF_TEST_048
     * @tc.desc   验证indexOf检测函数的prototype属性（非元素）时，返回-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfFunctionPrototypeTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test048_IndexOfFunctionPrototype();
      expect(result).assertEqual("Test Passed: IndexOfFunctionPrototypeTest048");
    });

    /**
     * @tc.name   IndexOfArrayLikeNonNumberKeyTest049
     * @tc.number SUB_ARRAY_INDEXOF_TEST_049
     * @tc.desc   验证indexOf处理类数组非数字索引时，忽略非数字索引，仅检测数字索引元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfArrayLikeNonNumberKeyTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test049_IndexOfArrayLikeNonNumberKey();
      expect(result).assertEqual("Test Passed: IndexOfArrayLikeNonNumberKeyTest049");
    });

    /**
     * @tc.name   IndexOfComprehensiveSceneTest050
     * @tc.number SUB_ARRAY_INDEXOF_TEST_050
     * @tc.desc   综合验证indexOf对基本类型、引用类型、特殊值的匹配逻辑，突出与includes的差异
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfComprehensiveSceneTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test050_IndexOfComprehensiveScene();
      expect(result).assertEqual("Test Passed: IndexOfComprehensiveSceneTest050");
    });

    /**
     * @tc.name   IndexOfFromIndexNegativeDecimalTest051
     * @tc.number SUB_ARRAY_INDEXOF_TEST_051
     * @tc.desc   验证indexOf的fromIndex为负小数时，向下取整后计算实际起始索引，返回正确索引
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfFromIndexNegativeDecimalTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test051_IndexOfFromIndexNegativeDecimal();
      expect(result).assertEqual("Test Passed: IndexOfFromIndexNegativeDecimalTest051");
    });

    /**
     * @tc.name   IndexOfZeroVsNegativeZeroTest052
     * @tc.number SUB_ARRAY_INDEXOF_TEST_052
     * @tc.desc   验证indexOf不区分0与-0（0===-0），返回对应索引
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfZeroVsNegativeZeroTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test052_IndexOfZeroVsNegativeZero();
      expect(result).assertEqual("Test Passed: IndexOfZeroVsNegativeZeroTest052");
    });

    /**
     * @tc.name   IndexOfUndefinedAtEndTest053
     * @tc.number SUB_ARRAY_INDEXOF_TEST_053
     * @tc.desc   验证indexOf检测数组末尾的显式undefined时，返回正确索引
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfUndefinedAtEndTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test053_IndexOfUndefinedAtEnd();
      expect(result).assertEqual("Test Passed: IndexOfUndefinedAtEndTest053");
    });

    /**
     * @tc.name   IndexOfSetInstanceTest054
     * @tc.number SUB_ARRAY_INDEXOF_TEST_054
     * @tc.desc   验证indexOf检测Set实例时，同一实例返回索引，不同实例（同元素）返回-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfSetInstanceTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test054_IndexOfSetInstance();
      expect(result).assertEqual("Test Passed: IndexOfSetInstanceTest054");
    });

    /**
     * @tc.name   IndexOfEmptyArrayLikeTest055
     * @tc.number SUB_ARRAY_INDEXOF_TEST_055
     * @tc.desc   验证空类数组（length=0）调用indexOf时，任何目标均返回-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfEmptyArrayLikeTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test055_IndexOfEmptyArrayLike();
      expect(result).assertEqual("Test Passed: IndexOfEmptyArrayLikeTest055");
    });

    /**
     * @tc.name   IndexOfFromIndexStringDecimalTest056
     * @tc.number SUB_ARRAY_INDEXOF_TEST_056
     * @tc.desc   验证indexOf的fromIndex为带小数的字符串数字时，转为整数后返回正确索引
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfFromIndexStringDecimalTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test056_IndexOfFromIndexStringDecimal();
      expect(result).assertEqual("Test Passed: IndexOfFromIndexStringDecimalTest056");
    });

    /**
     * @tc.name   IndexOfSubstringTest057
     * @tc.number SUB_ARRAY_INDEXOF_TEST_057
     * @tc.desc   验证indexOf检测数组元素的子字符串时，因非完整元素返回-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfSubstringTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test057_IndexOfSubstring();
      expect(result).assertEqual("Test Passed: IndexOfSubstringTest057");
    });

    /**
     * @tc.name   IndexOfFromIndexNegativeDecimalSmallTest058
     * @tc.number SUB_ARRAY_INDEXOF_TEST_058
     * @tc.desc   验证indexOf的fromIndex为-1.3（小负小数）时，向下取整为-2后返回正确索引
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfFromIndexNegativeDecimalSmallTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test058_IndexOfFromIndexNegativeDecimalSmall();
      expect(result).assertEqual("Test Passed: IndexOfFromIndexNegativeDecimalSmallTest058");
    });

    /**
     * @tc.name   IndexOfArrowVsNormalFuncTest059
     * @tc.number SUB_ARRAY_INDEXOF_TEST_059
     * @tc.desc   验证indexOf检测箭头函数与普通函数时，因类型不同返回-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfArrowVsNormalFuncTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test059_IndexOfArrowVsNormalFunc();
      expect(result).assertEqual("Test Passed: IndexOfArrowVsNormalFuncTest059");
    });

    /**
     * @tc.name   IndexOfArrayLikeWithNaNTes060
     * @tc.number SUB_ARRAY_INDEXOF_TEST_060
     * @tc.desc   验证类数组含NaN时，indexOf检测NaN返回-1（与数组逻辑一致，对比includes）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfArrayLikeWithNaNTes060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test060_IndexOfArrayLikeWithNaN();
      expect(result).assertEqual("Test Passed: IndexOfArrayLikeWithNaNTes060");
    });

    /**
     * @tc.name   IndexOfFromIndexInfinityTest061
     * @tc.number SUB_ARRAY_INDEXOF_TEST_061
     * @tc.desc   验证indexOf的fromIndex为Infinity时，远超数组长度返回-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfFromIndexInfinityTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test061_IndexOfFromIndexInfinity();
      expect(result).assertEqual("Test Passed: IndexOfFromIndexInfinityTest061");
    });

    /**
     * @tc.name   IndexOfArraySymbolIteratorTest062
     * @tc.number SUB_ARRAY_INDEXOF_TEST_062
     * @tc.desc   验证indexOf检测数组的Symbol.iterator属性（非元素）时返回-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfArraySymbolIteratorTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test062_IndexOfArraySymbolIterator();
      expect(result).assertEqual("Test Passed: IndexOfArraySymbolIteratorTest062");
    });

    /**
     * @tc.name   IndexOfMultipleSameDateTest063
     * @tc.number SUB_ARRAY_INDEXOF_TEST_063
     * @tc.desc   验证indexOf检测数组中多个相同引用的Date实例时，返回首次出现的索引
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfMultipleSameDateTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test063_IndexOfMultipleSameDate();
      expect(result).assertEqual("Test Passed: IndexOfMultipleSameDateTest063");
    });

    /**
     * @tc.name   IndexOfArrayLikeWithExplicitUndefinedTest064
     * @tc.number SUB_ARRAY_INDEXOF_TEST_064
     * @tc.desc   验证类数组含显式undefined时，indexOf返回其首次出现的索引
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfArrayLikeWithExplicitUndefinedTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test064_IndexOfArrayLikeWithExplicitUndefined();
      expect(result).assertEqual("Test Passed: IndexOfArrayLikeWithExplicitUndefinedTest064");
    });

    /**
     * @tc.name   IndexOfFromIndexStringNegativeNumTest065
     * @tc.number SUB_ARRAY_INDEXOF_TEST_065
     * @tc.desc   验证indexOf的fromIndex为字符串负数字（如"-2"）时，转为负数后返回正确索引
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfFromIndexStringNegativeNumTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test065_IndexOfFromIndexStringNegativeNum();
      expect(result).assertEqual("Test Passed: IndexOfFromIndexStringNegativeNumTest065");
    });

    /**
     * @tc.name   IndexOfEmptyObjectTest066
     * @tc.number SUB_ARRAY_INDEXOF_TEST_066
     * @tc.desc   验证indexOf检测空对象时，同一实例返回索引，不同实例返回-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfEmptyObjectTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test066_IndexOfEmptyObject();
      expect(result).assertEqual("Test Passed: IndexOfEmptyObjectTest066");
    });

    /**
     * @tc.name   IndexOfArrayLikeLengthOneTest067
     * @tc.number SUB_ARRAY_INDEXOF_TEST_067
     * @tc.desc   验证长度为1的类数组调用indexOf时，检测唯一元素返回0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfArrayLikeLengthOneTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test067_IndexOfArrayLikeLengthOne();
      expect(result).assertEqual("Test Passed: IndexOfArrayLikeLengthOneTest067");
    });

    /**
     * @tc.name   IndexOfFromIndexNegativeLengthTest068
     * @tc.number SUB_ARRAY_INDEXOF_TEST_068
     * @tc.desc   验证indexOf的fromIndex为-array.length时，转为0后返回首次匹配的索引
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfFromIndexNegativeLengthTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test068_IndexOfFromIndexNegativeLength();
      expect(result).assertEqual("Test Passed: IndexOfFromIndexNegativeLengthTest068");
    });

    /**
     * @tc.name   IndexOfNumberExtremesTest069
     * @tc.number SUB_ARRAY_INDEXOF_TEST_069
     * @tc.desc   验证indexOf检测Number.MAX_VALUE和Number.MIN_VALUE时，返回正确索引
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfNumberExtremesTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test069_IndexOfNumberExtremes();
      expect(result).assertEqual("Test Passed: IndexOfNumberExtremesTest069");
    });

    /**
     * @tc.name   IndexOfComprehensiveMixedTest070
     * @tc.number SUB_ARRAY_INDEXOF_TEST_070
     * @tc.desc   综合验证indexOf对类数组、引用类型、负小数fromIndex的处理逻辑
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfComprehensiveMixedTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test070_IndexOfComprehensiveMixed();
      expect(result).assertEqual("Test Passed: IndexOfComprehensiveMixedTest070");
    });

    /**
     * @tc.name   IndexOfFromIndexNullTest071
     * @tc.number SUB_ARRAY_INDEXOF_TEST_071
     * @tc.desc   验证indexOf的fromIndex为null时，转为0后返回首次匹配的索引
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfFromIndexNullTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test071_IndexOfFromIndexNull();
      expect(result).assertEqual("Test Passed: IndexOfFromIndexNullTest071");
    });

    /**
     * @tc.name   IndexOfArrayWithNonEnumerablePropTest072
     * @tc.number SUB_ARRAY_INDEXOF_TEST_072
     * @tc.desc   验证indexOf忽略数组实例的不可枚举属性，仅检测索引元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfArrayWithNonEnumerablePropTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test072_IndexOfArrayWithNonEnumerableProp();
      expect(result).assertEqual("Test Passed: IndexOfArrayWithNonEnumerablePropTest072");
    });

    /**
     * @tc.name   IndexOfDeepNestedArrayTest073
     * @tc.number SUB_ARRAY_INDEXOF_TEST_073
     * @tc.desc   验证indexOf检测多层嵌套数组时，同一内层引用返回索引，不同引用返回-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfDeepNestedArrayTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test073_IndexOfDeepNestedArray();
      expect(result).assertEqual("Test Passed: IndexOfDeepNestedArrayTest073");
    });

    /**
     * @tc.name   IndexOfFromIndexUndefinedTest074
     * @tc.number SUB_ARRAY_INDEXOF_TEST_074
     * @tc.desc   验证indexOf的fromIndex为undefined时，转为0后返回首次匹配的索引
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfFromIndexUndefinedTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test074_IndexOfFromIndexUndefined();
      expect(result).assertEqual("Test Passed: IndexOfFromIndexUndefinedTest074");
    });

    /**
     * @tc.name   IndexOfStringWithEscapeCharTest075
     * @tc.number SUB_ARRAY_INDEXOF_TEST_075
     * @tc.desc   验证indexOf检测含转义字符的字符串时，严格匹配转义字符，返回正确索引
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfStringWithEscapeCharTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test075_IndexOfStringWithEscapeChar();
      expect(result).assertEqual("Test Passed: IndexOfStringWithEscapeCharTest075");
    });

    /**
     * @tc.name   IndexOfArrowFuncBindTest076
     * @tc.number SUB_ARRAY_INDEXOF_TEST_076
     * @tc.desc   验证indexOf检测箭头函数bind后的实例时，因新引用返回-1，原函数返回索引
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfArrowFuncBindTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test076_IndexOfArrowFuncBind();
      expect(result).assertEqual("Test Passed: IndexOfArrowFuncBindTest076");
    });

    /**
     * @tc.name   IndexOfArrayLikeStringLengthTest077
     * @tc.number SUB_ARRAY_INDEXOF_TEST_077
     * @tc.desc   验证类数组length为字符串时，ToUint32转为数字后，indexOf检测有效元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfArrayLikeStringLengthTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test077_IndexOfArrayLikeStringLength();
      expect(result).assertEqual("Test Passed: IndexOfArrayLikeStringLengthTest077");
    });

    /**
     * @tc.name   IndexOfSharedSymbolTest078
     * @tc.number SUB_ARRAY_INDEXOF_TEST_078
     * @tc.desc   验证indexOf检测Symbol.for创建的共享Symbol时，同一key返回索引，不同key返回-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfSharedSymbolTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test078_IndexOfSharedSymbol();
      expect(result).assertEqual("Test Passed: IndexOfSharedSymbolTest078");
    });

    /**
     * @tc.name   IndexOfFromIndexExtremeNegativeTest079
     * @tc.number SUB_ARRAY_INDEXOF_TEST_079
     * @tc.desc   验证indexOf的fromIndex为极大负数时，转为0后返回首次匹配的索引
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfFromIndexExtremeNegativeTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test079_IndexOfFromIndexExtremeNegative();
      expect(result).assertEqual("Test Passed: IndexOfFromIndexExtremeNegativeTest079");
    });

    /**
     * @tc.name   IndexOfDateModifyTimeTest080
     * @tc.number SUB_ARRAY_INDEXOF_TEST_080
     * @tc.desc   验证indexOf检测修改时间后的Date实例时，因引用不变仍返回原索引
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfDateModifyTimeTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test080_IndexOfDateModifyTime();
      expect(result).assertEqual("Test Passed: IndexOfDateModifyTimeTest080");
    });

    /**
     * @tc.name   IndexOfArrayLikeDiscontinuousKeysTest081
     * @tc.number SUB_ARRAY_INDEXOF_TEST_081
     * @tc.desc   验证indexOf处理索引不连续的类数组时，跳过空槽检测有效元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfArrayLikeDiscontinuousKeysTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test081_IndexOfArrayLikeDiscontinuousKeys();
      expect(result).assertEqual("Test Passed: IndexOfArrayLikeDiscontinuousKeysTest081");
    });

    /**
     * @tc.name   IndexOfFromIndexStringZeroTest082
     * @tc.number SUB_ARRAY_INDEXOF_TEST_082
     * @tc.desc   验证indexOf的fromIndex为字符串"0"时，转为0后返回正确索引
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfFromIndexStringZeroTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test082_IndexOfFromIndexStringZero();
      expect(result).assertEqual("Test Passed: IndexOfFromIndexStringZeroTest082");
    });

    /**
     * @tc.name   IndexOfDuplicateBigIntTest083
     * @tc.number SUB_ARRAY_INDEXOF_TEST_083
     * @tc.desc   验证indexOf检测含重复BigInt的数组时，返回首次出现的BigInt索引
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfDuplicateBigIntTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test083_IndexOfDuplicateBigInt();
      expect(result).assertEqual("Test Passed: IndexOfDuplicateBigIntTest083");
    });

    /**
     * @tc.name   IndexOfFromIndexTrueLengthOneTest084
     * @tc.number SUB_ARRAY_INDEXOF_TEST_084
     * @tc.desc   验证indexOf的fromIndex为true且数组长度1时，转为1超出长度返回-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfFromIndexTrueLengthOneTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test084_IndexOfFromIndexTrueLengthOne();
      expect(result).assertEqual("Test Passed: IndexOfFromIndexTrueLengthOneTest084");
    });

    /**
     * @tc.name   IndexOfEmptyStrVsUndefinedStrTest085
     * @tc.number SUB_ARRAY_INDEXOF_TEST_085
     * @tc.desc   验证indexOf严格区分空字符串与"undefined"字符串，返回对应索引
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfEmptyStrVsUndefinedStrTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test085_IndexOfEmptyStrVsUndefinedStr();
      expect(result).assertEqual("Test Passed: IndexOfEmptyStrVsUndefinedStrTest085");
    });

    /**
     * @tc.name   IndexOfArrayLikeWithUndefinedAndSlotTest086
     * @tc.number SUB_ARRAY_INDEXOF_TEST_086
     * @tc.desc   验证indexOf处理含显式undefined和空槽的类数组时，仅检测显式undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfArrayLikeWithUndefinedAndSlotTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test086_IndexOfArrayLikeWithUndefinedAndSlot();
      expect(result).assertEqual("Test Passed: IndexOfArrayLikeWithUndefinedAndSlotTest086");
    });

    /**
     * @tc.name   IndexOfRegExpModifyFlagsTest087
     * @tc.number SUB_ARRAY_INDEXOF_TEST_087
     * @tc.desc   验证indexOf检测修改flags后的RegExp实例时，因引用不变仍返回原索引
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfRegExpModifyFlagsTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test087_IndexOfRegExpModifyFlags();
      expect(result).assertEqual("Test Passed: IndexOfRegExpModifyFlagsTest087");
    });

    /**
     * @tc.name   IndexOfEmptyArrayFromIndexNaNTes088
     * @tc.number SUB_ARRAY_INDEXOF_TEST_088
     * @tc.desc   验证空数组fromIndex为NaN时，转为0但无元素，返回-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfEmptyArrayFromIndexNaNTes088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test088_IndexOfEmptyArrayFromIndexNaN();
      expect(result).assertEqual("Test Passed: IndexOfEmptyArrayFromIndexNaNTes088");
    });

    /**
     * @tc.name   IndexOfDuplicateRegExpTest089
     * @tc.number SUB_ARRAY_INDEXOF_TEST_089
     * @tc.desc   验证indexOf检测含多个相同引用RegExp的数组时，返回首次出现的索引
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfDuplicateRegExpTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test089_IndexOfDuplicateRegExp();
      expect(result).assertEqual("Test Passed: IndexOfDuplicateRegExpTest089");
    });

    /**
     * @tc.name   IndexOfComprehensiveComplexTest090
     * @tc.number SUB_ARRAY_INDEXOF_TEST_090
     * @tc.desc   综合验证indexOf对不可枚举属性、嵌套数组、转义字符字符串的处理逻辑
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfComprehensiveComplexTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test090_IndexOfComprehensiveComplex();
      expect(result).assertEqual("Test Passed: IndexOfComprehensiveComplexTest090");
    });

    /**
     * @tc.name   IndexOfFromIndexNonIntNegStringTest091
     * @tc.number SUB_ARRAY_INDEXOF_TEST_091
     * @tc.desc   验证indexOf的fromIndex为非整数负数字符串时，先转数字再向下取整，返回正确索引
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfFromIndexNonIntNegStringTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test091_IndexOfFromIndexNonIntNegString();
      expect(result).assertEqual("Test Passed: IndexOfFromIndexNonIntNegStringTest091");
    });

    /**
     * @tc.name   IndexOfBufferOrUint8ArrayTest092
     * @tc.number SUB_ARRAY_INDEXOF_TEST_092
     * @tc.desc   验证跨环境下indexOf检测Buffer（Node.js）/Uint8Array（浏览器）时，同一实例返回索引
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfBufferOrUint8ArrayTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test092_IndexOfBufferOrUint8Array();
      expect(result).assertEqual("Test Passed: IndexOfBufferOrUint8ArrayTest092");
    });

    /**
     * @tc.name   IndexOfFromIndexHalfLengthTest093
     * @tc.number SUB_ARRAY_INDEXOF_TEST_093
     * @tc.desc   验证indexOf的fromIndex为数组长度一半（非整数）时，向下取整后返回正确索引
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfFromIndexHalfLengthTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test093_IndexOfFromIndexHalfLength();
      expect(result).assertEqual("Test Passed: IndexOfFromIndexHalfLengthTest093");
    });

    /**
     * @tc.name   IndexOfUnicodeEmojiTest094
     * @tc.number SUB_ARRAY_INDEXOF_TEST_094
     * @tc.desc   验证indexOf检测Unicode表情字符时，按编码严格匹配，不同编码返回-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfUnicodeEmojiTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test094_IndexOfUnicodeEmoji();
      expect(result).assertEqual("Test Passed: IndexOfUnicodeEmojiTest094");
    });

    /**
     * @tc.name   IndexOfArrayLikeZeroLengthWithPropsTest095
     * @tc.number SUB_ARRAY_INDEXOF_TEST_095
     * @tc.desc   验证类数组length=0时，即使含索引属性，indexOf任何目标均返回-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfArrayLikeZeroLengthWithPropsTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test095_IndexOfArrayLikeZeroLengthWithProps();
      expect(result).assertEqual("Test Passed: IndexOfArrayLikeZeroLengthWithPropsTest095");
    });

    /**
     * @tc.name   IndexOfEmptyArrayFromIndexNullTest096
     * @tc.number SUB_ARRAY_INDEXOF_TEST_096
     * @tc.desc   验证空数组fromIndex为null时，转为0但无元素，返回-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfEmptyArrayFromIndexNullTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test096_IndexOfEmptyArrayFromIndexNull();
      expect(result).assertEqual("Test Passed: IndexOfEmptyArrayFromIndexNullTest096");
    });

    /**
     * @tc.name   IndexOfSameNameDiffParamFuncTest097
     * @tc.number SUB_ARRAY_INDEXOF_TEST_097
     * @tc.desc   验证indexOf检测同名不同参数的函数时，因引用不同返回-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfSameNameDiffParamFuncTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test097_IndexOfSameNameDiffParamFunc();
      expect(result).assertEqual("Test Passed: IndexOfSameNameDiffParamFuncTest097");
    });


    /**
     * @tc.name   IndexOfFromIndexInfinityNonEmptyTest099
     * @tc.number SUB_ARRAY_INDEXOF_TEST_099
     * @tc.desc   验证非空数组fromIndex为Infinity时，远超长度返回-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfFromIndexInfinityNonEmptyTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test099_IndexOfFromIndexInfinityNonEmpty();
      expect(result).assertEqual("Test Passed: IndexOfFromIndexInfinityNonEmptyTest099");
    });

    /**
     * @tc.name   IndexOfNaNVsStringNaNTest100
     * @tc.number SUB_ARRAY_INDEXOF_TEST_100
     * @tc.desc   验证indexOf严格区分NaN（数字）与"NaN"（字符串），返回对应索引或-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfNaNVsStringNaNTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test100_IndexOfNaNVsStringNaN();
      expect(result).assertEqual("Test Passed: IndexOfNaNVsStringNaNTest100");
    });

    /**
     * @tc.name   IndexOfFromIndexStringNegativeZeroTest101
     * @tc.number SUB_ARRAY_INDEXOF_TEST_101
     * @tc.desc   验证indexOf的fromIndex为字符串"-0"时，转为-0→0，返回正确索引
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfFromIndexStringNegativeZeroTest101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test101_IndexOfFromIndexStringNegativeZero();
      expect(result).assertEqual("Test Passed: IndexOfFromIndexStringNegativeZeroTest101");
    });

    /**
     * @tc.name   IndexOfArrayLikeLargeLengthTest102
     * @tc.number SUB_ARRAY_INDEXOF_TEST_102
     * @tc.desc   验证类数组length为极大值时，indexOf仍能正确检测存在元素，不存在返回-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfArrayLikeLargeLengthTest102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test102_IndexOfArrayLikeLargeLength();
      expect(result).assertEqual("Test Passed: IndexOfArrayLikeLargeLengthTest102");
    });

    /**
     * @tc.name   IndexOfSameTimeDiffDateTest103
     * @tc.number SUB_ARRAY_INDEXOF_TEST_103
     * @tc.desc   验证indexOf检测时间相同但实例不同的Date时，因引用不同返回-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfSameTimeDiffDateTest103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test103_IndexOfSameTimeDiffDate();
      expect(result).assertEqual("Test Passed: IndexOfSameTimeDiffDateTest103");
    });

    /**
     * @tc.name   IndexOfFromIndexStringNaNTes104
     * @tc.number SUB_ARRAY_INDEXOF_TEST_104
     * @tc.desc   验证indexOf的fromIndex为字符串"NaN"时，转为NaN→0，返回正确索引
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfFromIndexStringNaNTes104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test104_IndexOfFromIndexStringNaN();
      expect(result).assertEqual("Test Passed: IndexOfFromIndexStringNaNTes104");
    });

    /**
     * @tc.name   IndexOfArrayLikeLengthOneUndefinedTest105
     * @tc.number SUB_ARRAY_INDEXOF_TEST_105
     * @tc.desc   验证类数组length=1且含显式undefined时，indexOf检测undefined返回0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfArrayLikeLengthOneUndefinedTest105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test105_IndexOfArrayLikeLengthOneUndefined();
      expect(result).assertEqual("Test Passed: IndexOfArrayLikeLengthOneUndefinedTest105");
    });

    /**
     * @tc.name   IndexOfSetAfterAddTest106
     * @tc.number SUB_ARRAY_INDEXOF_TEST_106
     * @tc.desc   验证indexOf检测添加元素后的Set实例时，因引用不变返回原索引
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfSetAfterAddTest106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test106_IndexOfSetAfterAdd();
      expect(result).assertEqual("Test Passed: IndexOfSetAfterAddTest106");
    });

    /**
     * @tc.name   IndexOfFromIndexLengthPlusOneTest107
     * @tc.number SUB_ARRAY_INDEXOF_TEST_107
     * @tc.desc   验证indexOf的fromIndex为array.length+1时，超出范围返回-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfFromIndexLengthPlusOneTest107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test107_IndexOfFromIndexLengthPlusOne();
      expect(result).assertEqual("Test Passed: IndexOfFromIndexLengthPlusOneTest107");
    });

    /**
     * @tc.name   IndexOfArrayLikeWithNonIntKeysTest108
     * @tc.number SUB_ARRAY_INDEXOF_TEST_108
     * @tc.desc   验证indexOf处理含非整数索引的类数组时，忽略非整数索引，仅检测整数索引
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfArrayLikeWithNonIntKeysTest108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test108_IndexOfArrayLikeWithNonIntKeys();
      expect(result).assertEqual("Test Passed: IndexOfArrayLikeWithNonIntKeysTest108");
    });

    /**
     * @tc.name   IndexOfSameKeyDiffSymbolTest109
     * @tc.number SUB_ARRAY_INDEXOF_TEST_109
     * @tc.desc   验证indexOf检测Symbol.keyFor相同但实例不同的Symbol时，因引用不同返回-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IndexOfSameKeyDiffSymbolTest109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await ArrayIndexOfTestUtils.test109_IndexOfSameKeyDiffSymbol();
      expect(result).assertEqual("Test Passed: IndexOfSameKeyDiffSymbolTest109");
    });


  })
}