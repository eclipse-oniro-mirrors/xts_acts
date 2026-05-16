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

export default function TensorTest() {
  describe('TensorTests', () => {

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Tensor_CreateTensor0100
     * @tc.number SUB_AI_NNRt_Func_North_Tensor_CreateTensor0100
     * @tc.desc   创建Tensor，TensorDesc为nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Tensor_CreateTensor0100', Level.LEVEL0, () => {
      const result = testNapi.TestTensorCreate0100();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Tensor_CreateTensor0200
     * @tc.number SUB_AI_NNRt_Func_North_Tensor_CreateTensor0200
     * @tc.desc   创建Tensor，deviceId=0，设备找到，创建成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Tensor_CreateTensor0200', Level.LEVEL0, () => {
      const result = testNapi.TestTensorCreate0200();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Tensor_CreateTensor0300
     * @tc.number SUB_AI_NNRt_Func_North_Tensor_CreateTensor0300
     * @tc.desc   创建Tensor，成功创建
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Tensor_CreateTensor0300', Level.LEVEL0, () => {
      const result = testNapi.TestTensorCreate0300();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Tensor_CreateTensorWithSize0100
     * @tc.number SUB_AI_NNRt_Func_North_Tensor_CreateTensorWithSize0100
     * @tc.desc   根据size创建Tensor，TensorDesc为nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Tensor_CreateTensorWithSize0100', Level.LEVEL0, () => {
      const result = testNapi.TestTensorCreateWithSize0100();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Tensor_CreateTensorWithSize0200
     * @tc.number SUB_AI_NNRt_Func_North_Tensor_CreateTensorWithSize0200
     * @tc.desc   根据size创建Tensor，size = 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Tensor_CreateTensorWithSize0200', Level.LEVEL0, () => {
      const result = testNapi.TestTensorCreateWithSize0200();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Tensor_CreateTensorWithSize0300
     * @tc.number SUB_AI_NNRt_Func_North_Tensor_CreateTensorWithSize0300
     * @tc.desc   根据size创建Tensor，size < tensor size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Tensor_CreateTensorWithSize0300', Level.LEVEL0, () => {
      const result = testNapi.TestTensorCreateWithSize0300();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Tensor_CreateTensorWithFd0100
     * @tc.number SUB_AI_NNRt_Func_North_Tensor_CreateTensorWithFd0100
     * @tc.desc   通过fd根据size创建Tensor，TensorDesc为nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Tensor_CreateTensorWithFd0100', Level.LEVEL0, () => {
      const result = testNapi.TestTensorCreateWithFd0100();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Tensor_CreateTensorWithFd0200
     * @tc.number SUB_AI_NNRt_Func_North_Tensor_CreateTensorWithFd0200
     * @tc.desc   通过fd根据size创建Tensor，fd = -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Tensor_CreateTensorWithFd0200', Level.LEVEL0, () => {
      const result = testNapi.TestTensorCreateWithFd0200();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Tensor_CreateTensorWithFd0300
     * @tc.number SUB_AI_NNRt_Func_North_Tensor_CreateTensorWithFd0300
     * @tc.desc   通过fd根据size创建Tensor，size = 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Tensor_CreateTensorWithFd0300', Level.LEVEL0, () => {
      const result = testNapi.TestTensorCreateWithFd0300();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Tensor_CreateTensorWithFd0400
     * @tc.number SUB_AI_NNRt_Func_North_Tensor_CreateTensorWithFd0400
     * @tc.desc   通过fd根据size创建Tensor，size = offset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Tensor_CreateTensorWithFd0400', Level.LEVEL0, () => {
      const result = testNapi.TestTensorCreateWithFd0400();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Tensor_CreateTensorWithFd0500
     * @tc.number SUB_AI_NNRt_Func_North_Tensor_CreateTensorWithFd0500
     * @tc.desc   通过fd根据size创建Tensor，size-offset < tensorDescBytesize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Tensor_CreateTensorWithFd0500', Level.LEVEL0, () => {
      const result = testNapi.TestTensorCreateWithFd0500();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Tensor_GetDataBuffer0100
     * @tc.number SUB_AI_NNRt_Func_North_Tensor_GetDataBuffer0100
     * @tc.desc   获取databuffer，tensor为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Tensor_GetDataBuffer0100', Level.LEVEL0, () => {
      const result = testNapi.TestTensorGetDataBuffer0100();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Tensor_GetDataBuffer0200
     * @tc.number SUB_AI_NNRt_Func_North_Tensor_GetDataBuffer0200
     * @tc.desc   获取databuffer，tensor为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Tensor_GetDataBuffer0200', Level.LEVEL0, () => {
      const result = testNapi.TestTensorGetDataBuffer0200();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Tensor_Destroy0100
     * @tc.number SUB_AI_NNRt_Func_North_Tensor_Destroy0100
     * @tc.desc   销毁tensor，tensor为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Tensor_Destroy0100', Level.LEVEL0, () => {
      const result = testNapi.TestTensorDestroy0100();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Tensor_Destroy0200
     * @tc.number SUB_AI_NNRt_Func_North_Tensor_Destroy0200
     * @tc.desc   销毁tensor，*tensor为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Tensor_Destroy0200', Level.LEVEL0, () => {
      const result = testNapi.TestTensorDestroy0200();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Tensor_GetTensorDesc0100
     * @tc.number SUB_AI_NNRt_Func_North_Tensor_GetTensorDesc0100
     * @tc.desc   获取TensorDesc，tensor为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Tensor_GetTensorDesc0100', Level.LEVEL0, () => {
      const result = testNapi.TestTensorGetTensorDesc0100();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Tensor_GetTensorDesc0200
     * @tc.number SUB_AI_NNRt_Func_North_Tensor_GetTensorDesc0200
     * @tc.desc   获取TensorDesc，返回正确
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Tensor_GetTensorDesc0200', Level.LEVEL0, () => {
      const result = testNapi.TestTensorGetTensorDesc0200();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Tensor_GetSize0100
     * @tc.number SUB_AI_NNRt_Func_North_Tensor_GetSize0100
     * @tc.desc   获取SIZE，tensor为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Tensor_GetSize0100', Level.LEVEL0, () => {
      const result = testNapi.TestTensorGetSize0100();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Tensor_GetSize0200
     * @tc.number SUB_AI_NNRt_Func_North_Tensor_GetSize0200
     * @tc.desc   获取SIZE，OH_NNTensor_Create创建
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Tensor_GetSize0200', Level.LEVEL0, () => {
      const result = testNapi.TestTensorGetSize0200();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Tensor_GetSize0300
     * @tc.number SUB_AI_NNRt_Func_North_Tensor_GetSize0300
     * @tc.desc   获取SIZE，OH_NNTensor_CreateWithSize创建
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Tensor_GetSize0300', Level.LEVEL0, () => {
      const result = testNapi.TestTensorGetSize0300();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Tensor_GetFd0100
     * @tc.number SUB_AI_NNRt_Func_North_Tensor_GetFd0100
     * @tc.desc   获取Fd，tensor为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Tensor_GetFd0100', Level.LEVEL0, () => {
      const result = testNapi.TestTensorGetFd0100();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Tensor_GetFd0200
     * @tc.number SUB_AI_NNRt_Func_North_Tensor_GetFd0200
     * @tc.desc   获取Fd，返回成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Tensor_GetFd0200', Level.LEVEL0, () => {
      const result = testNapi.TestTensorGetFd0200();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Tensor_GetOffset0100
     * @tc.number SUB_AI_NNRt_Func_North_Tensor_GetOffset0100
     * @tc.desc   获取offset，tensor为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Tensor_GetOffset0100', Level.LEVEL0, () => {
      const result = testNapi.TestTensorGetOffset0100();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Tensor_GetOffset0200
     * @tc.number SUB_AI_NNRt_Func_North_Tensor_GetOffset0200
     * @tc.desc   获取offset，返回成功，offset = 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Tensor_GetOffset0200', Level.LEVEL0, () => {
      const result = testNapi.TestTensorGetOffset0200();
      expect(result).assertEqual(0);
    });
  });
}

