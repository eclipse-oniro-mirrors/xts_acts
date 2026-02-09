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
#include <array>
#include "include/ActsMindSporeTest.h"
#include "include/OhosCommonTest.h"
#include "napi/native_api.h"

// Common argument and result constants.
static constexpr int ARG_INDEX = 0;
static constexpr int DEFAULT_ARG = -1;
static constexpr int RESULT_ERROR = -1;

// Handler count constants for std::array sizes (avoid magic numbers).
static constexpr size_t TRAIN_EXPORT_MODEL_HANDLER_COUNT = 14;
static constexpr size_t CONTEXT_CREATE_HANDLER_COUNT = 66;
static constexpr size_t MODEL_CREATE_HANDLER_COUNT = 37;
static constexpr size_t TENSOR_CREATE_HANDLER_COUNT = 50;
static constexpr size_t HIAI_OFFLINEMODEL_HANDLER_COUNT = 15;
static constexpr size_t OHOS_CONTEXT_CPU_HANDLER_COUNT = 20;
static constexpr size_t OHOS_TENSOR_CREATE_HANDLER_COUNT = 16;

using MindSporeFn = int (*)();

// Case number constants to replace magic numbers in switch statements.
enum CaseNum {
    CASE_NUM_0 = 0,
    CASE_NUM_1,
    CASE_NUM_2,
    CASE_NUM_3,
    CASE_NUM_4,
    CASE_NUM_5,
    CASE_NUM_6,
    CASE_NUM_7,
    CASE_NUM_8,
    CASE_NUM_9,
    CASE_NUM_10,
    CASE_NUM_11,
    CASE_NUM_12,
    CASE_NUM_13,
    CASE_NUM_14,
    CASE_NUM_15,
    CASE_NUM_16,
    CASE_NUM_17,
    CASE_NUM_18,
    CASE_NUM_19,
    CASE_NUM_20,
    CASE_NUM_21,
    CASE_NUM_22,
    CASE_NUM_23,
    CASE_NUM_24,
    CASE_NUM_25,
    CASE_NUM_26,
    CASE_NUM_27,
    CASE_NUM_28,
    CASE_NUM_29,
    CASE_NUM_30,
    CASE_NUM_31,
    CASE_NUM_32,
    CASE_NUM_33,
    CASE_NUM_34,
    CASE_NUM_35,
    CASE_NUM_36,
    CASE_NUM_37,
    CASE_NUM_38,
    CASE_NUM_39,
    CASE_NUM_40,
    CASE_NUM_41,
    CASE_NUM_42,
    CASE_NUM_43,
    CASE_NUM_44,
    CASE_NUM_45,
    CASE_NUM_46,
    CASE_NUM_47,
    CASE_NUM_48,
    CASE_NUM_49,
    CASE_NUM_50,
    CASE_NUM_51,
    CASE_NUM_52,
    CASE_NUM_53,
    CASE_NUM_54,
    CASE_NUM_55,
    CASE_NUM_56,
    CASE_NUM_57,
    CASE_NUM_58,
    CASE_NUM_59,
    CASE_NUM_60,
    CASE_NUM_61,
    CASE_NUM_62,
    CASE_NUM_63,
    CASE_NUM_64,
    CASE_NUM_65
};

template <size_t N> int DispatchByCaseNum(int caseNum, const std::array<MindSporeFn, N>& handlers)
{
    if (caseNum < CASE_NUM_0 || caseNum >= static_cast<int>(N) || handlers[caseNum] == nullptr) {
        return RESULT_ERROR;
    }
    return handlers[caseNum]();
}

// Train related functions
static napi_value SUB_AI_MindSpore_Train_UpdateWeights(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result = 0;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::MindSpore::SUBAIMindSporeTrainUpdateWeights0001();
                break;
            case CASE_NUM_1:
                result = Acts::MindSpore::SUBAIMindSporeTrainUpdateWeights0002();
                break;
            case CASE_NUM_2:
                result = Acts::MindSpore::SUBAIMindSporeTrainUpdateWeights0003();
                break;
            case CASE_NUM_3:
                result = Acts::MindSpore::SUBAIMindSporeTrainUpdateWeights0004();
                break;
            case CASE_NUM_4:
                result = Acts::MindSpore::SUBAIMindSporeTrainUpdateWeights0005();
                break;
            case CASE_NUM_5:
                result = Acts::MindSpore::SUBAIMindSporeTrainUpdateWeights0006();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

static napi_value SUB_AI_MindSpore_Train_SetLearningRate(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::MindSpore::SUBAIMindSporeTrainSetLearningRate0001();
                break;
            case CASE_NUM_1:
                result = Acts::MindSpore::SUBAIMindSporeTrainSetLearningRate0002();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

static napi_value SUB_AI_MindSpore_Train_SetupVirtualBatch(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::MindSpore::SUBAIMindSporeTrainSetupVirtualBatch0001();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

static napi_value SUB_AI_MindSpore_Train_SetOptimizationLevel(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::MindSpore::SUBAIMindSporeTrainSetOptimizationLevel0001();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

static napi_value SUB_AI_MindSpore_Train_TrainCfg(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::MindSpore::SUBAIMindSporeTrainTrainCfg0001();
                break;
            case CASE_NUM_1:
                result = Acts::MindSpore::SUBAIMindSporeTrainTrainCfg0002();
                break;
            case CASE_NUM_2:
                result = Acts::MindSpore::SUBAIMindSporeTrainTrainCfg0003();
                break;
            case CASE_NUM_3:
                result = Acts::MindSpore::SUBAIMindSporeTrainTrainCfg0004();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

static napi_value SUB_AI_MindSpore_Train_ModelBuild(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::MindSpore::SUBAIMindSporeTrainModelBuild0001();
                break;
            case CASE_NUM_1:
                result = Acts::MindSpore::SUBAIMindSporeTrainModelBuild0002();
                break;
            case CASE_NUM_2:
                result = Acts::MindSpore::SUBAIMindSporeTrainModelBuild0003();
                break;
            case CASE_NUM_3:
                result = Acts::MindSpore::SUBAIMindSporeTrainModelBuild0004();
                break;
            case CASE_NUM_4:
                result = Acts::MindSpore::SUBAIMindSporeTrainModelBuild0005();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

static napi_value SUB_AI_MindSpore_Train_ExportModel(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<MindSporeFn, TRAIN_EXPORT_MODEL_HANDLER_COUNT> handlers = {
            Acts::MindSpore::SUBAIMindSporeTrainExportModel0001, Acts::MindSpore::SUBAIMindSporeTrainExportModel0002,
            Acts::MindSpore::SUBAIMindSporeTrainExportModel0003, Acts::MindSpore::SUBAIMindSporeTrainExportModel0004,
            Acts::MindSpore::SUBAIMindSporeTrainExportModel0005, Acts::MindSpore::SUBAIMindSporeTrainExportModel0006,
            Acts::MindSpore::SUBAIMindSporeTrainExportModel0007, Acts::MindSpore::SUBAIMindSporeTrainExportModel0008,
            Acts::MindSpore::SUBAIMindSporeTrainExportModel0009, Acts::MindSpore::SUBAIMindSporeTrainExportModel0010,
            Acts::MindSpore::SUBAIMindSporeTrainExportModel0011, Acts::MindSpore::SUBAIMindSporeTrainExportModel0012,
            Acts::MindSpore::SUBAIMindSporeTrainExportModel0013, Acts::MindSpore::SUBAIMindSporeTrainExportModel0014,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

static napi_value SUB_AI_MindSpore_Train_ExportWeights(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::MindSpore::SUBAIMindSporeTrainExportWeights0001();
                break;
            case CASE_NUM_1:
                result = Acts::MindSpore::SUBAIMindSporeTrainExportWeights0002();
                break;
            case CASE_NUM_2:
                result = Acts::MindSpore::SUBAIMindSporeTrainExportWeights0003();
                break;
            case CASE_NUM_3:
                result = Acts::MindSpore::SUBAIMindSporeTrainExportWeights0004();
                break;
            case CASE_NUM_4:
                result = Acts::MindSpore::SUBAIMindSporeTrainExportWeights0005();
                break;
            case CASE_NUM_5:
                result = Acts::MindSpore::SUBAIMindSporeTrainExportWeights0006();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Context related functions
static napi_value SUB_AI_MindSpore_ContextCreate(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<MindSporeFn, CONTEXT_CREATE_HANDLER_COUNT> handlers = {
            Acts::MindSpore::SUBAIMindSporeContextCreate0001, Acts::MindSpore::SUBAIMindSporeContextCreate0002,
            Acts::MindSpore::SUBAIMindSporeContextCreate0003, Acts::MindSpore::SUBAIMindSporeContextCreate0004,
            Acts::MindSpore::SUBAIMindSporeContextCreate0005, Acts::MindSpore::SUBAIMindSporeContextCreate0006,
            Acts::MindSpore::SUBAIMindSporeContextCreate0007, Acts::MindSpore::SUBAIMindSporeContextCreate0008,
            Acts::MindSpore::SUBAIMindSporeContextCreate0009, Acts::MindSpore::SUBAIMindSporeContextCreate0010,
            Acts::MindSpore::SUBAIMindSporeContextCreate0011, Acts::MindSpore::SUBAIMindSporeContextCreate0012,
            Acts::MindSpore::SUBAIMindSporeContextCreate0013, Acts::MindSpore::SUBAIMindSporeContextCreate0014,
            Acts::MindSpore::SUBAIMindSporeContextCreate0015, Acts::MindSpore::SUBAIMindSporeContextCreate0016,
            Acts::MindSpore::SUBAIMindSporeContextCreate0017, Acts::MindSpore::SUBAIMindSporeContextCreate0018,
            Acts::MindSpore::SUBAIMindSporeContextCreate0019, Acts::MindSpore::SUBAIMindSporeContextCreate0020,
            Acts::MindSpore::SUBAIMindSporeContextCreate0021, Acts::MindSpore::SUBAIMindSporeContextCreate0022,
            Acts::MindSpore::SUBAIMindSporeContextCreate0023, Acts::MindSpore::SUBAIMindSporeContextCreate0024,
            Acts::MindSpore::SUBAIMindSporeContextCreate0025, Acts::MindSpore::SUBAIMindSporeContextCreate0026,
            Acts::MindSpore::SUBAIMindSporeContextCreate0027, Acts::MindSpore::SUBAIMindSporeContextCreate0028,
            Acts::MindSpore::SUBAIMindSporeContextCreate0029, Acts::MindSpore::SUBAIMindSporeContextCreate0030,
            Acts::MindSpore::SUBAIMindSporeContextCreate0031, Acts::MindSpore::SUBAIMindSporeContextCreate0032,
            Acts::MindSpore::SUBAIMindSporeContextCreate0033, Acts::MindSpore::SUBAIMindSporeContextCreate0034,
            Acts::MindSpore::SUBAIMindSporeContextCreate0035, Acts::MindSpore::SUBAIMindSporeContextCreate0036,
            Acts::MindSpore::SUBAIMindSporeContextCreate0037, Acts::MindSpore::SUBAIMindSporeContextCreate0038,
            Acts::MindSpore::SUBAIMindSporeContextCreate0039, Acts::MindSpore::SUBAIMindSporeContextCreate0040,
            Acts::MindSpore::SUBAIMindSporeContextCreate0041, Acts::MindSpore::SUBAIMindSporeContextCreate0042,
            Acts::MindSpore::SUBAIMindSporeContextCreate0043, Acts::MindSpore::SUBAIMindSporeContextCreate0044,
            Acts::MindSpore::SUBAIMindSporeContextCreate0045, Acts::MindSpore::SUBAIMindSporeContextCreate0046,
            Acts::MindSpore::SUBAIMindSporeContextCreate0047, Acts::MindSpore::SUBAIMindSporeContextCreate0048,
            Acts::MindSpore::SUBAIMindSporeContextCreate0049, Acts::MindSpore::SUBAIMindSporeContextCreate0050,
            Acts::MindSpore::SUBAIMindSporeContextCreate0051, Acts::MindSpore::SUBAIMindSporeContextCreate0052,
            Acts::MindSpore::SUBAIMindSporeContextCreate0053, Acts::MindSpore::SUBAIMindSporeContextCreate0054,
            Acts::MindSpore::SUBAIMindSporeContextCreate0055, Acts::MindSpore::SUBAIMindSporeContextCreate0056,
            Acts::MindSpore::SUBAIMindSporeContextCreate0057, Acts::MindSpore::SUBAIMindSporeContextCreate0058,
            Acts::MindSpore::SUBAIMindSporeContextCreate0059, Acts::MindSpore::SUBAIMindSporeContextCreate0060,
            Acts::MindSpore::SUBAIMindSporeContextCreate0061, Acts::MindSpore::SUBAIMindSporeContextCreate0062,
            Acts::MindSpore::SUBAIMindSporeContextCreate0063, Acts::MindSpore::SUBAIMindSporeContextCreate0064,
            Acts::MindSpore::SUBAIMindSporeContextCreate0065, Acts::MindSpore::SUBAIMindSporeContextCreate0066,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

static napi_value SUB_AI_MindSpore_ContextDestroy(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::MindSpore::SUBAIMindSporeContextDestroy0001();
                break;
            case CASE_NUM_1:
                result = Acts::MindSpore::SUBAIMindSporeContextDestroy0002();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Model related functions
static napi_value SUB_AI_MindSpore_ModelCreate(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<MindSporeFn, MODEL_CREATE_HANDLER_COUNT> handlers = {
            Acts::MindSpore::SUBAIMindSporeModelCreate0001, Acts::MindSpore::SUBAIMindSporeModelCreate0002,
            Acts::MindSpore::SUBAIMindSporeModelCreate0003, Acts::MindSpore::SUBAIMindSporeModelCreate0005,
            Acts::MindSpore::SUBAIMindSporeModelCreate0006, Acts::MindSpore::SUBAIMindSporeModelCreate0007,
            Acts::MindSpore::SUBAIMindSporeModelCreate0008, Acts::MindSpore::SUBAIMindSporeModelCreate0009,
            Acts::MindSpore::SUBAIMindSporeModelCreate0010, Acts::MindSpore::SUBAIMindSporeModelCreate0011,
            Acts::MindSpore::SUBAIMindSporeModelCreate0012, Acts::MindSpore::SUBAIMindSporeModelCreate0013,
            Acts::MindSpore::SUBAIMindSporeModelCreate0014, Acts::MindSpore::SUBAIMindSporeModelCreate0015,
            Acts::MindSpore::SUBAIMindSporeModelCreate0016, Acts::MindSpore::SUBAIMindSporeModelCreate0017,
            Acts::MindSpore::SUBAIMindSporeModelCreate0018, Acts::MindSpore::SUBAIMindSporeModelCreate0019,
            Acts::MindSpore::SUBAIMindSporeModelCreate0020, Acts::MindSpore::SUBAIMindSporeModelCreate0021,
            Acts::MindSpore::SUBAIMindSporeModelCreate0022, Acts::MindSpore::SUBAIMindSporeModelCreate0027,
            Acts::MindSpore::SUBAIMindSporeModelCreate0028, Acts::MindSpore::SUBAIMindSporeModelCreate0029,
            Acts::MindSpore::SUBAIMindSporeModelCreate0030, Acts::MindSpore::SUBAIMindSporeModelCreate0031,
            Acts::MindSpore::SUBAIMindSporeModelCreate0032, Acts::MindSpore::SUBAIMindSporeModelCreate0033,
            Acts::MindSpore::SUBAIMindSporeModelCreate0034, Acts::MindSpore::SUBAIMindSporeModelCreate0035,
            Acts::MindSpore::SUBAIMindSporeModelCreate0036, Acts::MindSpore::SUBAIMindSporeModelCreate0037,
            Acts::MindSpore::SUBAIMindSporeModelCreate0038, Acts::MindSpore::SUBAIMindSporeModelCreate0039,
            Acts::MindSpore::SUBAIMindSporeModelCreate0040, Acts::MindSpore::SUBAIMindSporeModelCreate0041,
            Acts::MindSpore::SUBAIMindSporeModelCreate0042,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

static napi_value SUB_AI_MindSpore_ModelLoadConfig(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::MindSpore::SUBAIMindSporeModelLoadConfig0001();
                break;
            case CASE_NUM_1:
                result = Acts::MindSpore::SUBAIMindSporeModelLoadConfig0002();
                break;
            case CASE_NUM_2:
                result = Acts::MindSpore::SUBAIMindSporeModelLoadConfig0003();
                break;
            case CASE_NUM_3:
                result = Acts::MindSpore::SUBAIMindSporeModelLoadConfig0004();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Tensor related functions
static napi_value SUB_AI_MindSpore_TensorCreate(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<MindSporeFn, TENSOR_CREATE_HANDLER_COUNT> handlers = {
            Acts::MindSpore::SUBAIMindSporeTensorCreate0001, Acts::MindSpore::SUBAIMindSporeTensorCreate0002,
            Acts::MindSpore::SUBAIMindSporeTensorCreate0003, Acts::MindSpore::SUBAIMindSporeTensorCreate0004,
            Acts::MindSpore::SUBAIMindSporeTensorCreate0005, Acts::MindSpore::SUBAIMindSporeTensorCreate0006,
            Acts::MindSpore::SUBAIMindSporeTensorCreate0007, Acts::MindSpore::SUBAIMindSporeTensorCreate0008,
            Acts::MindSpore::SUBAIMindSporeTensorCreate0009, Acts::MindSpore::SUBAIMindSporeTensorCreate0010,
            Acts::MindSpore::SUBAIMindSporeTensorCreate0011, Acts::MindSpore::SUBAIMindSporeTensorCreate0012,
            Acts::MindSpore::SUBAIMindSporeTensorCreate0013, Acts::MindSpore::SUBAIMindSporeTensorCreate0014,
            Acts::MindSpore::SUBAIMindSporeTensorCreate0015, Acts::MindSpore::SUBAIMindSporeTensorCreate0016,
            Acts::MindSpore::SUBAIMindSporeTensorCreate0017, Acts::MindSpore::SUBAIMindSporeTensorCreate0018,
            Acts::MindSpore::SUBAIMindSporeTensorCreate0019, Acts::MindSpore::SUBAIMindSporeTensorCreate0020,
            Acts::MindSpore::SUBAIMindSporeTensorCreate0021, Acts::MindSpore::SUBAIMindSporeTensorCreate0022,
            Acts::MindSpore::SUBAIMindSporeTensorCreate0023, Acts::MindSpore::SUBAIMindSporeTensorCreate0024,
            Acts::MindSpore::SUBAIMindSporeTensorCreate0025, Acts::MindSpore::SUBAIMindSporeTensorCreate0026,
            Acts::MindSpore::SUBAIMindSporeTensorCreate0027, Acts::MindSpore::SUBAIMindSporeTensorCreate0028,
            Acts::MindSpore::SUBAIMindSporeTensorCreate0029, Acts::MindSpore::SUBAIMindSporeTensorCreate0030,
            Acts::MindSpore::SUBAIMindSporeTensorCreate0031, Acts::MindSpore::SUBAIMindSporeTensorCreate0032,
            Acts::MindSpore::SUBAIMindSporeTensorCreate0033, Acts::MindSpore::SUBAIMindSporeTensorCreate0034,
            Acts::MindSpore::SUBAIMindSporeTensorCreate0035, Acts::MindSpore::SUBAIMindSporeTensorCreate0036,
            Acts::MindSpore::SUBAIMindSporeTensorCreate0037, Acts::MindSpore::SUBAIMindSporeTensorCreate0038,
            Acts::MindSpore::SUBAIMindSporeTensorCreate0039, Acts::MindSpore::SUBAIMindSporeTensorCreate0040,
            Acts::MindSpore::SUBAIMindSporeTensorCreate0041, Acts::MindSpore::SUBAIMindSporeTensorCreate0042,
            Acts::MindSpore::SUBAIMindSporeTensorCreate0043, Acts::MindSpore::SUBAIMindSporeTensorCreate0044,
            Acts::MindSpore::SUBAIMindSporeTensorCreate0045, Acts::MindSpore::SUBAIMindSporeTensorCreate0046,
            Acts::MindSpore::SUBAIMindSporeTensorCreate0047, Acts::MindSpore::SUBAIMindSporeTensorCreate0048,
            Acts::MindSpore::SUBAIMindSporeTensorCreate0049, Acts::MindSpore::SUBAIMindSporeTensorCreate0050,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// NNRT related functions
static napi_value SUB_AI_MindSpore_NNRT_Cache(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::MindSpore::SUBAIMindSporeNNRTCache0001();
                break;
            case CASE_NUM_1:
                result = Acts::MindSpore::SUBAIMindSporeNNRTCache0002();
                break;
            case CASE_NUM_2:
                result = Acts::MindSpore::SUBAIMindSporeNNRTCache0003();
                break;
            case CASE_NUM_3:
                result = Acts::MindSpore::SUBAIMindSporeNNRTCache0004();
                break;
            case CASE_NUM_4:
                result = Acts::MindSpore::SUBAIMindSporeNNRTCache0005();
                break;
            case CASE_NUM_5:
                result = Acts::MindSpore::SUBAIMindSporeNNRTCache0006();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

static napi_value SUB_AI_MindSpore_NNRT_copy_free(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::MindSpore::SUBAIMindSporeNNRTCopyFree0001();
                break;
            case CASE_NUM_1:
                result = Acts::MindSpore::SUBAIMindSporeNNRTCopyFree0002();
                break;
            case CASE_NUM_2:
                result = Acts::MindSpore::SUBAIMindSporeNNRTCopyFree0003();
                break;
            case CASE_NUM_3:
                result = Acts::MindSpore::SUBAIMindSporeNNRTCopyFree0004();
                break;
            case CASE_NUM_4:
                result = Acts::MindSpore::SUBAIMindSporeNNRTCopyFree0005();
                break;
            case CASE_NUM_5:
                result = Acts::MindSpore::SUBAIMindSporeNNRTCopyFree0006();
                break;
            case CASE_NUM_6:
                result = Acts::MindSpore::SUBAIMindSporeNNRTCopyFree0007();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// CPU related functions
static napi_value SUB_AI_MindSpore_CPU_copy_free(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::MindSpore::SUBAIMindSporeCPUCopyFree0001();
                break;
            case CASE_NUM_1:
                result = Acts::MindSpore::SUBAIMindSporeCPUCopyFree0002();
                break;
            case CASE_NUM_2:
                result = Acts::MindSpore::SUBAIMindSporeCPUCopyFree0003();
                break;
            case CASE_NUM_3:
                result = Acts::MindSpore::SUBAIMindSporeCPUCopyFree0004();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// HIAI OfflineModel related functions
static napi_value SUB_AI_MindSpore_HIAI_OfflineModel(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<MindSporeFn, HIAI_OFFLINEMODEL_HANDLER_COUNT> handlers = {
            Acts::MindSpore::SUBAIMindSporeHIAIOfflineModel0004, Acts::MindSpore::SUBAIMindSporeHIAIOfflineModel0005,
            Acts::MindSpore::SUBAIMindSporeHIAIOfflineModel0006, Acts::MindSpore::SUBAIMindSporeHIAIOfflineModel0007,
            Acts::MindSpore::SUBAIMindSporeHIAIOfflineModel0008, Acts::MindSpore::SUBAIMindSporeHIAIOfflineModel0009,
            Acts::MindSpore::SUBAIMindSporeHIAIOfflineModel0010, Acts::MindSpore::SUBAIMindSporeHIAIOfflineModel0011,
            Acts::MindSpore::SUBAIMindSporeHIAIOfflineModel0012, Acts::MindSpore::SUBAIMindSporeHIAIOfflineModel0013,
            Acts::MindSpore::SUBAIMindSporeHIAIOfflineModel0014, Acts::MindSpore::SUBAIMindSporeHIAIOfflineModel0015,
            Acts::MindSpore::SUBAIMindSporeHIAIOfflineModel0016, Acts::MindSpore::SUBAIMindSporeHIAIOfflineModel0017,
            Acts::MindSpore::SUBAIMindSporeHIAIOfflineModel0018,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Other functions
static napi_value SUB_AI_MindSpore_Covered(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::MindSpore::SUBAIMindSporeCovered0001();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// OHOS Context CPU
static napi_value OHOS_Context_CPU(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<MindSporeFn, OHOS_CONTEXT_CPU_HANDLER_COUNT> handlers = {
            Acts::MindSpore::OHOSContextCPU0001, Acts::MindSpore::OHOSContextCPU0002,
            Acts::MindSpore::OHOSContextCPU0003, Acts::MindSpore::OHOSContextCPU0004,
            Acts::MindSpore::OHOSContextCPU0005, Acts::MindSpore::OHOSContextCPU0006,
            Acts::MindSpore::OHOSContextCPU0007, Acts::MindSpore::OHOSContextCPU0008,
            Acts::MindSpore::OHOSContextCPU0009, Acts::MindSpore::OHOSContextCPU0010,
            Acts::MindSpore::OHOSContextCPU0011, Acts::MindSpore::OHOSContextCPU0012,
            Acts::MindSpore::OHOSContextCPU0013, Acts::MindSpore::OHOSContextCPU0014,
            Acts::MindSpore::OHOSContextCPU0015, Acts::MindSpore::OHOSContextCPU0016,
            Acts::MindSpore::OHOSContextCPU0017, Acts::MindSpore::OHOSContextCPU0018,
            Acts::MindSpore::OHOSContextCPU0019, Acts::MindSpore::OHOSContextCPU0020,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// OHOS Context NPU
static napi_value OHOS_Context_NPU(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::MindSpore::OHOSContextNPU0002();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// OHOS Model Build
static napi_value OHOS_Model_Build(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::MindSpore::OHOSModelBuild0001();
                break;
            case CASE_NUM_1:
                result = Acts::MindSpore::OHOSModelBuild0002();
                break;
            case CASE_NUM_2:
                result = Acts::MindSpore::OHOSModelBuild0003();
                break;
            case CASE_NUM_3:
                result = Acts::MindSpore::OHOSModelBuild0004();
                break;
            case CASE_NUM_4:
                result = Acts::MindSpore::OHOSModelBuild0005();
                break;
            case CASE_NUM_5:
                result = Acts::MindSpore::OHOSModelBuild0006();
                break;
            case CASE_NUM_6:
                result = Acts::MindSpore::OHOSModelBuild0007();
                break;
            case CASE_NUM_7:
                result = Acts::MindSpore::OHOSModelBuild0008();
                break;
            case CASE_NUM_8:
                result = Acts::MindSpore::OHOSModelBuild0009();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// OHOS Model Resize
static napi_value OHOS_Model_Resize(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::MindSpore::OHOSModelResize0001();
                break;
            case CASE_NUM_1:
                result = Acts::MindSpore::OHOSModelResize0002();
                break;
            case CASE_NUM_2:
                result = Acts::MindSpore::OHOSModelResize0003();
                break;
            case CASE_NUM_3:
                result = Acts::MindSpore::OHOSModelResize0004();
                break;
            case CASE_NUM_4:
                result = Acts::MindSpore::OHOSModelResize0005();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// OHOS Model Predict
static napi_value OHOS_Model_Predict(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::MindSpore::OHOSModelPredict0001();
                break;
            case CASE_NUM_1:
                result = Acts::MindSpore::OHOSModelPredict0002();
                break;
            case CASE_NUM_2:
                result = Acts::MindSpore::OHOSModelPredict0003();
                break;
            case CASE_NUM_3:
                result = Acts::MindSpore::OHOSModelPredict0004();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// OHOS Model GetInputByTensorName
static napi_value OHOS_Model_GetInputByTensorName(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::MindSpore::OHOSModelGetInputByTensorName0001();
                break;
            case CASE_NUM_1:
                result = Acts::MindSpore::OHOSModelGetInputByTensorName0002();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// OHOS Model GetOutputByTensorName
static napi_value OHOS_Model_GetOutputByTensorName(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::MindSpore::OHOSModelGetOutputByTensorName0001();
                break;
            case CASE_NUM_1:
                result = Acts::MindSpore::OHOSModelGetOutputByTensorName0002();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// OHOS Tensor Create
static napi_value OHOS_Tensor_Create(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<MindSporeFn, OHOS_TENSOR_CREATE_HANDLER_COUNT> handlers = {
            Acts::MindSpore::OHOSTensorCreate0001, Acts::MindSpore::OHOSTensorCreate0002,
            Acts::MindSpore::OHOSTensorCreate0003, Acts::MindSpore::OHOSTensorCreate0004,
            Acts::MindSpore::OHOSTensorCreate0005, Acts::MindSpore::OHOSTensorCreate0006,
            Acts::MindSpore::OHOSTensorCreate0007, Acts::MindSpore::OHOSTensorCreate0008,
            Acts::MindSpore::OHOSTensorCreate0009, Acts::MindSpore::OHOSTensorCreate0010,
            Acts::MindSpore::OHOSTensorCreate0011, Acts::MindSpore::OHOSTensorCreate0012,
            Acts::MindSpore::OHOSTensorCreate0013, Acts::MindSpore::OHOSTensorCreate0014,
            Acts::MindSpore::OHOSTensorCreate0015, Acts::MindSpore::OHOSTensorCreate0016,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// OHOS Input
static napi_value OHOS_Input(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::MindSpore::OHOSInput0001();
                break;
            case CASE_NUM_1:
                result = Acts::MindSpore::OHOSInput0002();
                break;
            case CASE_NUM_2:
                result = Acts::MindSpore::OHOSInput0003();
                break;
            case CASE_NUM_3:
                result = Acts::MindSpore::OHOSInput0004();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// OHOS Multiple
static napi_value OHOS_Multiple(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::MindSpore::OHOSMultiple0001();
                break;
            case CASE_NUM_1:
                result = Acts::MindSpore::OHOSMultiple0002();
                break;
            case CASE_NUM_2:
                result = Acts::MindSpore::OHOSMultiple0003();
                break;
            case CASE_NUM_3:
                result = Acts::MindSpore::OHOSMultiple0004();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// OHOS Parallel
static napi_value OHOS_Parallel(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::MindSpore::OHOSParallel0001();
                break;
            case CASE_NUM_1:
                result = Acts::MindSpore::OHOSParallel0002();
                break;
            case CASE_NUM_2:
                result = Acts::MindSpore::OHOSParallel0003();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// OHOS Compatible
static napi_value OHOS_Compatible(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::MindSpore::OHOSCompatible0001();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// OHOS OfflineModel
static napi_value OHOS_OfflineModel(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::MindSpore::OHOSOfflineModel0001();
                break;
            case CASE_NUM_1:
                result = Acts::MindSpore::OHOSOfflineModel0002();
                break;
            case CASE_NUM_2:
                result = Acts::MindSpore::OHOSOfflineModel0004();
                break;
            case CASE_NUM_3:
                result = Acts::MindSpore::OHOSOfflineModel0005();
                break;
            case CASE_NUM_4:
                result = Acts::MindSpore::OHOSOfflineModel0006();
                break;
            case CASE_NUM_5:
                result = Acts::MindSpore::OHOSOfflineModel0007();
                break;
            case CASE_NUM_6:
                result = Acts::MindSpore::OHOSOfflineModel0008();
                break;
            case CASE_NUM_7:
                result = Acts::MindSpore::OHOSOfflineModel0009();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// OHOS NNRT
static napi_value OHOS_NNRT(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::MindSpore::OHOSNNRT0001();
                break;
            case CASE_NUM_1:
                result = Acts::MindSpore::OHOSNNRT0002();
                break;
            case CASE_NUM_2:
                result = Acts::MindSpore::OHOSNNRT0003();
                break;
            case CASE_NUM_3:
                result = Acts::MindSpore::OHOSNNRT0005();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// OHOS NNRT QUANT
static napi_value OHOS_NNRT_QUANT(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::MindSpore::OHOSNNRTQUANT0001();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

static napi_value SUB_AI_MindSpore_AIPP(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::MindSpore::SUBAIMindSporeAIPP0001();
                break;
            case CASE_NUM_1:
                result = Acts::MindSpore::SUBAIMindSporeAIPP0002();
                break;
            case CASE_NUM_2:
                result = Acts::MindSpore::SUBAIMindSporeAIPP0003();
                break;
            case CASE_NUM_3:
                result = Acts::MindSpore::SUBAIMindSporeAIPP0004();
                break;
            case CASE_NUM_4:
                result = Acts::MindSpore::SUBAIMindSporeAIPP0005();
                break;
            case CASE_NUM_5:
                result = Acts::MindSpore::SUBAIMindSporeAIPP0006();
                break;
            case CASE_NUM_6:
                result = Acts::MindSpore::SUBAIMindSporeAIPP0007();
                break;
            case CASE_NUM_7:
                result = Acts::MindSpore::SUBAIMindSporeAIPP0008();
                break;
            case CASE_NUM_8:
                result = Acts::MindSpore::SUBAIMindSporeAIPP0009();
                break;
            case CASE_NUM_9:
                result = Acts::MindSpore::SUBAIMindSporeAIPP0010();
                break;
            default:
                result = RESULT_ERROR;
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

inline napi_property_descriptor MakeNapiDesc(const char* name, napi_callback cb)
{
    return { name, nullptr, cb, nullptr, nullptr, nullptr, napi_default, nullptr };
}

#define DECL_NAPI_DESC(fn) /* NOLINT(G.PRE.02-CPP) */ MakeNapiDesc(#fn, fn)

static const napi_property_descriptor g_mindsporeDescriptors[] = {
    DECL_NAPI_DESC(SUB_AI_MindSpore_Train_UpdateWeights),
    DECL_NAPI_DESC(SUB_AI_MindSpore_Train_SetLearningRate),
    DECL_NAPI_DESC(SUB_AI_MindSpore_Train_SetupVirtualBatch),
    DECL_NAPI_DESC(SUB_AI_MindSpore_Train_SetOptimizationLevel),
    DECL_NAPI_DESC(SUB_AI_MindSpore_Train_TrainCfg),
    DECL_NAPI_DESC(SUB_AI_MindSpore_Train_ModelBuild),
    DECL_NAPI_DESC(SUB_AI_MindSpore_Train_ExportModel),
    DECL_NAPI_DESC(SUB_AI_MindSpore_Train_ExportWeights),
    DECL_NAPI_DESC(SUB_AI_MindSpore_ContextCreate),
    DECL_NAPI_DESC(SUB_AI_MindSpore_ContextDestroy),
    DECL_NAPI_DESC(SUB_AI_MindSpore_ModelCreate),
    DECL_NAPI_DESC(SUB_AI_MindSpore_ModelLoadConfig),
    DECL_NAPI_DESC(SUB_AI_MindSpore_TensorCreate),
    DECL_NAPI_DESC(SUB_AI_MindSpore_NNRT_Cache),
    DECL_NAPI_DESC(SUB_AI_MindSpore_NNRT_copy_free),
    DECL_NAPI_DESC(SUB_AI_MindSpore_CPU_copy_free),
    DECL_NAPI_DESC(SUB_AI_MindSpore_HIAI_OfflineModel),
    DECL_NAPI_DESC(SUB_AI_MindSpore_Covered),
    DECL_NAPI_DESC(OHOS_Context_CPU),
    DECL_NAPI_DESC(OHOS_Context_NPU),
    DECL_NAPI_DESC(OHOS_Model_Build),
    DECL_NAPI_DESC(OHOS_Model_Resize),
    DECL_NAPI_DESC(OHOS_Model_Predict),
    DECL_NAPI_DESC(OHOS_Model_GetInputByTensorName),
    DECL_NAPI_DESC(OHOS_Model_GetOutputByTensorName),
    DECL_NAPI_DESC(OHOS_Tensor_Create),
    DECL_NAPI_DESC(OHOS_Input),
    DECL_NAPI_DESC(OHOS_Multiple),
    DECL_NAPI_DESC(OHOS_Parallel),
    DECL_NAPI_DESC(OHOS_Compatible),
    DECL_NAPI_DESC(OHOS_OfflineModel),
    DECL_NAPI_DESC(OHOS_NNRT),
    DECL_NAPI_DESC(OHOS_NNRT_QUANT),
    DECL_NAPI_DESC(SUB_AI_MindSpore_AIPP),
};

EXTERN_C_START static napi_value Init(napi_env env, napi_value exports)
{
    napi_define_properties(env,
                           exports,
                           sizeof(g_mindsporeDescriptors) / sizeof(g_mindsporeDescriptors[CASE_NUM_0]),
                           g_mindsporeDescriptors);
    return exports;
}
EXTERN_C_END

static napi_module mindsporeModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "mindspore",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&mindsporeModule);
}
