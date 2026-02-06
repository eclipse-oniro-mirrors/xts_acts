/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * 运行 API 测试
 * @param caseNumber 测试用例编号 (0-21)
 * @returns 测试结果，0 表示成功，-1 表示失败
 */
export const runApiTest: (caseNumber: number) => number;

/**
 * 运行功能测试
 * @param caseNumber 测试用例编号 (0-63)
 * @returns 测试结果，0 表示成功，-1 表示失败
 */
export const runFuncTest: (caseNumber: number) => number;

/**
 * 运行功能测试 (异步版本，用于 2200 和 2300)
 * @param caseNumber 测试用例编号 (19 或 20)
 * @returns Promise<number> 测试结果，0 表示成功，-1 表示失败
 */
export const runFuncTestAsync: (caseNumber: number) => Promise<number>;

/**
 * 运行功能测试2
 * @param caseNumber 测试用例编号 (0-48)
 * @returns 测试结果，0 表示成功，-1 表示失败
 */
export const runFunc2Test: (caseNumber: number) => number;

/**
 * 运行流程测试
 * @param caseNumber 测试用例编号 (0-25)
 * @returns 测试结果，0 表示成功，-1 表示失败
 */
export const runProcTest: (caseNumber: number) => number;

/**
 * 运行网络测试
 * @param caseNumber 测试用例编号 (0-9)
 * @returns 测试结果，0 表示成功，-1 表示失败
 */
export const runNetTest: (caseNumber: number) => number;