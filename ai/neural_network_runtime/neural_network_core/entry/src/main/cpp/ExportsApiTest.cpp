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
#include <vector>

static void AddDescToDescVectorOne(std::vector<napi_property_descriptor>& desc)
{
    desc.push_back({"NNTensorDesc_GetShapeA", nullptr, NNTensorDesc_GetShapeA,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"NNTensorDesc_GetShapeB", nullptr, NNTensorDesc_GetShapeB,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"NNTensorDesc_GetShapeC", nullptr, NNTensorDesc_GetShapeC,
         nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"NNTensorDesc_GetShapeD", nullptr, NNTensorDesc_GetShapeD,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"NNTensorDesc_SetFormatA", nullptr, NNTensorDesc_SetFormatA,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"NNTensorDesc_SetFormatB", nullptr, NNTensorDesc_SetFormatB,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"NNTensorDesc_GetFormatA", nullptr, NNTensorDesc_GetFormatA,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"NNTensorDesc_GetFormatB", nullptr, NNTensorDesc_GetFormatB,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"NNTensorDesc_GetFormatC", nullptr, NNTensorDesc_GetFormatC,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"NNTensorDesc_GetElementCountA", nullptr, NNTensorDesc_GetElementCountA,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"NNTensorDesc_GetElementCountB", nullptr, NNTensorDesc_GetElementCountB,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"NNTensorDesc_GetElementCountC", nullptr, NNTensorDesc_GetElementCountC,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"NNTensorDesc_GetElementCountD", nullptr, NNTensorDesc_GetElementCountD,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"NNTensorDesc_GetByteSizeA", nullptr, NNTensorDesc_GetByteSizeA,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"NNTensorDesc_GetByteSizeB", nullptr, NNTensorDesc_GetByteSizeB,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"NNTensorDesc_GetByteSizeC", nullptr, NNTensorDesc_GetByteSizeC,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"NNQuantParam_SetScalesA", nullptr, NNQuantParam_SetScalesA,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"NNQuantParam_SetScalesB", nullptr, NNQuantParam_SetScalesB,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"NNQuantParam_SetScalesC", nullptr, NNQuantParam_SetScalesC,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"NNQuantParam_SetScalesD", nullptr, NNQuantParam_SetScalesD,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"NNQuantParam_SetZeroPointsA", nullptr, NNQuantParam_SetZeroPointsA,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"NNQuantParam_SetZeroPointsB", nullptr, NNQuantParam_SetZeroPointsB,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"NNQuantParam_SetZeroPointsC", nullptr, NNQuantParam_SetZeroPointsC,
        nullptr, nullptr, nullptr, napi_default, nullptr});
}

static void AddDescToDescVectorTwo(std::vector<napi_property_descriptor>& desc)
{
    desc.push_back({"NNQuantParam_SetZeroPointsD", nullptr, NNQuantParam_SetZeroPointsD,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"NNQuantParam_SetNumBitsA", nullptr, NNQuantParam_SetNumBitsA,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"NNQuantParam_SetNumBitsB", nullptr, NNQuantParam_SetNumBitsB,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"NNQuantParam_SetNumBitsC", nullptr, NNQuantParam_SetNumBitsC,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"NNQuantParam_SetNumBitsD", nullptr, NNQuantParam_SetNumBitsD,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"NNQuantParam_DestroyA", nullptr, NNQuantParam_DestroyA,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"NNQuantParam_DestroyB", nullptr, NNQuantParam_DestroyB,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"NNReturnCode_DynamicShape", nullptr, NNReturnCode_DynamicShape,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"NNFuseType_FusedRelu", nullptr, NNFuseType_FusedRelu,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"NNFuseType_FusedRelu6", nullptr, NNFuseType_FusedRelu6,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"NNOperationType_OpsExpandDimsA", nullptr, NNOperationType_OpsExpandDimsA,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"NNDataTypeCommonTest", nullptr, NNDataTypeCommonTest,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"NNOperationTypeCommonTest", nullptr, NNOperationTypeCommonTest,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"NNDeviceTypeCommonTest", nullptr, NNDeviceTypeCommonTest,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"HandleTensorOperations", nullptr, HandleTensorOperations,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OhNnQuantParamCode", nullptr, OhNnQuantParamCode,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"OhNnMemoryCode", nullptr, OhNnMemoryCode,
        nullptr, nullptr, nullptr, napi_default, nullptr});
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    std::vector<napi_property_descriptor> desc = {
        {"NNTensorDesc_DestroyA", nullptr, NNTensorDesc_DestroyA, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"NNTensorDesc_DestroyB", nullptr, NNTensorDesc_DestroyB, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"NNTensorDesc_SetNameA", nullptr, NNTensorDesc_SetNameA, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"NNTensorDesc_SetNameB", nullptr, NNTensorDesc_SetNameB, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"NNTensorDesc_SetNameC", nullptr, NNTensorDesc_SetNameC, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"NNTensorDesc_GetNameA", nullptr, NNTensorDesc_GetNameA, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"NNTensorDesc_GetNameB", nullptr, NNTensorDesc_GetNameB, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"NNTensorDesc_GetNameC", nullptr, NNTensorDesc_GetNameC, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"NNTensorDesc_SetDataTypeA", nullptr, NNTensorDesc_SetDataTypeA, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"NNTensorDesc_SetDataTypeB", nullptr, NNTensorDesc_SetDataTypeB, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"NNTensorDesc_GetDataTypeA", nullptr, NNTensorDesc_GetDataTypeA, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"NNTensorDesc_GetDataTypeB", nullptr, NNTensorDesc_GetDataTypeB, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"NNTensorDesc_GetDataTypeC", nullptr, NNTensorDesc_GetDataTypeC, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"NNTensorDesc_SetShapeA", nullptr, NNTensorDesc_SetShapeA, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"NNTensorDesc_SetShapeB", nullptr, NNTensorDesc_SetShapeB, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"NNTensorDesc_SetShapeC", nullptr, NNTensorDesc_SetShapeC, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"NNTensorDesc_SetShapeD", nullptr, NNTensorDesc_SetShapeD, nullptr,
            nullptr, nullptr, napi_default, nullptr}
    };
    AddDescToDescVectorOne(desc);
    AddDescToDescVectorTwo(desc);
    napi_define_properties(env, exports, desc.size(), desc.data());
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "neuralnetworkcoretest",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }