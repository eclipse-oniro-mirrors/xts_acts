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

export default function ModelTest() {
  describe('ModelTests', () => {

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Model_CreateQuantParam0100
     * @tc.number SUB_AI_NNRt_Func_North_Model_CreateQuantParam0100
     * @tc.desc   创建量化参数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Model_CreateQuantParam0100', Level.LEVEL1, () => {
      const result = testNapi.TestModelCreateQuantParam0100();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Model_DestroyQuantParam0100
     * @tc.number SUB_AI_NNRt_Func_North_Model_DestroyQuantParam0100
     * @tc.desc   释放量化参数,*quantParam为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Model_DestroyQuantParam0100', Level.LEVEL1, () => {
      const result = testNapi.TestModelDestroyQuantParam0100();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Model_DestroyQuantParam0200
     * @tc.number SUB_AI_NNRt_Func_North_Model_DestroyQuantParam0200
     * @tc.desc   释放量化参数,quantParam为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Model_DestroyQuantParam0200', Level.LEVEL1, () => {
      const result = testNapi.TestModelDestroyQuantParam0200();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Model_SetQuantParam0100
     * @tc.number SUB_AI_NNRt_Func_North_Model_SetQuantParam0100
     * @tc.desc   设置量化参数，参数为空，返回失败
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Model_SetQuantParam0100', Level.LEVEL1, () => {
      const result = testNapi.TestModelSetQuantParam0100();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Model_SetQuantParam0200
     * @tc.number SUB_AI_NNRt_Func_North_Model_SetQuantParam0200
     * @tc.desc   设置量化参数，参数合法，设置成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Model_SetQuantParam0200', Level.LEVEL0, () => {
      const result = testNapi.TestModelSetQuantParam0200();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Model_SetQuantParam0300
     * @tc.number SUB_AI_NNRt_Func_North_Model_SetQuantParam0300
     * @tc.desc   设置量化参数，count=1,channel=2,Per-Layer模式，设置成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Model_SetQuantParam0300', Level.LEVEL0, () => {
      const result = testNapi.TestModelSetQuantParam0300();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Model_SetQuantParam0400
     * @tc.number SUB_AI_NNRt_Func_North_Model_SetQuantParam0400
     * @tc.desc   设置量化参数，参数合法,count=2,参数的channel=1,调用失败
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Model_SetQuantParam0400', Level.LEVEL0, () => {
      const result = testNapi.TestModelSetQuantParam0400();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Model_SetQuantParam0500
     * @tc.number SUB_AI_NNRt_Func_North_Model_SetQuantParam0500
     * @tc.desc   设置量化参数，参数合法,参数count不一致,调用失败
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Model_SetQuantParam0500', Level.LEVEL0, () => {
      const result = testNapi.TestModelSetQuantParam0500();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Model_SetQuantParam0600
     * @tc.number SUB_AI_NNRt_Func_North_Model_SetQuantParam0600
     * @tc.desc   设置量化参数，参数合法,不设置zeroPoints,调用失败
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Model_SetQuantParam0600', Level.LEVEL0, () => {
      const result = testNapi.TestModelSetQuantParam0600();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Model_SetQuantParam0700
     * @tc.number SUB_AI_NNRt_Func_North_Model_SetQuantParam0700
     * @tc.desc   设置量化参数，参数合法,不设置numBits,调用失败
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Model_SetQuantParam0700', Level.LEVEL0, () => {
      const result = testNapi.TestModelSetQuantParam0700();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Model_SetQuantParam0800
     * @tc.number SUB_AI_NNRt_Func_North_Model_SetQuantParam0800
     * @tc.desc   设置量化参数，参数合法,不设置scales,调用失败
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Model_SetQuantParam0800', Level.LEVEL0, () => {
      const result = testNapi.TestModelSetQuantParam0800();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Model_SetQuantParam0900
     * @tc.number SUB_AI_NNRt_Func_North_Model_SetQuantParam0900
     * @tc.desc   设置量化参数，参数合法,tensor下标等于当前tensor个数,返回失败
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Model_SetQuantParam0900', Level.LEVEL0, () => {
      const result = testNapi.TestModelSetQuantParam0900();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Model_AddTensorToModel0100
     * @tc.number SUB_AI_NNRt_Func_North_Model_AddTensorToModel0100
     * @tc.desc   添加tensor到模型，model为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Model_AddTensorToModel0100', Level.LEVEL1, () => {
      const result = testNapi.TestModelAddTensorToModel0100();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Model_AddTensorToModel0200
     * @tc.number SUB_AI_NNRt_Func_North_Model_AddTensorToModel0200
     * @tc.desc   添加tensor到模型，tensorDesc为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Model_AddTensorToModel0200', Level.LEVEL1, () => {
      const result = testNapi.TestModelAddTensorToModel0200();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Model_SetTensorData0100
     * @tc.number SUB_AI_NNRt_Func_North_Model_SetTensorData0100
     * @tc.desc   设置操作数值，model为nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Model_SetTensorData0100', Level.LEVEL1, () => {
      const result = testNapi.TestModelSetTensorData0100();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Model_SetTensorData0200
     * @tc.number SUB_AI_NNRt_Func_North_Model_SetTensorData0200
     * @tc.desc   设置操作数值，model为nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Model_SetTensorData0200', Level.LEVEL0, () => {
      const result = testNapi.TestModelSetTensorData0200();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Model_SetTensorData0300
     * @tc.number SUB_AI_NNRt_Func_North_Model_SetTensorData0300
     * @tc.desc   设置操作数值，length = 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Model_SetTensorData0300', Level.LEVEL0, () => {
      const result = testNapi.TestModelSetTensorData0300();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Model_SetTensorData0400
     * @tc.number SUB_AI_NNRt_Func_North_Model_SetTensorData0400
     * @tc.desc   设置操作数值，index大于tensor个数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Model_SetTensorData0400', Level.LEVEL0, () => {
      const result = testNapi.TestModelSetTensorData0400();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Model_SetTensorType0100
     * @tc.number SUB_AI_NNRt_Func_North_Model_SetTensorType0100
     * @tc.desc   设置tensortype，model为nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Model_SetTensorType0100', Level.LEVEL1, () => {
      const result = testNapi.TestModelSetTensorType0100();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Model_SetTensorType0200
     * @tc.number SUB_AI_NNRt_Func_North_Model_SetTensorType0200
     * @tc.desc   设置tensortype，index大于tensor个数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Model_SetTensorType0200', Level.LEVEL0, () => {
      const result = testNapi.TestModelSetTensorType0200();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Model_SetTensorType0300
     * @tc.number SUB_AI_NNRt_Func_North_Model_SetTensorType0300
     * @tc.desc   设置tensortype，遍历设置tensorType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Model_SetTensorType0300', Level.LEVEL0, () => {
      const result = testNapi.TestModelSetTensorType0300();
      expect(result).assertEqual(0);
    });
  });
}

