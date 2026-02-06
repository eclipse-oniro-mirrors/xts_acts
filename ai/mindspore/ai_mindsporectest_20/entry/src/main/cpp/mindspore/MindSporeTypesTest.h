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
#ifndef MINDSPORE_TYPES_TEST_H
#define MINDSPORE_TYPES_TEST_H

#include <napi/native_api.h>
#include "common/Common.h"

namespace MindSporeTypesTest {
    napi_value DeviceTypeTest_001(napi_env env, napi_callback_info info);
    napi_value ModelTypetest_001(napi_env env, napi_callback_info info);
    napi_value NNRTDeviceTypetest_001(napi_env env, napi_callback_info info);
    napi_value OptimizationLevelTest_001(napi_env env, napi_callback_info info);
    napi_value OptimizationLevelTest_002(napi_env env, napi_callback_info info);
    napi_value OptimizationLevelTest_003(napi_env env, napi_callback_info info);
    napi_value OptimizationLevelTest_004(napi_env env, napi_callback_info info);
    napi_value OptimizationLevelTest_005(napi_env env, napi_callback_info info);
}

#endif // MINDSPORE_MODEL_TEST_H