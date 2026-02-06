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

#include "ModelTest.h"
#include <hilog/log.h>
#include <neural_network_runtime/neural_network_core.h>
#include <neural_network_runtime/neural_network_runtime.h>
#include <neural_network_runtime/neural_network_runtime_type.h>
#include "NnrtUtilsTest.h"
#include "model.h"

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x0000
#define LOG_TAG "ModelTest"

using namespace OHOS::NeuralNetworkRuntime::Test;

namespace OHOS {
namespace NeuralNetworkRuntime {

static int BuildAddTopKGraph(OH_NNModel* model)
{
    AddTopKModel addTopKModel;
    OHNNGraphArgsMulti graphArgsMulti = addTopKModel.graphArgs;
    OH_NN_ReturnCode ret = (OH_NN_ReturnCode)BuildMultiOpGraph(model, graphArgsMulti);
    if (ret != OH_NN_SUCCESS) {
        return -1;
    }
    return 0;
}

static int BuildModel(OH_NNModel* model, const OHNNGraphArgs& graphArgs)
{
    OH_NN_ReturnCode ret = (OH_NN_ReturnCode)BuildSingleOpGraph(model, graphArgs);
    if (ret != OH_NN_SUCCESS) {
        return -1;
    }
    return 0;
}

int SubAiNnRtFuncNorthModelCreateModel0100()
{
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Model_CreateModel_0100 start");
    OH_NNModel* model = OH_NNModel_Construct();
    if (model == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct model");
        return -1;
    }
    Free(model);
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Model_CreateModel_0100 passed");
    return 0;
}

int SubAiNnRtFuncNorthModelCreateModel0200()
{
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Model_CreateModel_0200 start");
    OH_NNModel* model_first = OH_NNModel_Construct();
    if (model_first == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct model_first");
        return -1;
    }

    OH_NNModel* model_second = OH_NNModel_Construct();
    if (model_second == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct model_second");
        Free(model_first);
        return -1;
    }

    OH_NNModel* model_third = OH_NNModel_Construct();
    if (model_third == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct model_third");
        Free(model_first);
        Free(model_second);
        return -1;
    }

    if (model_first == model_second || model_first == model_third || model_second == model_third) {
        OH_LOG_ERROR(LOG_APP, "Models should be different instances");
        Free(model_first);
        Free(model_second);
        Free(model_third);
        return -1;
    }

    Free(model_first);
    Free(model_second);
    Free(model_third);
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Model_CreateModel_0200 passed");
    return 0;
}

int SubAiNnRtFuncNorthModelAddOperand0100()
{
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Model_AddOperand_0100 start");
    int32_t dimensions[3]{ 3, 2, 2 };
    OH_NN_Tensor operand{ OH_NN_FLOAT32, 3, dimensions, nullptr, OH_NN_TENSOR };
    OH_NN_ReturnCode ret = OH_NNModel_AddTensor(nullptr, &operand);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "Expected OH_NN_INVALID_PARAMETER, got %{public}d", ret);
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Model_AddOperand_0100 passed");
    return 0;
}

} // namespace NeuralNetworkRuntime
} // namespace OHOS
