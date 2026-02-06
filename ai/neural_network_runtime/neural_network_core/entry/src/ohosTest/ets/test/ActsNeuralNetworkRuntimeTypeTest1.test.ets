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
const OH_NN_FUSED_RELU = 1;
const OH_NN_FUSED_RELU6 = 2;

export default function ActsNeuralNetworkRuntimeTypeTest1() {
  describe('ActsNeuralNetworkRuntimeTypeTest1', () => {

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_RETURNCODEDYNAMICSHAPE_0100
     * @tc.name    : NnrtReturnCodeDynamicShape001
     * @tc.desc    : test OH_NN_DYNAMIC_SHAPE
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtReturnCodeDynamicShape001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtReturnCodeDynamicShape001 start====");
        let result : number = neuralnetworkcoretest.NNReturnCode_DynamicShape();
        console.info("====>NnrtReturnCodeDynamicShape001 result: " + result);
        expect(result).assertEqual(OH_NN_SUCCESS);
        done()
      } catch (err) {
        console.error("====>NnrtReturnCodeDynamicShape001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_FUSETYPEFUSEDRELU_0100
     * @tc.name    : NnrtFuseTypeFusedRelu001
     * @tc.desc    : test OH_NN_FUSED_RELU
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtFuseTypeFusedRelu001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtFuseTypeFusedRelu001 start====");
        let result : number = neuralnetworkcoretest.NNFuseType_FusedRelu();
        console.info("====>NnrtFuseTypeFusedRelu001 result: " + result);
        expect(result).assertEqual(OH_NN_FUSED_RELU);
        done()
      } catch (err) {
        console.error("====>NnrtFuseTypeFusedRelu001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_FUSETYPEFUSEDRELU6_0100
     * @tc.name    : NnrtFuseTypeFusedRelu6001
     * @tc.desc    : test OH_NN_FUSED_RELU6
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtFuseTypeFusedRelu6001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtFuseTypeFusedRelu6001 start====");
        let result : number = neuralnetworkcoretest.NNFuseType_FusedRelu6();
        console.info("====>NnrtFuseTypeFusedRelu6001 result: " + result);
        expect(result).assertEqual(OH_NN_FUSED_RELU6);
        done()
      } catch (err) {
        console.error("====>NnrtFuseTypeFusedRelu6001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_DEVICETYPECPU_0100
     * @tc.name    : NnrtDeviceTypeCPU001
     * @tc.desc    : test OH_NN_CPU
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtDeviceTypeCPU001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtDeviceTypeCPU001 start====");
        let result : number = neuralnetworkcoretest.NNDeviceTypeCommonTest("OH_NN_CPU");
        console.info("====>NnrtDeviceTypeCPU001 result: " + result);
        expect([OH_NN_SUCCESS, OH_NN_INVALID_PARAMETER]).assertContain(result);
        done()
      } catch (err) {
        console.error("====>NnrtDeviceTypeCPU001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_DEVICETYPEGPU_0100
     * @tc.name    : NnrtDeviceTypeGPU001
     * @tc.desc    : test OH_NN_GPU
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtDeviceTypeGPU001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtDeviceTypeGPU001 start====");
        let result : number = neuralnetworkcoretest.NNDeviceTypeCommonTest("OH_NN_GPU");
        console.info("====>NnrtDeviceTypeGPU001 result: " + result);
        expect([OH_NN_SUCCESS, OH_NN_INVALID_PARAMETER]).assertContain(result);
        done()
      } catch (err) {
        console.error("====>NnrtDeviceTypeGPU001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_DEVICETYPEACCELERATOR_0100
     * @tc.name    : NnrtDeviceTypeAccelerator001
     * @tc.desc    : test OH_NN_ACCELERATOR
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtDeviceTypeAccelerator001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtDeviceTypeAccelerator001 start====");
        let result : number = neuralnetworkcoretest.NNDeviceTypeCommonTest("OH_NN_ACCELERATOR");
        console.info("====>NnrtDeviceTypeAccelerator001 result: " + result);
        expect([OH_NN_SUCCESS, OH_NN_INVALID_PARAMETER]).assertContain(result);
        done()
      } catch (err) {
        console.error("====>NnrtDeviceTypeAccelerator001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_DATATYPEINT16_0100
     * @tc.name    : NnrtDataTypeInt16001
     * @tc.desc    : test OH_NN_INT16
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtDataTypeInt16001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtDataTypeInt16001 start====");
        let result : number = neuralnetworkcoretest.NNDataTypeCommonTest("OH_NN_INT16", true);
        console.info("====>NnrtDataTypeInt16001 result: " + result);
        expect(result).assertEqual(OH_NN_SUCCESS);
        done()
      } catch (err) {
        console.error("====>NnrtDataTypeInt16001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_DATATYPEINT16_0200
     * @tc.name    : NnrtDataTypeInt16002
     * @tc.desc    : test OH_NN_INT16
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtDataTypeInt16002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtDataTypeInt16002 start====");
        let result : number = neuralnetworkcoretest.NNDataTypeCommonTest("OH_NN_INT16", false);
        console.info("====>NnrtDataTypeInt16002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtDataTypeInt16002 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_DATATYPEINT64_0100
     * @tc.name    : NnrtDataTypeInt64001
     * @tc.desc    : test OH_NN_INT64
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtDataTypeInt64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtDataTypeInt64001 start====");
        let result : number = neuralnetworkcoretest.NNDataTypeCommonTest("OH_NN_INT64", true);
        console.info("====>NnrtDataTypeInt64001 result: " + result);
        expect(result).assertEqual(OH_NN_SUCCESS);
        done()
      } catch (err) {
        console.error("====>NnrtDataTypeInt64001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_DATATYPEINT64_0200
     * @tc.name    : NnrtDataTypeInt64002
     * @tc.desc    : test OH_NN_INT64
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtDataTypeInt64002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtDataTypeInt64002 start====");
        let result : number = neuralnetworkcoretest.NNDataTypeCommonTest("OH_NN_INT64", false);
        console.info("====>NnrtDataTypeInt64002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtDataTypeInt64002 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_DATATYPEUINT8_0100
     * @tc.name    : NnrtDataTypeUint8001
     * @tc.desc    : test OH_NN_UINT8
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtDataTypeUint8001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtDataTypeUint8001 start====");
        let result : number = neuralnetworkcoretest.NNDataTypeCommonTest("OH_NN_UINT8", true);
        console.info("====>NnrtDataTypeUint8001 result: " + result);
        expect(result).assertEqual(OH_NN_SUCCESS);
        done()
      } catch (err) {
        console.error("====>NnrtDataTypeUint8001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_DATATYPEUINT8_0200
     * @tc.name    : NnrtDataTypeUint8002
     * @tc.desc    : test OH_NN_UINT8
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtDataTypeUint8002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtDataTypeUint8002 start====");
        let result : number = neuralnetworkcoretest.NNDataTypeCommonTest("OH_NN_UINT8", false);
        console.info("====>NnrtDataTypeUint8002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtDataTypeUint8002 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_DATATYPEUINT16_0100
     * @tc.name    : NnrtDataTypeUint16001
     * @tc.desc    : test OH_NN_UINT16
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtDataTypeUint16001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtDataTypeUint16001 start====");;
        let result : number = neuralnetworkcoretest.NNDataTypeCommonTest("OH_NN_UINT16", true);
        console.info("====>NnrtDataTypeUint16001 result: " + result);
        expect(result).assertEqual(OH_NN_SUCCESS);
        done()
      } catch (err) {
        console.error("====>NnrtDataTypeUint16001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_DATATYPEUINT16_0200
     * @tc.name    : NnrtDataTypeUint16002
     * @tc.desc    : test OH_NN_UINT16
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtDataTypeUint16002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtDataTypeUint16002 start====");
        let result : number = neuralnetworkcoretest.NNDataTypeCommonTest("OH_NN_UINT16", false);
        console.info("====>NnrtDataTypeUint16002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtDataTypeUint16002 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_DATATYPEUINT32_0100
     * @tc.name    : NnrtDataTypeUint32001
     * @tc.desc    : test OH_NN_UINT32
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtDataTypeUint32001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtDataTypeUint32001 start====");
        let result : number = neuralnetworkcoretest.NNDataTypeCommonTest("OH_NN_UINT32", true);
        console.info("====>NnrtDataTypeUint32001 result: " + result);
        expect(result).assertEqual(OH_NN_SUCCESS);
        done()
      } catch (err) {
        console.error("====>NnrtDataTypeUint32001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_DATATYPEUINT32_0200
     * @tc.name    : NnrtDataTypeUint32002
     * @tc.desc    : test OH_NN_UINT32
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtDataTypeUint32002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtDataTypeUint32002 start====");
        let result : number = neuralnetworkcoretest.NNDataTypeCommonTest("OH_NN_UINT32", false);
        console.info("====>NnrtDataTypeUint32002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtDataTypeUint32002 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_DATATYPEUINT64_0100
     * @tc.name    : NnrtDataTypeUint64001
     * @tc.desc    : test OH_NN_UINT64
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtDataTypeUint64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtDataTypeUint64001 start====");
        let result : number = neuralnetworkcoretest.NNDataTypeCommonTest("OH_NN_UINT64", true);
        console.info("====>NnrtDataTypeUint64001 result: " + result);
        expect(result).assertEqual(OH_NN_SUCCESS);
        done()
      } catch (err) {
        console.error("====>NnrtDataTypeUint64001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_DATATYPEUINT64_0200
     * @tc.name    : NnrtDataTypeUint64002
     * @tc.desc    : test OH_NN_UINT64
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtDataTypeUint64002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtDataTypeUint64002 start====");
        let result : number = neuralnetworkcoretest.NNDataTypeCommonTest("OH_NN_UINT64", false);
        console.info("====>NnrtDataTypeUint64002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtDataTypeUint64002 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_DATATYPEFLOAT16_0100
     * @tc.name    : NnrtDataTypeFloat16001
     * @tc.desc    : ensure OH_NN_FLOAT16 equals 10
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtDataTypeFloat16001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtDataTypeFloat16001 start====");
        let result : number = neuralnetworkcoretest.NNDataTypeCommonTest("OH_NN_FLOAT16", true);
        console.info("====>NnrtDataTypeFloat16001 result: " + result);
        expect(result).assertEqual(OH_NN_SUCCESS);
        done()
      } catch (err) {
        console.error("====>NnrtDataTypeFloat16001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_DATATYPEFLOAT16_0200
     * @tc.name    : NnrtDataTypeFloat16002
     * @tc.desc    : test OH_NN_FLOAT16
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtDataTypeFloat16002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtDataTypeFloat16002 start====");
        let result : number = neuralnetworkcoretest.NNDataTypeCommonTest("OH_NN_FLOAT16", false);
        console.info("====>NnrtDataTypeFloat16002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtDataTypeFloat16002 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSAVGPOOL_0100
     * @tc.name    : NnrtOpTypeOpsAvgPool001
     * @tc.desc    : test OH_NN_OPS_AVG_POOL
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeOpsAvgPool001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeOpsAvgPool001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_AVG_POOL", true);
        console.info("====>NnrtOpTypeOpsAvgPool001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeOpsAvgPool001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSAVGPOOL_0200
     * @tc.name    : NnrtOpTypeOpsAvgPool002
     * @tc.desc    : test OH_NN_OPS_AVG_POOL
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeOpsAvgPool002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeOpsAvgPool002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_AVG_POOL", false);
        console.info("====>NnrtOpTypeOpsAvgPool002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeOpsAvgPool002 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSBATCHNORM_0100
     * @tc.name    : NnrtOpTypeOpsBatchNorm001
     * @tc.desc    : test OH_NN_OPS_BATCH_NORM
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeOpsBatchNorm001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeOpsBatchNorm001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_BATCH_NORM", true);
        console.info("====>NnrtOpTypeOpsBatchNorm001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeOpsBatchNorm001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSBATCHNORM_0200
     * @tc.name    : NnrtOpTypeOpsBatchNorm002
     * @tc.desc    : test OH_NN_OPS_BATCH_NORM
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeOpsBatchNorm002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeOpsBatchNorm002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_BATCH_NORM", false);
        console.info("====>NnrtOpTypeOpsBatchNorm002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeOpsBatchNorm002 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSBATCHTOSPACEND_0100
     * @tc.name    : NnrtOpTypeOpsBatchToSpaceND001
     * @tc.desc    : test OH_NN_OPS_BATCH_TO_SPACE_ND
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeOpsBatchToSpaceND001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeOpsBatchToSpaceND001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_BATCH_TO_SPACE_ND", true);
        console.info("====>NnrtOpTypeOpsBatchToSpaceND001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeOpsBatchToSpaceND001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSBATCHTOSPACEND_0200
     * @tc.name    : NnrtOpTypeOpsBatchToSpaceND002
     * @tc.desc    : test OH_NN_OPS_BATCH_TO_SPACE_ND
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeOpsBatchToSpaceND002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeOpsBatchToSpaceND002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_BATCH_TO_SPACE_ND", false);
        console.info("====>NnrtOpTypeOpsBatchToSpaceND002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeOpsBatchToSpaceND002 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSBIASADD_0100
     * @tc.name    : NnrtOpTypeOpsBiasAdd001
     * @tc.desc    : test OH_NN_OPS_BIAS_ADD
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeOpsBiasAdd001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeOpsBiasAdd001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_BIAS_ADD", true);
        console.info("====>NnrtOpTypeOpsBiasAdd001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeOpsBiasAdd001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSBIASADD_0200
     * @tc.name    : NnrtOpTypeOpsBiasAdd002
     * @tc.desc    : test OH_NN_OPS_BIAS_ADD
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeOpsBiasAdd002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeOpsBiasAdd002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_BIAS_ADD", false);
        console.info("====>NnrtOpTypeOpsBiasAdd002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeOpsBiasAdd002 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSCAST_0100
     * @tc.name    : NnrtOpTypeOpsCast001
     * @tc.desc    : test OH_NN_OPS_CAST
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeOpsCast001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeOpsCast001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_CAST", true);
        console.info("====>NnrtOpTypeOpsCast001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeOpsCast001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSCAST_0200
     * @tc.name    : NnrtOpTypeOpsCast002
     * @tc.desc    : test OH_NN_OPS_CAST
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeOpsCast002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeOpsCast002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_CAST", false);
        console.info("====>NnrtOpTypeOpsCast002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeOpsCast002 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSCONCAT_0100
     * @tc.name    : NnrtOpTypeOpsConcat001
     * @tc.desc    : test OH_NN_OPS_CONCAT
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeOpsConcat001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeOpsConcat001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_CONCAT", true);
        console.info("====>NnrtOpTypeOpsConcat001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeOpsConcat001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSCONCAT_0200
     * @tc.name    : NnrtOpTypeOpsConcat002
     * @tc.desc    : test OH_NN_OPS_CONCAT
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeOpsConcat002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeOpsConcat002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_CONCAT", false);
        console.info("====>NnrtOpTypeOpsConcat002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeOpsConcat002 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSCONV2D_0100
     * @tc.name    : NnrtOpTypeOpsConv2D001
     * @tc.desc    : test OH_NN_OPS_CONV2D
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeOpsConv2D001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeOpsConv2D001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_CONV2D", true);
        console.info("====>NnrtOpTypeOpsConv2D001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeOpsConv2D001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSCONV2D_0200
     * @tc.name    : NnrtOpTypeOpsConv2D002
     * @tc.desc    : test OH_NN_OPS_CONV2D
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeOpsConv2D002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeOpsConv2D002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_CONV2D", false);
        console.info("====>NnrtOpTypeOpsConv2D002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeOpsConv2D002 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSCONV2DTRANSPOSE_0100
     * @tc.name    : NnrtOpTypeOpsConv2DTranspose001
     * @tc.desc    : test OH_NN_OPS_CONV2D_TRANSPOSE
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeOpsConv2DTranspose001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
       async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeOpsConv2DTranspose001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_CONV2D_TRANSPOSE", true);
        console.info("====>NnrtOpTypeOpsConv2DTranspose001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeOpsConv2DTranspose001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSCONV2DTRANSPOSE_0200
     * @tc.name    : NnrtOpTypeOpsConv2DTranspose002
     * @tc.desc    : test OH_NN_OPS_CONV2D_TRANSPOSE
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeOpsConv2DTranspose002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
       async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeOpsConv2DTranspose002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_CONV2D_TRANSPOSE", false);
        console.info("====>NnrtOpTypeOpsConv2DTranspose002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeOpsConv2DTranspose002 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSDEPTHWISECONV2DNATIVE_0100
     * @tc.name    : NnrtOpTypeOpsDepthwiseConv2DNative001
     * @tc.desc    : test OH_NN_OPS_DEPTHWISE_CONV2D_NATIVE
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeOpsDepthwiseConv2DNative001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
       async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeOpsDepthwiseConv2DNative001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_DEPTHWISE_CONV2D_NATIVE",
                                                                               true);
        console.info("====>NnrtOpTypeOpsDepthwiseConv2DNative001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeOpsDepthwiseConv2DNative001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSDEPTHWISECONV2DNATIVE_0200
     * @tc.name    : NnrtOpTypeOpsDepthwiseConv2DNative002
     * @tc.desc    : test OH_NN_OPS_DEPTHWISE_CONV2D_NATIVE
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeOpsDepthwiseConv2DNative002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
       async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeOpsDepthwiseConv2DNative002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_DEPTHWISE_CONV2D_NATIVE",
                                                                               false);
        console.info("====>NnrtOpTypeOpsDepthwiseConv2DNative002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeOpsDepthwiseConv2DNative002 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSDIV_0100
     * @tc.name    : NnrtOpTypeOpsDiv001
     * @tc.desc    : test OH_NN_OPS_DIV
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeOpsDiv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeOpsDiv001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_DIV", true);
        console.info("====>NnrtOpTypeOpsDiv001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeOpsDiv001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSDIV_0200
     * @tc.name    : NnrtOpTypeOpsDiv002
     * @tc.desc    : test OH_NN_OPS_DIV
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeOpsDiv002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeOpsDiv002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_DIV", false);
        console.info("====>NnrtOpTypeOpsDiv002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeOpsDiv002 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSELTWISE_0100
     * @tc.name    : NnrtOpTypeEltwise001
     * @tc.desc    : test OH_NN_OPS_ELTWISE
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeEltwise001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeEltwise001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_ELTWISE", true);
        console.info("====>NnrtOpTypeEltwise001 result: " + result);
        expect(result).assertEqual(OH_NN_SUCCESS);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeEltwise001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSELTWISE_0200
     * @tc.name    : NnrtOpTypeEltwise002
     * @tc.desc    : test OH_NN_OPS_ELTWISE
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeEltwise002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeEltwise002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_ELTWISE", false);
        console.info("====>NnrtOpTypeEltwise002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeEltwise002 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSEXPANDDIMS_0100
     * @tc.name    : NnrtOpTypeExpandDims001
     * @tc.desc    : test OH_NN_OPS_EXPAND_DIMS
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeExpandDims001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeExpandDims001 start====");
        let result : number = neuralnetworkcoretest.NNOperationType_OpsExpandDimsA();
        console.info("====>NnrtOpTypeExpandDims001 result: " + result);
        expect(result).assertEqual(OH_NN_SUCCESS);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeExpandDims001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSEXPANDDIMS_0200
     * @tc.name    : NnrtOpTypeExpandDims002
     * @tc.desc    : test OH_NN_OPS_EXPAND_DIMS
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeExpandDims002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeExpandDims002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_EXPAND_DIMS", false);
        console.info("====>NnrtOpTypeExpandDims002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeExpandDims002 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSFILL_0100
     * @tc.name    : NnrtOpTypeFill001
     * @tc.desc    : test OH_NN_OPS_FILL
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeFill001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeFill001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_FILL", true);
        console.info("====>NnrtOpTypeFill001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeFill001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSFILL_0200
     * @tc.name    : NnrtOpTypeFill002
     * @tc.desc    : test OH_NN_OPS_FILL
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeFill002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeFill002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_FILL", false);
        console.info("====>NnrtOpTypeFill002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeFill002 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSFULLCONNECTION_0100
     * @tc.name    : NnrtOpTypeFullConnection001
     * @tc.desc    : test OH_NN_OPS_FULL_CONNECTION
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeFullConnection001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeFullConnection001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_FULL_CONNECTION", true);
        console.info("====>NnrtOpTypeFullConnection001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeFullConnection001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSFULLCONNECTION_0200
     * @tc.name    : NnrtOpTypeFullConnection002
     * @tc.desc    : test OH_NN_OPS_FULL_CONNECTION
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeFullConnection002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeFullConnection002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_FULL_CONNECTION", false);
        console.info("====>NnrtOpTypeFullConnection002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeFullConnection002 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSGATHER_0100
     * @tc.name    : NnrtOpTypeGather001
     * @tc.desc    : test OH_NN_OPS_GATHER
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeGather001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeGather001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_GATHER", true);
        console.info("====>NnrtOpTypeGather001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeGather001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSGATHER_0200
     * @tc.name    : NnrtOpTypeGather002
     * @tc.desc    : test OH_NN_OPS_GATHER
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeGather002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeGather002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_GATHER", false);
        console.info("====>NnrtOpTypeGather002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeGather002 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSHSWISH_0100
     * @tc.name    : NnrtOpTypeHswish001
     * @tc.desc    : test OH_NN_OPS_HSWISH
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeHswish001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeHswish001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_HSWISH", true);
        console.info("====>NnrtOpTypeHswish001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeHswish001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSHSWISH_0200
     * @tc.name    : NnrtOpTypeHswish002
     * @tc.desc    : test OH_NN_OPS_HSWISH
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeHswish002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeHswish002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_HSWISH", false);
        console.info("====>NnrtOpTypeHswish002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeHswish002 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSLESSEQUAL_0100
     * @tc.name    : NnrtOpTypeLessEqual001
     * @tc.desc    : test OH_NN_OPS_LESS_EQUAL
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeLessEqual001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeLessEqual001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_LESS_EQUAL", true);
        console.info("====>NnrtOpTypeLessEqual001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeLessEqual001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSLESSEQUAL_0200
     * @tc.name    : NnrtOpTypeLessEqual002
     * @tc.desc    : test OH_NN_OPS_LESS_EQUAL
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeLessEqual002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeLessEqual002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_LESS_EQUAL", false);
        console.info("====>NnrtOpTypeLessEqual002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeLessEqual002 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSMATMUL_0100
     * @tc.name    : NnrtOpTypeMatmul001
     * @tc.desc    : test OH_NN_OPS_MATMUL
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeMatmul001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeMatmul001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_MATMUL", true);
        console.info("====>NnrtOpTypeMatmul001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeMatmul001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSMATMUL_0200
     * @tc.name    : NnrtOpTypeMatmul002
     * @tc.desc    : test OH_NN_OPS_MATMUL
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeMatmul002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeMatmul002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_MATMUL", false);
        console.info("====>NnrtOpTypeMatmul002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeMatmul002 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSMAXIMUM_0100
     * @tc.name    : NnrtOpTypeMaximum001
     * @tc.desc    : test OH_NN_OPS_MAXIMUM
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeMaximum001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeMaximum001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_MAXIMUM", true);
        console.info("====>NnrtOpTypeMaximum001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeMaximum001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSMAXIMUM_0200
     * @tc.name    : NnrtOpTypeMaximum002
     * @tc.desc    : test OH_NN_OPS_MAXIMUM
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeMaximum002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeMaximum002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_MAXIMUM", false);
        console.info("====>NnrtOpTypeMaximum002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeMaximum002 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSMAXPOOL_0100
     * @tc.name    : NnrtOpTypeMaxpool001
     * @tc.desc    : test OH_NN_OPS_MAX_POOL
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeMaxpool001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeMaxpool001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_MAX_POOL", true);
        console.info("====>NnrtOpTypeMaxpool001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeMaxpool001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSMAXPOOL_0200
     * @tc.name    : NnrtOpTypeMaxpool002
     * @tc.desc    : test OH_NN_OPS_MAX_POOL
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeMaxpool002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeMaxpool002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_MAX_POOL", false);
        console.info("====>NnrtOpTypeMaxpool002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeMaxpool002 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSMUL_0100
     * @tc.name    : NnrtOpTypeMul001
     * @tc.desc    : test OH_NN_OPS_MUL
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeMul001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeMul001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_MUL", true);
        console.info("====>NnrtOpTypeMul001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeMul001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSMUL_0200
     * @tc.name    : NnrtOpTypeMul002
     * @tc.desc    : test OH_NN_OPS_MUL
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeMul002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeMul002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_MUL", false);
        console.info("====>NnrtOpTypeMul002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeMul002 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSONEHOT_0100
     * @tc.name    : NnrtOpTypeOneHot001
     * @tc.desc    : test OH_NN_OPS_ONE_HOT
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeOneHot001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeOneHot001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_ONE_HOT", true);
        console.info("====>NnrtOpTypeOneHot001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeOneHot001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSONEHOT_0200
     * @tc.name    : NnrtOpTypeOneHot002
     * @tc.desc    : test OH_NN_OPS_ONE_HOT
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeOneHot002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeOneHot002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_ONE_HOT", false);
        console.info("====>NnrtOpTypeOneHot002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeOneHot002 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSPAD_0100
     * @tc.name    : NnrtOpTypePad001
     * @tc.desc    : test OH_NN_OPS_PAD
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypePad001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypePad001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_PAD", true);
        console.info("====>NnrtOpTypePad001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypePad001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSPAD_0200
     * @tc.name    : NnrtOpTypePad002
     * @tc.desc    : test OH_NN_OPS_PAD
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypePad002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypePad002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_PAD", false);
        console.info("====>NnrtOpTypePad002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypePad002 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSPOW_0100
     * @tc.name    : NnrtOpTypePow001
     * @tc.desc    : test OH_NN_OPS_POW
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypePow001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypePow001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_POW", true);
        console.info("====>NnrtOpTypePow001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypePow001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSPOW_0200
     * @tc.name    : NnrtOpTypePow002
     * @tc.desc    : test OH_NN_OPS_POW
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypePow002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypePow002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_POW", false);
        console.info("====>NnrtOpTypePow002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypePow002 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSSCALE_0100
     * @tc.name    : NnrtOpTypeScale001
     * @tc.desc    : test OH_NN_OPS_SCALE
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeScale001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeScale001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_SCALE", true);
        console.info("====>NnrtOpTypeScale001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeScale001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSSCALE_0200
     * @tc.name    : NnrtOpTypeScale002
     * @tc.desc    : test OH_NN_OPS_SCALE
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeScale002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeScale002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_SCALE", false);
        console.info("====>NnrtOpTypeScale002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeScale002 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSSHAPE_0100
     * @tc.name    : NnrtOpTypeShape001
     * @tc.desc    : test OH_NN_OPS_SHAPE
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeShape001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeShape001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_SHAPE", true);
        console.info("====>NnrtOpTypeShape001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeShape001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSSHAPE_0200
     * @tc.name    : NnrtOpTypeShape002
     * @tc.desc    : test OH_NN_OPS_SHAPE
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeShape002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeShape002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_SHAPE", false);
        console.info("====>NnrtOpTypeShape002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeShape002 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSSIGMOID_0100
     * @tc.name    : NnrtOpTypeSigmoid001
     * @tc.desc    : test OH_NN_OPS_SIGMOID
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeSigmoid001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeSigmoid001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_SIGMOID", true);
        console.info("====>NnrtOpTypeSigmoid001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeSigmoid001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSSIGMOID_0200
     * @tc.name    : NnrtOpTypeSigmoid002
     * @tc.desc    : test OH_NN_OPS_SIGMOID
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeSigmoid002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeSigmoid002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_SIGMOID", false);
        console.info("====>NnrtOpTypeSigmoid002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeSigmoid002 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSSLICE_0100
     * @tc.name    : NnrtOpTypeSlice001
     * @tc.desc    : test OH_NN_OPS_SLICE
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeSlice001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeSlice001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_SLICE", true);
        console.info("====>NnrtOpTypeSlice001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeSlice001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSSLICE_0200
     * @tc.name    : NnrtOpTypeSlice002
     * @tc.desc    : test OH_NN_OPS_SLICE
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeSlice002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeSlice002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_SLICE", false);
        console.info("====>NnrtOpTypeSlice002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeSlice002 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSSOFTMAX_0100
     * @tc.name    : NnrtOpTypeSoftmax001
     * @tc.desc    : test OH_NN_OPS_SOFTMAX
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeSoftmax001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeSoftmax001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_SOFTMAX", true);
        console.info("====>NnrtOpTypeSoftmax001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeSoftmax001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSSOFTMAX_0200
     * @tc.name    : NnrtOpTypeSoftmax002
     * @tc.desc    : test OH_NN_OPS_SOFTMAX
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeSoftmax002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeSoftmax002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_SOFTMAX", false);
        console.info("====>NnrtOpTypeSoftmax002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeSoftmax002 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSSPACETOBATCHND_0100
     * @tc.name    : NnrtOpTypeSpaceToBatchND001
     * @tc.desc    : test OH_NN_OPS_SPACE_TO_BATCH_ND
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeSpaceToBatchND001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeSpaceToBatchND001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_SPACE_TO_BATCH_ND", true);
        console.info("====>NnrtOpTypeSpaceToBatchND001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeSpaceToBatchND001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSSPACETOBATCHND_0200
     * @tc.name    : NnrtOpTypeSpaceToBatchND002
     * @tc.desc    : test OH_NN_OPS_SPACE_TO_BATCH_ND
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeSpaceToBatchND002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeSpaceToBatchND002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_SPACE_TO_BATCH_ND", false);
        console.info("====>NnrtOpTypeSpaceToBatchND002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeSpaceToBatchND002 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSSPLIT_0100
     * @tc.name    : NnrtOpTypeSplit001
     * @tc.desc    : test OH_NN_OPS_SPLIT
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeSplit001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeSplit001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_SPLIT", true);
        console.info("====>NnrtOpTypeSplit001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeSplit001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSSPLIT_0200
     * @tc.name    : NnrtOpTypeSplit002
     * @tc.desc    : test OH_NN_OPS_SPLIT
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeSplit002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeSplit002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_SPLIT", false);
        console.info("====>NnrtOpTypeSplit002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeSplit002 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSSQRT_0100
     * @tc.name    : NnrtOpTypeSqrt001
     * @tc.desc    : test OH_NN_OPS_SQRT
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeSqrt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeSqrt001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_SQRT", true);
        console.info("====>NnrtOpTypeSqrt001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeSqrt001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSSQRT_0200
     * @tc.name    : NnrtOpTypeSqrt002
     * @tc.desc    : test OH_NN_OPS_SQRT
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeSqrt002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeSqrt002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_SQRT", false);
        console.info("====>NnrtOpTypeSqrt002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeSqrt002 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSSQUAREDDIFFERENCE_0100
     * @tc.name    : NnrtOpTypeSquaredDifference001
     * @tc.desc    : test OH_NN_OPS_SQUARED_DIFFERENCE
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeSquaredDifference001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeSquaredDifference001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_SQUARED_DIFFERENCE", true);
        console.info("====>NnrtOpTypeSquaredDifference001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeSquaredDifference001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSSQUAREDDIFFERENCE_0200
     * @tc.name    : NnrtOpTypeSquaredDifference002
     * @tc.desc    : test OH_NN_OPS_SQUARED_DIFFERENCE
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeSquaredDifference002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeSquaredDifference002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_SQUARED_DIFFERENCE", false);
        console.info("====>NnrtOpTypeSquaredDifference002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeSquaredDifference002 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSSQUEEZE_0100
     * @tc.name    : NnrtOpTypeSqueeze001
     * @tc.desc    : test OH_NN_OPS_SQUEEZE
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeSqueeze001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeSqueeze001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_SQUEEZE", true);
        console.info("====>NnrtOpTypeSqueeze001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeSqueeze001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSSQUEEZE_0200
     * @tc.name    : NnrtOpTypeSqueeze002
     * @tc.desc    : test OH_NN_OPS_SQUEEZE
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeSqueeze002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeSqueeze002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_SQUEEZE", false);
        console.info("====>NnrtOpTypeSqueeze002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeSqueeze002 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSSTACK_0100
     * @tc.name    : NnrtOpTypeStack001
     * @tc.desc    : test OH_NN_OPS_STACK
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeStack001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeStack001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_STACK", true);
        console.info("====>NnrtOpTypeStack001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeStack001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSSTACK_0200
     * @tc.name    : NnrtOpTypeStack002
     * @tc.desc    : test OH_NN_OPS_STACK
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeStack002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeStack002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_STACK", false);
        console.info("====>NnrtOpTypeStack002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeStack002 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSSTRIDEDSLICE_0100
     * @tc.name    : NnrtOpTypeStridedSlice001
     * @tc.desc    : test OH_NN_OPS_STRIDED_SLICE
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeStridedSlice001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeStridedSlice001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_STRIDED_SLICE", true);
        console.info("====>NnrtOpTypeStridedSlice001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeStridedSlice001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSSTRIDEDSLICE_0200
     * @tc.name    : NnrtOpTypeStridedSlice002
     * @tc.desc    : test OH_NN_OPS_STRIDED_SLICE
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeStridedSlice002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeStridedSlice002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_STRIDED_SLICE", false);
        console.info("====>NnrtOpTypeStridedSlice002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeStridedSlice002 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSSUB_0100
     * @tc.name    : NnrtOpTypeSub001
     * @tc.desc    : test OH_NN_OPS_SUB
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeSub001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeSub001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_SUB", true);
        console.info("====>NnrtOpTypeSub001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeSub001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSSUB_0200
     * @tc.name    : NnrtOpTypeSub002
     * @tc.desc    : test OH_NN_OPS_SUB
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeSub002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeSub002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_SUB", false);
        console.info("====>NnrtOpTypeSub002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeSub002 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSTANH_0100
     * @tc.name    : NnrtOpTypeTanh001
     * @tc.desc    : test OH_NN_OPS_TANH
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeTanh001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeTanh001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_TANH", true);
        console.info("====>NnrtOpTypeTanh001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeTanh001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSTANH_0200
     * @tc.name    : NnrtOpTypeTanh002
     * @tc.desc    : test OH_NN_OPS_TANH
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeTanh002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeTanh002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_TANH", false);
        console.info("====>NnrtOpTypeTanh002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeTanh002 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSTILE_0100
     * @tc.name    : NnrtOpTypeTile001
     * @tc.desc    : test OH_NN_OPS_TILE
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeTile001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeTile001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_TILE", true);
        console.info("====>NnrtOpTypeTile001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeTile001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSTILE_0200
     * @tc.name    : NnrtOpTypeTile002
     * @tc.desc    : test OH_NN_OPS_TILE
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeTile002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeTile002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_TILE", false);
        console.info("====>NnrtOpTypeTile002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeTile002 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSTRANSPOSE_0100
     * @tc.name    : NnrtOpTypeTranspose001
     * @tc.desc    : test OH_NN_OPS_TRANSPOSE
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeTranspose001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeTranspose001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_TRANSPOSE", true);
        console.info("====>NnrtOpTypeTranspose001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeTranspose001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSTRANSPOSE_0200
     * @tc.name    : NnrtOpTypeTranspose002
     * @tc.desc    : test OH_NN_OPS_TRANSPOSE
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeTranspose002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeTranspose002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_TRANSPOSE", false);
        console.info("====>NnrtOpTypeTranspose002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeTranspose002 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSREDUCEMEAN_0100
     * @tc.name    : NnrtOpTypeReduceMean001
     * @tc.desc    : test OH_NN_OPS_REDUCE_MEAN
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeReduceMean001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeReduceMean001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_REDUCE_MEAN", true);
        console.info("====>NnrtOpTypeReduceMean001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeReduceMean001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSREDUCEMEAN_0200
     * @tc.name    : NnrtOpTypeReduceMean002
     * @tc.desc    : test OH_NN_OPS_REDUCE_MEAN
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeReduceMean002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeReduceMean002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_REDUCE_MEAN", false);
        console.info("====>NnrtOpTypeReduceMean002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeReduceMean002 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSRESIZEBILINEAR_0100
     * @tc.name    : NnrtOpTypeResizeBilinear001
     * @tc.desc    : test OH_NN_OPS_RESIZE_BILINEAR
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeResizeBilinear001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeResizeBilinear001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_RESIZE_BILINEAR", true);
        console.info("====>NnrtOpTypeResizeBilinear001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeResizeBilinear001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSRESIZEBILINEAR_0200
     * @tc.name    : NnrtOpTypeResizeBilinear002
     * @tc.desc    : test OH_NN_OPS_RESIZE_BILINEAR
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeResizeBilinear002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeResizeBilinear002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_RESIZE_BILINEAR", false);
        console.info("====>NnrtOpTypeResizeBilinear002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeResizeBilinear002 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSRSQRT_0100
     * @tc.name    : NnrtOpTypeRsqrt001
     * @tc.desc    : test OH_NN_OPS_RSQRT
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeRsqrt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeRsqrt001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_RSQRT", true);
        console.info("====>NnrtOpTypeRsqrt001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeRsqrt001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSRSQRT_0200
     * @tc.name    : NnrtOpTypeRsqrt002
     * @tc.desc    : test OH_NN_OPS_RSQRT
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeRsqrt002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeRsqrt002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_RSQRT", false);
        console.info("====>NnrtOpTypeRsqrt002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeRsqrt002 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSRESHAPE_0100
     * @tc.name    : NnrtOpTypeReshape001
     * @tc.desc    : test OH_NN_OPS_RESHAPE
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeReshape001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeReshape001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_RESHAPE", true);
        console.info("====>NnrtOpTypeReshape001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeReshape001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSRESHAPE_0200
     * @tc.name    : NnrtOpTypeReshape002
     * @tc.desc    : test OH_NN_OPS_RESHAPE
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeReshape002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeReshape002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_RESHAPE", false);
        console.info("====>NnrtOpTypeReshape002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeReshape002 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSPRELU_0100
     * @tc.name    : NnrtOpTypePrelu001
     * @tc.desc    : test OH_NN_OPS_PRELU
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypePrelu001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypePrelu001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_PRELU", true);
        console.info("====>NnrtOpTypePrelu001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypePrelu001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSPRELU_0200
     * @tc.name    : NnrtOpTypePrelu002
     * @tc.desc    : test OH_NN_OPS_PRELU
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypePrelu002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypePrelu002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_PRELU", false);
        console.info("====>NnrtOpTypePrelu002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypePrelu002 catch err: " + err);
      }
    })


    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSRELU_0100
     * @tc.name    : NnrtOpTypeRelu001
     * @tc.desc    : test OH_NN_OPS_RELU
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeRelu001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeRelu001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_RELU", true);
        console.info("====>NnrtOpTypeRelu001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeRelu001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSRELU_0200
     * @tc.name    : NnrtOpTypeRelu002
     * @tc.desc    : test OH_NN_OPS_RELU
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeRelu002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeRelu002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_RELU", false);
        console.info("====>NnrtOpTypeRelu002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeRelu002 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSRELU6_0100
     * @tc.name    : NnrtOpTypeRelu6001
     * @tc.desc    : test OH_NN_OPS_RELU6
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeRelu6001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeRelu6001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_RELU6", true);
        console.info("====>NnrtOpTypeRelu6001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeRelu6001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSRELU6_0200
     * @tc.name    : NnrtOpTypeRelu6002
     * @tc.desc    : test OH_NN_OPS_RELU6
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeRelu6002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeRelu6002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_RELU6", false);
        console.info("====>NnrtOpTypeRelu6002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeRelu6002 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSLAYERNORM_0100
     * @tc.name    : NnrtOpTypeLayerNorm001
     * @tc.desc    : test OH_NN_OPS_LAYER_NORM
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeLayerNorm001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeLayerNorm001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_LAYER_NORM", true);
        console.info("====>NnrtOpTypeLayerNorm001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeLayerNorm001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSLAYERNORM_0200
     * @tc.name    : NnrtOpTypeLayerNorm002
     * @tc.desc    : test OH_NN_OPS_LAYER_NORM
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeLayerNorm002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeLayerNorm002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_LAYER_NORM", false);
        console.info("====>NnrtOpTypeLayerNorm002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeLayerNorm002 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSREDUCEPROD_0100
     * @tc.name    : NnrtOpTypeReduceProd001
     * @tc.desc    : test OH_NN_OPS_REDUCE_PROD
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeReduceProd001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeReduceProd001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_REDUCE_PROD", true);
        console.info("====>NnrtOpTypeReduceProd001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeReduceProd001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSREDUCEPROD_0200
     * @tc.name    : NnrtOpTypeReduceProd002
     * @tc.desc    : test OH_NN_OPS_REDUCE_PROD
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeReduceProd002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeReduceProd002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_REDUCE_PROD", false);
        console.info("====>NnrtOpTypeReduceProd002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeReduceProd002 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSREDUCEALL_0100
     * @tc.name    : NnrtOpTypeReduceAll001
     * @tc.desc    : test OH_NN_OPS_REDUCE_ALL
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeReduceAll001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeReduceAll001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_REDUCE_ALL", true);
        console.info("====>NnrtOpTypeReduceAll001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeReduceAll001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSREDUCEALL_0200
     * @tc.name    : NnrtOpTypeReduceAll002
     * @tc.desc    : test OH_NN_OPS_REDUCE_ALL
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeReduceAll002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeReduceAll002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_REDUCE_ALL", false);
        console.info("====>NnrtOpTypeReduceAll002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeReduceAll002 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSQUANTDTYPECAST_0100
     * @tc.name    : NnrtOpTypeQuantDTypeCast001
     * @tc.desc    : test OH_NN_OPS_QUANT_DTYPE_CAST
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeQuantDTypeCast001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeQuantDTypeCast001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_QUANT_DTYPE_CAST", true);
        console.info("====>NnrtOpTypeQuantDTypeCast001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeQuantDTypeCast001 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSQUANTDTYPECAST_0200
     * @tc.name    : NnrtOpTypeQuantDTypeCast002
     * @tc.desc    : test OH_NN_OPS_QUANT_DTYPE_CAST
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeQuantDTypeCast002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeQuantDTypeCast002 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_QUANT_DTYPE_CAST", false);
        console.info("====>NnrtOpTypeQuantDTypeCast002 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeQuantDTypeCast002 catch err: " + err);
      }
    })

    /**
     * @tc.number  : SUB_NEURALNETWORKRUNTIME_OPERATIONTYPEOPSTOPK_0100
     * @tc.name    : NnrtOpTypeTopK001
     * @tc.desc    : test OH_NN_OPS_TOP_K
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('NnrtOpTypeTopK001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>NnrtOpTypeTopK001 start====");
        let result : number = neuralnetworkcoretest.NNOperationTypeCommonTest("OH_NN_OPS_TOP_K", true);
        console.info("====>NnrtOpTypeTopK001 result: " + result);
        expect(result).assertEqual(OH_NN_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>NnrtOpTypeTopK001 catch err: " + err);
      }
    })
  })
}
