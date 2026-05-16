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

// OHOS NNRT OPS LOG_SOFTMAX Model AddOperation
napi_value LogSoftmaxModelModelAddOperation(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogSoftmaxModelAddOperation01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogSoftmaxModelAddOperation02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogSoftmaxModelAddOperation03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogSoftmaxModelAddOperation04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogSoftmaxModelAddOperation05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogSoftmaxModelAddOperation06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogSoftmaxModelAddOperation07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogSoftmaxModelAddOperation08();
                break;
            case CASE_NUM_8:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogSoftmaxModelAddOperation09();
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

// OHOS NNRT OPS LEAKY_RELU Model AddOperation
napi_value LeakyReluModelModelAddOperation(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLeakyReluModelAddOperation01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLeakyReluModelAddOperation02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLeakyReluModelAddOperation03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLeakyReluModelAddOperation04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLeakyReluModelAddOperation05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLeakyReluModelAddOperation06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLeakyReluModelAddOperation07();
                break;
            case CASE_NUM_8:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLeakyReluModelAddOperation09();
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

// OHOS NNRT OPS LOGICAL_OR Build
napi_value LogicalOrBuildTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalOrBuild01();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalOrBuild03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalOrBuild04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalOrBuild05();
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

// OHOS NNRT OPS LOGICAL_OR Model Finish
napi_value LogicalOrModelFinish(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalOrModelFinish01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalOrModelFinish02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalOrModelFinish03();
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

// OHOS NNRT OPS LOGICAL_OR Model SetOperandValue
napi_value LogicalOrModelSetOperandValue(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalOrModelSetOperandValue01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalOrModelSetOperandValue02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalOrModelSetOperandValue03();
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

// OHOS NNRT OPS LOGICAL_OR Model SpecifyInputsAndOutputs
napi_value LogicalOrModelModelSpecifyInputsAndOutputs(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalOrModelSpecifyInputsAndOutputs01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalOrModelSpecifyInputsAndOutputs02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalOrModelSpecifyInputsAndOutputs03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalOrModelSpecifyInputsAndOutputs04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalOrModelSpecifyInputsAndOutputs05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalOrModelSpecifyInputsAndOutputs06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalOrModelSpecifyInputsAndOutputs07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalOrModelSpecifyInputsAndOutputs08();
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

// OHOS NNRT OPS LOGICAL_OR Model AddOperation
napi_value LogicalOrModelModelAddOperation(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalOrModelAddOperation01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalOrModelAddOperation02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalOrModelAddOperation03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalOrModelAddOperation04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalOrModelAddOperation05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalOrModelAddOperation06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalOrModelAddOperation07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalOrModelAddOperation08();
                break;
            case CASE_NUM_8:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLogicalOrModelAddOperation09();
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

// OHOS NNRT OPS LRN Build
napi_value LrnBuildTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLrnBuild01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLrnBuild02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLrnBuild03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLrnBuild04();
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

// OHOS NNRT OPS LRN Model Finish
napi_value LrnModelFinish(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLrnModelFinish01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLrnModelFinish02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLrnModelFinish03();
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

// OHOS NNRT OPS LRN Model SetOperandValue
napi_value LrnModelSetOperandValue(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLrnModelSetOperandValue01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLrnModelSetOperandValue02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLrnModelSetOperandValue03();
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

// OHOS NNRT OPS LRN Model SpecifyInputsAndOutputs
napi_value LrnModelModelSpecifyInputsAndOutputs(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLrnModelSpecifyInputsAndOutputs01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLrnModelSpecifyInputsAndOutputs02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLrnModelSpecifyInputsAndOutputs03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLrnModelSpecifyInputsAndOutputs04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLrnModelSpecifyInputsAndOutputs05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLrnModelSpecifyInputsAndOutputs06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLrnModelSpecifyInputsAndOutputs07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLrnModelSpecifyInputsAndOutputs08();
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

// OHOS NNRT OPS LRN Model AddOperation
napi_value LrnModelModelAddOperation(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLrnModelAddOperation01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLrnModelAddOperation02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLrnModelAddOperation03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLrnModelAddOperation04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLrnModelAddOperation05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLrnModelAddOperation06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLrnModelAddOperation07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLrnModelAddOperation08();
                break;
            case CASE_NUM_8:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLrnModelAddOperation09();
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

// OHOS NNRT OPS LSTM Build
napi_value LstmBuildTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLstmBuild02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLstmBuild03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLstmBuild04();
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

// OHOS NNRT OPS LSTM Model Finish
napi_value LstmModelFinish(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLstmModelFinish01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLstmModelFinish02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLstmModelFinish03();
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

// OHOS NNRT OPS LSTM Model SetOperandValue
napi_value LstmModelSetOperandValue(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLstmModelSetOperandValue01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLstmModelSetOperandValue02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLstmModelSetOperandValue03();
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

// OHOS NNRT OPS LSTM Model SpecifyInputsAndOutputs
napi_value LstmModelModelSpecifyInputsAndOutputs(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLstmModelSpecifyInputsAndOutputs01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLstmModelSpecifyInputsAndOutputs02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLstmModelSpecifyInputsAndOutputs03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLstmModelSpecifyInputsAndOutputs04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLstmModelSpecifyInputsAndOutputs05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLstmModelSpecifyInputsAndOutputs06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLstmModelSpecifyInputsAndOutputs07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLstmModelSpecifyInputsAndOutputs08();
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

// OHOS NNRT OPS LSTM Model AddOperation
napi_value LstmModelModelAddOperation(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLstmModelAddOperation01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLstmModelAddOperation02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLstmModelAddOperation03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLstmModelAddOperation04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLstmModelAddOperation05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLstmModelAddOperation06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLstmModelAddOperation07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLstmModelAddOperation08();
                break;
            case CASE_NUM_8:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthLstmModelAddOperation09();
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

// OHOS NNRT OPS MINIMUM Build
napi_value MinimumBuildTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthMinimumBuild01();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthMinimumBuild04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthMinimumBuild05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthMinimumBuild06();
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

// OHOS NNRT OPS MINIMUM Model Finish
napi_value MinimumModelFinish(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthMinimumModelFinish01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthMinimumModelFinish02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthMinimumModelFinish03();
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

// OHOS NNRT OPS MINIMUM Model SetOperandValue
napi_value MinimumModelSetOperandValue(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthMinimumModelSetOperandValue01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthMinimumModelSetOperandValue02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthMinimumModelSetOperandValue03();
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

// OHOS NNRT OPS MINIMUM Model SpecifyInputsAndOutputs
napi_value MinimumModelModelSpecifyInputsAndOutputs(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthMinimumModelSpecifyInputsAndOutputs01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthMinimumModelSpecifyInputsAndOutputs02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthMinimumModelSpecifyInputsAndOutputs03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthMinimumModelSpecifyInputsAndOutputs04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthMinimumModelSpecifyInputsAndOutputs05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthMinimumModelSpecifyInputsAndOutputs06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthMinimumModelSpecifyInputsAndOutputs07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthMinimumModelSpecifyInputsAndOutputs08();
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

// OHOS NNRT OPS MINIMUM Model AddOperation
napi_value MinimumModelModelAddOperation(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthMinimumModelAddOperation01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthMinimumModelAddOperation02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthMinimumModelAddOperation03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthMinimumModelAddOperation04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthMinimumModelAddOperation05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthMinimumModelAddOperation06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthMinimumModelAddOperation07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthMinimumModelAddOperation08();
                break;
            case CASE_NUM_8:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthMinimumModelAddOperation09();
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

// OHOS NNRT OPS MOD Build
napi_value ModBuildTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthModBuild04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthModBuild05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthModBuild06();
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

// OHOS NNRT OPS MOD Model Finish
napi_value ModModelFinish(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthModModelFinish01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthModModelFinish02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthModModelFinish03();
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

// OHOS NNRT OPS MOD Model SetOperandValue
napi_value ModModelSetOperandValue(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthModModelSetOperandValue01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthModModelSetOperandValue02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthModModelSetOperandValue03();
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

// OHOS NNRT OPS MOD Model SpecifyInputsAndOutputs
napi_value ModModelModelSpecifyInputsAndOutputs(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthModModelSpecifyInputsAndOutputs01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthModModelSpecifyInputsAndOutputs02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthModModelSpecifyInputsAndOutputs03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthModModelSpecifyInputsAndOutputs04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthModModelSpecifyInputsAndOutputs05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthModModelSpecifyInputsAndOutputs06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthModModelSpecifyInputsAndOutputs07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthModModelSpecifyInputsAndOutputs08();
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

// OHOS NNRT OPS MOD Model AddOperation
napi_value ModModelModelAddOperation(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthModModelAddOperation01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthModModelAddOperation02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthModModelAddOperation03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthModModelAddOperation04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthModModelAddOperation05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthModModelAddOperation06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthModModelAddOperation07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthModModelAddOperation08();
                break;
            case CASE_NUM_8:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthModModelAddOperation09();
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

// OHOS NNRT OPS NEG Build
napi_value NegBuildTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthNegBuild03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthNegBuild04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthNegBuild05();
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

// OHOS NNRT OPS NEG Model Finish
napi_value NegModelFinish(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthNegModelFinish01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthNegModelFinish02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthNegModelFinish03();
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

// OHOS NNRT OPS NEG Model SetOperandValue
napi_value NegModelSetOperandValue(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthNegModelSetOperandValue01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthNegModelSetOperandValue02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthNegModelSetOperandValue03();
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

// OHOS NNRT OPS NEG Model SpecifyInputsAndOutputs
napi_value NegModelModelSpecifyInputsAndOutputs(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthNegModelSpecifyInputsAndOutputs01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthNegModelSpecifyInputsAndOutputs02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthNegModelSpecifyInputsAndOutputs03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthNegModelSpecifyInputsAndOutputs04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthNegModelSpecifyInputsAndOutputs05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthNegModelSpecifyInputsAndOutputs06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthNegModelSpecifyInputsAndOutputs07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthNegModelSpecifyInputsAndOutputs08();
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

// OHOS NNRT OPS NEG Model AddOperation
napi_value NegModelModelAddOperation(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthNegModelAddOperation01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthNegModelAddOperation02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthNegModelAddOperation03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthNegModelAddOperation04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthNegModelAddOperation05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthNegModelAddOperation06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthNegModelAddOperation07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthNegModelAddOperation08();
                break;
            case CASE_NUM_8:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthNegModelAddOperation09();
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
