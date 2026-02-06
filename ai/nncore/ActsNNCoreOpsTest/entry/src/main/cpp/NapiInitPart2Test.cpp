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

// OHOS NNRT OPS DEPTH_TO_SPACE Build
napi_value DepthToSpaceBuildTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthDepthToSpaceBuild03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthDepthToSpaceBuild04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthDepthToSpaceBuild05();
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

// OHOS NNRT OPS DEPTH_TO_SPACE Model Finish
napi_value DepthToSpaceModelFinish(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthDepthToSpaceModelFinish01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthDepthToSpaceModelFinish02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthDepthToSpaceModelFinish03();
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

// OHOS NNRT OPS DEPTH_TO_SPACE Model SetOperandValue
napi_value DepthToSpaceModelSetOperandValue(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthDepthToSpaceModelSetOperandValue01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthDepthToSpaceModelSetOperandValue02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthDepthToSpaceModelSetOperandValue03();
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

// OHOS NNRT OPS DEPTH_TO_SPACE Model SpecifyInputsAndOutputs
napi_value DepthToSpaceModelModelSpecifyInputsAndOutputs(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthDepthToSpaceModelSpecifyInputsAndOutputs01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthDepthToSpaceModelSpecifyInputsAndOutputs02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthDepthToSpaceModelSpecifyInputsAndOutputs03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthDepthToSpaceModelSpecifyInputsAndOutputs04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthDepthToSpaceModelSpecifyInputsAndOutputs05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthDepthToSpaceModelSpecifyInputsAndOutputs06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthDepthToSpaceModelSpecifyInputsAndOutputs07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthDepthToSpaceModelSpecifyInputsAndOutputs08();
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

// OHOS NNRT OPS DEPTH_TO_SPACE Model AddOperation
napi_value DepthToSpaceModelModelAddOperation(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthDepthToSpaceModelAddOperation01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthDepthToSpaceModelAddOperation02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthDepthToSpaceModelAddOperation03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthDepthToSpaceModelAddOperation04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthDepthToSpaceModelAddOperation05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthDepthToSpaceModelAddOperation06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthDepthToSpaceModelAddOperation07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthDepthToSpaceModelAddOperation08();
                break;
            case CASE_NUM_8:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthDepthToSpaceModelAddOperation09();
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

// OHOS NNRT OPS DETECTION_POST_PROCESS Build
napi_value DetectionPostProcessBuildTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthDetectionPostProcessBuild02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthDetectionPostProcessBuild03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthDetectionPostProcessBuild04();
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

// OHOS NNRT OPS DETECTION_POST_PROCESS Model Finish
napi_value DetectionPostProcessModelFinish(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthDetectionPostProcessModelFinish01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthDetectionPostProcessModelFinish02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthDetectionPostProcessModelFinish03();
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

// OHOS NNRT OPS DETECTION_POST_PROCESS Model SetOperandValue
napi_value DetectionPostProcessModelSetOperandValue(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthDetectionPostProcessModelSetOperandValue01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthDetectionPostProcessModelSetOperandValue02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthDetectionPostProcessModelSetOperandValue03();
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

// OHOS NNRT OPS DETECTION_POST_PROCESS Model SpecifyInputsAndOutputs
napi_value DetectionPostProcessModelModelSpecifyInputsAndOutputs(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthDetectionPostProcessModelSpecifyInputsAndOutputs01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthDetectionPostProcessModelSpecifyInputsAndOutputs02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthDetectionPostProcessModelSpecifyInputsAndOutputs03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthDetectionPostProcessModelSpecifyInputsAndOutputs04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthDetectionPostProcessModelSpecifyInputsAndOutputs05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthDetectionPostProcessModelSpecifyInputsAndOutputs06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthDetectionPostProcessModelSpecifyInputsAndOutputs07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthDetectionPostProcessModelSpecifyInputsAndOutputs08();
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

// OHOS NNRT OPS DETECTION_POST_PROCESS Model AddOperation
napi_value DetectionPostProcessModelModelAddOperation(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthDetectionPostProcessModelAddOperation01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthDetectionPostProcessModelAddOperation02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthDetectionPostProcessModelAddOperation03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthDetectionPostProcessModelAddOperation04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthDetectionPostProcessModelAddOperation05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthDetectionPostProcessModelAddOperation06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthDetectionPostProcessModelAddOperation07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthDetectionPostProcessModelAddOperation08();
                break;
            case CASE_NUM_8:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthDetectionPostProcessModelAddOperation09();
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

// OHOS NNRT OPS EQUAL Build
napi_value EqualBuildTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthEqualBuild01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthEqualBuild02();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthEqualBuild04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthEqualBuild05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthEqualBuild06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthEqualBuild07();
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

// OHOS NNRT OPS EQUAL Model Finish
napi_value EqualModelFinish(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthEqualModelFinish01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthEqualModelFinish02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthEqualModelFinish03();
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

// OHOS NNRT OPS EQUAL Model SetOperandValue
napi_value EqualModelSetOperandValue(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthEqualModelSetOperandValue01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthEqualModelSetOperandValue02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthEqualModelSetOperandValue03();
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

// OHOS NNRT OPS EQUAL Model SpecifyInputsAndOutputs
napi_value EqualModelModelSpecifyInputsAndOutputs(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthEqualModelSpecifyInputsAndOutputs01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthEqualModelSpecifyInputsAndOutputs02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthEqualModelSpecifyInputsAndOutputs03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthEqualModelSpecifyInputsAndOutputs04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthEqualModelSpecifyInputsAndOutputs05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthEqualModelSpecifyInputsAndOutputs06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthEqualModelSpecifyInputsAndOutputs07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthEqualModelSpecifyInputsAndOutputs08();
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

// OHOS NNRT OPS EQUAL Model AddOperation
napi_value EqualModelModelAddOperation(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthEqualModelAddOperation01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthEqualModelAddOperation02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthEqualModelAddOperation03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthEqualModelAddOperation04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthEqualModelAddOperation05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthEqualModelAddOperation06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthEqualModelAddOperation07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthEqualModelAddOperation08();
                break;
            case CASE_NUM_8:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthEqualModelAddOperation09();
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

// OHOS NNRT OPS ERF Build
napi_value ErfBuildTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthErfBuild01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthErfBuild02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthErfBuild03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthErfBuild04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthErfBuild05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthErfBuild06();
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

// OHOS NNRT OPS ERF Model Finish
napi_value ErfModelFinish(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthErfModelFinish01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthErfModelFinish02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthErfModelFinish03();
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

// OHOS NNRT OPS ERF Model SetOperandValue
napi_value ErfModelSetOperandValue(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthErfModelSetOperandValue01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthErfModelSetOperandValue02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthErfModelSetOperandValue03();
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

// OHOS NNRT OPS ERF Model SpecifyInputsAndOutputs
napi_value ErfModelModelSpecifyInputsAndOutputs(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthErfModelSpecifyInputsAndOutputs01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthErfModelSpecifyInputsAndOutputs02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthErfModelSpecifyInputsAndOutputs03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthErfModelSpecifyInputsAndOutputs04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthErfModelSpecifyInputsAndOutputs05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthErfModelSpecifyInputsAndOutputs06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthErfModelSpecifyInputsAndOutputs07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthErfModelSpecifyInputsAndOutputs08();
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

// OHOS NNRT OPS ERF Model AddOperation
napi_value ErfModelModelAddOperation(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthErfModelAddOperation01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthErfModelAddOperation02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthErfModelAddOperation03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthErfModelAddOperation04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthErfModelAddOperation05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthErfModelAddOperation06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthErfModelAddOperation07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthErfModelAddOperation08();
                break;
            case CASE_NUM_8:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthErfModelAddOperation09();
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

// OHOS NNRT OPS EXP Build
napi_value ExpBuildTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthExpBuild01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthExpBuild02();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthExpBuild04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthExpBuild05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthExpBuild06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthExpBuild07();
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

// OHOS NNRT OPS EXP Model Finish
napi_value ExpModelFinish(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthExpModelFinish01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthExpModelFinish02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthExpModelFinish03();
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

// OHOS NNRT OPS EXP Model SetOperandValue
napi_value ExpModelSetOperandValue(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthExpModelSetOperandValue01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthExpModelSetOperandValue02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthExpModelSetOperandValue03();
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

// OHOS NNRT OPS EXP Model SpecifyInputsAndOutputs
napi_value ExpModelModelSpecifyInputsAndOutputs(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthExpModelSpecifyInputsAndOutputs01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthExpModelSpecifyInputsAndOutputs02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthExpModelSpecifyInputsAndOutputs03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthExpModelSpecifyInputsAndOutputs04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthExpModelSpecifyInputsAndOutputs05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthExpModelSpecifyInputsAndOutputs06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthExpModelSpecifyInputsAndOutputs07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthExpModelSpecifyInputsAndOutputs08();
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

// OHOS NNRT OPS EXP Model AddOperation
napi_value ExpModelModelAddOperation(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthExpModelAddOperation01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthExpModelAddOperation02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthExpModelAddOperation03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthExpModelAddOperation04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthExpModelAddOperation05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthExpModelAddOperation06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthExpModelAddOperation07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthExpModelAddOperation08();
                break;
            case CASE_NUM_8:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthExpModelAddOperation09();
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

// OHOS NNRT OPS FLATTEN Build
napi_value FlattenBuildTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthFlattenBuild01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthFlattenBuild02();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthFlattenBuild05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthFlattenBuild06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthFlattenBuild07();
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

// OHOS NNRT OPS FLATTEN Model Finish
napi_value FlattenModelFinish(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthFlattenModelFinish01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthFlattenModelFinish02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthFlattenModelFinish03();
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

// OHOS NNRT OPS FLATTEN Model SetOperandValue
napi_value FlattenModelSetOperandValue(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthFlattenModelSetOperandValue01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthFlattenModelSetOperandValue02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthFlattenModelSetOperandValue03();
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

// OHOS NNRT OPS FLATTEN Model SpecifyInputsAndOutputs
napi_value FlattenModelModelSpecifyInputsAndOutputs(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthFlattenModelSpecifyInputsAndOutputs01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthFlattenModelSpecifyInputsAndOutputs02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthFlattenModelSpecifyInputsAndOutputs03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthFlattenModelSpecifyInputsAndOutputs04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthFlattenModelSpecifyInputsAndOutputs05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthFlattenModelSpecifyInputsAndOutputs06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthFlattenModelSpecifyInputsAndOutputs07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthFlattenModelSpecifyInputsAndOutputs08();
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

// OHOS NNRT OPS FLATTEN Model AddOperation
napi_value FlattenModelModelAddOperation(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthFlattenModelAddOperation01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthFlattenModelAddOperation02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthFlattenModelAddOperation03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthFlattenModelAddOperation04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthFlattenModelAddOperation05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthFlattenModelAddOperation06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthFlattenModelAddOperation07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthFlattenModelAddOperation08();
                break;
            case CASE_NUM_8:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthFlattenModelAddOperation09();
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

// OHOS NNRT OPS FLOOR Build
napi_value FloorBuildTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthFloorBuild01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthFloorBuild02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthFloorBuild03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthFloorBuild04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthFloorBuild05();
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

// OHOS NNRT OPS FLOOR Model Finish
napi_value FloorModelFinish(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthFloorModelFinish01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthFloorModelFinish02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthFloorModelFinish03();
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

// OHOS NNRT OPS FLOOR Model SetOperandValue
napi_value FloorModelSetOperandValue(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthFloorModelSetOperandValue01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthFloorModelSetOperandValue02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthFloorModelSetOperandValue03();
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

// OHOS NNRT OPS FLOOR Model SpecifyInputsAndOutputs
napi_value FloorModelModelSpecifyInputsAndOutputs(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthFloorModelSpecifyInputsAndOutputs01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthFloorModelSpecifyInputsAndOutputs02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthFloorModelSpecifyInputsAndOutputs03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthFloorModelSpecifyInputsAndOutputs04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthFloorModelSpecifyInputsAndOutputs05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthFloorModelSpecifyInputsAndOutputs06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthFloorModelSpecifyInputsAndOutputs07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthFloorModelSpecifyInputsAndOutputs08();
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

// OHOS NNRT OPS FLOOR Model AddOperation
napi_value FloorModelModelAddOperation(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthFloorModelAddOperation01();
                break;
            case CASE_NUM_1:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthFloorModelAddOperation02();
                break;
            case CASE_NUM_2:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthFloorModelAddOperation03();
                break;
            case CASE_NUM_3:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthFloorModelAddOperation04();
                break;
            case CASE_NUM_4:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthFloorModelAddOperation05();
                break;
            case CASE_NUM_5:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthFloorModelAddOperation06();
                break;
            case CASE_NUM_6:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthFloorModelAddOperation07();
                break;
            case CASE_NUM_7:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthFloorModelAddOperation08();
                break;
            case CASE_NUM_8:
                result = Acts::NnCoreOps::SUBAINNRtFuncNorthFloorModelAddOperation09();
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
