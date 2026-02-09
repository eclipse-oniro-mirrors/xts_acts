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

#include "neural_network_runtime/neural_network_runtime.h"
#include "include/NnrtUtilsTest.h"

using namespace OHOS::NeuralNetworkRuntime;
using namespace OHOS::NeuralNetworkRuntime::Test;

/**
 * @tc.name   SUB_AI_NNR_Reliability_North_Stress_0100
 * @tc.number SUB_AI_NNR_Reliability_North_Stress_0100
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   RELIABILITY
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
static int BuildAndCompileModel(const OHNNGraphArgs &graphArgs,
    const OHNNCompileParam &compileParam, int iteration)
{
    OH_NNModel *model1 = OH_NNModel_Construct();
    if (model1 == nullptr) {
        OH_LOG_ERROR(LOG_APP,
            "[Test] FAILED at iteration %{public}d:",
            " OH_NNModel_Construct returned nullptr", iteration);
        return -1;
    }

    int ret = BuildSingleOpGraph(model1, graphArgs);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP,
            "[Test] FAILED at iteration %{public}d:",
            " BuildSingleOpGraph failed, ret=%{public}d",
            iteration, ret);
        OH_NNModel_Destroy(&model1);
        return -1;
    }

    OH_NNCompilation *compilation1 = OH_NNCompilation_Construct(model1);
    if (compilation1 == nullptr) {
        OH_LOG_ERROR(LOG_APP,
            "[Test] FAILED at iteration %{public}d:",
            " OH_NNCompilation_Construct returned nullptr", iteration);
        OH_NNModel_Destroy(&model1);
        return -1;
    }

    ret = CompileGraphMock(compilation1, compileParam);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP,
            "[Test] FAILED at iteration %{public}d:",
            " CompileGraphMock failed, ret=%{public}d", iteration, ret);
        Free(model1, compilation1);
        return -1;
    }

    Free(model1, compilation1);
    return 0;
}

static int SubAiNnrReliabilityNorthStress0100()
{
    OH_LOG_INFO(LOG_APP,
        "[Test] ========== SUB_AI_NNR_Reliability_North_Stress_0100",
        " START ==========");
    OH_LOG_INFO(LOG_APP,
        "[Test] Stress test: Running %{public}d iterations", STRESS_COUNT);

    OHNNCompileParam compileParam;
    AddModel addModel;
    OHNNGraphArgs graphArgs = addModel.graphArgs;

    for (int i = 0; i < STRESS_COUNT; i++) {
        int ret = BuildAndCompileModel(graphArgs, compileParam, i);
        if (ret != 0) {
            return -1;
        }

        if (i % PRINT_FREQ == 0) {
            OH_LOG_INFO(LOG_APP,
                "[Test] SUB_AI_NNR_Reliability_North_Stress_0100",
                " progress: %{public}d/%{public}d", i, STRESS_COUNT);
        }
    }

    OH_LOG_INFO(LOG_APP,
        "[Test] ========== SUB_AI_NNR_Reliability_North_Stress_0100",
        " PASSED ==========");
    OH_LOG_INFO(LOG_APP,
        "[Test] All %{public}d iterations completed successfully",
        STRESS_COUNT);
    return 0;
}

/**
 * @tc.name   SUB_AI_NNR_Reliability_North_Stress_0200
 * @tc.number SUB_AI_NNR_Reliability_North_Stress_0200
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   RELIABILITY
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */

static int ExecuteWithExecutor(OH_NNCompilation *compilation,
    const OHNNGraphArgs &graphArgs, int iteration)
{
    OH_NNExecutor *executor1 = OH_NNExecutor_Construct(compilation);
    if (executor1 == nullptr) {
        OH_LOG_ERROR(LOG_APP,
            "[Test] FAILED at iteration %{public}d:",
            " OH_NNExecutor_Construct returned nullptr", iteration);
        return -1;
    }

    int ret = ExecuteGraphMock(executor1, graphArgs, nullptr);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP,
            "[Test] FAILED at iteration %{public}d:",
            " ExecuteGraphMock failed, ret=%{public}d", iteration, ret);
        OH_NNExecutor_Destroy(&executor1);
        return -1;
    }

    OH_NNExecutor_Destroy(&executor1);
    if (executor1 != nullptr) {
        OH_LOG_ERROR(LOG_APP,
            "[Test] FAILED at iteration %{public}d:",
            " executor1 should be nullptr after destroy", iteration);
        return -1;
    }

    return 0;
}

static int PrepareModelAndCompilation(OH_NNModel **model,
    OH_NNCompilation **compilation, const OHNNGraphArgs &graphArgs,
    const OHNNCompileParam &compileParam)
{
    *model = OH_NNModel_Construct();
    if (*model == nullptr) {
        OH_LOG_ERROR(LOG_APP,
            "[Test] FAILED: OH_NNModel_Construct returned nullptr");
        return -1;
    }

    int ret = BuildSingleOpGraph(*model, graphArgs);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP,
            "[Test] FAILED: BuildSingleOpGraph failed, ret=%{public}d",
            ret);
        OH_NNModel_Destroy(model);
        return -1;
    }

    *compilation = OH_NNCompilation_Construct(*model);
    if (*compilation == nullptr) {
        OH_LOG_ERROR(LOG_APP,
            "[Test] FAILED: OH_NNCompilation_Construct returned nullptr");
        OH_NNModel_Destroy(model);
        return -1;
    }

    ret = CompileGraphMock(*compilation, compileParam);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP,
            "[Test] FAILED: CompileGraphMock failed, ret=%{public}d", ret);
        Free(*model, *compilation);
        return -1;
    }

    return 0;
}

static int SubAiNnrReliabilityNorthStress0200()
{
    OH_LOG_INFO(LOG_APP,
        "[Test] ========== SUB_AI_NNR_Reliability_North_Stress_0200",
        " START ==========");
    OH_LOG_INFO(LOG_APP,
        "[Test] Executor stress test: Running %{public}d iterations",
        STRESS_COUNT);

    OHNNCompileParam compileParam;
    AddModel addModel;
    OHNNGraphArgs graphArgs = addModel.graphArgs;

    OH_NNModel *model1 = nullptr;
    OH_NNCompilation *compilation1 = nullptr;
    int ret = PrepareModelAndCompilation(&model1, &compilation1,
        graphArgs, compileParam);
    if (ret != 0) {
        return -1;
    }

    for (int i = 0; i < STRESS_COUNT; i++) {
        ret = ExecuteWithExecutor(compilation1, graphArgs, i);
        if (ret != 0) {
            Free(model1, compilation1);
            return -1;
        }

        if (i % PRINT_FREQ == 0) {
            OH_LOG_INFO(LOG_APP,
                "[Test] SUB_AI_NNR_Reliability_North_Stress_0200",
                " progress: %{public}d/%{public}d", i, STRESS_COUNT);
        }
    }

    Free(model1, compilation1);

    OH_LOG_INFO(LOG_APP,
        "[Test] ========== SUB_AI_NNR_Reliability_North_Stress_0200",
        " PASSED ==========");
    OH_LOG_INFO(LOG_APP,
        "[Test] All %{public}d iterations completed successfully",
        STRESS_COUNT);
    return 0;
}
