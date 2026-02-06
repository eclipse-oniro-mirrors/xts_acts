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

export default function TensorDescTest() {
  describe('TensorDescTests', () => {

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_TensorDescCreate0100
     * @tc.number SUB_AI_NNRt_Core_Func_North_TensorDescCreate0100
     * @tc.desc   创建TensorDesc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_TensorDescCreate0100', Level.LEVEL1, () => {
      const result = testNapi.TestTensorDescCreate0100();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_TensorDescDestroy0100
     * @tc.number SUB_AI_NNRt_Core_Func_North_TensorDescDestroy0100
     * @tc.desc   销毁TensorDesc，TensorDesc为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_TensorDescDestroy0100', Level.LEVEL1, () => {
      const result = testNapi.TestTensorDescDestroy0100();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_TensorDescDestroy0200
     * @tc.number SUB_AI_NNRt_Core_Func_North_TensorDescDestroy0200
     * @tc.desc   销毁TensorDesc，*TensorDesc为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_TensorDescDestroy0200', Level.LEVEL1, () => {
      const result = testNapi.TestTensorDescDestroy0200();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_TensorDescDestroy0300
     * @tc.number SUB_AI_NNRt_Core_Func_North_TensorDescDestroy0300
     * @tc.desc   销毁TensorDesc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_TensorDescDestroy0300', Level.LEVEL1, () => {
      const result = testNapi.TestTensorDescDestroy0300();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_TensorDescSetDataType0100
     * @tc.number SUB_AI_NNRt_Core_Func_North_TensorDescSetDataType0100
     * @tc.desc   设置TensorDesc数据类型，TensorDesc为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_TensorDescSetDataType0100', Level.LEVEL1, () => {
      const result = testNapi.TestTensorDescSetDataType0100();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_TensorDescSetDataType0200
     * @tc.number SUB_AI_NNRt_Core_Func_North_TensorDescSetDataType0200
     * @tc.desc   设置TensorDesc数据类型，遍历DataType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_TensorDescSetDataType0200', Level.LEVEL1, () => {
      const result = testNapi.TestTensorDescSetDataType0200();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_TensorDescSetDataType0300
     * @tc.number SUB_AI_NNRt_Core_Func_North_TensorDescSetDataType0300
     * @tc.desc   设置TensorDesc数据类型，DataType不合法
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_TensorDescSetDataType0300', Level.LEVEL1, () => {
      const result = testNapi.TestTensorDescSetDataType0300();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_TensorDescGetDataType0100
     * @tc.number SUB_AI_NNRt_Core_Func_North_TensorDescGetDataType0100
     * @tc.desc   获取TensorDesc数据类型，TensorDesc为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_TensorDescGetDataType0100', Level.LEVEL1, () => {
      const result = testNapi.TestTensorDescGetDataType0100();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_TensorDescGetDataType0200
     * @tc.number SUB_AI_NNRt_Core_Func_North_TensorDescGetDataType0200
     * @tc.desc   获取TensorDesc数据类型，未设置DataType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_TensorDescGetDataType0200', Level.LEVEL1, () => {
      const result = testNapi.TestTensorDescGetDataType0200();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_TensorDescSetShape0100
     * @tc.number SUB_AI_NNRt_Core_Func_North_TensorDescSetShape0100
     * @tc.desc   设置TensorDescShape，TensorDesc为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_TensorDescSetShape0100', Level.LEVEL1, () => {
      const result = testNapi.TestTensorDescSetShape0100();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_TensorDescSetShape0200
     * @tc.number SUB_AI_NNRt_Core_Func_North_TensorDescSetShape0200
     * @tc.desc   设置TensorDescShape，shape为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_TensorDescSetShape0200', Level.LEVEL1, () => {
      const result = testNapi.TestTensorDescSetShape0200();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_TensorDescGetShape0100
     * @tc.number SUB_AI_NNRt_Core_Func_North_TensorDescGetShape0100
     * @tc.desc   获取TensorDescShape，TensorDesc为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_TensorDescGetShape0100', Level.LEVEL1, () => {
      const result = testNapi.TestTensorDescGetShape0100();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_TensorDescGetShape0200
     * @tc.number SUB_AI_NNRt_Core_Func_North_TensorDescGetShape0200
     * @tc.desc   获取TensorDescShape，未设置shape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_TensorDescGetShape0200', Level.LEVEL1, () => {
      const result = testNapi.TestTensorDescGetShape0200();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_TensorDescGetShape0300
     * @tc.number SUB_AI_NNRt_Core_Func_North_TensorDescGetShape0300
     * @tc.desc   获取TensorDescShape，合法设置返回成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_TensorDescGetShape0300', Level.LEVEL1, () => {
      const result = testNapi.TestTensorDescGetShape0300();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_TensorDescSetFormat0100
     * @tc.number SUB_AI_NNRt_Core_Func_North_TensorDescSetFormat0100
     * @tc.desc   设置TensorDescFormat，TensorDesc为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_TensorDescSetFormat0100', Level.LEVEL1, () => {
      const result = testNapi.TestTensorDescSetFormat0100();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_TensorDescSetFormat0200
     * @tc.number SUB_AI_NNRt_Core_Func_North_TensorDescSetFormat0200
     * @tc.desc   设置TensorDescFormat，遍历设置format
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_TensorDescSetFormat0200', Level.LEVEL1, () => {
      const result = testNapi.TestTensorDescSetFormat0200();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_TensorDescGetFormat0100
     * @tc.number SUB_AI_NNRt_Core_Func_North_TensorDescGetFormat0100
     * @tc.desc   获取TensorDescFormat，TensorDesc为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_TensorDescGetFormat0100', Level.LEVEL1, () => {
      const result = testNapi.TestTensorDescGetFormat0100();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_TensorDescGetFormat0200
     * @tc.number SUB_AI_NNRt_Core_Func_North_TensorDescGetFormat0200
     * @tc.desc   获取TensorDescFormat，未设置Format
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_TensorDescGetFormat0200', Level.LEVEL1, () => {
      const result = testNapi.TestTensorDescGetFormat0200();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_TensorDescGetFormat0300
     * @tc.number SUB_AI_NNRt_Core_Func_North_TensorDescGetFormat0300
     * @tc.desc   获取TensorDescFormat，合法获取，返回成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_TensorDescGetFormat0300', Level.LEVEL1, () => {
      const result = testNapi.TestTensorDescGetFormat0300();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_TensorDescGetElementCount0100
     * @tc.number SUB_AI_NNRt_Core_Func_North_TensorDescGetElementCount0100
     * @tc.desc   获取TensorDescElementCount，TensorDesc为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_TensorDescGetElementCount0100', Level.LEVEL1, () => {
      const result = testNapi.TestTensorDescGetElementCount0100();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_TensorDescGetElementCount0200
     * @tc.number SUB_AI_NNRt_Core_Func_North_TensorDescGetElementCount0200
     * @tc.desc   获取TensorDescElementCount，合理设置返回正确
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_TensorDescGetElementCount0200', Level.LEVEL1, () => {
      const result = testNapi.TestTensorDescGetElementCount0200();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_TensorDescGetElementCount0300
     * @tc.number SUB_AI_NNRt_Core_Func_North_TensorDescGetElementCount0300
     * @tc.desc   获取TensorDescElementCount，不设置，返回错误
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_TensorDescGetElementCount0300', Level.LEVEL1, () => {
      const result = testNapi.TestTensorDescGetElementCount0300();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_TensorDescGetByteSize0100
     * @tc.number SUB_AI_NNRt_Core_Func_North_TensorDescGetByteSize0100
     * @tc.desc   获取TensorDescByteSize，TensorDesc为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_TensorDescGetByteSize0100', Level.LEVEL1, () => {
      const result = testNapi.TestTensorDescGetByteSize0100();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_TensorDescGetByteSize0200
     * @tc.number SUB_AI_NNRt_Core_Func_North_TensorDescGetByteSize0200
     * @tc.desc   获取TensorDescByteSize，合理设置返回正确
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_TensorDescGetByteSize0200', Level.LEVEL1, () => {
      const result = testNapi.TestTensorDescGetByteSize0200();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_TensorDescGetByteSize0300
     * @tc.number SUB_AI_NNRt_Core_Func_North_TensorDescGetByteSize0300
     * @tc.desc   获取TensorDescByteSize，不设置，返回错误
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_TensorDescGetByteSize0300', Level.LEVEL1, () => {
      const result = testNapi.TestTensorDescGetByteSize0300();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_TensorDescSetName0100
     * @tc.number SUB_AI_NNRt_Core_Func_North_TensorDescSetName0100
     * @tc.desc   设置TensorDescName，TensorDesc为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_TensorDescSetName0100', Level.LEVEL1, () => {
      const result = testNapi.TestTensorDescSetName0100();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_TensorDescSetName0200
     * @tc.number SUB_AI_NNRt_Core_Func_North_TensorDescSetName0200
     * @tc.desc   设置TensorDescName，name为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_TensorDescSetName0200', Level.LEVEL1, () => {
      const result = testNapi.TestTensorDescSetName0200();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_TensorDescGetName0100
     * @tc.number SUB_AI_NNRt_Core_Func_North_TensorDescGetName0100
     * @tc.desc   获取TensorDescName，TensorDesc为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_TensorDescGetName0100', Level.LEVEL1, () => {
      const result = testNapi.TestTensorDescGetName0100();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_TensorDescGetName0200
     * @tc.number SUB_AI_NNRt_Core_Func_North_TensorDescGetName0200
     * @tc.desc   获取TensorDescName，合理设置返回正确
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_TensorDescGetName0200', Level.LEVEL1, () => {
      const result = testNapi.TestTensorDescGetName0200();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Core_Func_North_TensorDescGetName0300
     * @tc.number SUB_AI_NNRt_Core_Func_North_TensorDescGetName0300
     * @tc.desc   获取TensorDescName，不设置，返回错误
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Core_Func_North_TensorDescGetName0300', Level.LEVEL1, () => {
      const result = testNapi.TestTensorDescGetName0300();
      expect(result).assertEqual(0);
    });
  });
}

