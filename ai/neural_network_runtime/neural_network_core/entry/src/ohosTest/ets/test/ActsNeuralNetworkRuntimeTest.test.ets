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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import neuralnetworkcoretest from 'libneuralnetworkcoretest.so'

const OH_NN_SUCCESS = 0;
const OH_NN_INVALID_PARAMETER = 2;

export default function ActsNeuralNetworkRuntimeTest() {
  describe('ActsNeuralNetworkRuntimeTest', () => {

    /**
     * @tc.name   NnrtTensorQuantParamSetScales001
     * @tc.number SUB_NEURALNETWORKRUNTIME_QUANTPARAMSETSCALES_0100
     * @tc.desc   set scales on OH_NNQuantParam implement return success code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtTensorQuantParamSetScales001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtTensorQuantParamSetScales001 start====");
        let result : number = neuralnetworkcoretest.NNQuantParam_SetScalesA();
        console.info("====>NnrtTensorQuantParamSetScales001 result: " + result);
        expect(result).assertEqual(OH_NN_SUCCESS);
        done()
      } catch (err) {
        console.error("====>NnrtTensorQuantParamSetScales001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtTensorQuantParamSetScales002
     * @tc.number SUB_NEURALNETWORKRUNTIME_QUANTPARAMSETSCALES_0200
     * @tc.desc   set scales on OH_NNQuantParam implement return invalid parameter code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtTensorQuantParamSetScales002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtTensorQuantParamSetScales002 start====");
        let result : number = neuralnetworkcoretest.NNQuantParam_SetScalesB();
        console.info("====>NnrtTensorQuantParamSetScales002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtTensorQuantParamSetScales002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtTensorQuantParamSetScales003
     * @tc.number SUB_NEURALNETWORKRUNTIME_QUANTPARAMSETSCALES_0300
     * @tc.desc   set  on OH_NNQuantParam implement return invalid parameter code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtTensorQuantParamSetScales003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtTensorQuantParamSetScales003 start====");
        let result : number = neuralnetworkcoretest.NNQuantParam_SetScalesC();
        console.info("====>NnrtTensorQuantParamSetScales003 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtTensorQuantParamSetScales003 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtTensorQuantParamSetScales004
     * @tc.number SUB_NEURALNETWORKRUNTIME_QUANTPARAMSETSCALES_0400
     * @tc.desc   set scales on OH_NNQuantParam implement return invalid parameter code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtTensorQuantParamSetScales004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtTensorQuantParamSetScales004 start====");
        let result : number = neuralnetworkcoretest.NNQuantParam_SetScalesD();
        console.info("====>NnrtTensorQuantParamSetScales004 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtTensorQuantParamSetScales004 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtTensorQuantParamSetZeroPoints001
     * @tc.number SUB_NEURALNETWORKRUNTIME_QUANTPARAMSETZEROPOINTS_0100
     * @tc.desc   set zero points on OH_NNQuantParam implement return success code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtTensorQuantParamSetZeroPoints001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtTensorQuantParamSetZeroPoints001 start====");
        let result : number = neuralnetworkcoretest.NNQuantParam_SetZeroPointsA();
        console.info("====>NnrtTensorQuantParamSetZeroPoints001 result: " + result);
        expect(result).assertEqual(OH_NN_SUCCESS);
        done()
      } catch (err) {
        console.error("====>NnrtTensorQuantParamSetZeroPoints001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtTensorQuantParamSetZeroPoints002
     * @tc.number SUB_NEURALNETWORKRUNTIME_QUANTPARAMSETZEROPOINTS_0200
     * @tc.desc   set zero points on OH_NNQuantParam implement return invalid parameter code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtTensorQuantParamSetZeroPoints002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtTensorQuantParamSetZeroPoints002 start====");
        let result : number = neuralnetworkcoretest.NNQuantParam_SetZeroPointsB();
        console.info("====>NnrtTensorQuantParamSetZeroPoints002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtTensorQuantParamSetZeroPoints002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtTensorQuantParamSetZeroPoints003
     * @tc.number SUB_NEURALNETWORKRUNTIME_QUANTPARAMSETZEROPOINTS_0300
     * @tc.desc   set zero points on OH_NNQuantParam implement return invalid parameter code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtTensorQuantParamSetZeroPoints003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtTensorQuantParamSetZeroPoints003 start====");
        let result : number = neuralnetworkcoretest.NNQuantParam_SetZeroPointsC();
        console.info("====>NnrtTensorQuantParamSetZeroPoints003 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtTensorQuantParamSetZeroPoints003 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtTensorQuantParamSetZeroPoints004
     * @tc.number SUB_NEURALNETWORKRUNTIME_QUANTPARAMSETZEROPOINTS_0400
     * @tc.desc   set zero points on OH_NNQuantParam implement return invalid parameter code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtTensorQuantParamSetZeroPoints004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtTensorQuantParamSetZeroPoints004 start====");
        let result : number = neuralnetworkcoretest.NNQuantParam_SetZeroPointsD();
        console.info("====>NnrtTensorQuantParamSetZeroPoints004 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtTensorQuantParamSetZeroPoints004 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtTensorQuantParamSetNumBits001
     * @tc.number SUB_NEURALNETWORKRUNTIME_QUANTPARAMSETNUMBITS_0100
     * @tc.desc   set number bits on OH_NNQuantParam implement return success code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtTensorQuantParamSetNumBits001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtTensorQuantParamSetNumBits001 start====");
        let result : number = neuralnetworkcoretest.NNQuantParam_SetNumBitsA();
        console.info("====>NnrtTensorQuantParamSetNumBits001 result: " + result);
        expect(result).assertEqual(OH_NN_SUCCESS);
        done()
      } catch (err) {
        console.error("====>NnrtTensorQuantParamSetNumBits001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtTensorQuantParamSetNumBits002
     * @tc.number SUB_NEURALNETWORKRUNTIME_QUANTPARAMSETNUMBITS_0200
     * @tc.desc   set number bits on OH_NNQuantParam implement return invalid parameter code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtTensorQuantParamSetNumBits002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtTensorQuantParamSetNumBits002 start====");
        let result : number = neuralnetworkcoretest.NNQuantParam_SetNumBitsB();
        console.info("====>NnrtTensorQuantParamSetNumBits002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtTensorQuantParamSetNumBits002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtTensorQuantParamSetNumBits003
     * @tc.number SUB_NEURALNETWORKRUNTIME_QUANTPARAMSETNUMBITS_0300
     * @tc.desc   set number bits on OH_NNQuantParam implement return invalid parameter code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtTensorQuantParamSetNumBits003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtTensorQuantParamSetNumBits003 start====");
        let result : number = neuralnetworkcoretest.NNQuantParam_SetNumBitsC();
        console.info("====>NnrtTensorQuantParamSetNumBits003 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtTensorQuantParamSetNumBits003 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtTensorQuantParamSetNumBits004
     * @tc.number SUB_NEURALNETWORKRUNTIME_QUANTPARAMSETNUMBITS_0400
     * @tc.desc   set number bits on OH_NNQuantParam implement return invalid parameter code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtTensorQuantParamSetNumBits004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtTensorQuantParamSetNumBits004 start====");
        let result : number = neuralnetworkcoretest.NNQuantParam_SetNumBitsD();
        console.info("====>NnrtTensorQuantParamSetNumBits004 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtTensorQuantParamSetNumBits004 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtTensorQuantParamDestroy001
     * @tc.number SUB_NEURALNETWORKRUNTIME_QUANTPARAMDESTROY_0100
     * @tc.desc   set number bits on OH_NNQuantParam implement return success code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtTensorQuantParamDestroy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtTensorQuantParamDestroy001 start====");
        let result : number = neuralnetworkcoretest.NNQuantParam_DestroyA();
        console.info("====>NnrtTensorQuantParamDestroy001 result: " + result);
        expect(result).assertEqual(OH_NN_SUCCESS);
        done()
      } catch (err) {
        console.error("====>NnrtTensorQuantParamDestroy001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtTensorQuantParamDestroy002
     * @tc.number SUB_NEURALNETWORKRUNTIME_QUANTPARAMDESTROY_0200
     * @tc.desc   destroy a OH_NNQuantParam implement return invalid parameter code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtTensorQuantParamDestroy002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtTensorQuantParamDestroy002 start====");
        let result : number = neuralnetworkcoretest.NNQuantParam_DestroyB();
        console.info("====>NnrtTensorQuantParamDestroy002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtTensorQuantParamDestroy002 catch err: " + err);
      }
    })
  })
}
