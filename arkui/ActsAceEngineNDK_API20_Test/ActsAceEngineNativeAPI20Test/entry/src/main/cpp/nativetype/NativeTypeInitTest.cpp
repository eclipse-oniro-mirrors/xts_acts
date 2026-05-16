/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

#include "BasicServicesKit/os_account.h"
#include "common/Common.h"
#include "hilog/log.h"
#include "napi/native_api.h"
#include "nativetype/native_type.h"
#include <js_native_api_types.h>
#include <multimodalinput/oh_input_manager.h>
#include <napi/native_api.h>
namespace {
static const uint32_t MAX_NAME_LENGTH = 1024;
}

EXTERN_C_START
static void InitPush1(std::vector<napi_property_descriptor>& desc)
{
    desc.push_back(XL("CheckRotationOptionX", CheckRotationOptionX));
    desc.push_back(XL("CheckRotationOptionY", CheckRotationOptionY));
    desc.push_back(XL("CheckRotationOptionZ", CheckRotationOptionZ));
    desc.push_back(XL("CheckRotationOptionAngle", CheckRotationOptionAngle));
    desc.push_back(XL("CheckRotationOptionCenterX", CheckRotationOptionCenterX));
    desc.push_back(XL("CheckRotationOptionCenterY", CheckRotationOptionCenterY));
    desc.push_back(XL("CheckRotationOptionCenterZ", CheckRotationOptionCenterZ));
    desc.push_back(XL("CheckRotationOptionPerspective", CheckRotationOptionPerspective));
    desc.push_back(XL("CheckScaleOptionsX", CheckScaleOptionsX));
    desc.push_back(XL("CheckScaleOptionsY", CheckScaleOptionsY));
    desc.push_back(XL("CheckScaleOptionsZ", CheckScaleOptionsZ));
    desc.push_back(XL("CheckScaleOptionsCenterX", CheckScaleOptionsCenterX));
    desc.push_back(XL("CheckScaleOptionsCenterY", CheckScaleOptionsCenterY));
    desc.push_back(XL("CheckTranslationOptionsX", CheckTranslationOptionsX));
    desc.push_back(XL("CheckTranslationOptionsY", CheckTranslationOptionsY));
    desc.push_back(XL("CheckTranslationOptionsZ", CheckTranslationOptionsZ));
    desc.push_back(XL("CreateNavDestinationNode", CreateNavDestinationNode));
    desc.push_back(XL("GetNavDestinationState", GetNavDestinationState));
    desc.push_back(XL("GetNavDestinationStateResult", GetNavDestinationStateResult));
    desc.push_back(XL("GetRouterPageNodeStateResult", GetRouterPageNodeStateResult));
    desc.push_back(XL("SetSwiperIndicatorMaxDisplayCount", SetSwiperIndicatorMaxDisplayCount));
    desc.push_back(XL("SetCustomSpanMetricsWidthSuccess", SetCustomSpanMetricsWidthSuccess));
    desc.push_back(XL("SetCustomSpanMetricsHeightSuccess", SetCustomSpanMetricsHeightSuccess));
    desc.push_back(XL("SetCustomSpanMetricsHeightError", SetCustomSpanMetricsHeightError));
    desc.push_back(XL("ArkUISnapshotOptionsSetScaleSuccess", ArkUISnapshotOptionsSetScaleSuccess));
    desc.push_back(XL("ArkUISnapshotOptionsSetScaleError", ArkUISnapshotOptionsSetScaleError));
    desc.push_back(XL("UnmarshallStyledStringDescriptor", UnmarshallStyledStringDescriptor));
    desc.push_back(XL("MarshallStyledStringDescriptorError", MarshallStyledStringDescriptorError));
    desc.push_back(XL("GetCheckedState", GetCheckedState));
    desc.push_back(XL("GetUnCheckedState", GetUnCheckedState));
    desc.push_back(XL("ErrorCodeEventNotSupported", ErrorCodeEventNotSupported));
    desc.push_back(XL("ErrorCodeNodeNotSupported", ErrorCodeNodeNotSupported));
    desc.push_back(XL("ErrorCodeNodeOutOfRange", ErrorCodeNodeOutOfRange));
    desc.push_back(XL("ErrorCodeNodeIndexInvalid", ErrorCodeNodeIndexInvalid));
    desc.push_back(XL("ErrorCodeFocusNonExistent", ErrorCodeFocusNonExistent));
    desc.push_back(XL("ErrorCodeFocusNonFocusable", ErrorCodeFocusNonFocusable));
    desc.push_back(XL("ErrorCodeFocusNonAncestor", ErrorCodeFocusNonAncestor));
    desc.push_back(XL("ErrorCodeNonScrollableContainer", ErrorCodeNonScrollableContainer));
    desc.push_back(XL("CreateGestureNode1", CreateGestureNode1));
    desc.push_back(XL("ErrorCodePostClonedComponentStatusAbnormal",ErrorCodePostClonedComponentStatusAbnormal));
    desc.push_back(XL("CreateNavigation", CreateNavigation));
    desc.push_back(XL("CreateRouterPageNode", CreateRouterPageNode));
    desc.push_back(XL("GetRouterPageNodeState", GetRouterPageNodeState));
    desc.push_back(XL("SetCustomSpanMetricsWidthError", SetCustomSpanMetricsWidthError));
    desc.push_back(XL("GetRouterStateOnShow", GetRouterStateOnShow));
    desc.push_back(XL("GetRouterStateOnHide", GetRouterStateOnHide));
    desc.push_back(XL("GetRouterStateOnBackPressed", GetRouterStateOnBackPressed));
    desc.push_back(XL("GetRouterStatAboutToAppear", GetRouterStatAboutToAppear));
    desc.push_back(XL("GetRouterStateAboutToDisApper", GetRouterStateAboutToDisApper));
    desc.push_back(XL("GetNavDestinationStateOnShow", GetNavDestinationStateOnShow));
    desc.push_back(XL("GetNavDestinationStateOnHidden", GetNavDestinationStateOnHidden));
    desc.push_back(XL("GetNavDestinationStateOnAppear", GetNavDestinationStateOnAppear));
    desc.push_back(XL("GetNavDestinationStateOnDisAppear", GetNavDestinationStateOnDisAppear));
    desc.push_back(XL("GetNavDestinationStateOnWillShow", GetNavDestinationStateOnWillShow));
    desc.push_back(XL("GetNavDestinationStateOnWillHide", GetNavDestinationStateOnWillHide));
    desc.push_back(XL("GetNavDestinationStateOnWillAppear", GetNavDestinationStateOnWillAppear));
    desc.push_back(XL("GetNavDestinationStateOnWillDisappear", GetNavDestinationStateOnWillDisappear));
    desc.push_back(XL("GetNavDestinationStateOnBackPressed", GetNavDestinationStateOnBackPressed));
}
static void InitPush2(std::vector<napi_property_descriptor>& desc)
{
    desc.push_back(XL("ErrorCodeInternalError", ErrorCodeInternalError));
    desc.push_back(XL("ErrorCodeNodeEventParamInvalid", ErrorCodeNodeEventParamInvalid));
    desc.push_back(XL("ErrorCodeGetInfoFailed", ErrorCodeGetInfoFailed));
    desc.push_back(XL("CreateGestureNode2", CreateGestureNode2));
    desc.push_back(XL("CreateNode", CreateNode));
    desc.push_back(XL("ErrorCodeRecognizerTypeNotSupported", ErrorCodeRecognizerTypeNotSupported));
    desc.push_back(XL("ErrorCodeParamInvalid",ErrorCodeParamInvalid));
    desc.push_back(XL("ErrorCodeInvalidStyledString",ErrorCodeInvalidStyledString));
    desc.push_back(XL("ErrorCodeNotClonedPointerEvent", ErrorCodeNotClonedPointerEvent));
    desc.push_back(XL("ErrorCodeBufferSizeNotEnough", ErrorCodeBufferSizeNotEnough));
    desc.push_back(XL("CreateUIInputEventNode", CreateUIInputEventNode));
    desc.push_back(XL("ErrorCodePostCloned",ErrorCodePostCloned));
}
static napi_value Init(napi_env env, napi_value exports)
{
    std::vector<napi_property_descriptor> desc;
    InitPush1(desc);
    InitPush2(desc);
    napi_define_properties(env, exports, desc.size(), desc.data());
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "nativetype",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
