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

// OHOS NNRT OPS NOT_EQUAL Build
napi_value NotEqualBuildTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthNotEqualBuild01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthNotEqualBuild02();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthNotEqualBuild04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthNotEqualBuild05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthNotEqualBuild06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthNotEqualBuild07();
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

// OHOS NNRT OPS NOT_EQUAL Model Finish
napi_value NotEqualModelFinish(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthNotEqualModelFinish01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthNotEqualModelFinish02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthNotEqualModelFinish03();
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

// OHOS NNRT OPS NOT_EQUAL Model SetOperandValue
napi_value NotEqualModelSetOperandValue(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthNotEqualModelSetOperandValue01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthNotEqualModelSetOperandValue02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthNotEqualModelSetOperandValue03();
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

// OHOS NNRT OPS NOT_EQUAL Model SpecifyInputsAndOutputs
napi_value NotEqualModelModelSpecifyInputsAndOutputs(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthNotEqualModelSpecifyInputsAndOutputs01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthNotEqualModelSpecifyInputsAndOutputs02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthNotEqualModelSpecifyInputsAndOutputs03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthNotEqualModelSpecifyInputsAndOutputs04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthNotEqualModelSpecifyInputsAndOutputs05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthNotEqualModelSpecifyInputsAndOutputs06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthNotEqualModelSpecifyInputsAndOutputs07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthNotEqualModelSpecifyInputsAndOutputs08();
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

// OHOS NNRT OPS NOT_EQUAL Model AddOperation
napi_value NotEqualModelModelAddOperation(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthNotEqualModelAddOperation01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthNotEqualModelAddOperation02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthNotEqualModelAddOperation03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthNotEqualModelAddOperation04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthNotEqualModelAddOperation05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthNotEqualModelAddOperation06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthNotEqualModelAddOperation07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthNotEqualModelAddOperation08();
                break;
            case CASE_NUM_8:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthNotEqualModelAddOperation09();
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

// OHOS NNRT OPS POW Build
napi_value PowBuildTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthPowBuild04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthPowBuild05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthPowBuild06();
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

// OHOS NNRT OPS POW Model Finish
napi_value PowModelFinish(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthPowModelFinish01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthPowModelFinish02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthPowModelFinish03();
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

// OHOS NNRT OPS POW Model SetOperandValue
napi_value PowModelSetOperandValue(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthPowModelSetOperandValue01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthPowModelSetOperandValue02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthPowModelSetOperandValue03();
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

// OHOS NNRT OPS POW Model SpecifyInputsAndOutputs
napi_value PowModelModelSpecifyInputsAndOutputs(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthPowModelSpecifyInputsAndOutputs01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthPowModelSpecifyInputsAndOutputs02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthPowModelSpecifyInputsAndOutputs03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthPowModelSpecifyInputsAndOutputs04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthPowModelSpecifyInputsAndOutputs05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthPowModelSpecifyInputsAndOutputs06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthPowModelSpecifyInputsAndOutputs07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthPowModelSpecifyInputsAndOutputs08();
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

// OHOS NNRT OPS POW Model AddOperation
napi_value PowModelModelAddOperation(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthPowModelAddOperation01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthPowModelAddOperation02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthPowModelAddOperation03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthPowModelAddOperation04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthPowModelAddOperation05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthPowModelAddOperation06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthPowModelAddOperation07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthPowModelAddOperation08();
                break;
            case CASE_NUM_8:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthPowModelAddOperation09();
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

// OHOS NNRT OPS QUANT_DTYPE_CAST Build
napi_value QuantDtypeCastBuildTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthQuantDtypeCastBuild06();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthQuantDtypeCastBuild07();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthQuantDtypeCastBuild08();
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

// OHOS NNRT OPS QUANT_DTYPE_CAST Model Finish
napi_value QuantDtypeCastModelFinish(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthQuantDtypeCastModelFinish01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthQuantDtypeCastModelFinish02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthQuantDtypeCastModelFinish03();
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

// OHOS NNRT OPS QUANT_DTYPE_CAST Model SetOperandValue
napi_value QuantDtypeCastModelSetOperandValue(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthQuantDtypeCastModelSetOperandValue01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthQuantDtypeCastModelSetOperandValue02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthQuantDtypeCastModelSetOperandValue03();
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

// OHOS NNRT OPS QUANT_DTYPE_CAST Model SpecifyInputsAndOutputs
napi_value QuantDtypeCastModelModelSpecifyInputsAndOutputs(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthQuantDtypeCastModelSpecifyInputsAndOutputs01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthQuantDtypeCastModelSpecifyInputsAndOutputs02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthQuantDtypeCastModelSpecifyInputsAndOutputs03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthQuantDtypeCastModelSpecifyInputsAndOutputs04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthQuantDtypeCastModelSpecifyInputsAndOutputs05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthQuantDtypeCastModelSpecifyInputsAndOutputs06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthQuantDtypeCastModelSpecifyInputsAndOutputs07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthQuantDtypeCastModelSpecifyInputsAndOutputs08();
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

// OHOS NNRT OPS QUANT_DTYPE_CAST Model AddOperation
napi_value QuantDtypeCastModelModelAddOperation(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthQuantDtypeCastModelAddOperation01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthQuantDtypeCastModelAddOperation02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthQuantDtypeCastModelAddOperation03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthQuantDtypeCastModelAddOperation04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthQuantDtypeCastModelAddOperation05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthQuantDtypeCastModelAddOperation06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthQuantDtypeCastModelAddOperation07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthQuantDtypeCastModelAddOperation08();
                break;
            case CASE_NUM_8:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthQuantDtypeCastModelAddOperation09();
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

// OHOS NNRT OPS RANGE Build
napi_value RangeBuildTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRangeBuild06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRangeBuild07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRangeBuild08();
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

// OHOS NNRT OPS RANGE Model Finish
napi_value RangeModelFinish(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRangeModelFinish01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRangeModelFinish02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRangeModelFinish03();
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

// OHOS NNRT OPS RANGE Model SetOperandValue
napi_value RangeModelSetOperandValue(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRangeModelSetOperandValue01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRangeModelSetOperandValue02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRangeModelSetOperandValue03();
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

// OHOS NNRT OPS RANGE Model SpecifyInputsAndOutputs
napi_value RangeModelModelSpecifyInputsAndOutputs(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRangeModelSpecifyInputsAndOutputs01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRangeModelSpecifyInputsAndOutputs02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRangeModelSpecifyInputsAndOutputs03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRangeModelSpecifyInputsAndOutputs04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRangeModelSpecifyInputsAndOutputs05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRangeModelSpecifyInputsAndOutputs06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRangeModelSpecifyInputsAndOutputs07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRangeModelSpecifyInputsAndOutputs08();
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

// OHOS NNRT OPS RANGE Model AddOperation
napi_value RangeModelModelAddOperation(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRangeModelAddOperation01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRangeModelAddOperation02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRangeModelAddOperation03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRangeModelAddOperation04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRangeModelAddOperation05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRangeModelAddOperation06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRangeModelAddOperation07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRangeModelAddOperation08();
                break;
            case CASE_NUM_8:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRangeModelAddOperation09();
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

// OHOS NNRT OPS RANK Build
napi_value RankBuildTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRankBuild03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRankBuild04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRankBuild05();
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

// OHOS NNRT OPS RANK Model Finish
napi_value RankModelFinish(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRankModelFinish01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRankModelFinish02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRankModelFinish03();
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

// OHOS NNRT OPS RANK Model SetOperandValue
napi_value RankModelSetOperandValue(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRankModelSetOperandValue01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRankModelSetOperandValue02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRankModelSetOperandValue03();
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

// OHOS NNRT OPS RANK Model SpecifyInputsAndOutputs
napi_value RankModelModelSpecifyInputsAndOutputs(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRankModelSpecifyInputsAndOutputs01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRankModelSpecifyInputsAndOutputs02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRankModelSpecifyInputsAndOutputs03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRankModelSpecifyInputsAndOutputs04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRankModelSpecifyInputsAndOutputs05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRankModelSpecifyInputsAndOutputs06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRankModelSpecifyInputsAndOutputs07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRankModelSpecifyInputsAndOutputs08();
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

// OHOS NNRT OPS RANK Model AddOperation
napi_value RankModelModelAddOperation(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRankModelAddOperation01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRankModelAddOperation02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRankModelAddOperation03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRankModelAddOperation04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRankModelAddOperation05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRankModelAddOperation06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRankModelAddOperation07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRankModelAddOperation08();
                break;
            case CASE_NUM_8:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRankModelAddOperation09();
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

// OHOS NNRT OPS RECIPROCAL Build
napi_value ReciprocalBuildTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReciprocalBuild01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReciprocalBuild02();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReciprocalBuild04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReciprocalBuild05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReciprocalBuild06();
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

// OHOS NNRT OPS RECIPROCAL Model Finish
napi_value ReciprocalModelFinish(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReciprocalModelFinish01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReciprocalModelFinish02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReciprocalModelFinish03();
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

// OHOS NNRT OPS RECIPROCAL Model SetOperandValue
napi_value ReciprocalModelSetOperandValue(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReciprocalModelSetOperandValue01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReciprocalModelSetOperandValue02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReciprocalModelSetOperandValue03();
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

// OHOS NNRT OPS RECIPROCAL Model SpecifyInputsAndOutputs
napi_value ReciprocalModelModelSpecifyInputsAndOutputs(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReciprocalModelSpecifyInputsAndOutputs01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReciprocalModelSpecifyInputsAndOutputs02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReciprocalModelSpecifyInputsAndOutputs03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReciprocalModelSpecifyInputsAndOutputs04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReciprocalModelSpecifyInputsAndOutputs05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReciprocalModelSpecifyInputsAndOutputs06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReciprocalModelSpecifyInputsAndOutputs07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReciprocalModelSpecifyInputsAndOutputs08();
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

// OHOS NNRT OPS RECIPROCAL Model AddOperation
napi_value ReciprocalModelModelAddOperation(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReciprocalModelAddOperation01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReciprocalModelAddOperation02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReciprocalModelAddOperation03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReciprocalModelAddOperation04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReciprocalModelAddOperation05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReciprocalModelAddOperation06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReciprocalModelAddOperation07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReciprocalModelAddOperation08();
                break;
            case CASE_NUM_8:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReciprocalModelAddOperation09();
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

// OHOS NNRT OPS REDUCEL2 Build
napi_value Reducel2BuildTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducel2Build01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducel2Build02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducel2Build03();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducel2Build06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducel2Build07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducel2Build08();
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

// OHOS NNRT OPS REDUCEL2 Model Finish
napi_value Reducel2ModelFinish(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducel2ModelFinish01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducel2ModelFinish02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducel2ModelFinish03();
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

// OHOS NNRT OPS REDUCEL2 Model SetOperandValue
napi_value Reducel2ModelSetOperandValue(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducel2ModelSetOperandValue01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducel2ModelSetOperandValue02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducel2ModelSetOperandValue03();
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

// OHOS NNRT OPS REDUCEL2 Model SpecifyInputsAndOutputs
napi_value Reducel2ModelModelSpecifyInputsAndOutputs(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducel2ModelSpecifyInputsAndOutputs01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducel2ModelSpecifyInputsAndOutputs02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducel2ModelSpecifyInputsAndOutputs03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducel2ModelSpecifyInputsAndOutputs04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducel2ModelSpecifyInputsAndOutputs05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducel2ModelSpecifyInputsAndOutputs06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducel2ModelSpecifyInputsAndOutputs07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducel2ModelSpecifyInputsAndOutputs08();
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

// OHOS NNRT OPS REDUCEL2 Model AddOperation
napi_value Reducel2ModelModelAddOperation(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducel2ModelAddOperation01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducel2ModelAddOperation02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducel2ModelAddOperation03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducel2ModelAddOperation04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducel2ModelAddOperation05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducel2ModelAddOperation06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducel2ModelAddOperation07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducel2ModelAddOperation08();
                break;
            case CASE_NUM_8:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducel2ModelAddOperation09();
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

// OHOS NNRT OPS REDUCEMAX Build
napi_value ReducemaxBuildTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducemaxBuild06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducemaxBuild07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducemaxBuild08();
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

// OHOS NNRT OPS REDUCEMAX Model Finish
napi_value ReducemaxModelFinish(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducemaxModelFinish01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducemaxModelFinish02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducemaxModelFinish03();
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

// OHOS NNRT OPS REDUCEMAX Model SetOperandValue
napi_value ReducemaxModelSetOperandValue(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducemaxModelSetOperandValue01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducemaxModelSetOperandValue02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducemaxModelSetOperandValue03();
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

// OHOS NNRT OPS REDUCEMAX Model SpecifyInputsAndOutputs
napi_value ReducemaxModelModelSpecifyInputsAndOutputs(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducemaxModelSpecifyInputsAndOutputs01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducemaxModelSpecifyInputsAndOutputs02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducemaxModelSpecifyInputsAndOutputs03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducemaxModelSpecifyInputsAndOutputs04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducemaxModelSpecifyInputsAndOutputs05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducemaxModelSpecifyInputsAndOutputs06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducemaxModelSpecifyInputsAndOutputs07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducemaxModelSpecifyInputsAndOutputs08();
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

// OHOS NNRT OPS REDUCEMAX Model AddOperation
napi_value ReducemaxModelModelAddOperation(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducemaxModelAddOperation01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducemaxModelAddOperation02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducemaxModelAddOperation03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducemaxModelAddOperation04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducemaxModelAddOperation05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducemaxModelAddOperation06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducemaxModelAddOperation07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducemaxModelAddOperation08();
                break;
            case CASE_NUM_8:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducemaxModelAddOperation09();
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

// OHOS NNRT OPS REDUCEMIN Build
napi_value ReduceminBuildTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReduceminBuild06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReduceminBuild07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReduceminBuild08();
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

// OHOS NNRT OPS REDUCEMIN Model Finish
napi_value ReduceminModelFinish(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReduceminModelFinish01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReduceminModelFinish02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReduceminModelFinish03();
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

// OHOS NNRT OPS REDUCEMIN Model SetOperandValue
napi_value ReduceminModelSetOperandValue(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReduceminModelSetOperandValue01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReduceminModelSetOperandValue02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReduceminModelSetOperandValue03();
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

// OHOS NNRT OPS REDUCEMIN Model SpecifyInputsAndOutputs
napi_value ReduceminModelModelSpecifyInputsAndOutputs(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReduceminModelSpecifyInputsAndOutputs01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReduceminModelSpecifyInputsAndOutputs02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReduceminModelSpecifyInputsAndOutputs03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReduceminModelSpecifyInputsAndOutputs04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReduceminModelSpecifyInputsAndOutputs05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReduceminModelSpecifyInputsAndOutputs06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReduceminModelSpecifyInputsAndOutputs07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReduceminModelSpecifyInputsAndOutputs08();
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

// OHOS NNRT OPS REDUCEMIN Model AddOperation
napi_value ReduceminModelModelAddOperation(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReduceminModelAddOperation01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReduceminModelAddOperation02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReduceminModelAddOperation03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReduceminModelAddOperation04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReduceminModelAddOperation05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReduceminModelAddOperation06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReduceminModelAddOperation07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReduceminModelAddOperation08();
                break;
            case CASE_NUM_8:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReduceminModelAddOperation09();
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

// OHOS NNRT OPS REDUCESUM Build
napi_value ReducesumBuildTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducesumBuild06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducesumBuild07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducesumBuild08();
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

// OHOS NNRT OPS REDUCESUM Model Finish
napi_value ReducesumModelFinish(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducesumModelFinish01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducesumModelFinish02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducesumModelFinish03();
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

// OHOS NNRT OPS REDUCESUM Model SetOperandValue
napi_value ReducesumModelSetOperandValue(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducesumModelSetOperandValue01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducesumModelSetOperandValue02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducesumModelSetOperandValue03();
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

// OHOS NNRT OPS REDUCESUM Model SpecifyInputsAndOutputs
napi_value ReducesumModelModelSpecifyInputsAndOutputs(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducesumModelSpecifyInputsAndOutputs01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducesumModelSpecifyInputsAndOutputs02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducesumModelSpecifyInputsAndOutputs03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducesumModelSpecifyInputsAndOutputs04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducesumModelSpecifyInputsAndOutputs05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducesumModelSpecifyInputsAndOutputs06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducesumModelSpecifyInputsAndOutputs07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducesumModelSpecifyInputsAndOutputs08();
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

// OHOS NNRT OPS REDUCESUM Model AddOperation
napi_value ReducesumModelModelAddOperation(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducesumModelAddOperation01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducesumModelAddOperation02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducesumModelAddOperation03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducesumModelAddOperation04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducesumModelAddOperation05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducesumModelAddOperation06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducesumModelAddOperation07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducesumModelAddOperation08();
                break;
            case CASE_NUM_8:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthReducesumModelAddOperation09();
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

// OHOS NNRT OPS ROUND Build
napi_value RoundBuildTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRoundBuild01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRoundBuild02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRoundBuild03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRoundBuild04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRoundBuild05();
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

// OHOS NNRT OPS ROUND Model Finish
napi_value RoundModelFinish(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRoundModelFinish01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRoundModelFinish02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRoundModelFinish03();
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

// OHOS NNRT OPS ROUND Model SetOperandValue
napi_value RoundModelSetOperandValue(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRoundModelSetOperandValue01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRoundModelSetOperandValue02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRoundModelSetOperandValue03();
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

// OHOS NNRT OPS ROUND Model SpecifyInputsAndOutputs
napi_value RoundModelModelSpecifyInputsAndOutputs(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRoundModelSpecifyInputsAndOutputs01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRoundModelSpecifyInputsAndOutputs02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRoundModelSpecifyInputsAndOutputs03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRoundModelSpecifyInputsAndOutputs04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRoundModelSpecifyInputsAndOutputs05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRoundModelSpecifyInputsAndOutputs06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRoundModelSpecifyInputsAndOutputs07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRoundModelSpecifyInputsAndOutputs08();
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

// OHOS NNRT OPS ROUND Model AddOperation
napi_value RoundModelModelAddOperation(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRoundModelAddOperation01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRoundModelAddOperation02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRoundModelAddOperation03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRoundModelAddOperation04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRoundModelAddOperation05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRoundModelAddOperation06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRoundModelAddOperation07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRoundModelAddOperation08();
                break;
            case CASE_NUM_8:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthRoundModelAddOperation09();
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

// OHOS NNRT OPS SCATTERND Build
napi_value ScatterndBuildTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthScatterndBuild05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthScatterndBuild06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthScatterndBuild07();
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

// OHOS NNRT OPS SCATTERND Model Finish
napi_value ScatterndModelFinish(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthScatterndModelFinish01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthScatterndModelFinish02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthScatterndModelFinish03();
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
