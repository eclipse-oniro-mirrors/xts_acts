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

// OHOS NNRT OPS GATHERND Build
napi_value GatherNDBuildTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGatherNDBuild01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGatherNDBuild02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGatherNDBuild03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGatherNDBuild04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGatherNDBuild05();
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

// OHOS NNRT OPS GATHERND Model Finish
napi_value GatherNDModelFinish(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGatherNDModelFinish01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGatherNDModelFinish02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGatherNDModelFinish03();
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

// OHOS NNRT OPS GATHERND Model SetOperandValue
napi_value GatherNDModelSetOperandValue(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGatherNDModelSetOperandValue01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGatherNDModelSetOperandValue02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGatherNDModelSetOperandValue03();
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

// OHOS NNRT OPS GATHERND Model SpecifyInputsAndOutputs
napi_value GatherNDModelModelSpecifyInputsAndOutputs(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGatherNDModelSpecifyInputsAndOutputs01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGatherNDModelSpecifyInputsAndOutputs02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGatherNDModelSpecifyInputsAndOutputs03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGatherNDModelSpecifyInputsAndOutputs04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGatherNDModelSpecifyInputsAndOutputs05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGatherNDModelSpecifyInputsAndOutputs06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGatherNDModelSpecifyInputsAndOutputs07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGatherNDModelSpecifyInputsAndOutputs08();
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

// OHOS NNRT OPS GATHERND Model AddOperation
napi_value GatherNDModelModelAddOperation(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGatherNDModelAddOperation01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGatherNDModelAddOperation02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGatherNDModelAddOperation03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGatherNDModelAddOperation04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGatherNDModelAddOperation05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGatherNDModelAddOperation06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGatherNDModelAddOperation07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGatherNDModelAddOperation08();
                break;
            case CASE_NUM_8:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGatherNDModelAddOperation09();
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

// OHOS NNRT OPS GREATEREQUAL Build
napi_value GreaterEqualBuildTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGreaterEqualBuild01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGreaterEqualBuild02();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGreaterEqualBuild04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGreaterEqualBuild05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGreaterEqualBuild06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGreaterEqualBuild07();
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

// OHOS NNRT OPS GREATEREQUAL Model Finish
napi_value GreaterEqualModelFinish(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGreaterEqualModelFinish01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGreaterEqualModelFinish02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGreaterEqualModelFinish03();
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

// OHOS NNRT OPS GREATEREQUAL Model SetOperandValue
napi_value GreaterEqualModelSetOperandValue(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGreaterEqualModelSetOperandValue01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGreaterEqualModelSetOperandValue02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGreaterEqualModelSetOperandValue03();
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

// OHOS NNRT OPS GREATEREQUAL Model SpecifyInputsAndOutputs
napi_value GreaterEqualModelModelSpecifyInputsAndOutputs(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGreaterEqualModelSpecifyInputsAndOutputs01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGreaterEqualModelSpecifyInputsAndOutputs02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGreaterEqualModelSpecifyInputsAndOutputs03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGreaterEqualModelSpecifyInputsAndOutputs04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGreaterEqualModelSpecifyInputsAndOutputs05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGreaterEqualModelSpecifyInputsAndOutputs06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGreaterEqualModelSpecifyInputsAndOutputs07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGreaterEqualModelSpecifyInputsAndOutputs08();
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

// OHOS NNRT OPS GREATEREQUAL Model AddOperation
napi_value GreaterEqualModelModelAddOperation(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGreaterEqualModelAddOperation01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGreaterEqualModelAddOperation02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGreaterEqualModelAddOperation03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGreaterEqualModelAddOperation04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGreaterEqualModelAddOperation05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGreaterEqualModelAddOperation06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGreaterEqualModelAddOperation07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGreaterEqualModelAddOperation08();
                break;
            case CASE_NUM_8:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGreaterEqualModelAddOperation09();
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

// OHOS NNRT OPS GREATER Build
napi_value GreaterBuildTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGreaterBuild01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGreaterBuild02();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGreaterBuild04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGreaterBuild05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGreaterBuild06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGreaterBuild07();
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

// OHOS NNRT OPS GREATER Model Finish
napi_value GreaterModelFinish(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGreaterModelFinish01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGreaterModelFinish02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGreaterModelFinish03();
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

// OHOS NNRT OPS GREATER Model SetOperandValue
napi_value GreaterModelSetOperandValue(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGreaterModelSetOperandValue01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGreaterModelSetOperandValue02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGreaterModelSetOperandValue03();
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

// OHOS NNRT OPS GREATER Model SpecifyInputsAndOutputs
napi_value GreaterModelModelSpecifyInputsAndOutputs(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGreaterModelSpecifyInputsAndOutputs01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGreaterModelSpecifyInputsAndOutputs02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGreaterModelSpecifyInputsAndOutputs03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGreaterModelSpecifyInputsAndOutputs04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGreaterModelSpecifyInputsAndOutputs05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGreaterModelSpecifyInputsAndOutputs06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGreaterModelSpecifyInputsAndOutputs07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGreaterModelSpecifyInputsAndOutputs08();
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

// OHOS NNRT OPS GREATER Model AddOperation
napi_value GreaterModelModelAddOperation(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGreaterModelAddOperation01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGreaterModelAddOperation02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGreaterModelAddOperation03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGreaterModelAddOperation04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGreaterModelAddOperation05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGreaterModelAddOperation06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGreaterModelAddOperation07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGreaterModelAddOperation08();
                break;
            case CASE_NUM_8:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthGreaterModelAddOperation09();
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

// OHOS NNRT OPS HARDSIGMOID Build
napi_value HardSigmoidBuildTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthHardSigmoidBuild01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthHardSigmoidBuild02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthHardSigmoidBuild03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthHardSigmoidBuild04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthHardSigmoidBuild05();
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

// OHOS NNRT OPS HARDSIGMOID Model Finish
napi_value HardSigmoidModelFinish(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthHardSigmoidModelFinish01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthHardSigmoidModelFinish02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthHardSigmoidModelFinish03();
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

// OHOS NNRT OPS HARDSIGMOID Model SetOperandValue
napi_value HardSigmoidModelSetOperandValue(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthHardSigmoidModelSetOperandValue01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthHardSigmoidModelSetOperandValue02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthHardSigmoidModelSetOperandValue03();
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

// OHOS NNRT OPS HARDSIGMOID Model SpecifyInputsAndOutputs
napi_value HardSigmoidModelModelSpecifyInputsAndOutputs(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthHardSigmoidModelSpecifyInputsAndOutputs01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthHardSigmoidModelSpecifyInputsAndOutputs02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthHardSigmoidModelSpecifyInputsAndOutputs03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthHardSigmoidModelSpecifyInputsAndOutputs04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthHardSigmoidModelSpecifyInputsAndOutputs05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthHardSigmoidModelSpecifyInputsAndOutputs06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthHardSigmoidModelSpecifyInputsAndOutputs07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthHardSigmoidModelSpecifyInputsAndOutputs08();
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

// OHOS NNRT OPS HARDSIGMOID Model AddOperation
napi_value HardSigmoidModelModelAddOperation(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthHardSigmoidModelAddOperation01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthHardSigmoidModelAddOperation02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthHardSigmoidModelAddOperation03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthHardSigmoidModelAddOperation04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthHardSigmoidModelAddOperation05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthHardSigmoidModelAddOperation06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthHardSigmoidModelAddOperation07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthHardSigmoidModelAddOperation08();
                break;
            case CASE_NUM_8:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthHardSigmoidModelAddOperation09();
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

// OHOS NNRT OPS INSTANCE_NORM Build
napi_value InstanceNormBuildTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthInstanceNormBuild01();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthInstanceNormBuild03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthInstanceNormBuild04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthInstanceNormBuild05();
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

// OHOS NNRT OPS INSTANCE_NORM Model Finish
napi_value InstanceNormModelFinish(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthInstanceNormModelFinish01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthInstanceNormModelFinish02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthInstanceNormModelFinish03();
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

// OHOS NNRT OPS INSTANCE_NORM Model SetOperandValue
napi_value InstanceNormModelSetOperandValue(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthInstanceNormModelSetOperandValue01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthInstanceNormModelSetOperandValue02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthInstanceNormModelSetOperandValue03();
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

// OHOS NNRT OPS INSTANCE_NORM Model SpecifyInputsAndOutputs
napi_value InstanceNormModelModelSpecifyInputsAndOutputs(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthInstanceNormModelSpecifyInputsAndOutputs01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthInstanceNormModelSpecifyInputsAndOutputs02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthInstanceNormModelSpecifyInputsAndOutputs03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthInstanceNormModelSpecifyInputsAndOutputs04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthInstanceNormModelSpecifyInputsAndOutputs05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthInstanceNormModelSpecifyInputsAndOutputs06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthInstanceNormModelSpecifyInputsAndOutputs07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthInstanceNormModelSpecifyInputsAndOutputs08();
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

// OHOS NNRT OPS INSTANCE_NORM Model AddOperation
napi_value InstanceNormModelModelAddOperation(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthInstanceNormModelAddOperation01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthInstanceNormModelAddOperation02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthInstanceNormModelAddOperation03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthInstanceNormModelAddOperation04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthInstanceNormModelAddOperation05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthInstanceNormModelAddOperation06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthInstanceNormModelAddOperation07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthInstanceNormModelAddOperation08();
                break;
            case CASE_NUM_8:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthInstanceNormModelAddOperation09();
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

// OHOS NNRT OPS L2_NORMALIZE Build
napi_value L2NormalizeBuildTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthL2NormalizeBuild01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthL2NormalizeBuild02();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthL2NormalizeBuild04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthL2NormalizeBuild05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthL2NormalizeBuild06();
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

// OHOS NNRT OPS L2_NORMALIZE Model Finish
napi_value L2NormalizeModelFinish(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthL2NormalizeModelFinish01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthL2NormalizeModelFinish02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthL2NormalizeModelFinish03();
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

// OHOS NNRT OPS L2_NORMALIZE Model SetOperandValue
napi_value L2NormalizeModelSetOperandValue(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthL2NormalizeModelSetOperandValue01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthL2NormalizeModelSetOperandValue02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthL2NormalizeModelSetOperandValue03();
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

// OHOS NNRT OPS L2_NORMALIZE Model SpecifyInputsAndOutputs
napi_value L2NormalizeModelModelSpecifyInputsAndOutputs(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthL2NormalizeModelSpecifyInputsAndOutputs01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthL2NormalizeModelSpecifyInputsAndOutputs02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthL2NormalizeModelSpecifyInputsAndOutputs03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthL2NormalizeModelSpecifyInputsAndOutputs04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthL2NormalizeModelSpecifyInputsAndOutputs05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthL2NormalizeModelSpecifyInputsAndOutputs06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthL2NormalizeModelSpecifyInputsAndOutputs07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthL2NormalizeModelSpecifyInputsAndOutputs08();
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

// OHOS NNRT OPS L2_NORMALIZE Model AddOperation
napi_value L2NormalizeModelModelAddOperation(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthL2NormalizeModelAddOperation01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthL2NormalizeModelAddOperation02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthL2NormalizeModelAddOperation03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthL2NormalizeModelAddOperation04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthL2NormalizeModelAddOperation05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthL2NormalizeModelAddOperation06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthL2NormalizeModelAddOperation07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthL2NormalizeModelAddOperation08();
                break;
            case CASE_NUM_8:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthL2NormalizeModelAddOperation09();
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

// OHOS NNRT OPS LEAKY_RELU Build
napi_value LeakyReluBuildTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLeakyReluBuild01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLeakyReluBuild02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLeakyReluBuild03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLeakyReluBuild04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLeakyReluBuild05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLeakyReluBuild06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLeakyReluBuild07();
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

// OHOS NNRT OPS LEAKY_RELU Model Finish
napi_value LeakyReluModelFinish(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLeakyReluModelFinish01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLeakyReluModelFinish02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLeakyReluModelFinish03();
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

// OHOS NNRT OPS LEAKY_RELU Model SetOperandValue
napi_value LeakyReluModelSetOperandValue(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLeakyReluModelSetOperandValue01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLeakyReluModelSetOperandValue02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLeakyReluModelSetOperandValue03();
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

// OHOS NNRT OPS LEAKY_RELU Model SpecifyInputsAndOutputs
napi_value LeakyReluModelModelSpecifyInputsAndOutputs(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLeakyReluModelSpecifyInputsAndOutputs01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLeakyReluModelSpecifyInputsAndOutputs02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLeakyReluModelSpecifyInputsAndOutputs03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLeakyReluModelSpecifyInputsAndOutputs04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLeakyReluModelSpecifyInputsAndOutputs05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLeakyReluModelSpecifyInputsAndOutputs06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLeakyReluModelSpecifyInputsAndOutputs07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLeakyReluModelSpecifyInputsAndOutputs08();
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

// OHOS NNRT OPS LESS Build
napi_value LessBuildTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLessBuild01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLessBuild02();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLessBuild04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLessBuild05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLessBuild06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLessBuild07();
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

// OHOS NNRT OPS LESS Model Finish
napi_value LessModelFinish(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLessModelFinish01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLessModelFinish02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLessModelFinish03();
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

// OHOS NNRT OPS LESS Model SetOperandValue
napi_value LessModelSetOperandValue(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLessModelSetOperandValue01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLessModelSetOperandValue02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLessModelSetOperandValue03();
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

// OHOS NNRT OPS LESS Model SpecifyInputsAndOutputs
napi_value LessModelModelSpecifyInputsAndOutputs(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLessModelSpecifyInputsAndOutputs01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLessModelSpecifyInputsAndOutputs02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLessModelSpecifyInputsAndOutputs03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLessModelSpecifyInputsAndOutputs04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLessModelSpecifyInputsAndOutputs05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLessModelSpecifyInputsAndOutputs06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLessModelSpecifyInputsAndOutputs07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLessModelSpecifyInputsAndOutputs08();
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

// OHOS NNRT OPS LESS Model AddOperation
napi_value LessModelModelAddOperation(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLessModelAddOperation01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLessModelAddOperation02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLessModelAddOperation03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLessModelAddOperation04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLessModelAddOperation05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLessModelAddOperation06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLessModelAddOperation07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLessModelAddOperation08();
                break;
            case CASE_NUM_8:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLessModelAddOperation09();
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

// OHOS NNRT OPS LOGICAL_AND Build
napi_value LogicalAndBuildTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalAndBuild03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalAndBuild04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalAndBuild05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalAndBuild06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalAndBuild07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalAndBuild08();
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

// OHOS NNRT OPS LOGICAL_AND Model Finish
napi_value LogicalAndModelFinish(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalAndModelFinish01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalAndModelFinish02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalAndModelFinish03();
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

// OHOS NNRT OPS LOGICAL_AND Model SetOperandValue
napi_value LogicalAndModelSetOperandValue(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalAndModelSetOperandValue01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalAndModelSetOperandValue02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalAndModelSetOperandValue03();
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

// OHOS NNRT OPS LOGICAL_AND Model SpecifyInputsAndOutputs
napi_value LogicalAndModelModelSpecifyInputsAndOutputs(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalAndModelSpecifyInputsAndOutputs01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalAndModelSpecifyInputsAndOutputs02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalAndModelSpecifyInputsAndOutputs03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalAndModelSpecifyInputsAndOutputs04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalAndModelSpecifyInputsAndOutputs05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalAndModelSpecifyInputsAndOutputs06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalAndModelSpecifyInputsAndOutputs07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalAndModelSpecifyInputsAndOutputs08();
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

// OHOS NNRT OPS LOGICAL_AND Model AddOperation
napi_value LogicalAndModelModelAddOperation(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalAndModelAddOperation01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalAndModelAddOperation02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalAndModelAddOperation03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalAndModelAddOperation04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalAndModelAddOperation05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalAndModelAddOperation06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalAndModelAddOperation07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalAndModelAddOperation08();
                break;
            case CASE_NUM_8:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalAndModelAddOperation09();
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

// OHOS NNRT OPS LOGICAL_NOT Build
napi_value LogicalNotBuildTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalNotBuild02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalNotBuild03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalNotBuild04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalNotBuild05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalNotBuild06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalNotBuild07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalNotBuild08();
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

// OHOS NNRT OPS LOGICAL_NOT Model Finish
napi_value LogicalNotModelFinish(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalNotModelFinish01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalNotModelFinish02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalNotModelFinish03();
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

// OHOS NNRT OPS LOGICAL_NOT Model SetOperandValue
napi_value LogicalNotModelSetOperandValue(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalNotModelSetOperandValue01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalNotModelSetOperandValue02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalNotModelSetOperandValue03();
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

// OHOS NNRT OPS LOGICAL_NOT Model SpecifyInputsAndOutputs
napi_value LogicalNotModelModelSpecifyInputsAndOutputs(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalNotModelSpecifyInputsAndOutputs01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalNotModelSpecifyInputsAndOutputs02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalNotModelSpecifyInputsAndOutputs03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalNotModelSpecifyInputsAndOutputs04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalNotModelSpecifyInputsAndOutputs05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalNotModelSpecifyInputsAndOutputs06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalNotModelSpecifyInputsAndOutputs07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalNotModelSpecifyInputsAndOutputs08();
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

// OHOS NNRT OPS LOGICAL_NOT Model AddOperation
napi_value LogicalNotModelModelAddOperation(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalNotModelAddOperation01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalNotModelAddOperation02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalNotModelAddOperation03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalNotModelAddOperation04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalNotModelAddOperation05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalNotModelAddOperation06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalNotModelAddOperation07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalNotModelAddOperation08();
                break;
            case CASE_NUM_8:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalNotModelAddOperation09();
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

// OHOS NNRT OPS LOG_SOFTMAX Build
napi_value LogSoftmaxBuildTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogSoftmaxBuild01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogSoftmaxBuild02();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogSoftmaxBuild04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogSoftmaxBuild05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogSoftmaxBuild06();
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

// OHOS NNRT OPS LOG_SOFTMAX Model Finish
napi_value LogSoftmaxModelFinish(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogSoftmaxModelFinish01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogSoftmaxModelFinish02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogSoftmaxModelFinish03();
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

// OHOS NNRT OPS LOG_SOFTMAX Model SetOperandValue
napi_value LogSoftmaxModelSetOperandValue(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogSoftmaxModelSetOperandValue01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogSoftmaxModelSetOperandValue02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogSoftmaxModelSetOperandValue03();
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

// OHOS NNRT OPS LOG_SOFTMAX Model SpecifyInputsAndOutputs
napi_value LogSoftmaxModelModelSpecifyInputsAndOutputs(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogSoftmaxModelSpecifyInputsAndOutputs01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogSoftmaxModelSpecifyInputsAndOutputs02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogSoftmaxModelSpecifyInputsAndOutputs03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogSoftmaxModelSpecifyInputsAndOutputs04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogSoftmaxModelSpecifyInputsAndOutputs05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogSoftmaxModelSpecifyInputsAndOutputs06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogSoftmaxModelSpecifyInputsAndOutputs07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogSoftmaxModelSpecifyInputsAndOutputs08();
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

// OHOS NNRT OPS LOG Build
napi_value LogBuildTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogBuild01();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogBuild03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogBuild04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogBuild05();
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

// OHOS NNRT OPS LOG Model Finish
napi_value LogModelFinish(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogModelFinish01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogModelFinish02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogModelFinish03();
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

// OHOS NNRT OPS LOG Model SetOperandValue
napi_value LogModelSetOperandValue(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogModelSetOperandValue01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogModelSetOperandValue02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogModelSetOperandValue03();
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

// OHOS NNRT OPS LOG Model SpecifyInputsAndOutputs
napi_value LogModelModelSpecifyInputsAndOutputs(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogModelSpecifyInputsAndOutputs01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogModelSpecifyInputsAndOutputs02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogModelSpecifyInputsAndOutputs03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogModelSpecifyInputsAndOutputs04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogModelSpecifyInputsAndOutputs05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogModelSpecifyInputsAndOutputs06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogModelSpecifyInputsAndOutputs07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogModelSpecifyInputsAndOutputs08();
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

// OHOS NNRT OPS LOG Model AddOperation
napi_value LogModelModelAddOperation(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogModelAddOperation01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogModelAddOperation02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogModelAddOperation03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogModelAddOperation04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogModelAddOperation05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogModelAddOperation06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogModelAddOperation07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogModelAddOperation08();
                break;
            case CASE_NUM_8:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogModelAddOperation09();
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
