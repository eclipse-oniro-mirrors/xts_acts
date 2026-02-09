/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

/**
 * Run EndToEnd test case
 * @param testCase Test case number (100 or 300)
 * @returns 0 for success, -1 for failure
 * 
 * Test cases:
 * - 100: sub_AI_NNRt_Core_Func_North_EndToEnd_0100 (定长模型编译端到端测试)
 * - 300: sub_AI_NNRt_Core_Func_North_EndToEnd_0300 (定长模型编译带量化参数端到端测试)
 */
export const sub_AI_NNRt_Core_Func_North_EndToEnd: (testCase: number) => number;

/**
 * Run Reliability test (async with Promise)
 * @returns Promise that resolves to 0 for success, -1 for failure
 * 
 * Test case:
 * - sub_AI_NNRt_Core_Func_North_Reliability_0100 (定长模型编译长稳测试)
 */
export const sub_AI_NNRt_Core_Func_North_Reliability: () => Promise<number>;