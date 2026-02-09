/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, TestType, Size, Level, it } from "@ohos/hypium"
import { hilog } from "@kit.PerformanceAnalysisKit"
import ai_nnrt_interface_test from 'libai_nnrt_interface_test.so'

export default function NnrtInterfaceTest() {
  describe('NnrtInterfaceTest', () => {
    
    beforeAll(() => {
      // 所有测试用例开始前执行一次
    })
    
    beforeEach(() => {
      // 每个测试用例开始前执行
    })
    
    afterEach(() => {
      // 每个测试用例结束后执行
    })
    
    afterAll(() => {
      // 所有测试用例结束后执行一次
    })
    
    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Compilation_Create_0100
     * @tc.number SUB_AI_NNRt_Func_North_Compilation_Create_0100
     * @tc.desc   测试OH_NNCompilation_Construct(nullptr)是否正确返回nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Compilation_Create_0100', Level.LEVEL0, async () => {
      
      // 调用 NAPI 接口，传入用例编号 0
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(0);
      
      // 断言结果为 0（成功）
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })



    // ========== 索引 3-18: Compilation 系列测试 ==========
    
    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Compilation_Create_0200
     * @tc.number SUB_AI_NNRt_Func_North_Compilation_Create_0200
     * @tc.desc   测试编译器创建功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Compilation_Create_0200', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(3);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Compilation_Create_0300
     * @tc.number SUB_AI_NNRt_Func_North_Compilation_Create_0300
     * @tc.desc   测试编译器创建功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Compilation_Create_0300', Level.LEVEL1, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(4);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetDevice_0100
     * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetDevice_0100
     * @tc.desc   测试编译器设置设备功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Compilation_SetDevice_0100', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(5);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetDevice_0200
     * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetDevice_0200
     * @tc.desc   测试编译器设置设备功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Compilation_SetDevice_0200', Level.LEVEL1, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(6);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetCache_0100
     * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetCache_0100
     * @tc.desc   测试编译器缓存设置功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Compilation_SetCache_0100', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(5);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetCache_0200
     * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetCache_0200
     * @tc.desc   测试编译器缓存设置功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Compilation_SetCache_0200', Level.LEVEL1, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(6);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetCache_0300
     * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetCache_0300
     * @tc.desc   测试编译器缓存设置功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Compilation_SetCache_0300', Level.LEVEL1, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(9);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })


    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0100
     * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0100
     * @tc.desc   测试编译器性能模式设置功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0100', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(11);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetPriority_0100
     * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetPriority_0100
     * @tc.desc   测试编译器优先级设置功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Compilation_SetPriority_0100', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(12);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Compilation_EnableFloat16_0100
     * @tc.number SUB_AI_NNRt_Func_North_Compilation_EnableFloat16_0100
     * @tc.desc   测试编译器Float16使能功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Compilation_EnableFloat16_0100', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(13);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Compilation_Build_0100
     * @tc.number SUB_AI_NNRt_Func_North_Compilation_Build_0100
     * @tc.desc   测试编译器构建功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Compilation_Build_0100', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(14);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Compilation_Build_0200
     * @tc.number SUB_AI_NNRt_Func_North_Compilation_Build_0200
     * @tc.desc   测试编译器构建功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Compilation_Build_0200', Level.LEVEL1, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(15);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Compilation_Destroy_0100
     * @tc.number SUB_AI_NNRt_Func_North_Compilation_Destroy_0100
     * @tc.desc   测试编译器销毁功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Compilation_Destroy_0100', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(16);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Compilation_Destroy_0200
     * @tc.number SUB_AI_NNRt_Func_North_Compilation_Destroy_0200
     * @tc.desc   测试编译器销毁功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Compilation_Destroy_0200', Level.LEVEL1, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(17);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })


    // ========== Device 系列测试 ==========

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceID_0100
     * @tc.number SUB_AI_NNRt_Func_North_Device_DeviceID_0100
     * @tc.desc   测试设备ID获取（nullptr参数）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Device_DeviceID_0100', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(19);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceID_0200
     * @tc.number SUB_AI_NNRt_Func_North_Device_DeviceID_0200
     * @tc.desc   测试设备ID获取（已分配地址的指针）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Device_DeviceID_0200', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(20);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceID_0300
     * @tc.number SUB_AI_NNRt_Func_North_Device_DeviceID_0300
     * @tc.desc   测试设备ID获取（count为nullptr）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Device_DeviceID_0300', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(21);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceID_0400
     * @tc.number SUB_AI_NNRt_Func_North_Device_DeviceID_0400
     * @tc.desc   测试正常获取设备ID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AI_NNRt_Func_North_Device_DeviceID_0400', Level.LEVEL2, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(22);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceName_0100
     * @tc.number SUB_AI_NNRt_Func_North_Device_DeviceName_0100
     * @tc.desc   测试获取设备名称（无效设备ID）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Device_DeviceName_0100', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(23);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceName_0200
     * @tc.number SUB_AI_NNRt_Func_North_Device_DeviceName_0200
     * @tc.desc   测试获取设备名称（name为nullptr）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Device_DeviceName_0200', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(24);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceName_0300
     * @tc.number SUB_AI_NNRt_Func_North_Device_DeviceName_0300
     * @tc.desc   测试获取设备名称（name已赋值）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Device_DeviceName_0300', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(25);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceName_0400
     * @tc.number SUB_AI_NNRt_Func_North_Device_DeviceName_0400
     * @tc.desc   测试正常获取设备名称
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Device_DeviceName_0400', Level.LEVEL1, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(26);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceType_0100
     * @tc.number SUB_AI_NNRt_Func_North_Device_DeviceType_0100
     * @tc.desc   测试获取设备类型（type为nullptr）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Device_DeviceType_0100', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(27);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceType_0200
     * @tc.number SUB_AI_NNRt_Func_North_Device_DeviceType_0200
     * @tc.desc   测试获取设备类型（无效设备ID）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Device_DeviceType_0200', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(28);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceType_0300
     * @tc.number SUB_AI_NNRt_Func_North_Device_DeviceType_0300
     * @tc.desc   测试正常获取设备类型
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Device_DeviceType_0300', Level.LEVEL1, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(29);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    // Executor_Create 系列
    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_Create_0100
     * @tc.number SUB_AI_NNRt_Func_North_Executor_Create_0100
     * @tc.desc   测试执行器创建功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_Create_0100', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(30);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_Create_0200
     * @tc.number SUB_AI_NNRt_Func_North_Executor_Create_0200
     * @tc.desc   测试执行器创建功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_Create_0200', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(31);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    // Executor_SetInput 系列
    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_SetInput_0100
     * @tc.number SUB_AI_NNRt_Func_North_Executor_SetInput_0100
     * @tc.desc   测试执行器输入设置功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_SetInput_0100', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(32);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_SetInput_0200
     * @tc.number SUB_AI_NNRt_Func_North_Executor_SetInput_0200
     * @tc.desc   测试执行器输入设置功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_SetInput_0200', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(33);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_SetInput_0300
     * @tc.number SUB_AI_NNRt_Func_North_Executor_SetInput_0300
     * @tc.desc   测试执行器输入设置功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_SetInput_0300', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(34);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_SetInput_0400
     * @tc.number SUB_AI_NNRt_Func_North_Executor_SetInput_0400
     * @tc.desc   测试执行器输入设置功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_SetInput_0400', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(35);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_SetInput_0500
     * @tc.number SUB_AI_NNRt_Func_North_Executor_SetInput_0500
     * @tc.desc   测试执行器输入设置功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_SetInput_0500', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(36);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_SetInput_0600
     * @tc.number SUB_AI_NNRt_Func_North_Executor_SetInput_0600
     * @tc.desc   测试执行器输入设置功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_SetInput_0600', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(37);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_SetInput_0700
     * @tc.number SUB_AI_NNRt_Func_North_Executor_SetInput_0700
     * @tc.desc   测试执行器输入设置功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AI_NNRt_Func_North_Executor_SetInput_0700', Level.LEVEL2, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(38);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    // Executor_SetOutput 系列
    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_SetOutput_0100
     * @tc.number SUB_AI_NNRt_Func_North_Executor_SetOutput_0100
     * @tc.desc   测试执行器输出设置功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_SetOutput_0100', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(39);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_SetOutput_0200
     * @tc.number SUB_AI_NNRt_Func_North_Executor_SetOutput_0200
     * @tc.desc   测试执行器输出设置功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_SetOutput_0200', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(40);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_SetOutput_0300
     * @tc.number SUB_AI_NNRt_Func_North_Executor_SetOutput_0300
     * @tc.desc   测试执行器输出设置功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_SetOutput_0300', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(41);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_SetOutput_0400
     * @tc.number SUB_AI_NNRt_Func_North_Executor_SetOutput_0400
     * @tc.desc   测试执行器输出设置功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_SetOutput_0400', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(42);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_SetOutput_0500
     * @tc.number SUB_AI_NNRt_Func_North_Executor_SetOutput_0500
     * @tc.desc   测试执行器输出设置功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AI_NNRt_Func_North_Executor_SetOutput_0500', Level.LEVEL2, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(43);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    // Executor_Run 系列
    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_Run_0100
     * @tc.number SUB_AI_NNRt_Func_North_Executor_Run_0100
     * @tc.desc   测试执行器运行功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_Run_0100', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(44);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_Run_0200
     * @tc.number SUB_AI_NNRt_Func_North_Executor_Run_0200
     * @tc.desc   测试执行器运行功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_Run_0200', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(45);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_Run_0300
     * @tc.number SUB_AI_NNRt_Func_North_Executor_Run_0300
     * @tc.desc   测试执行器运行功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_Run_0300', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(46);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_Run_0400
     * @tc.number SUB_AI_NNRt_Func_North_Executor_Run_0400
     * @tc.desc   测试执行器运行功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_Run_0400', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(47);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_Run_0500
     * @tc.number SUB_AI_NNRt_Func_North_Executor_Run_0500
     * @tc.desc   测试执行器运行功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_Run_0500', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(48);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_Run_0600
     * @tc.number SUB_AI_NNRt_Func_North_Executor_Run_0600
     * @tc.desc   测试执行器运行功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Executor_Run_0600', Level.LEVEL1, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(49);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_Run_0700
     * @tc.number SUB_AI_NNRt_Func_North_Executor_Run_0700
     * @tc.desc   测试执行器运行功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AI_NNRt_Func_North_Executor_Run_0700', Level.LEVEL1, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(50);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    // Executor_GetOutputDimensions 系列
    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_GetOutputDimensions_0100
     * @tc.number SUB_AI_NNRt_Func_North_Executor_GetOutputDimensions_0100
     * @tc.desc   测试执行器输出维度获取功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_GetOutputDimensions_0100', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(51);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_GetOutputDimensions_0200
     * @tc.number SUB_AI_NNRt_Func_North_Executor_GetOutputDimensions_0200
     * @tc.desc   测试执行器输出维度获取功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_GetOutputDimensions_0200', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(52);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Executor_GetOutputDimensions_0300
     * @tc.number SUB_AI_NNRt_Func_North_Executor_GetOutputDimensions_0300
     * @tc.desc   测试执行器输出维度获取功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Executor_GetOutputDimensions_0300', Level.LEVEL0, async () => {
        try {
          let result: number = await ai_nnrt_interface_test.nnrtInterfaceTest(53);
          expect(result).assertEqual(0);
        } catch (error) {
        expect().assertFail();
        }
    })

  })
}
