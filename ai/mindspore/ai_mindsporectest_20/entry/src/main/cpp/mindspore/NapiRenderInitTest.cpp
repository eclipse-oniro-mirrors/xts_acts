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

#include "common/Common.h"
#include "mindspore/MindSporeContextTest.h"
#include "mindspore/MindSporeDataTypeTest.h"
#include "mindspore/MindSporeFormatTest.h"
#include "mindspore/MindSporeModelTest.h"
#include "mindspore/MindSporeStatusTest.h"
#include "mindspore/MindSporeTypesTest.h"

namespace MindSporeTest {
EXTERN_C_START
static void RenderInitPush0(napi_property_descriptor* desc)
{
    napi_property_descriptor descTemp[] = {
        {"FormatTest_001", nullptr, MindSporeFormatTest::FormatTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"FormatTest_002", nullptr, MindSporeFormatTest::FormatTest_002,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"FormatTest_003", nullptr, MindSporeFormatTest::FormatTest_003,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"FormatTest_004", nullptr, MindSporeFormatTest::FormatTest_004,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"FormatTest_005", nullptr, MindSporeFormatTest::FormatTest_005,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"FormatTest_006", nullptr, MindSporeFormatTest::FormatTest_006,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"FormatTest_007", nullptr, MindSporeFormatTest::FormatTest_007,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"FormatTest_008", nullptr, MindSporeFormatTest::FormatTest_008,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"FormatTest_009", nullptr, MindSporeFormatTest::FormatTest_009,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"FormatTest_010", nullptr, MindSporeFormatTest::FormatTest_010,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"FormatTest_011", nullptr, MindSporeFormatTest::FormatTest_011,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"FormatTest_012", nullptr, MindSporeFormatTest::FormatTest_012,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"FormatTest_013", nullptr, MindSporeFormatTest::FormatTest_013,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"FormatTest_014", nullptr, MindSporeFormatTest::FormatTest_014,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"FormatTest_015", nullptr, MindSporeFormatTest::FormatTest_015,
            nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    for (size_t index = 0; index < sizeof(descTemp) / sizeof(descTemp[0]); index++) {
        desc[index] = descTemp[index];
    }
}

static void RenderInitPush1(napi_property_descriptor* desc)
{
    const uint32_t offset = 15;
    napi_property_descriptor descTemp[] = {
        {"DeviceInfoGetPriorityTest_001", nullptr, MindSporeContextTest::DeviceInfoGetPriorityTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"DataTypeTest_001", nullptr, MindSporeDataTypeTest::DataTypeTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"DataTypeTest_002", nullptr, MindSporeDataTypeTest::DataTypeTest_002,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"DataTypeTest_003", nullptr, MindSporeDataTypeTest::DataTypeTest_003,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"DataTypeTest_004", nullptr, MindSporeDataTypeTest::DataTypeTest_004,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"DataTypeTest_005", nullptr, MindSporeDataTypeTest::DataTypeTest_005,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"DataTypeTest_006", nullptr, MindSporeDataTypeTest::DataTypeTest_006,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"DataTypeTest_007", nullptr, MindSporeDataTypeTest::DataTypeTest_007,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"DataTypeTest_008", nullptr, MindSporeDataTypeTest::DataTypeTest_008,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"DataTypeTest_009", nullptr, MindSporeDataTypeTest::DataTypeTest_009,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"DataTypeTest_010", nullptr, MindSporeDataTypeTest::DataTypeTest_010,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"DataTypeTest_011", nullptr, MindSporeDataTypeTest::DataTypeTest_011,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"DataTypeTest_012", nullptr, MindSporeDataTypeTest::DataTypeTest_012,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"DataTypeTest_013", nullptr, MindSporeDataTypeTest::DataTypeTest_013,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"DataTypeTest_014", nullptr, MindSporeDataTypeTest::DataTypeTest_014,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"DataTypeTest_015", nullptr, MindSporeDataTypeTest::DataTypeTest_015,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"DataTypeTest_016", nullptr, MindSporeDataTypeTest::DataTypeTest_016,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CallBackParamTest_001", nullptr, MindSporeContextTest::CallBackParamTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CallBackParamTest_002", nullptr, MindSporeContextTest::CallBackParamTest_002,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CallBackParamTest_003", nullptr, MindSporeContextTest::CallBackParamTest_003,
            nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    for (size_t index = 0; index < sizeof(descTemp) / sizeof(descTemp[0]); index++) {
        desc[index + offset] = descTemp[index];
    }
}

static void RenderInitPush2(napi_property_descriptor* desc)
{
    const uint32_t offset = 35;
    napi_property_descriptor descTemp[] = {
        {"TensorSetAllocatorTest_001", nullptr, MindSporeContextTest::TensorSetAllocatorTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TensorGetAllocatorTest_001", nullptr, MindSporeContextTest::TensorGetAllocatorTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TrainCfgCreateTest_001", nullptr, MindSporeModelTest::TrainCfgCreateTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TrainCfgDestroyTest_001", nullptr, MindSporeModelTest::TrainCfgDestroyTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TrainCfgGetLossNameTest_001", nullptr, MindSporeModelTest::TrainCfgGetLossNameTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TrainCfgGetLossNameTest_002", nullptr, MindSporeModelTest::TrainCfgGetLossNameTest_002,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TrainCfgGetLossNameTest_003", nullptr, MindSporeModelTest::TrainCfgGetLossNameTest_003,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TrainCfgSetLossNameTest_001", nullptr, MindSporeModelTest::TrainCfgSetLossNameTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TrainCfgGetOptimizationLevelTest_001", nullptr, MindSporeModelTest::TrainCfgGetOptimizationLevelTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TrainCfgGetOptimizationLevelTest_002", nullptr, MindSporeModelTest::TrainCfgGetOptimizationLevelTest_002,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TrainCfgSetOptimizationLevelTest_001", nullptr, MindSporeModelTest::TrainCfgSetOptimizationLevelTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TrainCfgSetOptimizationLevelTest_002", nullptr, MindSporeModelTest::TrainCfgSetOptimizationLevelTest_002,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TrainModelBuildTest_001", nullptr, MindSporeModelTest::TrainModelBuildTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TrainModelBuildFromFileTest_001", nullptr, MindSporeModelTest::TrainModelBuildFromFileTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RunStepTest_001", nullptr, MindSporeModelTest::RunStepTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ModelSetLearningRateTest_001", nullptr, MindSporeModelTest::ModelSetLearningRateTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ModelGetLearningRateTest_001", nullptr, MindSporeModelTest::ModelGetLearningRateTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    for (size_t index = 0; index < sizeof(descTemp) / sizeof(descTemp[0]); index++) {
        desc[index + offset] = descTemp[index];
    }
}

static void RenderInitPush3(napi_property_descriptor* desc)
{
    const uint32_t offset = 52;
    napi_property_descriptor descTemp[] = {
        {"ModelGetWeightsTest_001", nullptr, MindSporeModelTest::ModelGetWeightsTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ModelUpdateWeightsTest_001", nullptr, MindSporeModelTest::ModelUpdateWeightsTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ModelGetTrainModeTest_001", nullptr, MindSporeModelTest::ModelGetTrainModeTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ModelSetTrainModeTest_001", nullptr, MindSporeModelTest::ModelSetTrainModeTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ModelSetupVirtualBatchTest_001", nullptr, MindSporeModelTest::ModelSetupVirtualBatchTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ExportModelTest_001", nullptr, MindSporeModelTest::ExportModelTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ExportModelBufferTest_001", nullptr, MindSporeModelTest::ExportModelBufferTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ExportWeightsCollaborateTest_001", nullptr, MindSporeModelTest::ExportWeightsCollaborateTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ModelLoadConfigTest_001", nullptr, MindSporeModelTest::ModelLoadConfigTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"StatusTest_001", nullptr, MindSporeStatusTest::StatusTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"StatusTest_008", nullptr, MindSporeStatusTest::StatusTest_008,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"DeviceTypeTest_001", nullptr, MindSporeTypesTest::DeviceTypeTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ModelTypetest_001", nullptr, MindSporeTypesTest::ModelTypetest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NNRTDeviceTypetest_001", nullptr, MindSporeTypesTest::NNRTDeviceTypetest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    for (size_t index = 0; index < sizeof(descTemp) / sizeof(descTemp[0]); index++) {
        desc[index + offset] = descTemp[index];
    }
}

static void RenderInitPush4(napi_property_descriptor* desc)
{
    const uint32_t offset = 66;
    napi_property_descriptor descTemp[] = {
        {"OptimizationLevelTest_001", nullptr, MindSporeTypesTest::OptimizationLevelTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OptimizationLevelTest_002", nullptr, MindSporeTypesTest::OptimizationLevelTest_002,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OptimizationLevelTest_003", nullptr, MindSporeTypesTest::OptimizationLevelTest_003,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OptimizationLevelTest_004", nullptr, MindSporeTypesTest::OptimizationLevelTest_004,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OptimizationLevelTest_005", nullptr, MindSporeTypesTest::OptimizationLevelTest_005,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"QuantizationTypeTest_001", nullptr, MindSporeModelTest::QuantizationTypeTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"QuantizationTypeTest_002", nullptr, MindSporeModelTest::QuantizationTypeTest_002,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"QuantizationTypeTest_003", nullptr, MindSporeModelTest::QuantizationTypeTest_003,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"QuantizationTypeTest_004", nullptr, MindSporeModelTest::QuantizationTypeTest_004,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"StatusTest_002", nullptr, MindSporeStatusTest::StatusTest_002,
            nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    for (size_t index = 0; index < sizeof(descTemp) / sizeof(descTemp[0]); index++) {
        desc[index + offset] = descTemp[index];
    }
}

static napi_value RenderInit(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[100] = {};
    RenderInitPush0(desc);
    RenderInitPush1(desc);
    RenderInitPush2(desc);
    RenderInitPush3(desc);
    RenderInitPush4(desc);
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module mindsporendkModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = RenderInit,
    .nm_modname = "mindsporendk",
    .nm_priv = ((void *)0),
    .reserved = {0}};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&mindsporendkModule); }
}