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

#include "NeuralNetworkCoreTest.h"
#include <neural_network_runtime/neural_network_runtime.h>

napi_value NNTensorDesc_DestroyA(napi_env env, napi_callback_info info)
{
    OH_NN_ReturnCode returnValue = OH_NN_ReturnCode::OH_NN_FAILED;
    napi_value result;
    NN_TensorDesc *tensorDesc = OH_NNTensorDesc_Create();
    if (tensorDesc == nullptr) {
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        return result;
    }
    returnValue = OH_NNTensorDesc_Destroy(&tensorDesc);
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}
