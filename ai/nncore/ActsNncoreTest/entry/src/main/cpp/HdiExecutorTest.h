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

#ifndef HDI_EXECUTOR_TEST_H
#define HDI_EXECUTOR_TEST_H

namespace OHOS {
namespace NeuralNetworkCore {

// Executor Test Cases
int TestExecutorConstruct0100();
int TestExecutorDestroy0100();
int TestExecutorDestroy0200();
int TestExecutorSetOnRunDone0100();
int TestExecutorSetOnRunDone0200();
int TestExecutorSetOnServiceDied0100();
int TestExecutorSetOnServiceDied0200();
int TestExecutorRunSync0100();
int TestExecutorRunSync0200();
int TestExecutorRunSync0300();
int TestExecutorRunSync0400();
int TestExecutorRunSync0500();
int TestExecutorRunSync0600();
int TestExecutorRunSync0700();
int TestExecutorRunSync0800();
int TestExecutorRunSync0900();
int TestExecutorRunAsync0100();
int TestExecutorRunAsync0200();
int TestExecutorRunAsync0300();
int TestExecutorRunAsync0400();
int TestExecutorRunAsync0500();
int TestExecutorRunAsync0600();
int TestExecutorGetOutputShape0100();
int TestExecutorGetOutputShape0200();
int TestExecutorGetOutputShape0300();
int TestExecutorGetInputCount0100();
int TestExecutorGetInputCount0200();
int TestExecutorGetInputCount0300();
int TestExecutorGetOutputCount0100();
int TestExecutorGetOutputCount0200();
int TestExecutorGetOutputCount0300();
int TestExecutorCreateInputTensorDesc0100();
int TestExecutorCreateInputTensorDesc0200();
int TestExecutorCreateInputTensorDesc0300();
int TestExecutorCreateOutputTensorDesc0100();
int TestExecutorCreateOutputTensorDesc0200();
int TestExecutorCreateOutputTensorDesc0300();
int TestExecutorGetInputDimRange0100();
int TestExecutorGetInputDimRange0200();
int TestExecutorGetInputDimRange0500();
int TestExecutorGetInputDimRange0600();
int TestExecutorGetInputDimRange0700();

} // namespace NeuralNetworkCore
} // namespace OHOS

#endif // HDI_EXECUTOR_TEST_H

