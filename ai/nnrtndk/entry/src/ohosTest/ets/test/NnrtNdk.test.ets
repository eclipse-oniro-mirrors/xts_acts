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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import nnrt from 'libnnrtndk.so'

export default function nnrtNdkTest() {
  describe('AiNnrtTest', () => {
    /**
     * @tc.name   testAiNnrtOhNnModelConstruct001
     * @tc.number SUB_AI_NNRT_OH_NNMODEL_CONSTRUCT_0100
     * @tc.desc   test OH_NNModel_Construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAiNnrtOhNnModelConstruct001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = nnrt.oHNNModelConstructOne();
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testAiNnrtOhNnModelConstruct002
     * @tc.number SUB_AI_NNRT_OH_NNMODEL_CONSTRUCT_0200
     * @tc.desc   test OH_NNModel_Construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAiNnrtOhNnModelConstruct002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = nnrt.oHNNModelConstructTwo();
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testAiNnrtOhNnModelAddTensor001
     * @tc.number SUB_AI_NNRT_OH_NNMODEL_ADDTENSOR_0100
     * @tc.desc   test OH_NNModel_AddTensor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAiNnrtOhNnModelAddTensor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = nnrt.oHNNModelAddTensorOne();
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testAiNnrtOhNnModelAddTensor002
     * @tc.number SUB_AI_NNRT_OH_NNMODEL_ADDTENSOR_0200
     * @tc.desc   test OH_NNModel_AddTensor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAiNnrtOhNnModelAddTensor002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = nnrt.oHNNModelAddTensorTwo();
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testAiNnrtOhNnModelSetTensorData001
     * @tc.number SUB_AI_NNRT_OH_NNMODEL_SETTENSORDATA_0100
     * @tc.desc   test OH_NNModel_SetTensorData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAiNnrtOhNnModelSetTensorData001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = nnrt.oHNNModelSetTensorDataOne();
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testAiNnrtOhNnModelSetTensorData002
     * @tc.number SUB_AI_NNRT_OH_NNMODEL_SETTENSORDATA_0200
     * @tc.desc   test OH_NNModel_SetTensorData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAiNnrtOhNnModelSetTensorData002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = nnrt.oHNNModelSetTensorDataTwo();
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testAiNnrtOhNnModelAddOperation001
     * @tc.number SUB_AI_NNRT_OH_NNMODEL_ADDOPERATION_0100
     * @tc.desc   test OH_NNModel_AddOperation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAiNnrtOhNnModelAddOperation001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = nnrt.oHNNModelAddOperationOne();
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testAiNnrtOhNnModelAddOperation002
     * @tc.number SUB_AI_NNRT_OH_NNMODEL_ADDOPERATION_0200
     * @tc.desc   test OH_NNModel_AddOperation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAiNnrtOhNnModelAddOperation002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = nnrt.oHNNModelAddOperationTwo();
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testAiNnrtOhNnModelSpecifyInputsAndOutputs001
     * @tc.number SUB_AI_NNRT_OH_NNMODEL_SPECIFYINPUTSANDOUTPUTS_0100
     * @tc.desc   test OH_NNModel_SpecifyInputsAndOutputs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAiNnrtOhNnModelSpecifyInputsAndOutputs001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = nnrt.oHNNModelSpecifyInputsAndOutputsOne();
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testAiNnrtOhNnModelSpecifyInputsAndOutputs002
     * @tc.number SUB_AI_NNRT_OH_NNMODEL_SPECIFYINPUTSANDOUTPUTS_0200
     * @tc.desc   test OH_NNModel_SpecifyInputsAndOutputs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAiNnrtOhNnModelSpecifyInputsAndOutputs002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = nnrt.oHNNModelSpecifyInputsAndOutputsTwo();
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testAiNnrtOhNnModelFinish001
     * @tc.number SUB_AI_NNRT_OH_NNMODEL_FINISH_0100
     * @tc.desc   test OH_NNModel_Finish
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAiNnrtOhNnModelFinish001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = nnrt.oHNNModelFinishOne();
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testAiNnrtOhNnModelFinish002
     * @tc.number SUB_AI_NNRT_OH_NNMODEL_FINISH_0200
     * @tc.desc   test OH_NNModel_Finish
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAiNnrtOhNnModelFinish002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result = nnrt.oHNNModelFinishTwo();
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testAiNnrtOhNnModelDestroy001
     * @tc.number SUB_AI_NNRT_OH_NNMODEL_DESTROY_0100
     * @tc.desc   test OH_NNModel_Destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAiNnrtOhNnModelDestroy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result = nnrt.oHNNModelDestroy();
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testAiNnrtOhNnModelGetAvailableOpertions001
     * @tc.number SUB_AI_NNRT_OH_NNMODEL_GETAVAILABLEOPERATIONS_0100
     * @tc.desc   test OH_NNModel_GetAvailableOperations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAiNnrtOhNnModelGetAvailableOpertions001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result = nnrt.oHNNModelGetAvailableoperationsOne();
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testAiNnrtOhNnModelGetAvailableOpertions002
     * @tc.number SUB_AI_NNRT_OH_NNMODEL_GETAVAILABLEOPERATIONS_0200
     * @tc.desc   test OH_NNModel_GetAvailableOperations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAiNnrtOhNnModelGetAvailableOpertions002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result = nnrt.oHNNModelGetAvailableoperationsTwo();
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testAiNnrtOhNnCompilationConstruct001
     * @tc.number SUB_AI_NNRT_OH_NNCOMPILATION_CONSTRUCT_0100
     * @tc.desc   test OH_NNCompilation_Construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAiNnrtOhNnCompilationConstruct001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result = nnrt.oHNNCompilationConstructOne();
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testAiNnrtOhNnCompilationConstruct002
     * @tc.number SUB_AI_NNRT_OH_NNCOMPILATION_CONSTRUCT_0200
     * @tc.desc   test OH_NNCompilation_Construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAiNnrtOhNnCompilationConstruct002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result = nnrt.oHNNCompilationConstructTwo();
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testAiNnrtOhNnCompilationSetDevice001
     * @tc.number SUB_AI_NNRT_OH_NNCOMPILATION_SETDEVICE_0100
     * @tc.desc   test OH_NNCompilation_SetDevice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAiNnrtOhNnCompilationSetDevice001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result = nnrt.oHNNCompilationSetDeviceOne();
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testAiNnrtOhNnCompilationSetDevice002
     * @tc.number SUB_AI_NNRT_OH_NNCOMPILATION_SETDEVICE_0200
     * @tc.desc   test OH_NNCompilation_SetDevice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAiNnrtOhNnCompilationSetDevice002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result = nnrt.oHNNCompilationSetDeviceTwo();
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testAiNnrtOhNnCompilationSetCache001
     * @tc.number SUB_AI_NNRT_OH_NNCOMPILATION_SETCACHE_0100
     * @tc.desc   test OH_NNCompilation_SetCache
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAiNnrtOhNnCompilationSetCache001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result = nnrt.oHNNCompilationSetCacheOne();
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testAiNnrtOhNnCompilationSetCache002
     * @tc.number SUB_AI_NNRT_OH_NNCOMPILATION_SETCACHE_0200
     * @tc.desc   test OH_NNCompilation_SetCache
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAiNnrtOhNnCompilationSetCache002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result = nnrt.oHNNCompilationSetCacheTwo();
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testAiNnrtOhNnCompilationSetPerformanceMode001
     * @tc.number SUB_AI_NNRT_OH_NNCOMPILATION_SETPERFORMANCEMODE_0100
     * @tc.desc   test OH_NNCompilation_SetPerformanceMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAiNnrtOhNnCompilationSetPerformanceMode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result = nnrt.oHNNCompilationSetPerformanceModeOne();
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testAiNnrtOhNnCompilationSetPerformanceMode002
     * @tc.number SUB_AI_NNRT_OH_NNCOMPILATION_SETPERFORMANCEMODE_0200
     * @tc.desc   test OH_NNCompilation_SetPerformanceMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAiNnrtOhNnCompilationSetPerformanceMode002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result = nnrt.oHNNCompilationSetPerformanceModeTwo();
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testAiNnrtOhNnCompilationSetPerformanceMode003
     * @tc.number SUB_AI_NNRT_OH_NNCOMPILATION_SETPERFORMANCEMODE_0300
     * @tc.desc   test OH_NNCompilation_SetPerformanceMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAiNnrtOhNnCompilationSetPerformanceMode003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result = nnrt.oHNNCompilationSetPerformanceModeThree();
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testAiNnrtOhNnCompilationSetPerformanceMode004
     * @tc.number SUB_AI_NNRT_OH_NNCOMPILATION_SETPERFORMANCEMODE_0400
     * @tc.desc   test OH_NNCompilation_SetPerformanceMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAiNnrtOhNnCompilationSetPerformanceMode004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result = nnrt.oHNNCompilationSetPerformanceModeFour();
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testAiNnrtOhNnCompilationSetPriority001
     * @tc.number SUB_AI_NNRT_OH_NNCOMPILATION_SETPRIORITY_0100
     * @tc.desc   test OH_NNCompilation_SetPriority
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAiNnrtOhNnCompilationSetPriority001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result = nnrt.oHNNCompilationSetPriorityOne();
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testAiNnrtOhNnCompilationSetPriority002
     * @tc.number SUB_AI_NNRT_OH_NNCOMPILATION_SETPRIORITY_0200
     * @tc.desc   test OH_NNCompilation_SetPriority
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAiNnrtOhNnCompilationSetPriority002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result = nnrt.oHNNCompilationSetPriorityTwo();
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testAiNnrtOhNnCompilationEnableFloat16001
     * @tc.number SUB_AI_NNRT_OH_NNCOMPILATION_ENABLEFLOAT16_0100
     * @tc.desc   test OH_NNCompilation_EnableFloat16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAiNnrtOhNnCompilationEnableFloat16001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result = nnrt.oHNNCompilationEnableFloat16One();
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testAiNnrtOhNnCompilationEnableFloat16002
     * @tc.number SUB_AI_NNRT_OH_NNCOMPILATION_ENABLEFLOAT16_0200
     * @tc.desc   test OH_NNCompilation_EnableFloat16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAiNnrtOhNnCompilationEnableFloat16002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result = nnrt.oHNNCompilationEnableFloat16Two();
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testAiNnrtOhNnCompilationBuild002
     * @tc.number SUB_AI_NNRT_OH_NNCOMPILATION_BUILD_0200
     * @tc.desc   test OH_NNCompilation_Build
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAiNnrtOhNnCompilationBuild002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result = nnrt.oHNNCompilationBuildTwo();
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testAiNnrtOhNnCompilationDestroy001
     * @tc.number SUB_AI_NNRT_OH_NNCOMPILATION_DESTROY_0100
     * @tc.desc   test OH_NNCompilation_Destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAiNnrtOhNnCompilationDestroy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result = nnrt.oHNNCompilationDestroy();
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testAiNnrtOhNnExecutorConstruct002
     * @tc.number SUB_AI_NNRT_OH_NNEXECUTOR_CONSTRUCT_0200
     * @tc.desc   test OH_NNExecutor_Construct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAiNnrtOhNnExecutorConstruct002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result = nnrt.oHNNExecutorConstructTwo();
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testAiNnrtOhNnExecutorSetInput002
     * @tc.number SUB_AI_NNRT_OH_NNEXECUTOR_SETINPUT_0200
     * @tc.desc   test OH_NNExecutor_SetInput
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAiNnrtOhNnExecutorSetInput002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result = nnrt.oHNNExecutorSetInputTwo();
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testAiNnrtOhNnExecutorSetOutput002
     * @tc.number SUB_AI_NNRT_OH_NNEXECUTOR_SETOUTPUT_0200
     * @tc.desc   test OH_NNExecutor_SetOutput
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAiNnrtOhNnExecutorSetOutput002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result = nnrt.oHNNExecutorSetOutputTwo();
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testAiNnrtOhNnExecutorGetOutput002
     * @tc.number SUB_AI_NNRT_OH_NNEXECUTOR_GETOUTPUTSHAPE_0200
     * @tc.desc   test OH_NNExecutor_GetOutputShape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAiNnrtOhNnExecutorGetOutput002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result = nnrt.oHNNExecutorGetOutputShapeTwo();
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testAiNnrtOhNnExecutorRun002
     * @tc.number SUB_AI_NNRT_OH_NNEXECUTOR_RUN_0200
     * @tc.desc   test OH_NNExecutor_Run
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAiNnrtOhNnExecutorRun002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result = nnrt.oHNNExecutorRunTwo();
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testAiNnrtOhNnExecutorAllocateInputMemory002
     * @tc.number SUB_AI_NNRT_OH_NNEXECUTOR_ALLOCATEINPUTMEMORY_0200
     * @tc.desc   test OH_NNExecutor_AllocateInputMemory
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAiNnrtOhNnExecutorAllocateInputMemory002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result = nnrt.oHNNExecutorAllocateInputMemoryTwo();
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testAiNnrtOhNnExecutorSetInputWithMemory002
     * @tc.number SUB_AI_NNRT_OH_NNEXECUTOR_SETINPUTWITHMEMORY_0200
     * @tc.desc   test OH_NNExecutor_SetInputWithMemory
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAiNnrtOhNnExecutorSetInputWithMemory002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result = nnrt.oHNNExecutorSetInputWithMemoryTwo();
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testAiNnrtOhNnExecutorSetOutputWithMemory002
     * @tc.number SUB_AI_NNRT_OH_NNEXECUTOR_SETOUTPUTWITHMEMORY_0200
     * @tc.desc   test OH_NNExecutor_SetOutputWithMemory
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAiNnrtOhNnExecutorSetOutputWithMemory002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result = nnrt.oHNNExecutorSetOutputWithMemoryTwo();
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testAiNnrtOhNnDeviceGetAllDevicesID001
     * @tc.number SUB_AI_NNRT_OH_NNDEVICE_GETALLDEVICESID_0100
     * @tc.desc   test OH_NNDevice_GetAllDevicesID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAiNnrtOhNnDeviceGetAllDevicesID001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result = nnrt.oHNNDeviceGetAllDevicesIDOne();
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testAiNnrtOhNnDeviceGetAllDevicesID002
     * @tc.number SUB_AI_NNRT_OH_NNDEVICE_GETALLDEVICESID_0200
     * @tc.desc   test OH_NNDevice_GetAllDevicesID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAiNnrtOhNnDeviceGetAllDevicesID002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result = nnrt.oHNNDeviceGetAllDevicesIDTwo();
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testAiNnrtOhNnDeviceGetName001
     * @tc.number SUB_AI_NNRT_OH_NNDEVICE_GETNAME_0100
     * @tc.desc   test OH_NNDevice_GetName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAiNnrtOhNnDeviceGetName001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result = nnrt.oHNNDeviceGetNameOne();
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testAiNnrtOhNnDeviceGetName002
     * @tc.number SUB_AI_NNRT_OH_NNDEVICE_GETNAME_0200
     * @tc.desc   test OH_NNDevice_GetName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAiNnrtOhNnDeviceGetName002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result = nnrt.oHNNDeviceGetNameTwo();
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testAiNnrtOhNnDeviceGetType001
     * @tc.number SUB_AI_NNRT_OH_NNDEVICE_GETTYPE_0100
     * @tc.desc   test OH_NNDevice_GetType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAiNnrtOhNnDeviceGetType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result = nnrt.oHNNDeviceGetTypeOne();
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testAiNnrtOhNnDeviceGetType002
     * @tc.number SUB_AI_NNRT_OH_NNDEVICE_GETTYPE_0200
     * @tc.desc   test OH_NNDevice_GetType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAiNnrtOhNnDeviceGetType002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result = nnrt.oHNNDeviceGetTypeTwo();
      expect(result).assertEqual(0);
      done()
    });
  })
}
