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

export default function MemoryTest() {
  describe('MemoryTest', () => {
    beforeAll(() => {
      console.info('MemoryTest: beforeAll called');
    });

    afterAll(() => {
      console.info('MemoryTest: afterAll called');
    });

    beforeEach(() => {
      console.info('MemoryTest: beforeEach called');
    });

    afterEach(() => {
      console.info('MemoryTest: afterEach called');
    });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Executor_Memory_CreateInputMemory_0100
   * @tc.number SUB_AI_NNRt_Func_North_Executor_Memory_CreateInputMemory_0100
   * @tc.desc   Test OH_NNExecutor_CreateInputMemory with null executor
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Executor_Memory_CreateInputMemory_0100', Level.LEVEL2, () => {
    let result = testNapi.nnrtMemoryTest(0);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Executor_Memory_CreateInputMemory_0200
   * @tc.number SUB_AI_NNRt_Func_North_Executor_Memory_CreateInputMemory_0200
   * @tc.desc   Test OH_NNExecutor_CreateInputMemory with invalid input index
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Executor_Memory_CreateInputMemory_0200', Level.LEVEL2, () => {
    let result = testNapi.nnrtMemoryTest(1);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Executor_Memory_CreateInputMemory_0300
   * @tc.number SUB_AI_NNRt_Func_North_Executor_Memory_CreateInputMemory_0300
   * @tc.desc   Test OH_NNExecutor_CreateInputMemory with null memory parameter
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Executor_Memory_CreateInputMemory_0300', Level.LEVEL2, () => {
    let result = testNapi.nnrtMemoryTest(2);
    expect(result).assertEqual(0);
  });

  // it('SUB_AI_NNRt_Func_North_Executor_Memory_CreateInputMemory_0400', Level.LEVEL2, () => {
  //   let result = testNapi.nnrtMemoryTest(3);
  //   expect(result).assertEqual(0);
  // });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Executor_Memory_CreateInputMemory_0500
   * @tc.number SUB_AI_NNRt_Func_North_Executor_Memory_CreateInputMemory_0500
   * @tc.desc   Test OH_NNExecutor_CreateInputMemory with valid parameters
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Executor_Memory_CreateInputMemory_0500', Level.LEVEL2, () => {
    let result = testNapi.nnrtMemoryTest(4);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Executor_Memory_CreateOutputMemory_0100
   * @tc.number SUB_AI_NNRt_Func_North_Executor_Memory_CreateOutputMemory_0100
   * @tc.desc   Test OH_NNExecutor_CreateOutputMemory with null executor
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Executor_Memory_CreateOutputMemory_0100', Level.LEVEL2, () => {
    let result = testNapi.nnrtMemoryTest(5);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Executor_Memory_CreateOutputMemory_0200
   * @tc.number SUB_AI_NNRt_Func_North_Executor_Memory_CreateOutputMemory_0200
   * @tc.desc   Test OH_NNExecutor_CreateOutputMemory with invalid output index
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Executor_Memory_CreateOutputMemory_0200', Level.LEVEL2, () => {
    let result = testNapi.nnrtMemoryTest(6);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Executor_Memory_CreateOutputMemory_0300
   * @tc.number SUB_AI_NNRt_Func_North_Executor_Memory_CreateOutputMemory_0300
   * @tc.desc   Test OH_NNExecutor_CreateOutputMemory with null memory parameter
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Executor_Memory_CreateOutputMemory_0300', Level.LEVEL2, () => {
    let result = testNapi.nnrtMemoryTest(7);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Executor_Memory_CreateOutputMemory_0500
   * @tc.number SUB_AI_NNRt_Func_North_Executor_Memory_CreateOutputMemory_0500
   * @tc.desc   Test OH_NNExecutor_CreateOutputMemory with valid parameters
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Executor_Memory_CreateOutputMemory_0500', Level.LEVEL2, () => {
    let result = testNapi.nnrtMemoryTest(9);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Executor_Memory_DestroyInputMemory_0100
   * @tc.number SUB_AI_NNRt_Func_North_Executor_Memory_DestroyInputMemory_0100
   * @tc.desc   Test OH_NNExecutor_DestroyInputMemory with null executor
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Executor_Memory_DestroyInputMemory_0100', Level.LEVEL2, () => {
    let result = testNapi.nnrtMemoryTest(10);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Executor_Memory_DestroyInputMemory_0200
   * @tc.number SUB_AI_NNRt_Func_North_Executor_Memory_DestroyInputMemory_0200
   * @tc.desc   Test OH_NNExecutor_DestroyInputMemory with invalid input index
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Executor_Memory_DestroyInputMemory_0200', Level.LEVEL2, () => {
    let result = testNapi.nnrtMemoryTest(11);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Executor_Memory_DestroyInputMemory_0300
   * @tc.number SUB_AI_NNRt_Func_North_Executor_Memory_DestroyInputMemory_0300
   * @tc.desc   Test OH_NNExecutor_DestroyInputMemory with null memory parameter
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Executor_Memory_DestroyInputMemory_0300', Level.LEVEL2, () => {
    let result = testNapi.nnrtMemoryTest(12);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Executor_Memory_DestroyOutputMemory_0100
   * @tc.number SUB_AI_NNRt_Func_North_Executor_Memory_DestroyOutputMemory_0100
   * @tc.desc   Test OH_NNExecutor_DestroyOutputMemory with null executor
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Executor_Memory_DestroyOutputMemory_0100', Level.LEVEL2, () => {
    let result = testNapi.nnrtMemoryTest(13);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Executor_Memory_DestroyOutputMemory_0200
   * @tc.number SUB_AI_NNRt_Func_North_Executor_Memory_DestroyOutputMemory_0200
   * @tc.desc   Test OH_NNExecutor_DestroyOutputMemory with invalid output index
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Executor_Memory_DestroyOutputMemory_0200', Level.LEVEL2, () => {
    let result = testNapi.nnrtMemoryTest(14);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Executor_Memory_DestroyOutputMemory_0300
   * @tc.number SUB_AI_NNRt_Func_North_Executor_Memory_DestroyOutputMemory_0300
   * @tc.desc   Test OH_NNExecutor_DestroyOutputMemory with null memory parameter
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Executor_Memory_DestroyOutputMemory_0300', Level.LEVEL2, () => {
    let result = testNapi.nnrtMemoryTest(15);
    expect(result).assertEqual(0);
  });

  });
}
