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

export default function ModelTest() {
  describe('ModelTest', () => {
    beforeAll(() => {
      console.info('ModelTest: beforeAll called');
    });

    afterAll(() => {
      console.info('ModelTest: afterAll called');
    });

    beforeEach(() => {
      console.info('ModelTest: beforeEach called');
    });

    afterEach(() => {
      console.info('ModelTest: afterEach called');
    });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Model_CreateModel_0100
   * @tc.number SUB_AI_NNRt_Func_North_Model_CreateModel_0100
   * @tc.desc   Test OH_NNModel_Construct
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Model_CreateModel_0100', Level.LEVEL2, () => {
    let result: number = testNapi.nnrtModelTest(0);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Model_CreateModel_0200
   * @tc.number SUB_AI_NNRt_Func_North_Model_CreateModel_0200
   * @tc.desc   Test OH_NNModel_Construct multiple times
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Model_CreateModel_0200', Level.LEVEL2, () => {
    let result: number = testNapi.nnrtModelTest(1);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Model_AddOperand_0100
   * @tc.number SUB_AI_NNRt_Func_North_Model_AddOperand_0100
   * @tc.desc   Test OH_NNModel_AddTensorToModel with null model
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Model_AddOperand_0100', Level.LEVEL2, () => {
    let result: number = testNapi.nnrtModelTest(2);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Model_AddOperand_0200
   * @tc.number SUB_AI_NNRt_Func_North_Model_AddOperand_0200
   * @tc.desc   Test OH_NNModel_AddTensorToModel with null tensor
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Model_AddOperand_0200', Level.LEVEL2, () => {
    let result: number = testNapi.nnrtModelTest(3);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Model_AddOperand_0300
   * @tc.number SUB_AI_NNRt_Func_North_Model_AddOperand_0300
   * @tc.desc   Test OH_NNModel_AddTensorToModel with invalid dataType
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Model_AddOperand_0300', Level.LEVEL2, () => {
    let result: number = testNapi.nnrtModelTest(4);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Model_AddOperand_0400
   * @tc.number SUB_AI_NNRt_Func_North_Model_AddOperand_0400
   * @tc.desc   Test OH_NNModel_AddTensorToModel with valid parameters
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Model_AddOperand_0400', Level.LEVEL2, () => {
    let result: number = testNapi.nnrtModelTest(5);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Model_SetOperandValue_0100
   * @tc.number SUB_AI_NNRt_Func_North_Model_SetOperandValue_0100
   * @tc.desc   Test OH_NNModel_SetTensorData with null model
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Model_SetOperandValue_0100', Level.LEVEL2, () => {
    let result: number = testNapi.nnrtModelTest(6);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Model_SetOperandValue_0200
   * @tc.number SUB_AI_NNRt_Func_North_Model_SetOperandValue_0200
   * @tc.desc   Test OH_NNModel_SetTensorData with invalid index
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Model_SetOperandValue_0200', Level.LEVEL2, () => {
    let result: number = testNapi.nnrtModelTest(7);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Model_SetOperandValue_0300
   * @tc.number SUB_AI_NNRt_Func_North_Model_SetOperandValue_0300
   * @tc.desc   Test OH_NNModel_SetTensorData with null dataBuffer
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Model_SetOperandValue_0300', Level.LEVEL2, () => {
    let result: number = testNapi.nnrtModelTest(8);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Model_SetOperandValue_0400
   * @tc.number SUB_AI_NNRt_Func_North_Model_SetOperandValue_0400
   * @tc.desc   Test OH_NNModel_SetTensorData with valid parameters
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Model_SetOperandValue_0400', Level.LEVEL2, () => {
    let result: number = testNapi.nnrtModelTest(9);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Model_AddOperation_0100
   * @tc.number SUB_AI_NNRt_Func_North_Model_AddOperation_0100
   * @tc.desc   Test OH_NNModel_AddOperation with null model
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Model_AddOperation_0100', Level.LEVEL2, () => {
    let result: number = testNapi.nnrtModelTest(10);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Model_AddOperation_0200
   * @tc.number SUB_AI_NNRt_Func_North_Model_AddOperation_0200
   * @tc.desc   Test OH_NNModel_AddOperation with valid parameters
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Model_AddOperation_0200', Level.LEVEL2, () => {
    let result: number = testNapi.nnrtModelTest(11);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Model_SpecifyInputsAndOutputs_0100
   * @tc.number SUB_AI_NNRt_Func_North_Model_SpecifyInputsAndOutputs_0100
   * @tc.desc   Test OH_NNModel_SpecifyInputsAndOutputs with null model
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Model_SpecifyInputsAndOutputs_0100', Level.LEVEL2, () => {
    let result: number = testNapi.nnrtModelTest(12);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Model_SpecifyInputsAndOutputs_0200
   * @tc.number SUB_AI_NNRt_Func_North_Model_SpecifyInputsAndOutputs_0200
   * @tc.desc   Test OH_NNModel_SpecifyInputsAndOutputs with null inputIndices
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Model_SpecifyInputsAndOutputs_0200', Level.LEVEL2, () => {
    let result: number = testNapi.nnrtModelTest(13);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Model_SpecifyInputsAndOutputs_0300
   * @tc.number SUB_AI_NNRt_Func_North_Model_SpecifyInputsAndOutputs_0300
   * @tc.desc   Test OH_NNModel_SpecifyInputsAndOutputs with valid parameters
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Model_SpecifyInputsAndOutputs_0300', Level.LEVEL2, () => {
    let result: number = testNapi.nnrtModelTest(14);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Model_Finish_0100
   * @tc.number SUB_AI_NNRt_Func_North_Model_Finish_0100
   * @tc.desc   Test OH_NNModel_Finish with null model
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Model_Finish_0100', Level.LEVEL2, () => {
    let result: number = testNapi.nnrtModelTest(15);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Model_Destroy_0100
   * @tc.number SUB_AI_NNRt_Func_North_Model_Destroy_0100
   * @tc.desc   Test OH_NNModel_Destroy with null model
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Model_Destroy_0100', Level.LEVEL2, () => {
    let result: number = testNapi.nnrtModelTest(17);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Model_Destroy_0200
   * @tc.number SUB_AI_NNRt_Func_North_Model_Destroy_0200
   * @tc.desc   Test OH_NNModel_Destroy with valid model
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Model_Destroy_0200', Level.LEVEL2, () => {
    let result: number = testNapi.nnrtModelTest(18);
    expect(result).assertEqual(0);
  });

  });
}
