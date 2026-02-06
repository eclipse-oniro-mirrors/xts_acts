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

#include "StabilityTest.h"
#include <neural_network_runtime/neural_network_runtime.h>
#include <neural_network_runtime/neural_network_runtime_type.h>
#include "include/NnrtUtilsTest.h"
#include "include/model.h"
#include "neural_network_runtime/neural_network_core.h"

using namespace OHOS::NeuralNetworkRuntime::Test;

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
int SubAiNnrReliabilityNorthStress0100()
{
    OHNNCompileParam compileParam;
    AddModel addModel;
    OHNNGraphArgs graphArgs = addModel.graphArgs;
    for (int i = 0; i < STRESS_COUNT; i++) {
        OH_NNModel* model1 = OH_NNModel_Construct();
        ASSERT_NE(nullptr, model1);
        ASSERT_EQ(OH_NN_SUCCESS, BuildSingleOpGraph(model1, graphArgs));

        OH_NNCompilation* compilation1 = OH_NNCompilation_Construct(model1);
        ASSERT_NE(nullptr, compilation1);
        ASSERT_EQ(OH_NN_SUCCESS, CompileGraphMock(compilation1, compileParam));

        Free(model1, compilation1);
        if (i % PRINT_FREQ == 0) {
            OHPrintf("[NnrtTest] SUB_AI_NNR_Reliability_North_Stress_0100 times: %d/%d\n", i, STRESS_COUNT);
        }
    }
    return OH_NN_SUCCESS;
}

/**
 * @tc.name   SUB_AI_NNR_Reliability_North_Stress_0200
 * @tc.number SUB_AI_NNR_Reliability_North_Stress_0200
 * @tc.desc   压力测试：反复创建销毁执行器
 * @tc.type   RELIABILITY
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int SubAiNnrReliabilityNorthStress0200()
{
    OHNNCompileParam compileParam;
    AddModel addModel;
    OHNNGraphArgs graphArgs = addModel.graphArgs;
    OH_NNModel* model1 = OH_NNModel_Construct();
    ASSERT_NE(nullptr, model1);
    ASSERT_EQ(OH_NN_SUCCESS, BuildSingleOpGraph(model1, graphArgs));

    OH_NNCompilation* compilation1 = OH_NNCompilation_Construct(model1);
    ASSERT_NE(nullptr, compilation1);
    ASSERT_EQ(OH_NN_SUCCESS, CompileGraphMock(compilation1, compileParam));

    for (int i = 0; i < STRESS_COUNT; i++) {
        OH_NNExecutor* executor1 = OH_NNExecutor_Construct(compilation1);
        ASSERT_NE(nullptr, executor1);
        ASSERT_EQ(OH_NN_SUCCESS, ExecuteGraphMock(executor1, graphArgs, nullptr));
        OH_NNExecutor_Destroy(&executor1);
        ASSERT_EQ(nullptr, executor1);
        if (i % PRINT_FREQ == 0) {
            OHPrintf("[NnrtTest] SUB_AI_NNR_Reliability_North_Stress_0200 times: %d/%d\n", i, STRESS_COUNT);
        }
    }
    Free(model1, compilation1);
    return OH_NN_SUCCESS;
}

} // namespace NeuralNetworkRuntime
} // namespace OHOS
