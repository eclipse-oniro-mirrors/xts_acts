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
const OH_NN_DYNAMIC_SHAPE = 13;

export default function ActsNeuralNetworkCoreTest() {
  describe('ActsNeuralNetworkCoreTest', () => {

    /**
     * @tc.name   NnrtTensorDescDestroy001
     * @tc.number SUB_NEURALNETWORKRUNTIME_TENSORDESCDESTROY_0100
     * @tc.desc   destroy a NN_TensorDesc implement return success code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtTensorDescDestroy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtTensorDescDestroy001 start====");
        let result : number = neuralnetworkcoretest.NNTensorDesc_DestroyA();
        console.info("====>NnrtTensorDescDestroy001 result: " + result);
        expect(result).assertEqual(OH_NN_SUCCESS);
        done()
      } catch (err) {
        console.error("====>NnrtTensorDescDestroy001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtTensorDescDestroy002
     * @tc.number SUB_NEURALNETWORKRUNTIME_TENSORDESCDESTROY_0200
     * @tc.desc   relase a NN_TensorDesc implement return invalid parameter code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtTensorDescDestroy002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtTensorDescDestroy002 start====");
        let result : number = neuralnetworkcoretest.NNTensorDesc_DestroyB();
        console.info("====>NnrtTensorDescDestroy002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtTensorDescDestroy002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtTensorDescSetName001
     * @tc.number SUB_NEURALNETWORKRUNTIME_TENSORDESCSETNAME_0100
     * @tc.desc   set name for NN_TensorDesc implement return success code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtTensorDescSetName001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtTensorDescSetName001 start====");
        let result : number = neuralnetworkcoretest.NNTensorDesc_SetNameA();
        console.info("====>NnrtTensorDescSetName001 result: " + result);
        expect(result).assertEqual(OH_NN_SUCCESS);
        done()
      } catch (err) {
        console.error("====>NnrtTensorDescSetName001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtTensorDescSetName002
     * @tc.number SUB_NEURALNETWORKRUNTIME_TENSORDESCSETNAME_0200
     * @tc.desc   set name for NN_TensorDesc implement return invalid parameter code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtTensorDescSetName002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtTensorDescSetName002 start====");
        let result : number = neuralnetworkcoretest.NNTensorDesc_SetNameB();
        console.info("====>NnrtTensorDescSetName002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtTensorDescSetName002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtTensorDescSetName003
     * @tc.number SUB_NEURALNETWORKRUNTIME_TENSORDESCSETNAME_0300
     * @tc.desc   set name for NN_TensorDesc implement return invalid parameter code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtTensorDescSetName003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtTensorDescSetName003 start====");
        let result : number = neuralnetworkcoretest.NNTensorDesc_SetNameC();
        console.info("====>NnrtTensorDescSetName003 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtTensorDescSetName003 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtTensorDescGetName001
     * @tc.number SUB_NEURALNETWORKRUNTIME_TENSORDESCGETNAME_0100
     * @tc.desc   get name from NN_TensorDesc implement return success code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtTensorDescGetName001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtTensorDescGetName001 start====");
        let result : number = neuralnetworkcoretest.NNTensorDesc_GetNameA();
        console.info("====>NnrtTensorDescGetName001 result: " + result);
        expect(result).assertEqual(OH_NN_SUCCESS);
        done()
      } catch (err) {
        console.error("====>NnrtTensorDescGetName001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtTensorDescGetName002
     * @tc.number SUB_NEURALNETWORKRUNTIME_TENSORDESCGETNAME_0200
     * @tc.desc   get name from NN_TensorDesc implement return invalid parameter code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtTensorDescGetName002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtTensorDescGetName002 start====");
        let result : number = neuralnetworkcoretest.NNTensorDesc_GetNameB();
        console.info("====>NnrtTensorDescGetName002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtTensorDescGetName002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtTensorDescGetName003
     * @tc.number SUB_NEURALNETWORKRUNTIME_TENSORDESCGETNAME_0300
     * @tc.desc   get name from NN_TensorDesc implement return invalid parameter code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtTensorDescGetName003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtTensorDescGetName003 start====");
        let result : number = neuralnetworkcoretest.NNTensorDesc_GetNameC();
        console.info("====>NnrtTensorDescGetName003 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtTensorDescGetName003 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtTensorDescSetDataType001
     * @tc.number SUB_NEURALNETWORKRUNTIME_TENSORDESCSETDATATYPE_0100
     * @tc.desc   set datatype for NN_TensorDesc implement return success code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtTensorDescSetDataType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtTensorDescSetDataType001 start====");
        let result : number = neuralnetworkcoretest.NNTensorDesc_SetDataTypeA();
        console.info("====>NnrtTensorDescSetDataType001 result: " + result);
        expect(result).assertEqual(OH_NN_SUCCESS);
        done()
      } catch (err) {
        console.error("====>NnrtTensorDescSetDataType001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtTensorDescSetDataType002
     * @tc.number SUB_NEURALNETWORKRUNTIME_TENSORDESCSETDATATYPE_0200
     * @tc.desc   set datatype for NN_TensorDesc implement return invalid parameter code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtTensorDescSetDataType002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtTensorDescSetDataType002 start====");
        let result : number = neuralnetworkcoretest.NNTensorDesc_SetDataTypeB();
        console.info("====>NnrtTensorDescSetDataType002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtTensorDescSetDataType002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtTensorDescGetDataType001
     * @tc.number SUB_NEURALNETWORKRUNTIME_TENSORDESCGETDATATYPE_0100
     * @tc.desc   set datatype for NN_TensorDesc implement return invalid parameter code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtTensorDescGetDataType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtTensorDescGetDataType001 start====");
        let result : number = neuralnetworkcoretest.NNTensorDesc_GetDataTypeA();
        console.info("====>NnrtTensorDescGetDataType001 result: " + result);
        expect(result).assertEqual(OH_NN_SUCCESS);
        done()
      } catch (err) {
        console.error("====>NnrtTensorDescGetDataType001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtTensorDescGetDataType002
     * @tc.number SUB_NEURALNETWORKRUNTIME_TENSORDESCGETDATATYPE_0200
     * @tc.desc   set datatype for NN_TensorDesc implement return invalid parameter code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtTensorDescGetDataType002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtTensorDescGetDataType002 start====");
        let result : number = neuralnetworkcoretest.NNTensorDesc_GetDataTypeB();
        console.info("====>NnrtTensorDescGetDataType002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtTensorDescGetDataType002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtTensorDescGetDataType003
     * @tc.number SUB_NEURALNETWORKRUNTIME_TENSORDESCGETDATATYPE_0300
     * @tc.desc   set datatype for NN_TensorDesc implement return invalid parameter code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtTensorDescGetDataType003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtTensorDescGetDataType003 start====");
        let result : number = neuralnetworkcoretest.NNTensorDesc_GetDataTypeC();
        console.info("====>NnrtTensorDescGetDataType003 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtTensorDescGetDataType003 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtTensorDescSetShape001
     * @tc.number SUB_NEURALNETWORKRUNTIME_TENSORDESCSETSHAPE_0100
     * @tc.desc   set shape for NN_TensorDesc implement return success code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtTensorDescSetShape001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtTensorDescSetShape001 start====");
        let result : number = neuralnetworkcoretest.NNTensorDesc_SetShapeA();
        console.info("====>NnrtTensorDescSetShape001 result: " + result);
        expect(result).assertEqual(OH_NN_SUCCESS);
        done()
      } catch (err) {
        console.error("====>NnrtTensorDescSetShape001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtTensorDescSetShape002
     * @tc.number SUB_NEURALNETWORKRUNTIME_TENSORDESCSETSHAPE_0200
     * @tc.desc   set shape for NN_TensorDesc implement return invalid parameter code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtTensorDescSetShape002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtTensorDescSetShape002 start====");
        let result : number = neuralnetworkcoretest.NNTensorDesc_SetShapeB();
        console.info("====>NnrtTensorDescSetShape002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtTensorDescSetShape002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtTensorDescSetShape003
     * @tc.number SUB_NEURALNETWORKRUNTIME_TENSORDESCSETSHAPE_0300
     * @tc.desc   set shape for NN_TensorDesc implement return invalid parameter code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtTensorDescSetShape003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtTensorDescSetShape003 start====");
        let result : number = neuralnetworkcoretest.NNTensorDesc_SetShapeC();
        console.info("====>NnrtTensorDescSetShape003 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtTensorDescSetShape003 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtTensorDescSetShape004
     * @tc.number SUB_NEURALNETWORKRUNTIME_TENSORDESCSETSHAPE_0400
     * @tc.desc   set shape for NN_TensorDesc implement return invalid parameter code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtTensorDescSetShape004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtTensorDescSetShape004 start====");
        let result : number = neuralnetworkcoretest.NNTensorDesc_SetShapeD();
        console.info("====>NnrtTensorDescSetShape004 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtTensorDescSetShape004 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtTensorDescGetShape001
     * @tc.number SUB_NEURALNETWORKRUNTIME_TENSORDESCGETSHAPE_0100
     * @tc.desc   get shape from NN_TensorDesc implement return success code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtTensorDescGetShape001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtTensorDescGetShape001 start====");
        let result : number = neuralnetworkcoretest.NNTensorDesc_GetShapeA();
        console.info("====>NnrtTensorDescGetShape001 result: " + result);
        expect(result).assertEqual(OH_NN_SUCCESS);
        done()
      } catch (err) {
        console.error("====>NnrtTensorDescGetShape001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtTensorDescGetShape002
     * @tc.number SUB_NEURALNETWORKRUNTIME_TENSORDESCGETSHAPE_0200
     * @tc.desc   get shape from NN_TensorDesc implement return invalid parameter code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtTensorDescGetShape002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtTensorDescGetShape002 start====");
        let result : number = neuralnetworkcoretest.NNTensorDesc_GetShapeB();
        console.info("====>NnrtTensorDescGetShape002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtTensorDescGetShape002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtTensorDescGetShape003
     * @tc.number SUB_NEURALNETWORKRUNTIME_TENSORDESCGETSHAPE_0300
     * @tc.desc   get shape from NN_TensorDesc implement return invalid parameter code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtTensorDescGetShape003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtTensorDescGetShape003 start====");
        let result : number = neuralnetworkcoretest.NNTensorDesc_GetShapeC();
        console.info("====>NnrtTensorDescGetShape003 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtTensorDescGetShape003 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtTensorDescGetShape004
     * @tc.number SUB_NEURALNETWORKRUNTIME_TENSORDESCGETSHAPE_0400
     * @tc.desc   get shape from NN_TensorDesc implement return invalid parameter code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtTensorDescGetShape004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtTensorDescGetShape004 start====");
        let result : number = neuralnetworkcoretest.NNTensorDesc_GetShapeD();
        console.info("====>NnrtTensorDescGetShape004 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtTensorDescGetShape004 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtTensorDescSetFormat001
     * @tc.number SUB_NEURALNETWORKRUNTIME_TENSORDESCSETFORMAT_0100
     * @tc.desc   set format for NN_TensorDesc implement return success code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtTensorDescSetFormat001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtTensorDescSetFormat001 start====");
        let result : number = neuralnetworkcoretest.NNTensorDesc_SetFormatA();
        console.info("====>NnrtTensorDescSetFormat001 result: " + result);
        expect(result).assertEqual(OH_NN_SUCCESS);
        done()
      } catch (err) {
        console.error("====>NnrtTensorDescSetFormat001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtTensorDescSetFormat002
     * @tc.number SUB_NEURALNETWORKRUNTIME_TENSORDESCSETFORMAT_0200
     * @tc.desc   set format for NN_TensorDesc implement return invalid parameter code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtTensorDescSetFormat002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtTensorDescSetFormat002 start====");
        let result : number = neuralnetworkcoretest.NNTensorDesc_SetFormatB();
        console.info("====>NnrtTensorDescSetFormat002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtTensorDescSetFormat002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtTensorDescGetFormat001
     * @tc.number SUB_NEURALNETWORKRUNTIME_TENSORDESCGETFORMAT_0100
     * @tc.desc   get format from NN_TensorDesc implement success code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtTensorDescGetFormat001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtTensorDescGetFormat001 start====");
        let result : number = neuralnetworkcoretest.NNTensorDesc_GetFormatA();
        console.info("====>NnrtTensorDescGetFormat001 result: " + result);
        expect(result).assertEqual(OH_NN_SUCCESS);
        done()
      } catch (err) {
        console.error("====>NnrtTensorDescGetFormat001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtTensorDescGetFormat002
     * @tc.number SUB_NEURALNETWORKRUNTIME_TENSORDESCGETFORMAT_0200
     * @tc.desc   get format from NN_TensorDesc implement invalid parameter code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtTensorDescGetFormat002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtTensorDescGetFormat002 start====");
        let result : number = neuralnetworkcoretest.NNTensorDesc_GetFormatB();
        console.info("====>NnrtTensorDescGetFormat002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtTensorDescGetFormat002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtTensorDescGetFormat003
     * @tc.number SUB_NEURALNETWORKRUNTIME_TENSORDESCGETFORMAT_0300
     * @tc.desc   get format from NN_TensorDesc implement invalid parameter code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtTensorDescGetFormat003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtTensorDescGetFormat003 start====");
        let result : number = neuralnetworkcoretest.NNTensorDesc_GetFormatC();
        console.info("====>NnrtTensorDescGetFormat003 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtTensorDescGetFormat003 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtTensorDescGetElementCount001
     * @tc.number SUB_NEURALNETWORKRUNTIME_TENSORDESCGETELEMENTCOUNT_0100
     * @tc.desc   get element count from NN_TensorDesc implement success code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtTensorDescGetElementCount001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtTensorDescGetElementCount001 start====");
        let result : number = neuralnetworkcoretest.NNTensorDesc_GetElementCountA();
        console.info("====>NnrtTensorDescGetElementCount001 result: " + result);
        expect(result).assertEqual(OH_NN_SUCCESS);
        done()
      } catch (err) {
        console.error("====>NnrtTensorDescGetElementCount001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtTensorDescGetElementCount002
     * @tc.number SUB_NEURALNETWORKRUNTIME_TENSORDESCGETELEMENTCOUNT_0200
     * @tc.desc   get element count from NN_TensorDesc implement invalid parameter code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtTensorDescGetElementCount002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtTensorDescGetElementCount002 start====");
        let result : number = neuralnetworkcoretest.NNTensorDesc_GetElementCountB();
        console.info("====>NnrtTensorDescGetElementCount002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtTensorDescGetElementCount002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtTensorDescGetElementCount003
     * @tc.number SUB_NEURALNETWORKRUNTIME_TENSORDESCGETELEMENTCOUNT_0300
     * @tc.desc   get element count from NN_TensorDesc implement invalid parameter code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtTensorDescGetElementCount003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtTensorDescGetElementCount003 start====");
        let result : number = neuralnetworkcoretest.NNTensorDesc_GetElementCountC();
        console.info("====>NnrtTensorDescGetElementCount003 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtTensorDescGetElementCount003 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtTensorDescGetElementCount004
     * @tc.number SUB_NEURALNETWORKRUNTIME_TENSORDESCGETELEMENTCOUNT_0400
     * @tc.desc   get element count from NN_TensorDesc implement invalid parameter code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtTensorDescGetElementCount004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtTensorDescGetElementCount004 start====");
        let result : number = neuralnetworkcoretest.NNTensorDesc_GetElementCountD();
        console.info("====>NnrtTensorDescGetElementCount004 result: " + result);
        expect(result).assertEqual(OH_NN_DYNAMIC_SHAPE);
        done()
      } catch (err) {
        console.error("====>NnrtTensorDescGetElementCount004 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtTensorDescGetByteSize001
     * @tc.number SUB_NEURALNETWORKRUNTIME_TENSORDESCGETBYTESIZE_0100
     * @tc.desc   get byte size count from NN_TensorDesc implement success code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtTensorDescGetByteSize001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtTensorDescGetByteSize001 start====");
        let result : number = neuralnetworkcoretest.NNTensorDesc_GetByteSizeA();
        console.info("====>NnrtTensorDescGetByteSize001 result: " + result);
        expect(result).assertEqual(OH_NN_SUCCESS);
        done()
      } catch (err) {
        console.error("====>NnrtTensorDescGetByteSize001 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtTensorDescGetByteSize002
     * @tc.number SUB_NEURALNETWORKRUNTIME_TENSORDESCGETBYTESIZE_0200
     * @tc.desc   get byte size count from NN_TensorDesc implement invalid parameter code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtTensorDescGetByteSize002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtTensorDescGetByteSize002 start====");
        let result : number = neuralnetworkcoretest.NNTensorDesc_GetByteSizeB();
        console.info("====>NnrtTensorDescGetByteSize002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtTensorDescGetByteSize002 catch err: " + err);
      }
    })

    /**
     * @tc.name   NnrtTensorDescGetByteSize003
     * @tc.number SUB_NEURALNETWORKRUNTIME_TENSORDESCGETBYTESIZE_0300
     * @tc.desc   get byte size count from NN_TensorDesc implement invalid parameter code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NnrtTensorDescGetByteSize003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtTensorDescGetByteSize003 start====");
        let result : number = neuralnetworkcoretest.NNTensorDesc_GetByteSizeC();
        console.info("====>NnrtTensorDescGetByteSize003 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtTensorDescGetByteSize003 catch err: " + err);
      }
    })
  })
}
