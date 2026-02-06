/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { describe, it, expect, Level } from '@ohos/hypium';
import testNapi from 'libnn_core_test.so';

export default function ExecutorTest() {
  describe('ExecutorTests', () => {

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_Construct0100
     * @tc.number SUB_AI_NNRt_Func_North_Executor_Construct0100
     * @tc.desc   compilation为空，返回失败
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Executor_Construct0100', Level.LEVEL1, async () => {
      const result = await testNapi.TestExecutorConstruct0100();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_RunSync0100
     * @tc.number SUB_AI_NNRt_Func_North_Executor_RunSync0100
     * @tc.desc   executor为空，返回失败
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Executor_RunSync0100', Level.LEVEL1, async () => {
      const result = await testNapi.TestExecutorRunSync0100();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_RunSync0200
     * @tc.number SUB_AI_NNRt_Core_Func_North_Executor_RunSync0200
     * @tc.desc   executor sync推理，inputTensor数组为空,返回失败
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_Executor_RunSync0200', Level.LEVEL1, async () => {
      const result = await testNapi.TestExecutorRunSync0200();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_RunSync0300
     * @tc.number SUB_AI_NNRt_Core_Func_North_Executor_RunSync0300
     * @tc.desc   executor sync推理，outputTensor数组为空,返回失败
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_Executor_RunSync0300', Level.LEVEL1, async () => {
      const result = await testNapi.TestExecutorRunSync0300();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_RunSync0400
     * @tc.number SUB_AI_NNRt_Core_Func_North_Executor_RunSync0400
     * @tc.desc   executor sync推理，inputCount为0，返回失败
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_Executor_RunSync0400', Level.LEVEL1, async () => {
      const result = await testNapi.TestExecutorRunSync0400();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_RunSync0500
     * @tc.number SUB_AI_NNRt_Core_Func_North_Executor_RunSync0500
     * @tc.desc   executor sync推理，outputCount为0，返回失败
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_Executor_RunSync0500', Level.LEVEL1, async () => {
      const result = await testNapi.TestExecutorRunSync0500();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_RunSync0600
     * @tc.number SUB_AI_NNRt_Core_Func_North_Executor_RunSync0600
     * @tc.desc   executor sync推理，inputTensor个数不足，小于正确的输入数量，返回错误
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_Executor_RunSync0600', Level.LEVEL1, async () => {
      const result = await testNapi.TestExecutorRunSync0600();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_RunSync0700
     * @tc.number SUB_AI_NNRt_Core_Func_North_Executor_RunSync0700
     * @tc.desc   executor sync推理，inputTensor数组个数超过inputNum，返回错误
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_Executor_RunSync0700', Level.LEVEL1, async () => {
      const result = await testNapi.TestExecutorRunSync0700();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_RunSync0800
     * @tc.number SUB_AI_NNRt_Core_Func_North_Executor_RunSync0800
     * @tc.desc   executor sync推理，outputTensor个数不足，小于正确的输入数量，返回错误
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_Executor_RunSync0800', Level.LEVEL1, async () => {
      const result = await testNapi.TestExecutorRunSync0800();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_RunSync0900
     * @tc.number SUB_AI_NNRt_Core_Func_North_Executor_RunSync0900
     * @tc.desc   executor sync推理，outputTensor数组个数超过outputNum，返回错误
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_Executor_RunSync0900', Level.LEVEL1, async () => {
      const result = await testNapi.TestExecutorRunSync0900();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_RunASync0100
     * @tc.number SUB_AI_NNRt_Core_Func_North_Executor_RunASync0100
     * @tc.desc   executor async推理，executor为空，返回失败
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_Executor_RunASync0100', Level.LEVEL1, async () => {
      const result = await testNapi.TestExecutorRunAsync0100();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_RunASync0200
     * @tc.number SUB_AI_NNRt_Core_Func_North_Executor_RunASync0200
     * @tc.desc   executor async推理，inputCount为0，返回失败
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_Executor_RunASync0200', Level.LEVEL1, async () => {
      const result = await testNapi.TestExecutorRunAsync0200();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_RunASync0300
     * @tc.number SUB_AI_NNRt_Core_Func_North_Executor_RunASync0300
     * @tc.desc   executor async推理，outputCount为0，返回失败
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_Executor_RunASync0300', Level.LEVEL1, async () => {
      const result = await testNapi.TestExecutorRunAsync0300();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_RunASync0400
     * @tc.number SUB_AI_NNRt_Core_Func_North_Executor_RunASync0400
     * @tc.desc   executor async推理，inputTensor为空指针
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_Executor_RunASync0400', Level.LEVEL1, async () => {
      const result = await testNapi.TestExecutorRunAsync0400();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_RunASync0500
     * @tc.number SUB_AI_NNRt_Core_Func_North_Executor_RunASync0500
     * @tc.desc   executor async推理，outputTensor为空指针
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_Executor_RunASync0500', Level.LEVEL1, async () => {
      const result = await testNapi.TestExecutorRunAsync0500();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_RunASync0600
     * @tc.number SUB_AI_NNRt_Core_Func_North_Executor_RunASync0600
     * @tc.desc   executor async推理，定长模型返回不支持
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_Executor_RunASync0600', Level.LEVEL1, async () => {
      const result = await testNapi.TestExecutorRunAsync0600();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_Destroy0100
     * @tc.number SUB_AI_NNRt_Func_North_Executor_Destroy0100
     * @tc.desc   重复释放executor，返回失败
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Executor_Destroy0100', Level.LEVEL1, () => {
      const result = testNapi.TestExecutorDestroy0100();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_Destroy0200
     * @tc.number SUB_AI_NNRt_Func_North_Executor_Destroy0200
     * @tc.desc   正常释放，检查executor为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Executor_Destroy0200', Level.LEVEL1, () => {
      const result = testNapi.TestExecutorDestroy0200();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_SetOnRunDone0100
     * @tc.number SUB_AI_NNRt_Func_North_Executor_SetOnRunDone0100
     * @tc.desc   在推理完成时设置executor，executor为空，返回失败
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Executor_SetOnRunDone0100', Level.LEVEL1, () => {
      const result = testNapi.TestExecutorSetOnRunDone0100();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_SetOnRunDone0200
     * @tc.number SUB_AI_NNRt_Func_North_Executor_SetOnRunDone0200
     * @tc.desc   在推理完成时设置executor，合法参数返回不支持
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Executor_SetOnRunDone0200', Level.LEVEL1, () => {
      const result = testNapi.TestExecutorSetOnRunDone0200();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_SetOnServiceDied0100
     * @tc.number SUB_AI_NNRt_Func_North_Executor_SetOnServiceDied0100
     * @tc.desc   executor为空，返回失败
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Executor_SetOnServiceDied0100', Level.LEVEL1, () => {
      const result = testNapi.TestExecutorSetOnServiceDied0100();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_SetOnServiceDied0200
     * @tc.number SUB_AI_NNRt_Func_North_Executor_SetOnServiceDied0200
     * @tc.desc   合法参数，返回不支持
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Executor_SetOnServiceDied0200', Level.LEVEL1, () => {
      const result = testNapi.TestExecutorSetOnServiceDied0200();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_Get_Output_Shape0100
     * @tc.number SUB_AI_NNRt_Core_Func_North_Executor_Get_Output_Shape0100
     * @tc.desc   executor为空，返回失败
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_Executor_Get_Output_Shape0100', Level.LEVEL1, () => {
      const result = testNapi.TestExecutorGetOutputShape0100();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_Get_Output_Shape0200
     * @tc.number SUB_AI_NNRt_Core_Func_North_Executor_Get_Output_Shape0200
     * @tc.desc   outputindex不存在，等于输出个数，返回失败
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_Executor_Get_Output_Shape0200', Level.LEVEL1, () => {
      const result = testNapi.TestExecutorGetOutputShape0200();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_Get_Output_Shape0300
     * @tc.number SUB_AI_NNRt_Core_Func_North_Executor_Get_Output_Shape0300
     * @tc.desc   定长模型推理成功，获取输出维度成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_Executor_Get_Output_Shape0300', Level.LEVEL1, async () => {
      const result = await testNapi.TestExecutorGetOutputShape0300();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_Get_Input_Count0100
     * @tc.number SUB_AI_NNRt_Core_Func_North_Executor_Get_Input_Count0100
     * @tc.desc   executor为空，返回失败
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_Executor_Get_Input_Count0100', Level.LEVEL1, () => {
      const result = testNapi.TestExecutorGetInputCount0100();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_Get_Input_Count0200
     * @tc.number SUB_AI_NNRt_Core_Func_North_Executor_Get_Input_Count0200
     * @tc.desc   inputCount为空，返回失败
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_Executor_Get_Input_Count0200', Level.LEVEL1, () => {
      const result = testNapi.TestExecutorGetInputCount0200();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_Get_Input_Count0300
     * @tc.number SUB_AI_NNRt_Core_Func_North_Executor_Get_Input_Count0300
     * @tc.desc   获取输入个数，返回成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_Executor_Get_Input_Count0300', Level.LEVEL1, () => {
      const result = testNapi.TestExecutorGetInputCount0300();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_Get_Output_Count0100
     * @tc.number SUB_AI_NNRt_Core_Func_North_Executor_Get_Output_Count0100
     * @tc.desc   executor为空，返回失败
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_Executor_Get_Output_Count0100', Level.LEVEL1, () => {
      const result = testNapi.TestExecutorGetOutputCount0100();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_Get_Output_Count0200
     * @tc.number SUB_AI_NNRt_Core_Func_North_Executor_Get_Output_Count0200
     * @tc.desc   outputCount为空，返回失败
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_Executor_Get_Output_Count0200', Level.LEVEL1, () => {
      const result = testNapi.TestExecutorGetOutputCount0200();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_Get_Output_Count0300
     * @tc.number SUB_AI_NNRt_Core_Func_North_Executor_Get_Output_Count0300
     * @tc.desc   获取输出个数，返回成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_Executor_Get_Output_Count0300', Level.LEVEL1, () => {
      const result = testNapi.TestExecutorGetOutputCount0300();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_Create_Input_TensorDesc0100
     * @tc.number SUB_AI_NNRt_Core_Func_North_Executor_Create_Input_TensorDesc0100
     * @tc.desc   executor为空，返回失败
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_Executor_Create_Input_TensorDesc0100', Level.LEVEL1, () => {
      const result = testNapi.TestExecutorCreateInputTensorDesc0100();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_Create_Input_TensorDesc0200
     * @tc.number SUB_AI_NNRt_Core_Func_North_Executor_Create_Input_TensorDesc0200
     * @tc.desc   遍历创建输入tensorDesc，index小于输入个数，成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_Executor_Create_Input_TensorDesc0200', Level.LEVEL1, () => {
      const result = testNapi.TestExecutorCreateInputTensorDesc0200();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_Create_Input_TensorDesc0300
     * @tc.number SUB_AI_NNRt_Core_Func_North_Executor_Create_Input_TensorDesc0300
     * @tc.desc   index等于输入个数，返回失败
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_Executor_Create_Input_TensorDesc0300', Level.LEVEL1, () => {
      const result = testNapi.TestExecutorCreateInputTensorDesc0300();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_Create_Output_TensorDesc0100
     * @tc.number SUB_AI_NNRt_Core_Func_North_Executor_Create_Output_TensorDesc0100
     * @tc.desc   executor为空，返回失败
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_Executor_Create_Output_TensorDesc0100', Level.LEVEL1, () => {
      const result = testNapi.TestExecutorCreateOutputTensorDesc0100();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_Create_Output_TensorDesc0200
     * @tc.number SUB_AI_NNRt_Core_Func_North_Executor_Create_Output_TensorDesc0200
     * @tc.desc   遍历创建输出tensorDesc，index小于输出个数，成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_Executor_Create_Output_TensorDesc0200', Level.LEVEL1, () => {
      const result = testNapi.TestExecutorCreateOutputTensorDesc0200();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_Create_Output_TensorDesc0300
     * @tc.number SUB_AI_NNRt_Core_Func_North_Executor_Create_Output_TensorDesc0300
     * @tc.desc   index等于输出个数，返回失败
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_Executor_Create_Output_TensorDesc0300', Level.LEVEL1, () => {
      const result = testNapi.TestExecutorCreateOutputTensorDesc0300();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_Get_Input_Dim_Range0100
     * @tc.number SUB_AI_NNRt_Core_Func_North_Executor_Get_Input_Dim_Range0100
     * @tc.desc   executor为空，返回失败
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_Executor_Get_Input_Dim_Range0100', Level.LEVEL1, () => {
      const result = testNapi.TestExecutorGetInputDimRange0100();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_Get_Input_Dim_Range0200
     * @tc.number SUB_AI_NNRt_Core_Func_North_Executor_Get_Input_Dim_Range0200
     * @tc.desc   获取动态输入范围，设置index等于输入个数，超出限制，获取失败
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_Executor_Get_Input_Dim_Range0200', Level.LEVEL1, () => {
      const result = testNapi.TestExecutorGetInputDimRange0200();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_Get_Input_Dim_Range0500
     * @tc.number SUB_AI_NNRt_Core_Func_North_Executor_Get_Input_Dim_Range0500
     * @tc.desc   变长模型推理，获取输入维度，获取成功，设置输入维度小于最小临界值，推理失败
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_Executor_Get_Input_Dim_Range0500', Level.LEVEL1, async () => {
      const result = await testNapi.TestExecutorGetInputDimRange0500();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_Get_Input_Dim_Range0600
     * @tc.number SUB_AI_NNRt_Core_Func_North_Executor_Get_Input_Dim_Range0600
     * @tc.desc   变长模型推理，依次获取输入维度，获取成功，设置输入维度大于最大临界值，推理失败
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_Executor_Get_Input_Dim_Range0600', Level.LEVEL1, async () => {
      const result = await testNapi.TestExecutorGetInputDimRange0600();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_Executor_Get_Input_Dim_Range0700
     * @tc.number SUB_AI_NNRt_Core_Func_North_Executor_Get_Input_Dim_Range0700
     * @tc.desc   变长模型推理，依次获取输入维度，获取成功，设置输入shape个数超过shapeNum,推理失败
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_Executor_Get_Input_Dim_Range0700', Level.LEVEL1, async () => {
      const result = await testNapi.TestExecutorGetInputDimRange0700();
      expect(result).assertEqual(0);
    });
  });
}

