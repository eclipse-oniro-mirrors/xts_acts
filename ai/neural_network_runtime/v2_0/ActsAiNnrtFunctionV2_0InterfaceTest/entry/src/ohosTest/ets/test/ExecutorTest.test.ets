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

export default function ExecutorTest() {
  describe('ExecutorTest', () => {
    beforeAll(() => {
      console.info('ExecutorTest: beforeAll called');
    });

    afterAll(() => {
      console.info('ExecutorTest: afterAll called');
    });

    beforeEach(() => {
      console.info('ExecutorTest: beforeEach called');
    });

    afterEach(() => {
      console.info('ExecutorTest: afterEach called');
    });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Executor_Create_0100
   * @tc.number SUB_AI_NNRt_Func_North_Executor_Create_0100
   * @tc.desc   Test OH_NNExecutor_Construct with null compilation
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Executor_Create_0100', Level.LEVEL2, () => {
    let result = testNapi.nnrtExecutorTest(0);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Executor_Create_0200
   * @tc.number SUB_AI_NNRt_Func_North_Executor_Create_0200
   * @tc.desc   Test OH_NNExecutor_Construct with valid compilation
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Executor_Create_0200', Level.LEVEL2, () => {
    let result = testNapi.nnrtExecutorTest(1);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Executor_SetInput_0100
   * @tc.number SUB_AI_NNRt_Func_North_Executor_SetInput_0100
   * @tc.desc   Test OH_NNExecutor_SetInput with null executor
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Executor_SetInput_0100', Level.LEVEL2, () => {
    let result = testNapi.nnrtExecutorTest(2);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Executor_SetInput_0200
   * @tc.number SUB_AI_NNRt_Func_North_Executor_SetInput_0200
   * @tc.desc   Test OH_NNExecutor_SetInput with invalid input index
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Executor_SetInput_0200', Level.LEVEL2, () => {
    let result = testNapi.nnrtExecutorTest(3);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Executor_SetInput_0300
   * @tc.number SUB_AI_NNRt_Func_North_Executor_SetInput_0300
   * @tc.desc   Test OH_NNExecutor_SetInput with null tensor
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Executor_SetInput_0300', Level.LEVEL2, () => {
    let result = testNapi.nnrtExecutorTest(4);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Executor_SetInput_0400
   * @tc.number SUB_AI_NNRt_Func_North_Executor_SetInput_0400
   * @tc.desc   Test OH_NNExecutor_SetInput with null dataBuffer
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Executor_SetInput_0400', Level.LEVEL2, () => {
    let result = testNapi.nnrtExecutorTest(5);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Executor_SetInput_0500
   * @tc.number SUB_AI_NNRt_Func_North_Executor_SetInput_0500
   * @tc.desc   Test OH_NNExecutor_SetInput with invalid length
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Executor_SetInput_0500', Level.LEVEL2, () => {
    let result = testNapi.nnrtExecutorTest(6);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Executor_SetInput_0600
   * @tc.number SUB_AI_NNRt_Func_North_Executor_SetInput_0600
   * @tc.desc   Test OH_NNExecutor_SetInput with mismatched data type
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Executor_SetInput_0600', Level.LEVEL2, () => {
    let result = testNapi.nnrtExecutorTest(7);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Executor_SetInput_0700
   * @tc.number SUB_AI_NNRt_Func_North_Executor_SetInput_0700
   * @tc.desc   Test OH_NNExecutor_SetInput with valid parameters
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Executor_SetInput_0700', Level.LEVEL2, () => {
    let result = testNapi.nnrtExecutorTest(8);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Executor_SetOutput_0100
   * @tc.number SUB_AI_NNRt_Func_North_Executor_SetOutput_0100
   * @tc.desc   Test OH_NNExecutor_SetOutput with null executor
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Executor_SetOutput_0100', Level.LEVEL2, () => {
    let result = testNapi.nnrtExecutorTest(12);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Executor_SetOutput_0200
   * @tc.number SUB_AI_NNRt_Func_North_Executor_SetOutput_0200
   * @tc.desc   Test OH_NNExecutor_SetOutput with invalid output index
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Executor_SetOutput_0200', Level.LEVEL2, () => {
    let result = testNapi.nnrtExecutorTest(13);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Executor_SetOutput_0300
   * @tc.number SUB_AI_NNRt_Func_North_Executor_SetOutput_0300
   * @tc.desc   Test OH_NNExecutor_SetOutput with null dataBuffer
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Executor_SetOutput_0300', Level.LEVEL2, () => {
    let result = testNapi.nnrtExecutorTest(14);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Executor_SetOutput_0400
   * @tc.number SUB_AI_NNRt_Func_North_Executor_SetOutput_0400
   * @tc.desc   Test OH_NNExecutor_SetOutput with invalid length
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Executor_SetOutput_0400', Level.LEVEL2, () => {
    let result = testNapi.nnrtExecutorTest(15);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Executor_SetOutput_0500
   * @tc.number SUB_AI_NNRt_Func_North_Executor_SetOutput_0500
   * @tc.desc   Test OH_NNExecutor_SetOutput with valid parameters
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Executor_SetOutput_0500', Level.LEVEL2, () => {
    let result = testNapi.nnrtExecutorTest(16);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Executor_Run_0100
   * @tc.number SUB_AI_NNRt_Func_North_Executor_Run_0100
   * @tc.desc   Test OH_NNExecutor_Run with null executor
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Executor_Run_0100', Level.LEVEL2, () => {
    let result = testNapi.nnrtExecutorTest(17);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Executor_Run_0200
   * @tc.number SUB_AI_NNRt_Func_North_Executor_Run_0200
   * @tc.desc   Test OH_NNExecutor_Run without setting input
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Executor_Run_0200', Level.LEVEL2, () => {
    let result = testNapi.nnrtExecutorTest(18);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Executor_Run_0300
   * @tc.number SUB_AI_NNRt_Func_North_Executor_Run_0300
   * @tc.desc   Test OH_NNExecutor_Run without setting output
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Executor_Run_0300', Level.LEVEL2, () => {
    let result = testNapi.nnrtExecutorTest(19);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Executor_Run_0400
   * @tc.number SUB_AI_NNRt_Func_North_Executor_Run_0400
   * @tc.desc   Test OH_NNExecutor_Run with valid parameters
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Executor_Run_0400', Level.LEVEL2, () => {
    let result = testNapi.nnrtExecutorTest(20);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Executor_Run_0600
   * @tc.number SUB_AI_NNRt_Func_North_Executor_Run_0600
   * @tc.desc   Test OH_NNExecutor_Run multiple times
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Executor_Run_0600', Level.LEVEL2, () => {
    let result = testNapi.nnrtExecutorTest(22);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Executor_GetOutputDimensions_0100
   * @tc.number SUB_AI_NNRt_Func_North_Executor_GetOutputDimensions_0100
   * @tc.desc   Test OH_NNExecutor_GetOutputDimensions with valid parameters
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Executor_GetOutputDimensions_0100', Level.LEVEL2, () => {
    let result = testNapi.nnrtExecutorTest(24);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Executor_Destroy_0100
   * @tc.number SUB_AI_NNRt_Func_North_Executor_Destroy_0100
   * @tc.desc   Test OH_NNExecutor_Destroy with null executor
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Executor_Destroy_0100', Level.LEVEL2, () => {
    let result = testNapi.nnrtExecutorTest(25);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Executor_Destroy_0200
   * @tc.number SUB_AI_NNRt_Func_North_Executor_Destroy_0200
   * @tc.desc   Test OH_NNExecutor_Destroy with valid executor
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Executor_Destroy_0200', Level.LEVEL2, () => {
    let result = testNapi.nnrtExecutorTest(26);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNR_Func_North_Executor_Combine_0100
   * @tc.number SUB_AI_NNR_Func_North_Executor_Combine_0100
   * @tc.desc   Test combined executor operations scenario 1
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNR_Func_North_Executor_Combine_0100', Level.LEVEL2, () => {
    let result = testNapi.nnrtExecutorTest(27);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Executor_Combine_0200
   * @tc.number SUB_AI_NNRt_Func_North_Executor_Combine_0200
   * @tc.desc   Test combined executor operations scenario 2
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Executor_Combine_0200', Level.LEVEL2, () => {
    let result = testNapi.nnrtExecutorTest(28);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Executor_Combine_0300
   * @tc.number SUB_AI_NNRt_Func_North_Executor_Combine_0300
   * @tc.desc   Test combined executor operations scenario 3
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Executor_Combine_0300', Level.LEVEL2, () => {
    let result = testNapi.nnrtExecutorTest(29);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Executor_Combine_0400
   * @tc.number SUB_AI_NNRt_Func_North_Executor_Combine_0400
   * @tc.desc   Test combined executor operations scenario 4
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Executor_Combine_0400', Level.LEVEL2, () => {
    let result = testNapi.nnrtExecutorTest(30);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Executor_Combine_0500
   * @tc.number SUB_AI_NNRt_Func_North_Executor_Combine_0500
   * @tc.desc   Test combined executor operations scenario 5
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Executor_Combine_0500', Level.LEVEL2, () => {
    let result = testNapi.nnrtExecutorTest(31);
    expect(result).assertEqual(0);
  });

  });
}
