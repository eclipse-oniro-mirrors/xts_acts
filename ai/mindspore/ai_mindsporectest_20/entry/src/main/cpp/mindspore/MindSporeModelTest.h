/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
#ifndef MINDSPORE_MODEL_TEST_H
#define MINDSPORE_MODEL_TEST_H

#include <napi/native_api.h>
#include "common/Common.h"
#include "mindspore/context.h"
#include "mindspore/types.h"

namespace MindSporeModelTest {
    napi_value TrainCfgCreateTest_001(napi_env env, napi_callback_info info);
    napi_value TrainCfgDestroyTest_001(napi_env env, napi_callback_info info);
    napi_value TrainCfgGetLossNameTest_001(napi_env env, napi_callback_info info);
    napi_value TrainCfgGetLossNameTest_002(napi_env env, napi_callback_info info);
    napi_value TrainCfgGetLossNameTest_003(napi_env env, napi_callback_info info);
    napi_value TrainCfgSetLossNameTest_001(napi_env env, napi_callback_info info);
    napi_value TrainCfgGetOptimizationLevelTest_001(napi_env env, napi_callback_info info);
    napi_value TrainCfgGetOptimizationLevelTest_002(napi_env env, napi_callback_info info);
    napi_value TrainCfgSetOptimizationLevelTest_001(napi_env env, napi_callback_info info);
    napi_value TrainCfgSetOptimizationLevelTest_002(napi_env env, napi_callback_info info);
    napi_value TrainModelBuildTest_001(napi_env env, napi_callback_info info);
    napi_value TrainModelBuildFromFileTest_001(napi_env env, napi_callback_info info);
    napi_value RunStepTest_001(napi_env env, napi_callback_info info);
    napi_value ModelSetLearningRateTest_001(napi_env env, napi_callback_info info);
    napi_value ModelGetLearningRateTest_001(napi_env env, napi_callback_info info);
    napi_value ModelGetWeightsTest_001(napi_env env, napi_callback_info info);
    napi_value ModelUpdateWeightsTest_001(napi_env env, napi_callback_info info);
    napi_value ModelGetTrainModeTest_001(napi_env env, napi_callback_info info);
    napi_value ModelSetTrainModeTest_001(napi_env env, napi_callback_info info);
    napi_value ModelSetupVirtualBatchTest_001(napi_env env, napi_callback_info info);
    napi_value ExportModelTest_001(napi_env env, napi_callback_info info);
    napi_value ExportModelBufferTest_001(napi_env env, napi_callback_info info);
    napi_value ExportWeightsCollaborateTest_001(napi_env env, napi_callback_info info);
    napi_value ModelLoadConfigTest_001(napi_env env, napi_callback_info info);
    napi_value QuantizationTypeTest_001(napi_env env, napi_callback_info info);
    napi_value QuantizationTypeTest_002(napi_env env, napi_callback_info info);
    napi_value QuantizationTypeTest_003(napi_env env, napi_callback_info info);
    napi_value QuantizationTypeTest_004(napi_env env, napi_callback_info info);
}

#endif // MINDSPORE_MODEL_TEST_H