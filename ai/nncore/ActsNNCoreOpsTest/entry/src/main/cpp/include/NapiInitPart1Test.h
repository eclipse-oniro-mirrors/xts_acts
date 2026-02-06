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


#ifndef NAPIINITPART1TEST_H
#define NAPIINITPART1TEST_H

#include "napi/native_api.h"

// OHOS NNRT OPS ABS Build
napi_value AbsBuildTest(napi_env env, napi_callback_info info);

// OHOS NNRT OPS ABS Model Finish
napi_value AbsModelFinish(napi_env env, napi_callback_info info);

// OHOS NNRT OPS ABS Model SetOperandValue
napi_value AbsModelSetOperandValue(napi_env env, napi_callback_info info);

// OHOS NNRT OPS ABS Model SpecifyInputsAndOutputs
napi_value AbsModelModelSpecifyInputsAndOutputs(napi_env env, napi_callback_info info);

// OHOS NNRT OPS ABS Model AddOperation
napi_value AbsModelModelAddOperation(napi_env env, napi_callback_info info);

// OHOS NNRT OPS ALL Build
napi_value AllBuildTest(napi_env env, napi_callback_info info);

// OHOS NNRT OPS ALL Model Finish
napi_value AllModelFinish(napi_env env, napi_callback_info info);

// OHOS NNRT OPS ALL Model SetOperandValue
napi_value AllModelSetOperandValue(napi_env env, napi_callback_info info);

// OHOS NNRT OPS ALL Model SpecifyInputsAndOutputs
napi_value AllModelModelSpecifyInputsAndOutputs(napi_env env, napi_callback_info info);

// OHOS NNRT OPS ALL Model AddOperation
napi_value AllModelModelAddOperation(napi_env env, napi_callback_info info);

// OHOS NNRT OPS ASSERT Build
napi_value AssertBuildTest(napi_env env, napi_callback_info info);

// OHOS NNRT OPS ASSERT Model Finish
napi_value AssertModelFinish(napi_env env, napi_callback_info info);

// OHOS NNRT OPS ASSERT Model SetOperandValue
napi_value AssertModelSetOperandValue(napi_env env, napi_callback_info info);

// OHOS NNRT OPS ASSERT Model SpecifyInputsAndOutputs
napi_value AssertModelModelSpecifyInputsAndOutputs(napi_env env, napi_callback_info info);

// OHOS NNRT OPS ASSERT Model AddOperation
napi_value AssertModelModelAddOperation(napi_env env, napi_callback_info info);

// OHOS NNRT OPS BROADCAST_TO Build
napi_value BroadcastToBuildTest(napi_env env, napi_callback_info info);

// OHOS NNRT OPS BROADCAST_TO Model Finish
napi_value BroadcastToModelFinish(napi_env env, napi_callback_info info);

// OHOS NNRT OPS BROADCAST_TO Model SetOperandValue
napi_value BroadcastToModelSetOperandValue(napi_env env, napi_callback_info info);

// OHOS NNRT OPS BROADCAST_TO Model SpecifyInputsAndOutputs
napi_value BroadcastToModelModelSpecifyInputsAndOutputs(napi_env env, napi_callback_info info);

// OHOS NNRT OPS BROADCAST_TO Model AddOperation
napi_value BroadcastToModelModelAddOperation(napi_env env, napi_callback_info info);

// OHOS NNRT OPS CEIL Build
napi_value CeilBuildTest(napi_env env, napi_callback_info info);

// OHOS NNRT OPS CROP Build
napi_value CropBuildTest(napi_env env, napi_callback_info info);

// OHOS NNRT OPS CEIL Model Finish
napi_value CeilModelFinish(napi_env env, napi_callback_info info);

// OHOS NNRT OPS CROP Model Finish
napi_value CropModelFinish(napi_env env, napi_callback_info info);

// OHOS NNRT OPS CEIL Model SetOperandValue
napi_value CeilModelSetOperandValue(napi_env env, napi_callback_info info);

// OHOS NNRT OPS CROP Model SetOperandValue
napi_value CropModelSetOperandValue(napi_env env, napi_callback_info info);

// OHOS NNRT OPS CEIL Model SpecifyInputsAndOutputs
napi_value CeilModelModelSpecifyInputsAndOutputs(napi_env env, napi_callback_info info);

// OHOS NNRT OPS CROP Model SpecifyInputsAndOutputs
napi_value CropModelModelSpecifyInputsAndOutputs(napi_env env, napi_callback_info info);

// OHOS NNRT OPS CEIL Model AddOperation
napi_value CeilModelModelAddOperation(napi_env env, napi_callback_info info);

// OHOS NNRT OPS CROP Model AddOperation
napi_value CropModelModelAddOperation(napi_env env, napi_callback_info info);

// OHOS NNRT OPS CLIP Build
napi_value ClipBuildTest(napi_env env, napi_callback_info info);

// OHOS NNRT OPS CLIP Model Finish
napi_value ClipModelFinish(napi_env env, napi_callback_info info);

// OHOS NNRT OPS CLIP Model SetOperandValue
napi_value ClipModelSetOperandValue(napi_env env, napi_callback_info info);

// OHOS NNRT OPS CLIP Model SpecifyInputsAndOutputs
napi_value ClipModelModelSpecifyInputsAndOutputs(napi_env env, napi_callback_info info);

// OHOS NNRT OPS CLIP Model AddOperation
napi_value ClipModelModelAddOperation(napi_env env, napi_callback_info info);

// OHOS NNRT OPS CONSTANT_OF_SHAPE Build
napi_value ConstantOfShapeBuildTest(napi_env env, napi_callback_info info);

// OHOS NNRT OPS CONSTANT_OF_SHAPE Model Finish
napi_value ConstantOfShapeModelFinish(napi_env env, napi_callback_info info);

// OHOS NNRT OPS CONSTANT_OF_SHAPE Model SetOperandValue
napi_value ConstantOfShapeModelSetOperandValue(napi_env env, napi_callback_info info);

// OHOS NNRT OPS CONSTANT_OF_SHAPE Model SpecifyInputsAndOutputs
napi_value ConstantOfShapeModelModelSpecifyInputsAndOutputs(napi_env env, napi_callback_info info);

// OHOS NNRT OPS CONSTANT_OF_SHAPE Model AddOperation
napi_value ConstantOfShapeModelModelAddOperation(napi_env env, napi_callback_info info);

// OHOS NNRT OPS COS Build
napi_value CosBuildTest(napi_env env, napi_callback_info info);

// OHOS NNRT OPS COS Model Finish
napi_value CosModelFinish(napi_env env, napi_callback_info info);

// OHOS NNRT OPS COS Model SetOperandValue
napi_value CosModelSetOperandValue(napi_env env, napi_callback_info info);

// OHOS NNRT OPS COS Model SpecifyInputsAndOutputs
napi_value CosModelModelSpecifyInputsAndOutputs(napi_env env, napi_callback_info info);

// OHOS NNRT OPS COS Model AddOperation
napi_value CosModelModelAddOperation(napi_env env, napi_callback_info info);

#endif // NAPIINITPART1TEST_H