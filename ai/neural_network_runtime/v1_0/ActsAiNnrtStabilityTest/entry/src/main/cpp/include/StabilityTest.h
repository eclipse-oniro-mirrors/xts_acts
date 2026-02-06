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

#ifndef STABILITY_TEST_H
#define STABILITY_TEST_H

namespace OHOS {
namespace NeuralNetworkRuntime {

/**
 * @tc.name   SUB_AI_NNR_Reliability_North_Stress_0100
 * @tc.number SUB_AI_NNR_Reliability_North_Stress_0100
 * @tc.desc   压力测试：多次创建销毁模型和编译
 * @tc.type   RELIABILITY
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SubAiNnrReliabilityNorthStress0100();

/**
 * @tc.name   SUB_AI_NNR_Reliability_North_Stress_0200
 * @tc.number SUB_AI_NNR_Reliability_North_Stress_0200
 * @tc.desc   压力测试：反复创建销毁执行器
 * @tc.type   RELIABILITY
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SubAiNnrReliabilityNorthStress0200();

} // namespace NeuralNetworkRuntime
} // namespace OHOS

#endif // STABILITY_TEST_H

