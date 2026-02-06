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

const OH_NN_INVALID_PARAMETER = 2;

export default function ActsNeuralNetworkRuntimeTypeTest2() {
  describe('ActsNeuralNetworkRuntimeTypeTest2', () => {

    /**
     * @tc.name   NnrtOpTypeTopK002
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSTOPK_0200
     * @tc.desc   test OH_NN_OPS_TOP_K
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeTopK002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeTopK002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_TOP_K", false);
        console.info("====>NnrtOpTypeTopK002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeTopK002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeArgMax001
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSARGMAX_0100
     * @tc.desc   test OH_NN_OPS_ARG_MAX
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeArgMax001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeArgMax001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_ARG_MAX", true);
        console.info("====>NnrtOpTypeArgMax001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeArgMax001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeArgMax002
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSARGMAX_0200
     * @tc.desc   test OH_NN_OPS_ARG_MAX
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeArgMax002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeArgMax002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_ARG_MAX", false);
        console.info("====>NnrtOpTypeArgMax002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeArgMax002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeUnsqueeze001
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSUNSQUEEZE_0100
     * @tc.desc   test OH_NN_OPS_UNSQUEEZE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeUnsqueeze001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeUnsqueeze001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_UNSQUEEZE", true);
        console.info("====>NnrtOpTypeUnsqueeze001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeUnsqueeze001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeUnsqueeze002
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSUNSQUEEZE_0200
     * @tc.desc   test OH_NN_OPS_UNSQUEEZE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeUnsqueeze002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeUnsqueeze002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_UNSQUEEZE", false);
        console.info("====>NnrtOpTypeUnsqueeze002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeUnsqueeze002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeGelu001
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSGELU_0100
     * @tc.desc   test OH_NN_OPS_GELU
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeGelu001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeGelu001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_GELU", true);
        console.info("====>NnrtOpTypeGelu001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeGelu001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeGelu002
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSGELU_0200
     * @tc.desc   test OH_NN_OPS_GELU
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeGelu002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeGelu002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_GELU", false);
        console.info("====>NnrtOpTypeGelu002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeGelu002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeUnstack001
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSUNSTACK_0100
     * @tc.desc   test OH_NN_OPS_UNSTACK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeUnstack001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeUnstack001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_UNSTACK", true);
        console.info("====>NnrtOpTypeUnstack001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeUnstack001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeUnstack002
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSUNSTACK_0200
     * @tc.desc   test OH_NN_OPS_UNSTACK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeUnstack002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeUnstack002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_UNSTACK", false);
        console.info("====>NnrtOpTypeUnstack002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeUnstack002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeAbs001
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSABS_0100
     * @tc.desc   test OH_NN_OPS_ABS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeAbs001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeAbs001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_ABS", true);
        console.info("====>NnrtOpTypeAbs001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeAbs001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeAbs002
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSABS_0200
     * @tc.desc   test OH_NN_OPS_ABS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeAbs002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeAbs002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_ABS", false);
        console.info("====>NnrtOpTypeAbs002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeAbs002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeErf001
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSERF_0100
     * @tc.desc   test OH_NN_OPS_ERF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeErf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeErf001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_ERF", true);
        console.info("====>NnrtOpTypeErf001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeErf001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeErf002
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSERF_0200
     * @tc.desc   test OH_NN_OPS_ERF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeErf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeErf002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_ERF", false);
        console.info("====>NnrtOpTypeErf002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeErf002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeExp001
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSEXP_0100
     * @tc.desc   test OH_NN_OPS_EXP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeExp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeExp001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_EXP", true);
        console.info("====>NnrtOpTypeExp001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeExp001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeExp002
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSEXP_0200
     * @tc.desc   test OH_NN_OPS_EXP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeExp002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeExp002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_EXP", false);
        console.info("====>NnrtOpTypeExp002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeExp002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeLess001
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSLESS_0100
     * @tc.desc   test OH_NN_OPS_LESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeLess001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeLess001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_LESS", true);
        console.info("====>NnrtOpTypeLess001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeLess001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeLess002
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSLESS_0200
     * @tc.desc   test OH_NN_OPS_LESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeLess002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeLess002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_LESS", false);
        console.info("====>NnrtOpTypeLess002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeLess002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeSelect001
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSSELECT_0100
     * @tc.desc   test OH_NN_OPS_SELECT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeSelect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeSelect001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_SELECT", true);
        console.info("====>NnrtOpTypeSelect001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeSelect001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeSelect002
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSSELECT_0200
     * @tc.desc   test OH_NN_OPS_SELECT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeSelect002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeSelect002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_SELECT", false);
        console.info("====>NnrtOpTypeSelect002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeSelect002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeSquare001
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSSQUARE_0100
     * @tc.desc   test OH_NN_OPS_SQUARE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeSquare001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeSquare001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_SQUARE", true);
        console.info("====>NnrtOpTypeSquare001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeSquare001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeSquare002
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSSQUARE_0200
     * @tc.desc   test OH_NN_OPS_SQUARE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeSquare002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeSquare002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_SQUARE", false);
        console.info("====>NnrtOpTypeSquare002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeSquare002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeFlatten001
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSFLATTEN_0100
     * @tc.desc   test OH_NN_OPS_FLATTEN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeFlatten001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeFlatten001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_FLATTEN", true);
        console.info("====>NnrtOpTypeFlatten001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeFlatten001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeFlatten002
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSFLATTEN_0200
     * @tc.desc   test OH_NN_OPS_FLATTEN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeFlatten002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeFlatten002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_FLATTEN", false);
        console.info("====>NnrtOpTypeFlatten002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeFlatten002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeDepthToSpace001
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSDEPTHTOSPACE_0100
     * @tc.desc   test OH_NN_OPS_DEPTH_TO_SPACE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeDepthToSpace001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeDepthToSpace001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_DEPTH_TO_SPACE", true);
        console.info("====>NnrtOpTypeDepthToSpace001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeDepthToSpace001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeDepthToSpace002
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSDEPTHTOSPACE_0200
     * @tc.desc   test OH_NN_OPS_DEPTH_TO_SPACE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeDepthToSpace002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeDepthToSpace002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_DEPTH_TO_SPACE", false);
        console.info("====>NnrtOpTypeDepthToSpace002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeDepthToSpace002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeRange001
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSRANGE_0100
     * @tc.desc   test OH_NN_OPS_RANGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeRange001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeRange001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_RANGE", true);
        console.info("====>NnrtOpTypeRange001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeRange001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeRange002
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSRANGE_0200
     * @tc.desc   test OH_NN_OPS_RANGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeRange002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeRange002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_RANGE", false);
        console.info("====>NnrtOpTypeRange002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeRange002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeInstanceNorm001
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSINSTANCENORM_0100
     * @tc.desc   test OH_NN_OPS_INSTANCE_NORM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeInstanceNorm001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeInstanceNorm001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_INSTANCE_NORM", true);
        console.info("====>NnrtOpTypeInstanceNorm001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeInstanceNorm001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeInstanceNorm002
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSINSTANCENORM_0200
     * @tc.desc   test OH_NN_OPS_INSTANCE_NORM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeInstanceNorm002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeInstanceNorm002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_INSTANCE_NORM", false);
        console.info("====>NnrtOpTypeInstanceNorm002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeInstanceNorm002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeConstantOfShape001
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSCONSTANTOFSHAPE_0100
     * @tc.desc   test OH_NN_OPS_CONSTANT_OF_SHAPE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeConstantOfShape001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeConstantOfShape001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_CONSTANT_OF_SHAPE", true);
        console.info("====>NnrtOpTypeConstantOfShape001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeConstantOfShape001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeConstantOfShape002
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSCONSTANTOFSHAPE_0200
     * @tc.desc   test OH_NN_OPS_CONSTANT_OF_SHAPE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeConstantOfShape002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeConstantOfShape002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_CONSTANT_OF_SHAPE", false);
        console.info("====>NnrtOpTypeConstantOfShape002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeConstantOfShape002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeBroadcastTo001
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSBROADCASTTO_0100
     * @tc.desc   test OH_NN_OPS_BROADCAST_TO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeBroadcastTo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeBroadcastTo001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_BROADCAST_TO", true);
        console.info("====>NnrtOpTypeBroadcastTo001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeBroadcastTo001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeBroadcastTo002
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSBROADCASTTO_0200
     * @tc.desc   test OH_NN_OPS_BROADCAST_TO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeBroadcastTo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeBroadcastTo002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_BROADCAST_TO", false);
        console.info("====>NnrtOpTypeBroadcastTo002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeBroadcastTo002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeEqual001
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSEQUAL_0100
     * @tc.desc   test OH_NN_OPS_EQUAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeEqual001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeEqual001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_EQUAL", true);
        console.info("====>NnrtOpTypeEqual001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeEqual001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeEqual002
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSEQUAL_0200
     * @tc.desc   test OH_NN_OPS_EQUAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeEqual002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeEqual002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_EQUAL", false);
        console.info("====>NnrtOpTypeEqual002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeEqual002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeGreater001
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSGREATER_0100
     * @tc.desc   test OH_NN_OPS_GREATER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeGreater001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeGreater001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_GREATER", true);
        console.info("====>NnrtOpTypeGreater001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeGreater001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeGreater002
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSGREATER_0200
     * @tc.desc   test OH_NN_OPS_GREATER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeGreater002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeGreater002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_GREATER", false);
        console.info("====>NnrtOpTypeGreater002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeGreater002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeNotEqual001
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSNOTEQUAL_0100
     * @tc.desc   test OH_NN_OPS_NOT_EQUAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeNotEqual001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeNotEqual001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_NOT_EQUAL", true);
        console.info("====>NnrtOpTypeNotEqual001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeNotEqual001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeNotEqual002
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSNOTEQUAL_0200
     * @tc.desc   test OH_NN_OPS_NOT_EQUAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeNotEqual002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeNotEqual002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_NOT_EQUAL", false);
        console.info("====>NnrtOpTypeNotEqual002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeNotEqual002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeGreaterEqual001
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSGREATEREQUAL_0100
     * @tc.desc   test OH_NN_OPS_GREATER_EQUAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeGreaterEqual001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeGreaterEqual001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_GREATER_EQUAL", true);
        console.info("====>NnrtOpTypeGreaterEqual001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeGreaterEqual001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeGreaterEqual002
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSGREATEREQUAL_0200
     * @tc.desc   test OH_NN_OPS_GREATER_EQUAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeGreaterEqual002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeGreaterEqual002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_GREATER_EQUAL", false);
        console.info("====>NnrtOpTypeGreaterEqual002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeGreaterEqual002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeLeakyRelu001
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSLEAKYRELU_0100
     * @tc.desc   test OH_NN_OPS_LEAKY_RELU
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeLeakyRelu001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeLeakyRelu001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_LEAKY_RELU", true);
        console.info("====>NnrtOpTypeLeakyRelu001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeLeakyRelu001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeLeakyRelu002
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSLEAKYRELU_0200
     * @tc.desc   test OH_NN_OPS_LEAKY_RELU
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeLeakyRelu002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeLeakyRelu002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_LEAKY_RELU", false);
        console.info("====>NnrtOpTypeLeakyRelu002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeLeakyRelu002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeLstm001
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSLSTM_0100
     * @tc.desc   test OH_NN_OPS_LSTM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeLstm001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeLstm001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_LSTM", true);
        console.info("====>NnrtOpTypeLstm001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeLstm001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeLstm002
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSLSTM_0200
     * @tc.desc   test OH_NN_OPS_LSTM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeLstm002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeLstm002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_LSTM", false);
        console.info("====>NnrtOpTypeLstm002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeLstm002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeClip001
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSCLIP_0100
     * @tc.desc   test OH_NN_OPS_CLIP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeClip001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeClip001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_CLIP", true);
        console.info("====>NnrtOpTypeClip001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeClip001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeClip002
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSCLIP_0200
     * @tc.desc   test OH_NN_OPS_CLIP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeClip002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeClip002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_CLIP", false);
        console.info("====>NnrtOpTypeClip002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeClip002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeAll001
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSALL_0100
     * @tc.desc   test OH_NN_OPS_ALL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeAll001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeAll001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_ALL", true);
        console.info("====>NnrtOpTypeAll001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeAll001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeAll002
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSALL_0200
     * @tc.desc   test OH_NN_OPS_ALL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeAll002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeAll002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_ALL", false);
        console.info("====>NnrtOpTypeAll002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeAll002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeAssert001
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSASSERT_0100
     * @tc.desc   test OH_NN_OPS_ASSERT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeAssert001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeAssert001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_ASSERT", true);
        console.info("====>NnrtOpTypeAssert001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeAssert001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeAssert002
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSASSERT_0200
     * @tc.desc   test OH_NN_OPS_ASSERT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeAssert002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeAssert002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_ASSERT", false);
        console.info("====>NnrtOpTypeAssert002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeAssert002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeCos001
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSCOS_0100
     * @tc.desc   test OH_NN_OPS_COS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeCos001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeCos001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_COS", true);
        console.info("====>NnrtOpTypeCos001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeCos001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeCos002
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSCOS_0200
     * @tc.desc   test OH_NN_OPS_COS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeCos002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeCos002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_COS", false);
        console.info("====>NnrtOpTypeCos002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeCos002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeLog001
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSLOG_0100
     * @tc.desc   test OH_NN_OPS_LOG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeLog001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeLog001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_LOG", true);
        console.info("====>NnrtOpTypeLog001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeLog001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeLog002
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSLOG_0200
     * @tc.desc   test OH_NN_OPS_LOG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeLog002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeLog002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_LOG", false);
        console.info("====>NnrtOpTypeLog002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeLog002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeLogicalAnd001
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSLOGICALAND_0100
     * @tc.desc   test OH_NN_OPS_LOGICAL_AND
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeLogicalAnd001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeLogicalAnd001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_LOGICAL_AND", true);
        console.info("====>NnrtOpTypeLogicalAnd001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeLogicalAnd001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeLogicalAnd002
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSLOGICALAND_0200
     * @tc.desc   test OH_NN_OPS_LOGICAL_AND
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeLogicalAnd002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeLogicalAnd002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_LOGICAL_AND", false);
        console.info("====>NnrtOpTypeLogicalAnd002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeLogicalAnd002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeLogicalNot001
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSLOGICALNOT_0100
     * @tc.desc   test OH_NN_OPS_LOGICAL_NOT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeLogicalNot001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeLogicalNot001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_LOGICAL_NOT", true);
        console.info("====>NnrtOpTypeLogicalNot001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeLogicalNot001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeLogicalNot002
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSLOGICALNOT_0200
     * @tc.desc   test OH_NN_OPS_LOGICAL_NOT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeLogicalNot002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeLogicalNot002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_LOGICAL_NOT", false);
        console.info("====>NnrtOpTypeLogicalNot002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeLogicalNot002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeMod001
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSMOD_0100
     * @tc.desc   test OH_NN_OPS_MOD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeMod001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeMod001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_MOD", true);
        console.info("====>NnrtOpTypeMod001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeMod001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeMod002
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSMOD_0200
     * @tc.desc   test OH_NN_OPS_MOD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeMod002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeMod002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_MOD", false);
        console.info("====>NnrtOpTypeMod002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeMod002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeNeg001
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSNEG_0100
     * @tc.desc   test OH_NN_OPS_NEG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeNeg001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeNeg001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_NEG", true);
        console.info("====>NnrtOpTypeNeg001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeNeg001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeNeg002
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSNEG_0200
     * @tc.desc   test OH_NN_OPS_NEG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeNeg002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeNeg002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_NEG", false);
        console.info("====>NnrtOpTypeNeg002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeNeg002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeReciprocal001
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSRECIPROCAL_0100
     * @tc.desc   test OH_NN_OPS_RECIPROCAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeReciprocal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeReciprocal001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_RECIPROCAL", true);
        console.info("====>NnrtOpTypeReciprocal001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeReciprocal001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeReciprocal002
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSRECIPROCAL_0200
     * @tc.desc   test OH_NN_OPS_RECIPROCAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeReciprocal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeReciprocal002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_RECIPROCAL", false);
        console.info("====>NnrtOpTypeReciprocal002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeReciprocal002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeSin001
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSSIN_0100
     * @tc.desc   test OH_NN_OPS_SIN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeSin001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeSin001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_SIN", true);
        console.info("====>NnrtOpTypeSin001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeSin001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeSin002
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSSIN_0200
     * @tc.desc   test OH_NN_OPS_SIN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeSin002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeSin002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_SIN", false);
        console.info("====>NnrtOpTypeSin002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeSin002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeWhere001
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSWHERE_0100
     * @tc.desc   test OH_NN_OPS_WHERE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeWhere001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeWhere001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_WHERE", true);
        console.info("====>NnrtOpTypeWhere001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeWhere001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeWhere002
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSWHERE_0200
     * @tc.desc   test OH_NN_OPS_WHERE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeWhere002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeWhere002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_WHERE", false);
        console.info("====>NnrtOpTypeWhere002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeWhere002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeSparseToDense001
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSSPARSETODENSE_0100
     * @tc.desc   test OH_NN_OPS_SPARSE_TO_DENSE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeSparseToDense001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeSparseToDense001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_SPARSE_TO_DENSE", true);
        console.info("====>NnrtOpTypeSparseToDense001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeSparseToDense001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeSparseToDense002
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSSPARSETODENSE_0200
     * @tc.desc   test OH_NN_OPS_SPARSE_TO_DENSE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeSparseToDense002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeSparseToDense002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_SPARSE_TO_DENSE", false);
        console.info("====>NnrtOpTypeSparseToDense002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeSparseToDense002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeLogicalOr001
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSLOGICALOR_0100
     * @tc.desc   test OH_NN_OPS_LOGICAL_OR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeLogicalOr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeLogicalOr001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_LOGICAL_OR", true);
        console.info("====>NnrtOpTypeLogicalOr001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeLogicalOr001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeLogicalOr002
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSLOGICALOR_0200
     * @tc.desc   test OH_NN_OPS_LOGICAL_OR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeLogicalOr002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeLogicalOr002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_LOGICAL_OR", false);
        console.info("====>NnrtOpTypeLogicalOr002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeLogicalOr002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeCeil001
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSCEIL_0100
     * @tc.desc   test OH_NN_OPS_CEIL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeCeil001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeCeil001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_CEIL", true);
        console.info("====>NnrtOpTypeCeil001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeCeil001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeCeil002
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSCEIL_0200
     * @tc.desc   test OH_NN_OPS_CEIL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeCeil002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeCeil002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_CEIL", false);
        console.info("====>NnrtOpTypeCeil002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeCeil002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeCrop001
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSCROP_0100
     * @tc.desc   test OH_NN_OPS_CROP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeCrop001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeCrop001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_CROP", true);
        console.info("====>NnrtOpTypeCrop001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeCrop001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeCrop002
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSCROP_0200
     * @tc.desc   test OH_NN_OPS_CROP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeCrop002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeCrop002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_CROP", false);
        console.info("====>NnrtOpTypeCrop002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeCrop002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeDetectionPostProcess001
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSDETECTIONPOSTPROCESS_0100
     * @tc.desc   test OH_NN_OPS_DETECTION_POST_PROCESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeDetectionPostProcess001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeDetectionPostProcess001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_DETECTION_POST_PROCESS", true);
        console.info("====>NnrtOpTypeDetectionPostProcess001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeDetectionPostProcess001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeDetectionPostProcess002
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSDETECTIONPOSTPROCESS_0200
     * @tc.desc   test OH_NN_OPS_DETECTION_POST_PROCESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeDetectionPostProcess002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeDetectionPostProcess002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_DETECTION_POST_PROCESS",
          false);
        console.info("====>NnrtOpTypeDetectionPostProcess002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeDetectionPostProcess002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeFloor001
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSFLOOR_0100
     * @tc.desc   test OH_NN_OPS_FLOOR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeFloor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeFloor001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_FLOOR", true);
        console.info("====>NnrtOpTypeFloor001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeFloor001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeFloor002
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSFLOOR_0200
     * @tc.desc   test OH_NN_OPS_FLOOR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeFloor002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeFloor002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_FLOOR", false);
        console.info("====>NnrtOpTypeFloor002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeFloor002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeL2Normalize001
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSL2NORMALIZE_0100
     * @tc.desc   test OH_NN_OPS_L2_NORMALIZE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeL2Normalize001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeL2Normalize001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_L2_NORMALIZE", true);
        console.info("====>NnrtOpTypeL2Normalize001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeL2Normalize001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeL2Normalize002
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSL2NORMALIZE_0200
     * @tc.desc   test OH_NN_OPS_L2_NORMALIZE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeL2Normalize002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeL2Normalize002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_L2_NORMALIZE", false);
        console.info("====>NnrtOpTypeL2Normalize002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeL2Normalize002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeLogSoftmax001
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSLOGSOFTMAX_0100
     * @tc.desc   test OH_NN_OPS_LOG_SOFTMAX
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeLogSoftmax001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeLogSoftmax001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_LOG_SOFTMAX", true);
        console.info("====>NnrtOpTypeLogSoftmax001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeLogSoftmax001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeLogSoftmax002
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSLOGSOFTMAX_0200
     * @tc.desc   test OH_NN_OPS_LOG_SOFTMAX
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeLogSoftmax002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeLogSoftmax002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_LOG_SOFTMAX", false);
        console.info("====>NnrtOpTypeLogSoftmax002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeLogSoftmax002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeLrn001
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSLRN_0100
     * @tc.desc   test OH_NN_OPS_LRN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeLrn001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeLrn001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_LRN", true);
        console.info("====>NnrtOpTypeLrn001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeLrn001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeLrn002
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSLRN_0200
     * @tc.desc   test OH_NN_OPS_LRN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeLrn002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeLrn002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_LRN", false);
        console.info("====>NnrtOpTypeLrn002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeLrn002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeMinimum001
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSMINIMUM_0100
     * @tc.desc   test OH_NN_OPS_MINIMUM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeMinimum001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeMinimum001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_MINIMUM", true);
        console.info("====>NnrtOpTypeMinimum001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeMinimum001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeMinimum002
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSMINIMUM_0200
     * @tc.desc   test OH_NN_OPS_MINIMUM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeMinimum002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeMinimum002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_MINIMUM", false);
        console.info("====>NnrtOpTypeMinimum002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeMinimum002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeRank001
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSRANK_0100
     * @tc.desc   test OH_NN_OPS_RANK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeRank001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeRank001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_RANK", true);
        console.info("====>NnrtOpTypeRank001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeRank001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeRank002
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSRANK_0200
     * @tc.desc   test OH_NN_OPS_RANK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeRank002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeRank002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_RANK", false);
        console.info("====>NnrtOpTypeRank002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeRank002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeReduceMax001
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSREDUCEMAX_0100
     * @tc.desc   test OH_NN_OPS_REDUCE_MAX
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeReduceMax001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeReduceMax001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_REDUCE_MAX", true);
        console.info("====>NnrtOpTypeReduceMax001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeReduceMax001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeReduceMax002
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSREDUCEMAX_0200
     * @tc.desc   test OH_NN_OPS_REDUCE_MAX
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeReduceMax002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeReduceMax002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_REDUCE_MAX", false);
        console.info("====>NnrtOpTypeReduceMax002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeReduceMax002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeReduceMin001
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSREDUCEMIN_0100
     * @tc.desc   test OH_NN_OPS_REDUCE_MIN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeReduceMin001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeReduceMin001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_REDUCE_MIN", true);
        console.info("====>NnrtOpTypeReduceMin001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeReduceMin001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeReduceMin002
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSREDUCEMIN_0200
     * @tc.desc   test OH_NN_OPS_REDUCE_MIN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeReduceMin002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeReduceMin002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_REDUCE_MIN", false);
        console.info("====>NnrtOpTypeReduceMin002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeReduceMin002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeReduceSum001
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSREDUCESUM_0100
     * @tc.desc   test OH_NN_OPS_REDUCE_SUM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeReduceSum001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeReduceSum001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_REDUCE_SUM", true);
        console.info("====>NnrtOpTypeReduceSum001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeReduceSum001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeReduceSum002
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSREDUCESUM_0200
     * @tc.desc   test OH_NN_OPS_REDUCE_SUM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeReduceSum002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeReduceSum002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_REDUCE_SUM", false);
        console.info("====>NnrtOpTypeReduceSum002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeReduceSum002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeRound001
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSROUND_0100
     * @tc.desc   test OH_NN_OPS_ROUND
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeRound001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeRound001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_ROUND", true);
        console.info("====>NnrtOpTypeRound001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeRound001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeRound002
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSROUND_0200
     * @tc.desc   test OH_NN_OPS_ROUND
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeRound002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeRound002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_ROUND", false);
        console.info("====>NnrtOpTypeRound002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeRound002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeScatterNd001
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSSCATTERND_0100
     * @tc.desc   test OH_NN_OPS_SCATTER_ND
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeScatterNd001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeScatterNd001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_SCATTER_ND", true);
        console.info("====>NnrtOpTypeScatterNd001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeScatterNd001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeScatterNd002
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSSCATTERND_0200
     * @tc.desc   test OH_NN_OPS_SCATTER_ND
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeScatterNd002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeScatterNd002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_SCATTER_ND", false);
        console.info("====>NnrtOpTypeScatterNd002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeScatterNd002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeSpaceToDepth001
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSSPACETODEPTH_0100
     * @tc.desc   test OH_NN_OPS_SPACE_TO_DEPTH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeSpaceToDepth001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeSpaceToDepth001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_SPACE_TO_DEPTH", true);
        console.info("====>NnrtOpTypeSpaceToDepth001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeSpaceToDepth001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeSpaceToDepth002
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSSPACETODEPTH_0200
     * @tc.desc   test OH_NN_OPS_SPACE_TO_DEPTH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeSpaceToDepth002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeSpaceToDepth002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_SPACE_TO_DEPTH", false);
        console.info("====>NnrtOpTypeSpaceToDepth002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeSpaceToDepth002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeSwish001
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSSWISH_0100
     * @tc.desc   test OH_NN_OPS_SWISH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeSwish001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeSwish001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_SWISH", true);
        console.info("====>NnrtOpTypeSwish001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeSwish001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeSwish002
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSSWISH_0200
     * @tc.desc   test OH_NN_OPS_SWISH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeSwish002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeSwish002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_SWISH", false);
        console.info("====>NnrtOpTypeSwish002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeSwish002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeReduceL2001
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSREDUCEL2_0100
     * @tc.desc   test OH_NN_OPS_REDUCE_L2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeReduceL2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeReduceL2001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_REDUCE_L2", true);
        console.info("====>NnrtOpTypeReduceL2001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeReduceL2001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeReduceL2002
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSREDUCEL2_0200
     * @tc.desc   test OH_NN_OPS_REDUCE_L2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeReduceL2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeReduceL2002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_REDUCE_L2", false);
        console.info("====>NnrtOpTypeReduceL2002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeReduceL2002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeHardSigmoid001
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSHARDSIGMOID_0100
     * @tc.desc   test OH_NN_OPS_HARD_SIGMOID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeHardSigmoid001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeHardSigmoid001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_HARD_SIGMOID", true);
        console.info("====>NnrtOpTypeHardSigmoid001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeHardSigmoid001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeHardSigmoid002
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSHARDSIGMOID_0200
     * @tc.desc   test OH_NN_OPS_HARD_SIGMOID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeHardSigmoid002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeHardSigmoid002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_HARD_SIGMOID", false);
        console.info("====>NnrtOpTypeHardSigmoid002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeHardSigmoid002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeGatherNd001
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSGATHERND_0100
     * @tc.desc   test OH_NN_OPS_GATHER_ND
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeGatherNd001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeGatherNd001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_GATHER_ND", true);
        console.info("====>NnrtOpTypeGatherNd001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeGatherNd001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtOpTypeGatherNd002
     * @tc.number SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSGATHERND_0200
     * @tc.desc   test OH_NN_OPS_GATHER_ND
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtOpTypeGatherNd002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeGatherNd002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_GATHER_ND", false);
        console.info("====>NnrtOpTypeGatherNd002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeGatherNd002 catch err: " + err);
      }
    })
  })
}
