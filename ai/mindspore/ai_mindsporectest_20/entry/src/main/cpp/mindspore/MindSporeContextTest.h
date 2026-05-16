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
#ifndef MINDSPORE_CONTEXT_TEST_H
#define MINDSPORE_CONTEXT_TEST_H

#include <napi/native_api.h>
#include "common/Common.h"
#include "mindspore/context.h"
#include "mindspore/types.h"
namespace MindSporeContextTest {
    napi_value DeviceInfoGetPriorityTest_001(napi_env env, napi_callback_info info);
    napi_value CallBackParamTest_001(napi_env env, napi_callback_info info);
    napi_value CallBackParamTest_002(napi_env env, napi_callback_info info);
    napi_value CallBackParamTest_003(napi_env env, napi_callback_info info);
    napi_value TensorSetAllocatorTest_001(napi_env env, napi_callback_info info);
    napi_value TensorGetAllocatorTest_001(napi_env env, napi_callback_info info);

}

#endif // MINDSPORE_CONTEXT_TEST_H