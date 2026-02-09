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

#ifndef COMPILE_TEST_H
#define COMPILE_TEST_H

namespace OHOS {
namespace NeuralNetworkRuntime {

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_Create_0100
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_Create_0100
 * @tc.desc   测试OH_NNCompilation_Construct(nullptr)是否正确返回nullptr
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
int SubAiNnRtFuncNorthCompilationCreate0100();

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_Create_0200
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_Create_0200
 * @tc.desc   测试OH_NNCompilation_Construct创建后Build的行为
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
int SubAiNnRtFuncNorthCompilationCreate0200();

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetDevice_0100
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetDevice_0100
 * @tc.desc   测试OH_NNCompilation_SetDevice参数为nullptr的情况
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
int SubAiNnRtFuncNorthCompilationSetDevice0100();

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetDevice_0200
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetDevice_0200
 * @tc.desc   测试OH_NNCompilation_SetDevice使用无效设备ID
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
int SubAiNnRtFuncNorthCompilationSetDevice0200();

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetDevice_0300
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetDevice_0300
 * @tc.desc   测试标准编译流程，模型构建、编译器创建、编译执行
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
int SubAiNnRtFuncNorthCompilationSetDevice0300();

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetCache_0100
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetCache_0100
 * @tc.desc   测试OH_NNCompilation_SetCache参数为nullptr的情况
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
int SubAiNnRtFuncNorthCompilationSetCache0100();

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetCache_0200
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetCache_0200
 * @tc.desc   测试OH_NNCompilation_SetCache缓存路径为nullptr
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
int SubAiNnRtFuncNorthCompilationSetCache0200();

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetCache_0400
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetCache_0400
 * @tc.desc   测试OH_NNCompilation_SetCache缓存目录和版本设置
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
int SubAiNnRtFuncNorthCompilationSetCache0400();

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0100
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0100
 * @tc.desc   测试OH_NNCompilation_SetPerformanceMode参数为nullptr
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
int SubAiNnRtFuncNorthCompilationSetPerformanceMode0100();

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetPriority_0100
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetPriority_0100
 * @tc.desc   测试OH_NNCompilation_SetPriority参数为nullptr
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
int SubAiNnRtFuncNorthCompilationSetPriority0100();

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_EnableFloat16_0100
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_EnableFloat16_0100
 * @tc.desc   测试OH_NNCompilation_EnableFloat16参数为nullptr
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
int SubAiNnRtFuncNorthCompilationEnableFloat160100();

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_Build_0100
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_Build_0100
 * @tc.desc   测试OH_NNCompilation_Build参数为nullptr
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
int SubAiNnRtFuncNorthCompilationBuild0100();

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_Build_0200
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_Build_0200
 * @tc.desc   测试OH_NNCompilation_Build正常编译流程
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SubAiNnRtFuncNorthCompilationBuild0200();

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_Build_0300
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_Build_0300
 * @tc.desc   测试核心构建功能，完整的编译流程验证
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int SubAiNnRtFuncNorthCompilationBuild0300();

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_Destroy_0100
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_Destroy_0100
 * @tc.desc   测试OH_NNCompilation_Destroy参数为nullptr的情况
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
int SubAiNnRtFuncNorthCompilationDestroy0100();

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_Destroy_0200
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_Destroy_0200
 * @tc.desc   测试OH_NNCompilation_Destroy销毁已设置设备的编译器
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SubAiNnRtFuncNorthCompilationDestroy0200();

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_Destroy_0300
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_Destroy_0300
 * @tc.desc   测试OH_NNCompilation_Destroy销毁已编译的编译器
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SubAiNnRtFuncNorthCompilationDestroy0300();

// ========== 补充测试用例 ==========

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_Build_0400
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_Build_0400
 * @tc.desc   测试OH_NNCompilation_Build带缓存目录的编译
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SubAiNnRtFuncNorthCompilationBuild0400();

/**
 * @tc.name   SUB_AI_NNR_Func_North_Compilation_Combine_0100
 * @tc.number SUB_AI_NNR_Func_North_Compilation_Combine_0100
 * @tc.desc   测试多线程并发编译
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SubAiNnrFuncNorthCompilationCombine0100();

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_Combine_0200
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_Combine_0200
 * @tc.desc   测试同一模型重复编译
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SubAiNnRtFuncNorthCompilationCombine0200();

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_EnableFloat16_0200
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_EnableFloat16_0200
 * @tc.desc   测试禁用FP16
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
int SubAiNnRtFuncNorthCompilationEnableFloat160200();

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetCache_0500
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetCache_0500
 * @tc.desc   测试损坏缓存文件处理
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SubAiNnRtFuncNorthCompilationSetCache0500();

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetCache_0600
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetCache_0600
 * @tc.desc   测试缓存版本低于当前版本
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SubAiNnRtFuncNorthCompilationSetCache0600();

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetCache_0700
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetCache_0700
 * @tc.desc   测试缓存版本匹配
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SubAiNnRtFuncNorthCompilationSetCache0700();

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetCache_0800
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetCache_0800
 * @tc.desc   测试缓存版本高于当前版本
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SubAiNnRtFuncNorthCompilationSetCache0800();

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0300
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0300
 * @tc.desc   测试PERFORMANCE_NONE模式
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SubAiNnRtFuncNorthCompilationSetPerformanceMode0300();

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0400
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0400
 * @tc.desc   测试PERFORMANCE_LOW模式
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SubAiNnRtFuncNorthCompilationSetPerformanceMode0400();

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0500
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0500
 * @tc.desc   测试PERFORMANCE_MEDIUM模式
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SubAiNnRtFuncNorthCompilationSetPerformanceMode0500();

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0600
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0600
 * @tc.desc   测试PERFORMANCE_HIGH模式
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SubAiNnRtFuncNorthCompilationSetPerformanceMode0600();

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0700
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0700
 * @tc.desc   测试PERFORMANCE_EXTREME模式
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SubAiNnRtFuncNorthCompilationSetPerformanceMode0700();

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0800
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0800
 * @tc.desc   测试无效性能模式（低于最小值）
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
int SubAiNnRtFuncNorthCompilationSetPerformanceMode0800();

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0900
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0900
 * @tc.desc   测试无效性能模式（高于最大值）
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
int SubAiNnRtFuncNorthCompilationSetPerformanceMode0900();

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetPriority_0300
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetPriority_0300
 * @tc.desc   测试PRIORITY_NONE
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SubAiNnRtFuncNorthCompilationSetPriority0300();

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetPriority_0400
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetPriority_0400
 * @tc.desc   测试PRIORITY_LOW
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SubAiNnRtFuncNorthCompilationSetPriority0400();

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetPriority_0500
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetPriority_0500
 * @tc.desc   测试PRIORITY_MEDIUM
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SubAiNnRtFuncNorthCompilationSetPriority0500();

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetPriority_0600
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetPriority_0600
 * @tc.desc   测试PRIORITY_HIGH
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SubAiNnRtFuncNorthCompilationSetPriority0600();

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetPriority_0700
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetPriority_0700
 * @tc.desc   测试无效优先级（低于最小值）
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
int SubAiNnRtFuncNorthCompilationSetPriority0700();

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetPriority_0800
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetPriority_0800
 * @tc.desc   测试无效优先级（高于最大值）
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
int SubAiNnRtFuncNorthCompilationSetPriority0800();

} // namespace NeuralNetworkRuntime
} // namespace OHOS

#endif // COMPILE_TEST_H
