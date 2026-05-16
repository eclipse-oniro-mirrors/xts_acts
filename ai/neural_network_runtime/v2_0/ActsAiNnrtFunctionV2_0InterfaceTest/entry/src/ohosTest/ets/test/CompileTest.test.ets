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

import testNapi from 'libnnrt_function_v2_0_interface_test.so';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';

export default function CompileTest() {
  describe('CompileTest', () => {
    beforeAll(() => {
      console.info('CompileTest: beforeAll called');
    });

    afterAll(() => {
      console.info('CompileTest: afterAll called');
    });

    beforeEach(() => {
      console.info('CompileTest: beforeEach called');
    });

    afterEach(() => {
      console.info('CompileTest: afterEach called');
    });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Compilation_Create_0100
   * @tc.number SUB_AI_NNRt_Func_North_Compilation_Create_0100
   * @tc.desc   Test OH_NNCompilation_Construct with null model
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Compilation_Create_0100', Level.LEVEL2, () => {
    let result = testNapi.nnrtCompileTest(0);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Compilation_Create_0200
   * @tc.number SUB_AI_NNRt_Func_North_Compilation_Create_0200
   * @tc.desc   Test OH_NNCompilation_Construct with valid model
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Compilation_Create_0200', Level.LEVEL2, () => {
    let result = testNapi.nnrtCompileTest(1);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Compilation_Create_0300
   * @tc.number SUB_AI_NNRt_Func_North_Compilation_Create_0300
   * @tc.desc   Test OH_NNCompilation_Construct with unfinished model
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Compilation_Create_0300', Level.LEVEL2, () => {
    let result = testNapi.nnrtCompileTest(2);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetDevice_0100
   * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetDevice_0100
   * @tc.desc   Test OH_NNCompilation_SetDevice with null compilation
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Compilation_SetDevice_0100', Level.LEVEL2, () => {
    let result = testNapi.nnrtCompileTest(3);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetDevice_0200
   * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetDevice_0200
   * @tc.desc   Test OH_NNCompilation_SetDevice with invalid device ID
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Compilation_SetDevice_0200', Level.LEVEL2, () => {
    let result = testNapi.nnrtCompileTest(4);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetDevice_0300
   * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetDevice_0300
   * @tc.desc   Test OH_NNCompilation_SetDevice with valid parameters
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Compilation_SetDevice_0300', Level.LEVEL2, () => {
    let result = testNapi.nnrtCompileTest(5);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetCache_0100
   * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetCache_0100
   * @tc.desc   Test OH_NNCompilation_SetCache with null compilation
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Compilation_SetCache_0100', Level.LEVEL2, () => {
    let result = testNapi.nnrtCompileTest(6);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetCache_0200
   * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetCache_0200
   * @tc.desc   Test OH_NNCompilation_SetCache with null cachePath
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Compilation_SetCache_0200', Level.LEVEL2, () => {
    let result = testNapi.nnrtCompileTest(7);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetCache_0300
   * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetCache_0300
   * @tc.desc   Test OH_NNCompilation_SetCache with invalid version
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Compilation_SetCache_0300', Level.LEVEL2, () => {
    let result = testNapi.nnrtCompileTest(8);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetCache_0400
   * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetCache_0400
   * @tc.desc   Test OH_NNCompilation_SetCache with empty cachePath
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Compilation_SetCache_0400', Level.LEVEL2, () => {
    let result = testNapi.nnrtCompileTest(9);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetCache_0500
   * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetCache_0500
   * @tc.desc   Test OH_NNCompilation_SetCache with valid cachePath
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Compilation_SetCache_0500', Level.LEVEL2, () => {
    let result = testNapi.nnrtCompileTest(10);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetCache_0600
   * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetCache_0600
   * @tc.desc   Test OH_NNCompilation_SetCache with non-existent cachePath
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Compilation_SetCache_0600', Level.LEVEL2, () => {
    let result = testNapi.nnrtCompileTest(11);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetCache_0700
   * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetCache_0700
   * @tc.desc   Test OH_NNCompilation_SetCache with read-only cachePath
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Compilation_SetCache_0700', Level.LEVEL2, () => {
    let result = testNapi.nnrtCompileTest(12);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetCache_0800
   * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetCache_0800
   * @tc.desc   Test OH_NNCompilation_SetCache multiple times
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Compilation_SetCache_0800', Level.LEVEL2, () => {
    let result = testNapi.nnrtCompileTest(13);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0100
   * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0100
   * @tc.desc   Test OH_NNCompilation_SetPerformanceMode with null compilation
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0100', Level.LEVEL2, () => {
    let result = testNapi.nnrtCompileTest(14);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_Mock_0200
   * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_Mock_0200
   * @tc.desc   Test OH_NNCompilation_SetPerformanceMode with mock mode
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_Mock_0200', Level.LEVEL2, () => {
    let result = testNapi.nnrtCompileTest(15);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0300
   * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0300
   * @tc.desc   Test OH_NNCompilation_SetPerformanceMode with invalid mode
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0300', Level.LEVEL2, () => {
    let result = testNapi.nnrtCompileTest(16);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0400
   * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0400
   * @tc.desc   Test OH_NNCompilation_SetPerformanceMode with NONE mode
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0400', Level.LEVEL2, () => {
    let result = testNapi.nnrtCompileTest(17);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0500
   * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0500
   * @tc.desc   Test OH_NNCompilation_SetPerformanceMode with LOW mode
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0500', Level.LEVEL2, () => {
    let result = testNapi.nnrtCompileTest(18);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0600
   * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0600
   * @tc.desc   Test OH_NNCompilation_SetPerformanceMode with MEDIUM mode
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0600', Level.LEVEL2, () => {
    let result = testNapi.nnrtCompileTest(19);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0700
   * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0700
   * @tc.desc   Test OH_NNCompilation_SetPerformanceMode with HIGH mode
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0700', Level.LEVEL2, () => {
    let result = testNapi.nnrtCompileTest(20);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0800
   * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0800
   * @tc.desc   Test OH_NNCompilation_SetPerformanceMode with EXTREME mode
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0800', Level.LEVEL2, () => {
    let result = testNapi.nnrtCompileTest(21);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0900
   * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0900
   * @tc.desc   Test OH_NNCompilation_SetPerformanceMode multiple times
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0900', Level.LEVEL2, () => {
    let result = testNapi.nnrtCompileTest(22);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetPriority_0100
   * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetPriority_0100
   * @tc.desc   Test OH_NNCompilation_SetPriority with null compilation
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Compilation_SetPriority_0100', Level.LEVEL2, () => {
    let result = testNapi.nnrtCompileTest(23);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetPriority_0200
   * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetPriority_0200
   * @tc.desc   Test OH_NNCompilation_SetPriority with invalid priority
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Compilation_SetPriority_0200', Level.LEVEL2, () => {
    let result = testNapi.nnrtCompileTest(24);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetPriority_0300
   * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetPriority_0300
   * @tc.desc   Test OH_NNCompilation_SetPriority with NONE priority
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Compilation_SetPriority_0300', Level.LEVEL2, () => {
    let result = testNapi.nnrtCompileTest(25);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetPriority_0400
   * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetPriority_0400
   * @tc.desc   Test OH_NNCompilation_SetPriority with LOW priority
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Compilation_SetPriority_0400', Level.LEVEL2, () => {
    let result = testNapi.nnrtCompileTest(26);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetPriority_0500
   * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetPriority_0500
   * @tc.desc   Test OH_NNCompilation_SetPriority with MEDIUM priority
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Compilation_SetPriority_0500', Level.LEVEL2, () => {
    let result = testNapi.nnrtCompileTest(27);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetPriority_0600
   * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetPriority_0600
   * @tc.desc   Test OH_NNCompilation_SetPriority with HIGH priority
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Compilation_SetPriority_0600', Level.LEVEL2, () => {
    let result = testNapi.nnrtCompileTest(28);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetPriority_0700
   * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetPriority_0700
   * @tc.desc   Test OH_NNCompilation_SetPriority with valid priority
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Compilation_SetPriority_0700', Level.LEVEL2, () => {
    let result = testNapi.nnrtCompileTest(29);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetPriority_0800
   * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetPriority_0800
   * @tc.desc   Test OH_NNCompilation_SetPriority multiple times
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Compilation_SetPriority_0800', Level.LEVEL2, () => {
    let result = testNapi.nnrtCompileTest(30);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Compilation_EnableFloat16_0100
   * @tc.number SUB_AI_NNRt_Func_North_Compilation_EnableFloat16_0100
   * @tc.desc   Test OH_NNCompilation_EnableFloat16 with null compilation
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Compilation_EnableFloat16_0100', Level.LEVEL2, () => {
    let result = testNapi.nnrtCompileTest(31);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Compilation_EnableFloat16_0200
   * @tc.number SUB_AI_NNRt_Func_North_Compilation_EnableFloat16_0200
   * @tc.desc   Test OH_NNCompilation_EnableFloat16 with enable=true
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Compilation_EnableFloat16_0200', Level.LEVEL2, () => {
    let result = testNapi.nnrtCompileTest(32);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Compilation_EnableFloat16_0300
   * @tc.number SUB_AI_NNRt_Func_North_Compilation_EnableFloat16_0300
   * @tc.desc   Test OH_NNCompilation_EnableFloat16 with enable=false
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Compilation_EnableFloat16_0300', Level.LEVEL2, () => {
    let result = testNapi.nnrtCompileTest(33);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Compilation_EnableFloat16_0400
   * @tc.number SUB_AI_NNRt_Func_North_Compilation_EnableFloat16_0400
   * @tc.desc   Test OH_NNCompilation_EnableFloat16 multiple times
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Compilation_EnableFloat16_0400', Level.LEVEL2, () => {
    let result = testNapi.nnrtCompileTest(34);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Compilation_Build_0100
   * @tc.number SUB_AI_NNRt_Func_North_Compilation_Build_0100
   * @tc.desc   Test OH_NNCompilation_Build with null compilation
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Compilation_Build_0100', Level.LEVEL2, () => {
    let result = testNapi.nnrtCompileTest(35);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Compilation_Build_0200
   * @tc.number SUB_AI_NNRt_Func_North_Compilation_Build_0200
   * @tc.desc   Test OH_NNCompilation_Build with valid compilation
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Compilation_Build_0200', Level.LEVEL2, () => {
    let result = testNapi.nnrtCompileTest(36);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Compilation_Destroy_0100
   * @tc.number SUB_AI_NNRt_Func_North_Compilation_Destroy_0100
   * @tc.desc   Test OH_NNCompilation_Destroy with null compilation
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Compilation_Destroy_0100', Level.LEVEL2, () => {
    let result = testNapi.nnrtCompileTest(37);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Compilation_Destroy_0200
   * @tc.number SUB_AI_NNRt_Func_North_Compilation_Destroy_0200
   * @tc.desc   Test OH_NNCompilation_Destroy with valid compilation
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Compilation_Destroy_0200', Level.LEVEL2, () => {
    let result = testNapi.nnrtCompileTest(38);
    expect(result).assertEqual(0);
  });

  });
}
