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

#include "include/NapiInitTestCommon.h"

// OHOS NNRT OPS SCATTERND Model SetOperandValue
napi_value ScatterndModelSetOperandValue(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthScatterndModelSetOperandValue01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthScatterndModelSetOperandValue02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthScatterndModelSetOperandValue03();
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

// OHOS NNRT OPS SCATTERND Model SpecifyInputsAndOutputs
napi_value ScatterndModelModelSpecifyInputsAndOutputs(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthScatterndModelSpecifyInputsAndOutputs01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthScatterndModelSpecifyInputsAndOutputs02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthScatterndModelSpecifyInputsAndOutputs03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthScatterndModelSpecifyInputsAndOutputs04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthScatterndModelSpecifyInputsAndOutputs05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthScatterndModelSpecifyInputsAndOutputs06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthScatterndModelSpecifyInputsAndOutputs07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthScatterndModelSpecifyInputsAndOutputs08();
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

// OHOS NNRT OPS SCATTERND Model AddOperation
napi_value ScatterndModelModelAddOperation(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthScatterndModelAddOperation01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthScatterndModelAddOperation02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthScatterndModelAddOperation03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthScatterndModelAddOperation04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthScatterndModelAddOperation05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthScatterndModelAddOperation06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthScatterndModelAddOperation07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthScatterndModelAddOperation08();
                break;
            case CASE_NUM_8:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthScatterndModelAddOperation09();
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

// OHOS NNRT OPS SELECT Build
napi_value SelectBuildTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSelectBuild01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSelectBuild02();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSelectBuild05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSelectBuild06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSelectBuild07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSelectBuild08();
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

// OHOS NNRT OPS SELECT Model Finish
napi_value SelectModelFinish(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSelectModelFinish01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSelectModelFinish02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSelectModelFinish03();
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

// OHOS NNRT OPS SELECT Model SetOperandValue
napi_value SelectModelSetOperandValue(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSelectModelSetOperandValue01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSelectModelSetOperandValue02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSelectModelSetOperandValue03();
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

// OHOS NNRT OPS SELECT Model SpecifyInputsAndOutputs
napi_value SelectModelModelSpecifyInputsAndOutputs(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSelectModelSpecifyInputsAndOutputs01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSelectModelSpecifyInputsAndOutputs02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSelectModelSpecifyInputsAndOutputs03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSelectModelSpecifyInputsAndOutputs04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSelectModelSpecifyInputsAndOutputs05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSelectModelSpecifyInputsAndOutputs06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSelectModelSpecifyInputsAndOutputs07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSelectModelSpecifyInputsAndOutputs08();
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

// OHOS NNRT OPS SELECT Model AddOperation
napi_value SelectModelModelAddOperation(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSelectModelAddOperation01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSelectModelAddOperation02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSelectModelAddOperation03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSelectModelAddOperation04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSelectModelAddOperation05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSelectModelAddOperation06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSelectModelAddOperation07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSelectModelAddOperation08();
                break;
            case CASE_NUM_8:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSelectModelAddOperation09();
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

// OHOS NNRT OPS SIN Build
napi_value SinBuildTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSinBuild01();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSinBuild03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSinBuild04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSinBuild05();
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

// OHOS NNRT OPS SIN Model Finish
napi_value SinModelFinish(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSinModelFinish01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSinModelFinish02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSinModelFinish03();
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

// OHOS NNRT OPS SIN Model SetOperandValue
napi_value SinModelSetOperandValue(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSinModelSetOperandValue01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSinModelSetOperandValue02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSinModelSetOperandValue03();
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

// OHOS NNRT OPS SIN Model SpecifyInputsAndOutputs
napi_value SinModelModelSpecifyInputsAndOutputs(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSinModelSpecifyInputsAndOutputs01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSinModelSpecifyInputsAndOutputs02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSinModelSpecifyInputsAndOutputs03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSinModelSpecifyInputsAndOutputs04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSinModelSpecifyInputsAndOutputs05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSinModelSpecifyInputsAndOutputs06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSinModelSpecifyInputsAndOutputs07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSinModelSpecifyInputsAndOutputs08();
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

// OHOS NNRT OPS SIN Model AddOperation
napi_value SinModelModelAddOperation(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSinModelAddOperation01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSinModelAddOperation02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSinModelAddOperation03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSinModelAddOperation04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSinModelAddOperation05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSinModelAddOperation06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSinModelAddOperation07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSinModelAddOperation08();
                break;
            case CASE_NUM_8:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSinModelAddOperation09();
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

// OHOS NNRT OPS SPACETODEPTH Build
napi_value SpacetodepthBuildTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSpacetodepthBuild05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSpacetodepthBuild06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSpacetodepthBuild07();
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

// OHOS NNRT OPS SPACETODEPTH Model Finish
napi_value SpacetodepthModelFinish(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSpacetodepthModelFinish01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSpacetodepthModelFinish02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSpacetodepthModelFinish03();
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

// OHOS NNRT OPS SPACETODEPTH Model SetOperandValue
napi_value SpacetodepthModelSetOperandValue(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSpacetodepthModelSetOperandValue01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSpacetodepthModelSetOperandValue02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSpacetodepthModelSetOperandValue03();
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

// OHOS NNRT OPS SPACETODEPTH Model SpecifyInputsAndOutputs
napi_value SpacetodepthModelModelSpecifyInputsAndOutputs(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSpacetodepthModelSpecifyInputsAndOutputs01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSpacetodepthModelSpecifyInputsAndOutputs02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSpacetodepthModelSpecifyInputsAndOutputs03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSpacetodepthModelSpecifyInputsAndOutputs04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSpacetodepthModelSpecifyInputsAndOutputs05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSpacetodepthModelSpecifyInputsAndOutputs06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSpacetodepthModelSpecifyInputsAndOutputs07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSpacetodepthModelSpecifyInputsAndOutputs08();
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

// OHOS NNRT OPS SPACETODEPTH Model AddOperation
napi_value SpacetodepthModelModelAddOperation(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSpacetodepthModelAddOperation01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSpacetodepthModelAddOperation02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSpacetodepthModelAddOperation03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSpacetodepthModelAddOperation04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSpacetodepthModelAddOperation05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSpacetodepthModelAddOperation06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSpacetodepthModelAddOperation07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSpacetodepthModelAddOperation08();
                break;
            case CASE_NUM_8:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSpacetodepthModelAddOperation09();
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

// OHOS NNRT OPS SPARSETODENSE Build
napi_value SparsetodenseBuildTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSparsetodenseBuild07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSparsetodenseBuild08();
                break;
            case CASE_NUM_8:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSparsetodenseBuild09();
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

// OHOS NNRT OPS SPARSETODENSE Model Finish
napi_value SparsetodenseModelFinish(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSparsetodenseModelFinish01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSparsetodenseModelFinish02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSparsetodenseModelFinish03();
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

// OHOS NNRT OPS SPARSETODENSE Model SetOperandValue
napi_value SparsetodenseModelSetOperandValue(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSparsetodenseModelSetOperandValue01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSparsetodenseModelSetOperandValue02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSparsetodenseModelSetOperandValue03();
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

// OHOS NNRT OPS SPARSETODENSE Model SpecifyInputsAndOutputs
napi_value SparsetodenseModelModelSpecifyInputsAndOutputs(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSparsetodenseModelSpecifyInputsAndOutputs01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSparsetodenseModelSpecifyInputsAndOutputs02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSparsetodenseModelSpecifyInputsAndOutputs03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSparsetodenseModelSpecifyInputsAndOutputs04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSparsetodenseModelSpecifyInputsAndOutputs05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSparsetodenseModelSpecifyInputsAndOutputs06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSparsetodenseModelSpecifyInputsAndOutputs07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSparsetodenseModelSpecifyInputsAndOutputs08();
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

// OHOS NNRT OPS SPARSETODENSE Model AddOperation
napi_value SparsetodenseModelModelAddOperation(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSparsetodenseModelAddOperation01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSparsetodenseModelAddOperation02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSparsetodenseModelAddOperation03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSparsetodenseModelAddOperation04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSparsetodenseModelAddOperation05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSparsetodenseModelAddOperation06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSparsetodenseModelAddOperation07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSparsetodenseModelAddOperation08();
                break;
            case CASE_NUM_8:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSparsetodenseModelAddOperation09();
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

// OHOS NNRT OPS SQUARE Build
napi_value SquareBuildTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSquareBuild01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSquareBuild02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSquareBuild03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSquareBuild04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSquareBuild05();
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

// OHOS NNRT OPS SQUARE Model Finish
napi_value SquareModelFinish(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSquareModelFinish01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSquareModelFinish02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSquareModelFinish03();
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

// OHOS NNRT OPS SQUARE Model SetOperandValue
napi_value SquareModelSetOperandValue(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSquareModelSetOperandValue01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSquareModelSetOperandValue02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSquareModelSetOperandValue03();
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

// OHOS NNRT OPS SQUARE Model SpecifyInputsAndOutputs
napi_value SquareModelModelSpecifyInputsAndOutputs(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSquareModelSpecifyInputsAndOutputs01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSquareModelSpecifyInputsAndOutputs02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSquareModelSpecifyInputsAndOutputs03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSquareModelSpecifyInputsAndOutputs04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSquareModelSpecifyInputsAndOutputs05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSquareModelSpecifyInputsAndOutputs06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSquareModelSpecifyInputsAndOutputs07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSquareModelSpecifyInputsAndOutputs08();
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

// OHOS NNRT OPS SQUARE Model AddOperation
napi_value SquareModelModelAddOperation(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSquareModelAddOperation01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSquareModelAddOperation02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSquareModelAddOperation03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSquareModelAddOperation04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSquareModelAddOperation05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSquareModelAddOperation06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSquareModelAddOperation07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSquareModelAddOperation08();
                break;
            case CASE_NUM_8:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSquareModelAddOperation09();
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

// OHOS NNRT OPS SWISH Build
napi_value SwishBuildTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSwishBuild01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSwishBuild02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSwishBuild03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSwishBuild04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSwishBuild05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSwishBuild06();
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

// OHOS NNRT OPS SWISH Model Finish
napi_value SwishModelFinish(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSwishModelFinish01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSwishModelFinish02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSwishModelFinish03();
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

// OHOS NNRT OPS SWISH Model SetOperandValue
napi_value SwishModelSetOperandValue(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSwishModelSetOperandValue01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSwishModelSetOperandValue02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSwishModelSetOperandValue03();
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

// OHOS NNRT OPS SWISH Model SpecifyInputsAndOutputs
napi_value SwishModelModelSpecifyInputsAndOutputs(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSwishModelSpecifyInputsAndOutputs01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSwishModelSpecifyInputsAndOutputs02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSwishModelSpecifyInputsAndOutputs03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSwishModelSpecifyInputsAndOutputs04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSwishModelSpecifyInputsAndOutputs05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSwishModelSpecifyInputsAndOutputs06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSwishModelSpecifyInputsAndOutputs07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSwishModelSpecifyInputsAndOutputs08();
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

// OHOS NNRT OPS SWISH Model AddOperation
napi_value SwishModelModelAddOperation(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSwishModelAddOperation01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSwishModelAddOperation02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSwishModelAddOperation03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSwishModelAddOperation04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSwishModelAddOperation05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSwishModelAddOperation06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSwishModelAddOperation07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSwishModelAddOperation08();
                break;
            case CASE_NUM_8:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthSwishModelAddOperation09();
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

// OHOS NNRT OPS UNSTACK Build
napi_value UnstackBuildTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthUnstackBuild01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthUnstackBuild02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthUnstackBuild03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthUnstackBuild04();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthUnstackBuild06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthUnstackBuild07();
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

// OHOS NNRT OPS UNSTACK Model Finish
napi_value UnstackModelFinish(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthUnstackModelFinish01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthUnstackModelFinish02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthUnstackModelFinish03();
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

// OHOS NNRT OPS UNSTACK Model SetOperandValue
napi_value UnstackModelSetOperandValue(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthUnstackModelSetOperandValue01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthUnstackModelSetOperandValue02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthUnstackModelSetOperandValue03();
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

// OHOS NNRT OPS UNSTACK Model SpecifyInputsAndOutputs
napi_value UnstackModelModelSpecifyInputsAndOutputs(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthUnstackModelSpecifyInputsAndOutputs01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthUnstackModelSpecifyInputsAndOutputs02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthUnstackModelSpecifyInputsAndOutputs03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthUnstackModelSpecifyInputsAndOutputs04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthUnstackModelSpecifyInputsAndOutputs05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthUnstackModelSpecifyInputsAndOutputs06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthUnstackModelSpecifyInputsAndOutputs07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthUnstackModelSpecifyInputsAndOutputs08();
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

// OHOS NNRT OPS UNSTACK Model AddOperation
napi_value UnstackModelModelAddOperation(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthUnstackModelAddOperation01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthUnstackModelAddOperation02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthUnstackModelAddOperation03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthUnstackModelAddOperation04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthUnstackModelAddOperation05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthUnstackModelAddOperation06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthUnstackModelAddOperation07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthUnstackModelAddOperation08();
                break;
            case CASE_NUM_8:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthUnstackModelAddOperation09();
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

// OHOS NNRT OPS WHERE Build
napi_value WhereBuildTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthWhereBuild01();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthWhereBuild04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthWhereBuild05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthWhereBuild06();
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

// OHOS NNRT OPS WHERE Model Finish
napi_value WhereModelFinish(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthWhereModelFinish01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthWhereModelFinish02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthWhereModelFinish03();
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

// OHOS NNRT OPS WHERE Model SetOperandValue
napi_value WhereModelSetOperandValue(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthWhereModelSetOperandValue01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthWhereModelSetOperandValue02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthWhereModelSetOperandValue03();
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

// OHOS NNRT OPS WHERE Model SpecifyInputsAndOutputs
napi_value WhereModelModelSpecifyInputsAndOutputs(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthWhereModelSpecifyInputsAndOutputs01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthWhereModelSpecifyInputsAndOutputs02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthWhereModelSpecifyInputsAndOutputs03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthWhereModelSpecifyInputsAndOutputs04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthWhereModelSpecifyInputsAndOutputs05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthWhereModelSpecifyInputsAndOutputs06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthWhereModelSpecifyInputsAndOutputs07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthWhereModelSpecifyInputsAndOutputs08();
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

// OHOS NNRT OPS WHERE Model AddOperation
napi_value WhereModelModelAddOperation(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthWhereModelAddOperation01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthWhereModelAddOperation02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthWhereModelAddOperation03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthWhereModelAddOperation04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthWhereModelAddOperation05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthWhereModelAddOperation06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthWhereModelAddOperation07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthWhereModelAddOperation08();
                break;
            case CASE_NUM_8:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthWhereModelAddOperation09();
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
