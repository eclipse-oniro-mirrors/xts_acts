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

#ifndef EXECUTOR_TEST_H
#define EXECUTOR_TEST_H

namespace OHOS {
namespace NeuralNetworkRuntime {

// Executor_Create 系列
int SubAiNnRtFuncNorthExecutorCreate0100();
int SubAiNnRtFuncNorthExecutorCreate0200();

// Executor_SetInput 系列
int SubAiNnRtFuncNorthExecutorSetInput0100();

// Executor_Run 系列
int SubAiNnRtFuncNorthExecutorRun0100();

// Executor_Destroy 系列
int SubAiNnRtFuncNorthExecutorDestroy0100();

} // namespace NeuralNetworkRuntime
} // namespace OHOS

#endif // EXECUTOR_TEST_H
